@interface SBBreadcrumbMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBBreadcrumbMetric)init;
@end

@implementation SBBreadcrumbMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v6 = [a4 eventPayload];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA75D0]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7600]];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (a3 == 16)
  {
    v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7448]];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (v18 == 2)
    {
      rightTracker = self->_rightTracker;
      v15 = [NSNumber numberWithUnsignedInteger:v10];
      v24 = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      v20 = rightTracker;
    }
    else
    {
      if (v18 != 1)
      {
LABEL_14:
        BOOL v21 = 1;
        goto LABEL_15;
      }
      leftTracker = self->_leftTracker;
      v15 = [NSNumber numberWithUnsignedInteger:v8];
      v25 = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v20 = leftTracker;
    }
    [(PETGoalConversionEventTracker *)v20 trackGoalConversionEventWithPropertyValues:v16];
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 15)
  {
    if (v8)
    {
      v11 = self->_leftTracker;
      v12 = [NSNumber numberWithUnsignedInteger:v8];
      v27[0] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [(PETGoalConversionEventTracker *)v11 trackGoalOpportunityEventWithPropertyValues:v13];
    }
    if (!v10) {
      goto LABEL_14;
    }
    v14 = self->_rightTracker;
    v15 = [NSNumber numberWithUnsignedInteger:v10];
    v26 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [(PETGoalConversionEventTracker *)v14 trackGoalOpportunityEventWithPropertyValues:v16];
    goto LABEL_13;
  }
  BOOL v21 = 0;
LABEL_15:

  return v21;
}

- (SBBreadcrumbMetric)init
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBBreadcrumbMetric;
  v2 = [(SBBreadcrumbMetric *)&v15 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v18[0] = &unk_1F334B348;
    v18[1] = &unk_1F334B360;
    v19[0] = @"App";
    v19[1] = @"None";
    v18[2] = &unk_1F334B378;
    v18[3] = &unk_1F334B390;
    v19[2] = @"Unknown";
    v19[3] = @"Siri";
    v18[4] = &unk_1F334B3A8;
    v18[5] = &unk_1F334B3C0;
    v19[4] = @"Spotlight";
    v19[5] = @"AppLinkEscape";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
    v5 = [v3 propertyWithName:@"type" enumMapping:v4];

    id v6 = objc_alloc(MEMORY[0x1E4F93730]);
    v17 = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v8 = [v6 initWithFeatureId:@"SpringBoard" opportunityEvent:@"LeftBreadcrumbShown" conversionEvent:@"LeftBreadcrumbTapped" registerProperties:v7];
    leftTracker = v2->_leftTracker;
    v2->_leftTracker = (PETGoalConversionEventTracker *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F93730]);
    v16 = v5;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    uint64_t v12 = [v10 initWithFeatureId:@"SpringBoard" opportunityEvent:@"RightBreadcrumbShown" conversionEvent:@"RightBreadcrumbTapped" registerProperties:v11];
    rightTracker = v2->_rightTracker;
    v2->_rightTracker = (PETGoalConversionEventTracker *)v12;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightTracker, 0);
  objc_storeStrong((id *)&self->_leftTracker, 0);
}

@end