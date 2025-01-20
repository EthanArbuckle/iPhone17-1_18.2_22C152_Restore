@interface PGDiscoveryFeedGenerationOptions
- (PGDiscoveryFeedGenerationOptions)initWithDictionaryRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)discoveryRankingMode;
- (void)setDiscoveryRankingMode:(unint64_t)a3;
@end

@implementation PGDiscoveryFeedGenerationOptions

- (void)setDiscoveryRankingMode:(unint64_t)a3
{
  self->_discoveryRankingMode = a3;
}

- (unint64_t)discoveryRankingMode
{
  return self->_discoveryRankingMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_discoveryRankingMode;
  return result;
}

- (PGDiscoveryFeedGenerationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGDiscoveryFeedGenerationOptions;
  v5 = [(PGDiscoveryFeedGenerationOptions *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8AE80]];
    v7 = v6;
    if (v6) {
      unint64_t v8 = [v6 unsignedIntValue];
    }
    else {
      unint64_t v8 = 0;
    }
    v5->_discoveryRankingMode = v8;
  }
  return v5;
}

@end