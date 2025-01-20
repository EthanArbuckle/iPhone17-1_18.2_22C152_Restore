@interface PGCountrySize
+ (BOOL)isLargeCountry:(id)a3;
@end

@implementation PGCountrySize

+ (BOOL)isLargeCountry:(id)a3
{
  uint64_t v3 = isLargeCountry__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isLargeCountry__onceToken, &__block_literal_global_30019);
  }
  char v5 = [(id)isLargeCountry__largeCountries containsObject:v4];

  return v5;
}

void __32__PGCountrySize_isLargeCountry___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"US", @"CA", @"GB", 0);
  v1 = (void *)isLargeCountry__largeCountries;
  isLargeCountry__largeCountries = v0;
}

@end