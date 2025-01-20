@interface RCCloudRecording(SyncedProperties)
@end

@implementation RCCloudRecording(SyncedProperties)

- (void)setSyncedAudioFuture:()SyncedProperties sourceFileURL:.cold.1(char a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = "audioFuture";
  v5 = "-[RCCloudRecording(SyncedProperties) setSyncedAudioFuture:sourceFileURL:]";
  int v4 = 136315650;
  if (a1) {
    v3 = "mtAudioFuture";
  }
  else {
    v3 = "audioFuture";
  }
  v7 = v3;
  __int16 v6 = 2080;
  if ((a1 & 1) == 0) {
    v2 = "mtAudioFuture";
  }
  __int16 v8 = 2080;
  v9 = v2;
  _os_log_fault_impl(&dword_1C3964000, a2, OS_LOG_TYPE_FAULT, "%s -- Writing to %s while %s is non-nil!", (uint8_t *)&v4, 0x20u);
}

@end