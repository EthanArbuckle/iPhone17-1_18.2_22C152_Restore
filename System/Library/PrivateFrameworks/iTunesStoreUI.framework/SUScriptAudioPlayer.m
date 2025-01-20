@interface SUScriptAudioPlayer
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)URL;
- (NSString)certificateURL;
- (NSString)keyURL;
- (NSString)nowPlayingKeyAlbumTitle;
- (NSString)nowPlayingKeyAlbumTrackCount;
- (NSString)nowPlayingKeyAlbumTrackNumber;
- (NSString)nowPlayingKeyArtist;
- (NSString)nowPlayingKeyArtwork;
- (NSString)nowPlayingKeyComposer;
- (NSString)nowPlayingKeyDiscCount;
- (NSString)nowPlayingKeyDiscNumber;
- (NSString)nowPlayingKeyGenre;
- (NSString)nowPlayingKeyPersistentID;
- (NSString)nowPlayingKeyPlaybackDuration;
- (NSString)nowPlayingKeyTitle;
- (SUScriptAudioPlayer)initWithURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5;
- (double)currentTime;
- (double)duration;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)playerStateActive;
- (int64_t)playerStateBuffering;
- (int64_t)playerStateFailed;
- (int64_t)playerStateFinished;
- (int64_t)playerStatePaused;
- (int64_t)playerStateUnplayed;
- (int64_t)state;
- (void)_audioPlayerStateChangeNotification:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)play;
- (void)setValue:(id)a3 forNowPlayingKey:(id)a4;
- (void)stop;
@end

@implementation SUScriptAudioPlayer

- (SUScriptAudioPlayer)initWithURL:(id)a3 keyURL:(id)a4 certificateURL:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SUScriptAudioPlayer;
  v8 = [(SUScriptObject *)&v10 init];
  if (v8)
  {
    v8->_url = (NSURL *)a3;
    v8->_keyUrl = (NSURL *)a4;
    v8->_certificateUrl = (NSURL *)a5;
    WebThreadRunOnMainThread();
  }
  return v8;
}

uint64_t __57__SUScriptAudioPlayer_initWithURL_keyURL_certificateURL___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *(void *)(*(void *)(a1 + 32) + 80));
  [v2 setKeyURL:*(void *)(*(void *)(a1 + 32) + 88)];
  [v2 setCertificateURL:*(void *)(*(void *)(a1 + 32) + 96)];
  *(void *)(*(void *)(a1 + 32) + 72) = (id)[v2 playerStatus];
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 addObserver:v4 selector:sel__audioPlayerStateChangeNotification_ name:@"SUAudioPlayerStatusChangeNotification" object:v2];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUAudioPlayerStatusChangeNotification", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAudioPlayer;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)play
{
}

uint64_t __27__SUScriptAudioPlayer_play__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *(void *)(*(void *)(a1 + 32) + 80));
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:*(void *)(a1 + 32) name:@"SUAudioPlayerStatusChangeNotification" object:0];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__audioPlayerStateChangeNotification_ name:@"SUAudioPlayerStatusChangeNotification" object:v2];

  return [v2 play];
}

- (void)pause
{
}

uint64_t __28__SUScriptAudioPlayer_pause__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "audioPlayerForURL:", *(void *)(*(void *)(a1 + 32) + 80));

  return [v1 pause];
}

- (void)setValue:(id)a3 forNowPlayingKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

void __49__SUScriptAudioPlayer_setValue_forNowPlayingKey___block_invoke(id *a1)
{
  id v4 = a1[4];
  if ([a1[5] isEqualToString:*MEMORY[0x263F11248]])
  {
    v2 = (void *)[objc_alloc(NSURL) initWithString:a1[4]];
    objc_super v3 = (void *)[a1[6] newImageWithURL:v2];

    if (v3) {
      id v4 = (id)[objc_alloc(MEMORY[0x263F11E10]) initWithImage:v3];
    }
    else {
      id v4 = 0;
    }
  }
  objc_msgSend((id)objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "startSessionWithURL:", *((void *)a1[6] + 10)), "setValue:forNowPlayingKey:", v4, a1[5]);
}

- (void)stop
{
}

uint64_t __27__SUScriptAudioPlayer_stop__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(+[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager"), "endSessionForURL:", *(void *)(*(void *)(a1 + 32) + 80));

  return [v1 stop];
}

- (id)_className
{
  return @"iTunesAudioPlayer";
}

- (NSString)certificateURL
{
  return [(NSURL *)self->_certificateUrl absoluteString];
}

- (double)currentTime
{
  [(SUScriptObject *)self lock];
  playerStatus = self->_playerStatus;
  if (playerStatus)
  {
    [(SUPlayerStatus *)playerStatus currentTime];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }
  [(SUScriptObject *)self unlock];
  return v5;
}

- (double)duration
{
  [(SUScriptObject *)self lock];
  playerStatus = self->_playerStatus;
  if (playerStatus)
  {
    [(SUPlayerStatus *)playerStatus duration];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }
  [(SUScriptObject *)self unlock];
  return v5;
}

- (NSString)keyURL
{
  return [(NSURL *)self->_keyUrl absoluteString];
}

- (int64_t)state
{
  [(SUScriptObject *)self lock];
  int64_t v3 = [(SUPlayerStatus *)self->_playerStatus playerState];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)URL
{
  return [(NSURL *)self->_url absoluteString];
}

- (NSString)nowPlayingKeyAlbumTitle
{
  return (NSString *)*MEMORY[0x263F11220];
}

- (NSString)nowPlayingKeyAlbumTrackCount
{
  return (NSString *)*MEMORY[0x263F11228];
}

- (NSString)nowPlayingKeyAlbumTrackNumber
{
  return (NSString *)*MEMORY[0x263F11230];
}

- (NSString)nowPlayingKeyArtist
{
  return (NSString *)*MEMORY[0x263F11238];
}

- (NSString)nowPlayingKeyArtwork
{
  return (NSString *)*MEMORY[0x263F11248];
}

- (NSString)nowPlayingKeyComposer
{
  return (NSString *)*MEMORY[0x263F11260];
}

- (NSString)nowPlayingKeyDiscCount
{
  return (NSString *)*MEMORY[0x263F11270];
}

- (NSString)nowPlayingKeyDiscNumber
{
  return (NSString *)*MEMORY[0x263F11278];
}

- (NSString)nowPlayingKeyGenre
{
  return (NSString *)*MEMORY[0x263F112A0];
}

- (NSString)nowPlayingKeyPersistentID
{
  return (NSString *)*MEMORY[0x263F11368];
}

- (NSString)nowPlayingKeyPlaybackDuration
{
  return (NSString *)*MEMORY[0x263F11380];
}

- (NSString)nowPlayingKeyTitle
{
  return (NSString *)*MEMORY[0x263F11400];
}

- (int64_t)playerStateActive
{
  return 2;
}

- (int64_t)playerStateBuffering
{
  return 1;
}

- (int64_t)playerStateFailed
{
  return 4;
}

- (int64_t)playerStateFinished
{
  return 5;
}

- (int64_t)playerStatePaused
{
  return 3;
}

- (int64_t)playerStateUnplayed
{
  return 0;
}

- (void)_audioPlayerStateChangeNotification:(id)a3
{
  double v4 = (void *)[a3 object];
  [(SUScriptObject *)self lock];

  self->_playerStatus = (SUPlayerStatus *)(id)[v4 playerStatus];
  [(SUScriptObject *)self unlock];

  [(SUScriptObject *)self dispatchEvent:0 forName:@"statechange"];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_60, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAudioPlayer;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_46, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAudioPlayer;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptAudioPlayer;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_60 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_46 = (uint64_t)sel_play;
    *(void *)algn_2681B55A8 = @"play";
    qword_2681B55B0 = (uint64_t)sel_pause;
    unk_2681B55B8 = @"pause";
    qword_2681B55C0 = (uint64_t)sel_setValue_forNowPlayingKey_;
    unk_2681B55C8 = @"setNowPlayingValue";
    qword_2681B55D0 = (uint64_t)sel_stop;
    unk_2681B55D8 = @"stop";
    __KeyMapping_60 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"certificateURL", @"currentTime", @"currentTime", @"duration", @"duration", @"keyURL", @"keyURL", @"state", @"state", @"URL", @"URL", @"NOW_PLAYING_KEY_ALBUM_TITLE", @"nowPlayingKeyAlbumTitle", @"NOW_PLAYING_KEY_ALBUM_TRACK_COUNT", @"nowPlayingKeyAlbumTrackCount", @"NOW_PLAYING_KEY_ALBUM_TRACK_NUMBER", @"nowPlayingKeyAlbumTrackNumber",
                        @"NOW_PLAYING_KEY_ARTIST",
                        @"nowPlayingKeyArtist",
                        @"NOW_PLAYING_KEY_ARTWORK",
                        @"nowPlayingKeyArtwork",
                        @"NOW_PLAYING_KEY_COMPOSER",
                        @"nowPlayingKeyComposer",
                        @"NOW_PLAYING_KEY_DISC_COUNT",
                        @"nowPlayingKeyDiscCount",
                        @"NOW_PLAYING_KEY_DISC_NUMBER",
                        @"nowPlayingKeyDiscNumber",
                        @"NOW_PLAYING_KEY_GENRE",
                        @"nowPlayingKeyGenre",
                        @"NOW_PLAYING_KEY_PERSISTENT_ID",
                        @"nowPlayingKeyPersistentID",
                        @"NOW_PLAYING_KEY_PLAYBACK_DURATION",
                        @"nowPlayingKeyPlaybackDuration",
                        @"NOW_PLAYING_KEY_TITLE",
                        @"nowPlayingKeyTitle",
                        @"PLAYER_STATE_ACTIVE",
                        @"playerStateActive",
                        @"PLAYER_STATE_BUFFERING",
                        @"playerStateBuffering",
                        @"PLAYER_STATE_FAILED",
                        @"playerStateFailed",
                        @"PLAYER_STATE_FINISHED",
                        @"playerStateFinished",
                        @"PLAYER_STATE_PAUSED",
                        @"playerStatePaused",
                        @"PLAYER_STATE_UNPLAYED",
                        @"playerStateUnplayed",
                        0);
  }
}

@end