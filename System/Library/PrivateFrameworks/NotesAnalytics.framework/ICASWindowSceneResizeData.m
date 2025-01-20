@interface ICASWindowSceneResizeData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASWindowSceneResizeData)initWithUsesMultiWindow:(id)a3;
- (NSNumber)usesMultiWindow;
- (id)toDict;
@end

@implementation ICASWindowSceneResizeData

- (ICASWindowSceneResizeData)initWithUsesMultiWindow:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASWindowSceneResizeData;
  v6 = [(ICASWindowSceneResizeData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_usesMultiWindow, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"WindowSceneResizeData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"usesMultiWindow";
  v3 = [(ICASWindowSceneResizeData *)self usesMultiWindow];
  if (v3)
  {
    uint64_t v4 = [(ICASWindowSceneResizeData *)self usesMultiWindow];
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

- (NSNumber)usesMultiWindow
{
  return self->_usesMultiWindow;
}

- (void).cxx_destruct
{
}

@end