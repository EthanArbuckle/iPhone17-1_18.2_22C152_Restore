@interface SBIdleTimerDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldExpireAfterWarn;
- (BOOL)shouldWarn;
- (NSArray)finalAuditChangeEntry;
- (NSMutableArray)auditEntries;
- (NSString)description;
- (SBIdleTimerDescriptor)_copyWithoutAuditEntries;
- (SBIdleTimerDescriptor)initWithTimerMode:(int64_t)a3 warnInterval:(double)a4 totalInterval:(double)a5;
- (double)quickUnwarnInterval;
- (double)sampleInterval;
- (double)totalInterval;
- (double)warnInterval;
- (id)auditReasonsForStateCapture;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)timerMode;
- (unint64_t)hash;
- (void)addAuditReason:(id)a3;
- (void)appendDescriptionSansProemToFormatter:(double *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)auditAllReasons:(uint64_t)a1;
- (void)auditValueChangesOnly:(uint64_t)a1;
- (void)logAuditReasons:(id)a3;
- (void)setAuditEntries:(id)a3;
- (void)setFinalAuditChangeEntry:(id)a3;
- (void)setQuickUnwarnInterval:(double)a3;
- (void)setSampleInterval:(double)a3;
- (void)setTimerMode:(int64_t)a3;
- (void)setTotalInterval:(double)a3;
- (void)setWarnInterval:(double)a3;
@end

@implementation SBIdleTimerDescriptor

uint64_t __33__SBIdleTimerDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 24);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAuditChangeEntry, 0);
  objc_storeStrong((id *)&self->_auditEntries, 0);
}

- (int64_t)timerMode
{
  return self->_timerMode;
}

- (SBIdleTimerDescriptor)initWithTimerMode:(int64_t)a3 warnInterval:(double)a4 totalInterval:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerDescriptor;
  result = [(SBIdleTimerDescriptor *)&v9 init];
  if (result)
  {
    result->_timerMode = a3;
    result->_sampleInterval = 1.79769313e308;
    result->_warnInterval = a4;
    result->_totalInterval = a5;
  }
  return result;
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (SBIdleTimerDescriptor)_copyWithoutAuditEntries
{
  if (!a1) {
    return 0;
  }
  v2 = objc_alloc_init(SBIdleTimerDescriptor);
  [(SBIdleTimerDescriptor *)v2 setTimerMode:*(void *)(a1 + 8)];
  [(SBIdleTimerDescriptor *)v2 setWarnInterval:*(double *)(a1 + 24)];
  [(SBIdleTimerDescriptor *)v2 setQuickUnwarnInterval:*(double *)(a1 + 40)];
  [(SBIdleTimerDescriptor *)v2 setSampleInterval:*(double *)(a1 + 16)];
  [(SBIdleTimerDescriptor *)v2 setTotalInterval:*(double *)(a1 + 32)];
  return v2;
}

- (void)setTimerMode:(int64_t)a3
{
  self->_timerMode = a3;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

- (void)setWarnInterval:(double)a3
{
  self->_warnInterval = a3;
}

- (void)setSampleInterval:(double)a3
{
  self->_sampleInterval = a3;
}

- (void)setQuickUnwarnInterval:(double)a3
{
  self->_quickUnwarnInterval = a3;
}

- (double)warnInterval
{
  return self->_warnInterval;
}

- (BOOL)shouldWarn
{
  if (BSFloatIsZero()) {
    return 0;
  }
  else {
    return BSFloatEqualToFloat() ^ 1;
  }
}

- (void)addAuditReason:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F28E78];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)objc_alloc_init(v4);
  CFStringAppendFormatAndArguments(v6, 0, v5, &v18);

  if (!self->_auditEntries)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    auditEntries = self->_auditEntries;
    self->_auditEntries = v7;
  }
  objc_super v9 = (void *)[(SBIdleTimerDescriptor *)self copy];
  [v9 setAuditEntries:0];
  v10 = [(NSMutableArray *)self->_auditEntries lastObject];
  v11 = [v10 objectAtIndexedSubscript:1];
  int v12 = [v11 isEqual:v9];
  char v13 = v12;
  uint64_t v14 = v12 ^ 1u;

  v17[0] = v6;
  v17[1] = v9;
  v15 = [NSNumber numberWithBool:v14];
  v17[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  if ((v13 & 1) == 0) {
    objc_storeStrong((id *)&self->_finalAuditChangeEntry, v16);
  }
  [(NSMutableArray *)self->_auditEntries addObject:v16];
}

- (void)setAuditEntries:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[SBIdleTimerDescriptor _copyWithoutAuditEntries]((uint64_t)self);
  v5 = (void *)[(NSMutableArray *)self->_auditEntries copy];
  [(SBIdleTimerDescriptor *)v4 setAuditEntries:v5];

  [(SBIdleTimerDescriptor *)v4 setFinalAuditChangeEntry:self->_finalAuditChangeEntry];
  return v4;
}

- (void)setFinalAuditChangeEntry:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  int64_t timerMode = self->_timerMode;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke;
  v31[3] = &unk_1E6AF9660;
  id v8 = v6;
  id v32 = v8;
  id v9 = (id)[v5 appendInteger:timerMode counterpart:v31];
  double sampleInterval = self->_sampleInterval;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_2;
  v29[3] = &unk_1E6AFD028;
  id v11 = v8;
  id v30 = v11;
  id v12 = (id)[v5 appendDouble:v29 counterpart:sampleInterval];
  double quickUnwarnInterval = self->_quickUnwarnInterval;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_3;
  v27[3] = &unk_1E6AFD028;
  id v14 = v11;
  id v28 = v14;
  id v15 = (id)[v5 appendDouble:v27 counterpart:quickUnwarnInterval];
  double warnInterval = self->_warnInterval;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_4;
  v25[3] = &unk_1E6AFD028;
  id v17 = v14;
  id v26 = v17;
  id v18 = (id)[v5 appendDouble:v25 counterpart:warnInterval];
  double totalInterval = self->_totalInterval;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_5;
  v23[3] = &unk_1E6AFD028;
  id v24 = v17;
  id v20 = v17;
  id v21 = (id)[v5 appendDouble:v23 counterpart:totalInterval];
  LOBYTE(v17) = [v5 isEqual];

  return (char)v17;
}

void __54__SBIdleTimerDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBIdleTimerDescriptor_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

- (void)appendDescriptionSansProemToFormatter:(double *)a1
{
  if (a1)
  {
    id v4 = a2;
    [a1 timerMode];
    v3 = NSStringFromSBFIdleTimerMode();
    [v4 appendString:v3 withName:@"mode"];

    _SBAppendTimeIntervalToFormatter(v4, @"sample", a1[2]);
    _SBAppendTimeIntervalToFormatter(v4, @"quickUnwarn", a1[5]);
    _SBAppendTimeIntervalToFormatter(v4, @"warn", a1[3]);
    _SBAppendTimeIntervalToFormatter(v4, @"total", a1[4]);
  }
}

- (BOOL)shouldExpireAfterWarn
{
  if (BSFloatIsZero() & 1) != 0 || (BSFloatEqualToFloat() & 1) != 0 || (BSFloatIsZero()) {
    return 0;
  }
  else {
    return BSFloatEqualToFloat() ^ 1;
  }
}

- (void)auditAllReasons:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "objectAtIndex:", 0, (void)v12);
          id v11 = [v9 objectAtIndex:1];
          v3[2](v3, v10, v11);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)auditValueChangesOnly:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v14 = a1;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        id v9 = v6;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
          uint64_t v6 = objc_msgSend(v10, "objectAtIndex:", 1, v14);
          id v11 = [v10 objectAtIndexedSubscript:2];
          int v12 = [v11 BOOLValue];

          if (v12)
          {
            long long v13 = [v10 objectAtIndex:0];
            v3[2](v3, v13, v6, v10 == *(void **)(v14 + 56));
          }
          ++v8;
          id v9 = v6;
        }
        while (v5 != v8);
        uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
  }
}

- (void)logAuditReasons:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SBIdleTimerDescriptor_logAuditReasons___block_invoke;
  v8[3] = &unk_1E6B06AF8;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  id v11 = &v12;
  -[SBIdleTimerDescriptor auditValueChangesOnly:]((uint64_t)self, v8);
  if (!*((unsigned char *)v13 + 24))
  {
    uint64_t v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(SBIdleTimerDescriptor *)self succinctDescription];
      *(_DWORD *)buf = 134218242;
      long long v17 = self;
      __int16 v18 = 2114;
      long long v19 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "-> dsc:%p %{public}@ final", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v12, 8);
}

void __41__SBIdleTimerDescriptor_logAuditReasons___block_invoke(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a1[4];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v10)
    {
      uint64_t v11 = a1[5];
      uint64_t v12 = v9;
      long long v13 = [v8 succinctDescription];
      int v16 = 134218498;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      long long v19 = v13;
      __int16 v20 = 2114;
      id v21 = v7;
      uint64_t v14 = "-> dsc:%p %{public}@ reason:%{public}@";
LABEL_6:
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x20u);
    }
  }
  else if (v10)
  {
    uint64_t v15 = a1[5];
    uint64_t v12 = v9;
    long long v13 = [v8 succinctDescription];
    int v16 = 134218498;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    long long v19 = v13;
    __int16 v20 = 2114;
    id v21 = v7;
    uint64_t v14 = "dsc:%p %{public}@ reason:%{public}@";
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

- (id)auditReasonsForStateCapture
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SBIdleTimerDescriptor_auditReasonsForStateCapture__block_invoke;
  v9[3] = &unk_1E6B06B20;
  id v4 = v3;
  id v10 = v4;
  uint64_t v11 = &v12;
  -[SBIdleTimerDescriptor auditValueChangesOnly:]((uint64_t)self, v9);
  if (!*((unsigned char *)v13 + 24))
  {
    id v5 = NSString;
    uint64_t v6 = [(SBIdleTimerDescriptor *)self succinctDescription];
    id v7 = [v5 stringWithFormat:@"-> %@ final", v6];
    [v4 addObject:v7];
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __52__SBIdleTimerDescriptor_auditReasonsForStateCapture__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = NSString;
  id v9 = a2;
  uint64_t v10 = [a3 succinctDescription];
  uint64_t v11 = (void *)v10;
  if (a4) {
    uint64_t v12 = @"-> %@ reason:%@";
  }
  else {
    uint64_t v12 = @"%@ reason:%@";
  }
  long long v13 = objc_msgSend(v8, "stringWithFormat:", v12, v10, v9);

  [v7 addObject:v13];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_timerMode];
  uint64_t v4 = [v3 hash];
  id v5 = [NSNumber numberWithDouble:self->_warnInterval];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [NSNumber numberWithDouble:self->_totalInterval];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)succinctDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __44__SBIdleTimerDescriptor_succinctDescription__block_invoke;
  uint64_t v10 = &unk_1E6AF5290;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

void __44__SBIdleTimerDescriptor_succinctDescription__block_invoke(uint64_t a1)
{
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  -[SBIdleTimerDescriptor appendDescriptionSansProemToFormatter:]((double *)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIdleTimerDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (double)sampleInterval
{
  return self->_sampleInterval;
}

- (double)quickUnwarnInterval
{
  return self->_quickUnwarnInterval;
}

- (NSMutableArray)auditEntries
{
  return self->_auditEntries;
}

- (NSArray)finalAuditChangeEntry
{
  return self->_finalAuditChangeEntry;
}

@end