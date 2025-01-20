@interface PRSPosterUpdatePayload
+ (BOOL)supportsSecureCoding;
+ (id)nullPayload;
- (id)_init;
- (id)rawValue;
@end

@implementation PRSPosterUpdatePayload

+ (id)nullPayload
{
  id v2 = [[PRSPosterUpdatePayload alloc] _init];
  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdatePayload;
  return [(PRSPosterUpdatePayload *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)[MEMORY[0x1E4F1CA98] null];
}

@end