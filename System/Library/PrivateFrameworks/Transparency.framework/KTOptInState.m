@interface KTOptInState
+ (BOOL)supportsSecureCoding;
- (BOOL)everOptIn;
- (KTOptInState)initWithApplication:(id)a3;
- (KTOptInState)initWithCoder:(id)a3;
- (KTOptInState)initWithURI:(id)a3 application:(id)a4;
- (NSDate)smtTimestamp;
- (NSString)application;
- (NSString)osVersion;
- (NSString)serialNumber;
- (NSString)uri;
- (id)debugDescription;
- (id)description;
- (id)jsonDescription;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setApplication:(id)a3;
- (void)setEverOptIn:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSmtTimestamp:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUri:(id)a3;
@end

@implementation KTOptInState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(KTOptInState *)self application];
  [v13 encodeObject:v4 forKey:@"application"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[KTOptInState state](self, "state"), @"state");
  objc_msgSend(v13, "encodeInteger:forKey:", -[KTOptInState everOptIn](self, "everOptIn"), @"everOptIn");
  v5 = [(KTOptInState *)self uri];

  if (v5)
  {
    v6 = [(KTOptInState *)self uri];
    [v13 encodeObject:v6 forKey:@"uri"];
  }
  v7 = [(KTOptInState *)self smtTimestamp];

  if (v7)
  {
    v8 = [(KTOptInState *)self smtTimestamp];
    [v13 encodeObject:v8 forKey:@"smtTimestamp"];
  }
  v9 = [(KTOptInState *)self osVersion];

  if (v9)
  {
    v10 = [(KTOptInState *)self osVersion];
    [v13 encodeObject:v10 forKey:@"osVersion"];
  }
  v11 = [(KTOptInState *)self serialNumber];

  if (v11)
  {
    v12 = [(KTOptInState *)self serialNumber];
    [v13 encodeObject:v12 forKey:@"serialNumber"];
  }
}

- (KTOptInState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
  unint64_t v7 = [v4 decodeIntegerForKey:@"state"];
  v8 = 0;
  if (v6)
  {
    unint64_t v9 = v7;
    if ((v7 & 0x8000000000000000) == 0 && v7 <= 2)
    {
      v15.receiver = self;
      v15.super_class = (Class)KTOptInState;
      v10 = [(KTOptInState *)&v15 init];
      self = v10;
      if (v10)
      {
        [(KTOptInState *)v10 setUri:v5];
        [(KTOptInState *)self setApplication:v6];
        [(KTOptInState *)self setState:v9];
        -[KTOptInState setEverOptIn:](self, "setEverOptIn:", [v4 decodeIntegerForKey:@"everOptIn"] != 0);
        v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smtTimestamp"];
        [(KTOptInState *)self setSmtTimestamp:v11];

        v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
        [(KTOptInState *)self setOsVersion:v12];

        id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
        [(KTOptInState *)self setSerialNumber:v13];

        self = self;
        v8 = self;
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (KTOptInState)initWithURI:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTOptInState;
  v8 = [(KTOptInState *)&v12 init];
  unint64_t v9 = v8;
  if (v8)
  {
    [(KTOptInState *)v8 setUri:v6];
    [(KTOptInState *)v9 setApplication:v7];
    [(KTOptInState *)v9 setState:2];
    v10 = v9;
  }

  return v9;
}

- (KTOptInState)initWithApplication:(id)a3
{
  return [(KTOptInState *)self initWithURI:0 application:a3];
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(KTOptInState *)self state];
  v5 = @"Off";
  if (v4 == 1) {
    v5 = @"On";
  }
  if (v4 == 2) {
    v5 = @"Pending";
  }
  id v6 = v5;
  id v7 = [(KTOptInState *)self uri];
  v8 = [(KTOptInState *)self application];
  unint64_t v9 = [v3 stringWithFormat:@"<KTOptInState: s: %@ u: %@[%@]>", v6, v7, v8];

  return v9;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(KTOptInState *)self state];
  v5 = @"Off";
  if (v4 == 1) {
    v5 = @"On";
  }
  if (v4 == 2) {
    v5 = @"Pending";
  }
  id v6 = v5;
  id v7 = [(KTOptInState *)self uri];
  v8 = [(KTOptInState *)self application];
  unint64_t v9 = [v3 stringWithFormat:@"<KTOptInState: %p s: %@ u: %@[%@]>", self, v6, v7, v8];

  return v9;
}

- (id)jsonDescription
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v4 = [(KTOptInState *)self state];
  v5 = @"Off";
  if (v4 == 1) {
    v5 = @"On";
  }
  if (v4 == 2) {
    id v6 = @"Pending";
  }
  else {
    id v6 = v5;
  }
  [v3 setObject:v6 forKeyedSubscript:@"state"];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[KTOptInState everOptIn](self, "everOptIn"));
  [v3 setObject:v7 forKeyedSubscript:@"everOptIn"];

  v8 = [(KTOptInState *)self application];
  [v3 setObject:v8 forKeyedSubscript:@"application"];

  unint64_t v9 = [(KTOptInState *)self uri];
  [v3 setObject:v9 forKeyedSubscript:@"uri"];

  v10 = [(KTOptInState *)self smtTimestamp];
  v11 = objc_msgSend(v10, "kt_toISO_8601_UTCString");
  [v3 setObject:v11 forKeyedSubscript:@"smtTimestampReadable"];

  objc_super v12 = NSNumber;
  id v13 = [(KTOptInState *)self smtTimestamp];
  [v13 timeIntervalSince1970];
  objc_super v15 = [v12 numberWithDouble:v14 * 1000.0];
  [v3 setObject:v15 forKeyedSubscript:@"smtTimetampMs"];

  v16 = [(KTOptInState *)self osVersion];
  [v3 setObject:v16 forKeyedSubscript:@"osVersion"];

  v17 = [(KTOptInState *)self serialNumber];
  [v3 setObject:v17 forKeyedSubscript:@"serialNumber"];

  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)everOptIn
{
  return self->_everOptIn;
}

- (void)setEverOptIn:(BOOL)a3
{
  self->_everOptIn = a3;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSDate)smtTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSmtTimestamp:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_smtTimestamp, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end