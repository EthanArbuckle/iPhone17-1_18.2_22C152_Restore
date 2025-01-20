@interface MTCompanionSyncSerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
@end

@implementation MTCompanionSyncSerializer

- (id)dataFromChange:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEE21358] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MTCompanionSyncSerializer.m", 25, @"%@ not protobuffer serializable", v5 object file lineNumber description];
  }
  v6 = [v5 serialize];
  v7 = [v6 data];

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v4 = a3;
  id v5 = [[MTPBSyncMessage alloc] initWithData:v4];

  if ([(MTPBSyncMessage *)v5 hasDismissAction])
  {
    v6 = MTSyncDismiss;
LABEL_5:
    v7 = [(__objc2_class *)v6 deserialize:v5];
    goto LABEL_9;
  }
  if ([(MTPBSyncMessage *)v5 hasSnoozeAction])
  {
    v6 = MTSyncSnooze;
    goto LABEL_5;
  }
  v8 = MTLogForCategory(6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MTCompanionSyncSerializer changeFromData:ofType:](v8);
  }

  v7 = 0;
LABEL_9:

  return v7;
}

- (void)changeFromData:(NSObject *)a1 ofType:.cold.1(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = +[MTPairedDeviceListener sharedListener];
  v3 = [v2 pairedDeviceVersion];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_19CC95000, a1, OS_LOG_TYPE_ERROR, "Dropping undecodeable sync data from %{public}@", (uint8_t *)&v4, 0xCu);
}

@end