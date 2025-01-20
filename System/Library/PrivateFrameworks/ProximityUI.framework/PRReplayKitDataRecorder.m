@interface PRReplayKitDataRecorder
- (PRReplayKitDataRecorder)init;
- (id)stopAndSave;
- (id)writeToURL;
- (void)discardRecording;
- (void)saveScreenRecordingToURL:(id)a3;
- (void)start;
- (void)stopAndDiscard;
@end

@implementation PRReplayKitDataRecorder

- (PRReplayKitDataRecorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)PRReplayKitDataRecorder;
  v2 = [(PRDataRecorder *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F16978] sharedRecorder];
    [v3 setMicrophoneEnabled:0];
  }
  return v2;
}

- (void)start
{
  [(PRReplayKitDataRecorder *)self stopAndDiscard];
  id v2 = [MEMORY[0x263F16978] sharedRecorder];
  [v2 startRecordingWithHandler:&__block_literal_global_2];
}

void __32__PRReplayKitDataRecorder_start__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = [a2 localizedDescription];
    NSLog(&stru_26E5D4A80.isa, v2);
  }
}

- (id)stopAndSave
{
  v3 = [(PRReplayKitDataRecorder *)self writeToURL];
  [(PRReplayKitDataRecorder *)self stopAndDiscard];
  return v3;
}

- (void)stopAndDiscard
{
  [(PRReplayKitDataRecorder *)self discardRecording];
  [(PRDataRecorder *)self discardSensorData];
}

- (id)writeToURL
{
  v3 = +[PRDataRecorder generateFilename];
  v4 = +[PRDataRecorder generateTemporaryDirectoryURL];
  objc_super v5 = [NSString stringWithFormat:@"%@.json", v3];
  v6 = [NSString stringWithFormat:@"%@.mp4", v3];
  v7 = [v4 URLByAppendingPathComponent:v6];
  [(PRReplayKitDataRecorder *)self saveScreenRecordingToURL:v7];

  v8 = [v4 URLByAppendingPathComponent:v5];
  [(PRDataRecorder *)self writeSensorDataToURL:v8];

  v9 = [v4 URLByAppendingPathComponent:v3];

  return v9;
}

- (void)saveScreenRecordingToURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F16978];
  id v4 = a3;
  id v5 = [v3 sharedRecorder];
  [v5 stopRecordingWithOutputURL:v4 completionHandler:&__block_literal_global_11];
}

void __52__PRReplayKitDataRecorder_saveScreenRecordingToURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_ScreenRecordin.isa, a2);
  }
}

- (void)discardRecording
{
  id v2 = [MEMORY[0x263F16978] sharedRecorder];
  [v2 stopRecordingWithHandler:&__block_literal_global_17];

  id v3 = [MEMORY[0x263F16978] sharedRecorder];
  [v3 discardRecordingWithHandler:&__block_literal_global_20];
}

void __43__PRReplayKitDataRecorder_discardRecording__block_invoke_2()
{
}

@end