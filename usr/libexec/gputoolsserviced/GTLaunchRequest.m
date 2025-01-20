@interface GTLaunchRequest
+ (BOOL)supportsSecureCoding;
- (GTLaunchRequest)init;
- (GTLaunchRequest)initWithCoder:(id)a3;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)deviceUDID;
- (NSUUID)sessionUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setArguments:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation GTLaunchRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTLaunchRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)GTLaunchRequest;
  v2 = [(GTLaunchRequest *)&v12 init];
  v3 = v2;
  if (v2)
  {
    environment = v2->_environment;
    v2->_environment = (NSDictionary *)&__NSDictionary0__struct;

    arguments = v3->_arguments;
    v3->_arguments = (NSArray *)&__NSArray0__struct;

    uint64_t v6 = +[GTDeviceProperties uniqueDeviceID];
    deviceUDID = v3->_deviceUDID;
    v3->_deviceUDID = (NSString *)v6;

    uint64_t v8 = +[NSUUID UUID];
    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = (NSUUID *)v8;

    v10 = v3;
  }

  return v3;
}

- (GTLaunchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GTLaunchRequest;
  v5 = [(GTLaunchRequest *)&v45 init];
  if (!v5) {
    goto LABEL_39;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"environment"];
  environment = v5->_environment;
  v5->_environment = (NSDictionary *)v7;

  v9 = v5->_environment;
  if (!v9) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v5->_environment;
LABEL_15:
    v5->_environment = (NSDictionary *)&__NSDictionary0__struct;
    goto LABEL_18;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v9 = v5->_environment;
  id v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v42;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v16 = v5->_environment;
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_17;
        }
        v17 = [(NSDictionary *)v16 objectForKeyedSubscript:v14];
        objc_opt_class();
        char v18 = objc_opt_isKindOfClass();

        if ((v18 & 1) == 0)
        {
          v16 = v5->_environment;
LABEL_17:
          v5->_environment = (NSDictionary *)&__NSDictionary0__struct;

          goto LABEL_18;
        }
      }
      id v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  uint64_t v19 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"arguments"];
  arguments = v5->_arguments;
  v5->_arguments = (NSArray *)v19;

  v21 = v5->_arguments;
  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v21 = v5->_arguments;
      v22 = (char *)[(NSArray *)v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v22)
      {
        v23 = v22;
        uint64_t v24 = *(void *)v38;
        while (2)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v26 = v5->_arguments;
              v5->_arguments = (NSArray *)&__NSArray0__struct;

              goto LABEL_32;
            }
          }
          v23 = (char *)[(NSArray *)v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
      goto LABEL_32;
    }
    v21 = v5->_arguments;
  }
  v5->_arguments = (NSArray *)&__NSArray0__struct;
LABEL_32:

  uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUDID"];
  deviceUDID = v5->_deviceUDID;
  v5->_deviceUDID = (NSString *)v27;

  if (!v5->_deviceUDID || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v29 = +[GTDeviceProperties uniqueDeviceID];
    v30 = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v29;
  }
  uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionUUID"];
  sessionUUID = v5->_sessionUUID;
  v5->_sessionUUID = (NSUUID *)v31;

  if (!v5->_sessionUUID || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v33 = +[NSUUID UUID];
    v34 = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v33;
  }
  v35 = v5;
LABEL_39:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  environment = self->_environment;
  id v5 = a3;
  [v5 encodeObject:environment forKey:@"environment"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeObject:self->_sessionUUID forKey:@"sessionUUID"];
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end