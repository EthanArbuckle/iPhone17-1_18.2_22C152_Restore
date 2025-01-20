@interface SUPolicyGlobalOptions
- (NSDictionary)updateMetricEventFields;
- (SUPolicyGlobalOptions)init;
- (id)description;
- (void)appendUpdateMetricEventFields:(id)a3;
- (void)setUpdateMetricEventFields:(id)a3;
@end

@implementation SUPolicyGlobalOptions

- (SUPolicyGlobalOptions)init
{
  v9[2] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)SUPolicyGlobalOptions;
  v2 = [(SUPolicyGlobalOptions *)&v7 init];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F78068];
    v8[0] = *MEMORY[0x263F77F28];
    v8[1] = v3;
    v9[0] = @"SUS-2.0";
    v9[1] = @"SUS-2.0";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    updateMetricEventFields = v2->_updateMetricEventFields;
    v2->_updateMetricEventFields = (NSDictionary *)v4;
  }
  return v2;
}

- (void)appendUpdateMetricEventFields:(id)a3
{
  updateMetricEventFields = self->_updateMetricEventFields;
  v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  if (updateMetricEventFields) {
    objc_super v7 = (NSDictionary *)[[v5 alloc] initWithDictionary:self->_updateMetricEventFields];
  }
  else {
    objc_super v7 = (NSDictionary *)objc_alloc_init(v5);
  }
  v8 = v7;
  [(NSDictionary *)v7 addEntriesFromDictionary:v6];

  v9 = self->_updateMetricEventFields;
  self->_updateMetricEventFields = v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\n            updateMetricEventFields: %@\n", self->_updateMetricEventFields];
}

- (NSDictionary)updateMetricEventFields
{
  return self->_updateMetricEventFields;
}

- (void)setUpdateMetricEventFields:(id)a3
{
}

- (void).cxx_destruct
{
}

@end