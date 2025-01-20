@interface SBSAAnimatedTransitionDescription
+ (Class)mutatorClass;
+ (id)animatedTransitionDescriptionWithAnimatedTransitionIdentifier:(id)a3 behaviorSettings:(id)a4 milestones:(id)a5 responsibleProvider:(id)a6;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)keyPathsToAuxillaryBehaviorSettingsMap;
- (NSSet)milestones;
- (NSString)description;
- (NSString)responsibleProviderDebugString;
- (NSUUID)animatedTransitionIdentifier;
- (SBFFluidBehaviorSettings)behaviorSettings;
- (SBSAAnimatedTransitionDescription)initWithAnimatedTransitionDescription:(id)a3;
- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3;
- (id)copyBySettingAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyPathsWithAuxillaryBehaviorSettings;
- (unint64_t)hash;
- (void)_setAnimatedTransitionIdentifier:(id)a3;
- (void)_setBehaviorSettings:(id)a3;
- (void)_setKeyPathsToAuxillaryBehaviorSettingsMap:(id)a3;
- (void)_setMilestones:(id)a3;
- (void)_setResponsibleProviderDebugString:(id)a3;
@end

@implementation SBSAAnimatedTransitionDescription

- (SBSAAnimatedTransitionDescription)initWithAnimatedTransitionDescription:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBSAAnimatedTransitionDescription;
  v5 = [(SBSAAnimatedTransitionDescription *)&v36 init];
  if (v5)
  {
    v6 = [v4 animatedTransitionIdentifier];
    uint64_t v7 = [v6 copy];
    animatedTransitionIdentifier = v5->_animatedTransitionIdentifier;
    v5->_animatedTransitionIdentifier = (NSUUID *)v7;

    v9 = [v4 behaviorSettings];
    uint64_t v10 = [v9 copy];
    behaviorSettings = v5->_behaviorSettings;
    v5->_behaviorSettings = (SBFFluidBehaviorSettings *)v10;

    v12 = [v4 keyPathsToAuxillaryBehaviorSettingsMap];
    if (v12)
    {
      id v31 = v4;
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      keyPathsToAuxillaryBehaviorSettingsMap = v5->_keyPathsToAuxillaryBehaviorSettingsMap;
      v5->_keyPathsToAuxillaryBehaviorSettingsMap = (NSMutableDictionary *)v13;

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v15 = [v12 allKeys];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v21 = v5->_keyPathsToAuxillaryBehaviorSettingsMap;
            v22 = [v12 objectForKeyedSubscript:v20];
            v23 = (void *)[v22 copy];
            [(NSMutableDictionary *)v21 setObject:v23 forKey:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v17);
      }

      id v4 = v31;
    }
    v24 = [v4 responsibleProviderDebugString];
    uint64_t v25 = [v24 copy];
    responsibleProviderDebugString = v5->_responsibleProviderDebugString;
    v5->_responsibleProviderDebugString = (NSString *)v25;

    v27 = [v4 milestones];
    uint64_t v28 = [v27 copy];
    milestones = v5->_milestones;
    v5->_milestones = (NSSet *)v28;
  }
  return v5;
}

- (SBFFluidBehaviorSettings)behaviorSettings
{
  return self->_behaviorSettings;
}

- (NSSet)milestones
{
  return self->_milestones;
}

- (NSString)responsibleProviderDebugString
{
  return self->_responsibleProviderDebugString;
}

- (NSMutableDictionary)keyPathsToAuxillaryBehaviorSettingsMap
{
  return self->_keyPathsToAuxillaryBehaviorSettingsMap;
}

- (NSUUID)animatedTransitionIdentifier
{
  return self->_animatedTransitionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathsToAuxillaryBehaviorSettingsMap, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_responsibleProviderDebugString, 0);
  objc_storeStrong((id *)&self->_behaviorSettings, 0);
  objc_storeStrong((id *)&self->_animatedTransitionIdentifier, 0);
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAAnimatedTransitionDescription *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithAnimatedTransitionDescription:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithAnimatedTransitionDescription:self];
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __147__SBSAAnimatedTransitionDescription_animatedTransitionDescriptionWithAnimatedTransitionIdentifier_behaviorSettings_milestones_responsibleProvider___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[8];
    uint64_t v9 = a1[9];
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr.isa);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAAnimatedTransitionDescription.m", 49, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setAnimatedTransitionIdentifier:a1[4]];
  [v6 setBehaviorSettings:a1[5]];
  [v6 setResponsibleProviderDebugString:a1[6]];
  [v6 setMilestones:a1[7]];
}

- (void)_setMilestones:(id)a3
{
}

- (void)_setResponsibleProviderDebugString:(id)a3
{
}

- (void)_setAnimatedTransitionIdentifier:(id)a3
{
}

- (void)_setBehaviorSettings:(id)a3
{
}

+ (id)animatedTransitionDescriptionWithAnimatedTransitionIdentifier:(id)a3 behaviorSettings:(id)a4 milestones:(id)a5 responsibleProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_alloc_init(SBSAAnimatedTransitionDescription);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __147__SBSAAnimatedTransitionDescription_animatedTransitionDescriptionWithAnimatedTransitionIdentifier_behaviorSettings_milestones_responsibleProvider___block_invoke;
  v22[3] = &unk_1E6AF95C8;
  SEL v27 = a2;
  id v28 = a1;
  id v23 = v11;
  id v24 = v12;
  id v25 = v14;
  id v26 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  id v19 = v11;
  id v20 = [(SBSAAnimatedTransitionDescription *)v15 copyWithBlock:v22];

  return v20;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

- (id)keyPathsWithAuxillaryBehaviorSettings
{
  return (id)[(NSMutableDictionary *)self->_keyPathsToAuxillaryBehaviorSettingsMap allKeys];
}

- (id)copyBySettingAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 isUnanimated])
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBSAAnimatedTransitionDescription.m" lineNumber:76 description:@"Only animated behavior settings (or nil) are acceptable"];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__SBSAAnimatedTransitionDescription_copyBySettingAuxillaryBehaviorSettings_forKeyPath___block_invoke;
  v14[3] = &unk_1E6AF93C8;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  SEL v17 = a2;
  id v9 = v8;
  id v10 = v7;
  id v11 = [(SBSAAnimatedTransitionDescription *)self copyWithBlock:v14];

  return v11;
}

void __87__SBSAAnimatedTransitionDescription_copyBySettingAuxillaryBehaviorSettings_forKeyPath___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  if (v13)
  {
    id v3 = self;
    id v4 = v13;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6) {
      goto LABEL_10;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[4];
    Class v10 = NSClassFromString(&cfstr_Sbsaanimatedtr.isa);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v7 handleFailureInMethod:v8, v9, @"SBSAAnimatedTransitionDescription.m", 78, @"Unexpected class – expected '%@', got '%@'", v10, v12 object file lineNumber description];
  }
  id v6 = 0;
LABEL_10:

  [v6 setAuxillaryBehaviorSettings:a1[5] forKeyPath:a1[6]];
}

- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_keyPathsToAuxillaryBehaviorSettingsMap objectForKey:a3];
  id v4 = self;
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke;
  v25[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v26 = v7;
  uint64_t v8 = [v5 appendObject:animatedTransitionIdentifier counterpart:v25];
  behaviorSettings = self->_behaviorSettings;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_2;
  v23[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v24 = v10;
  id v11 = [v8 appendObject:behaviorSettings counterpart:v23];
  keyPathsToAuxillaryBehaviorSettingsMap = self->_keyPathsToAuxillaryBehaviorSettingsMap;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_3;
  v21[3] = &unk_1E6AF9E90;
  id v13 = v10;
  id v22 = v13;
  id v14 = [v11 appendObject:keyPathsToAuxillaryBehaviorSettingsMap counterpart:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_4;
  v19[3] = &unk_1E6AF5420;
  v19[4] = self;
  id v20 = v13;
  id v15 = v13;
  id v16 = objc_msgSend(v14, "appendEqualsBlocks:", v19, 0);
  char v17 = [v16 isEqual];

  return v17;
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animatedTransitionIdentifier];
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) behaviorSettings];
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyPathsToAuxillaryBehaviorSettingsMap];
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) milestones];
  uint64_t v2 = BSEqualSets();

  return v2;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_animatedTransitionIdentifier];
  id v5 = [v4 appendObject:self->_behaviorSettings];
  id v6 = [v5 appendObject:self->_keyPathsToAuxillaryBehaviorSettingsMap];
  id v7 = [v6 appendObject:self->_milestones];
  unint64_t v8 = [v7 hash];

  return v8;
}

- (NSString)description
{
  uint64_t v2 = self;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_keyPathsToAuxillaryBehaviorSettingsMap allKeys];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v2->_keyPathsToAuxillaryBehaviorSettingsMap;
    uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v12 = NSString;
          [(NSMutableDictionary *)v2->_keyPathsToAuxillaryBehaviorSettingsMap objectForKey:v11];
          v14 = id v13 = v2;
          id v15 = [v12 stringWithFormat:@"<\"%@\" : %@>", v11, v14];
          [v5 addObject:v15];

          uint64_t v2 = v13;
        }
        uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    id v16 = NSString;
    char v17 = [v5 componentsJoinedByString:@", "];
    id v18 = [v16 stringWithFormat:@"[%@]", v17];
  }
  else
  {
    id v18 = @"<none>";
  }
  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; animatedTransitionIdentifier: %@; responsibleProvider: %@; behaviorSettings: %@; auxillaryBehaviorSettings: %@",
                  objc_opt_class(),
                  v2,
                  v2->_animatedTransitionIdentifier,
                  v2->_responsibleProviderDebugString,
                  v2->_behaviorSettings,
                  v18);
  if ([(NSSet *)v2->_milestones count]) {
    [v19 appendFormat:@" milestones: %@", v2->_milestones];
  }
  [v19 appendString:@">"];

  return (NSString *)v19;
}

- (void)_setKeyPathsToAuxillaryBehaviorSettingsMap:(id)a3
{
}

@end