@interface SignpostSupportAnimationGraceTimeController
- (NSMutableDictionary)subsystemGraceTimesDictionary;
- (SignpostSupportAnimationGraceTime)defaultGraceTime;
- (SignpostSupportAnimationGraceTime)userInitiatedGraceTime;
- (SignpostSupportAnimationGraceTime)userInteractiveGraceTime;
- (SignpostSupportAnimationGraceTimeController)init;
- (id)debugDescription;
- (id)gracetimeForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (unint64_t)defaultGraceTimeMs;
- (unint64_t)gracetimeMsForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (unint64_t)userInitiatedGraceTimeMs;
- (unint64_t)userInteractiveGraceTimeMs;
- (void)_setFirstFrameGraceTime:(id)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6;
- (void)setAnimationType:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6;
- (void)setDefaultGraceTimeMs:(unint64_t)a3;
- (void)setFirstFrameGraceTimeMs:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6;
- (void)setUserInitiatedGraceTimeMs:(unint64_t)a3;
- (void)setUserInteractiveGraceTimeMs:(unint64_t)a3;
@end

@implementation SignpostSupportAnimationGraceTimeController

- (SignpostSupportAnimationGraceTimeController)init
{
  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportAnimationGraceTimeController;
  v2 = [(SignpostSupportAnimationGraceTimeController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    subsystemGraceTimesDictionary = v2->_subsystemGraceTimesDictionary;
    v2->_subsystemGraceTimesDictionary = (NSMutableDictionary *)v3;

    v5 = [[SignpostSupportAnimationGraceTime alloc] initWithAnimationType:2 firstFrameGraceTimeMs:50];
    userInitiatedGraceTime = v2->_userInitiatedGraceTime;
    v2->_userInitiatedGraceTime = v5;

    v7 = [[SignpostSupportAnimationGraceTime alloc] initWithAnimationType:1 firstFrameGraceTimeMs:20];
    userInteractiveGraceTime = v2->_userInteractiveGraceTime;
    v2->_userInteractiveGraceTime = v7;

    v9 = [[SignpostSupportAnimationGraceTime alloc] initWithAnimationType:0 firstFrameGraceTimeMs:0];
    defaultGraceTime = v2->_defaultGraceTime;
    v2->_defaultGraceTime = v9;

    [(SignpostSupportAnimationGraceTimeController *)v2 setAnimationType:1 forSubsystem:@"com.apple.UIKit" category:@"ScrollView" name:@"Scroll_Dragging"];
    [(SignpostSupportAnimationGraceTimeController *)v2 setAnimationType:1 forSubsystem:@"com.apple.UIKit" category:@"ScrollView" name:@"Scroll_DraggingAndDeceleration"];
  }
  return v2;
}

- (void)setAnimationType:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v14 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v12 = [(SignpostSupportAnimationGraceTimeController *)self userInteractiveGraceTime];
    }
    else
    {
      if (a3 != 2) {
        goto LABEL_9;
      }
      uint64_t v12 = [(SignpostSupportAnimationGraceTimeController *)self userInitiatedGraceTime];
    }
  }
  else
  {
    uint64_t v12 = [(SignpostSupportAnimationGraceTimeController *)self defaultGraceTime];
  }
  v13 = (void *)v12;
  if (v12)
  {
    [(SignpostSupportAnimationGraceTimeController *)self _setFirstFrameGraceTime:v12 forSubsystem:v14 category:v10 name:v11];
  }
LABEL_9:
}

- (SignpostSupportAnimationGraceTime)userInteractiveGraceTime
{
  return self->_userInteractiveGraceTime;
}

- (id)gracetimeForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SignpostSupportAnimationGraceTimeController *)self subsystemGraceTimesDictionary];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    if (v8)
    {
      v13 = [v12 overrides];
      id v14 = [v13 objectForKeyedSubscript:v8];
      v15 = v14;
      if (v14)
      {
        if (v9)
        {
          v16 = [v14 overrides];
          v17 = [v16 objectForKeyedSubscript:v9];
          v18 = v17;
          if (!v17) {
            v17 = v15;
          }
          v19 = [v17 defaultGraceTime];

LABEL_12:
          if (v19) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
      else
      {
        id v14 = v12;
      }
      v19 = [v14 defaultGraceTime];
      goto LABEL_12;
    }
    v19 = [v12 defaultGraceTime];
    if (v19) {
      goto LABEL_14;
    }
  }
LABEL_13:
  v19 = [(SignpostSupportAnimationGraceTimeController *)self defaultGraceTime];
LABEL_14:

  return v19;
}

- (void)_setFirstFrameGraceTime:(id)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(SignpostSupportAnimationGraceTimeController *)self subsystemGraceTimesDictionary];
  id v14 = [v13 objectForKeyedSubscript:v10];

  if (!v14)
  {
    id v14 = [[SignpostSupportGraceTimeOverrideEntry alloc] initWithEntryLevel:0];
    v15 = [(SignpostSupportAnimationGraceTimeController *)self subsystemGraceTimesDictionary];
    [v15 setObject:v14 forKeyedSubscript:v10];
  }
  if (v11)
  {
    v16 = [(SignpostSupportGraceTimeOverrideEntry *)v14 overrides];
    v17 = [v16 objectForKeyedSubscript:v11];

    if (!v17)
    {
      v17 = [[SignpostSupportGraceTimeOverrideEntry alloc] initWithEntryLevel:1];
      v18 = [(SignpostSupportGraceTimeOverrideEntry *)v14 overrides];
      [v18 setObject:v17 forKeyedSubscript:v11];
    }
    if (v12)
    {
      v19 = [(SignpostSupportGraceTimeOverrideEntry *)v17 overrides];
      v20 = [v19 objectForKeyedSubscript:v12];

      if (!v20)
      {
        v20 = [[SignpostSupportGraceTimeOverrideEntry alloc] initWithEntryLevel:2];
        v21 = [(SignpostSupportGraceTimeOverrideEntry *)v17 overrides];
        [v21 setObject:v20 forKeyedSubscript:v12];
      }
      [(SignpostSupportGraceTimeOverrideEntry *)v20 setDefaultGraceTime:v22];
    }
    else
    {
      [(SignpostSupportGraceTimeOverrideEntry *)v17 setDefaultGraceTime:v22];
    }
  }
  else
  {
    [(SignpostSupportGraceTimeOverrideEntry *)v14 setDefaultGraceTime:v22];
  }
}

- (NSMutableDictionary)subsystemGraceTimesDictionary
{
  return self->_subsystemGraceTimesDictionary;
}

- (SignpostSupportAnimationGraceTime)defaultGraceTime
{
  return self->_defaultGraceTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGraceTime, 0);
  objc_storeStrong((id *)&self->_userInitiatedGraceTime, 0);
  objc_storeStrong((id *)&self->_userInteractiveGraceTime, 0);

  objc_storeStrong((id *)&self->_subsystemGraceTimesDictionary, 0);
}

- (unint64_t)userInitiatedGraceTimeMs
{
  v2 = [(SignpostSupportAnimationGraceTimeController *)self userInitiatedGraceTime];
  unint64_t v3 = [v2 firstFrameGraceTimeMs];

  return v3;
}

- (void)setUserInitiatedGraceTimeMs:(unint64_t)a3
{
  id v4 = [(SignpostSupportAnimationGraceTimeController *)self userInitiatedGraceTime];
  [v4 setFirstFrameGraceTimeMs:a3];
}

- (unint64_t)userInteractiveGraceTimeMs
{
  v2 = [(SignpostSupportAnimationGraceTimeController *)self userInteractiveGraceTime];
  unint64_t v3 = [v2 firstFrameGraceTimeMs];

  return v3;
}

- (void)setUserInteractiveGraceTimeMs:(unint64_t)a3
{
  id v4 = [(SignpostSupportAnimationGraceTimeController *)self userInteractiveGraceTime];
  [v4 setFirstFrameGraceTimeMs:a3];
}

- (unint64_t)defaultGraceTimeMs
{
  v2 = [(SignpostSupportAnimationGraceTimeController *)self defaultGraceTime];
  unint64_t v3 = [v2 firstFrameGraceTimeMs];

  return v3;
}

- (void)setDefaultGraceTimeMs:(unint64_t)a3
{
  id v4 = [(SignpostSupportAnimationGraceTimeController *)self defaultGraceTime];
  [v4 setFirstFrameGraceTimeMs:a3];
}

- (void)setFirstFrameGraceTimeMs:(unint64_t)a3 forSubsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [[SignpostSupportAnimationGraceTime alloc] initWithAnimationType:3 firstFrameGraceTimeMs:a3];
  [(SignpostSupportAnimationGraceTimeController *)self _setFirstFrameGraceTime:v13 forSubsystem:v12 category:v11 name:v10];
}

- (unint64_t)gracetimeMsForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  v5 = [(SignpostSupportAnimationGraceTimeController *)self gracetimeForSubsystem:a3 category:a4 name:a5];
  unint64_t v6 = [v5 firstFrameGraceTimeMs];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = (void *)[&stru_1EF807BF0 mutableCopy];
  id v4 = [(SignpostSupportAnimationGraceTimeController *)self subsystemGraceTimesDictionary];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __63__SignpostSupportAnimationGraceTimeController_debugDescription__block_invoke;
  v15 = &unk_1E5B3FF80;
  id v16 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v12];

  unint64_t v6 = NSString;
  unint64_t v7 = [(SignpostSupportAnimationGraceTimeController *)self userInteractiveGraceTimeMs];
  unint64_t v8 = [(SignpostSupportAnimationGraceTimeController *)self userInitiatedGraceTimeMs];
  unint64_t v9 = [(SignpostSupportAnimationGraceTimeController *)self defaultGraceTimeMs];
  id v10 = [v6 stringWithFormat:@"%@ \nuserInteractiveGraceTimeMs: %llu \nuserInitiatedGraceTimeMs: %llu \ndefaultGraceTimeMs: %llu \noverrides: {%@\n}", self, v7, v8, v9, v5, v12, v13, v14, v15];

  return v10;
}

void __63__SignpostSupportAnimationGraceTimeController_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  id v8 = [a3 debugDescriptionWithWhitespacePrefix:@"    "];
  unint64_t v7 = [v5 stringWithFormat:@"\n  %@: \n%@", v6, v8];

  [v4 appendString:v7];
}

- (SignpostSupportAnimationGraceTime)userInitiatedGraceTime
{
  return self->_userInitiatedGraceTime;
}

@end