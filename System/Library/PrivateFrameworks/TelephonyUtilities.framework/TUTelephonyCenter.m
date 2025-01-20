@interface TUTelephonyCenter
@end

@implementation TUTelephonyCenter

void ___TUTelephonyCenter_block_invoke()
{
}

uint64_t ___TUTelephonyCenter_block_invoke_2()
{
  CFRunLoopGetCurrent();
  CTTelephonyCenterSetDefaultRunloop();
  uint64_t result = CTTelephonyCenterGetDefault();
  _TUTelephonyCenter_tc = result;
  return result;
}

@end