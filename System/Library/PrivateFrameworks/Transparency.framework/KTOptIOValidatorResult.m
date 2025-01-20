@interface KTOptIOValidatorResult
+ (BOOL)supportsSecureCoding;
- (BOOL)usedIntendedState;
- (KTOptIOValidatorResult)initWithCoder:(id)a3;
- (KTOptIOValidatorResult)initWithState:(unint64_t)a3 timestamp:(id)a4;
- (NSArray)uris;
- (NSDate)timestamp;
- (NSDictionary)uriNeedsOptInChange;
- (id)description;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUriNeedsOptInChange:(id)a3;
- (void)setUris:(id)a3;
- (void)setUsedIntendedState:(BOOL)a3;
@end

@implementation KTOptIOValidatorResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTOptIOValidatorResult)initWithState:(unint64_t)a3 timestamp:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTOptIOValidatorResult;
  v7 = [(KTOptIOValidatorResult *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(KTOptIOValidatorResult *)v7 setState:a3];
    [(KTOptIOValidatorResult *)v8 setTimestamp:v6];
    v9 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "encodeInt:forKey:", -[KTOptIOValidatorResult state](self, "state"), @"state");
  v4 = [(KTOptIOValidatorResult *)self uriNeedsOptInChange];

  if (v4)
  {
    v5 = [(KTOptIOValidatorResult *)self uriNeedsOptInChange];
    [v10 encodeObject:v5 forKey:@"uriNeedsOptInChange"];
  }
  id v6 = [(KTOptIOValidatorResult *)self uris];

  if (v6)
  {
    v7 = [(KTOptIOValidatorResult *)self uris];
    [v10 encodeObject:v7 forKey:@"uris"];
  }
  v8 = [(KTOptIOValidatorResult *)self timestamp];

  if (v8)
  {
    v9 = [(KTOptIOValidatorResult *)self timestamp];
    [v10 encodeObject:v9 forKey:@"timestamp"];
  }
  if ([(KTOptIOValidatorResult *)self usedIntendedState]) {
    objc_msgSend(v10, "encodeInt:forKey:", -[KTOptIOValidatorResult usedIntendedState](self, "usedIntendedState"), @"usedIntendedState");
  }
}

- (KTOptIOValidatorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeIntForKey:@"state"];
  int v6 = [v4 decodeIntForKey:@"usedIntendedState"];
  if (v5 <= 2
    && (int v7 = v6,
        v15.receiver = self,
        v15.super_class = (Class)KTOptIOValidatorResult,
        v8 = [(KTOptIOValidatorResult *)&v15 init],
        (self = v8) != 0))
  {
    [(KTOptIOValidatorResult *)v8 setState:(int)v5];
    uint64_t v9 = objc_opt_class();
    id v10 = [v4 decodeDictionaryWithKeysOfClass:v9 objectsOfClass:objc_opt_class() forKey:@"uriNeedsOptInChange"];
    [(KTOptIOValidatorResult *)self setUriNeedsOptInChange:v10];

    objc_super v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"uris"];
    [(KTOptIOValidatorResult *)self setUris:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    [(KTOptIOValidatorResult *)self setTimestamp:v12];

    [(KTOptIOValidatorResult *)self setUsedIntendedState:v7 != 0];
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(KTOptIOValidatorResult *)self state];
  unsigned int v5 = [(KTOptIOValidatorResult *)self timestamp];
  int v6 = [(KTOptIOValidatorResult *)self uriNeedsOptInChange];
  int v7 = [v3 stringWithFormat:@"<KTOptIOValidatorResult state: %d timestamp: %@ uriNeedsOptInChange: %@>", v4, v5, v6];

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)uriNeedsOptInChange
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriNeedsOptInChange:(id)a3
{
}

- (NSArray)uris
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUris:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)usedIntendedState
{
  return self->_usedIntendedState;
}

- (void)setUsedIntendedState:(BOOL)a3
{
  self->_usedIntendedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_uris, 0);

  objc_storeStrong((id *)&self->_uriNeedsOptInChange, 0);
}

@end