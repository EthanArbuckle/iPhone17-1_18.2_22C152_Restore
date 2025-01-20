@interface DCIM
@end

@implementation DCIM

void __DCIM_IS_PAD_block_invoke()
{
  if (NSClassFromString((NSString *)@"UIDevice"))
  {
    v0 = [NSClassFromString((NSString *)@"UIDevice") currentDevice];
    uint64_t v1 = [v0 userInterfaceIdiom];

    DCIM_IS_PAD_retval = v1 == 1;
  }
}

@end