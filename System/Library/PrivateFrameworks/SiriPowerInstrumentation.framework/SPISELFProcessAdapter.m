@interface SPISELFProcessAdapter
+ (int)translateProcess:(unsigned __int8)a3;
@end

@implementation SPISELFProcessAdapter

+ (int)translateProcess:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u) {
    return 0;
  }
  else {
    return dword_1C6BD44D8[(char)(a3 - 1)];
  }
}

@end