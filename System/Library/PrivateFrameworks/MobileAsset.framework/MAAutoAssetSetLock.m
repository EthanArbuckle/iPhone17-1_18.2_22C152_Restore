@interface MAAutoAssetSetLock
+ (BOOL)supportsSecureCoding;
- (BOOL)inhibitedFromEmergencyRemoval;
- (MAAutoAssetSelector)fullAssetSelector;
- (MAAutoAssetSetLock)initWithCoder:(id)a3;
- (NSDictionary)assetAttributes;
- (NSMutableDictionary)lockReasons;
- (NSURL)localContentURL;
- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3;
- (void)setLockReasons:(id)a3;
@end

@implementation MAAutoAssetSetLock

- (id)initForSelector:(id)a3 withLocalContentURL:(id)a4 withAssetAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetSetLock;
  v12 = [(MAAutoAssetSetLock *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v13->_localContentURL, a4);
    objc_storeStrong((id *)&v13->_assetAttributes, a5);
    v13->_inhibitedFromEmergencyRemoval = 0;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lockReasons = v13->_lockReasons;
    v13->_lockReasons = v14;
  }
  return v13;
}

- (MAAutoAssetSetLock)initWithCoder:(id)a3
{
  v17[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MAAutoAssetSetLock;
  v5 = [(MAAutoAssetSetLock *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAssetSelector"];
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v11;

    v5->_inhibitedFromEmergencyRemoval = [v4 decodeBoolForKey:@"inhibitedFromEmergencyRemoval"];
    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"lockReasons"];
    lockReasons = v5->_lockReasons;
    v5->_lockReasons = (NSMutableDictionary *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetLock *)self fullAssetSelector];
  [v4 encodeObject:v5 forKey:@"fullAssetSelector"];

  v6 = [(MAAutoAssetSetLock *)self localContentURL];
  [v4 encodeObject:v6 forKey:@"localContentURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetLock inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"), @"inhibitedFromEmergencyRemoval");
  id v7 = [(MAAutoAssetSetLock *)self lockReasons];
  [v4 encodeObject:v7 forKey:@"lockReasons"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = NSString;
  id v4 = [(MAAutoAssetSetLock *)self fullAssetSelector];
  v5 = [v4 summary];
  v6 = [(MAAutoAssetSetLock *)self localContentURL];
  id v7 = [v6 path];
  v8 = [(MAAutoAssetSetLock *)self assetAttributes];
  uint64_t v9 = [v8 safeSummary];
  if ([(MAAutoAssetSetLock *)self inhibitedFromEmergencyRemoval]) {
    id v10 = @"Y";
  }
  else {
    id v10 = @"N";
  }
  uint64_t v11 = [(MAAutoAssetSetLock *)self lockReasons];
  v12 = [v11 safeSummary];
  uint64_t v13 = [v3 stringWithFormat:@"selector:%@|localURL:%@|attributes:%@|inhibitedRemoval:%@|reasons:%@", v5, v7, v9, v10, v12];

  return v13;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (BOOL)inhibitedFromEmergencyRemoval
{
  return self->_inhibitedFromEmergencyRemoval;
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

- (NSMutableDictionary)lockReasons
{
  return self->_lockReasons;
}

- (void)setLockReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReasons, 0);
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_fullAssetSelector, 0);
}

@end