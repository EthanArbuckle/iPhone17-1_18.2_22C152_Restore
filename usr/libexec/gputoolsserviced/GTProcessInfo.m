@interface GTProcessInfo
+ (BOOL)supportsSecureCoding;
- (GTProcessInfo)init;
- (GTProcessInfo)initWithCoder:(id)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)bundleIdentifier;
- (NSString)processName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)ppid;
- (int)processIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPpid:(int)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessName:(id)a3;
@end

@implementation GTProcessInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)GTProcessInfo;
  v2 = [(GTProcessInfo *)&v14 init];
  if (v2)
  {
    v3 = +[NSProcessInfo processInfo];
    uint64_t v4 = [v3 processName];
    processName = v2->_processName;
    v2->_processName = (NSString *)v4;

    uint64_t v6 = [v3 environment];
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)v6;

    uint64_t v8 = [v3 arguments];
    arguments = v2->_arguments;
    v2->_arguments = (NSArray *)v8;

    v2->_processIdentifier = [v3 processIdentifier];
    v2->_ppid = getppid();
    v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    bundleIdentifier = v2->_bundleIdentifier;
    v2->_bundleIdentifier = (NSString *)v11;
  }
  return v2;
}

- (GTProcessInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GTProcessInfo;
  v5 = [(GTProcessInfo *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    processName = v5->_processName;
    v5->_processName = (NSString *)v6;

    if (v5->_processName)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = v5->_processName;
        v5->_processName = 0;
      }
    }
    uint64_t v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"arguments"];
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v9;

    if (v5->_arguments)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v11 = v5->_arguments;
        v12 = (char *)[(NSArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v12)
        {
          v13 = v12;
          uint64_t v14 = *(void *)v39;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v11);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = v5->_arguments;
                v5->_arguments = 0;

                goto LABEL_18;
              }
            }
            v13 = (char *)[(NSArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        uint64_t v11 = v5->_arguments;
        v5->_arguments = 0;
      }
LABEL_18:
    }
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = [v4 decodeDictionaryWithKeysOfClass:v17 objectsOfClass:objc_opt_class() forKey:@"environment"];
    environment = v5->_environment;
    v5->_environment = (NSDictionary *)v18;

    if (v5->_environment)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v20 = v5->_environment;
        id v21 = [(NSDictionary *)v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v35;
          while (2)
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              v27 = v5->_environment;
              if ((isKindOfClass & 1) == 0) {
                goto LABEL_33;
              }
              v28 = -[NSDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v25, (void)v34);
              objc_opt_class();
              char v29 = objc_opt_isKindOfClass();

              if ((v29 & 1) == 0)
              {
                v27 = v5->_environment;
LABEL_33:
                v5->_environment = 0;

                goto LABEL_34;
              }
            }
            id v22 = [(NSDictionary *)v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v20 = v5->_environment;
        v5->_environment = 0;
      }
LABEL_34:
    }
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v30;

    if (v5->_bundleIdentifier)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = v5->_bundleIdentifier;
        v5->_bundleIdentifier = 0;
      }
    }
    v5->_processIdentifier = [v4 decodeInt32ForKey:@"processIdentifier" error:v34];
    v5->_ppid = [v4 decodeInt32ForKey:@"ppid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  id v5 = a3;
  [v5 encodeObject:processName forKey:@"processName"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeInt32:self->_processIdentifier forKey:@"processIdentifier"];
  [v5 encodeInt32:self->_ppid forKey:@"ppid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GTProcessInfo);
  [(GTProcessInfo *)v4 setProcessName:self->_processName];
  id v5 = [objc_alloc((Class)NSArray) initWithArray:self->_arguments copyItems:1];
  [(GTProcessInfo *)v4 setArguments:v5];

  id v6 = [objc_alloc((Class)NSDictionary) initWithDictionary:self->_environment copyItems:1];
  [(GTProcessInfo *)v4 setEnvironment:v6];

  [(GTProcessInfo *)v4 setBundleIdentifier:self->_bundleIdentifier];
  [(GTProcessInfo *)v4 setProcessIdentifier:self->_processIdentifier];
  [(GTProcessInfo *)v4 setProcessName:self->_processName];
  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@: processName=%@ arguments=%@ environment=%@ bundleIdentifier=%@ processIdentifier=%d ppid=%d>", v4, self->_processName, self->_arguments, self->_environment, self->_bundleIdentifier, self->_processIdentifier, self->_ppid];

  return v5;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (int)ppid
{
  return self->_ppid;
}

- (void)setPpid:(int)a3
{
  self->_ppid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

@end