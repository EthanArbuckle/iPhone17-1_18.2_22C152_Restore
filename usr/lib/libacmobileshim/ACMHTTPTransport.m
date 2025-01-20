@interface ACMHTTPTransport
- (unint64_t)identifier;
- (void)didEnd;
- (void)didStart;
- (void)setIdentifier:(unint64_t)a3;
- (void)updateBackgroundTask;
@end

@implementation ACMHTTPTransport

- (void)updateBackgroundTask
{
  v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  BOOL v4 = [(ACFHTTPTransport *)self hasFinishedServerInvocations];
  unint64_t v5 = [(ACMHTTPTransport *)self identifier];
  unint64_t v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 43, 0, "Finishing background task");
      }
      [v3 endBackgroundTask:-[ACMHTTPTransport identifier](self, "identifier")];
      [(ACMHTTPTransport *)self setIdentifier:0];
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__ACMHTTPTransport_updateBackgroundTask__block_invoke;
    v7[3] = &unk_265043B90;
    v7[4] = self;
    -[ACMHTTPTransport setIdentifier:](self, "setIdentifier:", [v3 beginBackgroundTaskWithExpirationHandler:v7]);
    if (v6)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 33, 0, "Relaunched background task");
      }
      [v3 endBackgroundTask:v6];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    {
      ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 38, 0, "Launched background task");
    }
  }
}

uint64_t __40__ACMHTTPTransport_updateBackgroundTask__block_invoke(uint64_t a1)
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACMHTTPTransport updateBackgroundTask]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMHTTPTransport.m", 27, 0, "Handling background task expiration");
  }
  v2 = *(void **)(a1 + 32);

  return [v2 updateBackgroundTask];
}

- (void)didStart
{
  v3.receiver = self;
  v3.super_class = (Class)ACMHTTPTransport;
  [(ACFHTTPTransport *)&v3 didStart];
  [(ACMHTTPTransport *)self updateBackgroundTask];
}

- (void)didEnd
{
  [(ACMHTTPTransport *)self updateBackgroundTask];
  v3.receiver = self;
  v3.super_class = (Class)ACMHTTPTransport;
  [(ACFHTTPTransport *)&v3 didEnd];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

@end