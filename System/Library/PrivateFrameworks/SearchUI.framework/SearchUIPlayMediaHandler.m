@interface SearchUIPlayMediaHandler
- (BOOL)canPlayIntent;
- (BOOL)supportsIntentPath;
- (id)intent;
- (id)mediaMetadata;
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4;
- (void)sendPlaybackFinishedNotification;
@end

@implementation SearchUIPlayMediaHandler

- (id)intent
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F305C8]);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F30540]) initWithIdentifier:0 title:&stru_1F40279D8 type:0 artwork:0];
  v12[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v6 = [(SearchUICommandHandler *)self command];
  uint64_t v7 = (int)[v6 playbackLocation];
  v8 = [(SearchUIPlayMediaHandler *)self mediaMetadata];
  v9 = +[SearchUIMediaUtilities mediaSearchForMetadata:v8];
  v10 = (void *)[v3 initWithMediaItems:v5 mediaContainer:0 playShuffled:0 playbackRepeatMode:1 resumePlayback:0 playbackQueueLocation:v7 playbackSpeed:0 mediaSearch:v9];

  return v10;
}

- (id)mediaMetadata
{
  v2 = [(SearchUICommandHandler *)self command];
  id v3 = [v2 mediaMetadata];

  return v3;
}

- (BOOL)supportsIntentPath
{
  v2 = [(SearchUIMediaHandler *)self clientSelectedBundleIdentifier];
  BOOL v3 = +[SearchUIMediaUtilities bundleIdentifierSupportsPlayIntent:v2];

  return v3;
}

- (unint64_t)destination
{
  return 3;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(SearchUIPlayMediaHandler *)self mediaMetadata];
  v11 = [v8 audioData];
  int v12 = [v8 shouldPause];
  int v13 = v12;
  if (v11)
  {
    v14 = +[SearchUITTSUtilities ttsAudioDataWithSfAudioData:v11];
    if (!v14)
    {
LABEL_19:

      goto LABEL_20;
    }
    v15 = [v9 feedbackDelegate];
    if (v13)
    {
      if (objc_opt_respondsToSelector())
      {
        [v15 stopPlaybackForAudioData:v14];
LABEL_18:

        goto LABEL_19;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke;
      v24[3] = &unk_1E6E73548;
      id v25 = v11;
      +[SearchUITTSUtilities stopWithCompletionHandler:v24];
      v18 = v25;
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_22;
        v23[3] = &unk_1E6E72730;
        v23[4] = self;
        [v15 performPlaybackForAudioData:v14 completionHandler:v23];
        goto LABEL_18;
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2;
      v20[3] = &unk_1E6E73168;
      id v21 = v11;
      v22 = self;
      +[SearchUITTSUtilities playWithAudioData:v14 completionHandler:v20];
      v18 = v21;
    }

    goto LABEL_18;
  }
  if (v12)
  {
    if ([v10 mediaType] == 100) {
      +[SearchUIVoicemailUtilities pauseVoicemail];
    }
    else {
      +[SearchUIMediaUtilities pausePlayback];
    }
  }
  else if ([(SearchUIPlayMediaHandler *)self canPlayIntent] {
         || ([(SearchUIPlayMediaHandler *)self mediaMetadata],
  }
             v16 = objc_claimAutoreleasedReturnValue(),
             [v16 mediaIdentifier],
             v17 = objc_claimAutoreleasedReturnValue(),
             v17,
             v16,
             !v17))
  {
    v19.receiver = self;
    v19.super_class = (Class)SearchUIPlayMediaHandler;
    [(SearchUIMediaHandler *)&v19 performCommand:v8 triggerEvent:a4 environment:v9];
  }
  else
  {
    +[SearchUIMediaUtilities playMedia:v10];
  }
LABEL_20:
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = SearchUIGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_cold_1();
    }
  }
}

uint64_t __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendPlaybackFinishedNotification];
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = SearchUIGeneralLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1();
    }
  }
  [*(id *)(a1 + 40) sendPlaybackFinishedNotification];
}

- (void)sendPlaybackFinishedNotification
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SearchUITTSPlaybackDidFinishNotification" object:0];
}

- (BOOL)canPlayIntent
{
  id v2 = [(SearchUIPlayMediaHandler *)self mediaMetadata];
  id v3 = [v2 artistName];
  if (v3 || ([v2 albumName], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v4 = [v2 mediaName];

    if (!v4) {
      goto LABEL_5;
    }
  }
  LODWORD(v4) = [MEMORY[0x1E4FAE198] isMacOS] ^ 1;
LABEL_5:

  return (char)v4;
}

- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SearchUIPlayMediaHandler *)self canPlayIntent]) {
    goto LABEL_4;
  }
  id v8 = +[SearchUIUtilities bundleIdentifierForApp:11];
  if (([v7 isEqualToString:v8] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v9 = [(SearchUIPlayMediaHandler *)self mediaMetadata];
  v10 = [v9 mediaIdentifier];

  if (!v10)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)SearchUIPlayMediaHandler;
    [(SearchUIMediaHandler *)&v12 performIntent:v6 withBundleIdentifier:v7];
    goto LABEL_7;
  }
LABEL_4:
  v11 = [(SearchUIPlayMediaHandler *)self mediaMetadata];
  +[SearchUIMediaUtilities playMedia:v11];

LABEL_7:
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(&dword_1E45B5000, v0, v1, "Error stopping audio data (%@): %@");
}

void __68__SearchUIPlayMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(&dword_1E45B5000, v0, v1, "Error playing audio data (%@): %@");
}

@end