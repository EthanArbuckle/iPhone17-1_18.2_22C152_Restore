@interface CACVoiceControlServer
+ (id)_serviceName;
+ (id)server;
+ (int)_currentDisplayedCorrectionsCommand;
+ (int)_currentlyDisplayedOverlayLabelsCommand;
- (BOOL)_connectIfNecessary;
- (id)_serviceName;
- (id)currentlyDisplayedCorrections;
- (id)currentlyDisplayedOverlayLabels;
@end

@implementation CACVoiceControlServer

+ (id)server
{
  if (server_onceToken != -1) {
    dispatch_once(&server_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)server___sharedInstance;
  return v2;
}

uint64_t __31__CACVoiceControlServer_server__block_invoke()
{
  server___sharedInstance = objc_alloc_init(CACVoiceControlServer);
  return MEMORY[0x270F9A758]();
}

- (BOOL)_connectIfNecessary
{
  if (_AXSCommandAndControlEnabled() || (int v3 = _AXSCommandAndControlCarPlayEnabled()) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)CACVoiceControlServer;
    LOBYTE(v3) = [(AXServer *)&v5 _connectIfNecessary];
  }
  return v3;
}

- (id)currentlyDisplayedCorrections
{
  if ([(CACVoiceControlServer *)self _connectIfNecessary])
  {
    int v3 = objc_msgSend(objc_alloc(MEMORY[0x263F228C0]), "initWithKey:payload:", +[CACVoiceControlServer _currentDisplayedCorrectionsCommand](CACVoiceControlServer, "_currentDisplayedCorrectionsCommand"), 0);
    v4 = [(AXServer *)self client];
    objc_super v5 = [v4 sendMessage:v3 withError:0];
    v6 = [v5 payload];
    v7 = [v6 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (id)currentlyDisplayedOverlayLabels
{
  if ([(CACVoiceControlServer *)self _connectIfNecessary])
  {
    int v3 = objc_msgSend(objc_alloc(MEMORY[0x263F228C0]), "initWithKey:payload:", +[CACVoiceControlServer _currentlyDisplayedOverlayLabelsCommand](CACVoiceControlServer, "_currentlyDisplayedOverlayLabelsCommand"), 0);
    v4 = [(AXServer *)self client];
    objc_super v5 = [v4 sendMessage:v3 withError:0];
    v6 = [v5 payload];
    v7 = [v6 objectForKeyedSubscript:@"result"];
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

+ (id)_serviceName
{
  return @"com.apple.accessibility.CACVoiceControlServer";
}

- (id)_serviceName
{
  return +[CACVoiceControlServer _serviceName];
}

+ (int)_currentDisplayedCorrectionsCommand
{
  return 1;
}

+ (int)_currentlyDisplayedOverlayLabelsCommand
{
  return 2;
}

@end