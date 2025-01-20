@interface PCInfo
@end

@implementation PCInfo

Class __PCInfo_IsUnitTesting_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  PCInfo_IsUnitTesting::sIsUnitTesting = result != 0;
  return result;
}

@end