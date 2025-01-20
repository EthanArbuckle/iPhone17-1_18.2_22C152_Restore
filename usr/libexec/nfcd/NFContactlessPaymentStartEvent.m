@interface NFContactlessPaymentStartEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)background;
- (NFApplet)applet;
- (NFContactlessPaymentStartEvent)initWithCoder:(id)a3;
- (NFContactlessPaymentStartEvent)initWithDictionary:(id)a3;
- (NSString)keyIdentifier;
- (NSString)spIdentifier;
- (id)appletIdentifier;
- (id)asDictionary;
- (id)description;
- (unsigned)paymentMode;
- (unsigned)selectStatus;
- (void)_setApplet:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyIdentifier:(id)a3;
@end

@implementation NFContactlessPaymentStartEvent

- (NFContactlessPaymentStartEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFContactlessPaymentStartEvent;
  v5 = [(NFContactlessPaymentStartEvent *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"endPointIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"selectStatus"];
    v5->_selectStatus = (unsigned __int16)[v10 unsignedShortValue];

    v11 = [v4 objectForKeyedSubscript:@"paymentMode"];
    v5->_paymentMode = (unsigned __int16)[v11 unsignedShortValue];

    uint64_t v12 = [v4 objectForKeyedSubscript:@"spIdentifier"];
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v12;

    v14 = [v4 objectForKeyedSubscript:@"BackgroundTransaction"];
    v5->_background = [v14 BOOLValue];
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)NFContactlessPaymentStartEvent;
  id v4 = [(NFContactlessPaymentStartEvent *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ { applet=%@ endpoint=%@ select=0x%04x mode=0x%04x spid=%@ background=%d }", v4, self->_appletIdentifier, self->_keyIdentifier, self->_selectStatus, self->_paymentMode, self->_spIdentifier, self->_background];

  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc((Class)NSDictionary);
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  uint64_t v6 = +[NSNumber numberWithUnsignedShort:self->_selectStatus];
  objc_super v7 = +[NSNumber numberWithUnsignedShort:self->_paymentMode];
  spIdentifier = self->_spIdentifier;
  v9 = +[NSNumber numberWithBool:self->_background];
  id v10 = [v3 initWithObjectsAndKeys:appletIdentifier, @"applet", keyIdentifier, @"endpoint", v6, @"selectStatus", v7, @"mode", spIdentifier, @"spIdentifier", v9, @"background", 0];

  return v10;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
}

- (NFContactlessPaymentStartEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFContactlessPaymentStartEvent;
  id v5 = [(NFContactlessPaymentStartEvent *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPointIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_selectStatus = (unsigned __int16)[v4 decodeInt32ForKey:@"selectStatus"];
    v5->_paymentMode = (unsigned __int16)[v4 decodeInt32ForKey:@"paymentMode"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spIdentifier"];
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;

    v5->_background = [v4 decodeBoolForKey:@"BackgroundTransaction"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appletIdentifier = self->_appletIdentifier;
  id v5 = a3;
  [v5 encodeObject:appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"endPointIdentifier"];
  [v5 encodeInt32:self->_selectStatus forKey:@"selectStatus"];
  [v5 encodeInt32:self->_paymentMode forKey:@"paymentMode"];
  [v5 encodeObject:self->_spIdentifier forKey:@"spIdentifier"];
  [v5 encodeBool:self->_background forKey:@"BackgroundTransaction"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (unsigned)selectStatus
{
  return self->_selectStatus;
}

- (unsigned)paymentMode
{
  return self->_paymentMode;
}

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);

  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end