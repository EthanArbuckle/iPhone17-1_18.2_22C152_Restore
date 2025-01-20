@interface ICASTagRenameData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTagRenameApproach)tagRenameApproach;
- (ICASTagRenameData)initWithTagRenameApproach:(id)a3;
- (id)toDict;
@end

@implementation ICASTagRenameData

- (ICASTagRenameData)initWithTagRenameApproach:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASTagRenameData;
  v6 = [(ICASTagRenameData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tagRenameApproach, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"TagRenameData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"tagRenameApproach";
  v3 = [(ICASTagRenameData *)self tagRenameApproach];
  if (v3)
  {
    uint64_t v4 = [(ICASTagRenameData *)self tagRenameApproach];
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

- (ICASTagRenameApproach)tagRenameApproach
{
  return self->_tagRenameApproach;
}

- (void).cxx_destruct
{
}

@end