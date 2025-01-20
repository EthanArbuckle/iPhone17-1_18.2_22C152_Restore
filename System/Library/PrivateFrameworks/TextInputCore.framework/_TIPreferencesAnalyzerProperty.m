@interface _TIPreferencesAnalyzerProperty
- (NSString)domain;
- (NSString)key;
- (_TIPreferencesAnalyzerProperty)initWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 reportingMode:(int)a6;
- (id)defaultValue;
- (int)reportingMode;
- (void)setDefaultValue:(id)a3;
- (void)setDomain:(id)a3;
- (void)setKey:(id)a3;
- (void)setReportingMode:(int)a3;
@end

@implementation _TIPreferencesAnalyzerProperty

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setReportingMode:(int)a3
{
  self->_reportingMode = a3;
}

- (int)reportingMode
{
  return self->_reportingMode;
}

- (void)setDefaultValue:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (_TIPreferencesAnalyzerProperty)initWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 reportingMode:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_TIPreferencesAnalyzerProperty;
  v14 = [(_TIPreferencesAnalyzerProperty *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_key, a3);
    objc_storeStrong((id *)&v15->_domain, a4);
    objc_storeStrong(&v15->_defaultValue, a5);
    v15->_reportingMode = a6;
  }

  return v15;
}

@end