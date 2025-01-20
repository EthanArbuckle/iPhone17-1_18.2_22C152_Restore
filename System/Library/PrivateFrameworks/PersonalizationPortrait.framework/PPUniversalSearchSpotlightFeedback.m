@interface PPUniversalSearchSpotlightFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPPUniversalSearchSpotlightFeedback:(id)a3;
- (NSDate)timestamp;
- (NSString)clientBundleId;
- (NSString)clientIdentifier;
- (PPUniversalSearchSpotlightFeedback)initWithCoder:(id)a3;
- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4;
- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4 timestamp:(id)a5 clientIdentifier:(id)a6 clientBundleId:(id)a7;
- (id)description;
- (unint64_t)hash;
- (unsigned)engagedCSSICount;
- (unsigned)offeredCSSICount;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
@end

@implementation PPUniversalSearchSpotlightFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (unsigned)engagedCSSICount
{
  return self->_engagedCSSICount;
}

- (unsigned)offeredCSSICount
{
  return self->_offeredCSSICount;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@: {", v5];

  objc_msgSend(v3, "appendFormat:", @"  engagedCSSICount : %u ", self->_engagedCSSICount);
  objc_msgSend(v3, "appendFormat:", @"  offeredCSSICount : %u ", self->_offeredCSSICount);
  [v3 appendFormat:@"  clientIdentifier : %@, ", self->_clientIdentifier];
  [v3 appendFormat:@"  clientBundleId : %@, ", self->_clientBundleId];
  [v3 appendFormat:@"  timestamp : %@, ", self->_timestamp];
  v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqualToPPUniversalSearchSpotlightFeedback:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_offeredCSSICount != *((_DWORD *)v4 + 2) || self->_engagedCSSICount != *((_DWORD *)v4 + 3)) {
    goto LABEL_10;
  }
  timestamp = self->_timestamp;
  v7 = (NSDate *)v4[4];
  if (timestamp == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = timestamp;
    char v10 = [(NSDate *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
  }
  clientIdentifier = self->_clientIdentifier;
  v12 = (NSString *)v5[2];
  if (clientIdentifier == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = clientIdentifier;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_10:
      char v16 = 0;
      goto LABEL_11;
    }
  }
  v18 = self->_clientBundleId;
  v19 = v18;
  if (v18 == v5[3]) {
    char v16 = 1;
  }
  else {
    char v16 = -[NSString isEqual:](v18, "isEqual:");
  }

LABEL_11:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPUniversalSearchSpotlightFeedback *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPUniversalSearchSpotlightFeedback *)self isEqualToPPUniversalSearchSpotlightFeedback:v5];

  return v6;
}

- (PPUniversalSearchSpotlightFeedback)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"offeredCSSICount"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"engagedCSSICount"];
  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = pp_default_log_handle();
  char v10 = [v7 robustDecodeObjectOfClass:v8 forKey:@"timestamp" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v9];

  if (v10)
  {
    v11 = [v4 error];

    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v15 = objc_opt_class();
      char v16 = pp_default_log_handle();
      v12 = [v14 robustDecodeObjectOfClass:v15 forKey:@"clientIdentifier" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v16];

      if (v12
        || ([v4 error], v21 = objc_claimAutoreleasedReturnValue(), v21, !v21))
      {
        v17 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v18 = objc_opt_class();
        v19 = pp_default_log_handle();
        v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"clientBundleId" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v19];

        if (v20
          || ([v4 error], v23 = objc_claimAutoreleasedReturnValue(), v23, !v23))
        {
          self = [(PPUniversalSearchSpotlightFeedback *)self initWithOfferedCSSICount:v5 engagedCSSICount:v6 timestamp:v10 clientIdentifier:v12 clientBundleId:v20];
          v13 = self;
LABEL_17:

          goto LABEL_18;
        }
        v24 = pp_universal_search_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v27 = [v4 error];
          *(_DWORD *)buf = 138412290;
          v29 = v27;
          _os_log_error_impl(&dword_18CAA6000, v24, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode bundle ID: %@", buf, 0xCu);
        }
        v20 = 0;
      }
      else
      {
        v20 = pp_universal_search_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = [v4 error];
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          _os_log_error_impl(&dword_18CAA6000, v20, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode client identifier: %@", buf, 0xCu);
        }
      }
      v13 = 0;
      goto LABEL_17;
    }
  }
  v12 = pp_universal_search_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v26 = [v4 error];
    *(_DWORD *)buf = 138412290;
    v29 = v26;
    _os_log_error_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_ERROR, "PPUniversalSearchSpotlightFeedback: failed to decode timestamp: %@", buf, 0xCu);
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t offeredCSSICount = self->_offeredCSSICount;
  id v5 = a3;
  [v5 encodeInt32:offeredCSSICount forKey:@"offeredCSSICount"];
  [v5 encodeInt32:self->_engagedCSSICount forKey:@"engagedCSSICount"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_clientBundleId forKey:@"clientBundleId"];
}

- (unint64_t)hash
{
  unint64_t v3 = self->_engagedCSSICount - (unint64_t)self->_offeredCSSICount + 32 * self->_offeredCSSICount;
  uint64_t v4 = [(NSDate *)self->_timestamp hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_clientIdentifier hash] - v4 + 32 * v4;
  return [(NSString *)self->_clientBundleId hash] - v5 + 32 * v5;
}

- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4 timestamp:(id)a5 clientIdentifier:(id)a6 clientBundleId:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PPUniversalSearchSpotlightFeedback;
  char v16 = [(PPUniversalSearchSpotlightFeedback *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_uint64_t offeredCSSICount = a3;
    v16->_engagedCSSICount = a4;
    objc_storeStrong((id *)&v16->_timestamp, a5);
    objc_storeStrong((id *)&v17->_clientIdentifier, a6);
    objc_storeStrong((id *)&v17->_clientBundleId, a7);
  }

  return v17;
}

- (PPUniversalSearchSpotlightFeedback)initWithOfferedCSSICount:(unsigned int)a3 engagedCSSICount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v7 = objc_opt_new();
  uint64_t v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 bundleIdentifier];
  char v10 = [(PPUniversalSearchSpotlightFeedback *)self initWithOfferedCSSICount:v5 engagedCSSICount:v4 timestamp:v7 clientIdentifier:0 clientBundleId:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end