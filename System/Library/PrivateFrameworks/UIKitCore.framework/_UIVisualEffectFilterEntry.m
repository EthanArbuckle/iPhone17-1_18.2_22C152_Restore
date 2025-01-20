@interface _UIVisualEffectFilterEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (BOOL)useRelaxedDiffingRule;
- (CAFilter)filter;
- (NSDictionary)configurationValues;
- (NSDictionary)identityValues;
- (NSDictionary)requestedValues;
- (NSString)description;
- (NSString)filterName;
- (NSString)filterType;
- (_UIVisualEffectFilterEntry)initWithFilterType:(id)a3 configurationValues:(id)a4 requestedValues:(id)a5 identityValues:(id)a6;
- (double)identityScaleHint;
- (double)requestedScaleHint;
- (double)scaleHintAsRequested:(BOOL)a3;
- (id)copyForTransitionOut;
- (id)copyForTransitionToEffect:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueAsRequested:(BOOL)a3;
- (void)convertToIdentity;
- (void)forceUniqueName;
- (void)setConfigurationValues:(id)a3;
- (void)setFilterType:(id)a3;
- (void)setIdentityScaleHint:(double)a3;
- (void)setIdentityValues:(id)a3;
- (void)setRequestedScaleHint:(double)a3;
- (void)setRequestedValues:(id)a3;
- (void)setUseRelaxedDiffingRule:(BOOL)a3;
@end

@implementation _UIVisualEffectFilterEntry

- (CAFilter)filter
{
  filter = self->_filter;
  if (!filter)
  {
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:self->_filterType];
    v5 = self->_filter;
    self->_filter = v4;

    [(CAFilter *)self->_filter setName:self->_filterName];
    configurationValues = self->_configurationValues;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36___UIVisualEffectFilterEntry_filter__block_invoke;
    v8[3] = &unk_1E52DD258;
    v8[4] = self;
    [(NSDictionary *)configurationValues enumerateKeysAndObjectsUsingBlock:v8];
    filter = self->_filter;
  }
  return filter;
}

- (_UIVisualEffectFilterEntry)initWithFilterType:(id)a3 configurationValues:(id)a4 requestedValues:(id)a5 identityValues:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UIVisualEffectFilterEntry;
  v14 = [(_UIVisualEffectFilterEntry *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    filterType = v14->_filterType;
    v14->_filterType = (NSString *)v15;

    objc_storeStrong((id *)&v14->_filterName, v14->_filterType);
    uint64_t v17 = [v11 copy];
    configurationValues = v14->_configurationValues;
    v14->_configurationValues = (NSDictionary *)v17;

    uint64_t v19 = [v12 copy];
    requestedValues = v14->_requestedValues;
    v14->_requestedValues = (NSDictionary *)v19;

    uint64_t v21 = [v13 copy];
    identityValues = v14->_identityValues;
    v14->_identityValues = (NSDictionary *)v21;
  }
  return v14;
}

- (void)setRequestedScaleHint:(double)a3
{
  self->_requestedScaleHint = a3;
}

- (void)setIdentityScaleHint:(double)a3
{
  self->_identityScaleHint = a3;
}

- (void)setUseRelaxedDiffingRule:(BOOL)a3
{
  self->_useRelaxedDiffingRule = a3;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (double)scaleHintAsRequested:(BOOL)a3
{
  uint64_t v3 = 64;
  if (a3) {
    uint64_t v3 = 56;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (void)forceUniqueName
{
  uint64_t v3 = [NSString stringWithFormat:@"%@[%p]", self->_filterType, self];
  filterName = self->_filterName;
  self->_filterName = v3;
}

- (id)valueAsRequested:(BOOL)a3
{
  uint64_t v3 = 48;
  if (a3) {
    uint64_t v3 = 40;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_identityValues, 0);
  objc_storeStrong((id *)&self->_requestedValues, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFilterType:self->_filterType configurationValues:self->_configurationValues requestedValues:self->_requestedValues identityValues:self->_identityValues];
  [v4 setRequestedScaleHint:self->_requestedScaleHint];
  [v4 setIdentityScaleHint:self->_identityScaleHint];
  return v4;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  v4 = (id *)a3;
  if (v4)
  {
    v5 = self->_filterType;
    v6 = (NSString *)v4[3];
    if (self->_useRelaxedDiffingRule && *((unsigned char *)v4 + 16))
    {
      v7 = 0;
      id v8 = 0;
    }
    else
    {
      v7 = self->_configurationValues;
      id v8 = v4[4];
    }
    v9 = (NSDictionary *)v8;
    id v10 = v9;
    if (v5 == v6 && v7 == v9)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v5 && v6 && v7 && v9)
      {
        if ([(NSString *)v5 isEqualToString:v6]) {
          char v12 = [(NSDictionary *)v7 isEqualToDictionary:v10];
        }
        else {
          char v12 = 0;
        }
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)copyForTransitionToEffect:(id)a3
{
  v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithFilterType:self->_filterType configurationValues:self->_configurationValues requestedValues:v4[5] identityValues:self->_requestedValues];
  uint64_t v6 = v4[7];

  *(void *)(v5 + 56) = v6;
  *(double *)(v5 + 64) = self->_requestedScaleHint;
  return (id)v5;
}

- (id)copyForTransitionOut
{
  uint64_t v2 = [(_UIVisualEffectFilterEntry *)self copy];
  id v3 = *(id *)(v2 + 40);
  objc_storeStrong((id *)(v2 + 40), *(id *)(v2 + 48));
  v4 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = v3;
  id v5 = v3;

  *(int8x16_t *)(v2 + 56) = vextq_s8(*(int8x16_t *)(v2 + 56), *(int8x16_t *)(v2 + 56), 8uLL);
  return (id)v2;
}

- (void)convertToIdentity
{
  self->_requestedScaleHint = self->_identityScaleHint;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p>: filter=%@", v5, self, self->_filterType];

  NSUInteger v7 = [(NSDictionary *)self->_configurationValues count];
  if (v7 + [(NSDictionary *)self->_requestedValues count])
  {
    objc_msgSend(v6, "appendString:", @" parameters={(");
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    configurationValues = self->_configurationValues;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41___UIVisualEffectFilterEntry_description__block_invoke;
    v18[3] = &unk_1E52DD740;
    v20 = v21;
    id v9 = v6;
    id v19 = v9;
    [(NSDictionary *)configurationValues enumerateKeysAndObjectsUsingBlock:v18];
    requestedValues = self->_requestedValues;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41___UIVisualEffectFilterEntry_description__block_invoke_2;
    v14[3] = &unk_1E52DD768;
    uint64_t v17 = v21;
    id v11 = v9;
    id v15 = v11;
    v16 = self;
    [(NSDictionary *)requestedValues enumerateKeysAndObjectsUsingBlock:v14];
    [v11 appendString:@"}"]);

    _Block_object_dispose(v21, 8);
  }
  double requestedScaleHint = self->_requestedScaleHint;
  if (requestedScaleHint > 0.0) {
    objc_msgSend(v6, "appendFormat:", @" scale=[%f][%f]", *(void *)&self->_identityScaleHint, *(void *)&requestedScaleHint);
  }
  return (NSString *)v6;
}

- (void)setFilterType:(id)a3
{
}

- (NSDictionary)configurationValues
{
  return self->_configurationValues;
}

- (void)setConfigurationValues:(id)a3
{
}

- (NSDictionary)requestedValues
{
  return self->_requestedValues;
}

- (void)setRequestedValues:(id)a3
{
}

- (NSDictionary)identityValues
{
  return self->_identityValues;
}

- (void)setIdentityValues:(id)a3
{
}

- (double)requestedScaleHint
{
  return self->_requestedScaleHint;
}

- (double)identityScaleHint
{
  return self->_identityScaleHint;
}

- (BOOL)useRelaxedDiffingRule
{
  return self->_useRelaxedDiffingRule;
}

@end