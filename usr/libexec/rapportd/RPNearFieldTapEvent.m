@interface RPNearFieldTapEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isKnownIdentity;
- (BOOL)isSameAccount;
- (BOOL)isUnsupportedApplicationLabel;
- (BOOL)shouldForceSingleBandAWDLMode;
- (NSData)pkData;
- (NSDate)date;
- (NSString)accountID;
- (NSString)applicationDomain;
- (NSString)applicationLabel;
- (NSString)contactID;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)identifier;
- (NSUUID)bonjourListenerUUID;
- (RPNearFieldTapEvent)initWithCoder:(id)a3;
- (RPNearFieldTapEvent)initWithIdentifier:(id)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 isSameAccount:(BOOL)a7 contactID:(id)a8 accountID:(id)a9 forceSingleBandAWDLMode:(BOOL)a10 knownIdentity:(BOOL)a11 isUnsupportedApplicationLabel:(BOOL)a12 flags:(unsigned int)a13;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setContactID:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation RPNearFieldTapEvent

- (RPNearFieldTapEvent)initWithIdentifier:(id)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 isSameAccount:(BOOL)a7 contactID:(id)a8 accountID:(id)a9 forceSingleBandAWDLMode:(BOOL)a10 knownIdentity:(BOOL)a11 isUnsupportedApplicationLabel:(BOOL)a12 flags:(unsigned int)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  id v24 = a9;
  v39.receiver = self;
  v39.super_class = (Class)RPNearFieldTapEvent;
  v25 = [(RPNearFieldTapEvent *)&v39 init];
  if (v25)
  {
    v26 = (NSString *)[v19 copy];
    identifier = v25->_identifier;
    v25->_identifier = v26;

    v28 = (NSString *)[v20 copy];
    applicationLabel = v25->_applicationLabel;
    v25->_applicationLabel = v28;

    v30 = (NSData *)[v21 copy];
    pkData = v25->_pkData;
    v25->_pkData = v30;

    objc_storeStrong((id *)&v25->_bonjourListenerUUID, a6);
    v25->_isSameAccount = a7;
    v32 = (NSString *)[v23 copy];
    contactID = v25->_contactID;
    v25->_contactID = v32;

    v34 = (NSString *)[v24 copy];
    accountID = v25->_accountID;
    v25->_accountID = v34;

    v25->_shouldForceSingleBandAWDLMode = a10;
    uint64_t v36 = +[NSDate now];
    date = v25->_date;
    v25->_date = (NSDate *)v36;

    v25->_isKnownIdentity = a11;
    v25->_isUnsupportedApplicationLabel = a12;
    v25->_flags = a13;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearFieldTapEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RPNearFieldTapEvent;
  v5 = [(RPNearFieldTapEvent *)&v24 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  p_identifier = &v5->_identifier;
  id v8 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v9 = v8;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v10 = v9;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v11 = v10;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v12 = v11;
  if ([v12 containsValueForKey:@"isSameAccount"]) {
    v6->_isSameAccount = [v12 decodeBoolForKey:@"isSameAccount"];
  }

  id v13 = v12;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v14 = v13;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v15 = v14;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v16 = v15;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v17 = v16;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  id v18 = v17;
  if ([v18 containsValueForKey:@"forceSingleBand"]) {
    v6->_shouldForceSingleBandAWDLMode = [v18 decodeBoolForKey:@"forceSingleBand"];
  }

  id v19 = v18;
  if ([v19 containsValueForKey:@"knownIdentity"]) {
    v6->_isKnownIdentity = [v19 decodeBoolForKey:@"knownIdentity"];
  }

  id v20 = v19;
  if ([v20 containsValueForKey:@"isUnsupportedApplicationLabel"]) {
    v6->_isUnsupportedApplicationLabel = [v20 decodeBoolForKey:@"isUnsupportedApplicationLabel"];
  }

  uint64_t v25 = 0;
  if (NSDecodeSInt64RangedIfPresent()) {
    v6->_flags = v25;
  }
  if (!*p_identifier || !v6->_applicationLabel || !v6->_date)
  {
    id v22 = RPErrorF();
    [v20 failWithError:v22];

LABEL_17:
    id v21 = 0;
    goto LABEL_18;
  }
  id v21 = v6;
LABEL_18:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v15 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v15;
  }
  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    [v15 encodeObject:applicationLabel forKey:@"appLabel"];
    id v4 = v15;
  }
  pkData = self->_pkData;
  if (pkData)
  {
    [v15 encodeObject:pkData forKey:@"pkDataKey"];
    id v4 = v15;
  }
  date = self->_date;
  if (date)
  {
    [v15 encodeObject:date forKey:@"date"];
    id v4 = v15;
  }
  if (self->_isSameAccount)
  {
    [v15 encodeBool:1 forKey:@"isSameAccount"];
    id v4 = v15;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    [v15 encodeObject:deviceName forKey:@"deviceName"];
    id v4 = v15;
  }
  deviceModel = self->_deviceModel;
  if (deviceModel)
  {
    [v15 encodeObject:deviceModel forKey:@"deviceModel"];
    id v4 = v15;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    [v15 encodeObject:accountID forKey:@"accountID"];
    id v4 = v15;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    [v15 encodeObject:contactID forKey:@"contactID"];
    id v4 = v15;
  }
  bonjourListenerUUID = self->_bonjourListenerUUID;
  if (bonjourListenerUUID)
  {
    [v15 encodeObject:bonjourListenerUUID forKey:@"bonjourListenerUUIDKey"];
    id v4 = v15;
  }
  if (self->_shouldForceSingleBandAWDLMode)
  {
    [v15 encodeBool:1 forKey:@"forceSingleBand"];
    id v4 = v15;
  }
  if (self->_isKnownIdentity)
  {
    [v15 encodeBool:1 forKey:@"knownIdentity"];
    id v4 = v15;
  }
  if (self->_isUnsupportedApplicationLabel)
  {
    [v15 encodeBool:1 forKey:@"isUnsupportedApplicationLabel"];
    id v4 = v15;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v15 encodeInt64:flags forKey:@"flags"];
    id v4 = v15;
  }
}

- (id)description
{
  return [(RPNearFieldTapEvent *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL isSameAccount = self->_isSameAccount;
  contactID = self->_contactID;
  applicationDomain = self->_applicationDomain;
  date = self->_date;
  identifier = self->_identifier;
  applicationLabel = self->_applicationLabel;
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  if (self->_flags)
  {
    objc_super v24 = v4;
    identifier = (NSString *)self->_flags;
    applicationLabel = (NSString *)&unk_10011B499;
    NSAppendPrintF();
    id v6 = v24;

    v5 = v6;
  }
  pkData = self->_pkData;
  NSUInteger v8 = [(NSData *)pkData length];
  id v17 = pkData;
  NSUInteger v19 = v8;
  NSAppendPrintF();
  id v9 = v5;

  id v10 = [(NSUUID *)self->_bonjourListenerUUID UUIDString];
  NSAppendPrintF();
  id v11 = v9;

  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  NSAppendPrintF();
  id v14 = v13;

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)applicationDomain
{
  return self->_applicationDomain;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (NSDate)date
{
  return self->_date;
}

- (unsigned)flags
{
  return self->_flags;
}

- (BOOL)isSameAccount
{
  return self->_isSameAccount;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (BOOL)shouldForceSingleBandAWDLMode
{
  return self->_shouldForceSingleBandAWDLMode;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (BOOL)isUnsupportedApplicationLabel
{
  return self->_isUnsupportedApplicationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourListenerUUID, 0);
  objc_storeStrong((id *)&self->_pkData, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_applicationDomain, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end