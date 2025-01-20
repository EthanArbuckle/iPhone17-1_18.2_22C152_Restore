@interface ICASPrivateEventData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPrivateEventData)initWithPrivateSessionID:(id)a3 sessionDetailType:(id)a4;
- (ICASSessionDetailType)sessionDetailType;
- (NSString)privateSessionID;
- (id)toDict;
@end

@implementation ICASPrivateEventData

- (ICASPrivateEventData)initWithPrivateSessionID:(id)a3 sessionDetailType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASPrivateEventData;
  v9 = [(ICASPrivateEventData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateSessionID, a3);
    objc_storeStrong((id *)&v10->_sessionDetailType, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"PrivateEventData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"privateSessionID";
  v3 = [(ICASPrivateEventData *)self privateSessionID];
  if (v3)
  {
    uint64_t v4 = [(ICASPrivateEventData *)self privateSessionID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"sessionDetailType";
  v12[0] = v4;
  v6 = [(ICASPrivateEventData *)self sessionDetailType];
  if (v6)
  {
    uint64_t v7 = [(ICASPrivateEventData *)self sessionDetailType];
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

- (NSString)privateSessionID
{
  return self->_privateSessionID;
}

- (ICASSessionDetailType)sessionDetailType
{
  return self->_sessionDetailType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDetailType, 0);
  objc_storeStrong((id *)&self->_privateSessionID, 0);
}

@end