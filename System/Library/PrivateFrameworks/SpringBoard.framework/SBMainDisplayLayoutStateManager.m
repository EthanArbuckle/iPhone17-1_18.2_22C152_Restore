@interface SBMainDisplayLayoutStateManager
+ (Class)_layoutStateClass;
+ (id)_initialLayoutStateWithDisplayOrdinal:(int64_t)a3 isDisplayExternal:(BOOL)a4;
- (BOOL)_doesSceneIDSpecifyPrimaryScene:(id)a3 forApplicationIdentifier:(id)a4 sceneSessionRole:(id)a5;
- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3;
- (SBApplicationController)_applicationController;
- (SBMainWorkspace)_mainWorkspace;
- (SBPlatformController)_platformController;
- (SBRecentAppLayouts)_recentAppLayouts;
- (id)_applicationSceneEntityFromApplicationBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4 displayIdentity:(id)a5;
- (id)_layoutStateForApplicationTransitionContext:(id)a3;
- (id)_layoutStateForDisplayIdentity:(id)a3;
- (id)_mostRecentAppLayoutForBundleIdentifier:(id)a3 ignoringUniqueIdentifiers:(id)a4 chamoisWindowingUIEnabled:(BOOL)a5 multitaskingSupported:(BOOL)a6;
- (id)_mostRecentAppLayoutMatchingAnyUniqueIdentifier:(id)a3 chamoisWindowingUIEnabled:(BOOL)a4 multitaskingSupported:(BOOL)a5;
- (id)_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:(id)a3 bundleIdentifier:(id)a4 sceneSessionRole:(id)a5;
- (id)_sceneManagerForDisplayIdentity:(id)a3;
- (id)_switcherControllerForDisplayIdentity:(id)a3;
- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9;
- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9 preferredDisplay:(id)a10;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)primarySceneIdentifierForBundleIdentifier:(id)a3 sceneSessionRole:(id)a4 displayIdentity:(id)a5;
@end

@implementation SBMainDisplayLayoutStateManager

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainDisplayLayoutStateManager;
  v3 = [(SBLayoutStateManager *)&v5 layoutStateForApplicationTransitionContext:a3];
  return v3;
}

- (SBRecentAppLayouts)_recentAppLayouts
{
  v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  v3 = [v2 _recentAppLayoutsController];

  return (SBRecentAppLayouts *)v3;
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHomeScreenEntity] & 1) != 0 || (objc_msgSend(v2, "isEmptyWorkspaceEntity"))
  {
    v3 = 0;
  }
  else
  {
    v3 = +[SBLayoutElement elementWithDescriptor:v2];
  }

  return v3;
}

- (id)_layoutStateForApplicationTransitionContext:(id)a3
{
  uint64_t v658 = *MEMORY[0x1E4F143B8];
  id v506 = a3;
  v492 = [v506 request];
  uint64_t v501 = [v492 source];
  v499 = [v506 previousLayoutState];
  v484 = [v492 displayIdentity];
  v493 = [(SBMainDisplayLayoutStateManager *)self _switcherControllerForDisplayIdentity:v484];
  int v3 = [v506 isBackground];
  if ((v3 & 1) != 0 || v501 == 14)
  {
    if (v3)
    {
      v16 = [v506 applicationSceneEntityForLayoutRole:4];
      id v524 = v499;
      if (v16)
      {
        v17 = [v16 activationSettings];
        if ([v17 _settingsAreValidToMoveContentToNewScene])
        {
          v517 = [SBMainDisplayLayoutState alloc];
          v521 = [v524 elements];
          uint64_t v514 = [v524 spaceConfiguration];
          v18 = [v524 elementIdentifiersToLayoutAttributes];
          id objc = (id)[v524 floatingConfiguration];
          uint64_t v19 = [v524 unlockedEnvironmentMode];
          uint64_t v20 = [v524 isFloatingSwitcherVisible];
          uint64_t v21 = [v524 peekConfiguration];
          v22 = [v524 bundleIDShowingAppExpose];
          uint64_t v23 = [v524 windowPickerRole];
          uint64_t v24 = [v524 displayOrdinal];
          LOBYTE(v453) = [v524 isDisplayExternal];
          LOBYTE(v452) = 1;
          uint64_t v25 = [(SBMainDisplayLayoutState *)v517 _initWithLayoutElements:v521 spaceConfiguration:v514 elementIdentifiersToLayoutAttributes:v18 floatingConfiguration:objc unlockedEnvironmentMode:v19 floatingSwitcherVisible:v20 centerConfiguration:1 centerEntityModal:v452 peekConfiguration:v21 bundleIDShowingAppExpose:v22 windowPickerRole:v23 displayOrdinal:v24 isDisplayExternal:v453];

          id v524 = (id)v25;
        }
      }
    }
    else if (v501 == 14)
    {
      id v524 = [[SBMainDisplayLayoutState alloc] _initWithLayoutState:v499];
      long long v534 = 0u;
      long long v535 = 0u;
      long long v536 = 0u;
      long long v537 = 0u;
      v26 = [v506 previousEntities];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v534 objects:v645 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v535;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v535 != v28) {
              objc_enumerationMutation(v26);
            }
            objc_msgSend(v506, "setEntity:forLayoutRole:", *(void *)(*((void *)&v534 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v534 + 1) + 8 * i), "layoutRole"));
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v534 objects:v645 count:16];
        }
        while (v27);
      }
    }
    else
    {
      id v524 = 0;
    }
    goto LABEL_670;
  }
  v456 = [v492 displayIdentity];
  v4 = [(SBMainDisplayLayoutStateManager *)self _mainWorkspace];
  int v5 = [v4 isMedusaCapable];

  uint64_t v502 = [v493 windowManagementStyle];
  id v6 = [v506 activatingEntity];
  v7 = objc_msgSend(v506, "entityForLayoutRole:");
  v8 = objc_msgSend(v506, "entityForLayoutRole:");
  v9 = objc_msgSend(v506, "entityForLayoutRole:");
  v10 = objc_msgSend(v506, "entityForLayoutRole:");
  if (!v6 && v7 && !v8 && !v9)
  {
    id v6 = v7;

    v7 = 0;
  }
  id v477 = v6;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  uint64_t v513 = [v506 requestedSpaceConfiguration];
  uint64_t v494 = [v506 requestedCenterConfiguration];
  uint64_t v475 = [v506 requestedFloatingConfiguration];
  uint64_t v478 = [v506 requestedPeekConfiguration];
  uint64_t v520 = [v506 requestedUnlockedEnvironmentMode];
  [v506 requestedFloatingSwitcherVisible];
  [v506 requestedCenterEntityModal];
  v500 = [v506 requestedAppExposeBundleID];
  uint64_t v480 = [v506 requestedWindowPickerRole];
  v463 = [v506 previousEntityForLayoutRole:1];
  v458 = [v506 previousEntityForLayoutRole:2];
  v459 = [v506 previousEntityForLayoutRole:3];
  v457 = [v506 previousEntityForLayoutRole:4];
  uint64_t v15 = [v499 interfaceOrientation];
  uint64_t v485 = [v499 spaceConfiguration];
  uint64_t v498 = [v499 floatingConfiguration];
  uint64_t v482 = [v499 centerConfiguration];
  uint64_t v471 = [v499 peekConfiguration];
  uint64_t v461 = [v499 unlockedEnvironmentMode];
  v638[0] = MEMORY[0x1E4F143A8];
  v638[1] = 3221225472;
  v638[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2;
  v638[3] = &unk_1E6B04858;
  id v504 = v506;
  id v639 = v504;
  id v473 = v11;
  id v640 = v473;
  id v470 = v12;
  id v641 = v470;
  id v474 = v13;
  id v642 = v474;
  id v469 = v14;
  id v643 = v469;
  v468 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v638);
  if (v5)
  {
    uint64_t v488 = [v493 windowManagementStyle];
    if (v473 || v470 || v474 || v469)
    {
      v35 = [MEMORY[0x1E4F1CA80] set];
      if (v473)
      {
        v36 = [v473 uniqueIdentifier];

        id v466 = v473;
        if (v36)
        {
          v37 = [v473 uniqueIdentifier];
          [v35 addObject:v37];

          id v466 = v473;
        }
      }
      else
      {
        id v466 = +[SBWorkspaceEntity entity];
      }
      if (v470)
      {
        v40 = [v470 uniqueIdentifier];

        id v464 = v470;
        if (v40)
        {
          v41 = [v470 uniqueIdentifier];
          [v35 addObject:v41];

          id v464 = v470;
        }
      }
      else
      {
        id v464 = +[SBWorkspaceEntity entity];
      }
      if (v474)
      {
        v42 = [v474 uniqueIdentifier];

        uint64_t v43 = (uint64_t)v474;
        if (v42)
        {
          v44 = [v474 uniqueIdentifier];
          [v35 addObject:v44];

          uint64_t v43 = (uint64_t)v474;
        }
      }
      else
      {
        uint64_t v43 = +[SBWorkspaceEntity entity];
      }
      id v490 = (id)v43;
      if (v469)
      {
        v45 = [v469 uniqueIdentifier];

        id v497 = v469;
        if (v45)
        {
          v46 = [v469 uniqueIdentifier];
          [v35 addObject:v46];

          id v497 = v469;
        }
      }
      else
      {
        id v497 = +[SBWorkspaceEntity entity];
      }
      if ((unint64_t)[v35 count] >= 2 && !v513)
      {
        v47 = [(SBMainDisplayLayoutStateManager *)self _mostRecentAppLayoutMatchingAnyUniqueIdentifier:v35 chamoisWindowingUIEnabled:v502 == 2 multitaskingSupported:v502 != 0];
        v48 = v47;
        if (v47)
        {
          uint64_t v49 = [v47 configuration];
          if ((unint64_t)(v49 - 2) >= 3) {
            uint64_t v50 = 0;
          }
          else {
            uint64_t v50 = v49;
          }
          uint64_t v513 = v50;
        }
        else
        {
          uint64_t v513 = 0;
        }
      }
    }
    else if (v477)
    {
      if ([v477 isHomeScreenEntity])
      {
        id v466 = v477;
        id v464 = +[SBWorkspaceEntity entity];
        id v490 = +[SBWorkspaceEntity entity];
        id v497 = +[SBWorkspaceEntity entity];
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v477, v459) {
             && ([v477 isEmptyWorkspaceEntity] & 1) == 0)
      }
      {
        id v466 = +[SBWorkspaceEntity entity];
        id v464 = +[SBWorkspaceEntity entity];
        id v490 = v477;
        id v497 = +[SBWorkspaceEntity entity];
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v477, v463) {
             && ([v477 isEmptyWorkspaceEntity] & 1) == 0)
      }
      {
        id v466 = v477;
        id v464 = +[SBWorkspaceEntity entity];
        id v490 = +[SBWorkspaceEntity entity];
        id v497 = +[SBWorkspaceEntity entity];
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v477, v458) {
             && ([v477 isEmptyWorkspaceEntity] & 1) == 0)
      }
      {
        id v466 = +[SBWorkspaceEntity entity];
        id v464 = v477;
        id v490 = +[SBWorkspaceEntity entity];
        id v497 = +[SBWorkspaceEntity entity];
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v477, v457) {
             && ([v477 isEmptyWorkspaceEntity] & 1) == 0)
      }
      {
        id v466 = +[SBWorkspaceEntity entity];
        id v464 = +[SBWorkspaceEntity entity];
        id v490 = +[SBWorkspaceEntity entity];
        id v497 = v477;
      }
      else
      {
        v51 = [MEMORY[0x1E4F1CA80] set];
        v52 = [v477 uniqueIdentifier];

        if (v52)
        {
          v53 = [v477 uniqueIdentifier];
          [v51 addObject:v53];
        }
        v54 = [(SBMainDisplayLayoutStateManager *)self _mostRecentAppLayoutMatchingAnyUniqueIdentifier:v51 chamoisWindowingUIEnabled:v502 == 2 multitaskingSupported:v502 != 0];
        v55 = v54;
        if (v54)
        {
          if ([v54 environment] == 2 && (objc_msgSend(v463, "isHomeScreenEntity") & 1) == 0)
          {
            uint64_t v131 = [v55 itemForLayoutRole:1];
            v132 = (void *)v131;
            if (v502 == 2)
            {
              if (!v131)
              {
                v448 = [MEMORY[0x1E4F28B00] currentHandler];
                [v448 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:698 description:@"App layout should always have primary display item!"];
              }
              v133 = [v477 uniqueIdentifier];
              v134 = [v132 uniqueIdentifier];
              int v135 = [v133 isEqualToString:v134];

              if (v135)
              {
                id v466 = v477;
              }
              else
              {
                v159 = [v132 bundleIdentifier];
                v160 = [v132 uniqueIdentifier];
                id v466 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v159 uniqueIdentifier:v160 displayIdentity:v456];
              }
              id v464 = +[SBWorkspaceEntity entity];
              id v490 = +[SBWorkspaceEntity entity];
              id v497 = +[SBWorkspaceEntity entity];
            }
            else
            {
              if (!v131)
              {
                v449 = [MEMORY[0x1E4F28B00] currentHandler];
                [v449 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:712 description:@"App layout should always have primary display item!"];
              }
              v155 = [v477 uniqueIdentifier];
              v156 = [v132 uniqueIdentifier];
              int v157 = [v155 isEqualToString:v156];

              if (v157)
              {
                id v490 = v477;
              }
              else
              {
                v161 = [v132 bundleIdentifier];
                v162 = [v132 uniqueIdentifier];
                id v490 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v161 uniqueIdentifier:v162 displayIdentity:v456];

                if (!v490)
                {
                  v450 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v450 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:718 description:@"Failed to create primary workspace entity from app layout's primary display item!"];

                  id v490 = 0;
                }
              }
              id v466 = +[SBWorkspaceEntity entity];
              id v464 = +[SBWorkspaceEntity entity];
              id v497 = +[SBWorkspaceEntity entity];
            }
          }
          else
          {
            v56 = [v55 itemForLayoutRole:1];
            if (!v56)
            {
              v444 = [MEMORY[0x1E4F28B00] currentHandler];
              [v444 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:726 description:@"App layout should always have primary display item!"];
            }
            v57 = [v477 uniqueIdentifier];
            v58 = [v56 uniqueIdentifier];
            int v59 = [v57 isEqualToString:v58];

            if (v59)
            {
              id v466 = v477;
            }
            else
            {
              v114 = [v56 bundleIdentifier];
              v115 = [v56 uniqueIdentifier];
              id v466 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v114 uniqueIdentifier:v115 displayIdentity:v456];

              if (!v466)
              {
                v445 = [MEMORY[0x1E4F28B00] currentHandler];
                [v445 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:732 description:@"Failed to create primary workspace entity from app layout's primary display item!"];

                id v466 = 0;
              }
            }
            v116 = [v55 itemForLayoutRole:2];
            if (v116)
            {
              v117 = [v477 uniqueIdentifier];
              v118 = [v116 uniqueIdentifier];
              int v119 = [v117 isEqualToString:v118];

              if (v119)
              {
                id v464 = v477;
              }
              else
              {
                v136 = [v116 bundleIdentifier];
                v137 = [v116 uniqueIdentifier];
                id v464 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v136 uniqueIdentifier:v137 displayIdentity:v456];

                if (!v464)
                {
                  v446 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v446 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:741 description:@"Failed to create side workspace entity from app layout's side display item!"];

                  id v464 = 0;
                }
              }
              uint64_t v138 = [v55 configuration];
              switch(v138)
              {
                case 0:
                case 1:
                  v148 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v148 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:746 description:@"Unexpected app layout configuration!"];

                  break;
                case 2:
                case 3:
                case 4:
                  uint64_t v513 = v138;
                  break;
                default:
                  break;
              }
            }
            else
            {
              id v464 = +[SBWorkspaceEntity entity];
            }
            if (v502 == 2)
            {
              v629[0] = MEMORY[0x1E4F143A8];
              v629[1] = 3221225472;
              v629[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3;
              v629[3] = &unk_1E6B04880;
              id v630 = v55;
              id v631 = v477;
              v632 = self;
              id v633 = v456;
              SEL v637 = a2;
              id v634 = v493;
              id v635 = v499;
              id v636 = v504;
              SBLayoutRoleEnumerateAppLayoutRoles(v629);
            }
            v149 = [v55 itemForLayoutRole:4];
            if (v149)
            {
              v150 = [v477 uniqueIdentifier];
              v151 = [v149 uniqueIdentifier];
              int v152 = [v150 isEqualToString:v151];

              if (v152)
              {
                id v497 = v477;
              }
              else
              {
                v153 = [v149 bundleIdentifier];
                v154 = [v149 uniqueIdentifier];
                id v497 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v153 uniqueIdentifier:v154 displayIdentity:v456];

                if (!v497)
                {
                  v447 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v447 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:798 description:@"Failed to create center workspace entity from app layout's center display item!"];

                  id v497 = 0;
                }
              }
              if (!v494) {
                uint64_t v494 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([v55 centerConfiguration]);
              }
            }
            else
            {
              id v497 = +[SBWorkspaceEntity entity];
            }
            id v490 = +[SBWorkspaceEntity entity];
          }
        }
        else
        {
          id v466 = v477;
          id v464 = +[SBWorkspaceEntity entity];
          id v490 = +[SBWorkspaceEntity entity];
          id v497 = +[SBWorkspaceEntity entity];
        }
      }
    }
    else
    {
      id v466 = +[SBWorkspaceEntity entity];
      id v464 = +[SBWorkspaceEntity entity];
      id v490 = +[SBWorkspaceEntity entity];
      id v497 = +[SBWorkspaceEntity entity];
    }
    if (v502 == 2)
    {
      if ([v497 isPreviousWorkspaceEntity])
      {
        uint64_t v60 = +[SBWorkspaceEntity entity];

        id v497 = (id)v60;
      }
      else if (([v497 isEmptyWorkspaceEntity] & 1) == 0)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        long long v649 = 0x2020000000uLL;
        v626[0] = MEMORY[0x1E4F143A8];
        v626[1] = 3221225472;
        v626[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4;
        v626[3] = &unk_1E6B048A8;
        v628 = buf;
        id v67 = v504;
        id v627 = v67;
        SBLayoutRoleEnumerateValidRoles(v626);
        if (*(void *)(*(void *)&buf[8] + 24))
        {
          objc_msgSend(v67, "setEntity:forLayoutRole:", v497);
          if (*(void *)(*(void *)&buf[8] + 24) == 2)
          {
            id v68 = v497;

            id v464 = v68;
          }
          uint64_t v69 = +[SBWorkspaceEntity entity];

          id v497 = (id)v69;
        }

        _Block_object_dispose(buf, 8);
      }
      if (![v493 isAdditiveModelEnabled]) {
        goto LABEL_108;
      }
      if (![v477 isApplicationSceneEntity]) {
        goto LABEL_108;
      }
      v70 = (void *)MEMORY[0x1E4F1CA80];
      v71 = [v504 previousEntities];
      v72 = objc_msgSend(v70, "setWithCapacity:", objc_msgSend(v71, "count"));

      uint64_t v73 = [v504 previousEntities];
      v624[0] = MEMORY[0x1E4F143A8];
      v624[1] = 3221225472;
      v624[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5;
      v624[3] = &unk_1E6B048D0;
      id v74 = v72;
      id v625 = v74;
      [(id)v73 enumerateObjectsUsingBlock:v624];

      v75 = [v477 uniqueIdentifier];
      LOBYTE(v73) = [v74 containsObject:v75];

      if ((v73 & 1) == 0)
      {
        if (([v477 isEmptyWorkspaceEntity] & 1) != 0
          || ([v477 isPreviousWorkspaceEntity] & 1) != 0)
        {
          id v476 = v477;
          if (v466)
          {
            [v504 _setRequestedFrontmostEntity:v466];
            id v476 = v477;
          }
        }
        else
        {
          [v504 setEntity:v477 forLayoutRole:1];

          id v476 = 0;
        }
        long long v623 = 0u;
        long long v622 = 0u;
        long long v621 = 0u;
        long long v620 = 0u;
        v96 = [v504 previousEntities];
        uint64_t v97 = [v96 countByEnumeratingWithState:&v620 objects:v657 count:16];
        if (v97)
        {
          uint64_t v98 = *(void *)v621;
          do
          {
            for (uint64_t j = 0; j != v97; ++j)
            {
              if (*(void *)v621 != v98) {
                objc_enumerationMutation(v96);
              }
              v100 = *(void **)(*((void *)&v620 + 1) + 8 * j);
              if (([v100 isHomeScreenEntity] & 1) == 0
                && ([v100 isPreviousWorkspaceEntity] & 1) == 0
                && ([v100 isEmptyWorkspaceEntity] & 1) == 0)
              {
                v101 = [v504 entities];
                char v102 = [v101 containsObject:v100];

                if ((v102 & 1) == 0)
                {
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  long long v649 = 0x2020000000uLL;
                  v617[0] = MEMORY[0x1E4F143A8];
                  v617[1] = 3221225472;
                  v617[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6;
                  v617[3] = &unk_1E6B048A8;
                  v619 = buf;
                  id v103 = v504;
                  id v618 = v103;
                  SBLayoutRoleEnumerateValidRoles(v617);
                  if (*(void *)(*(void *)&buf[8] + 24)) {
                    objc_msgSend(v103, "setEntity:forLayoutRole:", v100);
                  }

                  _Block_object_dispose(buf, 8);
                }
              }
            }
            uint64_t v97 = [v96 countByEnumeratingWithState:&v620 objects:v657 count:16];
          }
          while (v97);
        }

        v104 = [v504 entityForLayoutRole:1];
        v105 = v104;
        if (v104)
        {
          id v76 = v104;
          v106 = v466;
        }
        else
        {
          id v76 = +[SBWorkspaceEntity entity];

          v106 = v76;
        }

        v107 = [v504 entityForLayoutRole:2];
        v108 = v107;
        if (v107)
        {
          id v496 = v107;
          v109 = v464;
        }
        else
        {
          id v496 = +[SBWorkspaceEntity entity];

          v109 = v496;
        }

        uint64_t v110 = +[SBWorkspaceEntity entity];

        uint64_t v111 = +[SBWorkspaceEntity entity];

        int v112 = [v76 isEmptyWorkspaceEntity];
        uint64_t v113 = 3;
        if (v112) {
          uint64_t v113 = 1;
        }
        uint64_t v520 = v113;
        id v497 = (id)v110;
        id v490 = (id)v111;
      }
      else
      {
LABEL_108:
        id v76 = v466;
        id v496 = v464;
        id v476 = v477;
      }
      if (SBPeekConfigurationIsValid(v478) && !SBPeekConfigurationIsValid(v471))
      {
        v88 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
        v89 = [v88 recentsIncludingHiddenAppLayouts:0];
        BOOL v90 = (unint64_t)[v89 count] < 2;

        uint64_t v91 = 1;
        if (!v90) {
          uint64_t v91 = 2;
        }
        uint64_t v520 = v91;
        id v64 = v496;
        v63 = v76;
        uint64_t v65 = v478;
        uint64_t v62 = (uint64_t)v490;
        goto LABEL_327;
      }
      if (!v478 && SBPeekConfigurationIsValid(v471))
      {
        v77 = [v504 entities];
        v78 = [v504 previousEntities];
        int v79 = BSEqualSets();

        if (v79)
        {
          long long v616 = 0u;
          long long v615 = 0u;
          long long v614 = 0u;
          long long v613 = 0u;
          v80 = [v504 previousEntities];
          uint64_t v81 = [v80 countByEnumeratingWithState:&v613 objects:v656 count:16];
          if (v81)
          {
            uint64_t v82 = *(void *)v614;
            do
            {
              for (uint64_t k = 0; k != v81; ++k)
              {
                if (*(void *)v614 != v82) {
                  objc_enumerationMutation(v80);
                }
                objc_msgSend(v504, "setEntity:forLayoutRole:", *(void *)(*((void *)&v613 + 1) + 8 * k), objc_msgSend(*(id *)(*((void *)&v613 + 1) + 8 * k), "layoutRole"));
              }
              uint64_t v81 = [v80 countByEnumeratingWithState:&v613 objects:v656 count:16];
            }
            while (v81);
          }
        }
        else if ((!v76 {
                || ([v76 isEmptyWorkspaceEntity] & 1) != 0
        }
                || [v76 isPreviousWorkspaceEntity])
               && (!v476
                || ([v476 isEmptyWorkspaceEntity] & 1) != 0
                || [v476 isPreviousWorkspaceEntity]))
        {
          long long v612 = 0u;
          long long v611 = 0u;
          long long v610 = 0u;
          long long v609 = 0u;
          v80 = [v504 previousEntities];
          uint64_t v92 = [v80 countByEnumeratingWithState:&v609 objects:v655 count:16];
          if (v92)
          {
            uint64_t v93 = *(void *)v610;
            do
            {
              for (uint64_t m = 0; m != v92; ++m)
              {
                if (*(void *)v610 != v93) {
                  objc_enumerationMutation(v80);
                }
                objc_msgSend(v504, "setEntity:forLayoutRole:", *(void *)(*((void *)&v609 + 1) + 8 * m), objc_msgSend(*(id *)(*((void *)&v609 + 1) + 8 * m), "layoutRole"));
              }
              uint64_t v92 = [v80 countByEnumeratingWithState:&v609 objects:v655 count:16];
            }
            while (v92);
          }
        }
        else if ([v476 isHomeScreenEntity])
        {
          if (v461 == 2)
          {
            long long v608 = 0u;
            long long v607 = 0u;
            long long v606 = 0u;
            long long v605 = 0u;
            v127 = [v504 previousEntities];
            uint64_t v128 = [v127 countByEnumeratingWithState:&v605 objects:v654 count:16];
            if (v128)
            {
              uint64_t v129 = *(void *)v606;
              do
              {
                for (uint64_t n = 0; n != v128; ++n)
                {
                  if (*(void *)v606 != v129) {
                    objc_enumerationMutation(v127);
                  }
                  objc_msgSend(v504, "setEntity:forLayoutRole:", *(void *)(*((void *)&v605 + 1) + 8 * n), objc_msgSend(*(id *)(*((void *)&v605 + 1) + 8 * n), "layoutRole"));
                }
                uint64_t v128 = [v127 countByEnumeratingWithState:&v605 objects:v654 count:16];
              }
              while (v128);
            }

            [v504 setActivatingEntity:0];
            uint64_t v520 = 1;
            v80 = v476;
          }
          else
          {
            uint64_t v520 = 1;
            v80 = v476;
            uint64_t v471 = 1;
          }
          id v476 = 0;
        }
        else
        {
          if (!v476
            || ([v476 isEmptyWorkspaceEntity] & 1) != 0
            || ([v476 isPreviousWorkspaceEntity] & 1) != 0)
          {
            if (v76) {
              [v504 _setRequestedFrontmostEntity:v76];
            }
          }
          else
          {
            [v504 setEntity:v476 forLayoutRole:1];

            id v476 = 0;
          }
          long long v604 = 0u;
          long long v603 = 0u;
          long long v602 = 0u;
          long long v601 = 0u;
          v80 = [v504 previousEntities];
          uint64_t v163 = [v80 countByEnumeratingWithState:&v601 objects:v653 count:16];
          if (v163)
          {
            uint64_t v164 = *(void *)v602;
            uint64_t v471 = 1;
            uint64_t v520 = 3;
            do
            {
              for (iuint64_t i = 0; ii != v163; ++ii)
              {
                if (*(void *)v602 != v164) {
                  objc_enumerationMutation(v80);
                }
                v166 = *(void **)(*((void *)&v601 + 1) + 8 * ii);
                if (([v166 isHomeScreenEntity] & 1) == 0
                  && ([v166 isPreviousWorkspaceEntity] & 1) == 0
                  && ([v166 isEmptyWorkspaceEntity] & 1) == 0)
                {
                  v167 = [v504 entities];
                  char v168 = [v167 containsObject:v166];

                  if ((v168 & 1) == 0)
                  {
                    *(void *)buf = 0;
                    *(void *)&buf[8] = buf;
                    long long v649 = 0x2020000000uLL;
                    v598[0] = MEMORY[0x1E4F143A8];
                    v598[1] = 3221225472;
                    v598[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7;
                    v598[3] = &unk_1E6B048A8;
                    v600 = buf;
                    id v169 = v504;
                    id v599 = v169;
                    SBLayoutRoleEnumerateValidRoles(v598);
                    if (*(void *)(*(void *)&buf[8] + 24)) {
                      objc_msgSend(v169, "setEntity:forLayoutRole:", v166);
                    }

                    _Block_object_dispose(buf, 8);
                  }
                }
              }
              uint64_t v163 = [v80 countByEnumeratingWithState:&v601 objects:v653 count:16];
            }
            while (v163);
          }
          else
          {
            uint64_t v471 = 1;
            uint64_t v520 = 3;
          }
        }

        v170 = [v504 entityForLayoutRole:1];
        v171 = v170;
        if (v170)
        {
          id v172 = v170;
        }
        else
        {
          id v172 = +[SBWorkspaceEntity entity];

          id v76 = v172;
        }

        v173 = [v504 entityForLayoutRole:2];
        v174 = v173;
        if (v173)
        {
          id v175 = v173;
          v176 = v496;
        }
        else
        {
          id v175 = +[SBWorkspaceEntity entity];

          v176 = v175;
        }

        uint64_t v177 = +[SBWorkspaceEntity entity];

        uint64_t v62 = +[SBWorkspaceEntity entity];

        int v178 = [v172 isEmptyWorkspaceEntity];
        id v476 = 0;
        uint64_t v179 = v520;
        if (v178) {
          uint64_t v179 = 1;
        }
        uint64_t v520 = v179;
        id v497 = (id)v177;
        uint64_t v65 = v471;
        v63 = v172;
        id v64 = v175;
        goto LABEL_327;
      }
      uint64_t v65 = 1;
      uint64_t v62 = (uint64_t)v490;
      v63 = v76;
      id v64 = v496;
LABEL_328:
      uint64_t v479 = v65;
      if (v63)
      {
LABEL_329:
        id v495 = v64;
        if (!v64)
        {
          v420 = v63;
          v421 = [MEMORY[0x1E4F28B00] currentHandler];
          [v421 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1106 description:@"Side workspace entity may not be nil at this point!"];

          v63 = v420;
        }
        v180 = (void *)v62;
        if (!v62)
        {
          v422 = v63;
          v423 = [MEMORY[0x1E4F28B00] currentHandler];
          [v423 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1107 description:@"Floating workspace entity may not be nil at this point!"];

          v63 = v422;
        }
        if (!v497)
        {
          v424 = v63;
          v425 = [MEMORY[0x1E4F28B00] currentHandler];
          [v425 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1108 description:@"Center workspace entity may not be nil at this point!"];

          v63 = v424;
        }
        v181 = v63;
        if ([v63 isPreviousWorkspaceEntity])
        {
          uint64_t v182 = ((void (**)(void, void *, void *))v468)[2](v468, v181, v463);

          v181 = (void *)v182;
        }
        if ([v495 isPreviousWorkspaceEntity])
        {
          uint64_t v183 = ((void (**)(void, id, void *))v468)[2](v468, v495, v458);

          id v495 = (id)v183;
        }
        if ([v180 isPreviousWorkspaceEntity])
        {
          uint64_t v184 = ((void (**)(void, void *, void *))v468)[2](v468, v180, v459);

          v180 = (void *)v184;
        }
        if ([v497 isPreviousWorkspaceEntity])
        {
          uint64_t v185 = ((void (**)(void, id, void *))v468)[2](v468, v497, v457);

          id v497 = (id)v185;
        }
        v186 = v180;
        v187 = v181;
        if (v181)
        {
          if (v495) {
            goto LABEL_345;
          }
        }
        else
        {
          v426 = [MEMORY[0x1E4F28B00] currentHandler];
          [v426 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1126 description:@"Primary workspace entity may not be nil at this point!"];

          v186 = v180;
          v187 = 0;
          if (v495)
          {
LABEL_345:
            if (v186) {
              goto LABEL_346;
            }
LABEL_735:
            v428 = [MEMORY[0x1E4F28B00] currentHandler];
            [v428 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1128 description:@"Floating workspace entity may not be nil at this point!"];

            v187 = v181;
LABEL_346:
            if (!v497)
            {
              v429 = [MEMORY[0x1E4F28B00] currentHandler];
              [v429 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1129 description:@"Center workspace entity may not be nil at this point!"];

              v187 = v181;
            }
            if ([v187 isPreviousWorkspaceEntity])
            {
              v430 = [MEMORY[0x1E4F28B00] currentHandler];
              [v430 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1131 description:@"Primary workspace entity may not be previous entity at this point!"];
            }
            if ([v495 isPreviousWorkspaceEntity])
            {
              v431 = [MEMORY[0x1E4F28B00] currentHandler];
              [v431 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1132 description:@"Side workspace entity may not be previous entity at this point!"];
            }
            if ([v180 isPreviousWorkspaceEntity])
            {
              v432 = [MEMORY[0x1E4F28B00] currentHandler];
              [v432 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1133 description:@"Floating workspace entity may not be previous entity at this point!"];
            }
            if ([v497 isPreviousWorkspaceEntity])
            {
              v433 = [MEMORY[0x1E4F28B00] currentHandler];
              [v433 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1134 description:@"Center workspace entity may not be previous entity at this point!"];
            }
            if ([v497 isApplicationSceneEntity]
              && [v181 isEmptyWorkspaceEntity]
              && [v495 isEmptyWorkspaceEntity])
            {
              v188 = [v497 applicationSceneEntity];
              v189 = [v188 application];
              v190 = [v189 bundleIdentifier];

              v191 = (void *)MEMORY[0x1E4F1CAD0];
              v192 = [v497 uniqueIdentifier];
              v193 = [v191 setWithObject:v192];
              v194 = [(SBMainDisplayLayoutStateManager *)self _mostRecentAppLayoutForBundleIdentifier:v190 ignoringUniqueIdentifiers:v193 chamoisWindowingUIEnabled:v502 == 2 multitaskingSupported:v502 != 0];

              if (v194)
              {
                v195 = [v194 itemForLayoutRole:1];
                v196 = [v195 bundleIdentifier];
                v197 = [v195 uniqueIdentifier];
                uint64_t v198 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v196 uniqueIdentifier:v197 displayIdentity:v456];

                v181 = (void *)v198;
              }
              else
              {
                v199 = [(SBMainDisplayLayoutStateManager *)self _sceneManagerForDisplayIdentity:v456];
                v195 = (void *)[v199 newSceneIdentifierForBundleIdentifier:v190];

                [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v190 uniqueIdentifier:v195 displayIdentity:v456];
                v181 = v196 = v181;
              }

              v200 = [v194 itemForLayoutRole:2];
              v201 = [v200 bundleIdentifier];
              v202 = [v200 uniqueIdentifier];
              uint64_t v203 = [(SBMainDisplayLayoutStateManager *)self _applicationSceneEntityFromApplicationBundleIdentifier:v201 uniqueIdentifier:v202 displayIdentity:v456];

              SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v194 configuration]);
              id v495 = (id)v203;
            }
            v204 = v181;
            if (([v181 isEmptyWorkspaceEntity] & 1) != 0
              || [v181 isHomeScreenEntity])
            {
              if (!SBPeekConfigurationIsValid(v479))
              {
                uint64_t v205 = +[SBWorkspaceEntity entity];

                uint64_t v206 = +[SBWorkspaceEntity entity];

                id v495 = (id)v205;
                id v497 = (id)v206;
              }
              if (v520 != 2 && !SBPeekConfigurationIsValid(v479))
              {
                if ([v499 unlockedEnvironmentMode] == 2
                  && ([v180 isEmptyWorkspaceEntity] & 1) == 0
                  && ([v180 isHomeScreenEntity] & 1) == 0)
                {
                  id v207 = v180;

                  v204 = v207;
                }
                uint64_t v208 = +[SBWorkspaceEntity entity];

                v180 = (void *)v208;
              }
            }
            if (([v497 isEmptyWorkspaceEntity] & 1) == 0
              && ((SBWorkspaceEntitiesAreAnalagous(v497, v204) & 1) != 0
               || (SBWorkspaceEntitiesAreAnalagous(v497, v495) & 1) != 0
               || SBWorkspaceEntitiesAreAnalagous(v497, v180)))
            {
              uint64_t v209 = +[SBWorkspaceEntity entity];

              id v497 = (id)v209;
            }
            if (([v495 isEmptyWorkspaceEntity] & 1) == 0
              && SBWorkspaceEntitiesAreAnalagous(v495, v204))
            {
              uint64_t v210 = +[SBWorkspaceEntity entity];

              id v495 = (id)v210;
            }
            if (([v180 isEmptyWorkspaceEntity] & 1) == 0
              && ((SBWorkspaceEntitiesAreAnalagous(v180, v204) & 1) != 0
               || SBWorkspaceEntitiesAreAnalagous(v180, v495)))
            {
              uint64_t v211 = +[SBWorkspaceEntity entity];

              v180 = (void *)v211;
            }
            if (([v495 isEmptyWorkspaceEntity] & 1) == 0
              && (![v204 supportsSplitView]
               || ([v495 supportsSplitView] & 1) == 0))
            {
              if ([v495 isEqual:v477])
              {
                id v212 = v495;

                v204 = v212;
              }
              uint64_t v213 = +[SBWorkspaceEntity entity];

              id v495 = (id)v213;
            }
            if (([v180 isEmptyWorkspaceEntity] & 1) == 0
              && ([v180 supportsPresentationAtAnySize] & 1) == 0)
            {
              uint64_t v214 = +[SBWorkspaceEntity entity];

              v180 = (void *)v214;
            }
            if (([v497 isEmptyWorkspaceEntity] & 1) == 0
              && ([v497 supportsPresentationAtAnySize] & 1) == 0)
            {
              uint64_t v215 = +[SBWorkspaceEntity entity];

              id v497 = (id)v215;
            }
            if (!([v495 isEmptyWorkspaceEntity] & 1 | (v488 != 0)))
            {
              uint64_t v216 = +[SBWorkspaceEntity entity];

              id v495 = (id)v216;
            }
            if (!([v180 isEmptyWorkspaceEntity] & 1 | (v488 != 0)))
            {
              uint64_t v217 = +[SBWorkspaceEntity entity];

              v180 = (void *)v217;
            }
            v218 = v204;
            if (v204)
            {
              if (v495) {
                goto LABEL_404;
              }
            }
            else
            {
              v434 = [MEMORY[0x1E4F28B00] currentHandler];
              [v434 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1220 description:@"Primary workspace entity may not be nil at this point!"];

              v218 = 0;
              if (v495) {
                goto LABEL_404;
              }
            }
            v435 = [MEMORY[0x1E4F28B00] currentHandler];
            [v435 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1221 description:@"Side workspace entity may not be nil at this point!"];

            v218 = v204;
LABEL_404:
            id v491 = v180;
            if (!v180)
            {
              v436 = [MEMORY[0x1E4F28B00] currentHandler];
              [v436 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1222 description:@"Floating workspace entity may not be nil at this point!"];

              v218 = v204;
            }
            if (!v497)
            {
              v437 = [MEMORY[0x1E4F28B00] currentHandler];
              [v437 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1223 description:@"Center workspace entity may not be nil at this point!"];

              v218 = v204;
            }
            if ([v218 isPreviousWorkspaceEntity])
            {
              v438 = [MEMORY[0x1E4F28B00] currentHandler];
              [v438 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1225 description:@"Primary workspace entity may not be previous entity at this point!"];
            }
            if ([v495 isPreviousWorkspaceEntity])
            {
              v439 = [MEMORY[0x1E4F28B00] currentHandler];
              [v439 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1226 description:@"Side workspace entity may not be previous entity at this point!"];
            }
            if ([v180 isPreviousWorkspaceEntity])
            {
              v440 = [MEMORY[0x1E4F28B00] currentHandler];
              [v440 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1227 description:@"Floating workspace entity may not be previous entity at this point!"];
            }
            if ([v497 isPreviousWorkspaceEntity])
            {
              v441 = [MEMORY[0x1E4F28B00] currentHandler];
              [v441 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1228 description:@"Center workspace entity may not be previous entity at this point!"];
            }
            if ([v204 isEmptyWorkspaceEntity])
            {

              v204 = 0;
            }
            if ([v495 isEmptyWorkspaceEntity])
            {

              id v495 = 0;
            }
            if ([v180 isEmptyWorkspaceEntity])
            {

              id v491 = 0;
            }
            if ([v497 isEmptyWorkspaceEntity])
            {

              id v497 = 0;
            }
            v219 = v495;
            if (!v204)
            {
              v204 = +[SBWorkspaceEntity entity];
              v219 = v495;
            }
            id v489 = v204;
            if (v219)
            {
              if (SBSpaceConfigurationIsSplitView(v513)) {
                uint64_t v220 = v513;
              }
              else {
                uint64_t v220 = v485;
              }
              BOOL IsSplitView = SBSpaceConfigurationIsSplitView(v220);
              uint64_t v222 = 4;
              if (IsSplitView) {
                uint64_t v222 = v220;
              }
            }
            else
            {
              if (!v204 || ([v204 isHomeScreenEntity] & 1) != 0)
              {
                uint64_t v455 = 0;
LABEL_436:
                if (v491)
                {
                  if (SBFloatingConfigurationIsValid(v475)) {
                    uint64_t v223 = v475;
                  }
                  else {
                    uint64_t v223 = v498;
                  }
                  if (v491 == v476 || v491 == v474)
                  {
                    BOOL IsValid = SBFloatingConfigurationIsValid(v223);
                    if (v223 != 4 && IsValid)
                    {
                      if (v223 == 3) {
                        uint64_t v223 = 1;
                      }
                    }
                    else
                    {
                      uint64_t v223 = 2;
                    }
                  }
                  if (!SBFloatingConfigurationIsValid(v223)) {
                    uint64_t v223 = 4;
                  }
                  if (!SBPeekConfigurationIsValid(v479))
                  {
                    uint64_t v475 = v223;
                    goto LABEL_464;
                  }
                  char v229 = [v204 isHomeScreenEntity];
                  uint64_t v228 = v223;
                  uint64_t v475 = v223;
                  if ((v229 & 1) == 0) {
                    goto LABEL_460;
                  }
                }
                else
                {
                  if (SBFloatingConfigurationIsStashed(v498) && SBFloatingConfigurationIsValid(v498))
                  {
                    uint64_t v226 = v498;
LABEL_462:
                    uint64_t v475 = v226;
                    goto LABEL_464;
                  }
                  if ([v476 isHomeScreenEntity])
                  {
                    BOOL v227 = SBFloatingConfigurationIsValid(v498);
                    uint64_t v228 = v498;
                    if (v227)
                    {
LABEL_460:
                      BOOL IsLeft = SBFloatingConfigurationIsLeft(v228);
                      uint64_t v226 = 3;
                      if (!IsLeft) {
                        uint64_t v226 = 4;
                      }
                      goto LABEL_462;
                    }
                  }
                }
LABEL_464:
                if (([v491 isEmptyWorkspaceEntity] & 1) == 0 && SBFloatingConfigurationIsStashed(v475))
                {

                  id v491 = 0;
                }
                if (v497)
                {
                  if (SBCenterConfigurationIsValid(v494)) {
                    uint64_t v231 = v494;
                  }
                  else {
                    uint64_t v231 = v482;
                  }
                  uint64_t v460 = v231;
                  if (!SBCenterConfigurationIsValid(v231))
                  {
                    v232 = [v504 request];
                    uint64_t v233 = [v232 centerConfiguration];
                    uint64_t v234 = 1;
                    if (v233 == 2) {
                      uint64_t v234 = 2;
                    }
                    uint64_t v460 = v234;

                    [v497 isEmptyWorkspaceEntity];
                    goto LABEL_481;
                  }
                }
                else
                {
                  uint64_t v460 = 0;
                }
                char v235 = [v497 isEmptyWorkspaceEntity];
                if (v460) {
                  char v236 = 1;
                }
                else {
                  char v236 = v235;
                }
                if ((v236 & 1) == 0)
                {

                  id v497 = 0;
                  uint64_t v460 = 0;
                }
                goto LABEL_481;
              }
              if (SBPeekConfigurationIsValid(v479))
              {
                if (SBSpaceConfigurationIsValid(v513)) {
                  uint64_t v407 = v513;
                }
                else {
                  uint64_t v407 = v485;
                }
                if (SBSpaceConfigurationIsValid(v407)) {
                  uint64_t v222 = v407;
                }
                else {
                  uint64_t v222 = 1;
                }
              }
              else
              {
                uint64_t v222 = 1;
              }
            }
            uint64_t v455 = v222;
            goto LABEL_436;
          }
        }
        v427 = [MEMORY[0x1E4F28B00] currentHandler];
        [v427 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1127 description:@"Side workspace entity may not be nil at this point!"];

        v187 = v181;
        if (v180) {
          goto LABEL_346;
        }
        goto LABEL_735;
      }
      id v490 = (id)v62;
      v147 = [MEMORY[0x1E4F28B00] currentHandler];
      [v147 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1105 description:@"Primary workspace entity may not be nil at this point!"];
      id v145 = 0;
LABEL_273:

      uint64_t v62 = (uint64_t)v490;
      v63 = v145;
      goto LABEL_329;
    }
    if (SBPeekConfigurationIsValid(v478))
    {
      BOOL v61 = (unint64_t)(v15 - 1) > 1;
      uint64_t v62 = (uint64_t)v490;
      id v64 = v464;
      v63 = v466;
      if (v61 || v513 != 3)
      {
        uint64_t v87 = v513;
        if (!v513) {
          uint64_t v87 = 3;
        }
        uint64_t v513 = v87;
        id v476 = v477;
        uint64_t v65 = v478;
        goto LABEL_327;
      }
      uint64_t v65 = v478;
      if (v478 == 2)
      {
        uint64_t v66 = 4;
        goto LABEL_146;
      }
      if (v478 == 3)
      {
        uint64_t v66 = 2;
LABEL_146:
        uint64_t v513 = v66;
        id v476 = v477;
        goto LABEL_328;
      }
      uint64_t v513 = 3;
      id v476 = v477;
LABEL_327:
      if (v65) {
        goto LABEL_328;
      }
      id v144 = v64;
      id v143 = v63;
      v442 = [MEMORY[0x1E4F28B00] currentHandler];
      [v442 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1101 description:@"Peek configuration should not be undefined at this point"];

      uint64_t v65 = 0;
      goto LABEL_293;
    }
    if (v478 == 1 || !SBPeekConfigurationIsValid(v471)) {
      goto LABEL_219;
    }
    v84 = v477;
    if (!v477
      || ((char v85 = [v477 isHomeScreenEntity], v520 == 2) ? (v86 = 1) : (v86 = v85),
          v84 = v477,
          (v86 & 1) != 0))
    {
      if ([v84 isHomeScreenEntity])
      {
        uint64_t v65 = v498;
        uint64_t v62 = (uint64_t)v490;
        id v64 = v464;
        v63 = v466;
        if (v498 == 1)
        {
          uint64_t v475 = 3;
          id v476 = v477;
        }
        else
        {
          if (v498 == 2) {
            uint64_t v475 = 4;
          }
          uint64_t v65 = 1;
          id v476 = v477;
        }
        goto LABEL_328;
      }
      if (v477 && v520 != 2)
      {
        if (SBFloatingConfigurationIsValid(v498)) {
          goto LABEL_218;
        }
        goto LABEL_230;
      }
      v120 = v463;
      if (!v473) {
        goto LABEL_216;
      }
      if (!v463) {
        goto LABEL_216;
      }
      char v121 = [v473 isPreviousWorkspaceEntity];
      v120 = v463;
      if ((v121 & 1) != 0
        || (char v122 = [v463 isEqual:v473], v120 = v463, (v122 & 1) != 0)
        || (char v123 = [v463 isHomeScreenEntity], v120 = v463, (v123 & 1) != 0)
        || (int v124 = [v473 isHomeScreenEntity], v120 = v463, v124))
      {
LABEL_216:
        if (((v473 != 0) & [v120 isHomeScreenEntity]) != 1
          || ([v473 isHomeScreenEntity] & 1) != 0
          || [v473 isPreviousWorkspaceEntity])
        {
          if (!SBFloatingConfigurationIsStashed(v498)
            || ((BOOL IsStashed = SBFloatingConfigurationIsStashed(v475), !v475) ? (v126 = 1) : (v126 = IsStashed), v126 == 1))
          {
            if (SBFloatingConfigurationIsValid(v498))
            {
LABEL_218:
              uint64_t v62 = +[SBWorkspaceEntity entity];

              uint64_t v475 = v498;
              id v476 = v477;
              uint64_t v65 = v471;
LABEL_231:
              id v64 = v464;
              v63 = v466;
              goto LABEL_327;
            }
LABEL_230:
            id v476 = v477;
            uint64_t v65 = v471;
            uint64_t v62 = (uint64_t)v490;
            goto LABEL_231;
          }
        }
      }
LABEL_219:
      uint64_t v65 = 1;
      id v476 = v477;
      id v64 = v464;
      v63 = v466;
      uint64_t v62 = (uint64_t)v490;
      goto LABEL_328;
    }
    if (v463 && ([v463 isHomeScreenEntity] & 1) == 0) {
      int v95 = [v458 isEmptyWorkspaceEntity] ^ 1;
    }
    else {
      int v95 = 0;
    }
    if (v458 && ([v458 isHomeScreenEntity] & 1) == 0) {
      int v139 = [v458 isEmptyWorkspaceEntity] ^ 1;
    }
    else {
      int v139 = 0;
    }
    if (v459 && ([v459 isHomeScreenEntity] & 1) == 0) {
      int v140 = [v459 isEmptyWorkspaceEntity] ^ 1;
    }
    else {
      int v140 = 0;
    }
    if ((v95 | v139) != 1)
    {
      if (v140)
      {
        if (!v473
          || ([v473 isEmptyWorkspaceEntity] & 1) != 0
          || ([v473 isHomeScreenEntity] & 1) != 0
          || ((v470 != 0) & ~[v473 isPreviousWorkspaceEntity]) != 1
          || ([v470 isEmptyWorkspaceEntity] & 1) != 0
          || ([v470 isHomeScreenEntity] & 1) != 0
          || ([v470 isPreviousWorkspaceEntity] & 1) != 0)
        {
          id v145 = v477;

          id v146 = +[SBWorkspaceEntity entity];
        }
        else
        {
          id v145 = v473;

          id v146 = v470;
        }
        id v64 = v146;

        v147 = v490;
        uint64_t v479 = 1;
        id v490 = v459;
        uint64_t v475 = v498;
        id v476 = v477;
      }
      else
      {
        uint64_t v479 = 1;
        id v64 = v464;
        v147 = v466;
        id v145 = v477;
        id v476 = v145;
      }
      goto LABEL_273;
    }
    v141 = v463;
    v142 = v477;
    id v143 = v466;
    if (v471 != 2)
    {
      if (v471 != 3)
      {
        id v144 = v464;
        goto LABEL_292;
      }
      v141 = v477;
      v142 = v463;
    }
    id v143 = v141;

    id v144 = v142;
LABEL_292:
    uint64_t v158 = +[SBWorkspaceEntity entity];

    uint64_t v65 = 1;
    id v476 = v477;
    id v497 = (id)v158;
    uint64_t v62 = (uint64_t)v490;
LABEL_293:
    v63 = v143;
    id v64 = v144;
    goto LABEL_328;
  }

  id v30 = v473;
  if (!v473)
  {
    id v30 = v477;
    if (!v30)
    {
      id v30 = +[SBWorkspaceEntity entity];
      if (!v30)
      {
        v443 = [MEMORY[0x1E4F28B00] currentHandler];
        [v443 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1377 description:@"Primary workspace entity may not be nil at this point!"];

        id v30 = 0;
      }
    }
  }
  v596[0] = MEMORY[0x1E4F143A8];
  v596[1] = 3221225472;
  v596[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8;
  v596[3] = &unk_1E6B048F8;
  id v31 = v463;
  id v597 = v31;
  v32 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v596);
  if ([v30 isPreviousWorkspaceEntity])
  {
    uint64_t v33 = ((void (**)(void, id, id))v32)[2](v32, v30, v31);

    v34 = (void *)v33;
  }
  else
  {
    v34 = v30;
  }
  v38 = v34;
  if ([v34 isEmptyWorkspaceEntity])
  {
  }
  else
  {
    v39 = v38;
    if (v38) {
      goto LABEL_46;
    }
  }
  v39 = +[SBWorkspaceEntity entity];
  if (!v39)
  {
    id v489 = 0;
    uint64_t v455 = 0;
    goto LABEL_48;
  }
LABEL_46:
  id v489 = v39;
  uint64_t v455 = [v39 isHomeScreenEntity] ^ 1;
LABEL_48:

  id v495 = 0;
  id v497 = 0;
  id v491 = 0;
  uint64_t v479 = 0;
  uint64_t v460 = 0;
  uint64_t v475 = 0;
  id v476 = v477;
LABEL_481:
  uint64_t v237 = v520;
  if (!v520)
  {
    if (([v489 isHomeScreenEntity] & 1) != 0 || SBPeekConfigurationIsValid(v479)) {
      uint64_t v237 = 1;
    }
    else {
      uint64_t v237 = 3;
    }
  }
  uint64_t v465 = v237;
  unsigned int IsYes = BSSettingFlagIsYes();
  if (v497) {
    char v454 = BSSettingFlagIsYes();
  }
  else {
    char v454 = 0;
  }
  id v467 = v500;
  BOOL v238 = SBPeekConfigurationIsValid([v499 peekConfiguration]);
  uint64_t v239 = [v499 unlockedEnvironmentMode];
  BOOL v240 = v239 == 2 && v502 == 2;
  if (v467) {
    BOOL v240 = 1;
  }
  BOOL v241 = v240 || v238;
  if (v240) {
    id v242 = v467;
  }
  else {
    id v242 = 0;
  }
  id v487 = v242;
  if (!v241)
  {
    if ([v476 isApplicationSceneEntity])
    {
      id v243 = v476;
      v244 = [v243 application];
      v245 = [v244 bundleIdentifier];
      v246 = [v243 activationSettings];
      v247 = [v246 objectForActivationSetting:46];
      BOOL v248 = v247 == 0;

      LODWORD(v246) = [v243 BOOLForActivationSetting:41];
      if ((v248 | v246 | [v244 isWebApplication])) {
        goto LABEL_505;
      }
      v249 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v250 = [v249 userInterfaceIdiom];

      if ((v250 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        goto LABEL_505;
      }
      v251 = [v244 info];
      int v252 = [v251 supportsMultiwindow];

      if (v252)
      {
        *(void *)&long long v559 = 0;
        *((void *)&v559 + 1) = &v559;
        *(void *)&long long v560 = 0x2020000000;
        BYTE8(v560) = 0;
        if (v502 == 2)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&long long v649 = 0x3032000000;
          *((void *)&v649 + 1) = __Block_byref_object_copy__66;
          *(void *)&long long v650 = __Block_byref_object_dispose__66;
          *((void *)&v650 + 1) = 0;
          v595[0] = 0;
          v595[1] = v595;
          v595[2] = 0x2020000000;
          v595[3] = 0;
          v591[0] = MEMORY[0x1E4F143A8];
          v591[1] = 3221225472;
          v591[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_69;
          v591[3] = &unk_1E6B04920;
          id v592 = v499;
          v593 = v595;
          v594 = buf;
          SBLayoutRoleEnumerateValidRoles(v591);
          v253 = [*(id *)(*(void *)&buf[8] + 40) application];
          v254 = [v253 bundleIdentifier];
          char v255 = [v254 isEqualToString:v245];
          *(unsigned char *)(*((void *)&v559 + 1) + 24) = v255;

          _Block_object_dispose(v595, 8);
          _Block_object_dispose(buf, 8);
        }
        else
        {
          v587[0] = MEMORY[0x1E4F143A8];
          v587[1] = 3221225472;
          v587[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2_70;
          v587[3] = &unk_1E6B03EA8;
          id v588 = v504;
          v590 = &v559;
          id v589 = v245;
          SBLayoutRoleEnumerateValidRoles(v587);
        }
        uint64_t v408 = [v499 bundleIDShowingAppExpose];
        v409 = (void *)v408;
        id v487 = 0;
        BOOL v411 = v239 == 2 && v408 != 0;
        if (*(unsigned char *)(*((void *)&v559 + 1) + 24) && !v411)
        {
          if (BSEqualStrings()) {
            id v487 = 0;
          }
          else {
            id v487 = v245;
          }
        }

        _Block_object_dispose(&v559, 8);
      }
      else
      {
LABEL_505:
        id v487 = 0;
      }
    }
    else
    {
      id v487 = 0;
    }
  }
  if (v502 == 2)
  {
    uint64_t v256 = 0;
  }
  else
  {
    v257 = [v476 applicationSceneEntity];
    v258 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
    int v259 = [v258 _transitionContextRepresentsAmbiguousLaunch:v504 forApplicationSceneEntity:v257];

    if (v259)
    {
      BOOL v260 = SBPeekConfigurationIsValid([v499 peekConfiguration]);
      if (v491) {
        BOOL v261 = 0;
      }
      else {
        BOOL v261 = v260;
      }
      if (v261)
      {
        uint64_t v262 = 2;
        if (v476 != v495) {
          uint64_t v262 = 0;
        }
        if (v476 == v489) {
          uint64_t v262 = 1;
        }
        uint64_t v263 = v480;
        if (v262) {
          uint64_t v263 = v262;
        }
        uint64_t v480 = v263;
      }
      else
      {
        v264 = [v257 application];
        uint64_t v265 = [v264 bundleIdentifier];

        id v487 = (id)v265;
      }
    }

    uint64_t v256 = v480;
  }
  uint64_t v481 = v256;
  if (v487)
  {
    v266 = [(SBMainDisplayLayoutStateManager *)self _applicationController];
    v267 = [v266 applicationWithBundleIdentifier:v487];

    if (v502 != 2 && ([v267 supportsMultitaskingShelf] & 1) == 0)
    {

      id v487 = 0;
    }

    uint64_t v256 = v481;
  }
  else
  {
    id v487 = 0;
  }
  if (v256)
  {
    v268 = v489;
    if (v256 == 1 || (v268 = v495, v256 == 2) || (v268 = v491, v256 == 3) || (v268 = v497, v256 == 4)) {
      id v269 = v268;
    }
    else {
      id v269 = 0;
    }
    v270 = [v269 applicationSceneEntity];
    v271 = [v270 application];

    if (!v271 || ([v271 supportsMultitaskingShelf] & 1) == 0) {
      uint64_t v481 = 0;
    }
  }
  else
  {
    uint64_t v481 = 0;
  }
  if (!v487)
  {
    v275 = [v499 bundleIDShowingAppExpose];
    if (!v275
      || ((uint64_t v276 = [v499 unlockedEnvironmentMode], v465 == 2) ? (v277 = v276 == 2) : (v277 = 0),
          !v277 ? (int v278 = 0) : (int v278 = 1),
          v275,
          !v278))
    {
      id v487 = 0;
      goto LABEL_559;
    }
    id v487 = [v499 bundleIDShowingAppExpose];
    if (!v487)
    {
      id v487 = 0;
LABEL_556:
      uint64_t v274 = 2;
      goto LABEL_557;
    }
  }
  uint64_t v272 = [v499 unlockedEnvironmentMode];
  unint64_t v273 = v520 - 3;
  if (v272 != 3)
  {
    if (((v273 < 0xFFFFFFFFFFFFFFFELL) & [v476 isApplicationSceneEntity]) != 0) {
      goto LABEL_543;
    }
LABEL_555:
    unsigned int IsYes = 0;
    goto LABEL_556;
  }
  if (v273 >= 0xFFFFFFFFFFFFFFFELL) {
    goto LABEL_555;
  }
LABEL_543:
  unsigned int IsYes = 0;
  uint64_t v274 = 3;
LABEL_557:
  uint64_t v465 = v274;
LABEL_559:
  if ([v489 isPreviousWorkspaceEntity])
  {
    v412 = [MEMORY[0x1E4F28B00] currentHandler];
    [v412 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1576 description:@"Primary workspace entity may not be previous entity at this point!"];
  }
  if ([v495 isPreviousWorkspaceEntity])
  {
    v413 = [MEMORY[0x1E4F28B00] currentHandler];
    [v413 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1577 description:@"Side workspace entity may not be previous entity at this point!"];
  }
  if ([v491 isPreviousWorkspaceEntity])
  {
    v414 = [MEMORY[0x1E4F28B00] currentHandler];
    [v414 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1578 description:@"Floating workspace entity may not be previous entity at this point!"];
  }
  if ([v497 isPreviousWorkspaceEntity])
  {
    v415 = [MEMORY[0x1E4F28B00] currentHandler];
    [v415 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1579 description:@"Center workspace entity may not be previous entity at this point!"];
  }
  if ([v489 isEmptyWorkspaceEntity])
  {
    v416 = [MEMORY[0x1E4F28B00] currentHandler];
    [v416 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1581 description:@"Primary workspace entity may not be empty entity at this point!"];
  }
  if ([v495 isEmptyWorkspaceEntity])
  {
    v417 = [MEMORY[0x1E4F28B00] currentHandler];
    [v417 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1582 description:@"Side workspace entity may not be empty entity at this point!"];
  }
  if ([v491 isEmptyWorkspaceEntity])
  {
    v418 = [MEMORY[0x1E4F28B00] currentHandler];
    [v418 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1583 description:@"Floating workspace entity may not be empty entity at this point!"];
  }
  if ([v497 isEmptyWorkspaceEntity])
  {
    v419 = [MEMORY[0x1E4F28B00] currentHandler];
    [v419 handleFailureInMethod:a2 object:self file:@"SBMainDisplayLayoutStateManager.m" lineNumber:1584 description:@"Center workspace entity may not be empty entity at this point!"];
  }
  [v504 setActivatingEntity:0];
  [v504 setEntity:v489 forLayoutRole:1];
  [v504 setEntity:v495 forLayoutRole:2];
  [v504 setEntity:v491 forLayoutRole:3];
  [v504 setEntity:v497 forLayoutRole:4];
  id v279 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v483 = v279;
  if (v489)
  {
    v280 = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v279, v489);
    if (v280) {
      [v483 addObject:v280];
    }
  }
  if (v495)
  {
    v281 = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v279, v495);
    if (v281)
    {
      [v483 addObject:v281];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&long long v649 = 0x2020000000;
      *((void *)&v649 + 1) = 5;
      v577[0] = MEMORY[0x1E4F143A8];
      v577[1] = 3221225472;
      v577[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3_83;
      v577[3] = &unk_1E6B04948;
      id v578 = v504;
      v584 = v468;
      id v579 = v489;
      id v580 = v495;
      id v581 = v497;
      id v282 = v491;
      v586 = buf;
      id v582 = v282;
      id v585 = &__block_literal_global_198;
      id v583 = v483;
      SBLayoutRoleEnumerateValidRoles(v577);

      _Block_object_dispose(buf, 8);
    }
  }
  if (v491)
  {
    v283 = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v279, v491);
    if (v283) {
      [v483 addObject:v283];
    }
  }
  if (v497)
  {
    v284 = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v279, v497);
    if (v284) {
      [v483 addObject:v284];
    }
  }
  uint64_t v285 = [v483 count];
  v286 = v483;
  if (!v285) {
    v286 = 0;
  }
  id v287 = v286;
  uint64_t v288 = objc_opt_class();
  v289 = SBSafeCast(v288, v499);
  v507 = [v289 elementIdentifiersToLayoutAttributes];

  id v518 = [v504 requestedEntityIdentifierToLayoutAttributes];
  v522 = objc_opt_new();
  long long v576 = 0u;
  long long v575 = 0u;
  long long v574 = 0u;
  long long v573 = 0u;
  id obja = v287;
  uint64_t v525 = [obja countByEnumeratingWithState:&v573 objects:v652 count:16];
  if (v525)
  {
    uint64_t v515 = *(void *)v574;
    do
    {
      uint64_t v290 = 0;
      do
      {
        if (*(void *)v574 != v515) {
          objc_enumerationMutation(obja);
        }
        v291 = *(void **)(*((void *)&v573 + 1) + 8 * v290);
        v292 = [v291 uniqueIdentifier];
        v293 = [v518 objectForKey:v292];
        if (!v293)
        {
          v294 = [v507 objectForKey:v292];
          if (v294)
          {
            v293 = v294;
          }
          else
          {
            v295 = (void *)MEMORY[0x1E4F1CAD0];
            v296 = [v291 uniqueIdentifier];
            v297 = [v295 setWithObject:v296];
            v298 = [(SBMainDisplayLayoutStateManager *)self _mostRecentAppLayoutMatchingAnyUniqueIdentifier:v297 chamoisWindowingUIEnabled:v502 == 2 multitaskingSupported:v502 != 0];

            if (v298)
            {
              v299 = [v298 allItems];
              v572[0] = MEMORY[0x1E4F143A8];
              v572[1] = 3221225472;
              v572[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4_85;
              v572[3] = &unk_1E6AF4B38;
              v572[4] = v291;
              v300 = objc_msgSend(v299, "bs_firstObjectPassingTest:", v572);

              if (v501 == 11) {
                goto LABEL_605;
              }
              if (v501 == 50) {
                goto LABEL_605;
              }
              v301 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
              v302 = objc_msgSend(v301, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", v298, objc_msgSend(v499, "displayOrdinal"));
              v303 = [v302 objectForKey:v300];

              if (!v303)
              {
LABEL_605:
                uint64_t v304 = 1;
                if (v300) {
                  uint64_t v304 = [v298 layoutRoleForItem:v300];
                }
                v303 = [v298 layoutAttributesForItemInRole:v304];
              }
              v305 = v303;

              v293 = v305;
            }
            else
            {
              v306 = [v291 workspaceEntity];
              v307 = [v306 applicationSceneEntity];
              v308 = [v307 application];
              v305 = [v308 bundleIdentifier];

              if (v305)
              {
                v309 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
                v570[0] = MEMORY[0x1E4F143A8];
                v570[1] = 3221225472;
                v570[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5_86;
                v570[3] = &unk_1E6AF4B60;
                v305 = v305;
                v571 = v305;
                v310 = [v309 mostRecentAppLayoutIncludingHiddenAppLayouts:1 passingTest:v570];

                if (v310)
                {
                  v568[0] = MEMORY[0x1E4F143A8];
                  v568[1] = 3221225472;
                  v568[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6_87;
                  v568[3] = &unk_1E6AF4B38;
                  v569 = v305;
                  v311 = [v310 latestItemPassingTest:v568];
                  if (v311)
                  {
                    v312 = [v310 layoutAttributesForItem:v311];
                    v313 = v312;
                    if (v312)
                    {
                      [v312 attributedSize];
                    }
                    else
                    {
                      uint64_t v567 = 0;
                      memset(v566, 0, sizeof(v566));
                    }
                    v314 = [0 attributesByModifyingAttributedSize:v566];
                    objc_msgSend(v314, "attributesByModifyingSizingPolicy:", objc_msgSend(v313, "sizingPolicy"));
                    v293 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v293 = 0;
                  }
                }
                else
                {
                  v293 = 0;
                }
                v315 = [v504 entityForLayoutRole:4];
                BOOL v316 = v315 == 0;

                if (!v316)
                {
                  v317 = -[SBDisplayItemLayoutAttributes attributesByModifyingAttributedSize:](v293, "attributesByModifyingAttributedSize:", v565, SBDisplayItemAttributedSizeUnspecified((uint64_t)v565).n128_f64[0]);

                  v293 = [v317 attributesByModifyingSizingPolicy:0];
                }
              }
              else
              {
                v293 = 0;
              }
            }

            if (!v293)
            {
              v293 = objc_alloc_init(SBDisplayItemLayoutAttributes);
              if (!v293)
              {
                uint64_t v564 = 0;
                memset(v563, 0, sizeof(v563));
                goto LABEL_626;
              }
            }
          }
        }
        [(SBDisplayItemLayoutAttributes *)v293 attributedSize];
LABEL_626:
        if (SBDisplayItemAttributedSizeIsUnspecified((uint64_t)v563) && SBFIsChamoisWindowingUIAvailable())
        {
          v318 = [v291 workspaceEntity];
          v319 = [v318 deviceApplicationSceneEntity];
          v320 = [v319 sceneHandle];

          if (v320 && ([v320 supportsCenterWindow] & 1) == 0)
          {
            v321 = [v320 application];
            v322 = v321;
            if (v321)
            {
              v323 = [v321 bundleIdentifier];
              v324 = [MEMORY[0x1E4F1CAD0] set];
              v325 = [(SBMainDisplayLayoutStateManager *)self _mostRecentAppLayoutForBundleIdentifier:v323 ignoringUniqueIdentifiers:v324 chamoisWindowingUIEnabled:v502 == 2 multitaskingSupported:v502 != 0];

              if (!v325)
              {
                v326 = [v322 lastWindowLayoutAttributes];
                v327 = v326;
                if (v326)
                {
                  unint64_t v328 = [v326 sizingPolicy];
                  uint64_t v651 = 0;
                  long long v650 = 0u;
                  long long v649 = 0u;
                  *(_OWORD *)buf = 0u;
                  [v327 attributedSize];
                  [v327 normalizedCenter];
                  double v330 = v329;
                  double v332 = v331;
                  char v333 = [v327 isPositionSystemManaged];
                  if (SBDisplayItemSizingPolicyIsValid(v328))
                  {
                    long long v559 = *(_OWORD *)buf;
                    long long v560 = v649;
                    long long v561 = v650;
                    uint64_t v562 = v651;
                    if (SBDisplayItemAttributedSizeIsValid((uint64_t)&v559))
                    {
                      uint64_t v486 = [v327 contentOrientation];
                      if (v486)
                      {
                        v334 = +[SBMainSwitcherControllerCoordinator sharedInstance];
                        [v334 _setInterfaceOrientationFromUserResizingIfSupported:v486 forSceneHandle:v320];
                      }
                      v472 = [SBDisplayItemLayoutAttributes alloc];
                      uint64_t v335 = [(SBDisplayItemLayoutAttributes *)v293 lastInteractionTime];
                      SBDisplayItemAttributedSizeUnspecified((uint64_t)v558);
                      long long v559 = *(_OWORD *)buf;
                      long long v560 = v649;
                      long long v561 = v650;
                      uint64_t v562 = v651;
                      LOBYTE(v451) = v333;
                      uint64_t v336 = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v472, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v486, v335, v328, &v559, 0, v558, v330, v332, 0.0, 0.0, v451);

                      v293 = (SBDisplayItemLayoutAttributes *)v336;
                    }
                  }
                }
              }
            }
          }
        }
        [v522 setObject:v293 forKey:v292];

        ++v290;
      }
      while (v525 != v290);
      uint64_t v337 = [obja countByEnumeratingWithState:&v573 objects:v652 count:16];
      uint64_t v525 = v337;
    }
    while (v337);
  }

  v338 = +[SBAppSwitcherDomain rootSettings];
  v339 = [v338 chamoisSettings];
  unint64_t v340 = [v339 maximumNumberOfAppsOnStage];

  if (v502 == 2 && [obja count] > v340)
  {
    v341 = [obja allObjects];
    v556[0] = MEMORY[0x1E4F143A8];
    v556[1] = 3221225472;
    v556[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7_90;
    v556[3] = &unk_1E6B04970;
    id v557 = v522;
    v342 = [v341 sortedArrayUsingComparator:v556];

    v343 = objc_opt_new();
    long long v554 = 0u;
    long long v555 = 0u;
    long long v552 = 0u;
    long long v553 = 0u;
    id v344 = v342;
    uint64_t v345 = [v344 countByEnumeratingWithState:&v552 objects:v647 count:16];
    if (v345)
    {
      uint64_t v346 = 0;
      uint64_t v347 = *(void *)v553;
      do
      {
        for (juint64_t j = 0; jj != v345; ++jj)
        {
          if (*(void *)v553 != v347) {
            objc_enumerationMutation(v344);
          }
          v349 = *(void **)(*((void *)&v552 + 1) + 8 * jj);
          if (SBLayoutRoleIsValidForSplitView([v349 layoutRole]) && ++v346 > v340) {
            continue;
          }
          [v343 addObject:v349];
        }
        uint64_t v345 = [v344 countByEnumeratingWithState:&v552 objects:v647 count:16];
      }
      while (v345);
    }

    v350 = [v504 entities];
    v550[0] = MEMORY[0x1E4F143A8];
    v550[1] = 3221225472;
    v550[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8_93;
    v550[3] = &unk_1E6B04998;
    id v351 = v350;
    id v551 = v351;
    v352 = (void *)MEMORY[0x1D948C7A0](v550);
    v548[0] = MEMORY[0x1E4F143A8];
    v548[1] = 3221225472;
    v548[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_10;
    v548[3] = &unk_1E6B049C0;
    id v353 = v352;
    id v549 = v353;
    v354 = objc_msgSend(v343, "bs_map:", v548);
    v355 = [v354 allObjects];
    v546[0] = MEMORY[0x1E4F143A8];
    v546[1] = 3221225472;
    v546[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_11;
    v546[3] = &unk_1E6B049C0;
    id v356 = v353;
    id v547 = v356;
    v357 = objc_msgSend(v343, "bs_compactMap:", v546);
    v358 = [v357 anyObject];
    v544[0] = MEMORY[0x1E4F143A8];
    v544[1] = 3221225472;
    v544[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_12;
    v544[3] = &unk_1E6B049C0;
    id v359 = v356;
    id v545 = v359;
    v360 = objc_msgSend(v343, "bs_compactMap:", v544);
    v361 = [v360 anyObject];
    [v504 setEntities:v355 withPolicy:0 centerEntity:v358 floatingEntity:v361];

    long long v542 = 0u;
    long long v543 = 0u;
    long long v540 = 0u;
    long long v541 = 0u;
    v362 = [v504 entities];
    v363 = (void *)[v362 copy];

    uint64_t v364 = [v363 countByEnumeratingWithState:&v540 objects:v646 count:16];
    if (v364)
    {
      uint64_t v365 = *(void *)v541;
      do
      {
        for (kuint64_t k = 0; kk != v364; ++kk)
        {
          if (*(void *)v541 != v365) {
            objc_enumerationMutation(v363);
          }
          v367 = *(void **)(*((void *)&v540 + 1) + 8 * kk);
          if (([v367 isEmptyWorkspaceEntity] & 1) != 0
            || [v367 isPreviousWorkspaceEntity])
          {
            objc_msgSend(v504, "setEntity:forLayoutRole:", 0, objc_msgSend(v367, "layoutRole"));
          }
        }
        uint64_t v364 = [v363 countByEnumeratingWithState:&v540 objects:v646 count:16];
      }
      while (v364);
    }

    v368 = [v504 entities];
    v538[0] = MEMORY[0x1E4F143A8];
    v538[1] = 3221225472;
    v538[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_13;
    v538[3] = &unk_1E6B049E8;
    id v539 = &__block_literal_global_198;
    uint64_t v369 = objc_msgSend(v368, "bs_map:", v538);

    id obja = (id)v369;
  }
  v370 = [SBMainDisplayLayoutState alloc];
  uint64_t v371 = [v499 displayOrdinal];
  LOBYTE(v453) = [v499 isDisplayExternal];
  LOBYTE(v452) = v454;
  id v524 = [(SBMainDisplayLayoutState *)v370 _initWithLayoutElements:obja spaceConfiguration:v455 elementIdentifiersToLayoutAttributes:v522 floatingConfiguration:v475 unlockedEnvironmentMode:v465 floatingSwitcherVisible:IsYes centerConfiguration:v460 centerEntityModal:v452 peekConfiguration:v479 bundleIDShowingAppExpose:v487 windowPickerRole:v481 displayOrdinal:v371 isDisplayExternal:v453];

LABEL_670:
  *(void *)&long long v559 = 0;
  *(void *)&long long v559 = [v524 interfaceOrientation];
  v372 = SBLogCommon();
  if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
  {
    SBStringForUnlockedEnvironmentMode([v524 unlockedEnvironmentMode]);
    id v373 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v373;
    _os_log_impl(&dword_1D85BA000, v372, OS_LOG_TYPE_DEFAULT, "[92869424] unlockedEnvironmentMode: %{public}@", buf, 0xCu);
  }
  id v533 = 0;
  [v493 switcherOrientation:&v559 elementsOrientations:&v533 forTransitionRequest:v492 previousLayoutState:v499 layoutState:v524];
  id objb = v533;
  [v524 setInterfaceOrientation:(void)v559];
  [v524 setInterfaceOrientationByLayoutElementIdentifier:objb];
  v374 = [v493 layoutElementSizingPoliciesForLayoutState:v524];
  [v524 _updateSizingPoliciesForLayoutElements:v374];

  v375 = [v524 appLayout];
  v516 = [v493 windowScene];
  if (!v516 || !v375 || ![v493 isChamoisWindowingUIEnabled])
  {
    v381 = v375;
    goto LABEL_708;
  }
  v505 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
  v508 = [v499 appLayout];
  if ([v492 source] != 3 && objc_msgSend(v492, "source") != 63) {
    goto LABEL_681;
  }
  v376 = [v375 allItems];
  unint64_t v377 = [v376 count];
  v378 = [v508 allItems];
  if (v377 <= [v378 count])
  {

LABEL_681:
    uint64_t v380 = 0;
    goto LABEL_682;
  }
  unsigned int v379 = [v375 containsAnyItemFromAppLayout:v508];

  uint64_t v380 = v379;
LABEL_682:
  v381 = -[SBDisplayItemLayoutAttributesCalculator appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:windowScene:source:](v505, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:windowScene:source:", v375, v508, v380, [v524 interfaceOrientation], v516, objc_msgSend(v492, "source"));

  long long v531 = 0u;
  long long v532 = 0u;
  long long v529 = 0u;
  long long v530 = 0u;
  id v519 = [v381 allItems];
  uint64_t v382 = [v519 countByEnumeratingWithState:&v529 objects:v644 count:16];
  if (v382)
  {
    uint64_t v523 = *(void *)v530;
    do
    {
      for (muint64_t m = 0; mm != v382; ++mm)
      {
        if (*(void *)v530 != v523) {
          objc_enumerationMutation(v519);
        }
        uint64_t v384 = *(void *)(*((void *)&v529 + 1) + 8 * mm);
        v385 = [v381 layoutAttributesForItem:v384];
        v386 = objc_msgSend(v524, "elementWithRole:", objc_msgSend(v381, "layoutRoleForItem:", v384));
        [v524 _setLayoutAttributes:v385 forLayoutElement:v386];
        v387 = [v386 workspaceEntity];
        v388 = [v387 deviceApplicationSceneEntity];
        v389 = [v388 sceneHandle];

        if (v389 && ([v389 supportsCenterWindow] & 1) == 0)
        {
          v390 = [v389 application];
          v391 = v390;
          if (v390)
          {
            v392 = [v390 lastWindowLayoutAttributes];
            v393 = v392;
            if (!v392) {
              goto LABEL_699;
            }
            uint64_t v394 = [v392 sizingPolicy];
            if (v394 != [v385 sizingPolicy]) {
              goto LABEL_699;
            }
            [v393 attributedSize];
            if (v385)
            {
              [v385 attributedSize];
            }
            else
            {
              uint64_t v527 = 0;
              memset(v526, 0, sizeof(v526));
            }
            if (!SBEqualDisplayItemAttributedSizes((uint64_t)v528, (uint64_t)v526)
              || ([v393 normalizedCenter],
                  double v396 = v395,
                  double v398 = v397,
                  [v385 normalizedCenter],
                  v396 != v400)
              || v398 != v399
              || (int v401 = [v393 isPositionSystemManaged],
                  v401 != [v385 isPositionSystemManaged]))
            {
LABEL_699:
              id v402 = v385;
              uint64_t v403 = [v389 _interfaceOrientationFromUserResizing];
              if (!v403 || v403 != [v402 contentOrientation])
              {
                uint64_t v404 = [v402 attributesByModifyingContentOrientation:0];

                id v402 = (id)v404;
              }
              [v391 setLastWindowLayoutAttributes:v402];
            }
          }
        }
      }
      uint64_t v382 = [v519 countByEnumeratingWithState:&v529 objects:v644 count:16];
    }
    while (v382);
  }

LABEL_708:
  id v405 = v524;

  return v405;
}

- (id)_switcherControllerForDisplayIdentity:(id)a3
{
  int v3 = (void *)SBApp;
  id v4 = a3;
  int v5 = [v3 windowSceneManager];
  id v6 = [v5 windowSceneForDisplayIdentity:v4];

  v7 = [v6 switcherController];

  return v7;
}

- (SBMainWorkspace)_mainWorkspace
{
  return (SBMainWorkspace *)+[SBWorkspace mainWorkspace];
}

- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9 preferredDisplay:(id)a10
{
  BOOL v116 = a6;
  BOOL v12 = a5;
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = (__CFString *)a4;
  id v128 = a7;
  id v127 = a8;
  id v134 = a9;
  id v99 = a10;
  uint64_t v129 = self;
  id v98 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
  id v136 = v15;
  v17 = [v98 recentsForBundleIdentifier:v15 includingHiddenAppLayouts:0];
  uint64_t v18 = [v17 count];
  char v122 = v16;
  uint64_t v125 = v18;
  if (v16 || !v18)
  {
    uint64_t v19 = [v98 recentsForBundleIdentifier:v136 includingHiddenAppLayouts:1];

    v17 = (void *)v19;
  }
  if (v99)
  {
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = __216__SBMainDisplayLayoutStateManager_defaultSceneIdentifierForBundleIdentifier_targetContentIdentifier_allowCanMatches_preferNewScene_visibleSceneIdentifiers_excludingSceneIdentifiers_sceneSessionRole_preferredDisplay___block_invoke;
    v142[3] = &unk_1E6AF4B60;
    id v143 = v99;
    uint64_t v20 = objc_msgSend(v17, "bs_filter:", v142);

    v17 = (void *)v20;
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v105 = v17;
  uint64_t v110 = [v105 countByEnumeratingWithState:&v138 objects:v150 count:16];
  if (v110)
  {
    char v102 = 0;
    id v106 = 0;
    v22 = &stru_1F3084718;
    if (v122) {
      v22 = v122;
    }
    int v112 = v22;
    int v104 = !v12;
    uint64_t v109 = *(void *)v139;
    uint64_t v101 = 4;
    uint64_t v103 = 1;
    uint64_t v100 = 2;
    int v126 = @"sceneSessionRole";
    v115 = @"activationConditions";
    *(void *)&long long v21 = 138543874;
    long long v108 = v21;
    *(void *)&long long v21 = 138543619;
    long long v97 = v21;
    *(void *)&long long v21 = 138543618;
    long long v107 = v21;
LABEL_10:
    uint64_t v23 = 0;
LABEL_11:
    if (*(void *)v139 != v109) {
      objc_enumerationMutation(v105);
    }
    uint64_t v24 = *(void **)(*((void *)&v138 + 1) + 8 * v23);
    if (v122
      && ([MEMORY[0x1E4F42948] currentDevice],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          uint64_t v26 = [v25 userInterfaceIdiom],
          v25,
          (v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      || !objc_msgSend(v24, "isHidden", (void)v97, *((void *)&v97 + 1))
      || ![(SBMainDisplayLayoutStateManager *)v129 _hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:v24])
    {
      uint64_t v27 = SBLayoutRoleMax();
      v114 = &v97;
      MEMORY[0x1F4188790]();
      v29 = (uint64_t *)((char *)&v97 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
      id v30 = +[SBMainSwitcherControllerCoordinator sharedInstance];
      id v31 = [v30 switcherControllerForAppLayout:v24];

      id v113 = v31;
      uint64_t v32 = [v31 windowManagementStyle];
      if (v32 == 2)
      {
        uint64_t v35 = v23;
        v36 = [v24 zOrderedItems];
        uint64_t v37 = [v36 count];
        uint64_t v34 = v37;
        if (v37 >= v27) {
          uint64_t v38 = v27;
        }
        else {
          uint64_t v38 = v37;
        }
        if (v38 >= 1)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            v40 = objc_msgSend(v36, "objectAtIndex:", i, (void)v97);
            v29[i] = [v24 layoutRoleForItem:v40];
          }
        }

        uint64_t v33 = v125;
        uint64_t v23 = v35;
        if (v34 < 1)
        {
LABEL_28:

          goto LABEL_95;
        }
      }
      else
      {
        uint64_t v33 = v125;
        if (v32 == 1)
        {
          uint64_t v41 = v103;
          uint64_t *v29 = v101;
          v29[1] = v41;
          uint64_t v34 = 3;
          v29[2] = v100;
        }
        else
        {
          if (v32) {
            goto LABEL_28;
          }
          uint64_t *v29 = v103;
          uint64_t v34 = 1;
        }
      }
      uint64_t v111 = v23;
      id v123 = 0;
      uint64_t v131 = v24;
      while (1)
      {
        uint64_t v42 = *v29++;
        uint64_t v43 = objc_msgSend(v24, "itemForLayoutRole:", v42, (void)v97);
        v44 = v43;
        if (v43) {
          break;
        }
LABEL_93:

        if (!--v34)
        {

          uint64_t v23 = v111;
          v89 = v123;
          if (v123) {
            goto LABEL_99;
          }
LABEL_95:
          if (++v23 == v110)
          {
            uint64_t v110 = [v105 countByEnumeratingWithState:&v138 objects:v150 count:16];
            if (!v110) {
              goto LABEL_97;
            }
            goto LABEL_10;
          }
          goto LABEL_11;
        }
      }
      v45 = [v43 uniqueIdentifier];
      int v46 = [v127 containsObject:v45];
      int v47 = [v128 containsObject:v45];
      int v135 = v29;
      int v133 = v47;
      if (v33) {
        int v132 = [v24 isHidden];
      }
      else {
        int v132 = 0;
      }
      v48 = [(SBMainDisplayLayoutStateManager *)v129 _applicationController];
      uint64_t v49 = [v48 applicationWithBundleIdentifier:v136];

      uint64_t v50 = [v49 _dataStore];
      v51 = [v44 uniqueIdentifier];
      v52 = [v50 sceneStoreForIdentifier:v51 creatingIfNecessary:0];

      v53 = [v52 objectForKey:v126];
      v54 = v53;
      if (v134 && v53 && ![v53 isEqual:v134])
      {
LABEL_92:

        uint64_t v24 = v131;
        v29 = v135;
        goto LABEL_93;
      }
      int v130 = v46;
      v55 = [v44 bundleIdentifier];
      int v56 = [v136 isEqualToString:v55];

      if (!v56) {
        goto LABEL_91;
      }
      if (__sb__runningInSpringBoard())
      {
        int v57 = SBFEffectiveDeviceClass();
        if (!v122 || v57 != 2) {
          goto LABEL_47;
        }
      }
      else
      {
        v58 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v59 = [v58 userInterfaceIdiom];

        if (v59 != 1 || !v122)
        {
LABEL_47:
          if (((v130 | v133 | v116 | v132) & 1) == 0)
          {
            uint64_t v65 = v123;
            if (v123) {
              uint64_t v66 = v123;
            }
            else {
              uint64_t v66 = v45;
            }
            id v67 = v66;
            id v68 = v65;
            id v69 = v67;
LABEL_90:

            id v123 = v69;
          }
LABEL_91:
          uint64_t v33 = v125;
          goto LABEL_92;
        }
      }
      v117 = v49;
      uint64_t v60 = [v52 objectForKey:v115];
      BOOL v61 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v62 = objc_opt_class();
      v118 = (void *)v60;
      v63 = [v61 unarchivedObjectOfClass:v62 fromData:v60 error:0];
      id v119 = v63;
      if (v63) {
        id v64 = v63;
      }
      else {
        id v64 = objc_alloc_init(MEMORY[0x1E4F42D60]);
      }
      id v124 = v64;
      v70 = v122;
      v71 = +[SBFocusAppConfigurationContextMonitor sharedInstance];
      v72 = [v71 targetContentIdentifierPrefixForBundleIdentifier:v136];

      uint64_t v49 = v117;
      id v120 = v72;
      if (v72)
      {
        uint64_t v73 = SBLogSceneResolution();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          int v144 = v107;
          id v145 = v136;
          __int16 v146 = 2114;
          id v147 = v120;
          _os_log_impl(&dword_1D85BA000, v73, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for scene evaluation %{public}@:%{public}@", (uint8_t *)&v144, 0x16u);
        }

        uint64_t v74 = [v120 stringByAppendingString:v112];

        id v75 = (id)v74;
      }
      else
      {
        id v75 = v70;
      }
      id v76 = v124;
      id v137 = 0;
      v77 = v75;
      uint64_t v78 = objc_msgSend(v124, "_suitabilityForTargetContentIdentifier:errorString:");
      id v121 = v137;
      id v124 = v76;
      if (v78 != 2)
      {
        if (v78 == 1)
        {
          if (((v130 | v133 | v104 | v132) & 1) == 0)
          {
            id v84 = v106;
            if (v106) {
              id v85 = v106;
            }
            else {
              id v85 = v45;
            }
            id v86 = v85;

            id v106 = v86;
          }
          int v79 = SBLogSceneResolution();
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_84;
          }
          int v144 = v108;
          id v145 = v45;
          __int16 v146 = 2114;
          id v147 = v119;
          __int16 v148 = 2114;
          v149 = v77;
          v80 = v79;
          uint64_t v81 = "Scene is suitable for activationConditions %{public}@:%{public}@ %{public}@";
          goto LABEL_83;
        }
        if (v78)
        {
LABEL_85:
          id v69 = v123;
          if (v121)
          {
            v88 = SBLogSceneResolution();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            {
              int v144 = v97;
              id v145 = v136;
              __int16 v146 = 2113;
              id v147 = v121;
              _os_log_error_impl(&dword_1D85BA000, v88, OS_LOG_TYPE_ERROR, "error evaluating UISceneActivationConditions for %{public}@: %{private}@", (uint8_t *)&v144, 0x16u);
            }
          }
          id v68 = v118;
          goto LABEL_90;
        }
        int v79 = SBLogSceneResolution();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          int v144 = v108;
          id v145 = v45;
          __int16 v146 = 2114;
          id v147 = v119;
          __int16 v148 = 2114;
          v149 = v77;
          v80 = v79;
          uint64_t v81 = "Scene is not suitable for activationConditions %{public}@:%{public}@ %{public}@";
LABEL_83:
          _os_log_impl(&dword_1D85BA000, v80, OS_LOG_TYPE_DEFAULT, v81, (uint8_t *)&v144, 0x20u);
          goto LABEL_84;
        }
        goto LABEL_84;
      }
      if ((v130 | v133))
      {
        if ((v130 | v133 ^ 1)) {
          goto LABEL_81;
        }
        uint64_t v82 = v102;
        if (v102) {
          v83 = v102;
        }
        else {
          v83 = v45;
        }
        char v102 = v83;
      }
      else
      {
        uint64_t v82 = v123;
        if (v123) {
          v83 = v123;
        }
        else {
          v83 = v45;
        }
        id v123 = v83;
      }
      id v87 = v83;

LABEL_81:
      int v79 = SBLogSceneResolution();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        int v144 = v108;
        id v145 = v45;
        __int16 v146 = 2114;
        id v147 = v119;
        __int16 v148 = 2114;
        v149 = v77;
        v80 = v79;
        uint64_t v81 = "Scene is preferred for activationConditions %{public}@:%{public}@ %{public}@";
        goto LABEL_83;
      }
LABEL_84:

      goto LABEL_85;
    }
LABEL_97:
    v89 = 0;
  }
  else
  {
    char v102 = 0;
    v89 = 0;
    id v106 = 0;
  }
LABEL_99:

  if (_os_feature_enabled_impl())
  {
    BOOL v90 = SBLogSceneResolution();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      int v144 = 138543362;
      id v145 = v106;
      _os_log_impl(&dword_1D85BA000, v90, OS_LOG_TYPE_DEFAULT, "PROTOTYPING: Not accepting CAN match, ignoring scene %{public}@", (uint8_t *)&v144, 0xCu);
    }

    id v91 = 0;
  }
  else
  {
    id v91 = v106;
  }
  uint64_t v92 = v91;
  uint64_t v93 = v102;
  if (!v91) {
    id v91 = v102;
  }
  if (v89) {
    v94 = v89;
  }
  else {
    v94 = v91;
  }
  id v95 = v94;

  return v95;
}

- (SBApplicationController)_applicationController
{
  return +[SBApplicationController sharedInstance];
}

uint64_t __216__SBMainDisplayLayoutStateManager_defaultSceneIdentifierForBundleIdentifier_targetContentIdentifier_allowCanMatches_preferNewScene_visibleSceneIdentifiers_excludingSceneIdentifiers_sceneSessionRole_preferredDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 preferredDisplayIdentity];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

+ (Class)_layoutStateClass
{
  return (Class)objc_opt_class();
}

+ (id)_initialLayoutStateWithDisplayOrdinal:(int64_t)a3 isDisplayExternal:(BOOL)a4
{
  id v6 = objc_alloc((Class)[a1 _layoutStateClass]);
  LOBYTE(v11) = a4;
  LOBYTE(v10) = 0;
  LOBYTE(v9) = 0;
  v7 = objc_msgSend(v6, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", 0, 0, 0, 0, MEMORY[0x1E4F1CC08], 0, 1, v9, 0, v10, 0, 0, 0, a3,
                 v11);
  return v7;
}

- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9
{
  return [(SBMainDisplayLayoutStateManager *)self defaultSceneIdentifierForBundleIdentifier:a3 targetContentIdentifier:a4 allowCanMatches:a5 preferNewScene:a6 visibleSceneIdentifiers:a7 excludingSceneIdentifiers:a8 sceneSessionRole:a9 preferredDisplay:0];
}

- (id)primarySceneIdentifierForBundleIdentifier:(id)a3 sceneSessionRole:(id)a4 displayIdentity:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v50 = a4;
  id v8 = a5;
  v52 = self;
  uint64_t v9 = [(SBMainDisplayLayoutStateManager *)self _layoutStateForDisplayIdentity:v8];
  BOOL IsValid = SBPeekConfigurationIsValid([v9 peekConfiguration]);
  [v9 appLayout];
  v49 = uint64_t v11 = 0;
  if (v49 && !IsValid)
  {
    uint64_t v11 = [(SBMainDisplayLayoutStateManager *)self _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:v49 bundleIdentifier:v51 sceneSessionRole:v50];
  }
  uint64_t v12 = [v9 floatingAppLayout];
  id v13 = (void *)v12;
  if (!v11)
  {
    BOOL v16 = !v12 || IsValid;
    if (v16
      || ([(SBMainDisplayLayoutStateManager *)v52 _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:v12 bundleIdentifier:v51 sceneSessionRole:v50], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v17 = [(SBMainDisplayLayoutStateManager *)v52 _recentAppLayouts];
      uint64_t v18 = [v17 recentsForBundleIdentifier:v51 includingHiddenAppLayouts:0];
      v48 = v13;
      if (![v18 count])
      {
        uint64_t v19 = [v17 recentsForBundleIdentifier:v51 includingHiddenAppLayouts:1];

        uint64_t v18 = (void *)v19;
      }
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        int v46 = v17;
        uint64_t v23 = v9;
        id v24 = v8;
        uint64_t v25 = *(void *)v58;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v58 != v25) {
              objc_enumerationMutation(v20);
            }
            uint64_t v27 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([v27 isHidden]) {
              BOOL v28 = [(SBMainDisplayLayoutStateManager *)v52 _hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:v27];
            }
            else {
              BOOL v28 = 0;
            }
            if ([v49 isOrContainsAppLayout:v27]) {
              int v29 = 1;
            }
            else {
              int v29 = [v48 isOrContainsAppLayout:v27];
            }
            if (((v28 | IsValid & v29) & 1) == 0)
            {
              uint64_t v30 = [(SBMainDisplayLayoutStateManager *)v52 _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:v27 bundleIdentifier:v51 sceneSessionRole:v50];
              if (v30)
              {
                uint64_t v11 = (void *)v30;
                goto LABEL_30;
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v62 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        uint64_t v11 = 0;
LABEL_30:
        id v8 = v24;
        uint64_t v9 = v23;
        v17 = v46;
      }
      else
      {
        uint64_t v11 = 0;
      }

      BOOL v31 = v11 || IsValid;
      id v13 = v48;
      if (!v31)
      {
        v45 = v9;
        id v47 = v8;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v32 = [(SBMainDisplayLayoutStateManager *)v52 _sceneManagerForDisplayIdentity:v8];
        uint64_t v33 = [v32 externalApplicationSceneHandles];

        uint64_t v34 = v33;
        uint64_t v35 = [v33 countByEnumeratingWithState:&v53 objects:v61 count:16];
        if (!v35)
        {
          uint64_t v11 = 0;
          goto LABEL_51;
        }
        uint64_t v36 = v35;
        uint64_t v11 = 0;
        uint64_t v37 = *(void *)v54;
        id v38 = v51;
        while (1)
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v54 != v37) {
              objc_enumerationMutation(v34);
            }
            v40 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            uint64_t v41 = [v40 application];
            uint64_t v42 = [v41 bundleIdentifier];
            if (([v42 isEqual:v38] & 1) == 0)
            {

              goto LABEL_45;
            }
            uint64_t v43 = [v40 sceneIdentifier];
            BOOL v44 = [(SBMainDisplayLayoutStateManager *)v52 _doesSceneIDSpecifyPrimaryScene:v43 forApplicationIdentifier:v38 sceneSessionRole:v50];

            if (v44)
            {
              [v40 sceneIdentifier];
              uint64_t v11 = v41 = v11;
              id v38 = v51;
LABEL_45:

              continue;
            }
            id v38 = v51;
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (!v36)
          {
LABEL_51:

            uint64_t v9 = v45;
            id v8 = v47;
            id v13 = v48;
            break;
          }
        }
      }
    }
  }
  id v14 = v11;

  return v14;
}

- (BOOL)_doesSceneIDSpecifyPrimaryScene:(id)a3 forApplicationIdentifier:(id)a4 sceneSessionRole:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SBMainDisplayLayoutStateManager *)self _applicationController];
  uint64_t v12 = [v11 applicationWithBundleIdentifier:v9];

  id v13 = [v12 _dataStore];
  id v14 = [v13 sceneStoreForIdentifier:v8 creatingIfNecessary:0];

  id v15 = [v14 objectForKey:@"activationConditions"];
  BOOL v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:0];
  if (!v16)
  {
    int v21 = 1;
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  uint64_t v30 = v8;
  v17 = +[SBFocusAppConfigurationContextMonitor sharedInstance];
  uint64_t v18 = [v17 targetContentIdentifierPrefixForBundleIdentifier:v9];

  int v29 = v12;
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = SBLogSceneResolution();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v9;
      __int16 v34 = 2114;
      uint64_t v35 = v19;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for primary scene evaluation %{public}@:%{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v19 = &stru_1F3084718;
  }
  id v31 = 0;
  uint64_t v22 = [v16 _suitabilityForTargetContentIdentifier:v19 errorString:&v31];
  id v23 = v31;
  int v21 = v22 != 0;
  if (!v22)
  {
    id v24 = SBLogSceneResolution();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v33 = v9;
      __int16 v34 = 2114;
      uint64_t v35 = v30;
      __int16 v36 = 2114;
      uint64_t v37 = v16;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Scene is not suitable for primary role %{public}@:%{public}@ %{public}@", buf, 0x20u);
    }
  }
  if (v23)
  {
    uint64_t v25 = SBLogSceneResolution();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SBMainDisplayLayoutStateManager _doesSceneIDSpecifyPrimaryScene:forApplicationIdentifier:sceneSessionRole:]((uint64_t)v9, (uint64_t)v23, v25);
    }
  }
  uint64_t v12 = v29;
  id v8 = v30;
  if (v10)
  {
LABEL_18:
    if (v21)
    {
      uint64_t v26 = [v14 objectForKey:@"sceneSessionRole"];
      uint64_t v27 = v26;
      if (v26) {
        LOBYTE(v21) = [v26 isEqualToString:v10];
      }
      else {
        LOBYTE(v21) = 1;
      }
    }
  }
LABEL_23:

  return v21;
}

- (id)_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:(id)a3 bundleIdentifier:(id)a4 sceneSessionRole:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __130__SBMainDisplayLayoutStateManager__sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier_bundleIdentifier_sceneSessionRole___block_invoke;
  v15[3] = &unk_1E6B047C0;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = [a3 latestItemPassingTest:v15];
  id v13 = [v12 uniqueIdentifier];

  return v13;
}

uint64_t __130__SBMainDisplayLayoutStateManager__sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier_bundleIdentifier_sceneSessionRole___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  int v5 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = (void *)a1[5];
    v7 = [v3 uniqueIdentifier];
    uint64_t v8 = [v6 _doesSceneIDSpecifyPrimaryScene:v7 forApplicationIdentifier:a1[4] sceneSessionRole:a1[6]];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_mostRecentAppLayoutMatchingAnyUniqueIdentifier:(id)a3 chamoisWindowingUIEnabled:(BOOL)a4 multitaskingSupported:(BOOL)a5
{
  BOOL v21 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v22 = self;
  id v6 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
  obuint64_t j = [v6 recentsIncludingHiddenAppLayouts:1];

  uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v28)
  {
    id v7 = 0;
    uint64_t v26 = *(void *)v44;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v44 != v26) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke;
      v36[3] = &unk_1E6B047E8;
      v36[4] = v9;
      id v10 = v27;
      id v37 = v10;
      uint64_t v38 = &v39;
      SBLayoutRoleEnumerateAppLayoutRoles(v36);
      int v11 = *((unsigned __int8 *)v40 + 24);
      if (*((unsigned char *)v40 + 24))
      {
        id v12 = v9;

        if (!SBFIsChamoisWindowingUIAvailable() || a4)
        {
          id v7 = v12;
        }
        else
        {
          id v13 = [(SBMainDisplayLayoutStateManager *)v22 _applicationController];
          uint64_t v25 = [v12 appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:v13 multitaskingSupported:v21];

          id v14 = v25;
          if (v25)
          {
            *((unsigned char *)v40 + 24) = 0;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v15 = v25;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v47 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v33;
              while (2)
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v33 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                  v29[0] = MEMORY[0x1E4F143A8];
                  v29[1] = 3221225472;
                  v29[2] = __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2;
                  v29[3] = &unk_1E6B047E8;
                  v29[4] = v19;
                  id v30 = v10;
                  id v31 = &v39;
                  SBLayoutRoleEnumerateAppLayoutRoles(v29);
                  if (*((unsigned char *)v40 + 24))
                  {
                    id v7 = v19;

                    goto LABEL_21;
                  }
                }
                uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v47 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }
            id v7 = v12;
LABEL_21:

            id v14 = v25;
          }
          else
          {
            id v7 = v12;
          }
        }
      }

      _Block_object_dispose(&v39, 8);
      if (v11) {
        break;
      }
      if (++v8 == v28)
      {
        uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v28) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  id v6 = v3;
  int v5 = [v3 uniqueIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  id v6 = v3;
  int v5 = [v3 uniqueIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)_mostRecentAppLayoutForBundleIdentifier:(id)a3 ignoringUniqueIdentifiers:(id)a4 chamoisWindowingUIEnabled:(BOOL)a5 multitaskingSupported:(BOOL)a6
{
  BOOL v27 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v28 = self;
  uint64_t v8 = [(SBMainDisplayLayoutStateManager *)self _recentAppLayouts];
  obuint64_t j = [v8 recentsIncludingHiddenAppLayouts:0];

  uint64_t v35 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v35)
  {
    id v9 = 0;
    uint64_t v32 = *(void *)v54;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v54 != v32) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
      uint64_t v49 = 0;
      id v50 = &v49;
      uint64_t v51 = 0x2020000000;
      char v52 = 0;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke;
      v45[3] = &unk_1E6B04810;
      v45[4] = v11;
      id v12 = v33;
      id v46 = v12;
      id v13 = v34;
      id v47 = v13;
      v48 = &v49;
      SBLayoutRoleEnumerateAppLayoutRoles(v45);
      int v14 = *((unsigned __int8 *)v50 + 24);
      if (*((unsigned char *)v50 + 24))
      {
        int v36 = *((unsigned __int8 *)v50 + 24);
        id v15 = v11;

        if (SBFIsChamoisWindowingUIAvailable() && !a5)
        {
          uint64_t v16 = [(SBMainDisplayLayoutStateManager *)v28 _applicationController];
          id v31 = [v15 appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:v16 multitaskingSupported:v27];

          uint64_t v17 = v31;
          if (v31)
          {
            *((unsigned char *)v50 + 24) = 0;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v18 = v31;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v57 count:16];
            if (v19)
            {
              uint64_t v20 = *(void *)v42;
LABEL_12:
              uint64_t v21 = 0;
              while (1)
              {
                if (*(void *)v42 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * v21);
                v37[0] = MEMORY[0x1E4F143A8];
                v37[1] = 3221225472;
                v37[2] = __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2;
                v37[3] = &unk_1E6B04810;
                v37[4] = v22;
                id v38 = v12;
                id v39 = v13;
                v40 = &v49;
                SBLayoutRoleEnumerateAppLayoutRoles(v37);
                int v23 = *((unsigned __int8 *)v50 + 24);
                if (*((unsigned char *)v50 + 24))
                {
                  id v24 = v22;

                  id v15 = v24;
                }

                if (v23) {
                  break;
                }
                if (v19 == ++v21)
                {
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v57 count:16];
                  if (v19) {
                    goto LABEL_12;
                  }
                  break;
                }
              }
            }

            uint64_t v17 = v31;
          }
        }
        id v9 = v15;
        int v14 = v36;
      }
      BOOL v25 = v14 == 0;

      _Block_object_dispose(&v49, 8);
      if (!v25) {
        break;
      }
      if (++v10 == v35)
      {
        uint64_t v35 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v35) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  id v9 = v3;
  int v5 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = [v9 uniqueIdentifier];
    LOBYTE(v6) = [v6 containsObject:v7];

    uint64_t v8 = v9;
    if ((v6 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {

    uint64_t v8 = v9;
  }
}

void __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  id v9 = v3;
  int v5 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = [v9 uniqueIdentifier];
    LOBYTE(v6) = [v6 containsObject:v7];

    uint64_t v8 = v9;
    if ((v6 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {

    uint64_t v8 = v9;
  }
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 isPreviousWorkspaceEntity]) {
    goto LABEL_22;
  }
  uint64_t v7 = [v5 previousLayoutRole];
  if (v7)
  {
    id v9 = [a1[4] previousEntityForLayoutRole:v7];
    uint64_t v8 = (void *)[v9 copy];

    if (!v8) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v8 = (void *)[v6 copy];
    if (!v8) {
      goto LABEL_22;
    }
  }
  uint64_t v10 = [v8 layoutRole];
  if ([a1[5] isAnalogousToEntity:v8]) {
    BOOL v11 = [a1[5] layoutRole] != v10;
  }
  else {
    BOOL v11 = 0;
  }
  if ([a1[6] isAnalogousToEntity:v8]) {
    BOOL v12 = [a1[6] layoutRole] != v10;
  }
  else {
    BOOL v12 = 0;
  }
  if ([a1[7] isAnalogousToEntity:v8]) {
    BOOL v13 = [a1[7] layoutRole] != v10;
  }
  else {
    BOOL v13 = 0;
  }
  if ([a1[8] isAnalogousToEntity:v8]) {
    BOOL v14 = [a1[8] layoutRole] != v10;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v11 && !v12 && !v13 && !v14)
  {
    [v8 clearActivationSettings];
    id v15 = [v5 activationSettings];
    [v8 applyActivationSettings:v15];

    [v8 clearDeactivationSettings];
    uint64_t v16 = [v5 deactivationSettings];
    [v8 applyDeactivationSettings:v16];

    goto LABEL_23;
  }

LABEL_22:
  uint64_t v8 = +[SBWorkspaceEntity entity];
LABEL_23:

  return v8;
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a2 == 1 || a2 == 2;
  if (v2 || !SBLayoutRoleIsValidForSplitView(a2)) {
    goto LABEL_19;
  }
  uint64_t v5 = [*(id *)(a1 + 32) itemForLayoutRole:a2];
  if (!v5)
  {
    BOOL v11 = +[SBWorkspaceEntity entity];
    uint64_t v22 = v11;
    if (!v11) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v8 = [v6 uniqueIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = *(id *)(a1 + 40);
  }
  else
  {
    BOOL v12 = *(void **)(a1 + 48);
    BOOL v13 = [v6 bundleIdentifier];
    BOOL v14 = [v6 uniqueIdentifier];
    uint64_t v23 = [v12 _applicationSceneEntityFromApplicationBundleIdentifier:v13 uniqueIdentifier:v14 displayIdentity:*(void *)(a1 + 56)];

    id v10 = (id)v23;
  }
  uint64_t v22 = v10;
  if (!v10)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = *(void *)(a1 + 88);
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v21 = SBLayoutRoleDescription(a2);
    [v18 handleFailureInMethod:v19, v20, @"SBMainDisplayLayoutStateManager.m", 775, @"Failed to create additional side workspace entity from app layout's role: %@!", v21 object file lineNumber description];

LABEL_19:
    BOOL v11 = 0;
    goto LABEL_20;
  }

LABEL_14:
  if (![*(id *)(a1 + 64) isAdditiveModelEnabled]
    || (id v15 = *(void **)(a1 + 72),
        [v22 uniqueIdentifier],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        [v15 elementWithIdentifier:v16],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    [*(id *)(a1 + 80) setEntity:v22 forLayoutRole:a2];
  }
  BOOL v11 = v22;
LABEL_20:
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2 > 1;
  }
  if (!v2 || !SBLayoutRoleIsValidForSplitView(a2)) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
  if (v5
    || ([*(id *)(a1 + 32) previousEntityForLayoutRole:a2],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = v5;
    int v6 = [v5 isEmptyWorkspaceEntity];
    uint64_t v7 = v8;
    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
LABEL_14:
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = [a2 uniqueIdentifier];
  [v2 addObject:v3];
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2 >= 1;
  }
  if (v2 && SBLayoutRoleIsValidForSplitView(a2))
  {
    uint64_t v5 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
    int v6 = v5;
    if (!v5 || (v8 = v5, v7 = [v5 isEmptyWorkspaceEntity], int v6 = v8, v7)) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    }
  }
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2 >= 1;
  }
  if (v2 && SBLayoutRoleIsValidForSplitView(a2))
  {
    uint64_t v5 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
    int v6 = v5;
    if (!v5 || (v8 = v5, v7 = [v5 isEmptyWorkspaceEntity], int v6 = v8, v7)) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    }
  }
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 isPreviousWorkspaceEntity]) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 previousLayoutRole];
  uint64_t v8 = v6;
  if (v7)
  {
    if (v7 != 1) {
      goto LABEL_7;
    }
    uint64_t v8 = *(void **)(a1 + 32);
  }
  int v9 = (void *)[v8 copy];
  if (v9)
  {
    id v10 = v9;
    [v9 clearActivationSettings];
    BOOL v11 = [v5 activationSettings];
    [v10 applyActivationSettings:v11];

    [v10 clearDeactivationSettings];
    BOOL v12 = [v5 deactivationSettings];
    [v10 applyDeactivationSettings:v12];

    goto LABEL_8;
  }
LABEL_7:
  id v10 = +[SBWorkspaceEntity entity];
LABEL_8:

  return v10;
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_69(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) elementWithRole:a2];
  id v3 = [*(id *)(a1 + 32) layoutAttributesForElement:v8];
  uint64_t v4 = [v8 workspaceEntity];
  id v5 = [v4 applicationSceneEntity];

  uint64_t v6 = [v3 lastInteractionTime];
  if (v5)
  {
    uint64_t v7 = v6;
    if (v6 > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
    }
  }
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2_70(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) previousApplicationSceneEntityForLayoutRole:a2];
  if (v3)
  {
    id v6 = v3;
    uint64_t v4 = [v3 application];
    id v5 = [v4 bundleIdentifier];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [v5 isEqualToString:*(void *)(a1 + 40)];

    id v3 = v6;
  }
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3_83(uint64_t result, uint64_t a2)
{
  if (a2 < 5) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = [*(id *)(result + 32) entityForLayoutRole:a2];
  if (!v4)
  {
    id v6 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:a2];
    goto LABEL_7;
  }
  id v20 = v4;
  char v5 = [v4 isPreviousWorkspaceEntity];
  id v6 = v20;
  if (v5)
  {
LABEL_7:
    id v21 = v6;
    uint64_t v7 = *(void *)(v3 + 80);
    id v8 = [*(id *)(v3 + 32) previousEntityForLayoutRole:a2];
    uint64_t v9 = (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v21, v8);

    id v6 = (void *)v9;
  }
  id v22 = v6;
  if (([v6 isEmptyWorkspaceEntity] & 1) == 0)
  {
    result = [v22 isHomeScreenEntity];
    id v10 = v22;
    if ((result & 1) == 0)
    {
      if (!v22) {
        return result;
      }
      BOOL v11 = *(void **)(v3 + 40);
      if (v11)
      {
        char v12 = [v11 isAnalogousToEntity:v22];
        id v10 = v22;
        if (v12) {
          goto LABEL_19;
        }
      }
      BOOL v13 = *(void **)(v3 + 48);
      if (v13)
      {
        char v14 = [v13 isAnalogousToEntity:v10];
        id v10 = v22;
        if (v14) {
          goto LABEL_19;
        }
      }
      if ((id v15 = *(void **)(v3 + 56)) != 0
        && (v16 = [v15 isAnalogousToEntity:v10], id v10 = v22, (v16 & 1) != 0)
        || (uint64_t v17 = *(void **)(v3 + 64)) != 0
        && (char v18 = [v17 isAnalogousToEntity:v10], v10 = v22, (v18 & 1) != 0))
      {
LABEL_19:
        [*(id *)(v3 + 32) setEntity:0 forLayoutRole:a2];
      }
      else
      {
        [*(id *)(v3 + 32) setEntity:v10 forLayoutRole:*(void *)(*(void *)(*(void *)(v3 + 96) + 8) + 24)];
        uint64_t v19 = (*(void (**)(void))(*(void *)(v3 + 88) + 16))();
        if (v19)
        {
          [*(id *)(v3 + 72) addObject:v19];
          ++*(void *)(*(void *)(*(void *)(v3 + 96) + 8) + 24);
        }
      }
    }
  }
  return MEMORY[0x1F4181820]();
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4_85(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
  }

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6_87(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 uniqueIdentifier];
  id v8 = [v5 objectForKey:v7];

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 uniqueIdentifier];

  BOOL v11 = [v9 objectForKey:v10];

  char v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "lastInteractionTime"));
  BOOL v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "lastInteractionTime"));
  uint64_t v14 = [v12 compare:v13];

  return v14;
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8_93(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_9;
  v11[3] = &unk_1E6B04178;
  id v5 = v3;
  id v12 = v5;
  id v6 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v11);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 workspaceEntity];
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 layoutRole] == 4)
  {
    uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 layoutRole] == 3)
  {
    uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBPlatformController)_platformController
{
  return +[SBPlatformController sharedInstance];
}

- (id)_layoutStateForDisplayIdentity:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  uint64_t v5 = [v3 windowSceneManager];
  id v6 = [v5 windowSceneForDisplayIdentity:v4];

  uint64_t v7 = [v6 layoutStateProvider];
  id v8 = [v7 layoutState];

  return v8;
}

- (id)_sceneManagerForDisplayIdentity:(id)a3
{
  id v3 = a3;
  id v4 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v5 = [v4 sceneManagerForDisplayIdentity:v3];

  return v5;
}

- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3
{
  id v3 = a3;
  id v4 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  char v5 = [v4 _hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:v3];

  return v5;
}

- (id)_applicationSceneEntityFromApplicationBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = [(SBMainDisplayLayoutStateManager *)self _applicationController];
  id v12 = [v11 applicationWithBundleIdentifier:v10];

  if (v12)
  {
    BOOL v13 = [SBDeviceApplicationSceneEntity alloc];
    uint64_t v14 = [(SBMainDisplayLayoutStateManager *)self _sceneManagerForDisplayIdentity:v9];
    id v15 = [(SBDeviceApplicationSceneEntity *)v13 initWithApplication:v12 uniqueIdentifier:v8 sceneHandleProvider:v14 displayIdentity:v9];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_doesSceneIDSpecifyPrimaryScene:(uint64_t)a1 forApplicationIdentifier:(uint64_t)a2 sceneSessionRole:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Error decoding activation conditions for %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
}

@end