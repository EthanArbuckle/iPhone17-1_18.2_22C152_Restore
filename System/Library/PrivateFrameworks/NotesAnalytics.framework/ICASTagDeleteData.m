@interface ICASTagDeleteData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTagDeleteApproach)tagDeleteApproach;
- (ICASTagDeleteData)initWithTagDeleteApproach:(id)a3;
- (id)toDict;
@end

@implementation ICASTagDeleteData

- (ICASTagDeleteData)initWithTagDeleteApproach:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASTagDeleteData;
  v6 = [(ICASTagDeleteData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tagDeleteApproach, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"TagDeleteData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"tagDeleteApproach";
  v3 = [(ICASTagDeleteData *)self tagDeleteApproach];
  if (v3)
  {
    uint64_t v4 = [(ICASTagDeleteData *)self tagDeleteApproach];
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

- (ICASTagDeleteApproach)tagDeleteApproach
{
  return self->_tagDeleteApproach;
}

- (void).cxx_destruct
{
}

@end