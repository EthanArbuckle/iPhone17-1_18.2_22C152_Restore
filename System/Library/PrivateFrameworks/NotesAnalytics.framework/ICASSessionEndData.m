@interface ICASSessionEndData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASEndReason)endReason;
- (ICASSessionEndData)initWithEndReason:(id)a3;
- (id)toDict;
@end

@implementation ICASSessionEndData

- (ICASSessionEndData)initWithEndReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSessionEndData;
  v6 = [(ICASSessionEndData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endReason, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SessionEndData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"endReason";
  v3 = [(ICASSessionEndData *)self endReason];
  if (v3)
  {
    uint64_t v4 = [(ICASSessionEndData *)self endReason];
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

- (ICASEndReason)endReason
{
  return self->_endReason;
}

- (void).cxx_destruct
{
}

@end