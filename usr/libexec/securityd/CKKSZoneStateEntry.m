@interface CKKSZoneStateEntry
+ (id)contextID:(id)a3 zoneName:(id)a4;
+ (id)fromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5;
- (BOOL)ckzonecreated;
- (BOOL)ckzonesubscribed;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreRecordsInCloudKit;
- (CKKSRateLimiter)rateLimiter;
- (CKKSZoneStateEntry)initWithContextID:(id)a3 zoneName:(id)a4 zoneCreated:(BOOL)a5 zoneSubscribed:(BOOL)a6 changeToken:(id)a7 moreRecordsInCloudKit:(BOOL)a8 lastFetch:(id)a9 lastScan:(id)a10 lastFixup:(unint64_t)a11 encodedRateLimiter:(id)a12;
- (CKServerChangeToken)getChangeToken;
- (NSData)encodedChangeToken;
- (NSData)encodedRateLimiter;
- (NSDate)lastFetchTime;
- (NSDate)lastLocalKeychainScanTime;
- (NSString)ckzone;
- (NSString)contextID;
- (id)description;
- (id)sqlValues;
- (id)whereClauseToFindSelf;
- (unint64_t)lastFixup;
- (void)setChangeToken:(id)a3;
- (void)setCkzone:(id)a3;
- (void)setCkzonecreated:(BOOL)a3;
- (void)setCkzonesubscribed:(BOOL)a3;
- (void)setEncodedChangeToken:(id)a3;
- (void)setEncodedRateLimiter:(id)a3;
- (void)setLastFetchTime:(id)a3;
- (void)setLastFixup:(unint64_t)a3;
- (void)setLastLocalKeychainScanTime:(id)a3;
- (void)setMoreRecordsInCloudKit:(BOOL)a3;
- (void)setRateLimiter:(id)a3;
@end

@implementation CKKSZoneStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_lastLocalKeychainScanTime, 0);
  objc_storeStrong((id *)&self->_lastFetchTime, 0);
  objc_storeStrong((id *)&self->_encodedChangeToken, 0);
  objc_storeStrong((id *)&self->_ckzone, 0);

  objc_storeStrong((id *)&self->_contextID, 0);
}

- (void)setRateLimiter:(id)a3
{
}

- (CKKSRateLimiter)rateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastFixup:(unint64_t)a3
{
  self->_lastFixup = a3;
}

- (unint64_t)lastFixup
{
  return self->_lastFixup;
}

- (void)setLastLocalKeychainScanTime:(id)a3
{
}

- (NSDate)lastLocalKeychainScanTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastFetchTime:(id)a3
{
}

- (NSDate)lastFetchTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMoreRecordsInCloudKit:(BOOL)a3
{
  self->_moreRecordsInCloudKit = a3;
}

- (BOOL)moreRecordsInCloudKit
{
  return self->_moreRecordsInCloudKit;
}

- (void)setEncodedChangeToken:(id)a3
{
}

- (NSData)encodedChangeToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCkzonesubscribed:(BOOL)a3
{
  self->_ckzonesubscribed = a3;
}

- (BOOL)ckzonesubscribed
{
  return self->_ckzonesubscribed;
}

- (void)setCkzonecreated:(BOOL)a3
{
  self->_ckzonecreated = a3;
}

- (BOOL)ckzonecreated
{
  return self->_ckzonecreated;
}

- (void)setCkzone:(id)a3
{
}

- (NSString)ckzone
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)sqlValues
{
  id v31 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v32[0] = @"contextID";
  v3 = [(CKKSZoneStateEntry *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  v30 = v6;
  v33[0] = v6;
  v32[1] = @"ckzone";
  v29 = [(CKKSZoneStateEntry *)self ckzone];
  v33[1] = v29;
  v32[2] = @"ckzonecreated";
  v28 = +[NSNumber numberWithBool:[(CKKSZoneStateEntry *)self ckzonecreated]];
  v33[2] = v28;
  v32[3] = @"ckzonesubscribed";
  v7 = +[NSNumber numberWithBool:[(CKKSZoneStateEntry *)self ckzonesubscribed]];
  v33[3] = v7;
  v32[4] = @"changetoken";
  v8 = [(CKKSZoneStateEntry *)self encodedChangeToken];
  v9 = [v8 base64EncodedStringWithOptions:0];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[NSNull null];
  }
  v11 = v10;

  v33[4] = v11;
  v32[5] = @"lastfetch";
  uint64_t v12 = [(CKKSZoneStateEntry *)self lastFetchTime];
  if (!v12
    || (v13 = (void *)v12,
        [(CKKSZoneStateEntry *)self lastFetchTime],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v31 stringFromDate:v14],
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v15))
  {
    v15 = +[NSNull null];
  }
  v33[5] = v15;
  v32[6] = @"ratelimiter";
  v16 = [(CKKSZoneStateEntry *)self encodedRateLimiter];
  v17 = [v16 base64EncodedStringWithOptions:0];

  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  v19 = v18;

  v33[6] = v19;
  v32[7] = @"lastFixup";
  v20 = +[NSNumber numberWithLong:[(CKKSZoneStateEntry *)self lastFixup]];
  v33[7] = v20;
  v32[8] = @"morecoming";
  v21 = +[NSNumber numberWithBool:[(CKKSZoneStateEntry *)self moreRecordsInCloudKit]];
  v33[8] = v21;
  v32[9] = @"lastscan";
  uint64_t v22 = [(CKKSZoneStateEntry *)self lastLocalKeychainScanTime];
  if (!v22
    || (v23 = (void *)v22,
        [(CKKSZoneStateEntry *)self lastLocalKeychainScanTime],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v31 stringFromDate:v24],
        v25 = objc_claimAutoreleasedReturnValue(),
        v24,
        v23,
        !v25))
  {
    v25 = +[NSNull null];
  }
  v33[9] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:10];

  return v26;
}

- (id)whereClauseToFindSelf
{
  v10[0] = @"contextID";
  v3 = [(CKKSZoneStateEntry *)self contextID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  v10[1] = @"ckzone";
  v11[0] = v6;
  v7 = [(CKKSZoneStateEntry *)self ckzone];
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (void)setEncodedRateLimiter:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    [(CKKSZoneStateEntry *)self setRateLimiter:v5];
  }
  else
  {
    [(CKKSZoneStateEntry *)self setRateLimiter:0];
  }
}

- (NSData)encodedRateLimiter
{
  v3 = [(CKKSZoneStateEntry *)self rateLimiter];

  if (v3)
  {
    id v4 = [(CKKSZoneStateEntry *)self rateLimiter];
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (void)setChangeToken:(id)a3
{
  if (a3)
  {
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
    [(CKKSZoneStateEntry *)self setEncodedChangeToken:v4];
  }
  else
  {
    -[CKKSZoneStateEntry setEncodedChangeToken:](self, "setEncodedChangeToken:");
  }
}

- (CKServerChangeToken)getChangeToken
{
  v3 = [(CKKSZoneStateEntry *)self encodedChangeToken];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSKeyedUnarchiver);
    id v5 = [(CKKSZoneStateEntry *)self encodedChangeToken];
    id v6 = [v4 initForReadingFromData:v5 error:0];

    v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  }
  else
  {
    v7 = 0;
  }

  return (CKServerChangeToken *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [(CKKSZoneStateEntry *)self ckzone];
    v9 = [v7 ckzone];
    if (![v8 isEqualToString:v9])
    {
      unsigned __int8 v12 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v10 = [(CKKSZoneStateEntry *)self contextID];
    if (v10 || ([v7 contextID], (v47 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v3 = [(CKKSZoneStateEntry *)self contextID];
      id v4 = [v7 contextID];
      if (![v3 isEqualToString:v4])
      {
        unsigned __int8 v12 = 0;
        goto LABEL_14;
      }
      int v11 = 1;
    }
    else
    {
      v47 = 0;
      int v11 = 0;
    }
    unsigned int v13 = [(CKKSZoneStateEntry *)self ckzonecreated];
    if (v13 != [v7 ckzonecreated]
      || (unsigned int v14 = [(CKKSZoneStateEntry *)self ckzonesubscribed],
          v14 != [v7 ckzonesubscribed]))
    {
      unsigned __int8 v12 = 0;
      if (!v11)
      {
LABEL_15:
        if (!v10) {

        }
        goto LABEL_18;
      }
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v16 = [(CKKSZoneStateEntry *)self encodedChangeToken];
    char v46 = v11;
    if (v16 || ([v7 encodedChangeToken], (v41 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = (void *)v16;
      id v18 = [(CKKSZoneStateEntry *)self encodedChangeToken];
      v43 = [v7 encodedChangeToken];
      v44 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        unsigned __int8 v12 = 0;
        v19 = v17;
        goto LABEL_54;
      }
      int v42 = 1;
    }
    else
    {
      v17 = 0;
      v41 = 0;
      int v42 = 0;
    }
    unsigned int v20 = [(CKKSZoneStateEntry *)self moreRecordsInCloudKit];
    if (v20 != [v7 moreRecordsInCloudKit])
    {
      unsigned __int8 v12 = 0;
      v19 = v17;
      if (!v42) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
    [(CKKSZoneStateEntry *)self lastFetchTime];
    v45 = v19 = v17;
    if (v45 || ([v7 lastFetchTime], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = [(CKKSZoneStateEntry *)self lastFetchTime];
      v39 = [v7 lastFetchTime];
      v40 = v17;
      if (!objc_msgSend(v17, "isEqualToDate:"))
      {
        unsigned __int8 v12 = 0;
        goto LABEL_50;
      }
      int v38 = 1;
    }
    else
    {
      v35 = 0;
      int v38 = 0;
    }
    v37 = [(CKKSZoneStateEntry *)self rateLimiter];
    if (v37 || ([v7 rateLimiter], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v21 = [(CKKSZoneStateEntry *)self rateLimiter];
      uint64_t v22 = [v7 rateLimiter];
      v36 = (void *)v21;
      v23 = (void *)v21;
      v17 = (void *)v22;
      if (![v23 isEqual:v22])
      {
        unsigned __int8 v12 = 0;
        goto LABEL_47;
      }
      v34 = v19;
      int v33 = 1;
    }
    else
    {
      v34 = v19;
      v32 = 0;
      int v33 = 0;
    }
    id v24 = [(CKKSZoneStateEntry *)self lastFixup];
    if (v24 != [v7 lastFixup])
    {
      unsigned __int8 v12 = 0;
      v19 = v34;
      if (!v33) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
    uint64_t v25 = [(CKKSZoneStateEntry *)self lastLocalKeychainScanTime];
    if (v25 || ([v7 lastLocalKeychainScanTime], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = [(CKKSZoneStateEntry *)self lastLocalKeychainScanTime];
      [v7 lastLocalKeychainScanTime];
      v26 = id v31 = (void *)v25;
      unsigned __int8 v12 = [v30 isEqualToDate:v26];

      if (v31)
      {

        v19 = v34;
        goto LABEL_64;
      }
      v19 = v34;
      v27 = v29;
    }
    else
    {
      v27 = 0;
      unsigned __int8 v12 = 1;
      v19 = v34;
    }

LABEL_64:
    if ((v33 & 1) == 0)
    {
LABEL_48:
      if (v37)
      {

        if (!v38) {
          goto LABEL_51;
        }
      }
      else
      {

        if ((v38 & 1) == 0)
        {
LABEL_51:
          if (!v45) {

          }
          if ((v42 & 1) == 0)
          {
LABEL_55:
            if (!v19) {

            }
            if ((v46 & 1) == 0) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
LABEL_54:

          goto LABEL_55;
        }
      }
LABEL_50:

      goto LABEL_51;
    }
LABEL_47:

    goto LABEL_48;
  }
  unsigned __int8 v12 = 0;
LABEL_19:

  return v12;
}

- (id)description
{
  v3 = [(CKKSZoneStateEntry *)self contextID];
  id v4 = [(CKKSZoneStateEntry *)self ckzone];
  if ([(CKKSZoneStateEntry *)self ckzonecreated]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  if ([(CKKSZoneStateEntry *)self ckzonesubscribed]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if ([(CKKSZoneStateEntry *)self moreRecordsInCloudKit]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"<CKKSZoneStateEntry[%@](%@): created:%@ subscribed:%@ moreRecords:%@>", v3, v4, v5, v6, v7];

  return v8;
}

- (CKKSZoneStateEntry)initWithContextID:(id)a3 zoneName:(id)a4 zoneCreated:(BOOL)a5 zoneSubscribed:(BOOL)a6 changeToken:(id)a7 moreRecordsInCloudKit:(BOOL)a8 lastFetch:(id)a9 lastScan:(id)a10 lastFixup:(unint64_t)a11 encodedRateLimiter:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v27 = a7;
  id v26 = a9;
  id v18 = a10;
  id v19 = a12;
  v28.receiver = self;
  v28.super_class = (Class)CKKSZoneStateEntry;
  unsigned int v20 = [(CKKSZoneStateEntry *)&v28 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_contextID, a3);
    objc_storeStrong((id *)&v21->_ckzone, a4);
    v21->_ckzonecreated = a5;
    v21->_ckzonesubscribed = a6;
    objc_storeStrong((id *)&v21->_encodedChangeToken, a7);
    v21->_moreRecordsInCloudKit = a8;
    objc_storeStrong((id *)&v21->_lastFetchTime, a9);
    objc_storeStrong((id *)&v21->_lastLocalKeychainScanTime, a10);
    v21->_lastFixup = a11;
    [(CKKSZoneStateEntry *)v21 setEncodedRateLimiter:v19];
  }

  return v21;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = [CKKSZoneStateEntry alloc];
  id v26 = [v3 objectForKeyedSubscript:@"contextID"];
  uint64_t v21 = [v26 asString];
  uint64_t v25 = [v3 objectForKeyedSubscript:@"ckzone"];
  CFStringRef v5 = [v25 asString];
  id v24 = [v3 objectForKeyedSubscript:@"ckzonecreated"];
  unsigned int v18 = [v24 asBOOL];
  v23 = [v3 objectForKeyedSubscript:@"ckzonesubscribed"];
  unsigned int v17 = [v23 asBOOL];
  uint64_t v22 = [v3 objectForKeyedSubscript:@"changetoken"];
  id v16 = [v22 asBase64DecodedData];
  unsigned int v20 = [v3 objectForKeyedSubscript:@"morecoming"];
  unsigned int v15 = [v20 asBOOL];
  CFStringRef v6 = [v3 objectForKeyedSubscript:@"lastfetch"];
  CFStringRef v7 = [v6 asISO8601Date];
  v8 = [v3 objectForKeyedSubscript:@"lastscan"];
  v9 = [v8 asISO8601Date];
  id v10 = [v3 objectForKeyedSubscript:@"lastFixup"];
  id v11 = [v10 asNSInteger];
  unsigned __int8 v12 = [v3 objectForKeyedSubscript:@"ratelimiter"];

  unsigned int v13 = [v12 asBase64DecodedData];
  id v19 = [(CKKSZoneStateEntry *)v4 initWithContextID:v21 zoneName:v5 zoneCreated:v18 zoneSubscribed:v17 changeToken:v16 moreRecordsInCloudKit:v15 lastFetch:v7 lastScan:v9 lastFixup:v11 encodedRateLimiter:v13];

  return v19;
}

+ (id)sqlColumns
{
  return &off_100326E30;
}

+ (id)sqlTable
{
  return @"ckstate";
}

+ (id)tryFromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  unsigned int v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = v9;
  unsigned int v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  unsigned int v17 = v16;

  v22[1] = v17;
  unsigned int v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v19 = [a1 tryFromDatabaseWhere:v18 error:a5];

  return v19;
}

+ (id)fromDatabase:(id)a3 zoneName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = +[NSNull null];
  }
  unsigned int v13 = v12;

  v21[1] = @"ckzone";
  v22[0] = v13;
  id v14 = v9;
  unsigned int v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  unsigned int v17 = v16;

  v22[1] = v17;
  unsigned int v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  id v19 = [a1 fromDatabaseWhere:v18 error:a5];

  return v19;
}

+ (id)contextID:(id)a3 zoneName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v11 = 0;
  CFStringRef v7 = +[CKKSZoneStateEntry tryFromDatabase:v5 zoneName:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "error fetching CKState(%@): %@", buf, 0x16u);
    }
  }
  if (!v7) {
    CFStringRef v7 = [[CKKSZoneStateEntry alloc] initWithContextID:v5 zoneName:v6 zoneCreated:0 zoneSubscribed:0 changeToken:0 moreRecordsInCloudKit:0 lastFetch:0 lastScan:0 lastFixup:5 encodedRateLimiter:0];
  }

  return v7;
}

@end