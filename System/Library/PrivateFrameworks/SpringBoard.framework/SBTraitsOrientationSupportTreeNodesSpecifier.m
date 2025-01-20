@interface SBTraitsOrientationSupportTreeNodesSpecifier
+ (id)findParentForParticipant:(id)a3 nodeSpecifications:(id)a4;
+ (id)findParticipantWithRole:(id)a3 nodeSpecifications:(id)a4;
- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5;
- (unint64_t)supportedOrientations;
@end

@implementation SBTraitsOrientationSupportTreeNodesSpecifier

+ (id)findParticipantWithRole:(id)a3 nodeSpecifications:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "participant", (void)v15);
      v12 = [v11 role];
      char v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

+ (id)findParentForParticipant:(id)a3 nodeSpecifications:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a4;
  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "participant", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          uint64_t v7 = [v10 parentParticipant];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5
{
  id v6 = a3;
  self->_unint64_t supportedOrientations = 0;
  id v7 = +[SBTraitsOrientationSupportTreeNodesSpecifier findParticipantWithRole:@"SBTraitsParticipantRolePipelineManager" nodeSpecifications:v6];
  v19 = v7;
  while (1)
  {
    uint64_t v8 = v7;
    id v7 = +[SBTraitsOrientationSupportTreeNodesSpecifier findParentForParticipant:v7 nodeSpecifications:v6];

    if (!v7) {
      break;
    }
    uint64_t v9 = [v7 role];
    char v10 = [v9 isEqualToString:@"SBTraitsParticipantRoleSwitcherPublisher"];

    id v11 = [v7 role];
    int v12 = [v11 isEqualToString:@"SBTraitsParticipantRoleSwitcherRaw"];

    if ((v10 & 1) == 0 && !v12)
    {
      long long v16 = [v7 orientationPreferences];
      self->_unint64_t supportedOrientations = [v16 supportedOrientations];

      break;
    }
    long long v13 = [v7 orientationResolutionPolicyInfo];
    uint64_t v14 = [v13 resolutionPolicy];

    if (!v14)
    {
      [v7 currentOrientation];
      unint64_t supportedOrientations = SBFBSInterfaceOrientationMaskForBSInterfaceOrientation();
      self->_unint64_t supportedOrientations = supportedOrientations;
      goto LABEL_9;
    }
  }
  unint64_t supportedOrientations = self->_supportedOrientations;
LABEL_9:
  if (!supportedOrientations)
  {
    long long v17 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[ContinuityPipeline] No valid supported orientation found", buf, 2u);
    }
  }
  return v6;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

@end