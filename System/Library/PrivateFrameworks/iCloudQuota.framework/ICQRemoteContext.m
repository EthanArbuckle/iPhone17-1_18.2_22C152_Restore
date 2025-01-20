@interface ICQRemoteContext
+ (BOOL)supportsSecureCoding;
+ (id)ICQContextFromRemoteAlertContext:(id)a3;
+ (id)contextFromDictionary:(id)a3;
- (BOOL)isPostPurchaseFlow;
- (ICQLink)link;
- (ICQOffer)offer;
- (ICQRemoteContext)initWithCoder:(id)a3;
- (ICQRemoteContext)initWithOffer:(id)a3 link:(id)a4 flowOptionsData:(id)a5 preloadedRemoteUIData:(id)a6;
- (ICQRemoteContext)initWithOffer:(id)a3 link:(id)a4 flowOptionsData:(id)a5 preloadedRemoteUIData:(id)a6 isPostPurchaseFlow:(BOOL)a7;
- (NSData)flowOptionsData;
- (NSData)preloadedRemoteUIData;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (id)_serializedData;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPostPurchaseFlow:(BOOL)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
@end

@implementation ICQRemoteContext

+ (id)ICQContextFromRemoteAlertContext:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [a1 contextFromDictionary:v4];

  return v5;
}

+ (id)contextFromDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"contextData"];
  id v12 = 0;
  v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v12];
  id v5 = v12;
  v6 = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    v16 = v3;
    v8 = "Caught error (%@) deserializing context data (%@)";
    v9 = v6;
    uint32_t v10 = 22;
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    v8 = "Successfully formed context: %@";
    v9 = v6;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_7:

  return v4;
}

- (ICQRemoteContext)initWithOffer:(id)a3 link:(id)a4 flowOptionsData:(id)a5 preloadedRemoteUIData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICQRemoteContext;
  __int16 v15 = [(ICQRemoteContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_offer, a3);
    objc_storeStrong((id *)&v16->_link, a4);
    objc_storeStrong((id *)&v16->_flowOptionsData, a5);
    objc_storeStrong((id *)&v16->_preloadedRemoteUIData, a6);
    v16->_isPostPurchaseFlow = 0;
  }

  return v16;
}

- (ICQRemoteContext)initWithOffer:(id)a3 link:(id)a4 flowOptionsData:(id)a5 preloadedRemoteUIData:(id)a6 isPostPurchaseFlow:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICQRemoteContext;
  uint64_t v17 = [(ICQRemoteContext *)&v20 init];
  objc_super v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_offer, a3);
    objc_storeStrong((id *)&v18->_link, a4);
    objc_storeStrong((id *)&v18->_flowOptionsData, a5);
    objc_storeStrong((id *)&v18->_preloadedRemoteUIData, a6);
    v18->_isPostPurchaseFlow = a7;
  }

  return v18;
}

- (id)_serializedData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  v4 = (ICQRemoteContext *)v9;
  id v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    BOOL v7 = "Caught error (%@) serializing ICQRemoteContext";
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    BOOL v7 = "ICQRemoteContext %@ encoded successfully";
  }
  _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_7:

  return v3;
}

- (id)toDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"contextData";
  v2 = [(ICQRemoteContext *)self _serializedData];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  offer = self->_offer;
  id v5 = a3;
  [v5 encodeObject:offer forKey:@"offer"];
  [v5 encodeObject:self->_link forKey:@"link"];
  [v5 encodeObject:self->_flowOptionsData forKey:@"flowOptions"];
  [v5 encodeObject:self->_preloadedRemoteUIData forKey:@"preloadedRemoteUIData"];
  [v5 encodeObject:self->_presentingSceneIdentifier forKey:@"presentingSceneIdentifier"];
  [v5 encodeObject:self->_presentingSceneBundleIdentifier forKey:@"presentingSceneBundleIdentifier"];
  [v5 encodeBool:self->_isPostPurchaseFlow forKey:@"isPostPurchaseFlow"];
}

- (ICQRemoteContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQRemoteContext;
  id v5 = [(ICQRemoteContext *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offer"];
    offer = v5->_offer;
    v5->_offer = (ICQOffer *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link"];
    link = v5->_link;
    v5->_link = (ICQLink *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowOptions"];
    flowOptionsData = v5->_flowOptionsData;
    v5->_flowOptionsData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preloadedRemoteUIData"];
    preloadedRemoteUIData = v5->_preloadedRemoteUIData;
    v5->_preloadedRemoteUIData = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneIdentifier"];
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneBundleIdentifier"];
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v16;

    v5->_isPostPurchaseFlow = [v4 decodeBoolForKey:@"isPostPurchaseFlow"];
  }

  return v5;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSData)flowOptionsData
{
  return self->_flowOptionsData;
}

- (NSData)preloadedRemoteUIData
{
  return self->_preloadedRemoteUIData;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (BOOL)isPostPurchaseFlow
{
  return self->_isPostPurchaseFlow;
}

- (void)setIsPostPurchaseFlow:(BOOL)a3
{
  self->_isPostPurchaseFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_preloadedRemoteUIData, 0);
  objc_storeStrong((id *)&self->_flowOptionsData, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end