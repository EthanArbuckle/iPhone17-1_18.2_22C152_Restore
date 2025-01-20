@interface RERelevanceProvider
+ (id)customRelevanceProviderForFeature:(id)a3 withValue:(id)a4;
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (RERelevanceProvider)init;
- (RERelevanceProvider)providerWithPriority:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryEncoding;
- (id)environment;
- (unint64_t)_hash;
- (unint64_t)hash;
- (unint64_t)relevancePriority;
- (void)setEnvironment:(id)a3;
@end

@implementation RERelevanceProvider

- (RERelevanceProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)RERelevanceProvider;
  result = [(RERelevanceProvider *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_cachedHash = xmmword_21E7EAA70;
  }
  return result;
}

- (void).cxx_destruct
{
}

+ (id)customRelevanceProviderForFeature:(id)a3 withValue:(id)a4
{
  id v5 = a3;
  v6 = (const void *)RECreateFeatureValueTaggedPointer(a4);
  v7 = [[RECustomRelevanceProvider alloc] initWithFeature:v5 value:v6];

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)relevanceSimulatorID
{
  return &stru_26CFA57D0;
}

- (id)dictionaryEncoding
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 1) = self->_cachedHash;
  *((void *)result + 2) = self->_priority;
  return result;
}

- (unint64_t)relevancePriority
{
  return self->_priority;
}

- (RERelevanceProvider)providerWithPriority:(unint64_t)a3
{
  v4 = (void *)[(RERelevanceProvider *)self copy];
  v4[1] = 0;
  v4[2] = a3;
  return (RERelevanceProvider *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_priority == self->_priority;
  }

  return v5;
}

- (unint64_t)_hash
{
  return 0;
}

- (unint64_t)hash
{
  unint64_t result = self->_cachedHash;
  if (!result)
  {
    unint64_t priority = self->_priority;
    unint64_t v5 = [(RERelevanceProvider *)self _hash];
    if (v5 != priority << 32) {
      unint64_t result = v5 ^ (priority << 32);
    }
    else {
      unint64_t result = -1;
    }
    self->_cachedHash = result;
  }
  return result;
}

- (void)setEnvironment:(id)a3
{
}

- (id)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return WeakRetained;
}

@end