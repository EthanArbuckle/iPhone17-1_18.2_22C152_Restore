@interface SVXDeviceSetupContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)beginDate;
- (NSDate)endDate;
- (SVXDeviceSetupContext)initWithCoder:(id)a3;
- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3;
- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4;
- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5;
- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5 beginDate:(id)a6 endDate:(id)a7;
- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 presentsAlternativeFlowWhenStoreAccountIsUnavailable:(BOOL)a4;
- (SVXDeviceSetupFlowScene)flowScene;
- (SVXDeviceSetupOptions)options;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceSetupContext

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5
{
  return [(SVXDeviceSetupContext *)self initWithTimestamp:a3 options:a4 flowScene:a5 beginDate:0 endDate:0];
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4
{
  return [(SVXDeviceSetupContext *)self initWithTimestamp:a3 options:a4 flowScene:0];
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 presentsAlternativeFlowWhenStoreAccountIsUnavailable:(BOOL)a4
{
  return [(SVXDeviceSetupContext *)self initWithTimestamp:a3 options:0];
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3
{
  return [(SVXDeviceSetupContext *)self initWithTimestamp:a3 options:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_flowScene, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (SVXDeviceSetupFlowScene)flowScene
{
  return self->_flowScene;
}

- (SVXDeviceSetupOptions)options
{
  return self->_options;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t timestamp = self->_timestamp;
  id v7 = a3;
  v6 = [v4 numberWithUnsignedLongLong:timestamp];
  [v7 encodeObject:v6 forKey:@"SVXDeviceSetupContext::timestamp"];

  [v7 encodeObject:self->_options forKey:@"SVXDeviceSetupContext::options"];
  [v7 encodeObject:self->_flowScene forKey:@"SVXDeviceSetupContext::flowScene"];
  [v7 encodeObject:self->_beginDate forKey:@"SVXDeviceSetupContext::beginDate"];
  [v7 encodeObject:self->_endDate forKey:@"SVXDeviceSetupContext::endDate"];
}

- (SVXDeviceSetupContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupContext::timestamp"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupContext::options"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupContext::flowScene"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupContext::beginDate"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceSetupContext::endDate"];

  v11 = [(SVXDeviceSetupContext *)self initWithTimestamp:v6 options:v7 flowScene:v8 beginDate:v9 endDate:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceSetupContext *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t timestamp = self->_timestamp;
      if (timestamp == [(SVXDeviceSetupContext *)v5 timestamp])
      {
        id v7 = [(SVXDeviceSetupContext *)v5 options];
        options = self->_options;
        if (options == v7 || [(SVXDeviceSetupOptions *)options isEqual:v7])
        {
          v9 = [(SVXDeviceSetupContext *)v5 flowScene];
          flowScene = self->_flowScene;
          if (flowScene == v9 || [(SVXDeviceSetupFlowScene *)flowScene isEqual:v9])
          {
            v11 = [(SVXDeviceSetupContext *)v5 beginDate];
            beginDate = self->_beginDate;
            if (beginDate == v11 || [(NSDate *)beginDate isEqual:v11])
            {
              v13 = [(SVXDeviceSetupContext *)v5 endDate];
              endDate = self->_endDate;
              BOOL v15 = endDate == v13 || [(NSDate *)endDate isEqual:v13];
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SVXDeviceSetupOptions *)self->_options hash];
  unint64_t v6 = v5 ^ [(SVXDeviceSetupFlowScene *)self->_flowScene hash];
  uint64_t v7 = v6 ^ [(NSDate *)self->_beginDate hash] ^ v4;
  unint64_t v8 = v7 ^ [(NSDate *)self->_endDate hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXDeviceSetupContext;
  unint64_t v5 = [(SVXDeviceSetupContext *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {unint64_t timestamp = %llu, options = %@, flowScene = %@, beginDate = %@, endDate = %@}", v5, self->_timestamp, self->_options, self->_flowScene, self->_beginDate, self->_endDate];

  return v6;
}

- (id)description
{
  return [(SVXDeviceSetupContext *)self _descriptionWithIndent:0];
}

- (SVXDeviceSetupContext)initWithTimestamp:(unint64_t)a3 options:(id)a4 flowScene:(id)a5 beginDate:(id)a6 endDate:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SVXDeviceSetupContext;
  v16 = [(SVXDeviceSetupContext *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_unint64_t timestamp = a3;
    uint64_t v18 = [v12 copy];
    options = v17->_options;
    v17->_options = (SVXDeviceSetupOptions *)v18;

    uint64_t v20 = [v13 copy];
    flowScene = v17->_flowScene;
    v17->_flowScene = (SVXDeviceSetupFlowScene *)v20;

    uint64_t v22 = [v14 copy];
    beginDate = v17->_beginDate;
    v17->_beginDate = (NSDate *)v22;

    uint64_t v24 = [v15 copy];
    endDate = v17->_endDate;
    v17->_endDate = (NSDate *)v24;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceSetupContextMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_SVXDeviceSetupContextMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXDeviceSetupContextMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXDeviceSetupContext *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXDeviceSetupContextMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceSetupContextMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  unint64_t v5 = [(_SVXDeviceSetupContextMutation *)v4 generate];

  return v5;
}

@end