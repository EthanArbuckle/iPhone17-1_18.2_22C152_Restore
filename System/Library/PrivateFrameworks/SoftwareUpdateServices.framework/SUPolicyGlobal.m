@interface SUPolicyGlobal
- (BOOL)checkAvailableSpace;
- (NSDictionary)updateMetricEventFields;
- (NSString)updateMetricContext;
- (SUPolicyGlobal)init;
- (SUPolicyGlobal)initWithGlobalOptions:(id)a3;
- (SUPolicyGlobalOptions)globalOptions;
- (id)_stringForBool:(BOOL)a3;
- (id)description;
- (int)cacheDeleteUrgency;
- (void)setGlobalOptions:(id)a3;
@end

@implementation SUPolicyGlobal

- (SUPolicyGlobal)init
{
  return [(SUPolicyGlobal *)self initWithGlobalOptions:0];
}

- (SUPolicyGlobal)initWithGlobalOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyGlobal;
  v5 = [(SUPolicyGlobal *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SUPolicyGlobal *)v5 setGlobalOptions:v4];
  }

  return v6;
}

- (int)cacheDeleteUrgency
{
  return 4;
}

- (BOOL)checkAvailableSpace
{
  return 0;
}

- (NSDictionary)updateMetricEventFields
{
  v2 = [(SUPolicyGlobal *)self globalOptions];
  v3 = [v2 updateMetricEventFields];

  return (NSDictionary *)v3;
}

- (NSString)updateMetricContext
{
  return (NSString *)@"SUS-2.0";
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SUPolicyGlobal *)self _stringForBool:[(SUPolicyGlobal *)self cacheDeleteUrgency] != 0];
  v5 = [(SUPolicyGlobal *)self _stringForBool:[(SUPolicyGlobal *)self checkAvailableSpace]];
  v6 = [(SUPolicyGlobal *)self updateMetricContext];
  v7 = [(SUPolicyGlobal *)self updateMetricEventFields];
  objc_super v8 = [v3 stringWithFormat:@"\n            cacheDeleteUrgency: %@\n            checkAvailableSpace: %@\n            updateMetricContext: %@\n            updateMetricEventFields: %@\n", v4, v5, v6, v7];

  return v8;
}

- (SUPolicyGlobalOptions)globalOptions
{
  return self->_globalOptions;
}

- (void)setGlobalOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end