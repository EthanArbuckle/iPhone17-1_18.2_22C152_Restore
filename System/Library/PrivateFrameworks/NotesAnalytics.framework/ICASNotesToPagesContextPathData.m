@interface ICASNotesToPagesContextPathData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNotesToPagesContextPath)notesToPagesContextPath;
- (ICASNotesToPagesContextPathData)initWithNotesToPagesContextPath:(id)a3;
- (id)toDict;
@end

@implementation ICASNotesToPagesContextPathData

- (ICASNotesToPagesContextPathData)initWithNotesToPagesContextPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASNotesToPagesContextPathData;
  v6 = [(ICASNotesToPagesContextPathData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notesToPagesContextPath, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"NotesToPagesContextPathData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"notesToPagesContextPath";
  v3 = [(ICASNotesToPagesContextPathData *)self notesToPagesContextPath];
  if (v3)
  {
    uint64_t v4 = [(ICASNotesToPagesContextPathData *)self notesToPagesContextPath];
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

- (ICASNotesToPagesContextPath)notesToPagesContextPath
{
  return self->_notesToPagesContextPath;
}

- (void).cxx_destruct
{
}

@end