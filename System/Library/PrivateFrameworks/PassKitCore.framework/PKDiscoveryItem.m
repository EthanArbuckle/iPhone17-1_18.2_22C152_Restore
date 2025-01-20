@interface PKDiscoveryItem
+ (BOOL)supportsSecureCoding;
+ (id)activeItemFromEngagementRequest:(id)a3;
+ (id)convertEngagementRequestToDictionary:(id)a3;
- (BOOL)entitledToForceLargeCard;
- (BOOL)hasHitMaxLargeViewCount;
- (BOOL)hasHitMaxViewCount;
- (BOOL)isTerminalStatus;
- (BOOL)shouldBadge;
- (NSArray)supportedLocalizations;
- (NSData)clientData;
- (NSURL)layoutBundleURL;
- (PKDiscoveryItem)initWithCoder:(id)a3;
- (PKDiscoveryItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)eventForKey:(id)a3;
- (int64_t)priority;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setClientData:(id)a3;
- (void)setEntitledToForceLargeCard:(BOOL)a3;
- (void)setLayoutBundleURL:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setShouldBadge:(BOOL)a3;
- (void)setSupportedLocalizations:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateForRuleResult:(BOOL)a3;
- (void)updateWithDiscoveryItem:(id)a3;
@end

@implementation PKDiscoveryItem

+ (id)convertEngagementRequestToDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 clientData];
  v6 = [v5 objectForKeyedSubscript:@"url"];
  if (v6)
  {

LABEL_4:
    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_METACLASS___PKDiscoveryItem;
    v8 = objc_msgSendSuper2(&v23, sel_convertEngagementRequestToDictionary_, v4);
    v9 = (void *)[v8 mutableCopy];

    v10 = [v5 objectForKeyedSubscript:@"url"];
    if (v10)
    {
      [v9 setObject:v10 forKeyedSubscript:@"layoutBundleURL"];
    }
    else
    {
      v11 = [v4 URL];
      v12 = [v11 absoluteString];
      [v9 setObject:v12 forKeyedSubscript:@"layoutBundleURL"];
    }
    v13 = [v5 objectForKeyedSubscript:@"badging"];
    [v9 setObject:v13 forKeyedSubscript:@"shouldBadge"];

    v14 = [v5 objectForKeyedSubscript:@"entitledToForceLarge"];
    [v9 setObject:v14 forKeyedSubscript:@"entitledToForceLargeCard"];

    v15 = [v5 objectForKeyedSubscript:@"carouselRankingOrder"];
    [v9 setObject:v15 forKeyedSubscript:@"priority"];

    id v22 = 0;
    v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
    v17 = v22;
    [v9 setObject:v16 forKeyedSubscript:@"clientData"];

    v18 = [v9 objectForKeyedSubscript:@"clientData"];

    if (!v18)
    {
      v19 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "could not serialize client data: %{public}@", buf, 0xCu);
      }
    }
    v20 = (void *)[v9 copy];

    goto LABEL_12;
  }
  v7 = [v4 URL];

  if (v7) {
    goto LABEL_4;
  }
  v17 = PKLogFacilityTypeGetObject(0x10uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "client data lacks URL", buf, 2u);
  }
  v20 = 0;
LABEL_12:

  return v20;
}

+ (id)activeItemFromEngagementRequest:(id)a3
{
  v3 = [a1 convertEngagementRequestToDictionary:a3];
  id v4 = [[PKDiscoveryItem alloc] initWithDictionary:v3];
  [(PKDiscoveryObject *)v4 setStatus:2];

  return v4;
}

- (PKDiscoveryItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKDiscoveryItem;
  v5 = [(PKDiscoveryObject *)&v18 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = [v6 isEqual:@"article"];

    uint64_t v7 = [v4 PKURLForKey:@"layoutBundleURL"];
    layoutBundleURL = v5->_layoutBundleURL;
    v5->_layoutBundleURL = (NSURL *)v7;

    uint64_t v9 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedLocalizations"];
    supportedLocalizations = v5->_supportedLocalizations;
    v5->_supportedLocalizations = (NSArray *)v9;

    v5->_shouldBadge = [v4 PKBoolForKey:@"shouldBadge"];
    v5->_entitledToForceLargeCard = [v4 PKBoolForKey:@"entitledToForceLargeCard"];
    v11 = [v4 objectForKey:@"priority"];

    if (v11)
    {
      uint64_t v12 = [v4 PKIntegerForKey:@"priority"];
      uint64_t v13 = 1000;
      if (v12 < 1000) {
        uint64_t v13 = v12;
      }
      uint64_t v14 = v13 & ~(v13 >> 63);
    }
    else
    {
      uint64_t v14 = 500;
    }
    uint64_t v15 = [v4 PKDataForKey:@"clientData"];
    clientData = v5->_clientData;
    v5->_clientData = (NSData *)v15;

    v5->_priority = v14;
  }

  return v5;
}

- (void)updateForRuleResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(PKDiscoveryItem *)self isTerminalStatus])
  {
    v5 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(PKDiscoveryObject *)self identifier];
      int v12 = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Item with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (v3) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 6;
    }
    v8 = PKLogFacilityTypeGetObject(0x10uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PKDiscoveryObject *)self identifier];
      int64_t v10 = [(PKDiscoveryObject *)self status];
      v11 = "NO";
      int v12 = 138413058;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      if (v3) {
        v11 = "YES";
      }
      int64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Item with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);
    }
    [(PKDiscoveryObject *)self setStatus:v7];
  }
}

- (void)updateWithDiscoveryItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryItem;
  if ([(PKDiscoveryObject *)&v11 updateWithDiscoveryObject:v4])
  {
    self->_type = [v4 type];
    v5 = [v4 layoutBundleURL];
    layoutBundleURL = self->_layoutBundleURL;
    self->_layoutBundleURL = v5;

    uint64_t v7 = [v4 supportedLocalizations];
    supportedLocalizations = self->_supportedLocalizations;
    self->_supportedLocalizations = v7;

    self->_shouldBadge = [v4 shouldBadge];
    self->_priority = [v4 priority];
    self->_entitledToForceLargeCard = [v4 entitledToForceLargeCard];
    uint64_t v9 = [v4 clientData];
    clientData = self->_clientData;
    self->_clientData = v9;
  }
}

- (id)eventForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && self->_clientData)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    clientData = self->_clientData;
    id v18 = 0;
    objc_super v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:clientData error:&v18];
    id v12 = v18;
    if (v11)
    {
      uint64_t v13 = [v11 PKDictionaryForKey:@"metrics"];
      __int16 v14 = [v13 PKDictionaryForKey:v4];
      if (v14)
      {
        int64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F4DD60]) initWithUnderlyingDictionary:v14];
      }
      else
      {
        __int16 v16 = PKLogFacilityTypeGetObject(0x10uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v20 = v4;
          _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "couldn't find event for key: %{public}@", buf, 0xCu);
        }

        int64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(0x10uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v12;
        _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "error unarchiving client data: %{public}@", buf, 0xCu);
      }
      int64_t v15 = 0;
    }
  }
  else
  {
    int64_t v15 = 0;
  }

  return v15;
}

- (BOOL)isTerminalStatus
{
  return [(PKDiscoveryObject *)self status] == 4;
}

- (BOOL)hasHitMaxViewCount
{
  int64_t v3 = [(PKDiscoveryObject *)self maxViewCount];
  if (v3)
  {
    int64_t v4 = [(PKDiscoveryObject *)self viewCount];
    LOBYTE(v3) = v4 >= [(PKDiscoveryObject *)self maxViewCount];
  }
  return v3;
}

- (BOOL)hasHitMaxLargeViewCount
{
  int64_t v3 = [(PKDiscoveryObject *)self maxViewCountLargeCard];
  if (v3)
  {
    int64_t v4 = [(PKDiscoveryObject *)self viewCount];
    LOBYTE(v3) = v4 >= [(PKDiscoveryObject *)self maxViewCountLargeCard];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryItem;
  id v4 = a3;
  [(PKDiscoveryObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_layoutBundleURL forKey:@"layoutBundleURL"];
  [v4 encodeObject:self->_supportedLocalizations forKey:@"supportedLocalizations"];
  [v4 encodeInteger:self->_shouldBadge forKey:@"shouldBadge"];
  [v4 encodeInteger:self->_priority forKey:@"priority"];
  [v4 encodeBool:self->_entitledToForceLargeCard forKey:@"entitledToForceLargeCard"];
  [v4 encodeObject:self->_clientData forKey:@"clientData"];
}

- (PKDiscoveryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryItem;
  objc_super v5 = [(PKDiscoveryObject *)&v16 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutBundleURL"];
    layoutBundleURL = v5->_layoutBundleURL;
    v5->_layoutBundleURL = (NSURL *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    int64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedLocalizations"];
    supportedLocalizations = v5->_supportedLocalizations;
    v5->_supportedLocalizations = (NSArray *)v11;

    v5->_shouldBadge = [v4 decodeIntegerForKey:@"shouldBadge"] != 0;
    v5->_priority = [v4 decodeIntegerForKey:@"priority"];
    v5->_entitledToForceLargeCard = [v4 decodeBoolForKey:@"entitledToForceLargeCard"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientData"];
    clientData = v5->_clientData;
    v5->_clientData = (NSData *)v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryItem;
  id v5 = -[PKDiscoveryObject copyWithZone:](&v11, sel_copyWithZone_);
  *((void *)v5 + 13) = self->_type;
  uint64_t v6 = [(NSURL *)self->_layoutBundleURL copyWithZone:a3];
  uint64_t v7 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v6;

  uint64_t v8 = [(NSArray *)self->_supportedLocalizations copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v8;

  *((unsigned char *)v5 + 96) = self->_shouldBadge;
  *((void *)v5 + 16) = self->_priority;
  *((unsigned char *)v5 + 97) = self->_entitledToForceLargeCard;
  objc_storeStrong((id *)v5 + 17, self->_clientData);
  return v5;
}

- (id)description
{
  int64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryItem;
  id v4 = [(PKDiscoveryObject *)&v9 description];
  [v3 appendFormat:@" %@ ", v4];

  [v3 appendFormat:@"%@: '%ld'; ]", @"type", self->_type];
  [v3 appendFormat:@"%@: '%@'; ", @"layoutBundleURL", self->_layoutBundleURL];
  [v3 appendFormat:@"%@: '%@'; ", @"supportedLocalizations", self->_supportedLocalizations];
  if (self->_shouldBadge) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"shouldBadge", v5];
  [v3 appendFormat:@"%@: '%ld'; ", @"priority", self->_priority];
  if (self->_entitledToForceLargeCard) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"entitledToForceLargeCard", v6];
  [v3 appendFormat:@"%@: '%@'; ", @"clientData", self->_clientData];
  [v3 appendFormat:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSURL)layoutBundleURL
{
  return self->_layoutBundleURL;
}

- (void)setLayoutBundleURL:(id)a3
{
}

- (NSArray)supportedLocalizations
{
  return self->_supportedLocalizations;
}

- (void)setSupportedLocalizations:(id)a3
{
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (void)setShouldBadge:(BOOL)a3
{
  self->_shouldBadge = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)entitledToForceLargeCard
{
  return self->_entitledToForceLargeCard;
}

- (void)setEntitledToForceLargeCard:(BOOL)a3
{
  self->_entitledToForceLargeCard = a3;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_supportedLocalizations, 0);
  objc_storeStrong((id *)&self->_layoutBundleURL, 0);
}

@end