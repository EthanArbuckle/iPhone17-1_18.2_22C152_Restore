@interface NSDictionary(NFTransportService)
+ (uint64_t)getDictionaryKeyTransportLabel;
- (id)encodeToCBOR;
- (id)transportLabel;
@end

@implementation NSDictionary(NFTransportService)

- (id)transportLabel
{
  v2 = [NSNumber numberWithInt:0];
  v3 = [a1 objectForKey:v2];

  return v3;
}

+ (uint64_t)getDictionaryKeyTransportLabel
{
  return [NSNumber numberWithInt:0];
}

- (id)encodeToCBOR
{
  v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__NSDictionary_NFTransportService__encodeToCBOR__block_invoke;
  v8[3] = &unk_1E595D1B8;
  v8[4] = a1;
  uint64_t v10 = a2;
  id v5 = v4;
  id v9 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  if ([v5 count])
  {
    v6 = [getCBORClass() cborWithDictionary:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end