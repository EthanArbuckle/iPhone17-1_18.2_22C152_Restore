@interface SignpostSupportCompositorInterval
+ (id)serializationTypeNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSignpostSupportCompositorInterval:(id)a3;
- (NSArray)contributingPids;
- (SignpostSupportCompositorInterval)initWithDictionary:(id)a3;
- (SignpostSupportCompositorInterval)initWithStartContinuousTime:(unint64_t)a3 endContinuousTime:(unint64_t)a4 timebaseRatio:(double)a5 contributingPids:(id)a6;
- (id)humanReadableDictionaryRepresentation;
- (id)humanReadableType;
- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3;
- (unint64_t)hash;
- (void)setContributingPids:(id)a3;
@end

@implementation SignpostSupportCompositorInterval

- (SignpostSupportCompositorInterval)initWithStartContinuousTime:(unint64_t)a3 endContinuousTime:(unint64_t)a4 timebaseRatio:(double)a5 contributingPids:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SignpostSupportCompositorInterval;
  v15.receiver = [(SignpostAnimationSubInterval *)&v16 initWithStartMCT:a3 endMCT:a4 timebaseRatio:a5];
  v15.super_class = (Class)SignpostSupportCompositorInterval;
  v11 = [(SignpostSupportCompositorInterval *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 allObjects];
    contributingPids = v11->_contributingPids;
    v11->_contributingPids = (NSArray *)v12;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SignpostSupportCompositorInterval *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  if ([(SignpostSupportCompositorInterval *)v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v6 = [(SignpostSupportCompositorInterval *)self isEqualToSignpostSupportCompositorInterval:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSignpostSupportCompositorInterval:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
    if (v6 == [v5 startMachContinuousTime])
    {
      unint64_t v7 = [(SignpostAnimationSubInterval *)self endMachContinuousTime];
      if (v7 == [v5 endMachContinuousTime])
      {
        v8 = [(SignpostSupportCompositorInterval *)self contributingPids];

        v9 = [v5 contributingPids];
        id v10 = v9;
        if (v8)
        {

          if (v10)
          {
            v11 = [(SignpostSupportCompositorInterval *)self contributingPids];
            uint64_t v12 = [v5 contributingPids];
            char v13 = [v11 isEqualToArray:v12];

            if (v13) {
              goto LABEL_8;
            }
          }
        }
        else
        {

          if (!v10)
          {
LABEL_8:
            BOOL v14 = 1;
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    BOOL v14 = 0;
    goto LABEL_12;
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SignpostAnimationSubInterval *)self startMachContinuousTime];
  unint64_t v4 = [(SignpostAnimationSubInterval *)self endMachContinuousTime] ^ v3;
  id v5 = [(SignpostSupportCompositorInterval *)self contributingPids];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (NSArray)contributingPids
{
  return self->_contributingPids;
}

- (void)setContributingPids:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3
{
  return 0;
}

- (SignpostSupportCompositorInterval)initWithDictionary:(id)a3
{
  return 0;
}

- (id)humanReadableType
{
  return @"CompositeInterval";
}

- (id)humanReadableDictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"StartMCTimestamp";
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime"));
  v9[0] = v3;
  v8[1] = @"EndMCTimestamp";
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime"));
  v9[1] = v4;
  v8[2] = @"SignpostObjectType";
  id v5 = [(SignpostSupportCompositorInterval *)self humanReadableType];
  v9[2] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

@end