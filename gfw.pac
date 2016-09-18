function regExpMatch(url, pattern) {    try { return new RegExp(pattern).test(url); } catch(ex) { return false; }    }
    function FindProxyForURL(url, host) {
	if (shExpMatch(url, "*://*.google.com.*/*") || shExpMatch(url, "*://google.com.*/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.google.com/*") || shExpMatch(url, "*://google.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.google-analytics.com/*") || shExpMatch(url, "*://google-analytics.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.googleapis.com/*") || shExpMatch(url, "*://googleapis.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.googlecode.com/*") || shExpMatch(url, "*://googlecode.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.googleusercontent.com/*") || shExpMatch(url, "*://googleusercontent.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.gstatic.com/*") || shExpMatch(url, "*://gstatic.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://goo.gl/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.sourceforge.net/*") || shExpMatch(url, "*://sourceforge.net/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.sf.net/*") || shExpMatch(url, "*://sf.net/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://t.co/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.tweetdeck.com/*") || shExpMatch(url, "*://tweetdeck.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.twimg.com/*") || shExpMatch(url, "*://twimg.com/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.wikipedia.org/*") || shExpMatch(url, "*://wikipedia.org/*")) return 'PROXY 127.0.0.1:8087';
	if (shExpMatch(url, "*://*.ytimg.com/*") || shExpMatch(url, "*://ytimg.com/*")) return 'PROXY 127.0.0.1:8087';
	return 'DIRECT';
}
