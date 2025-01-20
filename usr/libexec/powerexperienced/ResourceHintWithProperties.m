@interface ResourceHintWithProperties
- (NSNumber)pid;
- (NSString)processName;
- (ResourceHintWithProperties)initWithProperties:(id)a3;
- (ResourceHintWithProperties)initWithResourceHint:(id)a3 andPid:(id)a4;
- (void)setPid:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation ResourceHintWithProperties

- (NSNumber)pid
{
  return self->_pid;
}

- (ResourceHintWithProperties)initWithResourceHint:(id)a3 andPid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(ResourceHintWithProperties);
  -[ResourceHintWithProperties setState:](v8, "setState:", [v7 state]);
  v9 = [v7 uuid];
  [(ResourceHintWithProperties *)v8 setUuid:v9];

  id v10 = [v7 resourceType];
  [(ResourceHintWithProperties *)v8 setResourceType:v10];
  [(ResourceHintWithProperties *)v8 setPid:v6];

  return v8;
}

- (ResourceHintWithProperties)initWithProperties:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(ResourceHintWithProperties);
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"uuid"];
    id v7 = [v4 objectForKeyedSubscript:@"type"];
    v8 = [v4 objectForKeyedSubscript:@"state"];
    v9 = [v4 objectForKeyedSubscript:@"pid"];
    id v10 = v9;
    if (!v6 || !v7 || !v8 || !v9)
    {

      v12 = 0;
      goto LABEL_9;
    }
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
    [(ResourceHintWithProperties *)v5 setUuid:v11];

    -[ResourceHintWithProperties setResourceType:](v5, "setResourceType:", [v7 unsignedIntValue]);
    [(ResourceHintWithProperties *)v5 setPid:v10];
    -[ResourceHintWithProperties setState:](v5, "setState:", [v8 unsignedIntValue]);
  }
  v12 = v5;
LABEL_9:

  return v12;
}

- (void)setPid:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);

  objc_storeStrong((id *)&self->_pid, 0);
}

@end