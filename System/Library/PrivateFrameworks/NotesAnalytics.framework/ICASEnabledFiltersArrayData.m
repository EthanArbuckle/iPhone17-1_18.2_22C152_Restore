@interface ICASEnabledFiltersArrayData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEnabledFiltersArrayData)initWithFilterType:(id)a3 filterValue:(id)a4;
- (NSString)filterType;
- (NSString)filterValue;
- (id)toDict;
@end

@implementation ICASEnabledFiltersArrayData

- (ICASEnabledFiltersArrayData)initWithFilterType:(id)a3 filterValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASEnabledFiltersArrayData;
  v9 = [(ICASEnabledFiltersArrayData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filterType, a3);
    objc_storeStrong((id *)&v10->_filterValue, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"EnabledFiltersArrayData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"filterType";
  v3 = [(ICASEnabledFiltersArrayData *)self filterType];
  if (v3)
  {
    uint64_t v4 = [(ICASEnabledFiltersArrayData *)self filterType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"filterValue";
  v12[0] = v4;
  v6 = [(ICASEnabledFiltersArrayData *)self filterValue];
  if (v6)
  {
    uint64_t v7 = [(ICASEnabledFiltersArrayData *)self filterValue];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (NSString)filterValue
{
  return self->_filterValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterValue, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end