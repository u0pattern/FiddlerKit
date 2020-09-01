// Note: Use this code only while you are hunting

static function OnBeforeRequest(oSession: Session) {
  // Change the Origin HTTP Header before sending the request
  oSession.oRequest["Origin"] = "https://s5yw45gwe45gtw54.com" // you can change the website (+ `null`)
}

static function OnBeforeResponse(oSession: Session) {
  if (oSession.oResponse.headers.ExistsAndContains("Access-Control-Allow-Origin", "https://s5yw45gwe45gtw54.com") && oSession.oResponse.headers.ExistsAndContains("Access-Control-Allow-Credentials", "true")) {
    oSession.utilDecodeResponse(); // Remove any compression or chunking
    oSession.utilSetResponseBody("CORS Misconfiguration Detected"); // What will be printed in the response body (you can change it)
  }
}
