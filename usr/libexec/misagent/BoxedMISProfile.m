@interface BoxedMISProfile
+ (id)fromSQLStatement:(sqlite3_stmt *)a3 withMap:(id)a4;
- (BoxedMISProfile)initWithUUID:(id)a3 withTeamID:(id)a4 withName:(id)a5 withExpiry:(id)a6 isUniversal:(unsigned __int8)a7 isAppleInternal:(unsigned __int8)a8 isLocal:(unsigned __int8)a9 isBeta:(unsigned __int8)a10;
- (NSDate)Expires;
- (NSString)Name;
- (NSString)TeamID;
- (NSString)UUID;
- (unsigned)AppleInternal;
- (unsigned)Beta;
- (unsigned)Local;
- (unsigned)ProvisionsAllDevices;
- (void)setAppleInternal:(unsigned __int8)a3;
- (void)setBeta:(unsigned __int8)a3;
- (void)setExpires:(id)a3;
- (void)setLocal:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setProvisionsAllDevices:(unsigned __int8)a3;
- (void)setTeamID:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation BoxedMISProfile

- (BoxedMISProfile)initWithUUID:(id)a3 withTeamID:(id)a4 withName:(id)a5 withExpiry:(id)a6 isUniversal:(unsigned __int8)a7 isAppleInternal:(unsigned __int8)a8 isLocal:(unsigned __int8)a9 isBeta:(unsigned __int8)a10
{
  id v17 = a3;
  id v18 = a4;
  id v24 = a5;
  id v19 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BoxedMISProfile;
  v20 = [(BoxedMISProfile *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->UUID, a3);
    objc_storeStrong((id *)&v21->TeamID, a4);
    objc_storeStrong((id *)&v21->Name, a5);
    objc_storeStrong((id *)&v21->Expires, a6);
    v21->ProvisionsAllDevices = a7;
    v21->AppleInternal = a8;
    v21->Local = a9;
    v21->Beta = a10;
    v22 = v21;
  }

  return v21;
}

+ (id)fromSQLStatement:(sqlite3_stmt *)a3 withMap:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"profile_uuid"];
  v7 = sub_10000A454(a3, (int)[v6 intValue]);

  v8 = [v5 objectForKeyedSubscript:@"profile_team_id"];
  v9 = sub_10000A454(a3, (int)[v8 intValue]);

  v10 = [v5 objectForKeyedSubscript:@"profile_name"];
  v11 = sub_10000A454(a3, (int)[v10 intValue]);

  v12 = [v5 objectForKeyedSubscript:@"profile_expires"];
  v13 = sub_10000A494(a3, (int)[v12 intValue]);

  v14 = [v5 objectForKeyedSubscript:@"profile_is_for_all_devices"];
  BOOL v15 = sqlite3_column_int(a3, (int)[v14 intValue]) != 0;

  v16 = [v5 objectForKeyedSubscript:@"profile_is_apple_internal"];
  BOOL v17 = sqlite3_column_int(a3, (int)[v16 intValue]) != 0;

  id v18 = [v5 objectForKeyedSubscript:@"profile_is_local"];
  BOOL v19 = sqlite3_column_int(a3, (int)[v18 intValue]) != 0;

  v20 = [v5 objectForKeyedSubscript:@"profile_is_beta"];

  LOBYTE(a3) = sqlite3_column_int(a3, (int)[v20 intValue]) != 0;
  BYTE1(v23) = (_BYTE)a3;
  LOBYTE(v23) = v19;
  v21 = -[BoxedMISProfile initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:]([BoxedMISProfile alloc], "initWithUUID:withTeamID:withName:withExpiry:isUniversal:isAppleInternal:isLocal:isBeta:", v7, v9, v11, v13, v15, v17, v23);

  return v21;
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSString)TeamID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTeamID:(id)a3
{
}

- (NSString)Name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (NSDate)Expires
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpires:(id)a3
{
}

- (unsigned)ProvisionsAllDevices
{
  return self->ProvisionsAllDevices;
}

- (void)setProvisionsAllDevices:(unsigned __int8)a3
{
  self->ProvisionsAllDevices = a3;
}

- (unsigned)AppleInternal
{
  return self->AppleInternal;
}

- (void)setAppleInternal:(unsigned __int8)a3
{
  self->AppleInternal = a3;
}

- (unsigned)Local
{
  return self->Local;
}

- (void)setLocal:(unsigned __int8)a3
{
  self->Local = a3;
}

- (unsigned)Beta
{
  return self->Beta;
}

- (void)setBeta:(unsigned __int8)a3
{
  self->Beta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->Expires, 0);
  objc_storeStrong((id *)&self->Name, 0);
  objc_storeStrong((id *)&self->TeamID, 0);

  objc_storeStrong((id *)&self->UUID, 0);
}

@end