@interface PKPeerPaymentAssociatedAccountRemovalRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPresentedNotification;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSString)altDSID;
- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithCoder:(id)a3;
- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)reason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setDate:(id)a3;
- (void)setHasPresentedNotification:(BOOL)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation PKPeerPaymentAssociatedAccountRemovalRecord

- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountRemovalRecord;
  v5 = [(PKPeerPaymentAssociatedAccountRemovalRecord *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"removalReason"];
    v9 = v8;
    uint64_t v10 = 0;
    if (v8 == @"closed" || !v8) {
      goto LABEL_12;
    }
    char v11 = [(__CFString *)v8 isEqualToString:@"closed"];

    if ((v11 & 1) == 0)
    {
      v12 = v9;
      if (v12 == @"graduation"
        || (v13 = v12,
            char v14 = [(__CFString *)v12 isEqualToString:@"graduation"],
            v13,
            (v14 & 1) != 0))
      {
        uint64_t v10 = 1;
        goto LABEL_12;
      }
      v15 = v13;
      if (v15 == @"deletedInvite"
        || (v16 = v15,
            int v17 = [(__CFString *)v15 isEqualToString:@"deletedInvite"],
            v16,
            v17))
      {
        uint64_t v10 = 2;
        goto LABEL_12;
      }
    }
    uint64_t v10 = 0;
LABEL_12:

    v5->_reason = v10;
    uint64_t v18 = [v4 PKDateForKey:@"removalDate"];
    date = v5->_date;
    v5->_date = (NSDate *)v18;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAssociatedAccountRemovalRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentAssociatedAccountRemovalRecord;
  v5 = [(PKPeerPaymentAssociatedAccountRemovalRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v5->_reason = [v4 decodeIntegerForKey:@"reason"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_hasPresentedNotification = [v4 decodeBoolForKey:@"hasPresentedNotification"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeBool:self->_hasPresentedNotification forKey:@"hasPresentedNotification"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  int64_t reason = self->_reason;
  id v5 = @"closed";
  if (reason == 1) {
    id v5 = @"graduation";
  }
  if (reason == 2) {
    uint64_t v6 = @"deletedInvite";
  }
  else {
    uint64_t v6 = v5;
  }
  [v3 appendFormat:@"reason: '%@'; ", v6];
  [v3 appendFormat:@"date: '%@'; ", self->_date];
  if (self->_hasPresentedNotification) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"hasPresentedNotification: '%@'; ", v7];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  id v5 = (void *)v4[2];
  uint64_t v6 = self->_altDSID;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_14;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_14;
    }
  }
  if (self->_reason == v4[3])
  {
    date = self->_date;
    objc_super v11 = (NSDate *)v4[4];
    if (date && v11)
    {
      if (-[NSDate isEqual:](date, "isEqual:")) {
        goto LABEL_17;
      }
    }
    else if (date == v11)
    {
LABEL_17:
      BOOL v12 = self->_hasPresentedNotification == *((unsigned __int8 *)v4 + 8);
      goto LABEL_15;
    }
  }
LABEL_14:
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_date];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_reason - v4 + 32 * v4;
  unint64_t v6 = self->_hasPresentedNotification - v5 + 32 * v5;

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_int64_t reason = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)hasPresentedNotification
{
  return self->_hasPresentedNotification;
}

- (void)setHasPresentedNotification:(BOOL)a3
{
  self->_hasPresentedNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end