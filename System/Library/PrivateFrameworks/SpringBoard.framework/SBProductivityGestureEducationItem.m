@interface SBProductivityGestureEducationItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidWithActivationForType:(int64_t)a3;
- (SBProductivityGestureEducationItem)initWithCoder:(id)a3;
- (SBProductivityGestureEducationItem)initWithType:(int64_t)a3;
- (double)_policyInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_policyCount;
- (int64_t)lastActivatedEducationType;
- (int64_t)type;
- (void)contentDidAppear;
- (void)encodeWithCoder:(id)a3;
- (void)resetActivations;
@end

@implementation SBProductivityGestureEducationItem

- (SBProductivityGestureEducationItem)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBProductivityGestureEducationItem;
  v4 = [(SBProductivityGestureEducationItem *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    activationHistoryMap = v5->_activationHistoryMap;
    v5->_activationHistoryMap = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (double)_policyInterval
{
  return 5.0;
}

- (int64_t)_policyCount
{
  return 2;
}

- (void)contentDidAppear
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  displayDate = self->_displayDate;
  self->_displayDate = v3;

  [(SBProductivityGestureEducationItem *)self resetActivations];
}

- (void)resetActivations
{
}

- (BOOL)isValidWithActivationForType:(int64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_displayDate)
  {
LABEL_4:
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    activationHistoryMap = self->_activationHistoryMap;
    v10 = [NSNumber numberWithInteger:a3];
    v11 = [(NSMutableDictionary *)activationHistoryMap objectForKeyedSubscript:v10];

    self->_lastActivatedEducationType = a3;
    if (!v11)
    {
      v11 = objc_alloc_init(SBProductivityGestureEducationActivationHistory);
      v12 = self->_activationHistoryMap;
      v13 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
    }
    v14 = [(SBProductivityGestureEducationActivationHistory *)v11 date];
    if (v14)
    {
      [v6 timeIntervalSinceDate:v14];
      double v16 = v15;
      [(SBProductivityGestureEducationItem *)self _policyInterval];
      if (v16 < v17)
      {
        uint64_t v22 = [(SBProductivityGestureEducationActivationHistory *)v11 count] + 1;
        v21 = v11;
        goto LABEL_13;
      }
      v18 = SBLogSystemGesture();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = _SBFLoggingMethodProem();
        [(SBProductivityGestureEducationItem *)self _policyInterval];
        int v27 = 138543874;
        v28 = v19;
        __int16 v29 = 2048;
        uint64_t v30 = v20;
        __int16 v31 = 2048;
        int64_t v32 = a3;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "%{public}@ subsequent gesture activation happened past the require policy time of %f seconds for type %ld", (uint8_t *)&v27, 0x20u);
      }
    }
    [(SBProductivityGestureEducationActivationHistory *)v11 setDate:v6];
    v21 = v11;
    uint64_t v22 = 1;
LABEL_13:
    [(SBProductivityGestureEducationActivationHistory *)v21 setCount:v22];
    uint64_t v23 = [(SBProductivityGestureEducationActivationHistory *)v11 count];
    BOOL v24 = v23 >= [(SBProductivityGestureEducationItem *)self _policyCount];

    goto LABEL_17;
  }
  v5 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  uint64_t v6 = [v5 dateByAddingUnit:16 value:1 toDate:self->_displayDate options:0];

  v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v7 compare:v6];

  if (v8 != -1)
  {

    goto LABEL_4;
  }
  SBLogSystemGesture();
  v11 = (SBProductivityGestureEducationActivationHistory *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_INFO))
  {
    v25 = _SBFLoggingMethodProem();
    int v27 = 138543874;
    v28 = v25;
    __int16 v29 = 2048;
    uint64_t v30 = 1;
    __int16 v31 = 2048;
    int64_t v32 = a3;
    _os_log_impl(&dword_1D85BA000, &v11->super, OS_LOG_TYPE_INFO, "%{public}@ gated by the %ld day per education pill type %ld", (uint8_t *)&v27, 0x20u);
  }
  BOOL v24 = 0;
LABEL_17:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[SBProductivityGestureEducationItem alloc] initWithType:self->_type];
  objc_storeStrong((id *)&v4->_displayDate, self->_displayDate);
  objc_storeStrong((id *)&v4->_activationHistoryMap, self->_activationHistoryMap);
  v4->_lastActivatedEducationType = self->_lastActivatedEducationType;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBProductivityGestureEducationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayDate"];

  displayDate = self->_displayDate;
  self->_displayDate = v6;

  return [(SBProductivityGestureEducationItem *)self initWithType:v5];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_displayDate forKey:@"displayDate"];
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)lastActivatedEducationType
{
  return self->_lastActivatedEducationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationHistoryMap, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
}

@end