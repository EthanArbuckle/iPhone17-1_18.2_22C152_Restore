@interface PFLSharedJetsamInfo
@end

@implementation PFLSharedJetsamInfo

void __40___PFLSharedJetsamInfo_sharedJetsamInfo__block_invoke()
{
  if (!sharedJetsamInfo_sharedJetsamInfo)
  {
    sharedJetsamInfo_sharedJetsamInfo = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

@end