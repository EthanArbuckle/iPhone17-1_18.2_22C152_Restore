@interface SBApplicationLayoutGestureMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBApplicationLayoutGestureMetric)init;
- (unint64_t)_moveActionForInitialFloatingConfig:(int64_t)a3 finalConfig:(int64_t)a4;
- (unint64_t)_moveActionForInitialSpaceConfig:(int64_t)a3 finalConfig:(int64_t)a4;
@end

@implementation SBApplicationLayoutGestureMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  v6 = [a4 eventPayload];
  v7 = v6;
  switch(a3)
  {
    case 0x14uLL:
      v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA74F0]];
      uint64_t v9 = [v8 BOOLValue];

      v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA74F8]];
      uint64_t v11 = [v10 integerValue];

      pinGestureCompletionTracker = self->_pinGestureCompletionTracker;
      v13 = [NSNumber numberWithBool:v9];
      v36[0] = v13;
      v14 = [NSNumber numberWithInteger:v11];
      v36[1] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      [(PETScalarEventTracker *)pinGestureCompletionTracker trackEventWithPropertyValues:v15];

      goto LABEL_9;
    case 0x15uLL:
      v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA74E0]];
      uint64_t v18 = [v17 unsignedIntegerValue];

      v19 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA74E8]];
      uint64_t v20 = [v19 unsignedIntegerValue];

      unint64_t v21 = [(SBApplicationLayoutGestureMetric *)self _moveActionForInitialFloatingConfig:v18 finalConfig:v20];
      if (!v21) {
        goto LABEL_9;
      }
      movePIPGestureCompletionTracker = self->_movePIPGestureCompletionTracker;
      v23 = [NSNumber numberWithUnsignedInteger:v21];
      v35 = v23;
      BOOL v16 = 1;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      [(PETScalarEventTracker *)movePIPGestureCompletionTracker trackEventWithPropertyValues:v24];

      break;
    case 0x16uLL:
      v25 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7610]];
      uint64_t v26 = [v25 unsignedIntegerValue];

      v27 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA7618]];
      uint64_t v28 = [v27 unsignedIntegerValue];

      unint64_t v29 = [(SBApplicationLayoutGestureMetric *)self _moveActionForInitialSpaceConfig:v26 finalConfig:v28];
      if (!v29) {
        goto LABEL_9;
      }
      moveSideGestureCompletionTracker = self->_moveSideGestureCompletionTracker;
      v31 = [NSNumber numberWithUnsignedInteger:v29];
      v34 = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
      [(PETScalarEventTracker *)moveSideGestureCompletionTracker trackEventWithPropertyValues:v32];

      BOOL v16 = 1;
      break;
    case 0x17uLL:
      [(PETScalarEventTracker *)self->_unpinGestureCompletionTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
LABEL_9:
      BOOL v16 = 1;
      break;
    default:
      BOOL v16 = 0;
      break;
  }

  return v16;
}

- (SBApplicationLayoutGestureMetric)init
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBApplicationLayoutGestureMetric;
  v2 = [(SBApplicationLayoutGestureMetric *)&v28 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v36[0] = MEMORY[0x1E4F1CC38];
    v36[1] = MEMORY[0x1E4F1CC28];
    v37[0] = @"DOWN";
    v37[1] = @"UP";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    v5 = [v3 propertyWithName:@"swipeDirection" enumMapping:v4];

    v34[0] = &unk_1F33499E0;
    v34[1] = &unk_1F33499F8;
    v35[0] = @"none";
    v35[1] = @"pinLeft";
    v34[2] = &unk_1F3349A10;
    v34[3] = &unk_1F3349A28;
    v35[2] = @"pinRight";
    v35[3] = @"replaceSide";
    v6 = (void *)MEMORY[0x1E4F93720];
    v34[4] = &unk_1F3349A40;
    v35[4] = @"replacePrimary";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];
    v8 = [v6 propertyWithName:@"completionAction" enumMapping:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F93738]);
    v33[0] = v5;
    v33[1] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    uint64_t v11 = [v9 initWithFeatureId:@"SpringBoard" event:@"FloatingAppPin" registerProperties:v10 propertySubsets:&unk_1F33479B8];
    pinGestureCompletionTracker = v2->_pinGestureCompletionTracker;
    v2->_pinGestureCompletionTracker = (PETScalarEventTracker *)v11;

    v13 = (void *)MEMORY[0x1E4F93720];
    v31[0] = &unk_1F3349A58;
    v31[1] = &unk_1F3349A70;
    v32[0] = @"unknown";
    v32[1] = @"moveLeft";
    v31[2] = &unk_1F3349A88;
    v31[3] = &unk_1F3349AA0;
    v32[2] = @"moveRight";
    v32[3] = @"stashLeft";
    v31[4] = &unk_1F3349AB8;
    v31[5] = &unk_1F3349AD0;
    v32[4] = @"stashRight";
    v32[5] = @"unstash";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:6];
    v15 = [v13 propertyWithName:@"moveAction" enumMapping:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F93738]);
    v30 = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    uint64_t v18 = [v16 initWithFeatureId:@"SpringBoard" event:@"FloatingAppMove" registerProperties:v17 propertySubsets:&unk_1F33479D0];
    movePIPGestureCompletionTracker = v2->_movePIPGestureCompletionTracker;
    v2->_movePIPGestureCompletionTracker = (PETScalarEventTracker *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F93738]);
    unint64_t v29 = v15;
    unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v22 = [v20 initWithFeatureId:@"SpringBoard" event:@"SideAppMove" registerProperties:v21 propertySubsets:&unk_1F33479E8];
    moveSideGestureCompletionTracker = v2->_moveSideGestureCompletionTracker;
    v2->_moveSideGestureCompletionTracker = (PETScalarEventTracker *)v22;

    id v24 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v25 = [v24 initWithFeatureId:@"SpringBoard" event:@"SideAppUnpin" registerProperties:MEMORY[0x1E4F1CBF0] propertySubsets:&unk_1F3347A00];
    unpinGestureCompletionTracker = v2->_unpinGestureCompletionTracker;
    v2->_unpinGestureCompletionTracker = (PETScalarEventTracker *)v25;
  }
  return v2;
}

- (unint64_t)_moveActionForInitialFloatingConfig:(int64_t)a3 finalConfig:(int64_t)a4
{
  unint64_t result = 0;
  if (a3 != a4 && a3 && a4)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      if (SBFloatingConfigurationIsStashed(a3)) {
        return 5;
      }
    }
    else
    {
      unint64_t result = a4;
      if ((unint64_t)(a4 - 1) < 4) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

- (unint64_t)_moveActionForInitialSpaceConfig:(int64_t)a3 finalConfig:(int64_t)a4
{
  unint64_t result = 0;
  unint64_t v5 = a3 - 2;
  if ((unint64_t)a3 >= 2 && (unint64_t)a4 >= 2)
  {
    if (a3 != 3 && a3 == a4 || v5 > 2) {
      return 0;
    }
    else {
      return qword_1D8FD0E20[v5];
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveSideGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_movePIPGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_unpinGestureCompletionTracker, 0);
  objc_storeStrong((id *)&self->_pinGestureCompletionTracker, 0);
}

@end