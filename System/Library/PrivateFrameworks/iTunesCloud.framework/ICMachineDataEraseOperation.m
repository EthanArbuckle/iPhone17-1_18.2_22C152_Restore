@interface ICMachineDataEraseOperation
- (void)execute;
@end

@implementation ICMachineDataEraseOperation

- (void)execute
{
  v3 = [(ICMachineDataOperation *)self requestContext];
  v4 = [v3 identityStore];
  v5 = [v3 identity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__ICMachineDataEraseOperation_execute__block_invoke;
  v6[3] = &unk_1E5ACAFF0;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

void __38__ICMachineDataEraseOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) protocolVersion] != 2)
  {
    v4 = [v3 DSID];
    [v4 unsignedLongLongValue];
  }
  p435tmhbla();
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v5 userInfo:0];
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "failed to erase machine data provisioning. err=%{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = [*(id *)(a1 + 32) completionHandler];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v6);
  }
  [*(id *)(a1 + 32) finishWithError:v6];
}

@end