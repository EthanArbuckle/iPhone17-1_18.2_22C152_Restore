@interface ICBackgroundTranscriptionHelper
+ (id)sharedInstance;
- (void)addCallRecordingTranscriptionTaskToQueueOnLaunch:(id)a3;
- (void)addFirstTimeTranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5;
- (void)addRetranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4;
@end

@implementation ICBackgroundTranscriptionHelper

+ (id)sharedInstance
{
  v2 = objc_alloc_init(ICBackgroundTranscriptionHelper);
  return v2;
}

- (void)addFirstTimeTranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4 subattachmentIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ICBackgroundTranscriber sharedInstance];
  [v10 addFirstTimeTranscriptionTaskToQueueWithMediaURL:v9 attachmentIdentifier:v8 subattachmentIdentifier:v7];
}

- (void)addRetranscriptionTaskToQueue:(id)a3 attachmentIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ICBackgroundTranscriber sharedInstance];
  [v7 addRetranscriptionTaskToQueueWithSubattachmentAndMediaInfo:v6 attachmentIdentifier:v5];
}

- (void)addCallRecordingTranscriptionTaskToQueueOnLaunch:(id)a3
{
  id v3 = a3;
  id v4 = +[ICBackgroundTranscriber sharedInstance];
  [v4 addCallRecordingTranscriptionTaskToQueueWithSpeakers:MEMORY[0x1E4F1CBF0] NGASR:1 attachmentIdentifier:v3];
}

@end