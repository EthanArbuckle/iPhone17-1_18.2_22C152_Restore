@interface ICASWindowSceneData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASWindowSceneData)initWithWindowSceneID:(id)a3;
- (NSString)windowSceneID;
- (id)toDict;
@end

@implementation ICASWindowSceneData

- (ICASWindowSceneData)initWithWindowSceneID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASWindowSceneData;
  v6 = [(ICASWindowSceneData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_windowSceneID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"WindowSceneData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"windowSceneID";
  v3 = [(ICASWindowSceneData *)self windowSceneID];
  if (v3)
  {
    uint64_t v4 = [(ICASWindowSceneData *)self windowSceneID];
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

- (NSString)windowSceneID
{
  return self->_windowSceneID;
}

- (void).cxx_destruct
{
}

@end