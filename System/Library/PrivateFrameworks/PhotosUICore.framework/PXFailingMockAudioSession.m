@interface PXFailingMockAudioSession
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime;
- (void)_fail;
@end

@implementation PXFailingMockAudioSession

- (void)_fail
{
}

void __34__PXFailingMockAudioSession__fail__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setStatus:4];
  objc_msgSend(MEMORY[0x1E4F28C58], "px_audioSessionErrorWithCode:", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setError:v3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

@end