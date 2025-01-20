@interface SUScriptMusicPlayerController
+ (id)scriptPlaybackStateForNativePlaybackState:(int64_t)a3;
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSNumber)volume;
- (NSString)playbackState;
- (NSString)playbackStateInterrupted;
- (NSString)playbackStatePaused;
- (NSString)playbackStatePlaying;
- (NSString)playbackStateSeekingBackward;
- (NSString)playbackStateSeekingForward;
- (NSString)playbackStateStopped;
- (NSString)playerType;
- (NSString)repeatMode;
- (NSString)repeatModeAll;
- (NSString)repeatModeDefault;
- (NSString)repeatModeNone;
- (NSString)repeatModeOne;
- (NSString)shuffleMode;
- (NSString)shuffleModeAlbums;
- (NSString)shuffleModeDefault;
- (NSString)shuffleModeOff;
- (NSString)shuffleModeSongs;
- (SUScriptMediaItem)nowPlayingItem;
- (SUScriptMusicPlayerController)initWithPlayerType:(id)a3;
- (double)currentPlaybackTime;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)beginSeekingBackward;
- (void)beginSeekingForward;
- (void)dealloc;
- (void)endSeeking;
- (void)pause;
- (void)play;
- (void)setQueueWithItemCollection:(id)a3;
- (void)setQueueWithQuery:(id)a3;
- (void)setRepeatMode:(id)a3;
- (void)setShuffleMode:(id)a3;
- (void)setVolume:(id)a3;
- (void)skipToBeginning;
- (void)skipToNextItem;
- (void)skipToPreviousItem;
- (void)stop;
@end

@implementation SUScriptMusicPlayerController

- (SUScriptMusicPlayerController)initWithPlayerType:(id)a3
{
  v4 = [(SUScriptObject *)self init];
  if (v4)
  {
    if (([a3 isEqualToString:@"app"] & 1) != 0
      || [a3 isEqualToString:@"iPod"])
    {
      v4->_playerType = (NSString *)a3;
      WebThreadRunOnMainThread();
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Unknown player type"];

      return 0;
    }
  }
  return v4;
}

uint64_t __52__SUScriptMusicPlayerController_initWithPlayerType___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"app"])
  {
    uint64_t result = [MEMORY[0x263F120B0] applicationMusicPlayer];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isEqualToString:@"iPod"];
    if (!result) {
      return result;
    }
    uint64_t result = [MEMORY[0x263F120B0] systemMusicPlayer];
  }
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    v4 = +[SUScriptNativeObject objectWithNativeObject:result];
    return [v3 setNativeObject:v4];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMusicPlayerController;
  [(SUScriptObject *)&v3 dealloc];
}

+ (id)scriptPlaybackStateForNativePlaybackState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  else {
    return off_264813C88[a3];
  }
}

- (void)beginSeekingBackward
{
}

uint64_t __53__SUScriptMusicPlayerController_beginSeekingBackward__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 beginSeekingBackward];
}

- (void)beginSeekingForward
{
}

uint64_t __52__SUScriptMusicPlayerController_beginSeekingForward__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 beginSeekingForward];
}

- (void)endSeeking
{
}

uint64_t __43__SUScriptMusicPlayerController_endSeeking__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 endSeeking];
}

- (void)pause
{
}

uint64_t __38__SUScriptMusicPlayerController_pause__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 pause];
}

- (void)play
{
}

uint64_t __37__SUScriptMusicPlayerController_play__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 play];
}

- (void)setQueueWithItemCollection:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __60__SUScriptMusicPlayerController_setQueueWithItemCollection___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  uint64_t v3 = [*(id *)(a1 + 40) nativeCollection];

  return [v2 setQueueWithItemCollection:v3];
}

- (void)setQueueWithQuery:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __51__SUScriptMusicPlayerController_setQueueWithQuery___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  uint64_t v3 = [*(id *)(a1 + 40) nativeQuery];

  return [v2 setQueueWithQuery:v3];
}

- (void)skipToBeginning
{
}

uint64_t __48__SUScriptMusicPlayerController_skipToBeginning__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 skipToBeginning];
}

- (void)skipToNextItem
{
}

uint64_t __47__SUScriptMusicPlayerController_skipToNextItem__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 skipToNextItem];
}

- (void)skipToPreviousItem
{
}

uint64_t __51__SUScriptMusicPlayerController_skipToPreviousItem__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 skipToPreviousItem];
}

- (void)stop
{
}

uint64_t __37__SUScriptMusicPlayerController_stop__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");

  return [v1 stop];
}

- (id)_className
{
  return @"iTunesMusicPlayerController";
}

- (double)currentPlaybackTime
{
  uint64_t v4 = 0;
  v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptMusicPlayerController_currentPlaybackTime__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "currentPlaybackTime");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (SUScriptMediaItem)nowPlayingItem
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (SUScriptMediaItem *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __47__SUScriptMusicPlayerController_nowPlayingItem__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __47__SUScriptMusicPlayerController_nowPlayingItem__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "nowPlayingItem");
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(SUScriptMediaItem);
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v3));
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v4 checkInScriptObject:v5];
  }
  return result;
}

- (NSString)playbackState
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __46__SUScriptMusicPlayerController_playbackState__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __46__SUScriptMusicPlayerController_playbackState__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    id result = (id)objc_msgSend((id)objc_opt_class(), "scriptPlaybackStateForNativePlaybackState:", objc_msgSend(result, "playbackState"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)playerType
{
  playerType = self->_playerType;
  if (playerType)
  {
    uint64_t v3 = playerType;
    return v3;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF9D0];
    return (NSString *)[v5 null];
  }
}

- (NSString)repeatMode
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __43__SUScriptMusicPlayerController_repeatMode__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__43__SUScriptMusicPlayerController_repeatMode__block_invoke(uint64_t a1)
{
  id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    id result = (void *)[result repeatMode];
    switch((unint64_t)result)
    {
      case 0uLL:
        id result = (void *)[*(id *)(a1 + 32) repeatModeDefault];
        goto LABEL_7;
      case 1uLL:
        id result = (void *)[*(id *)(a1 + 32) repeatModeNone];
        goto LABEL_7;
      case 2uLL:
        id result = (void *)[*(id *)(a1 + 32) repeatModeOne];
        goto LABEL_7;
      case 3uLL:
        id result = (void *)[*(id *)(a1 + 32) repeatModeAll];
LABEL_7:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (NSString)shuffleMode
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__27;
  v12 = __Block_byref_object_dispose__27;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __44__SUScriptMusicPlayerController_shuffleMode__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__44__SUScriptMusicPlayerController_shuffleMode__block_invoke(uint64_t a1)
{
  id result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if (result)
  {
    id result = (void *)[result shuffleMode];
    switch((unint64_t)result)
    {
      case 0uLL:
        id result = (void *)[*(id *)(a1 + 32) shuffleModeDefault];
        goto LABEL_7;
      case 1uLL:
        id result = (void *)[*(id *)(a1 + 32) shuffleModeOff];
        goto LABEL_7;
      case 2uLL:
        id result = (void *)[*(id *)(a1 + 32) shuffleModeSongs];
        goto LABEL_7;
      case 3uLL:
        id result = (void *)[*(id *)(a1 + 32) shuffleModeAlbums];
LABEL_7:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (void)setRepeatMode:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeDefault](self, "repeatModeDefault")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeNone](self, "repeatModeNone")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeOne](self, "repeatModeOne")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController repeatModeAll](self, "repeatModeAll")) & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __47__SUScriptMusicPlayerController_setRepeatMode___block_invoke(uint64_t a1)
{
  double v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setRepeatMode:v3];
}

- (void)setShuffleMode:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeDefault](self, "shuffleModeDefault"))|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeOff](self, "shuffleModeOff")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeSongs](self, "shuffleModeSongs")) & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", -[SUScriptMusicPlayerController shuffleModeAlbums](self, "shuffleModeAlbums")) & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __48__SUScriptMusicPlayerController_setShuffleMode___block_invoke(uint64_t a1)
{
  double v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setShuffleMode:v3];
}

- (void)setVolume:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __43__SUScriptMusicPlayerController_setVolume___block_invoke(uint64_t a1)
{
  double v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  [*(id *)(a1 + 40) floatValue];

  return objc_msgSend(v2, "setVolumePrivate:");
}

- (NSNumber)volume
{
  return (NSNumber *)[MEMORY[0x263EFF9D0] null];
}

- (NSString)playbackStateInterrupted
{
  return (NSString *)@"interrupted";
}

- (NSString)playbackStatePaused
{
  return (NSString *)@"paused";
}

- (NSString)playbackStatePlaying
{
  return (NSString *)@"playing";
}

- (NSString)playbackStateSeekingBackward
{
  return (NSString *)@"seeking-backward";
}

- (NSString)playbackStateSeekingForward
{
  return (NSString *)@"seeking-forward";
}

- (NSString)playbackStateStopped
{
  return (NSString *)@"stopped";
}

- (NSString)repeatModeAll
{
  return (NSString *)@"all";
}

- (NSString)repeatModeDefault
{
  return (NSString *)@"default";
}

- (NSString)repeatModeNone
{
  return (NSString *)@"none";
}

- (NSString)repeatModeOne
{
  return (NSString *)@"one";
}

- (NSString)shuffleModeAlbums
{
  return (NSString *)@"albums";
}

- (NSString)shuffleModeDefault
{
  return (NSString *)@"default";
}

- (NSString)shuffleModeOff
{
  return (NSString *)@"off";
}

- (NSString)shuffleModeSongs
{
  return (NSString *)@"songs";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_40, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMusicPlayerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_32, 11);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMusicPlayerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMusicPlayerController;
  double v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_40 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_32 = (uint64_t)sel_beginSeekingBackward;
    unk_2681B5070 = @"beginSeekingBackward";
    qword_2681B5078 = (uint64_t)sel_beginSeekingForward;
    unk_2681B5080 = @"beginSeekingForward";
    qword_2681B5088 = (uint64_t)sel_endSeeking;
    unk_2681B5090 = @"endSeeking";
    qword_2681B5098 = (uint64_t)sel_pause;
    unk_2681B50A0 = @"pause";
    qword_2681B50A8 = (uint64_t)sel_play;
    unk_2681B50B0 = @"play";
    qword_2681B50B8 = (uint64_t)sel_setQueueWithItemCollection_;
    unk_2681B50C0 = @"setQueueWithItemCollection";
    qword_2681B50C8 = (uint64_t)sel_setQueueWithQuery_;
    unk_2681B50D0 = @"setQueueWithQuery";
    qword_2681B50D8 = (uint64_t)sel_skipToBeginning;
    unk_2681B50E0 = @"skipToBeginning";
    qword_2681B50E8 = (uint64_t)sel_skipToNextItem;
    unk_2681B50F0 = @"skipToNextItem";
    qword_2681B50F8 = (uint64_t)sel_skipToPreviousItem;
    unk_2681B5100 = @"skipToPreviousItem";
    qword_2681B5108 = (uint64_t)sel_stop;
    unk_2681B5110 = @"stop";
    __KeyMapping_40 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"currentPlaybackTime", @"nowPlayingItem", @"nowPlayingItem", @"playbackState", @"playbackState", @"playerType", @"playerType", @"repeatMode", @"repeatMode", @"shuffleMode", @"shuffleMode", @"volume", @"volume", @"PLAYBACK_STATE_INTERRUPTED", @"playbackStateInterrupted", @"PLAYBACK_STATE_PAUSED", @"playbackStatePaused",
                        @"PLAYBACK_STATE_PLAYING",
                        @"playbackStatePlaying",
                        @"PLAYBACK_STATE_SEEKING_BACKWARD",
                        @"playbackStateSeekingBackward",
                        @"PLAYBACK_STATE_SEEKING_FORWARD",
                        @"playbackStateSeekingForward",
                        @"PLAYBACK_STATE_STOPPED",
                        @"playbackStateStopped",
                        @"REPEAT_MODE_ALL",
                        @"repeatModeAll",
                        @"REPEAT_MODE_DEFAULT",
                        @"repeatModeDefault",
                        @"REPEAT_MODE_NONE",
                        @"repeatModeNone",
                        @"REPEAT_MODE_ONE",
                        @"repeatModeOne",
                        @"SHUFFLE_MODE_ALBUMS",
                        @"shuffleModeAlbums",
                        @"SHUFFLE_MODE_DEFAULT",
                        @"shuffleModeDefault",
                        @"SHUFFLE_MODE_OFF",
                        @"shuffleModeOff",
                        @"SHUFFLE_MODE_SONGS",
                        @"shuffleModeSongs",
                        0);
  }
}

@end