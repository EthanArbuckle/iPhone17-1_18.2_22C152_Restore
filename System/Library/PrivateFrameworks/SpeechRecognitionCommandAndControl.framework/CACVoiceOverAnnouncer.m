@interface CACVoiceOverAnnouncer
- (BOOL)shouldInterruptCurrentAnnouncement;
- (CACVoiceOverAnnouncement)currentAnnouncement;
- (CACVoiceOverAnnouncer)init;
- (NSMutableArray)voiceOverAnnouncementQueue;
- (void)_dequeueNextAnnouncement;
- (void)_didFinishAnnouncement:(id)a3;
- (void)announceMessage:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)prepareForImmediateAnnouncement;
- (void)setCurrentAnnouncement:(id)a3;
- (void)setShouldInterruptCurrentAnnouncement:(BOOL)a3;
- (void)setVoiceOverAnnouncementQueue:(id)a3;
@end

@implementation CACVoiceOverAnnouncer

- (CACVoiceOverAnnouncer)init
{
  v9.receiver = self;
  v9.super_class = (Class)CACVoiceOverAnnouncer;
  v2 = [(CACVoiceOverAnnouncer *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    voiceOverAnnouncementQueue = v2->_voiceOverAnnouncementQueue;
    v2->_voiceOverAnnouncementQueue = (NSMutableArray *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("CACVoiceOverAnnouncer", 0);
    announcerQueue = v2->_announcerQueue;
    v2->_announcerQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__didFinishAnnouncement_ name:*MEMORY[0x263F83178] object:0];
  }
  return v2;
}

- (void)announceMessage:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  announcerQueue = self->_announcerQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__CACVoiceOverAnnouncer_announceMessage_type_completion___block_invoke;
  v13[3] = &unk_264D123E8;
  id v16 = v9;
  int64_t v17 = a4;
  id v14 = v8;
  v15 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(announcerQueue, v13);
}

void __57__CACVoiceOverAnnouncer_announceMessage_type_completion___block_invoke(uint64_t a1)
{
  v6 = [[CACVoiceOverAnnouncement alloc] initWithMessage:*(void *)(a1 + 32) type:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 40) voiceOverAnnouncementQueue];
  [v2 addObject:v6];

  uint64_t v3 = [*(id *)(a1 + 40) currentAnnouncement];
  if (!v3
    || (v4 = (void *)v3, int v5 = [*(id *)(a1 + 40) shouldInterruptCurrentAnnouncement], v4, v5))
  {
    [*(id *)(a1 + 40) _dequeueNextAnnouncement];
  }
}

- (void)prepareForImmediateAnnouncement
{
  announcerQueue = self->_announcerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CACVoiceOverAnnouncer_prepareForImmediateAnnouncement__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(announcerQueue, block);
}

void __56__CACVoiceOverAnnouncer_prepareForImmediateAnnouncement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldInterruptCurrentAnnouncement:1];
  id v2 = [*(id *)(a1 + 32) voiceOverAnnouncementQueue];
  [v2 removeAllObjects];
}

- (void)_dequeueNextAnnouncement
{
  [(CACVoiceOverAnnouncer *)self setCurrentAnnouncement:0];
  [(CACVoiceOverAnnouncer *)self setShouldInterruptCurrentAnnouncement:0];
  uint64_t v3 = [(CACVoiceOverAnnouncer *)self voiceOverAnnouncementQueue];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int v5 = [(CACVoiceOverAnnouncer *)self voiceOverAnnouncementQueue];
    id v8 = [v5 firstObject];

    v6 = [(CACVoiceOverAnnouncer *)self voiceOverAnnouncementQueue];
    [v6 removeObjectAtIndex:0];

    LODWORD(v6) = *MEMORY[0x263F83188];
    v7 = [v8 message];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v7);

    [(CACVoiceOverAnnouncer *)self setCurrentAnnouncement:v8];
  }
}

- (void)_didFinishAnnouncement:(id)a3
{
  id v4 = a3;
  announcerQueue = self->_announcerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CACVoiceOverAnnouncer__didFinishAnnouncement___block_invoke;
  v7[3] = &unk_264D117C0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(announcerQueue, v7);
}

void __48__CACVoiceOverAnnouncer__didFinishAnnouncement___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v2 objectForKeyedSubscript:*MEMORY[0x263F83180]];

  uint64_t v3 = [*(id *)(a1 + 40) currentAnnouncement];
  id v4 = [v3 completion];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 40) currentAnnouncement];
    id v6 = [v5 completion];
    v6[2]();
  }
  [*(id *)(a1 + 40) _dequeueNextAnnouncement];
}

- (NSMutableArray)voiceOverAnnouncementQueue
{
  return self->_voiceOverAnnouncementQueue;
}

- (void)setVoiceOverAnnouncementQueue:(id)a3
{
}

- (CACVoiceOverAnnouncement)currentAnnouncement
{
  return self->_currentAnnouncement;
}

- (void)setCurrentAnnouncement:(id)a3
{
}

- (BOOL)shouldInterruptCurrentAnnouncement
{
  return self->_shouldInterruptCurrentAnnouncement;
}

- (void)setShouldInterruptCurrentAnnouncement:(BOOL)a3
{
  self->_shouldInterruptCurrentAnnouncement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnouncement, 0);
  objc_storeStrong((id *)&self->_voiceOverAnnouncementQueue, 0);
  objc_storeStrong((id *)&self->_announcerQueue, 0);
}

@end