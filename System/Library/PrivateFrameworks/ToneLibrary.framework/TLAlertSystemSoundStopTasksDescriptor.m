@interface TLAlertSystemSoundStopTasksDescriptor
- (NSArray)playbackCompletionContextsToProcess;
- (NSMapTable)interruptedAlertsToSound;
- (TLAlertStoppingOptions)options;
- (int64_t)playbackCompletionType;
- (void)setInterruptedAlertsToSound:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPlaybackCompletionContextsToProcess:(id)a3;
- (void)setPlaybackCompletionType:(int64_t)a3;
@end

@implementation TLAlertSystemSoundStopTasksDescriptor

- (NSMapTable)interruptedAlertsToSound
{
  return self->_interruptedAlertsToSound;
}

- (void)setInterruptedAlertsToSound:(id)a3
{
}

- (NSArray)playbackCompletionContextsToProcess
{
  return self->_playbackCompletionContextsToProcess;
}

- (void)setPlaybackCompletionContextsToProcess:(id)a3
{
}

- (TLAlertStoppingOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int64_t)playbackCompletionType
{
  return self->_playbackCompletionType;
}

- (void)setPlaybackCompletionType:(int64_t)a3
{
  self->_playbackCompletionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_playbackCompletionContextsToProcess, 0);

  objc_storeStrong((id *)&self->_interruptedAlertsToSound, 0);
}

@end