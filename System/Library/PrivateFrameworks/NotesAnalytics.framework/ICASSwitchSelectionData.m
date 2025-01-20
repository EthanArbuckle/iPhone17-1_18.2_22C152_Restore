@interface ICASSwitchSelectionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSwitchSelectionData)initWithSwitchSelectionType:(id)a3;
- (ICASSwitchSelectionType)switchSelectionType;
- (id)toDict;
@end

@implementation ICASSwitchSelectionData

- (ICASSwitchSelectionData)initWithSwitchSelectionType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSwitchSelectionData;
  v6 = [(ICASSwitchSelectionData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_switchSelectionType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SwitchSelectionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"switchSelectionType";
  v3 = [(ICASSwitchSelectionData *)self switchSelectionType];
  if (v3)
  {
    uint64_t v4 = [(ICASSwitchSelectionData *)self switchSelectionType];
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

- (ICASSwitchSelectionType)switchSelectionType
{
  return self->_switchSelectionType;
}

- (void).cxx_destruct
{
}

@end