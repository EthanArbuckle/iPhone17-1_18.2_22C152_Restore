@interface TCCDSyncUpdateAccessAction
+ (BOOL)supportsSecureCoding;
+ (unint64_t)accessUpdateStatusForAuthorizationRight:(unint64_t)a3 forMain:(BOOL)a4;
- (TCCDSyncUpdateAccessAction)initWithCoder:(id)a3;
- (id)_authorizationRightStateForMain:(BOOL)a3;
- (id)_description;
- (id)authorizationRightState;
- (id)mainAuthorizationRightState;
- (id)syncId;
- (int)databaseFlags;
- (unint64_t)authorizationVersion;
- (unint64_t)updateAccessActionStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationVersion:(unint64_t)a3;
- (void)setDatabaseFlags:(int)a3;
- (void)setUpdateAccessActionStatus:(unint64_t)a3;
- (void)updateDatabase:(unint64_t)a3 killClient:(BOOL)a4;
@end

@implementation TCCDSyncUpdateAccessAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)accessUpdateStatusForAuthorizationRight:(unint64_t)a3 forMain:(BOOL)a4
{
  unint64_t result = 0;
  switch(a3)
  {
    case 0uLL:
      BOOL v5 = !a4;
      unint64_t v6 = 3;
      unint64_t v7 = 5;
      goto LABEL_4;
    case 2uLL:
      BOOL v5 = !a4;
      unint64_t v6 = 2;
      unint64_t v7 = 4;
LABEL_4:
      if (v5) {
        return v6;
      }
      else {
        return v7;
      }
    case 3uLL:
      BOOL v8 = !a4;
      unint64_t v9 = 6;
      goto LABEL_11;
    case 4uLL:
      BOOL v8 = !a4;
      unint64_t v9 = 8;
      goto LABEL_11;
    case 5uLL:
      BOOL v8 = !a4;
      unint64_t v9 = 10;
      goto LABEL_11;
    case 6uLL:
      BOOL v8 = !a4;
      unint64_t v9 = 12;
LABEL_11:
      if (v8) {
        unint64_t result = v9;
      }
      else {
        unint64_t result = v9 + 1;
      }
      break;
    default:
      return result;
  }
  return result;
}

- (TCCDSyncUpdateAccessAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TCCDSyncUpdateAccessAction;
  BOOL v5 = [(TCCDSyncClientAccessAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    unsigned int v6 = [v4 containsValueForKey:@"TCCDSyncUpdateAccessActionStatusV2Key"];
    uint64_t v7 = objc_opt_class();
    if (v6) {
      CFStringRef v8 = @"TCCDSyncUpdateAccessActionStatusV2Key";
    }
    else {
      CFStringRef v8 = @"TCCDSyncUpdateAccessActionStatusKey";
    }
    unint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    -[TCCDSyncUpdateAccessAction setUpdateAccessActionStatus:](v5, "setUpdateAccessActionStatus:", [v9 unsignedIntegerValue]);

    if ([v4 containsValueForKey:@"TCCDSyncAuthorizationVersionKey"])
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TCCDSyncAuthorizationVersionKey"];
      -[TCCDSyncUpdateAccessAction setAuthorizationVersion:](v5, "setAuthorizationVersion:", [v10 unsignedLongLongValue]);
    }
    else
    {
      [(TCCDSyncUpdateAccessAction *)v5 setAuthorizationVersion:2];
    }
    if ([v4 containsValueForKey:@"TCCDSyncUpdateAccessActionFlagsKey"])
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TCCDSyncUpdateAccessActionFlagsKey"];
      -[TCCDSyncUpdateAccessAction setDatabaseFlags:](v5, "setDatabaseFlags:", [v11 intValue]);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TCCDSyncUpdateAccessAction;
  id v4 = a3;
  [(TCCDSyncClientAccessAction *)&v12 encodeWithCoder:v4];
  unint64_t v5 = [(TCCDSyncUpdateAccessAction *)self updateAccessActionStatus];
  if (v5 - 6 >= 3)
  {
    if (v5 == 9) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = v5;
    }
  }
  else
  {
    uint64_t v6 = qword_100076320[v5 - 6];
  }
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v6];
  [v4 encodeObject:v7 forKey:@"TCCDSyncUpdateAccessActionStatusKey"];
  CFStringRef v8 = +[NSNumber numberWithUnsignedInteger:[(TCCDSyncUpdateAccessAction *)self updateAccessActionStatus]];
  [v4 encodeObject:v8 forKey:@"TCCDSyncUpdateAccessActionStatusV2Key"];
  unint64_t v9 = self;
  v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 authorizationVersion]);

  [v4 encodeObject:v10 forKey:@"TCCDSyncAuthorizationVersionKey"];
  v11 = +[NSNumber numberWithInt:[(TCCDSyncUpdateAccessAction *)self databaseFlags]];
  [v4 encodeObject:v11 forKey:@"TCCDSyncUpdateAccessActionFlagsKey"];
}

- (id)_description
{
  unint64_t v3 = [(TCCDSyncUpdateAccessAction *)self updateAccessActionStatus];
  if (v3 > 0xE) {
    id v4 = "<unknown>";
  }
  else {
    id v4 = off_1000950C8[v3];
  }
  v8.receiver = self;
  v8.super_class = (Class)TCCDSyncUpdateAccessAction;
  unint64_t v5 = [(TCCDSyncClientAccessAction *)&v8 _description];
  uint64_t v6 = +[NSString stringWithFormat:@"%@, updateAccessAction: %s, v=%llu flags=%d", v5, v4, [(TCCDSyncUpdateAccessAction *)self authorizationVersion], [(TCCDSyncUpdateAccessAction *)self databaseFlags]];

  return v6;
}

- (id)syncId
{
  unint64_t v3 = [(TCCDSyncClientAccessAction *)self replicaClientIdentifier];
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100058E24();
    }
    unint64_t v3 = [(TCCDSyncClientAccessAction *)self mainClientIdentifier];
  }
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(TCCDSyncAccessAction *)self serviceIdentifier];
  uint64_t v7 = +[NSString stringWithFormat:@"%@-%@-%@", v5, v6, v3];

  return v7;
}

- (void)updateDatabase:(unint64_t)a3 killClient:(BOOL)a4
{
}

- (id)_authorizationRightStateForMain:(BOOL)a3
{
  BOOL v3 = a3;
  switch([(TCCDSyncUpdateAccessAction *)self updateAccessActionStatus])
  {
    case 2uLL:
      if (!v3) {
        goto LABEL_7;
      }
      goto LABEL_23;
    case 3uLL:
      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_9;
    case 4uLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_7:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 2;
      goto LABEL_26;
    case 5uLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_9:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 0;
      goto LABEL_26;
    case 6uLL:
      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_13;
    case 7uLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_13:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 3;
      goto LABEL_26;
    case 8uLL:
      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_17;
    case 9uLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_17:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 4;
      goto LABEL_26;
    case 0xAuLL:
      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 0xBuLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_21:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 5;
      goto LABEL_26;
    case 0xCuLL:
      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_25;
    case 0xDuLL:
      if (!v3) {
        goto LABEL_23;
      }
LABEL_25:
      id v4 = objc_alloc_init(TCCDAuthorizationRightState);
      unint64_t v5 = v4;
      uint64_t v6 = 6;
LABEL_26:
      [(TCCDAuthorizationRightState *)v4 setRight:v6];
      if (v5) {
        [(TCCDAuthorizationRightState *)v5 setReason:4];
      }
      break;
    default:
LABEL_23:
      unint64_t v5 = 0;
      break;
  }
  return v5;
}

- (id)authorizationRightState
{
  return [(TCCDSyncUpdateAccessAction *)self _authorizationRightStateForMain:0];
}

- (id)mainAuthorizationRightState
{
  return [(TCCDSyncUpdateAccessAction *)self _authorizationRightStateForMain:1];
}

- (unint64_t)updateAccessActionStatus
{
  return self->_updateAccessActionStatus;
}

- (void)setUpdateAccessActionStatus:(unint64_t)a3
{
  self->_updateAccessActionStatus = a3;
}

- (unint64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (void)setAuthorizationVersion:(unint64_t)a3
{
  self->_authorizationVersion = a3;
}

- (int)databaseFlags
{
  return self->_databaseFlags;
}

- (void)setDatabaseFlags:(int)a3
{
  self->_databaseFlags = a3;
}

@end