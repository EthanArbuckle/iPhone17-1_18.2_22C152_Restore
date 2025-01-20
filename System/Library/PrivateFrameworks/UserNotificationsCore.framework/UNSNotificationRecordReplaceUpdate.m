@interface UNSNotificationRecordReplaceUpdate
+ (BOOL)supportsSecureCoding;
+ (id)updateWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRepost;
- (UNSNotificationRecord)replacedNotificationRecord;
- (UNSNotificationRecordReplaceUpdate)initWithCoder:(id)a3;
- (id)_initWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNSNotificationRecordReplaceUpdate

+ (id)updateWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) _initWithNotificationRecord:v9 replacedNotificationRecord:v8 shouldRepost:v5];

  return v10;
}

- (id)_initWithNotificationRecord:(id)a3 replacedNotificationRecord:(id)a4 shouldRepost:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  v10 = [(UNCNotificationRecordUpdate *)&v13 _initWithNotificationRecord:a3 shouldSync:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 4, a4);
    *((unsigned char *)v11 + 24) = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  if ([(UNCNotificationRecordUpdate *)&v10 isEqual:v4])
  {
    id v5 = v4;
    v6 = [(UNSNotificationRecordReplaceUpdate *)self replacedNotificationRecord];
    v7 = [v5 replacedNotificationRecord];

    char v8 = UNEqualObjects();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  v10.receiver = self;
  v10.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNCNotificationRecordUpdate hash](&v10, sel_hash));
  id v5 = [(UNSNotificationRecordReplaceUpdate *)self replacedNotificationRecord];
  id v6 = (id)[v3 appendObject:v5];

  id v7 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecordReplaceUpdate shouldRepost](self, "shouldRepost"));
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  id v4 = a3;
  [(UNCNotificationRecordUpdate *)&v6 encodeWithCoder:v4];
  id v5 = [(UNSNotificationRecordReplaceUpdate *)self replacedNotificationRecord];
  [v4 encodeObject:v5 forKey:@"replacedNotificationRecord"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNSNotificationRecordReplaceUpdate shouldRepost](self, "shouldRepost"), @"shouldRepost");
}

- (UNSNotificationRecordReplaceUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNSNotificationRecordReplaceUpdate;
  id v5 = [(UNCNotificationRecordUpdate *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replacedNotificationRecord"];
    replacedNotificationRecord = v5->_replacedNotificationRecord;
    v5->_replacedNotificationRecord = (UNSNotificationRecord *)v6;

    v5->_shouldRepost = [v4 decodeBoolForKey:@"shouldRepost"];
  }

  return v5;
}

- (UNSNotificationRecord)replacedNotificationRecord
{
  return self->_replacedNotificationRecord;
}

- (BOOL)shouldRepost
{
  return self->_shouldRepost;
}

- (void).cxx_destruct
{
}

@end