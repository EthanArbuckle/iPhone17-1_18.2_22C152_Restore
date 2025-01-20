@interface TRIAllocationStatus
+ (BOOL)supportsSecureCoding;
+ (id)_defaultProvider;
+ (id)activeBMLTInformationWithError:(id *)a3;
+ (id)activeExperimentInformationWithError:(id *)a3;
+ (id)categoricalValueForExperimentAllocationStatus:(unsigned __int8)a3;
+ (id)categoricalValueForRolloutAllocationStatus:(unsigned __int8)a3;
+ (id)getDateFromCursor:(id)a3;
+ (id)internalToExternalStatusMapping;
+ (id)notificationNameForDeploymentEnvironment:(int)a3;
+ (id)sampleAllocationStatuses:(id)a3 correlationId:(id)a4 nrSamples:(unsigned int)a5;
+ (id)syncProxyWithErrorHandler:(id)a3;
+ (void)resetDefaultProvider;
- (BOOL)isEqualToStatus:(id)a3;
- (NSDate)date;
- (TRIAllocationStatus)initWithCoder:(id)a3;
- (TRIAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4;
- (unint64_t)hash;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIAllocationStatus

- (TRIAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIAllocationStatus;
  v8 = [(TRIAllocationStatus *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (BOOL)isEqualToStatus:(id)a3
{
  return self->_type == *((unsigned __int8 *)a3 + 8)
      && [(NSDate *)self->_date isEqualToDate:*((void *)a3 + 2)];
}

- (unint64_t)hash
{
  unsigned int type = self->_type;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  return (unint64_t)v3 + 37 * type;
}

+ (id)_defaultProvider
{
  id v3 = a1;
  objc_sync_enter(v3);
  v4 = (void *)_sharedDefaultProvider;
  if (!_sharedDefaultProvider)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)_sharedDefaultProvider;
    _sharedDefaultProvider = v5;

    v4 = (void *)_sharedDefaultProvider;
    if (!_sharedDefaultProvider)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v3, @"TRIAllocationStatusProvider.m", 683, @"Invalid parameter not satisfying: %@", @"_sharedDefaultProvider" object file lineNumber description];

      v4 = (void *)_sharedDefaultProvider;
    }
  }
  id v7 = v4;
  objc_sync_exit(v3);

  return v7;
}

+ (void)resetDefaultProvider
{
  id obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)_sharedDefaultProvider;
  _sharedDefaultProvider = 0;

  objc_sync_exit(obj);
}

+ (id)notificationNameForDeploymentEnvironment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = TRIDeploymentEnvironment_EnumDescriptor();
  uint64_t v5 = [v4 textFormatNameForValue:v3];

  if (v5)
  {
    v6 = [@"com.apple.trial.status." stringByAppendingString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)syncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _defaultProvider];
  v6 = [v5 syncProxyWithErrorHandler:v4];

  return v6;
}

+ (id)activeExperimentInformationWithError:(id *)a3
{
  id v4 = [a1 _defaultProvider];
  uint64_t v5 = [v4 activeExperimentInformationWithError:a3];

  return v5;
}

+ (id)activeBMLTInformationWithError:(id *)a3
{
  id v4 = [a1 _defaultProvider];
  uint64_t v5 = [v4 activeBMLTInformationWithError:a3];

  return v5;
}

+ (id)sampleAllocationStatuses:(id)a3 correlationId:(id)a4 nrSamples:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = (void *)MEMORY[0x19F3AD060]();
  if ([v9 count] <= (unint64_t)a5)
  {
    id v17 = v9;
  }
  else
  {
    if ([v10 length])
    {
      v12 = [v10 dataUsingEncoding:4];
      v13 = [v12 triSha256];
      if ((unint64_t)[v13 length] <= 7)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, a1, @"TRIAllocationStatusProvider.m", 728, @"Digest too small for correlation ID: %@", v10 object file lineNumber description];
      }
      id v14 = v13;
      uint64_t v15 = *(void *)[v14 bytes];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F93B88]) initWithSeed:v15];
    }
    else
    {
      v16 = 0;
    }
    v18 = objc_msgSend(v9, "_pas_shuffledArrayUsingRng:", v16);
    objc_msgSend(v18, "subarrayWithRange:", 0, a5);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)getDateFromCursor:(id)a3
{
  return (id)[a3 date];
}

+ (id)categoricalValueForExperimentAllocationStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 8) {
    return @"experiment-state-unknown";
  }
  else {
    return off_1E596B1E0[(char)(a3 - 1)];
  }
}

+ (id)categoricalValueForRolloutAllocationStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u) {
    return @"rollout-state-unknown";
  }
  else {
    return off_1E596B228[(char)(a3 - 1)];
  }
}

+ (id)internalToExternalStatusMapping
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EEFCBE70;
  v4[1] = &unk_1EEFCBE88;
  v5[0] = &unk_1EEFCBE70;
  v5[1] = &unk_1EEFCBE88;
  v4[2] = &unk_1EEFCBEA0;
  v5[2] = &unk_1EEFCBEA0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (TRIAllocationStatus)initWithCoder:(id)a3
{
  result = (TRIAllocationStatus *)a3;
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (unsigned)type
{
  return self->_type;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end