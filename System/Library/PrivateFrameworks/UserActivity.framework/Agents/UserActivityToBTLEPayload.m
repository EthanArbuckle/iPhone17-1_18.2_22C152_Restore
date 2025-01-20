@interface UserActivityToBTLEPayload
- (NSData)streamsData;
- (NSData)userInfoPayload;
- (NSDate)when;
- (NSDictionary)additionalItems;
- (NSError)error;
- (NSString)activityType;
- (NSString)teamID;
- (NSString)title;
- (NSURL)webpageURL;
- (NSUUID)uniqueIdentifier;
- (UserActivityToBTLEPayload)initWithData:(id)a3;
- (UserActivityToBTLEPayload)initWithNSError:(id)a3;
- (id)description;
- (id)encodeAsData;
- (id)init:(id)a3 title:(id)a4 date:(id)a5 userInfoPayload:(id)a6 teamID:(id)a7 activityType:(id)a8;
- (void)addAdditionalItem:(id)a3 forKey:(id)a4;
- (void)setActivityType:(id)a3;
- (void)setError:(id)a3;
- (void)setStreamsData:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUserInfoPayload:(id)a3;
- (void)setWebpageURL:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation UserActivityToBTLEPayload

- (id)init:(id)a3 title:(id)a4 date:(id)a5 userInfoPayload:(id)a6 teamID:(id)a7 activityType:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (__CFString *)a7;
  id v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)UserActivityToBTLEPayload;
  v20 = [(UserActivityToBTLEPayload *)&v36 init];
  if (v20)
  {
    v21 = (NSString *)[v15 copy];
    title = v20->_title;
    v20->_title = v21;

    v23 = (NSUUID *)[v14 copy];
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = v23;

    v25 = (NSDate *)[v16 copy];
    when = v20->_when;
    v20->_when = v25;

    v27 = (NSData *)[v17 copy];
    userInfoPayload = v20->_userInfoPayload;
    v20->_userInfoPayload = v27;

    webpageURL = v20->_webpageURL;
    v20->_webpageURL = 0;

    streamsData = v20->_streamsData;
    v20->_streamsData = 0;

    if (v18 && [(__CFString *)v18 isEqual:@"0000000000"])
    {

      v18 = &stru_1000C6800;
    }
    v31 = (NSString *)[(__CFString *)v18 copy];
    teamID = v20->_teamID;
    v20->_teamID = v31;

    v33 = (NSString *)[v19 copy];
    activityType = v20->_activityType;
    v20->_activityType = v33;
  }
  return v20;
}

- (UserActivityToBTLEPayload)initWithNSError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UserActivityToBTLEPayload;
  v5 = [(UserActivityToBTLEPayload *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UserActivityToBTLEPayload *)v5 setError:v4];
  }

  return v6;
}

- (NSDictionary)additionalItems
{
  id v2 = [(NSMutableDictionary *)self->_additionalItems copy];

  return (NSDictionary *)v2;
}

- (void)addAdditionalItem:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v15 = v6;
  id v7 = a4;
  id v14 = v7;
  if (v7)
  {
    id v8 = v7;
    v9 = self;
    objc_sync_enter(v9);
    additionalItems = v9->_additionalItems;
    if (additionalItems) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v6 == 0;
    }
    if (v11)
    {
      if (v6) {
        -[NSMutableDictionary setValue:forKey:](additionalItems, "setValue:forKey:", v6, v8, v14, v15);
      }
      else {
        -[NSMutableDictionary removeObjectForKey:](additionalItems, "removeObjectForKey:", v8, v14, v15);
      }
    }
    else
    {
      v12 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithObjects:&v15 forKeys:&v14 count:1];
      v13 = v9->_additionalItems;
      v9->_additionalItems = v12;
    }
    objc_sync_exit(v9);
  }
}

- (UserActivityToBTLEPayload)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (unint64_t)[v4 length] >= 4)
  {
    id v5 = v5;
    int v6 = *(_DWORD *)[v5 bytes];
    int v43 = 4;
    uint64_t v7 = v6 & 0xF;
    if ((v6 & 0xF) == 0xF)
    {
      v13 = sub_10004D0F0(v5, &v43);
      id v14 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v13 error:0];
      id v15 = [v14 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
      [v14 finishDecoding];
      if (!v15)
      {
        v20 = sub_10000BA18(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "*** ERROR: Received BTLEUserActivity error packet, but unable to de-archive it, so discarding it.", buf, 2u);
        }

        id v5 = 0;
        v12 = 0;
        BOOL v11 = self;
        goto LABEL_43;
      }
      BOOL v11 = 0;
      v39 = 0;
      id obj = 0;
      id v16 = 0;
      id v17 = 0;
      v18 = v14;
      v10 = v13;
      v13 = 0;
      id v14 = 0;
    }
    else
    {
      if (v7 != 1)
      {
        id v14 = sub_10000BA18(0);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v45 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "*** ERROR: Received BTLEUserActivity packet with unknown version, %ld, so discarding it.", buf, 0xCu);
        }
        v12 = 0;
        v13 = v5;
        BOOL v11 = self;
        id v5 = 0;
        goto LABEL_43;
      }
      if ((v6 & 0x100) != 0)
      {
        uint64_t v8 = sub_10004CF20(v5);

        id v5 = (id)v8;
        if (!v8)
        {
          v12 = 0;
          goto LABEL_44;
        }
      }
      v9 = sub_10004D0F0(v5, &v43);
      v10 = v9;
      if (v9 && [v9 length]) {
        BOOL v11 = (UserActivityToBTLEPayload *)[objc_alloc((Class)NSString) initWithData:v10 encoding:4];
      }
      else {
        BOOL v11 = 0;
      }
      v13 = sub_10004D0F0(v5, &v43);
      v18 = sub_10004D0F0(v5, &v43);
      if (v18)
      {
        id v19 = +[NSJSONSerialization JSONObjectWithData:v18 options:0 error:0];
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v16 = [v19 objectForKey:@"teamID"];
          v39 = [v19 objectForKey:@"type"];
          id v17 = +[NSMutableDictionary dictionaryWithDictionary:v19];
        }
        else
        {
          id v17 = 0;
          v39 = 0;
          id v16 = 0;
        }
      }
      else
      {
        id v17 = 0;
        v39 = 0;
        id v16 = 0;
      }
      v21 = sub_10004D0F0(v5, &v43);
      v22 = v21;
      if (v21 && [v21 length])
      {
        obja = v17;
        id v23 = [objc_alloc((Class)NSString) initWithData:v22 encoding:4];
        v24 = v23;
        if (v23 && [v23 length])
        {
          id v14 = +[NSURL URLWithString:v24];
        }
        else
        {
          id v14 = 0;
        }

        id v17 = obja;
      }
      else
      {
        id v14 = 0;
      }
      sub_10004D0F0(v5, &v43);
      id obj = (id)objc_claimAutoreleasedReturnValue();

      id v15 = 0;
    }

    v42.receiver = self;
    v42.super_class = (Class)UserActivityToBTLEPayload;
    v25 = [(UserActivityToBTLEPayload *)&v42 init];
    v12 = v25;
    if (v25)
    {
      objc_storeStrong((id *)&v25->_title, v11);
      uniqueIdentifier = v12->_uniqueIdentifier;
      v12->_uniqueIdentifier = 0;

      when = v12->_when;
      v12->_when = 0;

      objc_storeStrong((id *)&v12->_userInfoPayload, v13);
      objc_storeStrong((id *)&v12->_webpageURL, v14);
      objc_storeStrong((id *)&v12->_streamsData, obj);
      v38 = v13;
      if (v16 && [(__CFString *)v16 isEqual:@"0000000000"])
      {
        v28 = v11;

        id v16 = &stru_1000C6800;
      }
      else
      {
        v28 = v11;
      }
      teamID = v12->_teamID;
      v12->_teamID = &v16->isa;
      v30 = v16;

      activityType = v12->_activityType;
      v12->_activityType = v39;
      v32 = v39;

      additionalItems = v12->_additionalItems;
      v12->_additionalItems = v17;
      v34 = v17;

      error = v12->_error;
      v12->_error = v15;
      objc_super v36 = v15;

      BOOL v11 = v28;
      v13 = v38;
    }
    else
    {
    }
LABEL_43:

    self = v11;
LABEL_44:

    goto LABEL_45;
  }

  v12 = 0;
LABEL_45:

  return v12;
}

- (id)encodeAsData
{
  v3 = +[NSMutableData data];
  id v4 = [(UserActivityToBTLEPayload *)self error];

  if (v4)
  {
    int v23 = 15;
    [v3 appendBytes:&v23 length:4];
    id v5 = [(UserActivityToBTLEPayload *)self error];
    int v6 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

    sub_10004D4B4(v3, v6);
    goto LABEL_27;
  }
  int v22 = 1;
  [v3 appendBytes:&v22 length:4];
  uint64_t v7 = [(NSString *)self->_title dataUsingEncoding:4];
  sub_10004D4B4(v3, v7);

  sub_10004D4B4(v3, self->_userInfoPayload);
  int v6 = [(UserActivityToBTLEPayload *)self additionalItems];
  if (v6) {
    +[NSMutableDictionary dictionaryWithDictionary:v6];
  }
  else {
  uint64_t v8 = +[NSMutableDictionary dictionary];
  }
  v9 = [(UserActivityToBTLEPayload *)self teamID];

  if (v9)
  {
    v10 = [(UserActivityToBTLEPayload *)self teamID];
    [v8 setObject:v10 forKey:@"teamID"];
  }
  BOOL v11 = [(UserActivityToBTLEPayload *)self activityType];

  if (v11)
  {
    v12 = [(UserActivityToBTLEPayload *)self activityType];
    [v8 setObject:v12 forKey:@"type"];
  }
  if ([v8 count])
  {
    v13 = +[NSJSONSerialization dataWithJSONObject:v8 options:0 error:0];
  }
  else
  {
    v13 = 0;
  }
  sub_10004D4B4(v3, v13);
  webpageURL = self->_webpageURL;
  if (webpageURL)
  {
    id v15 = [(NSURL *)webpageURL absoluteString];
    id v16 = v15;
    if (v15 && [v15 length])
    {
      id v17 = [v16 dataUsingEncoding:4];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }
  sub_10004D4B4(v3, v17);
  sub_10004D4B4(v3, self->_streamsData);
  if ((unint64_t)[v3 length] >> 31)
  {
    id v18 = v3;
    v3 = 0;
LABEL_25:

    goto LABEL_26;
  }
  if ((unint64_t)[v3 length] >= 0x801)
  {
    id v19 = sub_10004D544(v3);
    id v18 = v19;
    if (v19)
    {
      id v18 = v19;

      v3 = v18;
    }
    goto LABEL_25;
  }
LABEL_26:

LABEL_27:
  id v20 = [v3 copy];

  return v20;
}

- (id)description
{
  v24 = [(UserActivityToBTLEPayload *)self userInfoPayload];
  uint64_t v5 = sub_10000F05C(v24, 32);
  int v22 = [(UserActivityToBTLEPayload *)self streamsData];
  int v23 = (void *)v5;
  if (v22)
  {
    id v20 = [(UserActivityToBTLEPayload *)self streamsData];
    id v19 = sub_10000F05C(v20, 32);
    +[NSString stringWithFormat:@"stream=%@", v19];
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = &stru_1000C6800;
  }
  v21 = [(UserActivityToBTLEPayload *)self webpageURL];
  if (v21) {
    CFStringRef v6 = @"webPageURL=<private>";
  }
  else {
    CFStringRef v6 = &stru_1000C6800;
  }
  uint64_t v7 = [(UserActivityToBTLEPayload *)self teamID];
  if (v7
    || ([(UserActivityToBTLEPayload *)self activityType],
        (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v2 = [(UserActivityToBTLEPayload *)self teamID];
    v3 = [(UserActivityToBTLEPayload *)self activityType];
    +[NSString stringWithFormat:@" {teamID=%@ activityType=%@}", v2, v3];
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v9 = 1;
  }
  else
  {
    id v18 = 0;
    int v9 = 0;
    uint64_t v8 = &stru_1000C6800;
  }
  v10 = [(UserActivityToBTLEPayload *)self additionalItems];
  if (v10)
  {
    BOOL v11 = [(UserActivityToBTLEPayload *)self additionalItems];
    v12 = +[NSString stringWithFormat:@"additional=%@", v11];
    CFStringRef v16 = v6;
    v13 = v23;
    id v14 = +[NSString stringWithFormat:@"BTLEUserActivityDataEncoding: userInfo=%@ %@%@%@%@", v23, v25, v16, v8, v12];
  }
  else
  {
    CFStringRef v17 = v6;
    v13 = v23;
    id v14 = +[NSString stringWithFormat:@"BTLEUserActivityDataEncoding: userInfo=%@ %@%@%@%@", v23, v25, v17, v8, &stru_1000C6800];
  }

  if (v9)
  {
  }
  if (!v7) {

  }
  if (v22)
  {
  }

  return v14;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWhen:(id)a3
{
}

- (NSData)userInfoPayload
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserInfoPayload:(id)a3
{
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWebpageURL:(id)a3
{
}

- (NSData)streamsData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStreamsData:(id)a3
{
}

- (NSString)teamID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTeamID:(id)a3
{
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivityType:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_additionalItems, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_streamsData, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_userInfoPayload, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end