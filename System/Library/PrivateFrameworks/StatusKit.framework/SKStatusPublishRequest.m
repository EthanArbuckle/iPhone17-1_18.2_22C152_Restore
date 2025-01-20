@interface SKStatusPublishRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isScheduledRequest;
- (BOOL)isSecondaryDeviceRepublish;
- (NSDate)dateCreated;
- (NSString)statusUniqueIdentifier;
- (SKStatusPayload)statusPayload;
- (SKStatusPublishRequest)initWithCoder:(id)a3;
- (SKStatusPublishRequest)initWithStatusPayload:(id)a3;
- (SKStatusPublishRequest)initWithStatusPayload:(id)a3 isScheduledRequest:(BOOL)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setIsScheduledRequest:(BOOL)a3;
- (void)setIsSecondaryDeviceRepublish:(BOOL)a3;
- (void)setStatusUniqueIdentifier:(id)a3;
@end

@implementation SKStatusPublishRequest

- (SKStatusPublishRequest)initWithStatusPayload:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKStatusPublishRequest;
  v6 = [(SKStatusPublishRequest *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statusPayload, a3);
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    statusUniqueIdentifier = v7->_statusUniqueIdentifier;
    v7->_statusUniqueIdentifier = (NSString *)v9;

    *(_WORD *)&v7->_isScheduledRequest = 0;
  }

  return v7;
}

- (SKStatusPublishRequest)initWithStatusPayload:(id)a3 isScheduledRequest:(BOOL)a4
{
  result = [(SKStatusPublishRequest *)self initWithStatusPayload:a3];
  if (result) {
    result->_isScheduledRequest = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  statusPayload = self->_statusPayload;
  id v5 = a3;
  [v5 encodeObject:statusPayload forKey:@"statusPayload"];
  [v5 encodeObject:self->_statusUniqueIdentifier forKey:@"statusUniqueIdentifier"];
  [v5 encodeBool:self->_isScheduledRequest forKey:@"scheduledRequest"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
  [v5 encodeBool:self->_isSecondaryDeviceRepublish forKey:@"secondaryDeviceRepublish"];
}

- (SKStatusPublishRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKStatusPublishRequest;
  id v5 = [(SKStatusPublishRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusPayload"];
    statusPayload = v5->_statusPayload;
    v5->_statusPayload = (SKStatusPayload *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusUniqueIdentifier"];
    statusUniqueIdentifier = v5->_statusUniqueIdentifier;
    v5->_statusUniqueIdentifier = (NSString *)v8;

    v5->_isScheduledRequest = [v4 decodeBoolForKey:@"scheduledRequest"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v10;

    v5->_isSecondaryDeviceRepublish = [v4 decodeBoolForKey:@"secondaryDeviceRepublish"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(SKStatusPublishRequest *)self statusUniqueIdentifier];
  uint64_t v6 = [(SKStatusPublishRequest *)self statusPayload];
  v7 = [(SKStatusPublishRequest *)self dateCreated];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = \"%@\"; payload = \"%@\"; dateCreated = \"%@\"; scheduled=%ld, republish=%ld>",
    v4,
    self,
    v5,
    v6,
    v7,
    [(SKStatusPublishRequest *)self isScheduledRequest],
  uint64_t v8 = [(SKStatusPublishRequest *)self isSecondaryDeviceRepublish]);

  return v8;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (BOOL)isScheduledRequest
{
  return self->_isScheduledRequest;
}

- (void)setIsScheduledRequest:(BOOL)a3
{
  self->_isScheduledRequest = a3;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (void)setStatusUniqueIdentifier:(id)a3
{
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (BOOL)isSecondaryDeviceRepublish
{
  return self->_isSecondaryDeviceRepublish;
}

- (void)setIsSecondaryDeviceRepublish:(BOOL)a3
{
  self->_isSecondaryDeviceRepublish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end