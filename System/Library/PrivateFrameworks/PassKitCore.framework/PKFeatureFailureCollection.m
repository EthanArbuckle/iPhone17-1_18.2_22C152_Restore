@interface PKFeatureFailureCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKFeatureFailureCollection)initWithArray:(id)a3;
- (PKFeatureFailureCollection)initWithCoder:(id)a3;
- (id)description;
- (id)errorForFeature:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFeatureFailureCollection

- (PKFeatureFailureCollection)initWithArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v24.receiver = self;
    v24.super_class = (Class)PKFeatureFailureCollection;
    v5 = [(PKFeatureFailureCollection *)&v24 init];
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      failuresByFeature = v5->_failuresByFeature;
      v5->_failuresByFeature = v6;

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[PKFeatureFailure alloc] initWithDictionary:v13];
              uint64_t v15 = [(PKFeatureFailure *)v14 featureIdentifier];
              v16 = v5->_failuresByFeature;
              v17 = [NSNumber numberWithUnsignedInteger:v15];
              [(NSMutableDictionary *)v16 setObject:v14 forKey:v17];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v10);
      }
    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)errorForFeature:(unint64_t)a3
{
  failuresByFeature = self->_failuresByFeature;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)failuresByFeature objectForKey:v4];

  v6 = [v5 errorRepresentation];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureFailureCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKFeatureFailureCollection;
  v5 = [(PKFeatureFailureCollection *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"failuresByFeature"];
    failuresByFeature = v5->_failuresByFeature;
    v5->_failuresByFeature = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_failuresByFeature];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    failuresByFeature = self->_failuresByFeature;
    uint64_t v8 = (NSMutableDictionary *)v4[1];
    if (failuresByFeature && v8) {
      char v6 = -[NSMutableDictionary isEqual:](failuresByFeature, "isEqual:");
    }
    else {
      char v6 = failuresByFeature == v8;
    }
  }

  return v6;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v4 = self->_failuresByFeature;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = PKFeatureIdentifierToString([v9 integerValue]);
        uint64_t v11 = [(NSMutableDictionary *)self->_failuresByFeature objectForKey:v9];
        [v3 appendFormat:@"'%@' -> %@", v10, v11, (void)v14];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@">"];
  v12 = (void *)[v3 copy];

  return v12;
}

- (void).cxx_destruct
{
}

@end