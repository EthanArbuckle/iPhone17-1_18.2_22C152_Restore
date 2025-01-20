@interface FCSubscription
+ (id)pendingSubscriptionWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7;
+ (id)subscriptionWithSubscriptionID:(id)a3 dictionaryRepresentation:(id)a4;
+ (id)subscriptionWithSubscriptionID:(id)a3 tagID:(id)a4 type:(unint64_t)a5 order:(id)a6 origin:(unint64_t)a7 groupID:(id)a8 dateAdded:(id)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11;
- (BOOL)canRetry;
- (BOOL)isTypeAutoFavoriteTag;
- (BOOL)isTypeGroupableTag;
- (BOOL)isTypeIgnoredTag;
- (BOOL)isTypeMutedTag;
- (BOOL)isTypePending;
- (BOOL)isTypeTag;
- (BOOL)notificationsEnabled;
- (FCSubscription)initWithSubscriptionID:(id)a3 tagID:(id)a4 groupID:(id)a5 dateAdded:(id)a6 subscriptionType:(unint64_t)a7 order:(id)a8 origin:(unint64_t)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11;
- (FCSubscription)initWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7;
- (NSDate)dateAdded;
- (NSNumber)order;
- (NSString)errorMessage;
- (NSString)groupID;
- (NSString)subscriptionID;
- (NSString)tagID;
- (NSString)title;
- (NSURL)pollingURL;
- (NSURL)url;
- (id)asCKRecord;
- (id)asReorderableTagSubscription;
- (id)copyWithOrder:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)comparePriority:(id)a3;
- (unint64_t)priority;
- (unint64_t)subscriptionOrigin;
- (unint64_t)subscriptionType;
- (unint64_t)zone;
@end

@implementation FCSubscription

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (unint64_t)subscriptionOrigin
{
  return self->_subscriptionOrigin;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (BOOL)isTypePending
{
  return [(FCSubscription *)self subscriptionType] == 1;
}

+ (id)subscriptionWithSubscriptionID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"subscriptionType"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v6 objectForKeyedSubscript:@"subscriptionOrder"];
  v10 = [v6 objectForKeyedSubscript:@"subscriptionOrigin"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [v6 objectForKeyedSubscript:@"zone"];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = [v6 objectForKeyedSubscript:@"dateAdded"];
  if (v8 == 2)
  {
    v17 = [v6 objectForKeyedSubscript:@"tagID"];
    v18 = [v6 objectForKeyedSubscript:@"groupID"];
    LOBYTE(v25) = 0;
    v19 = +[FCSubscription subscriptionWithSubscriptionID:v5 tagID:v17 type:2 order:v9 origin:v11 groupID:v18 dateAdded:v14 notificationsEnabled:v25 zone:v13];

    goto LABEL_13;
  }
  if (!v8)
  {
    v15 = [v6 objectForKeyedSubscript:@"notificationsEnabled"];
    uint64_t v16 = [v15 BOOLValue];

    v17 = [v6 objectForKeyedSubscript:@"tagID"];
    LOBYTE(v25) = v16;
    +[FCSubscription subscriptionWithSubscriptionID:v5 tagID:v17 type:0 order:v9 origin:v11 groupID:0 dateAdded:v14 notificationsEnabled:v25 zone:v13];
    v19 = LABEL_7:;
    goto LABEL_13;
  }
  if ((unint64_t)(v8 - 3) <= 2)
  {
    v17 = [v6 objectForKeyedSubscript:@"tagID"];
    LOBYTE(v25) = 0;
    +[FCSubscription subscriptionWithSubscriptionID:v5 tagID:v17 type:v8 order:v9 origin:v11 groupID:0 dateAdded:v14 notificationsEnabled:v25 zone:v13];
    goto LABEL_7;
  }
  v17 = [v6 objectForKeyedSubscript:@"pollingURL"];
  v20 = [v6 objectForKeyedSubscript:@"url"];
  if ([v17 length] && objc_msgSend(v20, "length"))
  {
    v21 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    v22 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
    v23 = [v6 objectForKeyedSubscript:@"title"];
    v19 = +[FCSubscription pendingSubscriptionWithSubscriptionID:v5 url:v22 title:v23 pollingURL:v21 dateAdded:v14];
  }
  else
  {
    v19 = 0;
  }

LABEL_13:
  return v19;
}

+ (id)subscriptionWithSubscriptionID:(id)a3 tagID:(id)a4 type:(unint64_t)a5 order:(id)a6 origin:(unint64_t)a7 groupID:(id)a8 dateAdded:(id)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11
{
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v25) = a10;
  v23 = (void *)[objc_alloc((Class)a1) initWithSubscriptionID:v22 tagID:v21 groupID:v19 dateAdded:v18 subscriptionType:a5 order:v20 origin:a7 notificationsEnabled:v25 zone:a11];

  return v23;
}

- (FCSubscription)initWithSubscriptionID:(id)a3 tagID:(id)a4 groupID:(id)a5 dateAdded:(id)a6 subscriptionType:(unint64_t)a7 order:(id)a8 origin:(unint64_t)a9 notificationsEnabled:(BOOL)a10 zone:(unint64_t)a11
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id obj = a4;
  id v19 = a4;
  id v34 = a5;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionID != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    __int16 v38 = 2080;
    v39 = "FCSubscription.m";
    __int16 v40 = 1024;
    int v41 = 89;
    __int16 v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19) {
      goto LABEL_6;
    }
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    __int16 v38 = 2080;
    v39 = "FCSubscription.m";
    __int16 v40 = 1024;
    int v41 = 90;
    __int16 v42 = 2114;
    v43 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dateAdded != nil");
    *(_DWORD *)buf = 136315906;
    v37 = "-[FCSubscription initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:]";
    __int16 v38 = 2080;
    v39 = "FCSubscription.m";
    __int16 v40 = 1024;
    int v41 = 91;
    __int16 v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v35.receiver = self;
  v35.super_class = (Class)FCSubscription;
  v23 = [(FCSubscription *)&v35 init];
  v24 = v23;
  if (v23)
  {
    if (v19)
    {
      objc_storeStrong((id *)&v23->_tagID, obj);
      v24->_subscriptionType = a7;
      uint64_t v25 = [v22 copy];
      order = v24->_order;
      v24->_order = (NSNumber *)v25;

      v24->_subscriptionOrigin = a9;
      objc_storeStrong((id *)&v24->_subscriptionID, a3);
      uint64_t v27 = [v21 copy];
      dateAdded = v24->_dateAdded;
      v24->_dateAdded = (NSDate *)v27;

      v24->_notificationsEnabled = a10;
      objc_storeStrong((id *)&v24->_groupID, v34);
      v24->_zone = a11;
    }
    else
    {

      v24 = 0;
    }
  }

  return v24;
}

- (id)asReorderableTagSubscription
{
  if ([(FCSubscription *)self subscriptionType]) {
    v3 = 0;
  }
  else {
    v3 = self;
  }
  return v3;
}

- (unint64_t)subscriptionType
{
  return self->_subscriptionType;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

+ (id)pendingSubscriptionWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7
{
  if (a4)
  {
    id v11 = a7;
    id v12 = a6;
    id v13 = a5;
    id v14 = a4;
    id v15 = a3;
    uint64_t v16 = [[FCSubscription alloc] initWithSubscriptionID:v15 url:v14 title:v13 pollingURL:v12 dateAdded:v11];
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

- (FCSubscription)initWithSubscriptionID:(id)a3 url:(id)a4 title:(id)a5 pollingURL:(id)a6 dateAdded:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v27 = "-[FCSubscription initWithSubscriptionID:url:title:pollingURL:dateAdded:]";
    __int16 v28 = 2080;
    v29 = "FCSubscription.m";
    __int16 v30 = 1024;
    int v31 = 117;
    __int16 v32 = 2114;
    v33 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "dateAdded != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v27 = "-[FCSubscription initWithSubscriptionID:url:title:pollingURL:dateAdded:]";
    __int16 v28 = 2080;
    v29 = "FCSubscription.m";
    __int16 v30 = 1024;
    int v31 = 118;
    __int16 v32 = 2114;
    v33 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)FCSubscription;
  id v18 = [(FCSubscription *)&v25 init];
  id v19 = v18;
  if (v18)
  {
    if (v14 && v16)
    {
      objc_storeStrong((id *)&v18->_url, a4);
      objc_storeStrong((id *)&v19->_title, a5);
      objc_storeStrong((id *)&v19->_pollingURL, a6);
      v19->_subscriptionType = 1;
      objc_storeStrong((id *)&v19->_subscriptionID, a3);
      uint64_t v20 = [v17 copy];
      dateAdded = v19->_dateAdded;
      v19->_dateAdded = (NSDate *)v20;
    }
    else
    {
      dateAdded = v18;
      id v19 = 0;
    }
  }
  return v19;
}

- (BOOL)isTypeTag
{
  return [(FCSubscription *)self subscriptionType] == 0;
}

- (BOOL)isTypeMutedTag
{
  return [(FCSubscription *)self subscriptionType] == 2;
}

- (BOOL)isTypeAutoFavoriteTag
{
  return [(FCSubscription *)self subscriptionType] == 3;
}

- (BOOL)isTypeGroupableTag
{
  return [(FCSubscription *)self subscriptionType] == 4;
}

- (BOOL)isTypeIgnoredTag
{
  return [(FCSubscription *)self subscriptionType] == 5;
}

- (unint64_t)priority
{
  unint64_t v2 = [(FCSubscription *)self subscriptionType];
  if (v2 > 5) {
    return 0;
  }
  else {
    return qword_1A4973A10[v2];
  }
}

- (int64_t)comparePriority:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "priority"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscription priority](self, "priority"));
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    uint64_t v8 = [v4 dateAdded];
    v9 = [(FCSubscription *)self dateAdded];
    int64_t v7 = [v8 compare:v9];

    if (!v7)
    {
      if ([(FCSubscription *)self subscriptionType]) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = -1;
      }
    }
  }

  return v7;
}

- (id)asCKRecord
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(FCSubscription *)self isDeprecated])
  {
    v3 = 0;
    goto LABEL_22;
  }
  if (qword_1EB5D11E8 != -1) {
    dispatch_once(&qword_1EB5D11E8, &__block_literal_global_37);
  }
  unint64_t v4 = [(FCSubscription *)self zone];
  id v5 = &_MergedGlobals_154;
  if (v4 == 1) {
    id v5 = &qword_1EB5D11E0;
  }
  id v6 = (id)*v5;
  id v7 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v8 = [(FCSubscription *)self subscriptionID];
  v9 = (void *)[v7 initWithRecordName:v8 zoneID:v6];

  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Subscription" recordID:v9];
  v10 = [(FCSubscription *)self dateAdded];
  [v3 setObject:v10 forKeyedSubscript:@"dateAdded"];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", FCCKSubscriptionOriginFromFCSubscriptionOrigin(-[FCSubscription subscriptionOrigin](self, "subscriptionOrigin")));
  [v3 setObject:v11 forKeyedSubscript:@"subscriptionOrigin"];

  if (![(FCSubscription *)self subscriptionType])
  {
    [v3 setObject:@"tag" forKeyedSubscript:@"subscriptionType"];
    id v16 = [(FCSubscription *)self tagID];
    [v3 setObject:v16 forKeyedSubscript:@"tagID"];

    id v17 = [(FCSubscription *)self order];
    [v3 setObject:v17 forKeyedSubscript:@"subscriptionOrder"];

    id v14 = objc_msgSend(NSNumber, "numberWithBool:", -[FCSubscription notificationsEnabled](self, "notificationsEnabled"));
    id v15 = FCCKSubscriptionNotificationsEnabledKey;
    goto LABEL_19;
  }
  if ([(FCSubscription *)self subscriptionType] != 2)
  {
    if ([(FCSubscription *)self subscriptionType] == 3)
    {
      id v18 = FCCKSubscriptionTypeAutoFavoriteTag;
    }
    else if ([(FCSubscription *)self subscriptionType] == 4)
    {
      id v18 = FCCKSubscriptionTypeGroupableTag;
    }
    else
    {
      if ([(FCSubscription *)self subscriptionType] != 5)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        id v14 = (void *)[[NSString alloc] initWithFormat:@"unrecognized subscription type"];
        int v20 = 136315906;
        id v21 = "-[FCSubscription asCKRecord]";
        __int16 v22 = 2080;
        v23 = "FCSubscription.m";
        __int16 v24 = 1024;
        int v25 = 275;
        __int16 v26 = 2114;
        uint64_t v27 = v14;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v20, 0x26u);
        goto LABEL_20;
      }
      id v18 = FCCKSubscriptionTypeIgnoredTag;
    }
    [v3 setObject:*v18 forKeyedSubscript:@"subscriptionType"];
    id v14 = [(FCSubscription *)self tagID];
    id v15 = FCCKSubscriptionTagIDKey;
LABEL_19:
    [v3 setObject:v14 forKeyedSubscript:*v15];
LABEL_20:

    goto LABEL_21;
  }
  [v3 setObject:@"mutedTag" forKeyedSubscript:@"subscriptionType"];
  id v12 = [(FCSubscription *)self tagID];
  [v3 setObject:v12 forKeyedSubscript:@"tagID"];

  id v13 = [(FCSubscription *)self groupID];

  if (v13)
  {
    id v14 = [(FCSubscription *)self groupID];
    id v15 = FCCKSubscriptionGroupIDKey;
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:
  return v3;
}

uint64_t __28__FCSubscription_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = *MEMORY[0x1E4F19C08];
  uint64_t v2 = [v0 initWithZoneName:@"Subscriptions" ownerName:*MEMORY[0x1E4F19C08]];
  v3 = (void *)_MergedGlobals_154;
  _MergedGlobals_154 = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"SensitiveSubscriptions" ownerName:v1];
  uint64_t v5 = qword_1EB5D11E0;
  qword_1EB5D11E0 = v4;
  return MEMORY[0x1F41817F8](v4, v5);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(FCSubscription *)self subscriptionID];
  unint64_t v5 = [(FCSubscription *)self subscriptionType] - 1;
  if (v5 > 4) {
    id v6 = @"tag";
  }
  else {
    id v6 = off_1E5B50938[v5];
  }
  id v7 = [(FCSubscription *)self order];
  uint64_t v8 = [(FCSubscription *)self dateAdded];
  v9 = [v3 stringWithFormat:@"{id: %@ type: %@ order: %@ dateAdded: %@ notifications: %d}", v4, v6, v7, v8, -[FCSubscription notificationsEnabled](self, "notificationsEnabled")];

  return v9;
}

- (id)copyWithOrder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FCSubscription *)self subscriptionType]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected equality between %s and %s", "self.subscriptionType", "FCSubscriptionTypeTag");
    *(_DWORD *)buf = 136315906;
    id v17 = "-[FCSubscription copyWithOrder:]";
    __int16 v18 = 2080;
    id v19 = "FCSubscription.m";
    __int16 v20 = 1024;
    int v21 = 303;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(FCSubscription *)self subscriptionID];
  id v7 = [(FCSubscription *)self tagID];
  uint64_t v8 = [(FCSubscription *)self groupID];
  v9 = [(FCSubscription *)self dateAdded];
  unint64_t v10 = [(FCSubscription *)self subscriptionType];
  unint64_t v11 = [(FCSubscription *)self subscriptionOrigin];
  LOBYTE(v15) = [(FCSubscription *)self notificationsEnabled];
  id v12 = objc_msgSend(v5, "initWithSubscriptionID:tagID:groupID:dateAdded:subscriptionType:order:origin:notificationsEnabled:zone:", v6, v7, v8, v9, v10, v4, v11, v15, -[FCSubscription zone](self, "zone"));

  return v12;
}

- (NSNumber)order
{
  return self->_order;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (unint64_t)zone
{
  return self->_zone;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)pollingURL
{
  return self->_pollingURL;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (BOOL)canRetry
{
  return self->_canRetry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_pollingURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(FCSubscription *)self isTypeTag]
    || [(FCSubscription *)self isTypeMutedTag]
    || [(FCSubscription *)self isTypeAutoFavoriteTag]
    || [(FCSubscription *)self isTypeGroupableTag]
    || [(FCSubscription *)self isTypeIgnoredTag])
  {
    id v4 = [(FCSubscription *)self tagID];

    if (v4)
    {
      id v5 = [(FCSubscription *)self tagID];
      [v3 setObject:v5 forKey:@"tagID"];

      id v6 = [(FCSubscription *)self order];
      objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, @"subscriptionOrder");

      id v7 = [(FCSubscription *)self dateAdded];
      [v3 setObject:v7 forKey:@"dateAdded"];

      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", FCCKSubscriptionOriginFromFCSubscriptionOrigin(-[FCSubscription subscriptionOrigin](self, "subscriptionOrigin")));
      [v3 setObject:v8 forKey:@"subscriptionOrigin"];

      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscription subscriptionType](self, "subscriptionType"));
      [v3 setObject:v9 forKey:@"subscriptionType"];

      unint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FCSubscription notificationsEnabled](self, "notificationsEnabled"));
      [v3 setObject:v10 forKey:@"notificationsEnabled"];

      unint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscription zone](self, "zone"));
      [v3 setObject:v11 forKey:@"zone"];

      id v12 = [(FCSubscription *)self groupID];

      if (v12)
      {
        id v13 = [(FCSubscription *)self groupID];
        [v3 setObject:v13 forKey:@"groupID"];
LABEL_9:
      }
    }
  }
  else if ([(FCSubscription *)self isTypePending])
  {
    id v16 = [(FCSubscription *)self url];

    if (v16)
    {
      id v17 = [(FCSubscription *)self url];
      __int16 v18 = [v17 absoluteString];
      [v3 setObject:v18 forKey:@"url"];

      id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCSubscription subscriptionType](self, "subscriptionType"));
      [v3 setObject:v19 forKey:@"subscriptionType"];

      __int16 v20 = [(FCSubscription *)self dateAdded];
      [v3 setObject:v20 forKey:@"dateAdded"];

      int v21 = [(FCSubscription *)self title];

      if (v21)
      {
        __int16 v22 = [(FCSubscription *)self title];
        [v3 setObject:v22 forKey:@"title"];
      }
      v23 = [(FCSubscription *)self pollingURL];

      if (v23)
      {
        id v13 = [(FCSubscription *)self pollingURL];
        uint64_t v24 = [v13 absoluteString];
        [v3 setObject:v24 forKey:@"pollingURL"];

        goto LABEL_9;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v13 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
    int v25 = 136315906;
    __int16 v26 = "-[FCSubscription(SubscriptionList) dictionaryRepresentation]";
    __int16 v27 = 2080;
    uint64_t v28 = "FCSubscriptionList.m";
    __int16 v29 = 1024;
    int v30 = 1508;
    __int16 v31 = 2114;
    __int16 v32 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);
    goto LABEL_9;
  }
  id v14 = (void *)[v3 copy];

  return v14;
}

@end