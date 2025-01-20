@interface ICMusicSubscriptionStatusResponse
+ (BOOL)isValidSubscriptionStatusPropertyListRepresentation:(id)a3 error:(id *)a4;
+ (BOOL)isValidSubscriptionStatusResponseDictionary:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isExpired;
- (BOOL)isFinalResponse;
- (BOOL)needsReload;
- (ICMusicSubscriptionStatus)subscriptionStatus;
- (ICMusicSubscriptionStatusResponse)initWithCoder:(id)a3;
- (ICMusicSubscriptionStatusResponse)initWithPropertyListRepresentation:(id)a3;
- (ICMusicSubscriptionStatusResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4;
- (NSDate)expirationDate;
- (NSDictionary)propertyListRepresentation;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFinalResponse:(BOOL)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setSubscriptionStatus:(id)a3;
@end

@implementation ICMusicSubscriptionStatusResponse

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
}

- (void)encodeWithCoder:(id)a3
{
  expirationDate = self->_expirationDate;
  id v5 = a3;
  [v5 encodeObject:expirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_finalResponse forKey:@"isFinalResponse"];
  [v5 encodeBool:self->_needsReload forKey:@"needsReload"];
  [v5 encodeObject:self->_subscriptionStatus forKey:@"subscriptionStatus"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICMusicSubscriptionStatusResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicSubscriptionStatusResponse;
  id v5 = [(ICMusicSubscriptionStatusResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    v5->_finalResponse = [v4 decodeBoolForKey:@"isFinalResponse"];
    v5->_needsReload = [v4 decodeBoolForKey:@"needsReload"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionStatus"];
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (ICMusicSubscriptionStatus *)v8;
  }
  return v5;
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[ICMusicSubscriptionStatusResponse alloc] _init];
  if (v4)
  {
    uint64_t v5 = [(NSDate *)self->_expirationDate copy];
    uint64_t v6 = (void *)v4[3];
    v4[3] = v5;

    *((unsigned char *)v4 + 8) = self->_finalResponse;
    *((unsigned char *)v4 + 9) = self->_needsReload;
    uint64_t v7 = [(ICMusicSubscriptionStatus *)self->_subscriptionStatus copy];
    uint64_t v8 = (void *)v4[2];
    v4[2] = v7;
  }
  return v4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ICMusicSubscriptionStatusResponse;
  return [(ICMusicSubscriptionStatusResponse *)&v3 init];
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    [(NSDate *)expirationDate timeIntervalSinceNow];
    LOBYTE(expirationDate) = v3 < 0.00000011920929;
  }
  return (char)expirationDate;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if (self->_expirationDate) {
    [v6 appendFormat:@"; expirationDate = %@", self->_expirationDate];
  }
  if (self->_finalResponse) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  [v6 appendFormat:@"; isFinalResponse = %@", v7];
  if (self->_needsReload) {
    [v6 appendString:@"; needsReload = YES"];
  }
  [v6 appendFormat:@"; subscriptionStatus = %@", self->_subscriptionStatus];
  [v6 appendString:@">"];

  return v6;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setSubscriptionStatus:(id)a3
{
}

- (NSDictionary)propertyListRepresentation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v4 = [NSNumber numberWithInt:!self->_needsReload];
  [v3 setObject:v4 forKey:@"valid"];

  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    uint64_t v6 = NSNumber;
    [(NSDate *)expirationDate timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKey:@"expiration"];
  }
  subscriptionStatus = self->_subscriptionStatus;
  if (subscriptionStatus)
  {
    v9 = [(ICMusicSubscriptionStatus *)subscriptionStatus dictionaryRepresentation];
    if (v9) {
      [v3 setObject:v9 forKey:@"status"];
    }
  }

  return (NSDictionary *)v3;
}

- (ICMusicSubscriptionStatusResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICMusicSubscriptionStatusResponse *)self _init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = [[ICMusicSubscriptionStatus alloc] initWithResponseDictionary:v6];
      subscriptionStatus = v9->_subscriptionStatus;
      v9->_subscriptionStatus = v10;
    }
    else
    {
      subscriptionStatus = v8->_subscriptionStatus;
      v8->_subscriptionStatus = 0;
    }

    uint64_t v12 = [v7 copy];
    expirationDate = v9->_expirationDate;
    v9->_expirationDate = (NSDate *)v12;
  }
  return v9;
}

- (ICMusicSubscriptionStatusResponse)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICMusicSubscriptionStatusResponse *)self _init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"status"];
    if (_NSIsNSDictionary())
    {
      id v7 = [[ICMusicSubscriptionStatus alloc] initWithResponseDictionary:v6];
      subscriptionStatus = v5->_subscriptionStatus;
      v5->_subscriptionStatus = v7;
    }
    else
    {
      subscriptionStatus = v5->_subscriptionStatus;
      v5->_subscriptionStatus = 0;
    }

    v9 = [v4 objectForKey:@"expiration"];
    if (objc_opt_respondsToSelector())
    {
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v9 doubleValue];
      uint64_t v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v11;
    }
    v13 = [v4 objectForKey:@"valid"];
    if (objc_opt_respondsToSelector()) {
      v5->_needsReload = [v13 BOOLValue] ^ 1;
    }
    v5->_finalResponse = 1;
  }
  return v5;
}

+ (BOOL)isValidSubscriptionStatusResponseDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"status"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v5 objectForKey:@"errorMessage"];
  if (_NSIsNSString())
  {
    id v9 = v8;
    v10 = v9;
    uint64_t v11 = 0;
    if (v7 && v9)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"Subscription status error: %@", v9);
    }
  }
  else
  {
    v10 = 0;
    uint64_t v11 = 0;
  }
  if (a4) {
    *a4 = v11;
  }

  return v11 == 0;
}

+ (BOOL)isValidSubscriptionStatusPropertyListRepresentation:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectForKey:@"status"];
  if (_NSIsNSDictionary())
  {
    id v10 = 0;
    char v7 = [a1 isValidSubscriptionStatusResponseDictionary:v6 error:&v10];
    id v8 = v10;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"Invalid subscription status value: %@", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  char v7 = 0;
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:

  return v7;
}

@end