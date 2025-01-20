@interface NSOutputStream(SafariCoreExtras)
- (BOOL)safari_writeNetworkOrderUInt16:()SafariCoreExtras;
- (BOOL)safari_writeNetworkOrderUInt32:()SafariCoreExtras;
@end

@implementation NSOutputStream(SafariCoreExtras)

- (BOOL)safari_writeNetworkOrderUInt16:()SafariCoreExtras
{
  __int16 v4 = __rev16(a3);
  return [a1 write:&v4 maxLength:2] == 2;
}

- (BOOL)safari_writeNetworkOrderUInt32:()SafariCoreExtras
{
  unsigned int v4 = bswap32(a3);
  return [a1 write:&v4 maxLength:4] == 4;
}

@end