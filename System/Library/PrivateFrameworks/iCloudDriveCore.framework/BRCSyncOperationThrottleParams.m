@interface BRCSyncOperationThrottleParams
- (BOOL)check;
- (BOOL)isEqual:(id)a3;
- (BRCSyncOperationThrottleParams)initWithParams:(id)a3 defaults:(id)a4;
- (double)doubleForKey:(id)a3 inParams:(id)a4 defaults:(id)a5;
- (double)inactivityKickbackDelay;
- (double)inactivityKickbackRatio;
- (double)maxWait;
- (double)minWait;
- (double)ratioOnFailure;
- (double)ratioOnQuotaErrorClear;
- (double)ratioOnSuccess;
- (id)paramsToDictionary;
- (unint64_t)hash;
- (void)setInactivityKickbackDelay:(double)a3;
- (void)setInactivityKickbackRatio:(double)a3;
- (void)setMaxWait:(double)a3;
- (void)setMinWait:(double)a3;
- (void)setRatioOnFailure:(double)a3;
- (void)setRatioOnQuotaErrorClear:(double)a3;
- (void)setRatioOnSuccess:(double)a3;
- (void)setupWithParams:(id)a3 defaults:(id)a4;
@end

@implementation BRCSyncOperationThrottleParams

- (double)doubleForKey:(id)a3 inParams:(id)a4 defaults:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    v12 = [v8 objectForKeyedSubscript:v7];
    [v12 doubleValue];
    double v11 = v13;
  }
  return v11;
}

- (void)setupWithParams:(id)a3 defaults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"wait-at-least" inParams:v7 defaults:v6];
  self->minWait = v8;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"wait-at-most" inParams:v7 defaults:v6];
  self->maxWait = v9;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"success-ratio" inParams:v7 defaults:v6];
  self->ratioOnSuccess = v10;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"quota-clear-ratio" inParams:v7 defaults:v6];
  self->ratioOnQuotaErrorClear = v11;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"error-ratio" inParams:v7 defaults:v6];
  self->ratioOnFailure = v12;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"kickback-delay" inParams:v7 defaults:v6];
  self->inactivityKickbackDelay = v13;
  [(BRCSyncOperationThrottleParams *)self doubleForKey:@"kickback-ratio" inParams:v7 defaults:v6];
  double v15 = v14;

  self->inactivityKickbackRatio = v15;
}

- (BOOL)check
{
  double minWait = self->minWait;
  if (minWait < 0.0 || self->maxWait < minWait) {
    return 0;
  }
  double ratioOnSuccess = self->ratioOnSuccess;
  if (ratioOnSuccess < 0.0 || ratioOnSuccess > 1.0) {
    return 0;
  }
  double ratioOnQuotaErrorClear = self->ratioOnQuotaErrorClear;
  BOOL v6 = ratioOnQuotaErrorClear >= 0.0 && ratioOnQuotaErrorClear <= 1.0;
  if (!v6 || self->ratioOnFailure < 1.0 || self->inactivityKickbackDelay < 0.0) {
    return 0;
  }
  double inactivityKickbackRatio = self->inactivityKickbackRatio;
  return inactivityKickbackRatio <= 1.0 && inactivityKickbackRatio >= 0.0;
}

- (BRCSyncOperationThrottleParams)initWithParams:(id)a3 defaults:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v6 = (BRCSyncOperationThrottleParams *)a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BRCSyncOperationThrottleParams;
  double v8 = [(BRCSyncOperationThrottleParams *)&v15 init];
  if (!v8) {
    goto LABEL_15;
  }
  if (!v6) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BRCSyncOperationThrottleParams *)v8 setupWithParams:v6 defaults:v7];
      if ([(BRCSyncOperationThrottleParams *)v8 check])
      {
LABEL_15:
        double v9 = v8;
        goto LABEL_16;
      }
      double v10 = brc_bread_crumbs();
      double v11 = brc_default_log();
      if (!os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
        goto LABEL_13;
      }
    }
    else
    {
      double v10 = brc_bread_crumbs();
      double v11 = brc_default_log();
      if (!os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
        goto LABEL_13;
      }
    }
    *(_DWORD *)buf = 138412802;
    v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    v21 = v10;
    double v12 = "[ERROR] Invalid user defaults: %@, using %@%@";
    goto LABEL_18;
  }
  if (![(BRCSyncOperationThrottleParams *)v6 check])
  {
    double v10 = brc_bread_crumbs();
    double v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v10;
      double v12 = "[ERROR] Default value %@ is malformed, using %@%@";
LABEL_18:
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, v12, buf, 0x20u);
    }
LABEL_13:

LABEL_14:
    [(BRCSyncOperationThrottleParams *)v8 setupWithParams:0 defaults:v7];
    BOOL v6 = 0;
    goto LABEL_15;
  }
  double v9 = v6;
  BOOL v6 = v9;
LABEL_16:
  double v13 = v9;

  return v13;
}

- (id)paramsToDictionary
{
  v13[7] = *MEMORY[0x263EF8340];
  v12[0] = @"wait-at-least";
  v3 = [NSNumber numberWithDouble:self->minWait];
  v13[0] = v3;
  v12[1] = @"wait-at-most";
  v4 = [NSNumber numberWithDouble:self->maxWait];
  v13[1] = v4;
  v12[2] = @"success-ratio";
  v5 = [NSNumber numberWithDouble:self->ratioOnSuccess];
  v13[2] = v5;
  v12[3] = @"quota-clear-ratio";
  BOOL v6 = [NSNumber numberWithDouble:self->ratioOnQuotaErrorClear];
  v13[3] = v6;
  v12[4] = @"error-ratio";
  id v7 = [NSNumber numberWithDouble:self->ratioOnFailure];
  v13[4] = v7;
  v12[5] = @"kickback-delay";
  double v8 = [NSNumber numberWithDouble:self->inactivityKickbackDelay];
  v13[5] = v8;
  v12[6] = @"kickback-ratio";
  double v9 = [NSNumber numberWithDouble:self->inactivityKickbackRatio];
  v13[6] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRCSyncOperationThrottleParams *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(BRCSyncOperationThrottleParams *)self paramsToDictionary];
      BOOL v6 = [(BRCSyncOperationThrottleParams *)v4 paramsToDictionary];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(BRCSyncOperationThrottleParams *)self paramsToDictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (double)minWait
{
  return self->minWait;
}

- (void)setMinWait:(double)a3
{
  self->double minWait = a3;
}

- (double)maxWait
{
  return self->maxWait;
}

- (void)setMaxWait:(double)a3
{
  self->maxWait = a3;
}

- (double)ratioOnSuccess
{
  return self->ratioOnSuccess;
}

- (void)setRatioOnSuccess:(double)a3
{
  self->double ratioOnSuccess = a3;
}

- (double)ratioOnFailure
{
  return self->ratioOnFailure;
}

- (void)setRatioOnFailure:(double)a3
{
  self->ratioOnFailure = a3;
}

- (double)ratioOnQuotaErrorClear
{
  return self->ratioOnQuotaErrorClear;
}

- (void)setRatioOnQuotaErrorClear:(double)a3
{
  self->double ratioOnQuotaErrorClear = a3;
}

- (double)inactivityKickbackDelay
{
  return self->inactivityKickbackDelay;
}

- (void)setInactivityKickbackDelay:(double)a3
{
  self->inactivityKickbackDelay = a3;
}

- (double)inactivityKickbackRatio
{
  return self->inactivityKickbackRatio;
}

- (void)setInactivityKickbackRatio:(double)a3
{
  self->double inactivityKickbackRatio = a3;
}

@end