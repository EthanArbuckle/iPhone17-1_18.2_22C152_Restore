@interface SEKeySyncService
+ (id)transcodeTLKShares:(id)a3 fromCurrentIdentifier:(id)a4 toIdentity:(id)a5 outError:(id *)a6;
+ (void)recoveryDidComplete:(id)a3;
@end

@implementation SEKeySyncService

+ (id)transcodeTLKShares:(id)a3 fromCurrentIdentifier:(id)a4 toIdentity:(id)a5 outError:(id *)a6
{
  if (a6)
  {
    v7 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (void)recoveryDidComplete:(id)a3
{
  id v3 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced.shared"];
  [v3 setBool:1 forKey:@"keysync.recovery.required"];
  notify_post("com.apple.seservice.keysync.recoverydidcomplete");
}

@end