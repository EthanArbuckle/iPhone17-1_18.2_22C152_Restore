@interface SUScriptMusicPlayerNativeObject
- (void)_nowPlayingChangeNotification:(id)a3;
- (void)_playbackStateChangeNotification:(id)a3;
- (void)_volumeChangeNotification:(id)a3;
- (void)destroyNativeObject;
- (void)setupNativeObject;
@end

@implementation SUScriptMusicPlayerNativeObject

- (void)destroyNativeObject
{
  id v3 = [(SUScriptNativeObject *)self object];
  [v3 endGeneratingPlaybackNotifications];
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F11B40] object:v3];
  [v4 removeObserver:self name:*MEMORY[0x263F11B48] object:v3];
  [v4 removeObserver:self name:*MEMORY[0x263F11B58] object:v3];
  v5.receiver = self;
  v5.super_class = (Class)SUScriptMusicPlayerNativeObject;
  [(SUScriptNativeObject *)&v5 destroyNativeObject];
}

- (void)setupNativeObject
{
  id v3 = [(SUScriptNativeObject *)self object];
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F11B40];
  [v4 addObserver:self selector:sel__nowPlayingChangeNotification_ name:*MEMORY[0x263F11B40] object:v3];
  [v4 addObserver:self selector:sel__playbackStateChangeNotification_ name:*MEMORY[0x263F11B48] object:v3];
  [v4 addObserver:self selector:sel__volumeChangeNotification_ name:v5 object:v3];
  [v3 beginGeneratingPlaybackNotifications];
  v6.receiver = self;
  v6.super_class = (Class)SUScriptMusicPlayerNativeObject;
  [(SUScriptNativeObject *)&v6 setupNativeObject];
}

- (void)_nowPlayingChangeNotification:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"nowplayingitemchange"];
}

- (void)_playbackStateChangeNotification:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"playbackstatechange"];
}

- (void)_volumeChangeNotification:(id)a3
{
  id v3 = [(SUScriptNativeObject *)self scriptObject];

  [(SUScriptObject *)v3 dispatchEvent:0 forName:@"volumechange"];
}

@end