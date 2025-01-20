@interface RMActivationPayloadState
- (NSArray)inactiveReasons;
- (id)reportDetails;
- (void)setInactiveReasons:(id)a3;
@end

@implementation RMActivationPayloadState

- (NSArray)inactiveReasons
{
  [(RMActivationPayloadState *)self willAccessValueForKey:@"inactiveReasons"];
  v3 = [(RMActivationPayloadState *)self primitiveValueForKey:@"inactiveReasons"];
  [(RMActivationPayloadState *)self didAccessValueForKey:@"inactiveReasons"];
  if (!v3)
  {
    v4 = [(RMActivationPayloadState *)self inactiveReasons];
    if (v4)
    {
      uint64_t v5 = objc_opt_class();
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
      id v9 = 0;
      v3 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v4 error:&v9];
      id v7 = v9;

      if (v3)
      {
        [(RMActivationPayloadState *)self setPrimitiveValue:v3 forKey:@"inactiveReasons"];
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_10001200C();
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return (NSArray *)v3;
}

- (void)setInactiveReasons:(id)a3
{
  id v4 = a3;
  [(RMActivationPayloadState *)self willChangeValueForKey:@"inactiveReasons"];
  [(RMActivationPayloadState *)self setPrimitiveValue:v4 forKey:@"inactiveReasons"];
  if ([v4 count])
  {
    id v14 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
    id v6 = v14;
    BOOL v7 = v5 == 0;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000120A8();
    }

    if ((v5 == 0) != [(RMActivationPayloadState *)self active]) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    BOOL v7 = 1;
    if (([(RMActivationPayloadState *)self active] & 1) == 0) {
LABEL_6:
    }
      [(RMActivationPayloadState *)self setActive:v7];
  }
  id v8 = [(RMActivationPayloadState *)self inactiveReasons];
  id v9 = v5;
  v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (v8) {
      BOOL v11 = v7;
    }
    else {
      BOOL v11 = 0;
    }
    if (v8) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v9 == 0;
    }
    if (!v12 || v11)
    {
    }
    else
    {
      unsigned __int8 v13 = [v8 isEqual:v9];

      if (v13) {
        goto LABEL_24;
      }
    }
    [(RMActivationPayloadState *)self setInactiveReasons_:v10];
  }
LABEL_24:
  [(RMActivationPayloadState *)self didChangeValueForKey:@"inactiveReasons"];
}

- (id)reportDetails
{
  v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithBool:[(RMActivationPayloadState *)self active]];
  [v3 setObject:v4 forKeyedSubscript:@"active"];

  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(RMActivationPayloadState *)self inactiveReasons];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) serializeWithType:1];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v3 setObject:v5 forKeyedSubscript:@"inactiveReasons"];
  id v12 = [v3 copy];

  return v12;
}

@end