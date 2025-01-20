@interface NFDigitalCarKeyEndEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)didError;
- (NFApplet)applet;
- (NFDigitalCarKeyEndEvent)initWithCoder:(id)a3;
- (NSNumber)brandCode;
- (NSString)keyIdentifier;
- (id)appletIdentifier;
- (id)asDictionary;
- (id)description;
- (id)initFromContactlessPaymentEndEvent:(id)a3;
- (unsigned)result;
- (void)_setApplet:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFDigitalCarKeyEndEvent

- (id)initFromContactlessPaymentEndEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NFDigitalCarKeyEndEvent;
  v5 = [(NFDigitalCarKeyEndEvent *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 appletIdentifier];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 keyIdentifier];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_didError = [v4 didError];
    v5->_result = [v4 result];
    v10 = [v4 parsedInfo];

    if (v10)
    {
      v11 = [v4 parsedInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"PairingModeBrandCode"];
      brandCode = v5->_brandCode;
      v5->_brandCode = (NSNumber *)v12;
    }
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v11.receiver = self;
  v11.super_class = (Class)NFDigitalCarKeyEndEvent;
  id v4 = [(NFDigitalCarKeyEndEvent *)&v11 description];
  appletIdentifier = self->_appletIdentifier;
  keyIdentifier = self->_keyIdentifier;
  if (self->_didError) {
    CFStringRef v7 = @"yes";
  }
  else {
    CFStringRef v7 = @"no";
  }
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:self->_result];
  id v9 = [v3 initWithFormat:@"%@ { applet=%@ endpoint=%@ didError=%@ result=%@ brandCode=%@ }", v4, appletIdentifier, keyIdentifier, v7, v8, self->_brandCode];

  return v9;
}

- (id)asDictionary
{
  appletIdentifier = self->_appletIdentifier;
  v10[0] = @"applet";
  v10[1] = @"endpoint";
  keyIdentifier = self->_keyIdentifier;
  v11[0] = appletIdentifier;
  v11[1] = keyIdentifier;
  CFStringRef v5 = @"no";
  if (self->_didError) {
    CFStringRef v5 = @"yes";
  }
  v11[2] = v5;
  v10[2] = @"didError";
  v10[3] = @"result";
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:self->_result];
  v10[4] = @"brandCode";
  brandCode = self->_brandCode;
  v11[3] = v6;
  v11[4] = brandCode;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
}

- (NFDigitalCarKeyEndEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyEndEvent;
  CFStringRef v5 = [(NFDigitalCarKeyEndEvent *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v5->_didError = [v4 decodeBoolForKey:@"didError"];
    v5->_result = [v4 decodeInt32ForKey:@"result"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandCode"];
    brandCode = v5->_brandCode;
    v5->_brandCode = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appletIdentifier = self->_appletIdentifier;
  id v5 = a3;
  [v5 encodeObject:appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
  [v5 encodeBool:self->_didError forKey:@"didError"];
  [v5 encodeInt32:self->_result forKey:@"result"];
  [v5 encodeObject:self->_brandCode forKey:@"brandCode"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)result
{
  return self->_result;
}

- (NSNumber)brandCode
{
  return self->_brandCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandCode, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);

  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end