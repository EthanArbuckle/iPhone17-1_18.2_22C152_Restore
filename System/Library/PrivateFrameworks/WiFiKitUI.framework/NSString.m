@interface NSString
@end

@implementation NSString

void __43__NSString_WiFiKitUI__formattedWiFiAddress__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = v4;
  if ((unint64_t)[v4 length] <= 1)
  {
    v3 = [NSString stringWithFormat:@"0%@", v4];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
}

@end