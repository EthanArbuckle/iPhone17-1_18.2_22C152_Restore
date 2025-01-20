@interface ICASFastSyncParticipantData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFastSyncParticipantData)initWithCountOfUniqueAccounts:(id)a3 countOfUniqueDevices:(id)a4;
- (NSNumber)countOfUniqueAccounts;
- (NSNumber)countOfUniqueDevices;
- (id)toDict;
@end

@implementation ICASFastSyncParticipantData

- (ICASFastSyncParticipantData)initWithCountOfUniqueAccounts:(id)a3 countOfUniqueDevices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASFastSyncParticipantData;
  v9 = [(ICASFastSyncParticipantData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countOfUniqueAccounts, a3);
    objc_storeStrong((id *)&v10->_countOfUniqueDevices, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"FastSyncParticipantData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"countOfUniqueAccounts";
  v3 = [(ICASFastSyncParticipantData *)self countOfUniqueAccounts];
  if (v3)
  {
    uint64_t v4 = [(ICASFastSyncParticipantData *)self countOfUniqueAccounts];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"countOfUniqueDevices";
  v12[0] = v4;
  v6 = [(ICASFastSyncParticipantData *)self countOfUniqueDevices];
  if (v6)
  {
    uint64_t v7 = [(ICASFastSyncParticipantData *)self countOfUniqueDevices];
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

- (NSNumber)countOfUniqueAccounts
{
  return self->_countOfUniqueAccounts;
}

- (NSNumber)countOfUniqueDevices
{
  return self->_countOfUniqueDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfUniqueDevices, 0);
  objc_storeStrong((id *)&self->_countOfUniqueAccounts, 0);
}

@end