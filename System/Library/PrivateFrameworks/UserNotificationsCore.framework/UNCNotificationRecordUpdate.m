@interface UNCNotificationRecordUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSync;
- (UNCNotificationRecordUpdate)initWithCoder:(id)a3;
- (UNSNotificationRecord)notificationRecord;
- (id)_initWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNCNotificationRecordUpdate

- (id)_initWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNCNotificationRecordUpdate;
  v8 = [(UNCNotificationRecordUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationRecord, a3);
    v9->_shouldSync = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UNCNotificationRecordUpdate *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(UNCNotificationRecordUpdate *)self notificationRecord];
      id v7 = [(UNCNotificationRecordUpdate *)v5 notificationRecord];

      char v8 = UNEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  v4 = [(UNCNotificationRecordUpdate *)self notificationRecord];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(UNCNotificationRecordUpdate *)self notificationRecord];
  [v5 encodeObject:v4 forKey:@"notificationRecord"];

  objc_msgSend(v5, "encodeBool:forKey:", -[UNCNotificationRecordUpdate shouldSync](self, "shouldSync"), @"shouldSync");
}

- (UNCNotificationRecordUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationRecordUpdate;
  id v5 = [(UNCNotificationRecordUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationRecord"];
    notificationRecord = v5->_notificationRecord;
    v5->_notificationRecord = (UNSNotificationRecord *)v6;

    v5->_shouldSync = [v4 decodeBoolForKey:@"shouldSync"];
  }

  return v5;
}

- (UNSNotificationRecord)notificationRecord
{
  return self->_notificationRecord;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void).cxx_destruct
{
}

@end