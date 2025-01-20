@interface PPBaseFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPPBaseFeedback:(id)a3;
- (BOOL)isMapped;
- (NSArray)feedbackItems;
- (NSDate)timestamp;
- (NSString)clientBundleId;
- (NSString)clientIdentifier;
- (NSString)mappingId;
- (PPBaseFeedback)initWithCoder:(id)a3;
- (PPBaseFeedback)initWithFeedbackItems:(id)a3 mappingId:(id)a4;
- (PPBaseFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
@end

@implementation PPBaseFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSArray)feedbackItems
{
  return self->_feedbackItems;
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@: {", v5];

  [v3 appendFormat:@"  clientIdentifier : %@, ", self->_clientIdentifier];
  [v3 appendFormat:@"  clientBundleId : %@, ", self->_clientBundleId];
  [v3 appendFormat:@"  mappingId : %@, ", self->_mappingId];
  [v3 appendFormat:@"  timestamp : %@, ", self->_timestamp];
  [v3 appendString:@"  feedbackItems : ["];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_feedbackItems;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v3 appendString:@"] }"];
  v11 = (void *)[v3 copy];

  return v11;
}

- (BOOL)isEqualToPPBaseFeedback:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  feedbackItems = self->_feedbackItems;
  uint64_t v7 = (NSArray *)v4[2];
  if (feedbackItems == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = feedbackItems;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
  }
  timestamp = self->_timestamp;
  v12 = (NSDate *)v5[5];
  if (timestamp == v12)
  {
  }
  else
  {
    long long v13 = v12;
    long long v14 = timestamp;
    char v15 = [(NSDate *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_16;
    }
  }
  clientIdentifier = self->_clientIdentifier;
  v17 = (NSString *)v5[1];
  if (clientIdentifier == v17)
  {
  }
  else
  {
    uint64_t v18 = v17;
    v19 = clientIdentifier;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
  }
  clientBundleId = self->_clientBundleId;
  v22 = (NSString *)v5[3];
  if (clientBundleId == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = clientBundleId;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0)
    {
LABEL_16:
      char v26 = 0;
      goto LABEL_17;
    }
  }
  v28 = self->_mappingId;
  v29 = v28;
  if (v28 == v5[4]) {
    char v26 = 1;
  }
  else {
    char v26 = -[NSString isEqual:](v28, "isEqual:");
  }

LABEL_17:
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPBaseFeedback *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPBaseFeedback *)self isEqualToPPBaseFeedback:v5];

  return v6;
}

- (PPBaseFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = (void *)MEMORY[0x192F97350]();
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v5, 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"feedbackItems"];

  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientBundleId"];
  long long v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mappingId"];
  long long v14 = 0;
  if (v9 && v10)
  {
    self = [(PPBaseFeedback *)self initWithFeedbackItems:v9 timestamp:v10 clientIdentifier:v11 clientBundleId:v12 mappingId:v13];
    long long v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  feedbackItems = self->_feedbackItems;
  id v5 = a3;
  [v5 encodeObject:feedbackItems forKey:@"feedbackItems"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_clientBundleId forKey:@"clientBundleId"];
  [v5 encodeObject:self->_mappingId forKey:@"mappingId"];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_feedbackItems hash];
  uint64_t v4 = [(NSDate *)self->_timestamp hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_clientIdentifier hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_clientBundleId hash] - v5 + 32 * v5;
  return [(NSString *)self->_mappingId hash] - v6 + 32 * v6;
}

- (PPBaseFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PPBaseFeedback;
  v17 = [(PPBaseFeedback *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feedbackItems, a3);
    objc_storeStrong((id *)&v18->_timestamp, a4);
    objc_storeStrong((id *)&v18->_clientIdentifier, a5);
    objc_storeStrong((id *)&v18->_clientBundleId, a6);
    objc_storeStrong((id *)&v18->_mappingId, a7);
  }

  return v18;
}

- (PPBaseFeedback)initWithFeedbackItems:(id)a3 mappingId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
  char v10 = [v9 bundleIdentifier];
  v11 = [(PPBaseFeedback *)self initWithFeedbackItems:v7 timestamp:v8 clientIdentifier:0 clientBundleId:v10 mappingId:v6];

  return v11;
}

- (BOOL)isMapped
{
  return [(NSString *)self->_mappingId length] != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end