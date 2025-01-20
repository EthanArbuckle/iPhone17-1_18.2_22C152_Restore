@interface SiriTaskConfiguration
- (NSString)eventTime;
- (NSString)taskName;
- (NSString)taskType;
- (SiriTaskConfiguration)initWithDictionary:(id)a3;
- (SiriTaskConfiguration)initWithJSONData:(id)a3;
- (int64_t)minDurationInSeconds;
- (void)setEventTime:(id)a3;
- (void)setMinDurationInSeconds:(int64_t)a3;
- (void)setTaskName:(id)a3;
- (void)setTaskType:(id)a3;
@end

@implementation SiriTaskConfiguration

- (SiriTaskConfiguration)initWithJSONData:(id)a3
{
  id v10 = 0;
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (!v4)
  {
    NSLog(&cfstr_ErrorDeseriali.isa, v5);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = objc_opt_class();
    NSLog(&cfstr_GotAnInvalidJs.isa, v9);
    goto LABEL_6;
  }
  self = [(SiriTaskConfiguration *)self initWithDictionary:v4];
  v7 = self;
LABEL_7:

  return v7;
}

- (SiriTaskConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SiriTaskConfiguration;
  id v5 = [(SiriTaskConfiguration *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventTime"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = (void *)[v6 copy];
      [(SiriTaskConfiguration *)v5 setEventTime:v7];

      v8 = [v4 objectForKeyedSubscript:@"taskName"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v9 = (void *)[v8 copy];
        [(SiriTaskConfiguration *)v5 setTaskName:v9];

        id v10 = [v4 objectForKeyedSubscript:@"taskType"];
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v11 = (void *)[v10 copy];
          [(SiriTaskConfiguration *)v5 setTaskType:v11];

          v12 = [v4 objectForKeyedSubscript:@"minDurationInSeconds"];
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[SiriTaskConfiguration setMinDurationInSeconds:](v5, "setMinDurationInSeconds:", (int)[v12 intValue]);
            v13 = v5;
          }
          else
          {
            v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(id)a3
{
}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
}

- (NSString)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(id)a3
{
}

- (int64_t)minDurationInSeconds
{
  return self->_minDurationInSeconds;
}

- (void)setMinDurationInSeconds:(int64_t)a3
{
  self->_minDurationInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskType, 0);
  objc_storeStrong((id *)&self->_taskName, 0);

  objc_storeStrong((id *)&self->_eventTime, 0);
}

@end