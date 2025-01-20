@interface MTIDScheme
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (MTIDScheme)initWithCoder:(id)a3;
- (MTIDScheme)initWithNamespace:(id)a3 options:(id)a4;
- (MTIDScheme)initWithNamespace:(id)a3 type:(int64_t)a4;
- (NSArray)correlations;
- (NSArray)topics;
- (NSString)containerIdentifier;
- (NSString)idNamespace;
- (NSString)version;
- (double)maxFutureTimeInterval;
- (double)maxPastTimeInterval;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)idType;
- (int64_t)lifespan;
- (int64_t)rotationSchedule;
- (unint64_t)calculateHash;
- (unint64_t)correlationHash;
- (unint64_t)hash;
- (unint64_t)localHash;
- (unint64_t)storagePoolSize;
- (void)encodeWithCoder:(id)a3;
- (void)overrideLifespanMaybe;
- (void)setContainerIdentifier:(id)a3;
- (void)setCorrelationHash:(unint64_t)a3;
- (void)setCorrelations:(id)a3;
- (void)setIdNamespace:(id)a3;
- (void)setIdType:(int64_t)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLifespan:(int64_t)a3;
- (void)setLocalHash:(unint64_t)a3;
- (void)setRotationSchedule:(int64_t)a3;
- (void)setTopics:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MTIDScheme

- (MTIDScheme)initWithNamespace:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MTIDScheme;
  v8 = [(MTIDScheme *)&v20 init];
  v9 = v8;
  if (v8)
  {
    [(MTIDScheme *)v8 setIdNamespace:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v7 objectForKeyedSubscript:@"rotation"];
      id v11 = [@"daily" compare:v10 options:1];

      if (v11)
      {
        [(MTIDScheme *)v9 setRotationSchedule:0];
        v12 = [v7 objectForKeyedSubscript:@"lifespan"];
        -[MTIDScheme setLifespan:](v9, "setLifespan:", [v12 longLongValue]);
      }
      else
      {
        [(MTIDScheme *)v9 setRotationSchedule:1];
        [(MTIDScheme *)v9 setLifespan:86400];
      }
      v13 = [v7 objectForKeyedSubscript:@"correlations"];
      id v14 = [v13 copy];
      [(MTIDScheme *)v9 setCorrelations:v14];

      v15 = [v7 objectForKeyedSubscript:@"version"];
      [(MTIDScheme *)v9 setVersion:v15];

      v16 = [v7 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([@"userid" caseInsensitiveCompare:v16])
        {
          if ([@"user" caseInsensitiveCompare:v16]) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = 2;
          }
        }
        else
        {
          uint64_t v17 = 2;
        }
      }
      else
      {
        uint64_t v17 = 1;
      }
      [(MTIDScheme *)v9 setIdType:v17];
      v18 = [v7 objectForKeyedSubscript:@"container"];
      [(MTIDScheme *)v9 setContainerIdentifier:v18];
    }
    else
    {
      [(MTIDScheme *)v9 setIdType:1];
    }
    [(MTIDScheme *)v9 overrideLifespanMaybe];
    [(MTIDScheme *)v9 setLocalHash:[(MTIDScheme *)v9 calculateHash]];
  }

  return v9;
}

- (MTIDScheme)initWithNamespace:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTIDScheme;
  id v7 = [(MTIDScheme *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MTIDScheme *)v7 setIdNamespace:v6];
    [(MTIDScheme *)v8 setIdType:a4];
    [(MTIDScheme *)v8 overrideLifespanMaybe];
    [(MTIDScheme *)v8 setLocalHash:[(MTIDScheme *)v8 calculateHash]];
  }

  return v8;
}

- (void)overrideLifespanMaybe
{
  v3 = +[MTFrameworkEnvironment sharedEnvironment];
  unsigned int v4 = [v3 isInternalBuild];

  if (v4)
  {
    id v8 = +[NSUserDefaults standardUserDefaults];
    v5 = [(MTIDScheme *)self idNamespace];
    id v6 = +[NSString stringWithFormat:@"MTIDServiceLifespanOverride~%@", v5];

    uint64_t v7 = (uint64_t)[v8 integerForKey:v6];
    if (!v7) {
      uint64_t v7 = (uint64_t)[v8 integerForKey:@"MTIDServiceLifespanOverride"];
    }
    if (v7 >= 1)
    {
      [(MTIDScheme *)self setRotationSchedule:0];
      [(MTIDScheme *)self setLifespan:v7];
    }
  }
}

- (NSString)containerIdentifier
{
  containerIdentifier = self->_containerIdentifier;
  if (containerIdentifier)
  {
    v3 = containerIdentifier;
  }
  else if ((id)[(MTIDScheme *)self idType] == (id)2)
  {
    v3 = @"com.apple.amp-ae.metricskit.identifiers";
  }
  else
  {
    unsigned int v4 = +[MTFrameworkEnvironment sharedEnvironment];
    v3 = [v4 hostProcessBundleIdentifier];
  }

  return (NSString *)v3;
}

- (unint64_t)storagePoolSize
{
  if (![(MTIDScheme *)self lifespan]) {
    return 1;
  }
  unint64_t v3 = 0x2A3000 / (unint64_t)[(MTIDScheme *)self lifespan];
  if (v3 <= 3) {
    unint64_t v3 = 3;
  }
  if (v3 >= 0x20) {
    return 32;
  }
  else {
    return v3;
  }
}

- (double)maxFutureTimeInterval
{
  if (![(MTIDScheme *)self lifespan]) {
    return 1.79769313e308;
  }
  unint64_t v3 = [(MTIDScheme *)self storagePoolSize];
  double v4 = (double)([(MTIDScheme *)self lifespan] * v3);
  [(MTIDScheme *)self maxPastTimeInterval];
  return v4 - v5;
}

- (double)maxPastTimeInterval
{
  return (double)(2 * [(MTIDScheme *)self lifespan]);
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  double v5 = [(MTIDScheme *)self idNamespace];
  int64_t v6 = [(MTIDScheme *)self lifespan];
  uint64_t v7 = [(MTIDScheme *)self correlations];
  id v8 = +[NSString stringWithFormat:@"<%@: %p, namespace: %@, lifespan: %lld correlations: %@ >", v4, self, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MTIDScheme *)self hash];
    if (v6 == [v5 hash])
    {
      uint64_t v7 = [(MTIDScheme *)self idNamespace];
      id v8 = [v5 idNamespace];
      if ([v7 isEqual:v8]
        && (id v9 = -[MTIDScheme lifespan](self, "lifespan"), v9 == [v5 lifespan])
        && (id v10 = -[MTIDScheme idType](self, "idType"), v10 == [v5 idType]))
      {
        uint64_t v11 = [(MTIDScheme *)self correlations];
        v12 = (void *)v11;
        if (v11) {
          v13 = (void *)v11;
        }
        else {
          v13 = &__NSArray0__struct;
        }
        uint64_t v14 = [v5 correlations];
        v15 = (void *)v14;
        if (v14) {
          v16 = (void *)v14;
        }
        else {
          v16 = &__NSArray0__struct;
        }
        if ([v13 isEqual:v16])
        {
          uint64_t v17 = [(MTIDScheme *)self version];
          v30 = (void *)v17;
          if (v17) {
            v18 = (__CFString *)v17;
          }
          else {
            v18 = &stru_100021530;
          }
          uint64_t v19 = [v5 version];
          objc_super v20 = (void *)v19;
          if (v19) {
            CFStringRef v21 = (const __CFString *)v19;
          }
          else {
            CFStringRef v21 = &stru_100021530;
          }
          if ([(__CFString *)v18 isEqual:v21])
          {
            uint64_t v22 = [(MTIDScheme *)self containerIdentifier];
            if (v22) {
              v23 = (__CFString *)v22;
            }
            else {
              v23 = &stru_100021530;
            }
            uint64_t v24 = objc_msgSend(v5, "containerIdentifier", v22, v30);
            v25 = (void *)v24;
            if (v24) {
              CFStringRef v26 = (const __CFString *)v24;
            }
            else {
              CFStringRef v26 = &stru_100021530;
            }
            unsigned __int8 v27 = [(__CFString *)v23 isEqual:v26];
          }
          else
          {
            unsigned __int8 v27 = 0;
          }
        }
        else
        {
          unsigned __int8 v27 = 0;
        }
      }
      else
      {
        unsigned __int8 v27 = 0;
      }
    }
    else
    {
      unsigned __int8 v27 = 0;
    }
  }
  else
  {
    unsigned __int8 v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTIDScheme *)self localHash];
  return [(MTIDScheme *)self correlationHash] ^ v3;
}

- (unint64_t)calculateHash
{
  unint64_t v3 = [(MTIDScheme *)self idNamespace];
  unint64_t v4 = (unint64_t)[v3 hash];

  int64_t v5 = [(MTIDScheme *)self lifespan];
  unint64_t v6 = v5 ^ [(MTIDScheme *)self rotationSchedule] ^ v4;
  uint64_t v7 = [(MTIDScheme *)self version];
  unint64_t v8 = (unint64_t)[v7 hash];

  unint64_t v9 = v6 ^ v8 ^ [(MTIDScheme *)self idType];
  id v10 = [(MTIDScheme *)self containerIdentifier];
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = [(MTIDScheme *)self correlations];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v11 ^= (unint64_t)[*(id *)(*((void *)&v18 + 1) + 8 * (void)v16) hash];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  unint64_t v4 = [(MTIDScheme *)self idNamespace];
  [v3 setObject:v4 forKeyedSubscript:@"namespace"];

  if ((id)[(MTIDScheme *)self idType] == (id)2) {
    CFStringRef v5 = @"user";
  }
  else {
    CFStringRef v5 = @"client";
  }
  [v3 setObject:v5 forKeyedSubscript:@"type"];
  if ((id)[(MTIDScheme *)self rotationSchedule] == (id)1)
  {
    [v3 setObject:@"daily" forKeyedSubscript:@"rotation"];
  }
  else if ([(MTIDScheme *)self lifespan] >= 1)
  {
    unint64_t v6 = +[NSNumber numberWithLongLong:[(MTIDScheme *)self lifespan]];
    [v3 setObject:v6 forKeyedSubscript:@"lifespan"];
  }
  uint64_t v7 = [(MTIDScheme *)self correlations];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = [(MTIDScheme *)self correlations];
    [v3 setObject:v9 forKeyedSubscript:@"correlations"];
  }
  id v10 = [(MTIDScheme *)self version];
  [v3 setObject:v10 forKeyedSubscript:@"version"];

  unint64_t v11 = [(MTIDScheme *)self containerIdentifier];
  [v3 setObject:v11 forKeyedSubscript:@"container"];

  v12 = [(MTIDScheme *)self topics];
  id v13 = [v12 count];

  if (v13)
  {
    id v14 = [(MTIDScheme *)self topics];
    [v3 setObject:v14 forKeyedSubscript:@"topics"];
  }
  if ([(MTIDScheme *)self isDefault])
  {
    uint64_t v15 = +[NSNumber numberWithBool:[(MTIDScheme *)self isDefault]];
    [v3 setObject:v15 forKeyedSubscript:@"default"];
  }
  id v16 = [v3 copy];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  unint64_t v4 = [(MTIDScheme *)self idNamespace];
  [v9 encodeObject:v4 forKey:@"namespace"];

  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme idType](self, "idType"), @"type");
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme rotationSchedule](self, "rotationSchedule"), @"rotation");
  objc_msgSend(v9, "encodeInt64:forKey:", -[MTIDScheme lifespan](self, "lifespan"), @"lifespan");
  CFStringRef v5 = [(MTIDScheme *)self correlations];
  [v9 encodeObject:v5 forKey:@"correlations"];

  unint64_t v6 = [(MTIDScheme *)self version];
  [v9 encodeObject:v6 forKey:@"version"];

  uint64_t v7 = [(MTIDScheme *)self containerIdentifier];
  [v9 encodeObject:v7 forKey:@"container"];

  id v8 = [(MTIDScheme *)self topics];
  [v9 encodeObject:v8 forKey:@"topics"];

  objc_msgSend(v9, "encodeBool:forKey:", -[MTIDScheme isDefault](self, "isDefault"), @"default");
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme localHash](self, "localHash"), @"localHash");
  objc_msgSend(v9, "encodeInt:forKey:", -[MTIDScheme correlationHash](self, "correlationHash"), @"correlationHash");
}

- (MTIDScheme)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTIDScheme;
  CFStringRef v5 = [(MTIDScheme *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
    [(MTIDScheme *)v5 setIdNamespace:v6];

    -[MTIDScheme setIdType:](v5, "setIdType:", (int)[v4 decodeIntForKey:@"type"]);
    -[MTIDScheme setRotationSchedule:](v5, "setRotationSchedule:", (int)[v4 decodeIntForKey:@"rotation"]);
    -[MTIDScheme setLifespan:](v5, "setLifespan:", [v4 decodeInt64ForKey:@"lifespan"]);
    uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"correlations"];
    [(MTIDScheme *)v5 setCorrelations:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    [(MTIDScheme *)v5 setVersion:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    [(MTIDScheme *)v5 setContainerIdentifier:v9];

    id v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"topics"];
    [(MTIDScheme *)v5 setTopics:v10];

    -[MTIDScheme setIsDefault:](v5, "setIsDefault:", [v4 decodeBoolForKey:@"default"]);
    -[MTIDScheme setLocalHash:](v5, "setLocalHash:", (int)[v4 decodeIntForKey:@"localHash"]);
    -[MTIDScheme setCorrelationHash:](v5, "setCorrelationHash:", (int)[v4 decodeIntForKey:@"correlationHash"]);
  }

  return v5;
}

- (NSString)idNamespace
{
  return self->_idNamespace;
}

- (void)setIdNamespace:(id)a3
{
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (int64_t)rotationSchedule
{
  return self->_rotationSchedule;
}

- (void)setRotationSchedule:(int64_t)a3
{
  self->_rotationSchedule = a3;
}

- (int64_t)lifespan
{
  return self->_lifespan;
}

- (void)setLifespan:(int64_t)a3
{
  self->_lifespan = a3;
}

- (NSArray)correlations
{
  return self->_correlations;
}

- (void)setCorrelations:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void)setContainerIdentifier:(id)a3
{
}

- (unint64_t)localHash
{
  return self->_localHash;
}

- (void)setLocalHash:(unint64_t)a3
{
  self->_localHash = a3;
}

- (unint64_t)correlationHash
{
  return self->_correlationHash;
}

- (void)setCorrelationHash:(unint64_t)a3
{
  self->_correlationHash = a3;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_correlations, 0);

  objc_storeStrong((id *)&self->_idNamespace, 0);
}

@end