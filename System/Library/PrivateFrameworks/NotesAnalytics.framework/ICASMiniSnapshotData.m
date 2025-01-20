@interface ICASMiniSnapshotData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASMiniSnapshotData)initWithMiniAccountSummary:(id)a3;
- (NSArray)miniAccountSummary;
- (id)toDict;
@end

@implementation ICASMiniSnapshotData

- (ICASMiniSnapshotData)initWithMiniAccountSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASMiniSnapshotData;
  v6 = [(ICASMiniSnapshotData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_miniAccountSummary, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"MiniSnapshotData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"miniAccountSummary";
  v3 = [(ICASMiniSnapshotData *)self miniAccountSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASMiniSnapshotData *)self miniAccountSummary];
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

- (NSArray)miniAccountSummary
{
  return self->_miniAccountSummary;
}

- (void).cxx_destruct
{
}

@end