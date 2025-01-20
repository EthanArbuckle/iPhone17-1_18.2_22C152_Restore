@interface MFUserScriptLibrary
+ (id)userScripts;
@end

@implementation MFUserScriptLibrary

+ (id)userScripts
{
  if (userScripts_onceToken != -1) {
    dispatch_once(&userScripts_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)userScripts_userScripts;
  return v2;
}

void __34__MFUserScriptLibrary_userScripts__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v0 = [NSString alloc];
  v9[0] = [v0 initWithBytes:kAttachmentViewSupportSource length:kAttachmentViewSupportSourceLength encoding:4];
  id v1 = [NSString alloc];
  v9[1] = [v1 initWithBytes:kMessageReformattingSource length:kMessageReformattingSourceLength encoding:4];
  id v2 = [NSString alloc];
  v9[2] = [v2 initWithBytes:kMessageContentViewSource length:kMessageContentViewSourceLength encoding:4];
  v3 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 3; ++i)
    [v3 appendString:v9[i]];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F466A8]) initWithSource:v3 injectionTime:1 forMainFrameOnly:0];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
  v7 = (void *)userScripts_userScripts;
  userScripts_userScripts = v6;

  for (uint64_t j = 2; j != -1; --j)
}

@end