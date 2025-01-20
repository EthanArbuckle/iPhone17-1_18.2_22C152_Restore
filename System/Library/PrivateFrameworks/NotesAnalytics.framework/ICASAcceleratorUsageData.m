@interface ICASAcceleratorUsageData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAcceleratorUsageData)initWithMaxNumCharTyped:(id)a3 endResultCount:(id)a4;
- (NSNumber)endResultCount;
- (NSNumber)maxNumCharTyped;
- (id)toDict;
@end

@implementation ICASAcceleratorUsageData

- (ICASAcceleratorUsageData)initWithMaxNumCharTyped:(id)a3 endResultCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASAcceleratorUsageData;
  v9 = [(ICASAcceleratorUsageData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_maxNumCharTyped, a3);
    objc_storeStrong((id *)&v10->_endResultCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"AcceleratorUsageData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"maxNumCharTyped";
  v3 = [(ICASAcceleratorUsageData *)self maxNumCharTyped];
  if (v3)
  {
    uint64_t v4 = [(ICASAcceleratorUsageData *)self maxNumCharTyped];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"endResultCount";
  v12[0] = v4;
  v6 = [(ICASAcceleratorUsageData *)self endResultCount];
  if (v6)
  {
    uint64_t v7 = [(ICASAcceleratorUsageData *)self endResultCount];
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

- (NSNumber)maxNumCharTyped
{
  return self->_maxNumCharTyped;
}

- (NSNumber)endResultCount
{
  return self->_endResultCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endResultCount, 0);
  objc_storeStrong((id *)&self->_maxNumCharTyped, 0);
}

@end