@interface ZOTMainScreenScaleFactor
@end

@implementation ZOTMainScreenScaleFactor

void __ZOTMainScreenScaleFactor_block_invoke(id a1)
{
  AXDeviceGetMainScreenScaleFactor();
  ZOTMainScreenScaleFactor_kZOTMainScreenScaleFactor = v1;
}

@end