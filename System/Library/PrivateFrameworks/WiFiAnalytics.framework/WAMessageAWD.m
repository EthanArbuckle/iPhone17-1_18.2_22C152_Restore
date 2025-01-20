@interface WAMessageAWD
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRootMessage;
- (NSMutableDictionary)mutableFields;
- (NSString)key;
- (NSString)originalClassName;
- (NSString)uuid;
- (WAMessageAWD)init;
- (WAMessageAWD)initWithCoder:(id)a3;
- (WAMessageAWD)initWithKey:(id)a3 andFields:(id)a4 isRootMessage:(BOOL)a5 originalClassName:(id)a6 uuid:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fieldForKey:(id)a3;
- (unint64_t)metricID;
- (void)addField:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRootMessage:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setMetricID:(unint64_t)a3;
- (void)setMutableFields:(id)a3;
- (void)setOriginalClassName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation WAMessageAWD

- (NSString)originalClassName
{
  return self->_originalClassName;
}

- (id)fieldForKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WAMessageAWD *)self mutableFields];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      originalClassName = self->_originalClassName;
      *(_DWORD *)buf = 136446978;
      v33 = "-[WAMessageAWD fieldForKey:]";
      __int16 v34 = 1024;
      *(_DWORD *)v35 = 85;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v4;
      *(_WORD *)&v35[14] = 2112;
      *(void *)&v35[16] = originalClassName;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:Attempt to access field with key: %@ (message original classname: %@) but it doesn't exist. Most common reason is protobuf change without population logic update", buf, 0x26u);
    }
    id v26 = v4;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v9 = [(WAMessageAWD *)self mutableFields];
    v10 = [v9 allKeys];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = [(WAMessageAWD *)self mutableFields];
          v17 = [v16 objectForKeyedSubscript:v15];

          v18 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            int v19 = [v17 isRepeatable];
            uint64_t v20 = [v15 UTF8String];
            *(_DWORD *)buf = 136446978;
            v33 = "-[WAMessageAWD fieldForKey:]";
            __int16 v34 = 1024;
            *(_DWORD *)v35 = 90;
            *(_WORD *)&v35[4] = 1024;
            *(_DWORD *)&v35[6] = v19;
            *(_WORD *)&v35[10] = 2080;
            *(void *)&v35[12] = v20;
            _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_INFO, "%{public}s::%d:Found repeatable %d Key:: %s", buf, 0x22u);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    v21 = WALogCategoryDefaultHandle();
    id v4 = v26;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v25 = self->_originalClassName;
      *(_DWORD *)buf = 138412546;
      v33 = (const char *)v26;
      __int16 v34 = 2112;
      *(void *)v35 = v25;
      _os_log_fault_impl(&dword_21D96D000, v21, OS_LOG_TYPE_FAULT, "Attempt to access field with key: %@ (message original classname: %@)", buf, 0x16u);
    }
  }
  v22 = [(WAMessageAWD *)self mutableFields];
  v23 = [v22 objectForKeyedSubscript:v4];

  return v23;
}

- (NSMutableDictionary)mutableFields
{
  return self->_mutableFields;
}

- (WAMessageAWD)init
{
  v9.receiver = self;
  v9.super_class = (Class)WAMessageAWD;
  v2 = [(WAMessageAWD *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableFields = v2->_mutableFields;
    v2->_mutableFields = v6;
  }
  return v2;
}

- (WAMessageAWD)initWithKey:(id)a3 andFields:(id)a4 isRootMessage:(BOOL)a5 originalClassName:(id)a6 uuid:(id)a7
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v54.receiver = self;
  v54.super_class = (Class)WAMessageAWD;
  v16 = [(WAMessageAWD *)&v54 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_11;
  }
  v16->_isRootMessage = a5;
  uint64_t v18 = [v14 mutableCopy];
  originalClassName = v17->_originalClassName;
  v17->_originalClassName = (NSString *)v18;

  uint64_t v20 = [v12 mutableCopy];
  key = v17->_key;
  v17->_key = (NSString *)v20;

  uint64_t v22 = [v15 mutableCopy];
  uuid = v17->_uuid;
  v17->_uuid = (NSString *)v22;

  if (v17->_uuid)
  {
    if (v13) {
      goto LABEL_4;
    }
LABEL_9:
    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mutableFields = v17->_mutableFields;
    v17->_mutableFields = v45;
LABEL_10:

    goto LABEL_11;
  }
  v42 = [MEMORY[0x263F08C38] UUID];
  uint64_t v43 = [v42 UUIDString];
  v44 = v17->_uuid;
  v17->_uuid = (NSString *)v43;

  if (!v13) {
    goto LABEL_9;
  }
LABEL_4:
  v47 = (void *)MEMORY[0x263EFFA08];
  v48 = (void *)MEMORY[0x263F08928];
  id v24 = v13;
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  id v51 = v12;
  uint64_t v28 = objc_opt_class();
  id v49 = v15;
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  id v50 = v14;
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = v25;
  id v13 = v24;
  v35 = objc_msgSend(v47, "setWithObjects:", v34, v26, v27, v28, v29, v30, v31, v32, v33, 0);
  id v53 = 0;
  uint64_t v36 = [MEMORY[0x263F08910] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v53];
  id v37 = v53;
  id v52 = v37;
  uint64_t v38 = [v48 unarchivedObjectOfClasses:v35 fromData:v36 error:&v52];
  mutableFields = (NSMutableDictionary *)v52;

  id v15 = v49;
  v40 = v17->_mutableFields;
  v17->_mutableFields = (NSMutableDictionary *)v38;

  id v14 = v50;
  id v12 = v51;
  if (mutableFields)
  {
    v41 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v56 = "-[WAMessageAWD initWithKey:andFields:isRootMessage:originalClassName:uuid:]";
      __int16 v57 = 1024;
      int v58 = 60;
      __int16 v59 = 2112;
      v60 = mutableFields;
      _os_log_impl(&dword_21D96D000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to archivedDataWithRootObject: %@ ", buf, 0x1Cu);
    }

    goto LABEL_10;
  }
LABEL_11:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WAMessageAWD *)self uuid];
  v6 = [v4 uuid];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v20 = (void *)MEMORY[0x263F08928];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v22 = 0;
  id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v22];
  id v15 = v22;
  id v21 = v15;
  v16 = [v20 unarchivedObjectOfClasses:v13 fromData:v14 error:&v21];
  id v17 = v21;

  if (v17)
  {
    uint64_t v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v24 = "-[WAMessageAWD copyWithZone:]";
      __int16 v25 = 1024;
      int v26 = 104;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWD copyWithZone failed, unarchive/archive error: %@", buf, 0x1Cu);
    }
  }
  return v16;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  uint64_t v5 = [(WAMessageAWD *)self key];
  uint64_t v6 = [(WAMessageAWD *)self originalClassName];
  uint64_t v7 = [v4 stringWithFormat:@"WAMessageAWD %@ (%@) (ID: 0x%02x) fields:\n", v5, v6, -[WAMessageAWD metricID](self, "metricID")];
  [v3 appendString:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(WAMessageAWD *)self mutableFields];
  uint64_t v9 = [v8 allKeys];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [(WAMessageAWD *)self mutableFields];
        v16 = [v15 objectForKeyedSubscript:v14];

        [v3 appendFormat:@"               %@ %@\n", v14, v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  mutableFields = self->_mutableFields;
  id v5 = a3;
  [v5 encodeObject:mutableFields forKey:@"_mutableFields"];
  [v5 encodeObject:self->_key forKey:@"_key"];
  [v5 encodeBool:self->_isRootMessage forKey:@"_isRootMessage"];
  [v5 encodeObject:self->_originalClassName forKey:@"_originalClassName"];
  [v5 encodeObject:self->_uuid forKey:@"_uuid"];
  [v5 encodeInteger:self->_metricID forKey:@"_metricID"];
}

- (WAMessageAWD)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WAMessageAWD;
  id v5 = [(WAMessageAWD *)&v25 init];
  if (v5)
  {
    id v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v24, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_mutableFields"];
    mutableFields = v5->_mutableFields;
    v5->_mutableFields = (NSMutableDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
    key = v5->_key;
    v5->_key = (NSString *)v17;

    v5->_isRootMessage = [v4 decodeBoolForKey:@"_isRootMessage"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalClassName"];
    originalClassName = v5->_originalClassName;
    v5->_originalClassName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v21;

    v5->_metricID = [v4 decodeIntegerForKey:@"_metricID"];
  }

  return v5;
}

- (void)addField:(id)a3
{
  id v4 = a3;
  id v6 = [(WAMessageAWD *)self mutableFields];
  id v5 = [v4 key];
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (void)setMetricID:(unint64_t)a3
{
  self->_metricID = a3;
}

- (void)setIsRootMessage:(BOOL)a3
{
  self->_isRootMessage = a3;
}

- (void)setKey:(id)a3
{
}

- (void)setOriginalClassName:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setMutableFields:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isRootMessage
{
  return self->_isRootMessage;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)metricID
{
  return self->_metricID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_originalClassName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_mutableFields, 0);
}

@end