@interface FMDSupportedAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (FMDSupportedAccessory)init;
- (FMDSupportedAccessory)initWithCoder:(id)a3;
- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5;
- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5 assets:(id)a6;
- (FMDSupportedAccessory)initWithDictionary:(id)a3;
- (FMDSupportedAccessory)initWithDictionary:(id)a3 assetRegistry:(id)a4;
- (FMDSupportedAccessory)initWithType:(id)a3 locationInfo:(id)a4;
- (NSArray)assets;
- (NSDictionary)dictionaryValue;
- (NSNumber)cachedLocValidityDuration;
- (NSNumber)decayFactor;
- (NSNumber)desiredAccuracy;
- (NSNumber)deviceProductId;
- (NSNumber)deviceVendor;
- (NSNumber)endThreshold;
- (NSNumber)locateTimeout;
- (NSNumber)locationThrottleRatio;
- (NSNumber)longTermlocationExpiryTimeInterval;
- (NSNumber)maximumHistoricalLocations;
- (NSNumber)shortTermlocationExpiryTimeInterval;
- (NSNumber)startThreshold;
- (NSString)description;
- (NSString)productType;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)profile;
- (int64_t)profileForProfileName:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAssets:(id)a3;
- (void)setCachedLocValidityDuration:(id)a3;
- (void)setDecayFactor:(id)a3;
- (void)setDesiredAccuracy:(id)a3;
- (void)setDeviceProductId:(id)a3;
- (void)setDeviceVendor:(id)a3;
- (void)setEndThreshold:(id)a3;
- (void)setLocateTimeout:(id)a3;
- (void)setLocationThrottleRatio:(id)a3;
- (void)setLongTermlocationExpiryTimeInterval:(id)a3;
- (void)setMaximumHistoricalLocations:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProfile:(int64_t)a3;
- (void)setShortTermlocationExpiryTimeInterval:(id)a3;
- (void)setStartThreshold:(id)a3;
- (void)unmarshallAssets:(id)a3 assetRegistry:(id)a4;
@end

@implementation FMDSupportedAccessory

- (FMDSupportedAccessory)initWithDictionary:(id)a3
{
  return [(FMDSupportedAccessory *)self initWithDictionary:a3 assetRegistry:0];
}

- (FMDSupportedAccessory)initWithDictionary:(id)a3 assetRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMDSupportedAccessory *)self init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"assets"];
    [(FMDSupportedAccessory *)v8 unmarshallAssets:v9 assetRegistry:v7];
    v10 = [v6 objectForKeyedSubscript:@"productId"];
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 integerValue]);
    [(FMDSupportedAccessory *)v8 setDeviceProductId:v11];

    v12 = [v6 objectForKeyedSubscript:@"vendorId"];
    v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 integerValue]);
    [(FMDSupportedAccessory *)v8 setDeviceVendor:v13];

    v14 = [v6 objectForKeyedSubscript:@"productType"];
    productType = v14;
    if (!v14) {
      productType = v8->_productType;
    }
    [(FMDSupportedAccessory *)v8 setProductType:productType];

    v16 = [v6 objectForKeyedSubscript:@"maxHistoricalLocations"];
    maximumHistoricalLocations = v16;
    if (!v16) {
      maximumHistoricalLocations = v8->_maximumHistoricalLocations;
    }
    [(FMDSupportedAccessory *)v8 setMaximumHistoricalLocations:maximumHistoricalLocations];

    v18 = [v6 objectForKeyedSubscript:@"longTermLocationExpiry"];
    longTermlocationExpiryTimeInterval = v18;
    if (!v18) {
      longTermlocationExpiryTimeInterval = v8->_longTermlocationExpiryTimeInterval;
    }
    [(FMDSupportedAccessory *)v8 setLongTermlocationExpiryTimeInterval:longTermlocationExpiryTimeInterval];

    v20 = [v6 objectForKeyedSubscript:@"shortTermLocationExpiry"];
    shortTermlocationExpiryTimeInterval = v20;
    if (!v20) {
      shortTermlocationExpiryTimeInterval = v8->_shortTermlocationExpiryTimeInterval;
    }
    [(FMDSupportedAccessory *)v8 setShortTermlocationExpiryTimeInterval:shortTermlocationExpiryTimeInterval];

    v22 = [v6 objectForKeyedSubscript:@"locationThrottleRatio"];
    locationThrottleRatio = v22;
    if (!v22) {
      locationThrottleRatio = v8->_locationThrottleRatio;
    }
    [(FMDSupportedAccessory *)v8 setLocationThrottleRatio:locationThrottleRatio];

    v24 = [v6 objectForKeyedSubscript:@"locateTimeout"];
    locateTimeout = v24;
    if (!v24) {
      locateTimeout = v8->_locateTimeout;
    }
    [(FMDSupportedAccessory *)v8 setLocateTimeout:locateTimeout];

    v26 = [v6 objectForKeyedSubscript:@"desiredAccuracy"];
    desiredAccuracy = v26;
    if (!v26) {
      desiredAccuracy = v8->_desiredAccuracy;
    }
    [(FMDSupportedAccessory *)v8 setDesiredAccuracy:desiredAccuracy];

    v28 = [v6 objectForKeyedSubscript:@"startThreshold"];
    startThreshold = v28;
    if (!v28) {
      startThreshold = v8->_startThreshold;
    }
    [(FMDSupportedAccessory *)v8 setStartThreshold:startThreshold];

    v30 = [v6 objectForKeyedSubscript:@"endThreshold"];
    endThreshold = v30;
    if (!v30) {
      endThreshold = v8->_endThreshold;
    }
    [(FMDSupportedAccessory *)v8 setEndThreshold:endThreshold];

    v32 = [v6 objectForKeyedSubscript:@"decayFactor"];
    decayFactor = v32;
    if (!v32) {
      decayFactor = v8->_decayFactor;
    }
    [(FMDSupportedAccessory *)v8 setDecayFactor:decayFactor];

    v34 = [v6 objectForKeyedSubscript:@"cachedLocValidityDuration"];
    cachedLocValidityDuration = v34;
    if (!v34) {
      cachedLocValidityDuration = v8->_cachedLocValidityDuration;
    }
    [(FMDSupportedAccessory *)v8 setCachedLocValidityDuration:cachedLocValidityDuration];

    v36 = [v6 objectForKeyedSubscript:@"advertisementStatusKey"];
    [(FMDSupportedAccessory *)v8 setProfile:[(FMDSupportedAccessory *)v8 profileForProfileName:v36]];
    id v37 = objc_alloc((Class)FMDAccessoryIdentifier);
    v38 = [(FMDSupportedAccessory *)v8 deviceVendor];
    v39 = [(FMDSupportedAccessory *)v8 deviceProductId];
    id v40 = [v37 initWithDeviceVendor:v38 deviceProductId:v39];
    [(FMDSupportedAccessory *)v8 setAccessoryIdentifier:v40];
  }
  return v8;
}

- (FMDSupportedAccessory)initWithType:(id)a3 locationInfo:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  v8 = [(FMDSupportedAccessory *)self init];
  v9 = v8;
  if (v8)
  {
    productType = v6;
    if (!v6) {
      productType = v8->_productType;
    }
    [(FMDSupportedAccessory *)v8 setProductType:productType];
    v11 = [v7 objectForKeyedSubscript:@"maxHistoricalLocations"];
    maximumHistoricalLocations = v11;
    if (!v11) {
      maximumHistoricalLocations = v9->_maximumHistoricalLocations;
    }
    [(FMDSupportedAccessory *)v9 setMaximumHistoricalLocations:maximumHistoricalLocations];

    v13 = [v7 objectForKeyedSubscript:@"longTermLocationExpiry"];
    longTermlocationExpiryTimeInterval = v13;
    if (!v13) {
      longTermlocationExpiryTimeInterval = v9->_longTermlocationExpiryTimeInterval;
    }
    [(FMDSupportedAccessory *)v9 setLongTermlocationExpiryTimeInterval:longTermlocationExpiryTimeInterval];

    v15 = [v7 objectForKeyedSubscript:@"shortTermLocationExpiry"];
    shortTermlocationExpiryTimeInterval = v15;
    if (!v15) {
      shortTermlocationExpiryTimeInterval = v9->_shortTermlocationExpiryTimeInterval;
    }
    [(FMDSupportedAccessory *)v9 setShortTermlocationExpiryTimeInterval:shortTermlocationExpiryTimeInterval];

    v17 = [v7 objectForKeyedSubscript:@"locationThrottleRatio"];
    locationThrottleRatio = v17;
    if (!v17) {
      locationThrottleRatio = v9->_locationThrottleRatio;
    }
    [(FMDSupportedAccessory *)v9 setLocationThrottleRatio:locationThrottleRatio];

    v19 = [v7 objectForKeyedSubscript:@"locateTimeout"];
    locateTimeout = v19;
    if (!v19) {
      locateTimeout = v9->_locateTimeout;
    }
    [(FMDSupportedAccessory *)v9 setLocateTimeout:locateTimeout];

    v21 = [v7 objectForKeyedSubscript:@"desiredAccuracy"];
    desiredAccuracy = v21;
    if (!v21) {
      desiredAccuracy = v9->_desiredAccuracy;
    }
    [(FMDSupportedAccessory *)v9 setDesiredAccuracy:desiredAccuracy];

    v23 = [v7 objectForKeyedSubscript:@"startThreshold"];
    startThreshold = v23;
    if (!v23) {
      startThreshold = v9->_startThreshold;
    }
    [(FMDSupportedAccessory *)v9 setStartThreshold:startThreshold];

    v25 = [v7 objectForKeyedSubscript:@"endThreshold"];
    endThreshold = v25;
    if (!v25) {
      endThreshold = v9->_endThreshold;
    }
    [(FMDSupportedAccessory *)v9 setEndThreshold:endThreshold];

    v27 = [v7 objectForKeyedSubscript:@"decayFactor"];
    decayFactor = v27;
    if (!v27) {
      decayFactor = v9->_decayFactor;
    }
    [(FMDSupportedAccessory *)v9 setDecayFactor:decayFactor];

    v29 = [v7 objectForKeyedSubscript:@"cachedLocValidityDuration"];
    cachedLocValidityDuration = v29;
    if (!v29) {
      cachedLocValidityDuration = v9->_cachedLocValidityDuration;
    }
    [(FMDSupportedAccessory *)v9 setCachedLocValidityDuration:cachedLocValidityDuration];
  }
  return v9;
}

- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[NSMutableArray array];
  v11 = [(FMDSupportedAccessory *)self initWithDeviceVendor:v9 deviceProductId:v8 profile:a5 assets:v10];

  return v11;
}

- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5 assets:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(FMDSupportedAccessory *)self init];
  v14 = v13;
  if (v13)
  {
    [(FMDSupportedAccessory *)v13 setDeviceProductId:v11];
    [(FMDSupportedAccessory *)v14 setDeviceVendor:v10];
    id v15 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithDeviceVendor:v10 deviceProductId:v11];
    [(FMDSupportedAccessory *)v14 setAccessoryIdentifier:v15];

    [(FMDSupportedAccessory *)v14 setProfile:a5];
    [(FMDSupportedAccessory *)v14 setAssets:v12];
  }

  return v14;
}

- (FMDSupportedAccessory)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDSupportedAccessory;
  v2 = [(FMDSupportedAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMDSupportedAccessory *)v2 setMaximumHistoricalLocations:&off_1002F1D68];
    [(FMDSupportedAccessory *)v3 setShortTermlocationExpiryTimeInterval:&off_1002F1D80];
    [(FMDSupportedAccessory *)v3 setLongTermlocationExpiryTimeInterval:&off_1002F1D98];
    [(FMDSupportedAccessory *)v3 setLocationThrottleRatio:&off_1002F21C0];
    [(FMDSupportedAccessory *)v3 setLocateTimeout:&off_1002F1DB0];
    [(FMDSupportedAccessory *)v3 setDesiredAccuracy:&off_1002F1DC8];
    [(FMDSupportedAccessory *)v3 setStartThreshold:&off_1002F31E8];
    [(FMDSupportedAccessory *)v3 setEndThreshold:&off_1002F31F8];
    [(FMDSupportedAccessory *)v3 setDecayFactor:&off_1002F3208];
    [(FMDSupportedAccessory *)v3 setCachedLocValidityDuration:&off_1002F21D0];
    [(FMDSupportedAccessory *)v3 setProfile:1];
  }
  return v3;
}

- (void)unmarshallAssets:(id)a3 assetRegistry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [v7 newAssetWithDictionary:*(void *)(*((void *)&v15 + 1) + 8 * (void)v13) (void)v15];
        [v8 fm_safeAddObject:v14];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(FMDSupportedAccessory *)self setAssets:v8];
}

- (NSString)description
{
  v3 = [(FMDSupportedAccessory *)self deviceVendor];
  id v4 = [v3 integerValue];
  objc_super v5 = [(FMDSupportedAccessory *)self deviceProductId];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%li, %li", v4, [v5 integerValue]);

  return (NSString *)v6;
}

- (int64_t)profileForProfileName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AirPods"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Frost"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  deviceVendor = self->_deviceVendor;
  id v5 = a3;
  id v6 = NSStringFromSelector("deviceVendor");
  [v5 encodeObject:deviceVendor forKey:v6];

  deviceProductId = self->_deviceProductId;
  id v8 = NSStringFromSelector("deviceProductId");
  [v5 encodeObject:deviceProductId forKey:v8];

  productType = self->_productType;
  id v10 = NSStringFromSelector("productType");
  [v5 encodeObject:productType forKey:v10];

  assets = self->_assets;
  uint64_t v12 = NSStringFromSelector("assets");
  [v5 encodeObject:assets forKey:v12];

  maximumHistoricalLocations = self->_maximumHistoricalLocations;
  id v14 = NSStringFromSelector("maximumHistoricalLocations");
  [v5 encodeObject:maximumHistoricalLocations forKey:v14];

  longTermlocationExpiryTimeInterval = self->_longTermlocationExpiryTimeInterval;
  long long v16 = NSStringFromSelector("longTermlocationExpiryTimeInterval");
  [v5 encodeObject:longTermlocationExpiryTimeInterval forKey:v16];

  shortTermlocationExpiryTimeInterval = self->_shortTermlocationExpiryTimeInterval;
  long long v18 = NSStringFromSelector("shortTermlocationExpiryTimeInterval");
  [v5 encodeObject:shortTermlocationExpiryTimeInterval forKey:v18];

  locationThrottleRatio = self->_locationThrottleRatio;
  v20 = NSStringFromSelector("locationThrottleRatio");
  [v5 encodeObject:locationThrottleRatio forKey:v20];

  locateTimeout = self->_locateTimeout;
  v22 = NSStringFromSelector("locateTimeout");
  [v5 encodeObject:locateTimeout forKey:v22];

  startThreshold = self->_startThreshold;
  v24 = NSStringFromSelector("startThreshold");
  [v5 encodeObject:startThreshold forKey:v24];

  endThreshold = self->_endThreshold;
  v26 = NSStringFromSelector("endThreshold");
  [v5 encodeObject:endThreshold forKey:v26];

  decayFactor = self->_decayFactor;
  v28 = NSStringFromSelector("decayFactor");
  [v5 encodeObject:decayFactor forKey:v28];

  cachedLocValidityDuration = self->_cachedLocValidityDuration;
  v30 = NSStringFromSelector("cachedLocValidityDuration");
  [v5 encodeObject:cachedLocValidityDuration forKey:v30];

  desiredAccuracy = self->_desiredAccuracy;
  v32 = NSStringFromSelector("desiredAccuracy");
  [v5 encodeObject:desiredAccuracy forKey:v32];

  id v34 = +[NSNumber numberWithInteger:self->_profile];
  v33 = NSStringFromSelector("profile");
  [v5 encodeObject:v34 forKey:v33];
}

- (FMDSupportedAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDSupportedAccessory *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector("deviceVendor");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    deviceVendor = v5->_deviceVendor;
    v5->_deviceVendor = (NSNumber *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector("deviceProductId");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    deviceProductId = v5->_deviceProductId;
    v5->_deviceProductId = (NSNumber *)v12;

    uint64_t v14 = objc_opt_class();
    long long v15 = NSStringFromSelector("productType");
    long long v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    productType = v16;
    if (!v16) {
      productType = v5->_productType;
    }
    objc_storeStrong((id *)&v5->_productType, productType);

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector("assets");
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector("maximumHistoricalLocations");
    v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    maximumHistoricalLocations = v24;
    if (!v24) {
      maximumHistoricalLocations = v5->_maximumHistoricalLocations;
    }
    objc_storeStrong((id *)&v5->_maximumHistoricalLocations, maximumHistoricalLocations);

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector("longTermlocationExpiryTimeInterval");
    v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    longTermlocationExpiryTimeInterval = v28;
    if (!v28) {
      longTermlocationExpiryTimeInterval = v5->_longTermlocationExpiryTimeInterval;
    }
    objc_storeStrong((id *)&v5->_longTermlocationExpiryTimeInterval, longTermlocationExpiryTimeInterval);

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector("shortTermlocationExpiryTimeInterval");
    v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    shortTermlocationExpiryTimeInterval = v32;
    if (!v32) {
      shortTermlocationExpiryTimeInterval = v5->_shortTermlocationExpiryTimeInterval;
    }
    objc_storeStrong((id *)&v5->_shortTermlocationExpiryTimeInterval, shortTermlocationExpiryTimeInterval);

    uint64_t v34 = objc_opt_class();
    v35 = NSStringFromSelector("locationThrottleRatio");
    v36 = [v4 decodeObjectOfClass:v34 forKey:v35];
    locationThrottleRatio = v36;
    if (!v36) {
      locationThrottleRatio = v5->_locationThrottleRatio;
    }
    objc_storeStrong((id *)&v5->_locationThrottleRatio, locationThrottleRatio);

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector("locateTimeout");
    id v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    locateTimeout = v40;
    if (!v40) {
      locateTimeout = v5->_locateTimeout;
    }
    objc_storeStrong((id *)&v5->_locateTimeout, locateTimeout);

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector("startThreshold");
    v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    startThreshold = v44;
    if (!v44) {
      startThreshold = v5->_startThreshold;
    }
    objc_storeStrong((id *)&v5->_startThreshold, startThreshold);

    uint64_t v46 = objc_opt_class();
    v47 = NSStringFromSelector("endThreshold");
    v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    endThreshold = v48;
    if (!v48) {
      endThreshold = v5->_endThreshold;
    }
    objc_storeStrong((id *)&v5->_endThreshold, endThreshold);

    uint64_t v50 = objc_opt_class();
    v51 = NSStringFromSelector("decayFactor");
    v52 = [v4 decodeObjectOfClass:v50 forKey:v51];
    decayFactor = v52;
    if (!v52) {
      decayFactor = v5->_decayFactor;
    }
    objc_storeStrong((id *)&v5->_decayFactor, decayFactor);

    uint64_t v54 = objc_opt_class();
    v55 = NSStringFromSelector("cachedLocValidityDuration");
    v56 = [v4 decodeObjectOfClass:v54 forKey:v55];
    cachedLocValidityDuration = v56;
    if (!v56) {
      cachedLocValidityDuration = v5->_cachedLocValidityDuration;
    }
    objc_storeStrong((id *)&v5->_cachedLocValidityDuration, cachedLocValidityDuration);

    uint64_t v58 = objc_opt_class();
    v59 = NSStringFromSelector("desiredAccuracy");
    v60 = [v4 decodeObjectOfClass:v58 forKey:v59];
    desiredAccuracy = v60;
    if (!v60) {
      desiredAccuracy = v5->_desiredAccuracy;
    }
    objc_storeStrong((id *)&v5->_desiredAccuracy, desiredAccuracy);

    uint64_t v62 = objc_opt_class();
    v63 = NSStringFromSelector("profile");
    v64 = [v4 decodeObjectOfClass:v62 forKey:v63];
    id profile = [v64 integerValue];
    if (!profile) {
      id profile = (id)v5->_profile;
    }
    v5->_id profile = (int64_t)profile;

    id v66 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithDeviceVendor:v5->_deviceVendor deviceProductId:v5->_deviceProductId];
    [(FMDSupportedAccessory *)v5 setAccessoryIdentifier:v66];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[FMDSupportedAccessory allocWithZone:a3];
  id v5 = [(FMDSupportedAccessory *)self deviceVendor];
  uint64_t v6 = [(FMDSupportedAccessory *)self deviceProductId];
  id v7 = [(FMDSupportedAccessory *)v4 initWithDeviceVendor:v5 deviceProductId:v6 profile:[(FMDSupportedAccessory *)self profile]];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FMDSupportedAccessory *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(FMDSupportedAccessory *)self deviceVendor];
      id v7 = [(FMDSupportedAccessory *)v5 deviceVendor];
      if (v6 == v7)
      {
        id v9 = [(FMDSupportedAccessory *)self deviceProductId];
        uint64_t v10 = [(FMDSupportedAccessory *)v5 deviceProductId];
        BOOL v8 = v9 == v10;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = [(FMDSupportedAccessory *)self deviceVendor];
  unint64_t v4 = (unint64_t)[v3 unsignedIntegerValue];
  id v5 = [(FMDSupportedAccessory *)self deviceProductId];
  unint64_t v6 = (unint64_t)[v5 unsignedIntegerValue] ^ v4;

  return v6;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (NSNumber)deviceVendor
{
  return self->_deviceVendor;
}

- (void)setDeviceVendor:(id)a3
{
}

- (NSNumber)deviceProductId
{
  return self->_deviceProductId;
}

- (void)setDeviceProductId:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSNumber)maximumHistoricalLocations
{
  return self->_maximumHistoricalLocations;
}

- (void)setMaximumHistoricalLocations:(id)a3
{
}

- (NSNumber)longTermlocationExpiryTimeInterval
{
  return self->_longTermlocationExpiryTimeInterval;
}

- (void)setLongTermlocationExpiryTimeInterval:(id)a3
{
}

- (NSNumber)shortTermlocationExpiryTimeInterval
{
  return self->_shortTermlocationExpiryTimeInterval;
}

- (void)setShortTermlocationExpiryTimeInterval:(id)a3
{
}

- (NSNumber)locationThrottleRatio
{
  return self->_locationThrottleRatio;
}

- (void)setLocationThrottleRatio:(id)a3
{
}

- (NSNumber)locateTimeout
{
  return self->_locateTimeout;
}

- (void)setLocateTimeout:(id)a3
{
}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(id)a3
{
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(id)a3
{
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(id)a3
{
}

- (NSNumber)cachedLocValidityDuration
{
  return self->_cachedLocValidityDuration;
}

- (void)setCachedLocValidityDuration:(id)a3
{
}

- (NSNumber)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(id)a3
{
}

- (int64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(int64_t)a3
{
  self->_id profile = a3;
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_desiredAccuracy, 0);
  objc_storeStrong((id *)&self->_cachedLocValidityDuration, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);
  objc_storeStrong((id *)&self->_startThreshold, 0);
  objc_storeStrong((id *)&self->_locateTimeout, 0);
  objc_storeStrong((id *)&self->_locationThrottleRatio, 0);
  objc_storeStrong((id *)&self->_shortTermlocationExpiryTimeInterval, 0);
  objc_storeStrong((id *)&self->_longTermlocationExpiryTimeInterval, 0);
  objc_storeStrong((id *)&self->_maximumHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);

  objc_storeStrong((id *)&self->_deviceVendor, 0);
}

@end