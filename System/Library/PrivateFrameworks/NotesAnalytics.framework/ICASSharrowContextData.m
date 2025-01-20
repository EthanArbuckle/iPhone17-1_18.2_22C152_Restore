@interface ICASSharrowContextData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSharrowContextData)initWithSharrowSelectedItem:(id)a3;
- (NSString)sharrowSelectedItem;
- (id)toDict;
@end

@implementation ICASSharrowContextData

- (ICASSharrowContextData)initWithSharrowSelectedItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSharrowContextData;
  v6 = [(ICASSharrowContextData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sharrowSelectedItem, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SharrowContextData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"sharrowSelectedItem";
  v3 = [(ICASSharrowContextData *)self sharrowSelectedItem];
  if (v3)
  {
    uint64_t v4 = [(ICASSharrowContextData *)self sharrowSelectedItem];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (NSString)sharrowSelectedItem
{
  return self->_sharrowSelectedItem;
}

- (void).cxx_destruct
{
}

@end