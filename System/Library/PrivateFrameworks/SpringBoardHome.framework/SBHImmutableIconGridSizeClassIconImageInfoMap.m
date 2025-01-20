@interface SBHImmutableIconGridSizeClassIconImageInfoMap
- (SBHImmutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3;
- (id)_iconImageInfos;
@end

@implementation SBHImmutableIconGridSizeClassIconImageInfoMap

- (SBHImmutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHImmutableIconGridSizeClassIconImageInfoMap;
  v5 = [(SBHIconGridSizeClassIconImageInfoMap *)&v9 initWithIconImageInfos:v4];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    iconImageInfos = v5->_iconImageInfos;
    v5->_iconImageInfos = (NSDictionary *)v6;
  }
  return v5;
}

- (id)_iconImageInfos
{
  return self->_iconImageInfos;
}

- (void).cxx_destruct
{
}

@end