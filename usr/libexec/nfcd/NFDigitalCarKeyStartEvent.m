@interface NFDigitalCarKeyStartEvent
+ (BOOL)supportsSecureCoding;
- (NFApplet)applet;
- (NFDigitalCarKeyStartEvent)initWithCoder:(id)a3;
- (NSString)keyIdentifier;
- (NSString)spIdentifier;
- (id)asDictionary;
- (id)description;
- (id)initFromContactlessPaymentStartEvent:(id)a3;
- (void)_setApplet:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NFDigitalCarKeyStartEvent

- (id)initFromContactlessPaymentStartEvent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyStartEvent;
  v5 = [(NFDigitalCarKeyStartEvent *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 appletIdentifier];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 keyIdentifier];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 spIdentifier];
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)NFDigitalCarKeyStartEvent;
  id v4 = [(NFDigitalCarKeyStartEvent *)&v7 description];
  id v5 = [v3 initWithFormat:@"%@ { applet=%@ endpoint=%@ spid=%@ }", v4, self->_appletIdentifier, self->_keyIdentifier, self->_spIdentifier];

  return v5;
}

- (id)asDictionary
{
  appletIdentifier = self->_appletIdentifier;
  v7[0] = @"applet";
  v7[1] = @"endpoint";
  keyIdentifier = self->_keyIdentifier;
  spIdentifier = self->_spIdentifier;
  v8[0] = appletIdentifier;
  v8[1] = keyIdentifier;
  v7[2] = @"spIdentifier";
  v8[2] = spIdentifier;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)_setApplet:(id)a3
{
}

- (NFDigitalCarKeyStartEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFDigitalCarKeyStartEvent;
  id v5 = [(NFDigitalCarKeyStartEvent *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletIdentifier"];
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spIdentifier"];
    spIdentifier = v5->_spIdentifier;
    v5->_spIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  appletIdentifier = self->_appletIdentifier;
  id v5 = a3;
  [v5 encodeObject:appletIdentifier forKey:@"appletIdentifier"];
  [v5 encodeObject:self->_keyIdentifier forKey:@"keyIdentifier"];
  [v5 encodeObject:self->_spIdentifier forKey:@"spIdentifier"];
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

- (NSString)spIdentifier
{
  return self->_spIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);

  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end