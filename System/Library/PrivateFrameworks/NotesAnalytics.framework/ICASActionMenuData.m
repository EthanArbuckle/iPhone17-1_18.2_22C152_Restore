@interface ICASActionMenuData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASActionMenuContextType)actionMenuContextType;
- (ICASActionMenuData)initWithActionMenuUsageType:(id)a3 actionMenuContextType:(id)a4 actionMenuSelection:(id)a5;
- (ICASActionMenuUsageType)actionMenuUsageType;
- (NSString)actionMenuSelection;
- (id)toDict;
@end

@implementation ICASActionMenuData

- (ICASActionMenuData)initWithActionMenuUsageType:(id)a3 actionMenuContextType:(id)a4 actionMenuSelection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASActionMenuData;
  v12 = [(ICASActionMenuData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionMenuUsageType, a3);
    objc_storeStrong((id *)&v13->_actionMenuContextType, a4);
    objc_storeStrong((id *)&v13->_actionMenuSelection, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"ActionMenuData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"actionMenuUsageType";
  v3 = [(ICASActionMenuData *)self actionMenuUsageType];
  if (v3)
  {
    uint64_t v4 = [(ICASActionMenuData *)self actionMenuUsageType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"actionMenuContextType";
  v6 = [(ICASActionMenuData *)self actionMenuContextType];
  if (v6)
  {
    uint64_t v7 = [(ICASActionMenuData *)self actionMenuContextType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"actionMenuSelection";
  id v9 = [(ICASActionMenuData *)self actionMenuSelection];
  if (v9)
  {
    uint64_t v10 = [(ICASActionMenuData *)self actionMenuSelection];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASActionMenuUsageType)actionMenuUsageType
{
  return self->_actionMenuUsageType;
}

- (ICASActionMenuContextType)actionMenuContextType
{
  return self->_actionMenuContextType;
}

- (NSString)actionMenuSelection
{
  return self->_actionMenuSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuSelection, 0);
  objc_storeStrong((id *)&self->_actionMenuContextType, 0);
  objc_storeStrong((id *)&self->_actionMenuUsageType, 0);
}

@end