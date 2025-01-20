@interface SBPIPAnalyticsAssistant
- (NSString)analyticsIdentifier;
- (SBPIPAnalyticsAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6;
- (id)_generateMutableAnalyticsPayload;
- (id)generateAnalyticsPayload;
- (void)invalidate;
- (void)noteBecameInactiveAtTime:(double)a3;
@end

@implementation SBPIPAnalyticsAssistant

- (SBPIPAnalyticsAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a6;
  if (!v11)
  {
    v12 = SBLogCommon();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

    if (v13) {
      NSLog(&cfstr_SupplyAnInvali.isa);
    }
  }
  v14 = v10;
  if (!v10)
  {
    v15 = SBLogCommon();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v16) {
      NSLog(&cfstr_YouForgotABund.isa);
    }
    v14 = @"com.apple.UnknownPIPSource";
  }
  v17 = v14;

  v25.receiver = self;
  v25.super_class = (Class)SBPIPAnalyticsAssistant;
  v18 = [(SBPIPAnalyticsAssistant *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_isAutoPIPEnabled = a5;
    v18->_contentType = a4;
    uint64_t v20 = [(__CFString *)v17 copy];
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    v19->_activationTimestamp = NAN;
    uint64_t v22 = MEMORY[0x1D948C7A0](v11);
    id invalidationBlock = v19->_invalidationBlock;
    v19->_id invalidationBlock = (id)v22;
  }
  return v19;
}

- (void)noteBecameInactiveAtTime:(double)a3
{
  self->_activateDuration = a3 - self->_activationTimestamp + self->_activateDuration;
  self->_activationTimestamp = NAN;
}

- (void)invalidate
{
  [(SBPIPAnalyticsAssistant *)self noteBecameInactiveAtTime:CFAbsoluteTimeGetCurrent()];
  id invalidationBlock = (void (**)(id, SBPIPAnalyticsAssistant *, void *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    v4 = [(SBPIPAnalyticsAssistant *)self analyticsIdentifier];
    invalidationBlock[2](invalidationBlock, self, v4);

    id v5 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (id)generateAnalyticsPayload
{
  v2 = [(SBPIPAnalyticsAssistant *)self _generateMutableAnalyticsPayload];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)_generateMutableAnalyticsPayload
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = self->_bundleIdentifier;
  v9[0] = @"AppBundleIdentifier";
  v9[1] = @"IsAutoPIPEnabled";
  v3 = [NSNumber numberWithBool:self->_isAutoPIPEnabled];
  v10[1] = v3;
  v9[2] = @"ActiveDuration";
  v4 = [NSNumber numberWithDouble:self->_activateDuration];
  v10[2] = v4;
  v9[3] = @"ContentType";
  id v5 = [NSNumber numberWithInteger:self->_contentType];
  v10[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end