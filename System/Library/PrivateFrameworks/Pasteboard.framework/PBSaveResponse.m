@interface PBSaveResponse
+ (BOOL)supportsSecureCoding;
- (PBSaveResponse)initWithCoder:(id)a3;
- (PBSaveResponse)initWithNotificationState:(unint64_t)a3 changeCount:(int64_t)a4 sharingToken:(id)a5;
- (UISPasteSharingToken)sharingToken;
- (int64_t)changeCount;
- (unint64_t)notificationState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBSaveResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBSaveResponse)initWithNotificationState:(unint64_t)a3 changeCount:(int64_t)a4 sharingToken:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PBSaveResponse;
  v10 = [(PBSaveResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_notificationState = a3;
    v10->_changeCount = a4;
    objc_storeStrong((id *)&v10->_sharingToken, a5);
  }

  return v11;
}

- (PBSaveResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"notificationState"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"changeCount"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingToken"];

  v8 = [(PBSaveResponse *)self initWithNotificationState:v5 changeCount:v6 sharingToken:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t notificationState = self->_notificationState;
  id v5 = a3;
  [v5 encodeInt64:notificationState forKey:@"notificationState"];
  [v5 encodeInteger:self->_changeCount forKey:@"changeCount"];
  [v5 encodeObject:self->_sharingToken forKey:@"sharingToken"];
}

- (unint64_t)notificationState
{
  return self->_notificationState;
}

- (int64_t)changeCount
{
  return self->_changeCount;
}

- (UISPasteSharingToken)sharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end