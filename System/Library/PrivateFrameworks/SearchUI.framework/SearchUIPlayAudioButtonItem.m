@interface SearchUIPlayAudioButtonItem
+ (BOOL)isSingleItemMedia:(id)a3;
- (BOOL)allowsContextMenu;
- (BOOL)gotNowPlayingChangedNotificationAfterPlaying;
- (BOOL)hasState;
- (BOOL)needsUpdate;
- (BOOL)shouldSkipUpdate;
- (SearchUIPlayAudioButtonItem)initWithSFButtonItem:(id)a3;
- (id)commandForStatus:(unint64_t)a3;
- (id)offStateSymbolName;
- (id)onStateSymbolName;
- (id)toggledTitle;
- (id)untoggledTitle;
- (unint64_t)status;
- (void)buttonPressed;
- (void)dealloc;
- (void)newPlayButtonPressedWithNotification:(id)a3;
- (void)nowPlayingItemDidChange;
- (void)playbackDidFinish;
- (void)playbackStateDidChange;
- (void)setGotNowPlayingChangedNotificationAfterPlaying:(BOOL)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)toggleOff;
- (void)updatePlayState;
@end

@implementation SearchUIPlayAudioButtonItem

+ (BOOL)isSingleItemMedia:(id)a3
{
  unsigned int v3 = [a3 mediaType];
  BOOL result = 1;
  if (v3 > 0x14 || ((1 << v3) & 0x102CC2) == 0) {
    return v3 == 100;
  }
  return result;
}

- (SearchUIPlayAudioButtonItem)initWithSFButtonItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIPlayAudioButtonItem;
  unsigned int v3 = [(SearchUIButtonItem *)&v6 initWithSFButtonItem:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_playbackStateDidChange name:@"SearchUIMusicPlaybackStateDidChangeNotification" object:0];
    [v4 addObserver:v3 selector:sel_nowPlayingItemDidChange name:@"SearchUIMusicNowPlayingItemDidChangeNotification" object:0];
    [v4 addObserver:v3 selector:sel_nowPlayingItemDidChange name:@"SearchUIMusicDidResetNotification" object:0];
    [v4 addObserver:v3 selector:sel_playbackDidFinish name:*MEMORY[0x1E4F16020] object:0];
    [v4 addObserver:v3 selector:sel_newPlayButtonPressedWithNotification_ name:@"SearchUIPlayButtonDidBeginPlayingNotification" object:0];
    [v4 addObserver:v3 selector:sel_playbackDidFinish name:@"SearchUITTSPlaybackDidFinishNotification" object:0];
  }
  return v3;
}

- (void)dealloc
{
  unsigned int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x1E4F319C0] systemMusicPlayer];
  [v4 endGeneratingPlaybackNotifications];

  v5.receiver = self;
  v5.super_class = (Class)SearchUIPlayAudioButtonItem;
  [(SearchUIPlayAudioButtonItem *)&v5 dealloc];
}

- (unint64_t)status
{
  if (![(SearchUIPlayAudioButtonItem *)self hasState]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SearchUIPlayAudioButtonItem;
  return [(SearchUIButtonItem *)&v4 status];
}

- (BOOL)hasState
{
  v2 = [(SearchUIButtonItem *)self sfButtonItem];
  unsigned int v3 = [v2 mediaMetadata];
  objc_super v4 = [v3 mediaIdentifier];
  if (v4 && ([(id)objc_opt_class() isSingleItemMedia:v3] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_super v6 = [v2 audioData];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"PLAY"];
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:@"PAUSE"];
}

- (id)offStateSymbolName
{
  return @"play";
}

- (id)onStateSymbolName
{
  v2 = [(SearchUIButtonItem *)self sfButtonItem];
  unsigned int v3 = [v2 audioData];
  if (v3) {
    objc_super v4 = @"stop";
  }
  else {
    objc_super v4 = @"pause";
  }
  BOOL v5 = v4;

  return v5;
}

- (id)commandForStatus:(unint64_t)a3
{
  BOOL v5 = objc_opt_new();
  objc_super v6 = [(SearchUIButtonItem *)self sfButtonItem];
  v7 = [v6 mediaMetadata];
  [v5 setMediaMetadata:v7];

  v8 = [(SearchUIButtonItem *)self sfButtonItem];
  v9 = [v8 audioData];
  [v5 setAudioData:v9];

  if ([(SearchUIPlayAudioButtonItem *)self hasState]) {
    [v5 setShouldPause:a3 == 1];
  }
  return v5;
}

- (void)buttonPressed
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (![(SearchUIPlayAudioButtonItem *)self status])
  {
    unsigned int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v8 = @"senderItem";
    v9[0] = self;
    objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v3 postNotificationName:@"SearchUIPlayButtonDidBeginPlayingNotification" object:0 userInfo:v4];
  }
  BOOL v5 = [(SearchUIButtonItem *)self sfButtonItem];
  objc_super v6 = [v5 mediaMetadata];

  v7.receiver = self;
  v7.super_class = (Class)SearchUIPlayAudioButtonItem;
  [(SearchUIToggleButtonItem *)&v7 buttonPressed];
  if ([(SearchUIPlayAudioButtonItem *)self status] == 1
    || ![(SearchUIPlayAudioButtonItem *)self hasState])
  {
    +[SearchUIMediaUtilities setCurrentMedia:v6];
    +[SearchUIMediaUtilities setIsPlaying:1];
    [(SearchUIPlayAudioButtonItem *)self setGotNowPlayingChangedNotificationAfterPlaying:0];
  }
  else if (+[SearchUIMediaUtilities isCurrentMedia:v6])
  {
    +[SearchUIMediaUtilities setIsPlaying:0];
  }
  [(SearchUIPlayAudioButtonItem *)self setNeedsUpdate:1];
  _searchUIDebounceStateChanges = 1;
}

- (void)updatePlayState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__SearchUIPlayAudioButtonItem_updatePlayState__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:v2];
}

void __46__SearchUIPlayAudioButtonItem_updatePlayState__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasState])
  {
    v2 = [*(id *)(a1 + 32) sfButtonItem];
    id v5 = [v2 mediaMetadata];

    LODWORD(v2) = +[SearchUIMediaUtilities isNowPlayingMedia:v5];
    uint64_t v3 = [*(id *)(a1 + 32) status];
    [*(id *)(a1 + 32) setStatus:v2];
    if (v3 != [*(id *)(a1 + 32) status])
    {
      objc_super v4 = [*(id *)(a1 + 32) delegate];
      [v4 stateDidChangeForButtonItem:*(void *)(a1 + 32)];
    }
  }
}

- (void)playbackDidFinish
{
  if (![(SearchUIPlayAudioButtonItem *)self shouldSkipUpdate])
  {
    +[SearchUIMediaUtilities setCurrentMedia:0];
    [(SearchUIPlayAudioButtonItem *)self toggleOff];
  }
}

- (void)playbackStateDidChange
{
  if ([(SearchUIPlayAudioButtonItem *)self shouldSkipUpdate]) {
    return;
  }
  uint64_t v3 = +[SearchUIMediaUtilities musicStatusCache];
  uint64_t v4 = [v3 playbackState];

  if ((unint64_t)(v4 - 2) < 4)
  {
    uint64_t v5 = 0;
LABEL_10:
    +[SearchUIMediaUtilities setIsPlaying:v5];
    goto LABEL_11;
  }
  if (v4 == 1)
  {
    uint64_t v5 = 1;
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_11:
    [(SearchUIPlayAudioButtonItem *)self updatePlayState];
    return;
  }
  [(SearchUIPlayAudioButtonItem *)self playbackDidFinish];
}

- (BOOL)shouldSkipUpdate
{
  uint64_t v3 = [(SearchUIButtonItem *)self sfButtonItem];
  uint64_t v4 = [v3 mediaMetadata];
  if ([v4 mediaType] == 100)
  {

    return 0;
  }
  uint64_t v5 = [(SearchUIButtonItem *)self sfButtonItem];
  objc_super v6 = [v5 audioData];

  if (v6) {
    return 0;
  }
  v8 = +[SearchUIMediaUtilities musicStatusCache];
  uint64_t v9 = [v8 playbackState];

  if (v9 != 1)
  {
    if (v9 != 2)
    {
      BOOL v10 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = 0;
  }
  BOOL v10 = [(SearchUIPlayAudioButtonItem *)self status] == v9;
LABEL_10:
  if ((![(SearchUIPlayAudioButtonItem *)self needsUpdate] || !v10)
    && (_searchUIDebounceStateChanges & 1) != 0)
  {
    return 1;
  }
  [(SearchUIPlayAudioButtonItem *)self setNeedsUpdate:0];
  BOOL result = 0;
  _searchUIDebounceStateChanges = 0;
  return result;
}

- (void)nowPlayingItemDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SearchUIPlayAudioButtonItem_nowPlayingItemDidChange__block_invoke;
  v2[3] = &unk_1E6E72730;
  v2[4] = self;
  +[SearchUIUtilities dispatchMainIfNecessary:v2];
}

uint64_t __54__SearchUIPlayAudioButtonItem_nowPlayingItemDidChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sfButtonItem];
  uint64_t v3 = [v2 mediaMetadata];
  if (+[SearchUIMediaUtilities isNowPlayingMedia:v3])
  {
    char v4 = [*(id *)(a1 + 32) gotNowPlayingChangedNotificationAfterPlaying];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      return [v5 setGotNowPlayingChangedNotificationAfterPlaying:1];
    }
  }
  else
  {
  }
  objc_super v7 = *(void **)(a1 + 32);
  return [v7 updatePlayState];
}

- (void)newPlayButtonPressedWithNotification:(id)a3
{
  char v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"senderItem"];

  if (v5 != self)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__SearchUIPlayAudioButtonItem_newPlayButtonPressedWithNotification___block_invoke;
    v6[3] = &unk_1E6E72730;
    v6[4] = self;
    +[SearchUIUtilities dispatchMainIfNecessary:v6];
  }
}

uint64_t __68__SearchUIPlayAudioButtonItem_newPlayButtonPressedWithNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleOff];
}

- (void)toggleOff
{
  [(SearchUIButtonItem *)self setStatus:0];
  id v3 = [(SearchUIButtonItem *)self delegate];
  [v3 stateDidChangeForButtonItem:self];
}

- (BOOL)allowsContextMenu
{
  return 0;
}

- (BOOL)gotNowPlayingChangedNotificationAfterPlaying
{
  return self->_gotNowPlayingChangedNotificationAfterPlaying;
}

- (void)setGotNowPlayingChangedNotificationAfterPlaying:(BOOL)a3
{
  self->_gotNowPlayingChangedNotificationAfterPlaying = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

@end