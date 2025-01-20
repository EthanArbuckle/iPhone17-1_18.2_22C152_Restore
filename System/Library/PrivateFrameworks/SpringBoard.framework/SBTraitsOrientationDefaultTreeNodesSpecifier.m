@interface SBTraitsOrientationDefaultTreeNodesSpecifier
- (id)_activeOrientationOrderedNodesWithContext:(id)a3;
- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5;
@end

@implementation SBTraitsOrientationDefaultTreeNodesSpecifier

- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v9 = [v6 acquiredParticipants];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v15 = [v14 role];
        [v7 setObject:v14 forKey:v15];

        v16 = [v14 uniqueIdentifier];
        [v8 setObject:v14 forKey:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v11);
  }
  v45 = v8;
  v43 = v7;

  v41 = [(SBTraitsOrientationDefaultTreeNodesSpecifier *)self _activeOrientationOrderedNodesWithContext:v6];
  v17 = [v41 reverseObjectEnumerator];
  v18 = [v17 allObjects];

  v19 = (void *)MEMORY[0x1E4F1CA48];
  v20 = [v6 acquiredParticipants];
  v21 = objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v42 = v6;
  v22 = [v6 acquiredParticipants];
  uint64_t v46 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v46)
  {
    uint64_t v23 = *(void *)v48;
    unint64_t v24 = 0x1E4FAF000uLL;
    uint64_t v44 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        v27 = [v26 orientationResolutionPolicyInfo];
        uint64_t v28 = [v27 resolutionPolicy];
        if (v28 != 2)
        {
          if (v28 == 3)
          {
            v29 = [v27 associatedParticipantUniqueIdentifier];

            if (v29)
            {
              v30 = [v27 associatedParticipantUniqueIdentifier];
              v31 = v45;
LABEL_25:
              v35 = [v31 objectForKey:v30];

              goto LABEL_27;
            }
            v38 = [v27 associatedParticipantRole];

            if (v38)
            {
              v30 = [v27 associatedParticipantRole];
              v31 = v43;
              goto LABEL_25;
            }
          }
LABEL_26:
          v35 = 0;
          goto LABEL_27;
        }
        unint64_t v32 = [v18 indexOfObject:v26] + 1;
        if (v32 >= [v18 count]) {
          goto LABEL_26;
        }
        v33 = v22;
        v34 = v21;
        while (1)
        {
          v35 = [v18 objectAtIndex:v32];
          v36 = [v35 orientationPreferences];
          char v37 = [v36 canDetermineActiveOrientation];

          if (v37) {
            break;
          }

          if (++v32 >= [v18 count])
          {
            v35 = 0;
            break;
          }
        }
        v21 = v34;
        v22 = v33;
        uint64_t v23 = v44;
        unint64_t v24 = 0x1E4FAF000;
LABEL_27:
        v39 = (void *)[objc_alloc(*(Class *)(v24 + 4032)) initWithParticipant:v26 parentParticipant:v35];
        [v21 addObject:v39];
      }
      uint64_t v46 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v46);
  }

  return v21;
}

- (id)_activeOrientationOrderedNodesWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [v3 acquiredParticipants];
  v26 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v3 acquiredParticipants];
  v7 = (void *)[v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v7)
  {
    v9 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  id v25 = v3;
  id v8 = 0;
  v9 = 0;
  id v27 = 0;
  uint64_t v10 = *(void *)v30;
  obuint64_t j = v6;
  do
  {
    for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v13 = [v12 role];
      int v14 = [v13 isEqualToString:@"SBTraitsParticipantRoleCoverSheet"];

      if (v14)
      {
        id v15 = v12;

        v9 = v15;
      }
      v16 = [v12 role];
      int v17 = [v16 isEqualToString:@"SBTraitsParticipantRoleCoverSheetCamera"];

      if (v17)
      {
        v18 = v8;
        id v8 = v12;
      }
      else
      {
        v19 = [v12 role];
        int v20 = [v19 isEqualToString:@"SBTraitsParticipantRoleSecureApp"];

        if (v20)
        {
          v18 = v27;
          id v27 = v12;
        }
        else
        {
          v18 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC0]) initWithParticipant:v12 parentParticipant:0];
          [v12 currentZOrderLevel];
          objc_msgSend(v18, "setOrder:");
          [v26 addObject:v18];
        }
      }
    }
    v7 = (void *)[obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v7);

  if (v9)
  {
    id v3 = v25;
    v7 = v27;
    if (v8)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC0]) initWithParticipant:v8 parentParticipant:v9];
      [v26 addObject:v21];
    }
    if (v27)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4FAFFC0]) initWithParticipant:v27 parentParticipant:v9];
      [v26 addObject:v6];
LABEL_21:
    }
  }
  else
  {
    id v3 = v25;
    v7 = v27;
  }
  v22 = [MEMORY[0x1E4FAFFB8] treeWithNodesSpecifications:v26 traversalType:0 debugName:@"Active Orientation Order"];
  uint64_t v23 = [v22 participantsTopologicalSort];

  return v23;
}

@end