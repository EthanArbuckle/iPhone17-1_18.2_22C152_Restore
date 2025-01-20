@interface CKRecordID
- (BOOL)ic_isEqual:(id)a3;
- (BOOL)ic_isOwnedByCurrentUser;
- (id)ic_loggingDescription;
- (id)ic_loggingDescriptionIncludingBrackets:(BOOL)a3;
- (int64_t)rd_ckDatabaseScope;
@end

@implementation CKRecordID

- (id)ic_loggingDescriptionIncludingBrackets:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSMutableString string];
  v6 = v5;
  if (v3) {
    [v5 appendString:@"<"];
  }
  v7 = [(CKRecordID *)self recordName];
  [v6 appendString:v7];

  v8 = [(CKRecordID *)self zoneID];
  v9 = [v8 zoneName];
  [v6 appendFormat:@" %@", v9];

  v10 = [(CKRecordID *)self zoneID];
  v11 = [v10 ownerName];
  unsigned __int8 v12 = [v11 isEqualToString:CKCurrentUserDefaultName];

  if ((v12 & 1) == 0)
  {
    v13 = [(CKRecordID *)self zoneID];
    v14 = [v13 ownerName];
    [v6 appendFormat:@" %@", v14];
  }
  v15 = [(CKRecordID *)self zoneID];
  [v15 rd_ckDatabaseScope];
  v16 = CKDatabaseScopeString();
  [v6 appendFormat:@" %@", v16];

  if (v3) {
    [v6 appendString:@">"];
  }

  return v6;
}

- (id)ic_loggingDescription
{
  return [(CKRecordID *)self ic_loggingDescriptionIncludingBrackets:1];
}

- (int64_t)rd_ckDatabaseScope
{
  v2 = [(CKRecordID *)self zoneID];
  id v3 = [v2 rd_ckDatabaseScope];

  return (int64_t)v3;
}

- (BOOL)ic_isOwnedByCurrentUser
{
  v2 = [(CKRecordID *)self zoneID];
  unsigned __int8 v3 = [v2 ic_isOwnedByCurrentUser];

  return v3;
}

- (BOOL)ic_isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v5 = [v4 recordName];
  uint64_t v6 = [(CKRecordID *)self recordName];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [v4 recordName];
    v9 = [(CKRecordID *)self recordName];
    unsigned int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  v11 = [v4 zoneID];
  unsigned __int8 v12 = [v11 zoneName];
  v13 = [(CKRecordID *)self zoneID];
  uint64_t v14 = [v13 zoneName];
  if (v12 == (void *)v14)
  {
  }
  else
  {
    v15 = (void *)v14;
    v16 = [v4 zoneID];
    v17 = [v16 zoneName];
    v18 = [(CKRecordID *)self zoneID];
    v19 = [v18 zoneName];
    unsigned __int8 v34 = [v17 isEqual:v19];

    if ((v34 & 1) == 0) {
      goto LABEL_12;
    }
  }
  v20 = [v4 zoneID];
  v21 = [v20 ownerName];
  v22 = [(CKRecordID *)self zoneID];
  uint64_t v23 = [v22 ownerName];
  if (v21 == (void *)v23)
  {

    goto LABEL_15;
  }
  v24 = (void *)v23;
  v25 = [v4 zoneID];
  v26 = [v25 ownerName];
  v27 = [(CKRecordID *)self zoneID];
  v28 = [v27 ownerName];
  unsigned __int8 v35 = [v26 isEqual:v28];

  if (v35)
  {
LABEL_15:
    v31 = [v4 zoneID];
    id v32 = [v31 databaseScope];
    v33 = [(CKRecordID *)self zoneID];
    BOOL v29 = v32 == [v33 databaseScope];

    goto LABEL_13;
  }
LABEL_12:
  BOOL v29 = 0;
LABEL_13:

  return v29;
}

@end