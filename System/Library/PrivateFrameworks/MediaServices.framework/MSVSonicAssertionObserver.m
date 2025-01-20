@interface MSVSonicAssertionObserver
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
@end

@implementation MSVSonicAssertionObserver

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 134218242;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_ERROR, "[MSVSonicAssertion] RBSAssertion %p was invalidated error=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"MSVSonicAssertionsWereInvalidatedNotification" object:0];
}

@end