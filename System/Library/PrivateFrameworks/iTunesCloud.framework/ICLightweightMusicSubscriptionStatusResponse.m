@interface ICLightweightMusicSubscriptionStatusResponse
+ (BOOL)supportsSecureCoding;
- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus;
- (ICLightweightMusicSubscriptionStatusResponse)initWithCoder:(id)a3;
- (id)_initWithExtendedSubscriptionStatusResponse:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICLightweightMusicSubscriptionStatusResponse

- (void).cxx_destruct
{
}

- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus
{
  return self->_lightweightSubscriptionStatus;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICLightweightMusicSubscriptionStatusResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightweightMusicSubscriptionStatusResponse;
  v5 = [(ICLightweightMusicSubscriptionStatusResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightweightSubscriptionStatus"];
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = (ICLightweightMusicSubscriptionStatus *)v6;
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; lightweightSubscriptionStatus = %@", self->_lightweightSubscriptionStatus];
  [v6 appendString:@">"];

  return v6;
}

- (id)_initWithExtendedSubscriptionStatusResponse:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLightweightMusicSubscriptionStatusResponse;
  v5 = [(ICLightweightMusicSubscriptionStatusResponse *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 subscriptionStatus];
    v7 = [[ICLightweightMusicSubscriptionStatus alloc] _initWithExtendedSubscriptionStatus:v6];
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end