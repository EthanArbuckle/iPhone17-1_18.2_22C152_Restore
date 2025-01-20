@interface SBFZStackResolver
- (NSArray)_registeredParticipants;
- (NSString)debugDescription;
- (NSString)description;
- (SBFZStackResolver)init;
- (id)_updateResolutions;
- (id)acquireParticipantWithIdentifier:(int64_t)a3 delegate:(id)a4;
- (id)addObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4;
- (id)settingsOfParticipantWithIdentifier:(int64_t)a3;
- (id)succinctDescription;
- (uint64_t)highestZStackParticipant;
- (uint64_t)participantObservers;
- (uint64_t)participants;
- (uint64_t)resolvedStackDescription;
- (uint64_t)stateCaptureHandle;
- (void)_enumerateObserversOfParticipantWithIdentifier:(void *)a3 withBlock:;
- (void)_registerParticipant:(uint64_t)a1;
- (void)_resolveActivationStateOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveAudioCategoriesDisablingVolumeHUDOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveCaptureButtonFullFidelityEventRequestingScenesOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveForegroundCaptureApplicationsOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveHomeAffordanceDrawingSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveHomeGestureOwnershipOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveParticipantBelowAllowsDimmingOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolvePhysicalButtonSceneTargetsOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_resolveSystemApertureSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:;
- (void)_setNeedsUpdateFromParticipant:(uint64_t)a1;
- (void)_unregisterParticipant:(uint64_t)a1;
- (void)_updateResolutionsForAddedParticipant:(void *)a3 removedParticipant:;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4;
- (void)setHighestZStackParticipant:(uint64_t)a1;
- (void)setParticipantObservers:(uint64_t)a1;
- (void)setParticipants:(uint64_t)a1;
- (void)setResolvedStackDescription:(void *)a1;
- (void)setStateCaptureHandle:(uint64_t)a1;
@end

@implementation SBFZStackResolver

- (void)_resolveSystemApertureSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v27 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    v7 = 0;
    v8 = 0;
    if (!v27) {
      goto LABEL_27;
    }
    int v9 = 0;
    uint64_t v26 = *(void *)v29;
    id obj = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "activationState", obj);
        uint64_t v13 = [v11 activationState];
        v14 = [v11 preferences];
        v15 = v14;
        if (v12) {
          int v9 = 0;
        }
        else {
          v9 |= [v14 suppressSystemApertureForSystemChromeSuppression];
        }
        if (v13 == 2)
        {

          v7 = 0;
          v16 = 0;
LABEL_20:

          goto LABEL_21;
        }
        v17 = [v15 associatedBundleIdentifiersToSuppressInSystemAperture];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          if (!v8)
          {
            v8 = [MEMORY[0x1E4F1CA80] set];
          }
          v19 = [v15 associatedBundleIdentifiersToSuppressInSystemAperture];
          [v8 unionSet:v19];
        }
        v16 = v8;
        v20 = [v15 associatedSceneIdentifiersToSuppressInSystemAperture];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          if (!v7)
          {
            v7 = [MEMORY[0x1E4F1CA80] set];
          }
          v8 = [v15 associatedSceneIdentifiersToSuppressInSystemAperture];
          [v7 unionSet:v8];
          goto LABEL_20;
        }
LABEL_21:
        v8 = v16;
        int v22 = [v11 systemApertureSuppressedForSystemChromeSuppression];
        v23 = [v11 associatedBundleIdentifiersToSuppressInSystemAperture];
        v24 = [v11 associatedSceneIdentifiersToSuppressInSystemAperture];
        if (!BSEqualSets() || !BSEqualSets() || ((v9 ^ v22) & 1) != 0)
        {
          v6[2](v6, v11);
          [v11 setSystemApertureSuppressedForSystemChromeSuppression:v9 & 1];
          [v11 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v7];
          [v11 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v8];
        }
      }
      id v5 = obj;
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v27)
      {
LABEL_27:

        break;
      }
    }
  }
}

uint64_t __39__SBFZStackResolver__updateResolutions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_updateResolutionsForAddedParticipant:(void *)a3 removedParticipant:
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(id *)(a1 + 16);
    v8 = v5;
    id v79 = v5;
    id v70 = v6;
    if (v5 || (v8 = v6) != 0) {
      id v78 = v8;
    }
    else {
      id v78 = 0;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v89 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v16 = _SBFZStackParticipantIdentifierDescription([v15 identifier]);
          v17 = (void *)[v15 copy];
          [v9 setObject:v17 forKey:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v88 objects:v97 count:16];
      }
      while (v12);
    }

    v73 = (void *)a1;
    -[SBFZStackResolver _updateResolutions]((void *)a1);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v85 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(id *)(*((void *)&v84 + 1) + 8 * j);
          if (v22 != v78)
          {
            v23 = [*(id *)(*((void *)&v84 + 1) + 8 * j) delegate];
            [v23 zStackParticipantDidChange:v22];

            uint64_t v24 = [v22 identifier];
            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __78__SBFZStackResolver__updateResolutionsForAddedParticipant_removedParticipant___block_invoke;
            v83[3] = &unk_1E548D878;
            v83[4] = v22;
            v83[5] = v24;
            -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v24, v83);
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
      }
      while (v19);
    }
    id v74 = v9;
    id v25 = v10;
    id v75 = v5;
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v72 = v25;
    uint64_t v80 = [v72 countByEnumeratingWithState:&v92 objects:buf count:16];
    if (v80)
    {
      uint64_t v76 = *(void *)v93;
      unint64_t v26 = 0x1E4F29000uLL;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v93 != v76) {
            objc_enumerationMutation(v72);
          }
          long long v28 = *(void **)(*((void *)&v92 + 1) + 8 * v27);
          long long v29 = _SBFZStackParticipantIdentifierDescription([v28 identifier]);
          if (v5 && (uint64_t v30 = [v28 identifier], v30 == objc_msgSend(v75, "identifier")))
          {
            id v31 = v75;
            v32 = @"++";
          }
          else
          {
            id v31 = [v74 objectForKey:v29];
            v32 = &stru_1ED879EF8;
          }
          v82 = v32;
          unint64_t v33 = [v28 activationState];
          if (v33 > 2) {
            v34 = 0;
          }
          else {
            v34 = off_1E548DA50[v33];
          }
          v35 = [v28 preferences];
          unint64_t v36 = [v35 homeAffordanceDrawingSuppression];
          if (v36 > 2) {
            v81 = 0;
          }
          else {
            v81 = off_1E548DA98[v36];
          }

          int v37 = [v28 ownsHomeGesture];
          if (v37 == [v31 ownsHomeGesture])
          {
            v41 = &stru_1ED879EF8;
            if (![v28 ownsHomeGesture]) {
              goto LABEL_41;
            }
            v42 = *(void **)(v26 + 24);
            v39 = MEMORY[0x18C131F20]([v28 ownsHomeGesture]);
            v41 = [v42 stringWithFormat:@"ownsHomeGesture: %@; ", v39];
          }
          else
          {
            v38 = *(void **)(v26 + 24);
            v39 = MEMORY[0x18C131F20]([v31 ownsHomeGesture]);
            v40 = MEMORY[0x18C131F20]([v28 ownsHomeGesture]);
            v41 = [v38 stringWithFormat:@"ownsHomeGesture: from %@ to %@; ", v39, v40];
          }
LABEL_41:
          uint64_t v43 = [v28 activationState];
          if (v43 == [v31 activationState])
          {
            [*(id *)(v26 + 24) stringWithFormat:@"%@; ", v34, v68];
          }
          else
          {
            unint64_t v44 = [v31 activationState];
            if (v44 > 2) {
              v45 = 0;
            }
            else {
              v45 = off_1E548DA50[v44];
            }
            [*(id *)(v26 + 24) stringWithFormat:@"%@ to %@; ", v45, v34];
          v46 = };
          v47 = [v28 preferences];
          uint64_t v48 = [v47 homeAffordanceDrawingSuppression];
          v49 = [v31 preferences];
          uint64_t v50 = [v49 homeAffordanceDrawingSuppression];

          if (v48 != v50)
          {
            v53 = [v31 preferences];
            unint64_t v54 = [v53 homeAffordanceDrawingSuppression];
            if (v54 > 2) {
              v55 = 0;
            }
            else {
              v55 = off_1E548DA98[v54];
            }
            unint64_t v26 = 0x1E4F29000uLL;

            [NSString stringWithFormat:@"suppression: from %@ to %@; ", v55, v81];
            goto LABEL_54;
          }
          v51 = [v28 preferences];
          uint64_t v52 = [v51 homeAffordanceDrawingSuppression];

          if (v52)
          {
            unint64_t v26 = 0x1E4F29000uLL;
            [NSString stringWithFormat:@"suppression: %@; ", v81, v69];
LABEL_54:
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_55;
          }
          v56 = &stru_1ED879EF8;
          unint64_t v26 = 0x1E4F29000;
LABEL_55:
          int v57 = [v28 participantBelowAllowsDimming];
          int v58 = [v31 participantBelowAllowsDimming];
          v59 = *(void **)(v26 + 24);
          if (v57 == v58)
          {
            v60 = MEMORY[0x18C131F20]([v28 participantBelowAllowsDimming]);
            v62 = [v59 stringWithFormat:@"participantBelowAllowsDimming: %@", v60];
          }
          else
          {
            v60 = MEMORY[0x18C131F20]([v31 participantBelowAllowsDimming]);
            v61 = MEMORY[0x18C131F20]([v28 participantBelowAllowsDimming]);
            v62 = [v59 stringWithFormat:@"participantBelowAllowsDimming: from %@ to %@;", v60, v61];

            unint64_t v26 = 0x1E4F29000;
          }
          id v5 = v79;

          v63 = [*(id *)(v26 + 24) stringWithFormat:@"%@<%@> %@%@%@%@", v82, v29, v41, v46, v56, v62];
          [v77 addObject:v63];

          ++v27;
        }
        while (v80 != v27);
        uint64_t v64 = [v72 countByEnumeratingWithState:&v92 objects:buf count:16];
        uint64_t v80 = v64;
      }
      while (v64);
    }

    v65 = [v77 description];

    id v6 = v70;
    if ((BSEqualStrings() & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(v73, v66, v65, 40);
      v67 = SBLogZStack();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v99 = v65;
        _os_log_impl(&dword_18B52E000, v67, OS_LOG_TYPE_DEFAULT, "Resolved Stack %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __39__SBFZStackResolver__updateResolutions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 preferences];
  id v7 = [v5 preferences];
  uint64_t v8 = [v4 identifier];
  uint64_t v9 = [v6 assertIsAboveParticipantIdentifiers];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [v6 assertIsAboveParticipantIdentifiers];
    uint64_t v12 = [v11 lastIndex];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v4 identifier];
      uint64_t v13 = [v6 assertIsAboveParticipantIdentifiers];
      unint64_t v14 = [v13 lastIndex];

      if (v8 <= v14) {
        uint64_t v8 = v14;
      }
    }
  }
  uint64_t v15 = [v5 identifier];
  uint64_t v16 = [v7 assertIsAboveParticipantIdentifiers];
  if (v16)
  {
    v17 = (void *)v16;
    uint64_t v18 = [v7 assertIsAboveParticipantIdentifiers];
    uint64_t v19 = [v18 lastIndex];

    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [v5 identifier];
      uint64_t v20 = [v7 assertIsAboveParticipantIdentifiers];
      unint64_t v21 = [v20 lastIndex];

      if (v15 <= v21) {
        uint64_t v15 = v21;
      }
    }
  }
  if (v8 < v15)
  {
LABEL_13:
    uint64_t v22 = -1;
    goto LABEL_14;
  }
  if (v8 <= v15)
  {
    v23 = [v7 assertIsAboveParticipantIdentifiers];
    char v24 = objc_msgSend(v23, "containsIndex:", objc_msgSend(v4, "identifier"));

    if ((v24 & 1) == 0)
    {
      unint64_t v26 = [v6 assertIsAboveParticipantIdentifiers];
      unsigned int v27 = objc_msgSend(v26, "containsIndex:", objc_msgSend(v5, "identifier"));

      uint64_t v22 = v27;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v22 = 1;
LABEL_14:

  return v22;
}

- (void)_enumerateObserversOfParticipantWithIdentifier:(void *)a3 withBlock:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void, void))v5;
  if (a1 && v5)
  {
    id v7 = *(void **)(a1 + 24);
    uint64_t v8 = NSNumber;
    id v9 = v7;
    id v10 = [v8 numberWithInteger:a2];
    uint64_t v11 = [v9 objectForKey:v10];

    if (v11)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v12 = objc_msgSend(v11, "allObjects", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            v6[2](v6, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
  }
}

- (id)_updateResolutions
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[2];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__SBFZStackResolver__updateResolutions__block_invoke;
    v11[3] = &unk_1E548D8C0;
    v11[4] = a1;
    v11[5] = sel__updateResolutions;
    id v3 = v2;
    id v4 = [v3 sortedArrayUsingComparator:v11];
    id v5 = objc_opt_new();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__SBFZStackResolver__updateResolutions__block_invoke_2;
    v9[3] = &unk_1E548D8E8;
    id v6 = v5;
    id v10 = v6;
    id v7 = (void *)MEMORY[0x18C133210](v9);
    -[SBFZStackResolver _resolveActivationStateOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveHomeGestureOwnershipOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveHomeAffordanceDrawingSuppressionOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveSystemApertureSuppressionOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolvePhysicalButtonSceneTargetsOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveCaptureButtonFullFidelityEventRequestingScenesOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveForegroundCaptureApplicationsOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveAudioCategoriesDisablingVolumeHUDOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    -[SBFZStackResolver _resolveParticipantBelowAllowsDimmingOfSortedParticipants:changedParticipantHandler:]((uint64_t)v1, v4, v7);
    id v1 = v6;
  }
  return v1;
}

- (void)_resolvePhysicalButtonSceneTargetsOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = [v12 activationState];
          uint64_t v14 = [v12 preferences];
          uint64_t v15 = v14;
          if (v13)
          {
            uint64_t v16 = v9;
            id v9 = 0;
          }
          else
          {
            uint64_t v16 = [v14 physicalButtonSceneTargets];
            if (v16)
            {
              if (!v9) {
                id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v9 addObjectsFromArray:v16];
            }
          }

          long long v17 = [v12 physicalButtonSceneTargets];
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            [v12 setPhysicalButtonSceneTargets:v9];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
}

- (void)_resolveParticipantBelowAllowsDimmingOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((v9 & 1) != [v12 participantBelowAllowsDimming])
          {
            v6[2](v6, v12);
            [v12 setParticipantBelowAllowsDimming:v9 & 1];
          }
          if ([v12 activationState] == 1)
          {
            uint64_t v13 = [v12 preferences];
            uint64_t v14 = [v13 allowsDimmingWhenForegroundInactive];

            if (v14 == 2)
            {
              char v9 = 0;
            }
            else if (v14 == 1)
            {
              char v9 = 1;
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (void)_resolveHomeGestureOwnershipOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(a2, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    BOOL v9 = 0;
    uint64_t v10 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = [v12 preferences];
        if (((v9 ^ [v12 ownsHomeGesture]) & 1) == 0)
        {
          v5[2](v5, v12);
          [v12 setOwnsHomeGesture:!v9];
        }
        uint64_t v14 = [v13 homeGestureConsumption];
        if (v14 == 1) {
          goto LABEL_12;
        }
        if (v14) {
          goto LABEL_14;
        }
        if (v9) {
LABEL_12:
        }
          BOOL v9 = 1;
        else {
          BOOL v9 = [v13 activationPolicyForParticipantsBelow] != 0;
        }
LABEL_14:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v8)
      {
LABEL_16:

        break;
      }
    }
  }
}

- (void)_resolveHomeAffordanceDrawingSuppressionOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          uint64_t v13 = [v12 preferences];
          uint64_t v14 = [v13 homeAffordanceDrawingSuppression];
          if (v14 == 1)
          {
            char v9 = 1;
            if (([v12 homeAffordanceDrawingSuppressed] & 1) == 0) {
              goto LABEL_11;
            }
          }
          else
          {
            if (!v14) {
              v9 &= [v13 activationPolicyForParticipantsBelow] == 0;
            }
            if ((v9 & 1) != [v12 homeAffordanceDrawingSuppressed])
            {
LABEL_11:
              v6[2](v6, v12);
              [v12 setHomeAffordanceDrawingSuppressed:v9 & 1];
            }
          }

          ++v11;
        }
        while (v8 != v11);
        uint64_t v15 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v8 = v15;
      }
      while (v15);
    }
  }
}

- (void)_resolveForegroundCaptureApplicationsOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = [v12 activationState];
          uint64_t v14 = [v12 preferences];
          uint64_t v15 = v14;
          if (v13)
          {
            long long v16 = v9;
            id v9 = 0;
          }
          else
          {
            long long v16 = [v14 foregroundCaptureSceneTargets];
            if (v16)
            {
              if (!v9) {
                id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v9 addObjectsFromArray:v16];
            }
          }

          long long v17 = [v12 foregroundCaptureSceneTargets];
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            [v12 setForegroundCaptureSceneTargets:v9];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
}

- (void)_resolveCaptureButtonFullFidelityEventRequestingScenesOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = [v12 activationState];
          uint64_t v14 = [v12 preferences];
          uint64_t v15 = v14;
          if (v13)
          {
            long long v16 = v9;
            id v9 = 0;
          }
          else
          {
            long long v16 = [v14 captureButtonFullFidelityEventRequestingScenes];
            if (v16)
            {
              if (!v9) {
                id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v9 addObjectsFromArray:v16];
            }
          }

          long long v17 = [v12 captureButtonFullFidelityEventRequestingScenes];
          if ((BSEqualArrays() & 1) == 0)
          {
            v6[2](v6, v12);
            [v12 setCaptureButtonFullFidelityEventRequestingScenes:v9];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
}

- (void)_resolveAudioCategoriesDisablingVolumeHUDOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 activationState] == 2)
          {
            uint64_t v13 = v9;
            id v9 = 0;
          }
          else
          {
            uint64_t v13 = [v12 preferences];
            uint64_t v14 = [v13 audioCategoriesDisablingVolumeHUD];
            uint64_t v15 = SBFAudioCategoriesDisablingVolumeHUDUnion(v9, v14);

            id v9 = (void *)v15;
          }

          long long v16 = [v12 audioCategoriesDisablingVolumeHUD];
          if ((BSEqualSets() & 1) == 0)
          {
            v6[2](v6, v12);
            [v12 setAudioCategoriesDisablingVolumeHUD:v9];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (void)_resolveActivationStateOfSortedParticipants:(void *)a3 changedParticipantHandler:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = objc_msgSend(a2, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 activationState] != v9)
          {
            v5[2](v5, v12);
            [v12 setActivationState:v9];
          }
          uint64_t v13 = [v12 preferences];
          uint64_t v14 = [v13 activationPolicyForParticipantsBelow];
          if (v9 <= 1) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = v9;
          }
          if (v14 != 1) {
            uint64_t v15 = v9;
          }
          if (v14 == 2) {
            unint64_t v9 = 2;
          }
          else {
            unint64_t v9 = v15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
}

void __78__SBFZStackResolver__updateResolutionsForAddedParticipant_removedParticipant___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 zStackParticipantWithIdentifier:*(void *)(a1 + 40) settingsDidChange:*(void *)(a1 + 32)];
  }
}

- (SBFZStackResolver)init
{
  v16.receiver = self;
  v16.super_class = (Class)SBFZStackResolver;
  v2 = [(SBFZStackResolver *)&v16 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    participants = v2->_participants;
    v2->_participants = v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    participantObservers = v2->_participantObservers;
    v2->_participantObservers = (NSMapTable *)v5;

    uint64_t v7 = [(SBFZStackResolver *)v2 acquireParticipantWithIdentifier:30 delegate:0];
    highestZStackParticipant = v2->_highestZStackParticipant;
    v2->_highestZStackParticipant = (SBFZStackParticipant *)v7;

    objc_initWeak(&location, v2);
    id v9 = MEMORY[0x1E4F14428];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"SpringBoard - Z Stack Resolver - %p", v2);
    objc_copyWeak(&v14, &location);
    uint64_t v11 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __25__SBFZStackResolver_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  v2 = self;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (self) {
    self = (SBFZStackResolver *)self->_participants;
  }
  id v3 = (void *)[(SBFZStackResolver *)self copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[SBFZStackResolver _unregisterParticipant:]((uint64_t)v2, *(void **)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(BSInvalidatable *)v2->_stateCaptureHandle invalidate];
  v8.receiver = v2;
  v8.super_class = (Class)SBFZStackResolver;
  [(SBFZStackResolver *)&v8 dealloc];
}

- (uint64_t)participants
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)_unregisterParticipant:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 identifier];
    uint64_t v6 = *(void **)(a1 + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke;
    v16[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
    v16[4] = v5;
    uint64_t v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v16);
    if (v7 != v4)
    {
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__unregisterParticipant_, a1, @"SBFZStackResolver.m", 175, @"Cannot unregister participant, because it isn't registered to begin with. Participant to unregister:%@, registered participants:%@", v4, *(void *)(a1 + 16) object file lineNumber description];
    }
    objc_super v8 = SBLogZStack();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = _SBFZStackParticipantIdentifierDescription([v4 identifier]);
      *(_DWORD *)buf = 138543362;
      long long v18 = v9;
      _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_DEFAULT, "Unregistered participant: <%{public}@>", buf, 0xCu);
    }
    [*(id *)(a1 + 16) removeObject:v4];
    [v4 setResolver:0];
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, 0, v4);
    if ([v4 ownsHomeGesture])
    {
      [v4 setOwnsHomeGesture:0];
      long long v10 = [v4 delegate];
      [v10 zStackParticipantDidChange:v4];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke_35;
      v13[3] = &unk_1E548D878;
      uint64_t v15 = v5;
      id v14 = v4;
      -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v13);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__SBFZStackResolver__unregisterParticipant___block_invoke_2;
    v12[3] = &__block_descriptor_40_e40_v16__0___SBFZStackParticipantObserver__8l;
    v12[4] = v5;
    -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v12);
  }
}

- (id)acquireParticipantWithIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [[SBFZStackParticipant alloc] initWithIdentifier:a3 delegate:v6];

  -[SBFZStackResolver _registerParticipant:]((uint64_t)self, v7);
  return v7;
}

- (void)_registerParticipant:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 identifier];
    id v6 = *(void **)(a1 + 16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__SBFZStackResolver__registerParticipant___block_invoke;
    v14[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
    v14[4] = v5;
    uint64_t v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v14);
    if (v7)
    {
      long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__registerParticipant_, a1, @"SBFZStackResolver.m", 147, @"Cannot register participant, there's already a participant with the same identifier. Participant to register:%@, registered participants:%@", v4, *(void *)(a1 + 16) object file lineNumber description];
    }
    objc_super v8 = SBLogZStack();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = _SBFZStackParticipantIdentifierDescription([v4 identifier]);
      *(_DWORD *)buf = 138543362;
      objc_super v16 = v9;
      _os_log_impl(&dword_18B52E000, v8, OS_LOG_TYPE_DEFAULT, "Registered participant: <%{public}@>", buf, 0xCu);
    }
    [*(id *)(a1 + 16) addObject:v4];
    [*(id *)(a1 + 16) sortUsingComparator:&__block_literal_global_20];
    [v4 _updatePreferences];
    [v4 setResolver:a1];
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, v4, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__SBFZStackResolver__registerParticipant___block_invoke_2;
    v11[3] = &unk_1E548D878;
    uint64_t v13 = v5;
    id v12 = v4;
    -[SBFZStackResolver _enumerateObserversOfParticipantWithIdentifier:withBlock:](a1, v5, v11);
  }
}

- (id)addObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    if (self)
    {
LABEL_3:
      participantObservers = self->_participantObservers;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBFZStackResolver.m", 105, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
  }
  participantObservers = 0;
LABEL_4:
  long long v9 = participantObservers;
  long long v10 = [NSNumber numberWithInteger:a4];
  long long v11 = [(NSMapTable *)v9 objectForKey:v10];

  if (!v11)
  {
    long long v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v12 = [NSNumber numberWithInteger:a4];
    [(NSMapTable *)v9 setObject:v11 forKey:v12];
  }
  [v11 addObject:v7];
  uint64_t v13 = [(SBFZStackResolver *)self settingsOfParticipantWithIdentifier:a4];

  return v13;
}

- (uint64_t)participantObservers
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)removeObserver:(id)a3 ofParticipantWithIdentifier:(int64_t)a4
{
  id v15 = a3;
  if (!v15)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBFZStackResolver.m", 117, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
LABEL_11:
    participantObservers = 0;
    goto LABEL_4;
  }
  if (!self) {
    goto LABEL_11;
  }
LABEL_3:
  participantObservers = self->_participantObservers;
LABEL_4:
  objc_super v8 = participantObservers;
  long long v9 = [NSNumber numberWithInteger:a4];
  long long v10 = [(NSMapTable *)v8 objectForKey:v9];

  if (v10)
  {
    [v10 removeObject:v15];
    long long v11 = [v10 allObjects];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      uint64_t v13 = [NSNumber numberWithInteger:a4];
      [(NSMapTable *)v8 removeObjectForKey:v13];
    }
  }
}

- (id)settingsOfParticipantWithIdentifier:(int64_t)a3
{
  if (self) {
    self = (SBFZStackResolver *)self->_participants;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SBFZStackResolver_settingsOfParticipantWithIdentifier___block_invoke;
  v5[3] = &__block_descriptor_40_e30_B16__0__SBFZStackParticipant_8l;
  v5[4] = a3;
  id v3 = [(SBFZStackResolver *)self bs_firstObjectPassingTest:v5];
  return v3;
}

BOOL __57__SBFZStackResolver_settingsOfParticipantWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == *(void *)(a1 + 32);
}

- (NSArray)_registeredParticipants
{
  if (self)
  {
    id v3 = self->_participants;
    highestZStackParticipant = self->_highestZStackParticipant;
  }
  else
  {
    id v3 = 0;
    highestZStackParticipant = 0;
  }
  [(NSMutableArray *)v3 removeObject:highestZStackParticipant];
  uint64_t v5 = (void *)[(NSMutableArray *)v3 copy];

  return (NSArray *)v5;
}

- (uint64_t)highestZStackParticipant
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

BOOL __42__SBFZStackResolver__registerParticipant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == *(void *)(a1 + 32);
}

BOOL __42__SBFZStackResolver__registerParticipant___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identifier];
  uint64_t v6 = [v4 identifier];

  return v5 < v6;
}

void __42__SBFZStackResolver__registerParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 zStackParticipantWithIdentifier:*(void *)(a1 + 40) wasAcquiredWithSettings:*(void *)(a1 + 32)];
  }
}

BOOL __44__SBFZStackResolver__unregisterParticipant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier] == *(void *)(a1 + 32);
}

void __44__SBFZStackResolver__unregisterParticipant___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 zStackParticipantWithIdentifier:*(void *)(a1 + 40) settingsDidChange:*(void *)(a1 + 32)];
  }
}

void __44__SBFZStackResolver__unregisterParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 zStackParticipantWasInvalidated:*(void *)(a1 + 32)];
  }
}

- (void)_setNeedsUpdateFromParticipant:(uint64_t)a1
{
  if (a1) {
    -[SBFZStackResolver _updateResolutionsForAddedParticipant:removedParticipant:](a1, 0, 0);
  }
}

- (void)setResolvedStackDescription:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
  }
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (NSString)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  uint64_t v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (id)succinctDescription
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F4F720];
    id v3 = [MEMORY[0x1E4F4F728] succinctStyle];
    id v1 = [v2 descriptionForRootObject:v1 withStyle:v3];
  }
  return v1;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  [v4 appendProem:self block:&__block_literal_global_50];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SBFZStackResolver_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E548CBA0;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [v5 appendBodySectionWithName:0 block:v6];
}

id __47__SBFZStackResolver_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  return (id)[v2 appendObject:v4 withName:@"participants"];
}

- (uint64_t)stateCaptureHandle
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)setStateCaptureHandle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setParticipants:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setParticipantObservers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setHighestZStackParticipant:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)resolvedStackDescription
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedStackDescription, 0);
  objc_storeStrong((id *)&self->_highestZStackParticipant, 0);
  objc_storeStrong((id *)&self->_participantObservers, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
}

@end