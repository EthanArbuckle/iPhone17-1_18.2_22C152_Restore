@interface RPTScrollViewTestParametersDefaultVersion
@end

@implementation RPTScrollViewTestParametersDefaultVersion

void ___RPTScrollViewTestParametersDefaultVersion_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [v0 valueForKey:@"RPTScrollViewTestParametersForceVersion"];

  v1 = v2;
  if (v2)
  {
    _RPTScrollViewTestParametersDefaultVersion_version = [v2 integerValue];
    v1 = v2;
  }
}

@end