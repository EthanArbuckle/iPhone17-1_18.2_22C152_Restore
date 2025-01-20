@interface TVREventHaptic
- (void)playImpactEventHaptic;
- (void)playSelectionEventHaptic;
- (void)playSuccessEventHaptic;
@end

@implementation TVREventHaptic

- (void)playSelectionEventHaptic
{
  if (!self->_selectionFeedbackGenerator)
  {
    v3 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F82BC0]);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v3;

    [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator prepare];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TVREventHaptic_playSelectionEventHaptic__block_invoke;
  block[3] = &unk_2647FFF70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__TVREventHaptic_playSelectionEventHaptic__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) selectionChanged];
}

- (void)playImpactEventHaptic
{
  if (!self->_impactFeedbackGenerator)
  {
    v3 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:0];
    impactFeedbackGenerator = self->_impactFeedbackGenerator;
    self->_impactFeedbackGenerator = v3;

    [(UIImpactFeedbackGenerator *)self->_impactFeedbackGenerator prepare];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__TVREventHaptic_playImpactEventHaptic__block_invoke;
  block[3] = &unk_2647FFF70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __39__TVREventHaptic_playImpactEventHaptic__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) impactOccurred];
}

- (void)playSuccessEventHaptic
{
  if (!self->_notificationFeedbackGenerator)
  {
    v3 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F829D8]);
    notificationFeedbackGenerator = self->_notificationFeedbackGenerator;
    self->_notificationFeedbackGenerator = v3;

    [(UINotificationFeedbackGenerator *)self->_notificationFeedbackGenerator prepare];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__TVREventHaptic_playSuccessEventHaptic__block_invoke;
  block[3] = &unk_2647FFF70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __40__TVREventHaptic_playSuccessEventHaptic__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) notificationOccurred:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
}

@end