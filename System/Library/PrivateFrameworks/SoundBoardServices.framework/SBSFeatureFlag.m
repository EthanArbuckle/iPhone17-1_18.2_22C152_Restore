@interface SBSFeatureFlag
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)value;
- (NSString)domain;
- (NSString)feature;
- (SBSFeatureFlag)initWith:(id)a3 andFeature:(id)a4 andValue:(id)a5;
- (SBSFeatureFlag)initWithDictionaryRepresentation:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFeature:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SBSFeatureFlag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setFeature:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v2 = *(_OWORD *)&self->_domain;
  v5[0] = @"domain";
  v5[1] = @"feature";
  long long v6 = v2;
  v5[2] = @"value";
  value = self->_value;
  v3 = [NSDictionary dictionaryWithObjects:&v6 forKeys:v5 count:3];
  return (NSDictionary *)v3;
}

- (SBSFeatureFlag)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBSFeatureFlag;
  v5 = [(SBSFeatureFlag *)&v19 init];
  if (!v5) {
    goto LABEL_6;
  }
  long long v6 = [v4 objectForKeyedSubscript:@"domain"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v7 = [v4 objectForKeyedSubscript:@"feature"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"feature"];
    feature = v5->_feature;
    v5->_feature = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v14;

LABEL_6:
    v16 = v5;
    goto LABEL_12;
  }
LABEL_9:
  v17 = _SBSLoggingFacility();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SBSFeatureFlag initWithDictionaryRepresentation:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_error_impl(&dword_230B2C000, v17, OS_LOG_TYPE_ERROR, "%s: Trying to set feature flag with incorrect entry: %@", buf, 0x16u);
  }

  v16 = 0;
LABEL_12:

  return v16;
}

- (SBSFeatureFlag)initWith:(id)a3 andFeature:(id)a4 andValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBSFeatureFlag;
  uint64_t v12 = [(SBSFeatureFlag *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domain, a3);
    objc_storeStrong((id *)&v13->_feature, a4);
    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

@end