@interface VMTranscriptionSanitizeDatabaseOperation
- (BOOL)isAsynchronous;
- (void)cancel;
- (void)main;
@end

@implementation VMTranscriptionSanitizeDatabaseOperation

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)main
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting queued transcription database sanitization.", buf, 2u);
  }

  v4 = (void *)VMStoreCopyOfAllRecordsWithFlags(0x8000, 0, 0);
  v5 = (void *)VMStoreCopyOfAllRecordsWithFlags(512, 0, 0);
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  *(void *)buf = 0;
  v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([v6 count])
  {
    v7 = vm_vmd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 count];
      *(_DWORD *)v14 = 134217984;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found %lu records that were left transcribing when they should not have been. Unsetting transcribing flag.", v14, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000776C;
  v9[3] = &unk_1000C1590;
  v9[4] = self;
  v9[5] = buf;
  [v6 enumerateObjectsUsingBlock:v9];
  if (v11[24]) {
    VMStoreSave();
  }
  _Block_object_dispose(buf, 8);
}

- (void)cancel
{
  v3 = vm_vmd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Operation to sanitize voicemail transcription database was cancelled.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)VMTranscriptionSanitizeDatabaseOperation;
  [(VMTranscriptionSanitizeDatabaseOperation *)&v4 cancel];
}

@end