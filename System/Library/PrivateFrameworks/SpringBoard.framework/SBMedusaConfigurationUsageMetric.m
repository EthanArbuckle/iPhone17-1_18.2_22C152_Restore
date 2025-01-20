@interface SBMedusaConfigurationUsageMetric
- (BOOL)_floatingAppIsActiveForConfiguration:(int64_t)a3;
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBMedusaConfigurationUsageMetric)init;
- (void)_trackMedusaConfigChange;
@end

@implementation SBMedusaConfigurationUsageMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v6 = [a4 eventPayload];
  v7 = v6;
  if (a3 == 24)
  {
    v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA75F0]];
    int v19 = [v18 BOOLValue];

    if (self->_isPIPVideoActive == v19)
    {
LABEL_36:
      BOOL v24 = 1;
      goto LABEL_37;
    }
    if (!self->_isPIPVideoActive || (v19 & 1) != 0)
    {
      if (!self->_isPIPVideoActive && v19)
      {
        [v7 timestamp];
        self->_pipVideoActivationTimestamp = v26;
      }
    }
    else
    {
      [v7 timestamp];
      uint64_t v20 = 0;
      double v22 = v21 - self->_pipVideoActivationTimestamp;
      while (v22 >= dbl_1D8FD2758[v20])
      {
        if (++v20 == 13)
        {
          double v23 = 3840.0;
          goto LABEL_33;
        }
      }
      if ((int)v20 <= 1) {
        LODWORD(v20) = 1;
      }
      double v23 = dbl_1D8FD2758[(v20 - 1)];
LABEL_33:
      [(PETDistributionEventTracker *)self->_pipVideoSessionTimeTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:v23];
    }
    self->_isPIPVideoActive = v19;
LABEL_35:
    [(SBMedusaConfigurationUsageMetric *)self _trackMedusaConfigChange];
    goto LABEL_36;
  }
  if (a3 == 5)
  {
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA75B8]];
    int64_t v9 = [v8 unsignedIntegerValue];

    if (self->_currentSpaceConfig != v9) {
      self->_currentSpaceConfig = v9;
    }
    v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA75A8]];
    int64_t v11 = [v10 unsignedIntegerValue];

    if (self->_currentFloatingConfig != v11)
    {
      BOOL v12 = -[SBMedusaConfigurationUsageMetric _floatingAppIsActiveForConfiguration:](self, "_floatingAppIsActiveForConfiguration:");
      BOOL v13 = [(SBMedusaConfigurationUsageMetric *)self _floatingAppIsActiveForConfiguration:v11];
      if (!v12 || v13)
      {
        if (!v12 && v13)
        {
          [v7 timestamp];
          self->_floatingAppActivationTimestamp = v25;
        }
      }
      else
      {
        [v7 timestamp];
        uint64_t v14 = 0;
        double v16 = v15 - self->_floatingAppActivationTimestamp;
        while (v16 >= dbl_1D8FD2758[v14])
        {
          if (++v14 == 13)
          {
            double v17 = 3840.0;
            goto LABEL_28;
          }
        }
        if ((int)v14 <= 1) {
          LODWORD(v14) = 1;
        }
        double v17 = dbl_1D8FD2758[(v14 - 1)];
LABEL_28:
        [(PETDistributionEventTracker *)self->_floatingAppSessionTimeTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:v17];
      }
      self->_currentFloatingConfig = v11;
    }
    goto LABEL_35;
  }
  BOOL v24 = 0;
LABEL_37:

  return v24;
}

- (void)_trackMedusaConfigChange
{
  v8[3] = *MEMORY[0x1E4F143B8];
  medusaUsageTracker = self->_medusaUsageTracker;
  v4 = [NSNumber numberWithInteger:self->_currentSpaceConfig];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", self->_currentFloatingConfig, v4);
  v8[1] = v5;
  v6 = [NSNumber numberWithBool:self->_isPIPVideoActive];
  v8[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  [(PETScalarEventTracker *)medusaUsageTracker trackEventWithPropertyValues:v7];
}

- (SBMedusaConfigurationUsageMetric)init
{
  v30[5] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SBMedusaConfigurationUsageMetric;
  v2 = [(SBMedusaConfigurationUsageMetric *)&v23 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v29[0] = &unk_1F334AA00;
    v29[1] = &unk_1F334AA18;
    v30[0] = @"undefined";
    v30[1] = @"full";
    v29[2] = &unk_1F334AA30;
    v29[3] = &unk_1F334AA48;
    v30[2] = @"halfHalf";
    v30[3] = @"narrowWide";
    v29[4] = &unk_1F334AA60;
    v30[4] = @"wideNarrow";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
    v5 = [v3 propertyWithName:@"space" enumMapping:v4];

    v6 = (void *)MEMORY[0x1E4F93720];
    v27[0] = &unk_1F334AA00;
    v27[1] = &unk_1F334AA18;
    v28[0] = @"undefined";
    v28[1] = @"left";
    v27[2] = &unk_1F334AA48;
    v27[3] = &unk_1F334AA30;
    v28[2] = @"right";
    v28[3] = @"stashed left";
    v27[4] = &unk_1F334AA60;
    v28[4] = @"stashed right";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];
    v8 = [v6 propertyWithName:@"floating" enumMapping:v7];

    int64_t v9 = (void *)MEMORY[0x1E4F93720];
    v25[0] = MEMORY[0x1E4F1CC38];
    v25[1] = MEMORY[0x1E4F1CC28];
    v26[0] = @"Y";
    v26[1] = @"N";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    int64_t v11 = [v9 propertyWithName:@"pipVideo" enumMapping:v10];

    id v12 = objc_alloc(MEMORY[0x1E4F93738]);
    v24[0] = v5;
    v24[1] = v8;
    v24[2] = v11;
    BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    uint64_t v14 = [v12 initWithFeatureId:@"SpringBoard" event:@"MedusaUsage" registerProperties:v13 propertySubsets:&unk_1F33481F8];
    medusaUsageTracker = v2->_medusaUsageTracker;
    v2->_medusaUsageTracker = (PETScalarEventTracker *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F93718]);
    uint64_t v17 = MEMORY[0x1E4F1CBF0];
    uint64_t v18 = [v16 initWithFeatureId:@"SpringBoard" event:@"FloatingSessionTime" registerProperties:MEMORY[0x1E4F1CBF0]];
    floatingAppSessionTimeTracker = v2->_floatingAppSessionTimeTracker;
    v2->_floatingAppSessionTimeTracker = (PETDistributionEventTracker *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"PIPVideoSessionTime" registerProperties:v17];
    pipVideoSessionTimeTracker = v2->_pipVideoSessionTimeTracker;
    v2->_pipVideoSessionTimeTracker = (PETDistributionEventTracker *)v20;
  }
  return v2;
}

- (BOOL)_floatingAppIsActiveForConfiguration:(int64_t)a3
{
  BOOL result = SBFloatingConfigurationIsStashed(a3);
  if (!a3) {
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipVideoSessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_floatingAppSessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_medusaUsageTracker, 0);
}

@end