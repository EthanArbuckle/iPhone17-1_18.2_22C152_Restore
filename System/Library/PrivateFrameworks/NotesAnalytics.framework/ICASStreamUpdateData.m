@interface ICASStreamUpdateData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASStreamUpdateData)initWithHasUpdates:(id)a3;
- (NSNumber)hasUpdates;
- (id)toDict;
@end

@implementation ICASStreamUpdateData

- (ICASStreamUpdateData)initWithHasUpdates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASStreamUpdateData;
  v6 = [(ICASStreamUpdateData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hasUpdates, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"StreamUpdateData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"hasUpdates";
  v3 = [(ICASStreamUpdateData *)self hasUpdates];
  if (v3)
  {
    uint64_t v4 = [(ICASStreamUpdateData *)self hasUpdates];
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

- (NSNumber)hasUpdates
{
  return self->_hasUpdates;
}

- (void).cxx_destruct
{
}

@end