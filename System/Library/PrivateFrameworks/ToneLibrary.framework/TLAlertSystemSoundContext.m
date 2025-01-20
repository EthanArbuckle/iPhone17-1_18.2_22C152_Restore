@interface TLAlertSystemSoundContext
- (BOOL)hasDeemphasizedPlaybackStarted;
- (BOOL)hasPlaybackStarted;
- (BOOL)isBeingDeemphasized;
- (BOOL)isBeingInterrupted;
- (BOOL)isDeemphasized;
- (BOOL)isLoadingSound;
- (BOOL)isRequiringBacklightObservation;
- (BOOL)shouldBeInterruptedAfterDeemphasizedPlaybackStarts;
- (NSString)toneIdentifierForDeemphasizingAlert;
- (NSString)vibrationIdentifier;
- (NSString)vibrationIdentifierForDeemphasizingAlert;
- (TLAlertPlaybackCompletionContext)playbackCompletionContext;
- (TLAlertPlaybackObserver)playbackObserver;
- (TLAlertStoppingOptions)stoppingOptionsForDeferredInterruption;
- (TLSystemSound)sound;
- (id)description;
- (void)setBeingDeemphasized:(BOOL)a3;
- (void)setBeingInterrupted:(BOOL)a3;
- (void)setDeemphasized:(BOOL)a3;
- (void)setHasDeemphasizedPlaybackStarted:(BOOL)a3;
- (void)setHasPlaybackStarted:(BOOL)a3;
- (void)setLoadingSound:(BOOL)a3;
- (void)setPlaybackCompletionContext:(id)a3;
- (void)setPlaybackObserver:(id)a3;
- (void)setRequiringBacklightObservation:(BOOL)a3;
- (void)setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:(BOOL)a3;
- (void)setSound:(id)a3;
- (void)setStoppingOptionsForDeferredInterruption:(id)a3;
- (void)setToneIdentifierForDeemphasizingAlert:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
- (void)setVibrationIdentifierForDeemphasizingAlert:(id)a3;
@end

@implementation TLAlertSystemSoundContext

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; sound = %@", self->_sound];
  [v6 appendFormat:@"; vibrationIdentifier = %@", self->_vibrationIdentifier];
  [v6 appendFormat:@"; playbackCompletionContext = %@", self->_playbackCompletionContext];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackObserver);
  v8 = WeakRetained;
  if (WeakRetained) {
    [v6 appendFormat:@"; playbackObserver = %@", WeakRetained];
  }
  if (self->_requiringBacklightObservation) {
    [v6 appendString:@"; isRequiringBacklightObservation = YES"];
  }
  if (self->_loadingSound) {
    [v6 appendString:@"; isLoadingSound = YES"];
  }
  if (self->_hasPlaybackStarted) {
    [v6 appendString:@"; hasPlaybackStarted = YES"];
  }
  if (self->_beingInterrupted) {
    [v6 appendString:@"; isBeingInterrupted = YES"];
  }
  v9 = self->_toneIdentifierForDeemphasizingAlert;
  v10 = v9;
  if (v9) {
    [v6 appendFormat:@"; toneIdentifierForDeemphasizingAlert = %@", v9];
  }
  v11 = self->_vibrationIdentifierForDeemphasizingAlert;
  v12 = v11;
  if (v11) {
    [v6 appendFormat:@"; vibrationIdentifierForDeemphasizingAlert = %@", v11];
  }
  if (self->_beingDeemphasized) {
    [v6 appendString:@"; isBeingDeemphasized = YES"];
  }
  if (self->_deemphasized) {
    [v6 appendString:@"; isDeemphasized = YES"];
  }
  if (self->_hasDeemphasizedPlaybackStarted) {
    [v6 appendString:@"; hasDeemphasizedPlaybackStarted = YES"];
  }
  if (self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts) {
    [v6 appendString:@"; shouldBeInterruptedAfterDeemphasizedPlaybackStarts = YES"];
  }
  if (self->_stoppingOptionsForDeferredInterruption) {
    objc_msgSend(v6, "appendFormat:", @"; stoppingOptionsForDeferredInterruption = %@",
  }
      self->_stoppingOptionsForDeferredInterruption);
  [v6 appendString:@">"];

  return v6;
}

- (TLSystemSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
}

- (TLAlertPlaybackCompletionContext)playbackCompletionContext
{
  return self->_playbackCompletionContext;
}

- (void)setPlaybackCompletionContext:(id)a3
{
}

- (TLAlertPlaybackObserver)playbackObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackObserver);

  return (TLAlertPlaybackObserver *)WeakRetained;
}

- (void)setPlaybackObserver:(id)a3
{
}

- (BOOL)isRequiringBacklightObservation
{
  return self->_requiringBacklightObservation;
}

- (void)setRequiringBacklightObservation:(BOOL)a3
{
  self->_requiringBacklightObservation = a3;
}

- (BOOL)isLoadingSound
{
  return self->_loadingSound;
}

- (void)setLoadingSound:(BOOL)a3
{
  self->_loadingSound = a3;
}

- (BOOL)hasPlaybackStarted
{
  return self->_hasPlaybackStarted;
}

- (void)setHasPlaybackStarted:(BOOL)a3
{
  self->_hasPlaybackStarted = a3;
}

- (BOOL)isBeingInterrupted
{
  return self->_beingInterrupted;
}

- (void)setBeingInterrupted:(BOOL)a3
{
  self->_beingInterrupted = a3;
}

- (NSString)toneIdentifierForDeemphasizingAlert
{
  return self->_toneIdentifierForDeemphasizingAlert;
}

- (void)setToneIdentifierForDeemphasizingAlert:(id)a3
{
}

- (NSString)vibrationIdentifierForDeemphasizingAlert
{
  return self->_vibrationIdentifierForDeemphasizingAlert;
}

- (void)setVibrationIdentifierForDeemphasizingAlert:(id)a3
{
}

- (BOOL)isBeingDeemphasized
{
  return self->_beingDeemphasized;
}

- (void)setBeingDeemphasized:(BOOL)a3
{
  self->_beingDeemphasized = a3;
}

- (BOOL)isDeemphasized
{
  return self->_deemphasized;
}

- (void)setDeemphasized:(BOOL)a3
{
  self->_deemphasized = a3;
}

- (BOOL)hasDeemphasizedPlaybackStarted
{
  return self->_hasDeemphasizedPlaybackStarted;
}

- (void)setHasDeemphasizedPlaybackStarted:(BOOL)a3
{
  self->_hasDeemphasizedPlaybackStarted = a3;
}

- (BOOL)shouldBeInterruptedAfterDeemphasizedPlaybackStarts
{
  return self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts;
}

- (void)setShouldBeInterruptedAfterDeemphasizedPlaybackStarts:(BOOL)a3
{
  self->_shouldBeInterruptedAfterDeemphasizedPlaybackStarts = a3;
}

- (TLAlertStoppingOptions)stoppingOptionsForDeferredInterruption
{
  return self->_stoppingOptionsForDeferredInterruption;
}

- (void)setStoppingOptionsForDeferredInterruption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stoppingOptionsForDeferredInterruption, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_toneIdentifierForDeemphasizingAlert, 0);
  objc_destroyWeak((id *)&self->_playbackObserver);
  objc_storeStrong((id *)&self->_playbackCompletionContext, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);

  objc_storeStrong((id *)&self->_sound, 0);
}

@end