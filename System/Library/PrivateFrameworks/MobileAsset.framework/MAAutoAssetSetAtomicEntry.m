@interface MAAutoAssetSetAtomicEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)inhibitedFromEmergencyRemoval;
- (MAAutoAssetSelector)fullAssetSelector;
- (MAAutoAssetSetAtomicEntry)initWithCoder:(id)a3;
- (MAAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7;
- (NSDictionary)assetAttributes;
- (NSString)assetID;
- (NSURL)localContentURL;
- (id)copy;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3;
@end

@implementation MAAutoAssetSetAtomicEntry

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (MAAutoAssetSelector)fullAssetSelector
{
  return self->_fullAssetSelector;
}

- (NSString)assetID
{
  return self->_assetID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (MAAutoAssetSetAtomicEntry)initWithCoder:(id)a3
{
  v19[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetSetAtomicEntry;
  v5 = [(MAAutoAssetSetAtomicEntry *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:8];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAssetSelector"];
    fullAssetSelector = v5->_fullAssetSelector;
    v5->_fullAssetSelector = (MAAutoAssetSelector *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"assetAttributes"];
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v15;

    v5->_inhibitedFromEmergencyRemoval = [v4 decodeBoolForKey:@"inhibitedFromEmergencyRemoval"];
  }

  return v5;
}

- (MAAutoAssetSetAtomicEntry)initWithFullAssetSelector:(id)a3 withAssetID:(id)a4 withLocalContentURL:(id)a5 withAssetAttributes:(id)a6 inhibitedFromEmergencyRemoval:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetAtomicEntry;
  v17 = [(MAAutoAssetSetAtomicEntry *)&v20 init];
  objc_super v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fullAssetSelector, a3);
    objc_storeStrong((id *)&v18->_assetID, a4);
    objc_storeStrong((id *)&v18->_localContentURL, a5);
    objc_storeStrong((id *)&v18->_assetAttributes, a6);
    v18->_inhibitedFromEmergencyRemoval = a7;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MAAutoAssetSetAtomicEntry *)self fullAssetSelector];
  [v8 encodeObject:v4 forKey:@"fullAssetSelector"];

  v5 = [(MAAutoAssetSetAtomicEntry *)self assetID];
  [v8 encodeObject:v5 forKey:@"assetID"];

  v6 = [(MAAutoAssetSetAtomicEntry *)self localContentURL];
  [v8 encodeObject:v6 forKey:@"localContentURL"];

  v7 = [(MAAutoAssetSetAtomicEntry *)self assetAttributes];
  [v8 encodeObject:v7 forKey:@"assetAttributes"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MAAutoAssetSetAtomicEntry inhibitedFromEmergencyRemoval](self, "inhibitedFromEmergencyRemoval"), @"inhibitedFromEmergencyRemoval");
}

- (id)copy
{
  v3 = [MAAutoAssetSetAtomicEntry alloc];
  id v4 = [(MAAutoAssetSetAtomicEntry *)self fullAssetSelector];
  v5 = [(MAAutoAssetSetAtomicEntry *)self assetID];
  v6 = [(MAAutoAssetSetAtomicEntry *)self localContentURL];
  v7 = [(MAAutoAssetSetAtomicEntry *)self assetAttributes];
  id v8 = [(MAAutoAssetSetAtomicEntry *)v3 initWithFullAssetSelector:v4 withAssetID:v5 withLocalContentURL:v6 withAssetAttributes:v7 inhibitedFromEmergencyRemoval:[(MAAutoAssetSetAtomicEntry *)self inhibitedFromEmergencyRemoval]];

  return v8;
}

- (id)summary
{
  id v14 = NSString;
  id v15 = [(MAAutoAssetSetAtomicEntry *)self fullAssetSelector];
  if (v15)
  {
    id v13 = [(MAAutoAssetSetAtomicEntry *)self fullAssetSelector];
    v3 = [v13 summary];
  }
  else
  {
    v3 = @"N";
  }
  id v4 = [(MAAutoAssetSetAtomicEntry *)self assetID];
  if (v4)
  {
    v5 = [(MAAutoAssetSetAtomicEntry *)self assetID];
  }
  else
  {
    v5 = @"N";
  }
  v6 = [(MAAutoAssetSetAtomicEntry *)self localContentURL];
  if (v6) {
    v7 = @"Y";
  }
  else {
    v7 = @"N";
  }
  id v8 = [(MAAutoAssetSetAtomicEntry *)self assetAttributes];
  if (v8) {
    uint64_t v9 = @"Y";
  }
  else {
    uint64_t v9 = @"N";
  }
  if ([(MAAutoAssetSetAtomicEntry *)self inhibitedFromEmergencyRemoval]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  uint64_t v11 = [v14 stringWithFormat:@"fullAssetSelector:%@|assetID:%@|localContentURL:%@|assetAttributes:%@|inhibitedFromEmergencyRemoval:%@", v3, v5, v7, v9, v10];

  if (v4) {
  if (v15)
  }
  {
  }
  return v11;
}

- (BOOL)inhibitedFromEmergencyRemoval
{
  return self->_inhibitedFromEmergencyRemoval;
}

- (void)setInhibitedFromEmergencyRemoval:(BOOL)a3
{
  self->_inhibitedFromEmergencyRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_fullAssetSelector, 0);
}

@end