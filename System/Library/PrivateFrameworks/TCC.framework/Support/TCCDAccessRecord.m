@interface TCCDAccessRecord
- (BOOL)replaceStoredCodeRequirement;
- (NSDate)lastModifiedDate;
- (TCCDAccessObject)accessObject;
- (TCCDAccessRecord)initWithSubject:(id)a3 object:(id)a4 authorizationValue:(unint64_t)a5 authorizationReason:(unint64_t)a6 authorizationVersion:(unint64_t)a7 lastModified:(id)a8 flags:(unint64_t)a9 replaceStoredCodeRequirement:(BOOL)a10;
- (TCCDIdentity)subjectIdentity;
- (id)_dateFormatter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)authorizationReason;
- (unint64_t)authorizationValue;
- (unint64_t)authorizationVersion;
- (unint64_t)flags;
- (void)setAccessObject:(id)a3;
- (void)setAuthorizationReason:(unint64_t)a3;
- (void)setAuthorizationValue:(unint64_t)a3;
- (void)setAuthorizationVersion:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setSubjectIdentity:(id)a3;
@end

@implementation TCCDAccessRecord

- (TCCDAccessRecord)initWithSubject:(id)a3 object:(id)a4 authorizationValue:(unint64_t)a5 authorizationReason:(unint64_t)a6 authorizationVersion:(unint64_t)a7 lastModified:(id)a8 flags:(unint64_t)a9 replaceStoredCodeRequirement:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)TCCDAccessRecord;
  v20 = [(TCCDAccessRecord *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_subjectIdentity, a3);
    objc_storeStrong((id *)&v21->_accessObject, a4);
    v21->_authorizationValue = a5;
    v21->_authorizationReason = a6;
    v21->_authorizationVersion = a7;
    objc_storeStrong((id *)&v21->_lastModifiedDate, a8);
    v21->_flags = a9;
    v21->_replaceStoredCodeRequirement = a10;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(TCCDAccessRecord *)self subjectIdentity];
  v6 = [(TCCDAccessRecord *)self accessObject];
  unint64_t v7 = [(TCCDAccessRecord *)self authorizationValue];
  unint64_t v8 = [(TCCDAccessRecord *)self authorizationReason];
  unint64_t v9 = [(TCCDAccessRecord *)self authorizationValue];
  v10 = [(TCCDAccessRecord *)self lastModifiedDate];
  unint64_t v11 = [(TCCDAccessRecord *)self flags];
  LOBYTE(v14) = [(TCCDAccessRecord *)self replaceStoredCodeRequirement];
  id v12 = [v4 initWithSubject:v5 object:v6 authorizationValue:v7 authorizationReason:v8 authorizationVersion:v9 lastModified:v10 flags:v11 replaceStoredCodeRequirement:v14];

  return v12;
}

- (id)_dateFormatter
{
  if (qword_1000AC6D8 != -1) {
    dispatch_once(&qword_1000AC6D8, &stru_100096528);
  }
  v2 = (void *)qword_1000AC6D0;
  return v2;
}

- (id)descriptionDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(TCCDAccessRecord *)self subjectIdentity];
  v5 = [v4 description];
  [v3 setObject:v5 forKeyedSubscript:@"Sub"];

  v6 = [(TCCDAccessRecord *)self accessObject];
  unint64_t v7 = [v6 description];
  [v3 setObject:v7 forKeyedSubscript:@"Obj"];

  unint64_t v8 = [(TCCDAccessRecord *)self accessObject];
  unint64_t v9 = [v8 serviceObject];
  v10 = objc_msgSend(v9, "descriptionForAuthorizationValue:reason:", -[TCCDAccessRecord authorizationValue](self, "authorizationValue"), -[TCCDAccessRecord authorizationReason](self, "authorizationReason"));
  [v3 setObject:v10 forKeyedSubscript:@"Auth"];

  unint64_t v11 = +[NSString stringWithFormat:@"%llu", [(TCCDAccessRecord *)self authorizationVersion]];
  [v3 setObject:v11 forKeyedSubscript:@"AuthVersion"];

  id v12 = [(TCCDAccessRecord *)self _dateFormatter];
  v13 = [(TCCDAccessRecord *)self lastModifiedDate];
  uint64_t v14 = [v12 stringFromDate:v13];
  [v3 setObject:v14 forKeyedSubscript:@"Mod"];

  if ([(TCCDAccessRecord *)self flags])
  {
    id v15 = objc_alloc_init((Class)NSMutableString);
    [v15 appendFormat:@"{"];
    if ([(TCCDAccessRecord *)self flags])
    {
      [v15 appendFormat:@"Timeout"];
      if (([(TCCDAccessRecord *)self flags] & 2) == 0)
      {
        int v16 = 1;
        goto LABEL_10;
      }
      [v15 appendFormat:@" | "];
      int v16 = 2;
    }
    else
    {
      if (([(TCCDAccessRecord *)self flags] & 2) == 0)
      {
        int v16 = 0;
        goto LABEL_10;
      }
      int v16 = 1;
    }
    [v15 appendFormat:@"SB Ext"];
LABEL_10:
    if (([(TCCDAccessRecord *)self flags] & 4) != 0)
    {
      if (v16) {
        [v15 appendFormat:@" | "];
      }
      [v15 appendFormat:@"Allow Standard User to Set System Service"];
      ++v16;
    }
    if (([(TCCDAccessRecord *)self flags] & 8) != 0)
    {
      if (v16) {
        [v15 appendFormat:@" | "];
      }
      [v15 appendFormat:@"Next Request Should Prompt"];
      int v16 = 1;
    }
    if (([(TCCDAccessRecord *)self flags] & 0x10) != 0)
    {
      if (v16) {
        [v15 appendFormat:@" | "];
      }
      CFStringRef v17 = @"Has Prompted For Allow";
    }
    else
    {
      if (v16)
      {
LABEL_25:
        [v15 appendFormat:@"}"];
        [v3 setObject:v15 forKeyedSubscript:@"Flags"];

        goto LABEL_26;
      }
      CFStringRef v17 = @"Default";
    }
    [v15 appendFormat:v17];
    goto LABEL_25;
  }
LABEL_26:
  id v18 = [v3 copy];

  return v18;
}

- (id)description
{
  v2 = [(TCCDAccessRecord *)self descriptionDictionary];
  id v3 = [v2 description];

  return v3;
}

- (TCCDIdentity)subjectIdentity
{
  return (TCCDIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubjectIdentity:(id)a3
{
}

- (TCCDAccessObject)accessObject
{
  return (TCCDAccessObject *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessObject:(id)a3
{
}

- (unint64_t)authorizationValue
{
  return self->_authorizationValue;
}

- (void)setAuthorizationValue:(unint64_t)a3
{
  self->_authorizationValue = a3;
}

- (unint64_t)authorizationReason
{
  return self->_authorizationReason;
}

- (void)setAuthorizationReason:(unint64_t)a3
{
  self->_authorizationReason = a3;
}

- (unint64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (void)setAuthorizationVersion:(unint64_t)a3
{
  self->_authorizationVersion = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastModifiedDate:(id)a3
{
}

- (BOOL)replaceStoredCodeRequirement
{
  return self->_replaceStoredCodeRequirement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_accessObject, 0);
  objc_storeStrong((id *)&self->_subjectIdentity, 0);
}

@end