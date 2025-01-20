@interface SBHMutableIconGridSizeClassIconImageInfoMap
- (SBHMutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3;
- (id)_iconImageInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4;
@end

@implementation SBHMutableIconGridSizeClassIconImageInfoMap

- (id)_iconImageInfos
{
  return self->_iconImageInfos;
}

- (SBHMutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMutableIconGridSizeClassIconImageInfoMap;
  v5 = [(SBHIconGridSizeClassIconImageInfoMap *)&v9 initWithIconImageInfos:v4];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    iconImageInfos = v5->_iconImageInfos;
    v5->_iconImageInfos = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  v16 = a3;
  if (!self->_iconImageInfos)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iconImageInfos = self->_iconImageInfos;
    self->_iconImageInfos = v13;
  }
  v15 = objc_msgSend(MEMORY[0x1E4F29238], "sbh_valueWithSBIconImageInfo:", v11, v10, v9, v8);
  [(NSMutableDictionary *)self->_iconImageInfos setObject:v15 forKey:v16];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[SBHIconGridSizeClassIconImageInfoMap allocWithZone:a3];
  return [(SBHIconGridSizeClassIconImageInfoMap *)v4 initWithIconGridSizeClassIconImageInfoMap:self];
}

- (void).cxx_destruct
{
}

@end