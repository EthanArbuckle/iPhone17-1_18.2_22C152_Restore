@interface ICASUserSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASUserSnapshotItemData)initWithUserID:(id)a3 userStorefrontID:(id)a4;
- (NSString)userID;
- (NSString)userStorefrontID;
- (id)toDict;
@end

@implementation ICASUserSnapshotItemData

- (ICASUserSnapshotItemData)initWithUserID:(id)a3 userStorefrontID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASUserSnapshotItemData;
  v9 = [(ICASUserSnapshotItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userID, a3);
    objc_storeStrong((id *)&v10->_userStorefrontID, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"UserSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"userID";
  v3 = [(ICASUserSnapshotItemData *)self userID];
  if (v3)
  {
    uint64_t v4 = [(ICASUserSnapshotItemData *)self userID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"userStorefrontID";
  v12[0] = v4;
  v6 = [(ICASUserSnapshotItemData *)self userStorefrontID];
  if (v6)
  {
    uint64_t v7 = [(ICASUserSnapshotItemData *)self userStorefrontID];
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

- (NSString)userID
{
  return self->_userID;
}

- (NSString)userStorefrontID
{
  return self->_userStorefrontID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end