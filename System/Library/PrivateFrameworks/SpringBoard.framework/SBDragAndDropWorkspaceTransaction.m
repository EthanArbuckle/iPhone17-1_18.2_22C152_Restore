@interface SBDragAndDropWorkspaceTransaction
+ (BOOL)_shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4 isCurrentlyTracking:(BOOL)a5;
+ (BOOL)isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4;
+ (BOOL)shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4;
+ (CGRect)sourceSceneInterfaceOrientedBoundsForDropSession:(id)a3 switcherController:(id)a4;
+ (CGSize)prototypeSettingsFullscreenActivationRegionSize;
+ (UIEdgeInsets)_screenInsetsForUIDragDropSession:(id)a3;
+ (double)prototypeSettingsContentDraggingCommandeerInsetForUniversalControl;
+ (double)prototypeSettingsContentDraggingCommandeerWidth;
+ (double)prototypeSettingsContentDraggingFloatingActivationWidth;
+ (double)prototypeSettingsContentDraggingSideActivationWidth;
+ (double)prototypeSettingsSideActivationGutterSize;
+ (double)prototypeSettingsWindowTearOffDraggingFloatingActivationWidth;
+ (double)prototypeSettingsWindowTearOffDraggingSideActivationWidth;
+ (unint64_t)screenEdgeForDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5 screenInsets:(UIEdgeInsets)a6;
- (BOOL)_canBeInterrupted;
- (BOOL)_handleSessionDidUpdate:(id)a3;
- (BOOL)_shouldFailLayoutStateTransitionForWindowDrag;
- (BOOL)_showResizeUI;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (BOOL)isDragging;
- (BOOL)matchesApplicationDropSession:(id)a3;
- (BOOL)matchesUIDragDropSession:(id)a3;
- (CGRect)_platterFrameInSwitcherView;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (CGSize)_platterSizeForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5;
- (CGSize)_platterSizeForSwitcherDropContext:(id)a3 setDown:(BOOL)a4;
- (CGSize)_sizeForFloatingApplication;
- (SBDragAndDropWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 dropSession:(id)a5 delegate:(id)a6;
- (double)_platterScale;
- (double)_platterScaleForSwitcherDropContext:(id)a3;
- (double)_platterSourceViewScaleForSetDropAction:(int64_t)a3 setDown:(BOOL)a4;
- (id)_cornerRadiusConfigurationForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5 mode:(unint64_t)a6;
- (id)_cornerRadiusForSwitcherDragContext:(id)a3 setDown:(BOOL)a4 sourceViewScale:(double)a5;
- (id)_createPlatterPreviewForApplication:(id)a3 withSourceView:(id)a4 dropSession:(id)a5;
- (id)_currentGestureEventForGesture:(id)a3;
- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4;
- (id)_dragPreviewForDroppingItem:(id)a3 withDefault:(id)a4;
- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)_iconManager;
- (id)_transitionRequestForDropAction:(int64_t)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (id)resizeUIAnimationFactory;
- (int64_t)_layoutRoleForDropAction:(int64_t)a3;
- (void)_addChildWorkspaceTransaction:(id)a3;
- (void)_begin;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_cleanUpAndCompleteTransactionIfNecessary;
- (void)_commitRecencyModelUpdateForDropContext:(id)a3;
- (void)_configurePlatterPreview:(id)a3 forSceneHandle:(id)a4 completion:(id)a5;
- (void)_didComplete;
- (void)_didInterruptWithReason:(id)a3;
- (void)_displayLinkDidUpdate:(id)a3;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_endDragAndDropFluidGesture;
- (void)_getPlatterDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3 rimShadowParameters:(SBDragPreviewShadowParameters *)a4 diffuseFilters:(id *)a5 rimFilters:(id *)a6 forDropAction:(int64_t)a7 setDown:(BOOL)a8 mode:(unint64_t)a9 userInterfaceStyle:(int64_t)a10;
- (void)_handleSessionDidEnd:(id)a3;
- (void)_handleSessionDidPerformDrop:(id)a3;
- (void)_handleWillAnimateDropWithAnimator:(id)a3;
- (void)_interruptForDragExitedDropZoneIfNecessary;
- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3;
- (void)_runFinalLayoutStateTransaction;
- (void)_setupPlatterPreviewForContentDrag;
- (void)_uncommandeerContentDrag;
- (void)_updateActiveSourceViewProviderWithDragState:(unint64_t)a3;
- (void)_updateAnchorPointForPlatterPreview:(id)a3 dragPreview:(id)a4 withSourceViewBounds:(CGRect)a5 location:(CGPoint)a6;
- (void)_updateCurrentDropActionForSession:(id)a3;
- (void)_updateCurrentDropActionProposedLayoutState;
- (void)_updateForWindowDragForSession:(id)a3;
- (void)_updatePlatterPreviewForSetDown:(BOOL)a3 animated:(BOOL)a4;
- (void)_updatePlatterPreviewWithUpdatedSourceView;
- (void)_updatePlatterViewBlurForDropCompletion;
- (void)_willInterruptForTransitionRequest:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)blurReadinessDidChange;
- (void)dealloc;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4;
@end

@implementation SBDragAndDropWorkspaceTransaction

+ (BOOL)shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4
{
  return [a1 _shouldTrackLocationOfDropSession:a3 forSwitcherController:a4 isCurrentlyTracking:0];
}

+ (UIEdgeInsets)_screenInsetsForUIDragDropSession:(id)a3
{
  v4 = SBFSafeProtocolCast();
  double v5 = 0.0;
  double v6 = 0.0;
  if ([v4 _drivenByPointer])
  {
    v7 = +[SBWorkspace mainWorkspace];
    v8 = [v7 universalControlServer];
    char v9 = [v8 externalProcessActiveOnScreenEdges];

    if ((v9 & 2) != 0)
    {
      [a1 prototypeSettingsContentDraggingCommandeerInsetForUniversalControl];
      double v6 = v10;
    }
    if ((v9 & 8) != 0)
    {
      [a1 prototypeSettingsContentDraggingCommandeerInsetForUniversalControl];
      double v5 = v11;
    }
  }

  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v6;
  double v15 = v5;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

+ (BOOL)_shouldTrackLocationOfDropSession:(id)a3 forSwitcherController:(id)a4 isCurrentlyTracking:(BOOL)a5
{
  BOOL v5 = a5;
  v144[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 uiDragDropSession];
  double v11 = [v8 localContext];
  uint64_t v12 = [v11 startLocation];

  if (v12 == 8
    || (SBApplicationDropSessionGetDragItem(v10),
        double v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    double v14 = [v9 contentViewController];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v18 view];
    v20 = [v19 window];
    v21 = [v20 screen];
    v22 = [v21 fixedCoordinateSpace];

    v23 = [v18 view];
    [v10 locationInView:v23];
    double v25 = v24;
    double v27 = v26;

    v28 = [v18 view];
    objc_msgSend(v28, "convertPoint:toCoordinateSpace:", v22, v25, v27);
    CGFloat v112 = v30;
    CGFloat v113 = v29;

    v144[0] = *MEMORY[0x1E4FB38A8];
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:1];
    LODWORD(v20) = [v10 hasItemsConformingToTypeIdentifiers:v31];

    if (v20)
    {
      v32 = [(id)SBApp notificationDispatcher];
      v33 = [v32 bannerDestination];
      [v33 presentedBannerScreenFrame];
      CGRect v150 = CGRectInset(v149, -50.0, -50.0);
      CGFloat x = v150.origin.x;
      CGFloat y = v150.origin.y;
      CGFloat width = v150.size.width;
      CGFloat height = v150.size.height;

      v151.origin.CGFloat x = x;
      v151.origin.CGFloat y = y;
      v151.size.CGFloat width = width;
      v151.size.CGFloat height = height;
      v145.CGFloat y = v112;
      v145.CGFloat x = v113;
      if (CGRectContainsPoint(v151, v145)) {
        goto LABEL_15;
      }
    }
    v38 = [v18 view];
    [v38 bounds];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;

    UIRectInset();
    v146.CGFloat x = v25;
    v146.CGFloat y = v27;
    if (!CGRectContainsPoint(v152, v146))
    {
LABEL_15:
      char v51 = 0;
LABEL_64:

      goto LABEL_65;
    }
    if ([v9 isChamoisWindowingUIEnabled])
    {
      if ([v18 _areContinuousExposeStripsUnoccluded])
      {
        v47 = [v18 chamoisLayoutAttributes];
        [v47 stripWidth];
        double v49 = v48;
        if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
        {
          v153.origin.CGFloat x = v40;
          v153.origin.CGFloat y = v42;
          v153.size.CGFloat width = v44;
          v153.size.CGFloat height = v46;
          BOOL v50 = v25 > CGRectGetMaxX(v153) - v49;
        }
        else
        {
          v154.origin.CGFloat x = v40;
          v154.origin.CGFloat y = v42;
          v154.size.CGFloat width = v44;
          v154.size.CGFloat height = v46;
          BOOL v50 = v25 < v49 + CGRectGetMinX(v154);
        }
      }
      else
      {
        BOOL v50 = 0;
      }
      uint64_t v52 = [v8 dropZones];
      if (v52 == 1)
      {
        v53 = objc_msgSend(v18, "_itemContainerAtLocation:environment:", 0, v25, v27);
        v54 = v53;
        if (!v53 || ([v53 size], v44 != v56) || v46 != v55)
        {
          if (v54) {
            char v51 = 0;
          }
          else {
            char v51 = !v50;
          }

          goto LABEL_64;
        }
      }
      else if (!v52)
      {
        char v51 = !v50;
        goto LABEL_64;
      }
    }
    int v57 = objc_msgSend(a1, "isDragOverFullscreenRegionAtLocation:inBounds:", v25, v27, v40, v42, v44, v46);
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke;
    v138[3] = &unk_1E6B04BD8;
    id v140 = a1;
    double v141 = v25;
    double v142 = v27;
    id v139 = v10;
    v111 = (unsigned int (**)(double, double, double, double, __n128))MEMORY[0x1D948C7A0](v138);
    uint64_t v58 = [v8 dropZones];
    if (v58)
    {
      if (v58 != 2)
      {
        if (v58 == 1)
        {
          if (v5)
          {
            [a1 prototypeSettingsContentDraggingSideActivationWidth];
            double v60 = v59;
            [a1 prototypeSettingsContentDraggingFloatingActivationWidth];
            v62.n128_f64[0] = v60 + v61;
            if (v57) {
              goto LABEL_42;
            }
          }
          else
          {
            [a1 prototypeSettingsContentDraggingCommandeerWidth];
            v62.n128_u64[0] = v70;
            if (v57)
            {
LABEL_42:
              v71 = [v9 layoutState];
              uint64_t v132 = 0;
              v133 = &v132;
              uint64_t v134 = 0x3032000000;
              v135 = __Block_byref_object_copy__70;
              v136 = __Block_byref_object_dispose__70;
              id v137 = 0;
              uint64_t v126 = 0;
              v127 = (double *)&v126;
              uint64_t v128 = 0x4010000000;
              v129 = &unk_1D90ED3C6;
              long long v72 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
              long long v130 = *MEMORY[0x1E4F1DB28];
              long long v131 = v72;
              v119[0] = MEMORY[0x1E4F143A8];
              v119[1] = 3221225472;
              v119[2] = __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke_81;
              v119[3] = &unk_1E6B04C00;
              v122 = &v132;
              id v108 = v71;
              id v120 = v108;
              double v124 = v25;
              double v125 = v27;
              id v121 = v9;
              v123 = &v126;
              SBLayoutRoleEnumerateValidRoles(v119);
              v73 = [MEMORY[0x1E4F62490] sharedInstance];
              v74 = [(id)v133[5] uniqueIdentifier];
              id v109 = [v73 sceneWithIdentifier:v74];

              v75 = v109;
              if (v109)
              {
                v76 = [v109 clientSettings];
                int v77 = [v76 isUISubclass];

                if (v77)
                {
                  v78 = [v18 view];
                  objc_msgSend(v78, "convertRect:toCoordinateSpace:", v22, v127[4], v127[5], v127[6], v127[7]);
                  double v80 = v79;
                  double v82 = v81;
                  double v84 = v83;
                  double v86 = v85;

                  v87 = [v109 clientSettings];
                  [v87 multitaskingDragExclusionRects];
                  long long v117 = 0u;
                  long long v118 = 0u;
                  long long v115 = 0u;
                  long long v116 = 0u;
                  id obj = (id)objc_claimAutoreleasedReturnValue();
                  uint64_t v88 = [obj countByEnumeratingWithState:&v115 objects:v143 count:16];
                  v107 = v87;
                  if (v88)
                  {
                    uint64_t v89 = *(void *)v116;
                    char v90 = 1;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v88; ++i)
                      {
                        if (*(void *)v116 != v89) {
                          objc_enumerationMutation(obj);
                        }
                        [*(id *)(*((void *)&v115 + 1) + 8 * i) CGRectValue];
                        double v93 = v92;
                        double v95 = v94;
                        double v97 = v96;
                        double v99 = v98;
                        v100 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v22, v80, v82, v84, v86);
                        objc_msgSend(v100, "convertRect:toCoordinateSpace:", v22, v93, v95, v97, v99);
                        CGFloat v101 = v157.origin.x;
                        CGFloat v102 = v157.origin.y;
                        CGFloat v103 = v157.size.width;
                        CGFloat v104 = v157.size.height;
                        if (!CGRectIsNull(v157))
                        {
                          v158.origin.CGFloat x = v101;
                          v158.origin.CGFloat y = v102;
                          v158.size.CGFloat width = v103;
                          v158.size.CGFloat height = v104;
                          v148.CGFloat y = v112;
                          v148.CGFloat x = v113;
                          BOOL v105 = CGRectContainsPoint(v158, v148);
                          char v90 = !v105;
                          if (v105)
                          {

                            goto LABEL_60;
                          }
                        }
                      }
                      uint64_t v88 = [obj countByEnumeratingWithState:&v115 objects:v143 count:16];
                      if (v88) {
                        continue;
                      }
                      break;
                    }
                  }
                  else
                  {
                    char v90 = 1;
                  }
LABEL_60:

                  char v51 = v90 & 1;
                }
                else
                {
                  char v51 = 1;
                }
                v75 = v109;
              }
              else
              {
                char v51 = 1;
              }

              _Block_object_dispose(&v126, 8);
              _Block_object_dispose(&v132, 8);

              goto LABEL_63;
            }
          }
          if (v111[2](v40, v42, v44, v46, v62)) {
            goto LABEL_42;
          }
        }
        char v51 = 0;
LABEL_63:

        goto LABEL_64;
      }
      [a1 prototypeSettingsWindowTearOffDraggingSideActivationWidth];
      double v114 = v63;
      [a1 prototypeSettingsWindowTearOffDraggingFloatingActivationWidth];
      double v65 = v64;
      [a1 sourceSceneInterfaceOrientedBoundsForDropSession:v8 switcherController:v9];
      double v66 = v155.origin.x;
      double v67 = v155.origin.y;
      double v68 = v155.size.width;
      double v69 = v155.size.height;
      if (!CGRectIsNull(v155))
      {
        v156.origin.CGFloat x = v66;
        v156.origin.CGFloat y = v67;
        v156.size.CGFloat width = v68;
        v156.size.CGFloat height = v69;
        v147.CGFloat x = v25;
        v147.CGFloat y = v27;
        if (((v57 | !CGRectContainsPoint(v156, v147)) & 1) == 0)
        {
          char v51 = ((uint64_t (*)(double, double, double, double, double))v111[2])(v66, v67, v68, v69, (v114 + v65) * (v68 / v44));
          goto LABEL_63;
        }
      }
    }
    char v51 = 1;
    goto LABEL_63;
  }
  char v51 = 0;
LABEL_65:

  return v51;
}

BOOL __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v12 = *(void **)(a1 + 40);
  [v12 _screenInsetsForUIDragDropSession:*(void *)(a1 + 32)];
  return objc_msgSend(v12, "screenEdgeForDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:screenInsets:", *(double *)(a1 + 48), *(double *)(a1 + 56), a2, a3, a4, a5, a6, v13, v14, v15, v16) != 0;
}

void __113__SBDragAndDropWorkspaceTransaction__shouldTrackLocationOfDropSession_forSwitcherController_isCurrentlyTracking___block_invoke_81(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v4 || [v4 layoutRole] != 3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) elementWithRole:a2];
    double v6 = (void *)v5;
    if (v5)
    {
      id obj = (id)v5;
      v7 = *(void **)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      if (a2 == 3)
      {
        objc_msgSend(v8, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v7, "interfaceOrientation"), objc_msgSend(*(id *)(a1 + 32), "floatingConfiguration"));
        uint64_t v10 = v9;
        uint64_t v12 = v11;
        uint64_t v14 = v13;
        uint64_t v16 = v15;
      }
      else
      {
        v17 = [v7 appLayout];
        objc_msgSend(v8, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a2, v17, objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
        uint64_t v10 = v18;
        uint64_t v12 = v19;
        uint64_t v14 = v20;
        uint64_t v16 = v21;
      }
      int v22 = SBRectContainsPoint();
      double v6 = obj;
      if (v22)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
        double v6 = obj;
        v23 = *(void **)(*(void *)(a1 + 56) + 8);
        v23[4] = v10;
        v23[5] = v12;
        v23[6] = v14;
        v23[7] = v16;
      }
    }
  }
}

+ (CGRect)sourceSceneInterfaceOrientedBoundsForDropSession:(id)a3 switcherController:(id)a4
{
  id v5 = a4;
  double v6 = [a3 systemSession];
  v7 = [v6 info];

  id v8 = +[SBApplicationController sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "applicationWithPid:", objc_msgSend(v7, "processIdentifier"));

  uint64_t v10 = [v5 windowScene];
  uint64_t v11 = [v10 sceneManager];

  uint64_t v12 = [v9 bundleIdentifier];
  uint64_t v13 = [v7 sceneIdentifier];
  uint64_t v14 = [v11 sceneIdentifierForBundleIdentifier:v12 uniqueIdentifier:v13];

  uint64_t v15 = [v5 layoutState];
  uint64_t v16 = [v15 elementWithIdentifier:v14];
  v17 = v16;
  if (v16)
  {
    if ([v16 layoutRole] == 3)
    {
      objc_msgSend(v5, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v15, "interfaceOrientation"), objc_msgSend(v15, "floatingConfiguration"));
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      uint64_t v26 = [v5 interfaceOrientationForLayoutElement:v17];
      uint64_t v27 = [v17 layoutRole];
      v28 = [v15 appLayout];
      [v5 frameForItemWithRole:v27 inMainAppLayout:v28 interfaceOrientation:v26];
      double v19 = v29;
      double v21 = v30;
      double v23 = v31;
      double v25 = v32;
    }
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v33 = v19;
  double v34 = v21;
  double v35 = v23;
  double v36 = v25;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

+ (BOOL)isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [a1 prototypeSettingsFullscreenActivationRegionSize];
  SBRectWithSize();
  UIRectCenteredXInRect();
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

+ (unint64_t)screenEdgeForDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5 screenInsets:(UIEdgeInsets)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = a3.x;
  CGFloat v12 = a6.left + CGRectGetMinX(a4);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v13 = CGRectGetMinX(v19) + a5;
  if (v11 > v12 && v11 < v13) {
    return 2;
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxX(v20) - a6.right;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v16 = CGRectGetMaxX(v21) - a5;
  if (v11 >= v15 || v11 <= v16) {
    return 0;
  }
  else {
    return 8;
  }
}

- (SBDragAndDropWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 dropSession:(id)a5 delegate:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id obj = a4;
  id v69 = a5;
  id v66 = a6;
  v76.receiver = self;
  v76.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  double v64 = v10;
  double v11 = [(SBMainWorkspaceTransaction *)&v76 initWithTransitionRequest:v10];
  if (v11)
  {
    CGFloat v12 = [obj contentViewController];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        CGFloat v15 = v14;
      }
      else {
        CGFloat v15 = 0;
      }
    }
    else
    {
      CGFloat v15 = 0;
    }
    id v63 = v15;

    double v16 = [obj windowScene];
    id v67 = [v16 sceneManager];

    objc_storeWeak((id *)v11 + 26, obj);
    objc_storeWeak((id *)v11 + 27, v63);
    objc_storeWeak((id *)v11 + 28, v67);
    objc_storeWeak((id *)v11 + 29, v66);
    objc_storeStrong((id *)v11 + 33, a5);
    *((void *)v11 + 34) = 0;
    *((void *)v11 + 39) = 0;
    *(_OWORD *)(v11 + 344) = SBInvalidSize;
    v17 = objc_alloc_init(SBTouchHistory);
    double v18 = (void *)*((void *)v11 + 57);
    *((void *)v11 + 57) = v17;

    uint64_t v19 = +[SBMedusaDomain rootSettings];
    CGRect v20 = (void *)*((void *)v11 + 58);
    *((void *)v11 + 58) = v19;

    CGRect v21 = +[SBAppSwitcherDomain rootSettings];
    uint64_t v22 = [v21 chamoisSettings];
    double v23 = (void *)*((void *)v11 + 59);
    *((void *)v11 + 59) = v22;

    uint64_t v24 = [obj layoutState];
    double v25 = (void *)*((void *)v11 + 30);
    *((void *)v11 + 30) = v24;

    objc_storeStrong((id *)v11 + 31, *((id *)v11 + 30));
    double v65 = [v69 application];
    if (!v65)
    {
      uint64_t v58 = [MEMORY[0x1E4F28B00] currentHandler];
      [v58 handleFailureInMethod:a2 object:v11 file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:486 description:@"Cannot begin a drop app transaction without an application."];
    }
    uint64_t v26 = +[SBDraggingSystemManager sharedInstance];
    uint64_t v27 = [v69 systemSession];
    v28 = (objc_class *)objc_opt_class();
    double v29 = NSStringFromClass(v28);
    [v26 setCommandeered:1 forDraggingSystemSession:v27 forReason:v29];

    __n128 v62 = [v69 sceneIdentity];
    double v30 = [v67 displayIdentity];
    double v61 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v65 sceneIdentity:v62 displayIdentity:v30];

    uint64_t v31 = objc_opt_class();
    double v32 = [v67 fetchOrCreateApplicationSceneHandleForRequest:v61];
    uint64_t v33 = SBSafeCast(v31, v32);
    double v34 = (void *)*((void *)v11 + 35);
    *((void *)v11 + 35) = v33;

    if (!*((void *)v11 + 35))
    {
      double v59 = [MEMORY[0x1E4F28B00] currentHandler];
      [v59 handleFailureInMethod:a2 object:v11 file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:492 description:@"Not dragging a valid application. _draggingApplicationSceneHandle is nil."];
    }
    double v35 = [*((id *)v11 + 33) localContext];
    BOOL v36 = [v35 startLocation] == 8;

    if (v36)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v37 = [*((id *)v11 + 31) elements];
      uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v73;
        while (2)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v73 != v39) {
              objc_enumerationMutation(v37);
            }
            double v41 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            double v42 = [v41 uniqueIdentifier];
            double v43 = [*((id *)v11 + 35) sceneIdentifier];
            int v44 = [v42 isEqualToString:v43];

            if (v44)
            {
              id v45 = v41;
              goto LABEL_22;
            }
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v77 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
      id v45 = 0;
LABEL_22:

      double v46 = (void *)*((void *)v11 + 45);
      *((void *)v11 + 45) = v45;
    }
    uint64_t v47 = objc_opt_class();
    double v48 = [v69 localContext];
    double v49 = [v48 portaledPreview];
    BOOL v50 = SBSafeCast(v47, v49);

    objc_storeStrong((id *)v11 + 51, v50);
    char v51 = [v69 uiDragDropSession];
    uint64_t v52 = SBFSafeProtocolCast();

    if (v52)
    {
      v11[288] = 1;
      if (!v50) {
        [v11 _setupPlatterPreviewForContentDrag];
      }
    }
    objc_initWeak(&location, v11);
    id v53 = MEMORY[0x1E4F14428];
    v54 = objc_msgSend(NSString, "stringWithFormat:", @"SpringBoard - DragAndDropTransaction - %p", v11);
    objc_copyWeak(&v70, &location);
    uint64_t v55 = BSLogAddStateCaptureBlockWithTitle();
    double v56 = (void *)*((void *)v11 + 62);
    *((void *)v11 + 62) = v55;

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
  }
  return (SBDragAndDropWorkspaceTransaction *)v11;
}

id __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F4F718] builderWithObject:WeakRetained];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke_2;
    uint64_t v9 = &unk_1E6AF5290;
    id v10 = v2;
    id v11 = WeakRetained;
    id v3 = v2;
    [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
    v4 = objc_msgSend(v3, "build", v6, v7, v8, v9);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __103__SBDragAndDropWorkspaceTransaction_initWithTransitionRequest_switcherController_dropSession_delegate___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 272) withName:@"sessionState"];
  id v3 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 312) withName:@"currentDropAction"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 376) withName:@"sceneUpdateTransactionForWindowDrag"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 400) withName:@"pendingSceneUpdatesTransactions"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 176) withName:@"transitionRequest"];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBDragAndDropWorkspaceTransaction *)&v3 dealloc];
}

- (void)_setupPlatterPreviewForContentDrag
{
  if (!self->_activePlatterPreview)
  {
    objc_super v3 = self->_dropSession;
    id v4 = [(SBApplicationDropSession *)v3 uiDragDropSession];
    id v5 = SBFSafeProtocolCast();

    uint64_t v6 = SBApplicationDropSessionGetDragItem(v5);
    uint64_t v7 = SBFSafeProtocolCast();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke;
    v10[3] = &unk_1E6B04C50;
    v10[4] = self;
    id v11 = v3;
    id v12 = v6;
    id v8 = v6;
    uint64_t v9 = v3;
    [v7 requestVisibleItems:v10];
  }
}

void __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke(uint64_t a1, void *a2)
{
  ++*(void *)(*(void *)(a1 + 32) + 424);
  objc_super v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3 || *(void *)(v4 + 424) >= 4uLL)
  {
    objc_storeStrong((id *)(v4 + 432), v3);
    id v5 = [*(id *)(a1 + 40) application];
    uint64_t v6 = [*(id *)(a1 + 32) _createPlatterPreviewForApplication:v5 withSourceView:v3 dropSession:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _configurePlatterPreview:v6 forSceneHandle:*(void *)(*(void *)(a1 + 32) + 280) completion:0];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:10.0];
    [v6 setCornerRadiusConfiguration:v7];

    [v6 layoutIfNeeded];
    id v8 = *(void **)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_2;
    v15[3] = &unk_1E6B04C28;
    id v9 = v6;
    id v16 = v9;
    id v17 = *(id *)(a1 + 40);
    [v8 setPreviewProvider:v15];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 408);
    *(void *)(v10 + 408) = v9;
    id v12 = v9;
  }
  else
  {
    dispatch_time_t v13 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_3;
    block[3] = &unk_1E6AF4AC0;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
}

id __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F429A8]) initWithView:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) isWindowTearOff])
  {
    [*(id *)(a1 + 32) bounds];
    double v4 = 33.0 / v3;
  }
  else
  {
    double v4 = 0.5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAnchorPoint:", 0.5, v4);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v2, "setPreferredAnchorPoint:", 0.5 * v5, v4 * v6);
  objc_msgSend(v2, "set_springboardPlatterStyle:", 1);
  [v2 setAvoidAnimation:1];
  return v2;
}

uint64_t __71__SBDragAndDropWorkspaceTransaction__setupPlatterPreviewForContentDrag__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRunning];
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _setupPlatterPreviewForContentDrag];
  }
  return result;
}

+ (double)prototypeSettingsSideActivationGutterSize
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 draggingPlatterSideActivationGutterPadding];
  double v4 = v3;

  return v4;
}

+ (CGSize)prototypeSettingsFullscreenActivationRegionSize
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 draggingPlatterFullscreenActivationRegionWidth];
  double v4 = v3;
  [v2 draggingPlatterFullscreenActivationRegionHeight];
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

+ (double)prototypeSettingsContentDraggingCommandeerInsetForUniversalControl
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 contentDraggingCommandeerGutterInsetForUniversalControl];
  double v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingCommandeerWidth
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 contentDraggingCommandeerGutterWidth];
  double v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingSideActivationWidth
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 contentDraggingSideActivationGutterWidth];
  double v4 = v3;

  return v4;
}

+ (double)prototypeSettingsContentDraggingFloatingActivationWidth
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 contentDraggingFloatingActivationGutterWidth];
  double v4 = v3;

  return v4;
}

+ (double)prototypeSettingsWindowTearOffDraggingSideActivationWidth
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 windowTearOffDraggingSideActivationGutterWidth];
  double v4 = v3;

  return v4;
}

+ (double)prototypeSettingsWindowTearOffDraggingFloatingActivationWidth
{
  id v2 = +[SBMedusaDomain rootSettings];
  [v2 windowTearOffDraggingFloatingActivationGutterWidth];
  double v4 = v3;

  return v4;
}

- (BOOL)matchesApplicationDropSession:(id)a3
{
  return self->_dropSession == a3;
}

- (BOOL)matchesUIDragDropSession:(id)a3
{
  id v4 = a3;
  id v5 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];

  if (v5 == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    double v6 = SBFSafeProtocolCast();
    double v7 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
    double v8 = [v6 localDragSession];
    BOOL v9 = v7 == v8;
  }
  return v9;
}

- (void)blurReadinessDidChange
{
}

- (BOOL)isDragging
{
  return [(SBDragAndDropWorkspaceTransaction *)self isWaitingForMilestone:@"SBDragAndDropAppActivationDraggingMilestone"];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  double v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"SBDragAndDropWorkspaceTransaction.m", 659, @"%s shouldn't be forwarded to %@", "-[SBDragAndDropWorkspaceTransaction dragInteraction:itemsForBeginningSession:]", v8 object file lineNumber description];

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = SBSafeCast(v10, v9);

  if (!v11)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:665 description:@"We can only provide lift previews for window drags."];
  }
  id v12 = self->_dropSession;
  dispatch_time_t v13 = [(SBApplicationDropSession *)v12 application];
  id v14 = [v11 sourceViewProvider];
  CGFloat v15 = [v14 sourceView];
  id v16 = [(SBDragAndDropWorkspaceTransaction *)self _createPlatterPreviewForApplication:v13 withSourceView:v15 dropSession:v12];
  id v17 = [v14 initialCornerRadiusConfiguration];
  [(SBAppPlatterDragPreview *)v16 setCornerRadiusConfiguration:v17];

  [v14 initialDiffuseShadowParameters];
  -[SBAppPlatterDragPreview setDiffuseShadowParameters:](v16, "setDiffuseShadowParameters:");
  [v14 initialRimShadowParameters];
  -[SBAppPlatterDragPreview setRimShadowParameters:](v16, "setRimShadowParameters:");
  double v18 = [v14 initialDiffuseShadowFilters];
  [(SBAppPlatterDragPreview *)v16 setDiffuseShadowFilters:v18];

  uint64_t v19 = [v14 initialRimShadowFilters];
  [(SBAppPlatterDragPreview *)v16 setRimShadowFilters:v19];

  [(SBAppPlatterDragPreview *)v16 setDragState:1];
  [(SBAppPlatterDragPreview *)v16 layoutIfNeeded];
  activePlatterPreview = self->_activePlatterPreview;
  self->_activePlatterPreview = v16;
  CGRect v21 = v16;

  activeSourceViewProvider = self->_activeSourceViewProvider;
  self->_activeSourceViewProvider = (SBAppPlatterDragSourceViewProviding *)v14;
  id v23 = v14;

  [(SBDragAndDropWorkspaceTransaction *)self _updateActiveSourceViewProviderWithDragState:1];
  uint64_t v24 = [(SBApplicationDropSession *)v12 localContext];
  [v24 setPortaledPreview:v21];

  id v25 = objc_alloc(MEMORY[0x1E4F42ED0]);
  uint64_t v26 = (void *)[v25 initWithView:v21];
  objc_msgSend(v26, "set_springboardPlatterStyle:", 1);
  [v8 locationInView:v15];

  [v15 bounds];
  -[SBDragAndDropWorkspaceTransaction _updateAnchorPointForPlatterPreview:dragPreview:withSourceViewBounds:location:](self, "_updateAnchorPointForPlatterPreview:dragPreview:withSourceViewBounds:location:", v21, v26);

  return v26;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  self->_windowLiftAnimationCompleted = 1;
  [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:0 animated:1];
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!self->_beganTrackingDropSession && !self->_performedDrop) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidUpdate:v6];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v8 = a4;
  char v7 = [(SBDragAndDropWorkspaceTransaction *)self isInterrupted];
  if (!a5 && (v7 & 1) == 0) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidPerformDrop:v8];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8 = a4;
  char v7 = [(SBDragAndDropWorkspaceTransaction *)self isInterrupted];
  if (!a5 && (v7 & 1) == 0) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidEnd:v8];
  }
  [(SBAppPlatterDragPreview *)self->_activePlatterPreview draggingSourceDroppedWithOperation:a5];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0
    && [(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:self->_currentDropAction])
  {
    id v9 = [(SBDragAndDropWorkspaceTransaction *)self _dragPreviewForDroppingItem:v7 withDefault:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6 = a5;
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0
    && [(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:self->_currentDropAction])
  {
    [(SBDragAndDropWorkspaceTransaction *)self _handleWillAnimateDropWithAnimator:v6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__SBDragAndDropWorkspaceTransaction_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
    v7[3] = &unk_1E6AF8788;
    v7[4] = self;
    [v6 addCompletion:v7];
  }
}

uint64_t __88__SBDragAndDropWorkspaceTransaction_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) draggingSourceCancelAnimationCompleted];
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  [(SBAppPlatterDragPreview *)self->_activePlatterPreview draggingSourceCancelAnimationCompleted];
  id v4 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
  [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidEnd:v4];
}

- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  return [(SBMedusaSettings *)self->_medusaSettings dropAnimationSettings];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  self->_beganTrackingDropSession = 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  self->_beganTrackingDropSession = 1;
  id v5 = a4;
  BOOL v6 = [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidUpdate:v5];
  int v7 = [v5 allowsMoveOperation];

  if (v7) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F429D8]);
  if (v6) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (void *)[v9 initWithDropOperation:v10];
  [v11 _setPreferredBadgeStyle:1];
  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  if (!self->_performedDrop) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidUpdate:a4];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0) {
    self->_sessionState = 2;
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v7 = a4;
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    if (!self->_performedDrop)
    {
      if (self->_currentDropAction)
      {
        self->_currentDropAction = 0;
        [(SBDragAndDropWorkspaceTransaction *)self _updateCurrentDropActionProposedLayoutState];
      }
      objc_storeStrong((id *)&self->_finalLayoutState, self->_currentLayoutState);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
      BOOL v6 = [(SBWorkspaceTransitionRequest *)self->super.super._transitionRequest applicationContext];
      [WeakRetained performTransitionWithContext:v6 animated:1 completion:0];

      [(SBDragAndDropWorkspaceTransaction *)self _cleanUpAndCompleteTransactionIfNecessary];
    }
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidEnd:v7];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(SBDragAndDropWorkspaceTransaction *)self _dragPreviewForDroppingItem:v7 withDefault:v8];
  }

  return v9;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6 = a5;
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleWillAnimateDropWithAnimator:v6];
  }
}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  int64_t currentDropAction = self->_currentDropAction;
  medusaSettings = self->_medusaSettings;
  if (currentDropAction == 10) {
    [(SBMedusaSettings *)medusaSettings switcherCardDropAnimationSettings];
  }
  else {
  id v6 = [(SBMedusaSettings *)medusaSettings dropAnimationSettings];
  }
  return v6;
}

- (void)_interruptForDragExitedDropZoneIfNecessary
{
  if (self->_dragExitedDropZone && !self->_animatingPlatterPreview) {
    [(SBDragAndDropWorkspaceTransaction *)self interruptWithReason:@"User moved system content drag outside drop boundaries."];
  }
}

- (BOOL)_handleSessionDidUpdate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBSwitcherChamoisSettings *)self->_chamoisSettings maximumNumberOfAppsOnStage];
  id v6 = [(SBMainDisplayLayoutState *)self->_initialLayoutState appLayout];
  id v7 = [v6 allItems];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke;
  v28[3] = &unk_1E6AF4B38;
  id v29 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "bs_filter:", v28);
  unint64_t v10 = [v9 count];

  if (v10 >= v5
    && [(SBSwitcherChamoisSettings *)self->_chamoisSettings rejectDropsWhenStageIsFull])
  {
    goto LABEL_8;
  }
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    uint64_t v11 = objc_opt_class();
    dropSession = self->_dropSession;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    LODWORD(v11) = [(id)v11 _shouldTrackLocationOfDropSession:dropSession forSwitcherController:WeakRetained isCurrentlyTracking:1];

    char v14 = v11 ^ 1;
    if (self->_dragExitedDropZone != (v11 ^ 1))
    {
      self->_dragExitedDropZone = v14;
      CGFloat v15 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
      id v16 = SBApplicationDropSessionGetDragItem(v15);

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke_2;
      v26[3] = &unk_1E6B04C78;
      v26[4] = self;
      char v27 = v14;
      [v16 setPreviewProvider:v26];
      [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:0 animated:1];
    }
    [(SBDragAndDropWorkspaceTransaction *)self _interruptForDragExitedDropZoneIfNecessary];
  }
  if ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted])
  {
LABEL_8:
    BOOL v17 = 0;
  }
  else
  {
    self->_sessionState = 1;
    id v18 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    uint64_t v19 = [v18 view];
    [v4 locationInView:v19];
    double v21 = v20;
    double v23 = v22;

    -[SBTouchHistory updateWithLocation:timestamp:](self->_touchHistory, "updateWithLocation:timestamp:", v21, v23, CACurrentMediaTime());
    [(SBDragAndDropWorkspaceTransaction *)self _updateForWindowDragForSession:v4];
    [(SBDragAndDropWorkspaceTransaction *)self _updateCurrentDropActionForSession:v4];
    [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:0 animated:1];
    [(SBFluidSwitcherGesture *)self->_dragAndDropGesture _setState:2];
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    [v24 dragAndDropTransaction:self didUpdateGesture:self->_dragAndDropGesture];

    BOOL v17 = self->_currentDropAction != 0;
  }

  return v17;
}

BOOL __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) layoutRoleForItem:a2];
  return SBLayoutRoleIsValidForSplitView(v2);
}

id __61__SBDragAndDropWorkspaceTransaction__handleSessionDidUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F429A8]) initWithView:*(void *)(*(void *)(a1 + 32) + 408)];
  [*(id *)(*(void *)(a1 + 32) + 432) bounds];
  double v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    double v5 = 0.5;
  }
  else
  {
    double v5 = 0.5;
    if (![*(id *)(*(void *)(a1 + 32) + 264) isWindowTearOff])
    {
      double v6 = 0.5;
      goto LABEL_6;
    }
  }
  double v6 = 0.5;
  if (v4 > 0.0) {
    double v6 = 33.0 / v4;
  }
LABEL_6:
  [*(id *)(*(void *)(a1 + 32) + 408) bounds];
  objc_msgSend(v2, "setPreferredAnchorPoint:", v5 * v7, v6 * v8);
  objc_msgSend(v2, "set_springboardPlatterStyle:", 1);
  [v2 setAvoidAnimation:1];
  return v2;
}

- (void)_commitRecencyModelUpdateForDropContext:(id)a3
{
  if (a3)
  {
    p_switcherController = &self->_switcherController;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_switcherController);
    [WeakRetained _performSwitcherDropWithContext:v4];
  }
}

- (void)_handleSessionDidPerformDrop:(id)a3
{
  if (([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    self->_performedDrop = 1;
    self->_sessionState = 2;
    [(CADisplayLink *)self->_displayLinkForWindowDrag invalidate];
    displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    int64_t currentDropAction = self->_currentDropAction;
    if (currentDropAction == 10)
    {
      [(SBDragAndDropWorkspaceTransaction *)self _commitRecencyModelUpdateForDropContext:self->_currentSwitcherDropRegionContext];
      int64_t currentDropAction = self->_currentDropAction;
    }
    double v6 = [(SBDragAndDropWorkspaceTransaction *)self _transitionRequestForDropAction:currentDropAction];
    dropTransitionRequest = self->_dropTransitionRequest;
    self->_dropTransitionRequest = v6;

    double v8 = +[SBWorkspace mainWorkspace];
    char v9 = [v8 canExecuteTransitionRequest:self->_dropTransitionRequest];

    if (v9)
    {
      if ([(SBDragAndDropWorkspaceTransaction *)self _shouldFailLayoutStateTransitionForWindowDrag])
      {
        objc_storeStrong((id *)&self->_currentLayoutState, self->_initialLayoutState);
      }
      if (![(SBWorkspaceTransitionRequest *)self->_dropTransitionRequest isFinalized])
      {
        [(SBMainWorkspaceTransitionRequest *)self->_dropTransitionRequest finalize];
        unint64_t v10 = [(SBWorkspaceTransitionRequest *)self->_dropTransitionRequest applicationContext];
        uint64_t v11 = [v10 layoutState];

        finalLayoutState = self->_finalLayoutState;
        self->_finalLayoutState = v11;
      }
    }
    else
    {
      [(SBDragAndDropWorkspaceTransaction *)self _cleanUpAndCompleteTransactionIfNecessary];
    }
  }
}

- (id)_dragPreviewForDroppingItem:(id)a3 withDefault:(id)a4
{
  int64_t currentDropAction = self->_currentDropAction;
  id v7 = a4;
  int64_t v8 = [(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:currentDropAction];
  if (!v8)
  {
    double v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:966 description:@"Shouldn't be asking for a preview if we're cancelling the drop."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  unint64_t v10 = [WeakRetained view];
  uint64_t v11 = [(SBWorkspaceTransaction *)self windowScene];
  id v12 = [v11 switcherController];

  int64_t v13 = self->_currentDropAction;
  if (v13 != 10)
  {
LABEL_9:
    if (v13 == 9)
    {
      int64_t v19 = [(SBLayoutState *)self->_finalLayoutState interfaceOrientation];
      double v20 = v12;
      int64_t v21 = 4;
    }
    else if (v13 == 8)
    {
      int64_t v19 = [(SBLayoutState *)self->_finalLayoutState interfaceOrientation];
      double v20 = v12;
      int64_t v21 = 3;
    }
    else
    {
      finalLayoutState = self->_finalLayoutState;
      if (v8 != 3)
      {
        id v24 = [(SBMainDisplayLayoutState *)finalLayoutState appLayout];
        objc_msgSend(v12, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v8, v24, -[SBLayoutState interfaceOrientation](self->_finalLayoutState, "interfaceOrientation"));

        goto LABEL_19;
      }
      uint64_t v23 = [(SBLayoutState *)finalLayoutState interfaceOrientation];
      int64_t v21 = [(SBMainDisplayLayoutState *)self->_finalLayoutState floatingConfiguration];
      double v20 = v12;
      int64_t v19 = v23;
    }
    [v20 frameForFloatingAppLayoutInInterfaceOrientation:v19 floatingConfiguration:v21];
    goto LABEL_19;
  }
  if (![(SBSwitcherDropRegionContext *)self->_currentSwitcherDropRegionContext currentDropRegion])
  {
    int64_t v13 = self->_currentDropAction;
    goto LABEL_9;
  }
  char v14 = self->_currentSwitcherDropRegionContext;
  unint64_t v15 = [(SBSwitcherDropRegionContext *)v14 currentDropRegion];
  if (v15 <= 7)
  {
    if (((1 << v15) & 0x78) != 0)
    {
      id v16 = [(SBSwitcherDropRegionContext *)v14 finalTargetAppLayout];
      BOOL v17 = [(SBSwitcherDropRegionContext *)v14 draggingLeafAppLayout];
      id v18 = [v17 itemForLayoutRole:1];

      objc_msgSend(WeakRetained, "scaledFrameForLayoutRole:inAppLayout:", objc_msgSend(v16, "layoutRoleForItem:", v18), v16);
    }
    else
    {
      [(SBSwitcherDropRegionContext *)v14 originRect];
    }
  }

LABEL_19:
  id v25 = objc_alloc(MEMORY[0x1E4F429B8]);
  UIRectGetCenter();
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v31[0] = *MEMORY[0x1E4F1DAB8];
  v31[1] = v26;
  v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  char v27 = objc_msgSend(v25, "initWithContainer:center:transform:", v10, v31);
  v28 = [v7 retargetedPreviewWithTarget:v27];

  objc_msgSend(v28, "set_springboardPlatterStyle:", 1);
  return v28;
}

- (void)_handleWillAnimateDropWithAnimator:(id)a3
{
  id v4 = a3;
  [(SBDragAndDropWorkspaceTransaction *)self addMilestone:@"SBDragAndDropAppActivationDropAnimationMilestone"];
  double v5 = [(SBWorkspaceTransaction *)self windowScene];
  double v6 = [v5 floatingDockController];
  [v6 dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
  id v7 = [MEMORY[0x1E4FA62D0] sharedInstance];
  [v7 dismissAppIconForceTouchControllers:0];

  int64_t v8 = [(SBDragAndDropWorkspaceTransaction *)self _iconManager];
  [v8 dismissIconShareSheets];

  [(SBDragAndDropWorkspaceTransaction *)self addMilestone:@"SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke;
  v10[3] = &unk_1E6AF4AC0;
  v10[4] = self;
  [v4 addAnimations:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_3;
  v9[3] = &unk_1E6AF8788;
  v9[4] = self;
  [v4 addCompletion:v9];
}

void __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePlatterPreviewForSetDown:1 animated:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_2;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _runFinalLayoutStateTransaction];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 removeMilestone:@"SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone"];
}

void *__72__SBDragAndDropWorkspaceTransaction__handleWillAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isComplete] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 304) _stopDelayingTransitionCompletionForRequester:@"SBToAppsDelayTransitionCompletionForDropAnimation"];
    [*(id *)(a1 + 32) _updatePlatterViewBlurForDropCompletion];
    id v2 = *(id *)(*(void *)(a1 + 32) + 408);
    [v2 dropDestinationAnimationCompleted];
    [*(id *)(a1 + 32) removeMilestone:@"SBDragAndDropAppActivationDropAnimationMilestone"];
    *(unsigned char *)(*(void *)(a1 + 32) + 337) = 1;
  }
  CGSize result = *(void **)(a1 + 32);
  if (result[39] == 10)
  {
    uint64_t v4 = result[40];
    return (void *)[result _noteSwitcherDropAnimationCompletedWithContext:v4];
  }
  return result;
}

- (void)_handleSessionDidEnd:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4FA7530];
  uint64_t v4 = [NSNumber numberWithInteger:self->_currentDropAction];
  v13[0] = v4;
  v12[1] = *MEMORY[0x1E4FA7528];
  double v5 = NSNumber;
  double v6 = [(SBApplicationDropSession *)self->_dropSession localContext];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "startLocation"));
  v13[1] = v7;
  int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  char v9 = (void *)MEMORY[0x1E4FA5E78];
  id v10 = v8;
  uint64_t v11 = [v9 sharedInstance];
  [v11 emitEvent:32 withPayload:v10];

  self->_sessionState = 2;
  [(SBDragAndDropWorkspaceTransaction *)self _uncommandeerContentDrag];
  [(SBDragAndDropWorkspaceTransaction *)self removeMilestone:@"SBDragAndDropAppActivationDraggingMilestone"];
}

- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3
{
  p_switcherController = &self->_switcherController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherController);
  [WeakRetained _noteSwitcherDropAnimationCompletedWithContext:v4];
}

- (void)_uncommandeerContentDrag
{
  double v3 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
  SBApplicationDropSessionGetDragItem(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v8 setPreviewProvider:0];
  id v4 = +[SBDraggingSystemManager sharedInstance];
  double v5 = [(SBApplicationDropSession *)self->_dropSession systemSession];
  double v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v4 setCommandeered:0 forDraggingSystemSession:v5 forReason:v7];
}

- (void)_displayLinkDidUpdate:(id)a3
{
  id v4 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
  -[SBDragAndDropWorkspaceTransaction _updateForWindowDragForSession:](self, "_updateForWindowDragForSession:");
  if (self->_windowDragEnteredPlatterZone) {
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidUpdate:v4];
  }
}

- (void)_updateForWindowDragForSession:(id)a3
{
  id v4 = a3;
  if (self->_layoutElementForWindowDrag && !self->_windowDragEnteredPlatterZone)
  {
    if (!self->_displayLinkForWindowDrag)
    {
      double v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkDidUpdate_];
      displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
      self->_displayLinkForWindowDrag = v5;

      [(CADisplayLink *)self->_displayLinkForWindowDrag setPaused:0];
      id v7 = self->_displayLinkForWindowDrag;
      id v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_int64_t windowDragPauseCounter = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    id v10 = [WeakRetained view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v4 locationInView:v10];
    double v20 = v19;
    double v22 = v21;
    [(id)objc_opt_class() prototypeSettingsContentDraggingCommandeerWidth];
    double v24 = v23;
    [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
    if (BSFloatLessThanFloat()
      && ((objc_msgSend((id)objc_opt_class(), "isDragOverFullscreenRegionAtLocation:inBounds:", v20, v22, v12, v14, v16, v18) & 1) != 0|| -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole") == 3&& (id v25 = objc_opt_class(), objc_msgSend((id)objc_opt_class(), "_screenInsetsForUIDragDropSession:", v4), objc_msgSend(v25, "screenEdgeForDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:screenInsets:", v20, v22, v12, v14, v16,
             v18,
             v24,
             v26,
             v27,
             v28,
             v29))))
    {
      ++self->_windowDragPauseCounter;
    }
    else
    {
      self->_int64_t windowDragPauseCounter = 0;
    }
    double v30 = SBScreenMaximumFramesPerSecond();
    if (v22 <= 150.0)
    {
      double v30 = v30 * 0.05;
      int64_t windowDragPauseCounter = self->_windowDragPauseCounter;
      self->_windowDragEnteredPlatterZone = windowDragPauseCounter > (uint64_t)v30;
      if (windowDragPauseCounter <= (uint64_t)v30)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      self->_windowDragEnteredPlatterZone = 1;
    }
    [(CADisplayLink *)self->_displayLinkForWindowDrag invalidate];
    double v32 = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    uint64_t v33 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    [(SBWorkspaceTransitionContext *)v33 setAnimationDisabled:1];
    int64_t v34 = [(SBLayoutElement *)self->_layoutElementForWindowDrag layoutRole];
    int64_t v35 = v34;
    id v69 = v10;
    if (v34 == 1)
    {
      BOOL v36 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];
      [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v36 forLayoutRole:1];

      v37 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v37 forLayoutRole:2];
    }
    else
    {
      if (v34 != 2)
      {
        if (v34 == 3)
        {
          int v44 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v44 forLayoutRole:1];

          id v45 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v45 forLayoutRole:2];
        }
        else
        {
          if (v34 != 4)
          {
LABEL_25:
            double v49 = [(SBWorkspaceTransaction *)self transitionRequest];
            BOOL v50 = [v49 workspace];
            char v51 = [v49 displayConfiguration];
            uint64_t v52 = [v50 createRequestWithOptions:0 displayConfiguration:v51];

            objc_msgSend(v52, "setSource:", objc_msgSend(v49, "source"));
            [v52 setEventLabel:@"DragAndDropAppActivation"];
            [v52 setApplicationContext:v33];
            [v52 finalize];
            objc_storeStrong((id *)&self->super.super._transitionRequest, v52);
            id v53 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
            [v53 beginTransitionForWorkspaceTransaction:self];

            unint64_t v54 = SBLayoutRoleMaskAppLayout();
            if (SBLayoutRoleMaskContainsRole(v54, [(SBLayoutElement *)self->_layoutElementForWindowDrag layoutRole]))
            {
              uint64_t v55 = [v52 applicationContext];
              double v56 = [v55 layoutState];
              int v57 = [v56 elementWithRole:1];

              uint64_t v58 = [v57 workspaceEntity];
              double v59 = [v58 applicationSceneEntity];

              double v60 = [[SBApplicationSceneUpdateTransaction alloc] initWithApplicationSceneEntity:v59 transitionRequest:v52];
              sceneUpdateTransactionForWindowDrag = self->_sceneUpdateTransactionForWindowDrag;
              self->_sceneUpdateTransactionForWindowDrag = v60;

              __n128 v62 = (void *)*MEMORY[0x1E4F43630];
              v70[0] = MEMORY[0x1E4F143A8];
              v70[1] = 3221225472;
              v70[2] = __68__SBDragAndDropWorkspaceTransaction__updateForWindowDragForSession___block_invoke;
              v70[3] = &unk_1E6AF4AC0;
              v70[4] = self;
              objc_msgSend(v62, "sb_performBlockAfterCATransactionSynchronizedCommit:", v70);
            }
            id v63 = [v52 applicationContext];
            double v64 = [v63 layoutState];
            currentLayoutState = self->_currentLayoutState;
            self->_currentLayoutState = v64;

            id v66 = objc_loadWeakRetained((id *)&self->_delegate);
            id v67 = [(SBDeviceApplicationSceneHandle *)self->_draggingApplicationSceneHandle sceneIdentifier];
            [v66 dragAndDropTransaction:self didPlatterizeWindowDragWithSceneIdentifier:v67];

            double v68 = [(SBWorkspaceTransitionRequest *)self->super.super._transitionRequest applicationContext];
            [WeakRetained performTransitionWithContext:v68 animated:1 completion:0];

            id v10 = v69;
            goto LABEL_28;
          }
          double v46 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v46 forLayoutRole:1];

          uint64_t v47 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v47 forLayoutRole:2];

          double v48 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v48 forLayoutRole:3];
        }
        double v40 = +[SBWorkspaceEntity entity];
        double v42 = v33;
        double v43 = v40;
        uint64_t v41 = v35;
LABEL_24:
        [(SBWorkspaceApplicationSceneTransitionContext *)v42 setEntity:v43 forLayoutRole:v41];

        goto LABEL_25;
      }
      uint64_t v38 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v38 forLayoutRole:1];

      uint64_t v39 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v33 setEntity:v39 forLayoutRole:2];
    }
    double v40 = +[SBWorkspaceEntity entity];
    uint64_t v41 = 3;
    double v42 = v33;
    double v43 = v40;
    goto LABEL_24;
  }
LABEL_29:
}

uint64_t __68__SBDragAndDropWorkspaceTransaction__updateForWindowDragForSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addChildTransaction:*(void *)(*(void *)(a1 + 32) + 376)];
}

- (void)_updatePlatterViewBlurForDropCompletion
{
  double v3 = self->_activePlatterPreview;
  id v4 = self->_activeSourceViewProvider;
  if (v4
    && ([(SBAppPlatterDragPreview *)v3 mode] != 2
     || [(SBAppPlatterDragPreview *)v3 isAnimatingPlatterViewAlpha]))
  {
    [(SBDragAndDropWorkspaceTransaction *)self addMilestone:@"SBDragAndDropAppActivationPlatterFadeOutMilestone"];
    double v5 = [(SBAppPlatterDragSourceViewProviding *)v4 containerViewForBlurContentView];
    double v6 = [(SBAppPlatterDragPreview *)v3 platterView];
    id v7 = [v6 iconView];
    id v8 = [v7 imageView];
    [v8 setHidden:0];

    char v9 = [v6 layer];
    [v9 setZPosition:1.79769313e308];

    [v5 addSubview:v6];
    [v5 bounds];
    objc_msgSend(v6, "setBounds:");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__SBDragAndDropWorkspaceTransaction__updatePlatterViewBlurForDropCompletion__block_invoke;
    v11[3] = &unk_1E6AF5290;
    v11[4] = self;
    id v12 = v6;
    id v10 = v6;
    [(SBAppPlatterDragPreview *)v3 setPlatterViewAlphaAnimationCompletionBlock:v11];
  }
}

uint64_t __76__SBDragAndDropWorkspaceTransaction__updatePlatterViewBlurForDropCompletion__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeMilestone:@"SBDragAndDropAppActivationPlatterFadeOutMilestone"];
  id v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (double)_platterScale
{
  [(SBMedusaSettings *)self->_medusaSettings iconPlatterScale];
  double v4 = v3;
  double v5 = [(SBApplicationDropSession *)self->_dropSession localContext];
  if ([v5 startLocation] == 8)
  {
  }
  else
  {
    BOOL v6 = [(SBApplicationDropSession *)self->_dropSession isWindowTearOff];

    if (!v6)
    {
      int64_t currentDropAction = self->_currentDropAction;
      goto LABEL_9;
    }
  }
  if (!self->_currentDropAction) {
    goto LABEL_11;
  }
  [(SBMedusaSettings *)self->_medusaSettings windowPlatterScale];
  int64_t currentDropAction = self->_currentDropAction;
  if (currentDropAction == 1) {
    double v4 = 0.6;
  }
  else {
    double v4 = v7;
  }
LABEL_9:
  if (currentDropAction == 10)
  {
    [(SBDragAndDropWorkspaceTransaction *)self _platterScaleForSwitcherDropContext:self->_currentSwitcherDropRegionContext];
    double v4 = v9;
  }
LABEL_11:
  id v10 = +[SBPlatformController sharedInstance];
  int v11 = [v10 isiPadMini];

  double result = v4 / 0.9;
  if (!v11) {
    return v4;
  }
  return result;
}

- (double)_platterScaleForSwitcherDropContext:(id)a3
{
  medusaSettings = self->_medusaSettings;
  id v5 = a3;
  [(SBMedusaSettings *)medusaSettings cardPlatterScale];
  double v7 = v6;
  id v8 = [v5 draggingLeafAppLayout];
  uint64_t v9 = [v8 environment];

  uint64_t v10 = [v5 currentDropRegion];
  int v11 = [v5 intersectingAppLayout];

  uint64_t v12 = [v11 environment];
  if (v9 == 2) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 != 2) {
    return v7;
  }
  double v14 = self->_medusaSettings;
  [(SBMedusaSettings *)v14 floatingCardPlatterScale];
  return result;
}

- (CGSize)_platterSizeForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(SBWorkspaceTransaction *)self windowScene];
  uint64_t v10 = [v9 switcherController];

  int v11 = [v10 isChamoisWindowingUIEnabled];
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v11)
  {
    if ((unint64_t)(a3 - 1) >= 5)
    {
      if (a3 == 10)
      {
LABEL_7:
        [(SBDragAndDropWorkspaceTransaction *)self _platterSizeForSwitcherDropContext:self->_currentSwitcherDropRegionContext setDown:v5];
        double v12 = v19;
        double v13 = v20;
      }
    }
    else
    {
      double v14 = [v8 appLayout];
      objc_msgSend(v10, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 1, v14, objc_msgSend(v8, "interfaceOrientation"));
      double v12 = v15;
      double v13 = v16;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
      case 2:
      case 4:
        double v21 = &SBLayoutRolePrimary;
        goto LABEL_10;
      case 3:
      case 5:
        double v21 = &SBLayoutRoleSide;
LABEL_10:
        uint64_t v22 = *v21;
        double v23 = [v8 appLayout];
        objc_msgSend(v10, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v22, v23, objc_msgSend(v8, "interfaceOrientation"));
        double v12 = v24;
        double v13 = v25;

        break;
      case 6:
      case 7:
      case 8:
      case 9:
        objc_msgSend(v10, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(v8, "interfaceOrientation"), objc_msgSend(v8, "floatingConfiguration"));
        double v12 = v17;
        double v13 = v18;
        break;
      case 10:
        goto LABEL_7;
      default:
        break;
    }
  }
  if (!v5)
  {
    [(SBDragAndDropWorkspaceTransaction *)self _platterScale];
    double v13 = v13 * v26;
    double v12 = v12 * v26;
  }

  double v27 = v12;
  double v28 = v13;
  result.CGFloat height = v28;
  result.CGFloat width = v27;
  return result;
}

- (CGSize)_platterSizeForSwitcherDropContext:(id)a3 setDown:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  id v8 = [v6 draggingLeafAppLayout];
  unint64_t v9 = [v6 currentDropRegion];
  uint64_t v10 = [v6 currentDropAction];
  if (v4)
  {
    int v11 = [WeakRetained appLayouts];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80__SBDragAndDropWorkspaceTransaction__platterSizeForSwitcherDropContext_setDown___block_invoke;
    v25[3] = &unk_1E6AF4B60;
    id v26 = v8;
    id v8 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v25);
  }
  double v12 = [(SBWorkspaceTransaction *)self windowScene];
  double v13 = [v12 switcherController];

  uint64_t v14 = [WeakRetained switcherInterfaceOrientation];
  if ([v8 environment] == 1 || v10 == 3)
  {
    [v13 frameForItemWithRole:1 inMainAppLayout:v8 interfaceOrientation:v14];
    goto LABEL_8;
  }
  if ([v8 environment] == 2)
  {
    [v13 frameForFloatingAppLayoutInInterfaceOrientation:v14 floatingConfiguration:2];
LABEL_8:
    double v17 = v15;
    double v18 = v16;
    goto LABEL_10;
  }
  double v17 = *MEMORY[0x1E4F1DB30];
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_10:
  if (v9 <= 7)
  {
    if (((1 << v9) & 0x8D) != 0)
    {
      if (v10 == 3)
      {
        [v6 targetRect];
        double v17 = v19;
        double v18 = v20;
        goto LABEL_19;
      }
      [(SBAppPlatterDragPreview *)self->_activePlatterPreview sourceViewScale];
      SBTransformedSizeWithScale();
    }
    else if (((1 << v9) & 0x70) != 0)
    {
      [v6 scaledIntersectingAppLayoutSize];
    }
    else
    {
      [(SBAppPlatterDragPreview *)self->_activePlatterPreview size];
    }
    double v17 = v21;
    double v18 = v22;
  }
LABEL_19:

  double v23 = v17;
  double v24 = v18;
  result.CGFloat height = v24;
  result.CGFloat width = v23;
  return result;
}

uint64_t __80__SBDragAndDropWorkspaceTransaction__platterSizeForSwitcherDropContext_setDown___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 itemForLayoutRole:1];
  BOOL v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 containsItemWithUniqueIdentifier:v5];

  return v6;
}

- (double)_platterSourceViewScaleForSetDropAction:(int64_t)a3 setDown:(BOOL)a4
{
  BOOL v4 = a4;
  [(SBAppPlatterDragPreview *)self->_activePlatterPreview sourceViewScale];
  if (!v4) {
    return v7;
  }
  double v8 = 1.0;
  if (a3 == 10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    uint64_t v10 = [(SBDeviceApplicationSceneHandle *)self->_draggingApplicationSceneHandle sceneIdentifier];
    int v11 = [WeakRetained appLayouts];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__SBDragAndDropWorkspaceTransaction__platterSourceViewScaleForSetDropAction_setDown___block_invoke;
    v16[3] = &unk_1E6AF4B60;
    id v17 = v10;
    id v12 = v10;
    double v13 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v16);

    [WeakRetained contentPageViewScaleForAppLayout:v13];
    double v8 = v14;
  }
  return v8;
}

uint64_t __85__SBDragAndDropWorkspaceTransaction__platterSourceViewScaleForSetDropAction_setDown___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItemWithUniqueIdentifier:*(void *)(a1 + 32)];
}

- (id)_cornerRadiusConfigurationForDropAction:(int64_t)a3 proposedDropLayoutState:(id)a4 setDown:(BOOL)a5 mode:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (a6 != 2 && !v7)
  {
    double v11 = 0.0;
    if ((unint64_t)(a3 - 1) <= 9) {
      double v11 = dbl_1D8FD1C50[a3 - 1];
    }
    id v12 = objc_alloc(MEMORY[0x1E4F4F700]);
    double v13 = v11;
    goto LABEL_10;
  }
  int64_t v14 = [(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:a3];
  int64_t v15 = v14;
  if (a6 == 2 && !self->_layoutElementForWindowDrag)
  {
    activeSourceViewProvider = self->_activeSourceViewProvider;
    if (activeSourceViewProvider)
    {
      uint64_t v17 = [(SBAppPlatterDragSourceViewProviding *)activeSourceViewProvider initialCornerRadiusConfiguration];
      goto LABEL_11;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F4F700]);
    double v13 = 10.0;
LABEL_10:
    uint64_t v17 = [v12 initWithCornerRadius:v13];
LABEL_11:
    double v18 = (void *)v17;
    goto LABEL_12;
  }
  if (v14 == 3)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F4F700]);
    [(SBMedusaSettings *)self->_medusaSettings cornerRadiusForFloatingApps];
    id v12 = v16;
    goto LABEL_10;
  }
  double v20 = [v10 elementWithRole:v14];
  double v18 = SBDefaultCornerRadiusConfigurationForElementInLayoutState(v20, v10);

  if (a6 == 2 && !v7)
  {
    [v18 topLeft];
    double v22 = v21;
    [v18 topRight];
    uint64_t v30 = v23;
    [v18 bottomLeft];
    uint64_t v31 = v24;
    [v18 bottomRight];
    uint64_t v32 = v25;
    for (uint64_t i = 8; i != 32; i += 8)
    {
      if (v22 < *(double *)&v29[i]) {
        double v22 = *(double *)&v29[i];
      }
    }
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:v22];

    double v18 = (void *)v27;
  }
LABEL_12:

  return v18;
}

- (id)_cornerRadiusForSwitcherDragContext:(id)a3 setDown:(BOOL)a4 sourceViewScale:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = v8;
  if (v6)
  {
    id v10 = [v8 finalTargetAppLayout];
    double v11 = [v9 draggingLeafAppLayout];

    id v12 = [v11 itemForLayoutRole:1];
    uint64_t v13 = [v10 layoutRoleForItem:v12];
  }
  else
  {
    id v10 = [v8 draggingAppLayout];

    uint64_t v13 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  [WeakRetained cornerRadiiForLayoutRole:v13 inAppLayout:v10];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithTopLeft:v16 * a5 bottomLeft:v18 * a5 bottomRight:v20 * a5 topRight:v22 * a5];
  return v23;
}

- (void)_getPlatterDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3 rimShadowParameters:(SBDragPreviewShadowParameters *)a4 diffuseFilters:(id *)a5 rimFilters:(id *)a6 forDropAction:(int64_t)a7 setDown:(BOOL)a8 mode:(unint64_t)a9 userInterfaceStyle:(int64_t)a10
{
  v56[1] = *MEMORY[0x1E4F143B8];
  if (a9 == 2)
  {
    if (!self->_layoutElementForWindowDrag)
    {
      double v17 = self->_activeSourceViewProvider;
      [(SBAppPlatterDragSourceViewProviding *)v17 initialDiffuseShadowParameters];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      CGFloat v25 = v24;
      [(SBAppPlatterDragSourceViewProviding *)v17 initialRimShadowParameters];
      double v27 = v26;
      double v29 = v28;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      int64_t v34 = [(SBAppPlatterDragSourceViewProviding *)v17 initialDiffuseShadowFilters];
      int64_t v35 = [(SBAppPlatterDragSourceViewProviding *)v17 initialRimShadowFilters];
LABEL_27:

      goto LABEL_28;
    }
LABEL_5:
    double v17 = self->_medusaSettings;
    if ([(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:a7] == 3)
    {
      if (a10 == 2) {
        [(SBAppPlatterDragSourceViewProviding *)v17 coronaDiffuseShadowOpacity];
      }
      else {
        [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowOpacity];
      }
      double v19 = v36;
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowRadius];
      double v21 = v38;
      uint64_t v39 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowOffsetHorizontal];
      if (v39 == 1) {
        double v40 = -v40;
      }
      if (self->_currentDropAction == 6) {
        double v23 = -v40;
      }
      else {
        double v23 = v40;
      }
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowOffsetVertical];
      CGFloat v25 = v41;
      if (a10 == 2)
      {
        [(SBAppPlatterDragSourceViewProviding *)v17 coronaRimShadowOpacity];
        double v27 = v42;
        [(SBAppPlatterDragSourceViewProviding *)v17 rimShadowRadius];
        double v29 = v43;
        int v44 = (CGFloat *)MEMORY[0x1E4F1DB30];
        id v45 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
        double v46 = (void *)MEMORY[0x1E4F29238];
        medusaSettings = self->_medusaSettings;
        if (medusaSettings) {
          [(SBMedusaSettings *)medusaSettings coronaVibrantColorMatrixInput];
        }
        else {
          memset(v54, 0, sizeof(v54));
        }
        CGFloat v31 = *v44;
        CGFloat v33 = v44[1];
        id v53 = [v46 valueWithCAColorMatrix:v54];
        [v45 setValue:v53 forKey:@"inputColorMatrix"];

        v56[0] = v45;
        int64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
        uint64_t v55 = v45;
        int64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];

        goto LABEL_27;
      }
    }
    else
    {
      double v23 = 0.0;
      if (a9 != 2 || a8)
      {
        int64_t v35 = 0;
        int64_t v34 = 0;
        CGFloat v33 = 0.0;
        CGFloat v31 = 0.0;
        double v29 = 0.0;
        double v27 = 0.0;
        CGFloat v25 = 0.0;
        double v21 = 0.0;
        double v19 = 0.0;
        goto LABEL_27;
      }
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowOpacity];
      double v19 = v48;
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowRadius];
      double v21 = v49;
      [(SBAppPlatterDragSourceViewProviding *)v17 diffuseShadowOffsetVertical];
      CGFloat v25 = v50;
    }
    [(SBAppPlatterDragSourceViewProviding *)v17 rimShadowOpacity];
    double v27 = v51;
    [(SBAppPlatterDragSourceViewProviding *)v17 rimShadowRadius];
    double v29 = v52;
    int64_t v35 = 0;
    int64_t v34 = 0;
    CGFloat v31 = *MEMORY[0x1E4F1DB30];
    CGFloat v33 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_27;
  }
  if (a8) {
    goto LABEL_5;
  }
  int64_t v37 = a7 - 1;
  CGFloat v33 = 0.0;
  int64_t v35 = 0;
  int64_t v34 = 0;
  if ((unint64_t)(a7 - 1) > 9)
  {
    CGFloat v31 = 0.0;
    double v29 = 0.0;
    double v27 = 0.0;
    CGFloat v25 = 0.0;
    double v23 = 0.0;
    double v21 = 0.0;
    double v19 = 0.0;
  }
  else
  {
    CGFloat v25 = dbl_1D8FD1CA0[v37];
    double v21 = dbl_1D8FD1CF0[v37];
    double v19 = 0.25;
    CGFloat v31 = 0.0;
    double v29 = 0.0;
    double v27 = 0.0;
    double v23 = 0.0;
  }
LABEL_28:
  if (a3)
  {
    a3->shadowOpacitCGFloat y = v19;
    a3->shadowRadius = v21;
    a3->shadowOffset.CGFloat width = v23;
    a3->shadowOffset.CGFloat height = v25;
  }
  if (a4)
  {
    a4->shadowOpacitCGFloat y = v27;
    a4->shadowRadius = v29;
    a4->shadowOffset.CGFloat width = v31;
    a4->shadowOffset.CGFloat height = v33;
  }
  if (a5) {
    *a5 = v34;
  }
  if (a6) {
    *a6 = v35;
  }
}

- (void)_updatePlatterPreviewForSetDown:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted]) {
    return;
  }
  BOOL v7 = self->_activePlatterPreview;
  int64_t currentDropAction = self->_currentDropAction;
  unint64_t v9 = self->_currentDropActionProposedLayoutState;
  uint64_t v10 = !self->_draggingExistingItemFromActiveLayoutState;
  if (self->_dragExitedDropZone)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
    if ([WeakRetained isChamoisWindowingUIEnabled])
    {
      int64_t v12 = [(SBApplicationDropSession *)self->_dropSession dropZones];

      if (!v12)
      {
        uint64_t v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
    }
LABEL_12:
    uint64_t v10 = 2;
    goto LABEL_13;
  }
  if (self->_layoutElementForWindowDrag && !self->_windowDragEnteredPlatterZone) {
    goto LABEL_12;
  }
  if (!currentDropAction)
  {
    uint64_t v13 = [(SBApplicationDropSession *)self->_dropSession localContext];
    uint64_t v14 = [v13 startLocation];

    if (v14 == 8)
    {
      uint64_t v15 = 7;
      double v16 = [(SBDragAndDropWorkspaceTransaction *)self _transitionRequestForDropAction:7];
      [v16 finalize];
      double v17 = [v16 applicationContext];
      uint64_t v18 = [v17 layoutState];
      double v19 = v9;
      unint64_t v9 = (SBMainDisplayLayoutState *)v18;

      int64_t currentDropAction = 0;
      uint64_t v10 = 1;
    }
    else
    {
      double v56 = [(SBAppPlatterDragPreview *)v7 sourceView];
      uint64_t v10 = v56 != 0;

      uint64_t v15 = 0;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v15 = currentDropAction;
LABEL_14:
  currentSwitcherDropRegionContext = self->_currentSwitcherDropRegionContext;
  if (currentSwitcherDropRegionContext)
  {
    if ([(SBSwitcherDropRegionContext *)currentSwitcherDropRegionContext currentDropRegion] == 1)
    {
      uint64_t v10 = 2;
    }
    else if ([(SBSwitcherDropRegionContext *)self->_currentSwitcherDropRegionContext isSwap])
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  BOOL v60 = v4;
  if (self->_sessionState == 2)
  {
    uint64_t v58 = v15;
    int64_t v57 = currentDropAction;
    double v21 = v7;
    double v22 = v9;
    finalLayoutState = self->_finalLayoutState;
    if (!finalLayoutState) {
      finalLayoutState = self->_currentLayoutState;
    }
    double v24 = finalLayoutState;
    id v25 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    double v26 = [(SBMainDisplayLayoutState *)v24 appLayout];
    int v27 = [v25 _isAppLayoutBlurred:v26];

    if (self->_layoutStateTransitionCompleted || self->_currentWorkspaceTransaction)
    {
      uint64_t v28 = [(NSMutableSet *)self->_pendingSceneUpdatesTransactions count];
      uint64_t v29 = 2;
      if (v27) {
        uint64_t v29 = v10;
      }
      if (!v28) {
        uint64_t v10 = v29;
      }
    }
    unint64_t v9 = v22;
    BOOL v7 = v21;

    int64_t currentDropAction = v57;
    uint64_t v15 = v58;
  }
  if (v10 == 1)
  {
    double v30 = [(SBAppPlatterDragPreview *)v7 platterView];

    if (!v30)
    {
      objc_initWeak(location, self);
      draggingApplicationSceneHandle = self->_draggingApplicationSceneHandle;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke;
      v83[3] = &unk_1E6AFD218;
      objc_copyWeak(&v84, location);
      BOOL v85 = v5;
      [(SBDragAndDropWorkspaceTransaction *)self _configurePlatterPreview:v7 forSceneHandle:draggingApplicationSceneHandle completion:v83];
      objc_destroyWeak(&v84);
      objc_destroyWeak(location);
    }
  }
  [(SBDragAndDropWorkspaceTransaction *)self _platterSourceViewScaleForSetDropAction:currentDropAction setDown:v5];
  double v33 = v32;
  [(SBDragAndDropWorkspaceTransaction *)self _platterSizeForDropAction:v15 proposedDropLayoutState:v9 setDown:v5];
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  if (self->_currentDropAction == 10) {
    [(SBDragAndDropWorkspaceTransaction *)self _cornerRadiusForSwitcherDragContext:self->_currentSwitcherDropRegionContext setDown:v5 sourceViewScale:v33];
  }
  else {
  double v38 = [(SBDragAndDropWorkspaceTransaction *)self _cornerRadiusConfigurationForDropAction:v15 proposedDropLayoutState:v9 setDown:v5 mode:v10];
  }
  *(_OWORD *)id location = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v77 = 0;
  id v78 = 0;
  uint64_t v39 = [(SBAppPlatterDragPreview *)v7 traitCollection];
  -[SBDragAndDropWorkspaceTransaction _getPlatterDiffuseShadowParameters:rimShadowParameters:diffuseFilters:rimFilters:forDropAction:setDown:mode:userInterfaceStyle:](self, "_getPlatterDiffuseShadowParameters:rimShadowParameters:diffuseFilters:rimFilters:forDropAction:setDown:mode:userInterfaceStyle:", location, &v79, &v78, &v77, v15, v5, v10, [v39 userInterfaceStyle]);
  id v40 = v78;
  id v41 = v77;

  if (v5)
  {
    uint64_t v42 = 3;
  }
  else if (self->_layoutElementForWindowDrag)
  {
    if (self->_windowLiftAnimationCompleted) {
      uint64_t v42 = 2;
    }
    else {
      uint64_t v42 = 1;
    }
  }
  else
  {
    uint64_t v42 = 2;
  }
  double v59 = v9;
  [(SBDragAndDropWorkspaceTransaction *)self _updateActiveSourceViewProviderWithDragState:v42];
  double v43 = 0.0;
  if (self->_finalLayoutState)
  {
    int64_t v44 = [(SBLayoutState *)self->_currentLayoutState interfaceOrientation];
    int64_t v45 = [(SBLayoutState *)self->_finalLayoutState interfaceOrientation];
    if (v44 != v45)
    {
      double v46 = 0.0;
      double v47 = 0.0;
      if (v45 != 1)
      {
        if (v45 == 3)
        {
          double v47 = 1.57079633;
        }
        else if (v45 == 4)
        {
          double v47 = -1.57079633;
        }
        else
        {
          double v47 = 3.14159265;
          if (v45 != 2) {
            double v47 = 0.0;
          }
        }
      }
      if (v44 != 1)
      {
        if (v44 == 3)
        {
          double v46 = 1.57079633;
        }
        else if (v44 == 4)
        {
          double v46 = -1.57079633;
        }
        else
        {
          double v46 = 3.14159265;
          if (v44 != 2) {
            double v46 = 0.0;
          }
        }
      }
      double v43 = v47 - v46;
    }
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_2;
  v62[3] = &unk_1E6B04CA0;
  v62[4] = self;
  double v48 = v7;
  id v63 = v48;
  uint64_t v67 = v10;
  uint64_t v68 = v35;
  uint64_t v69 = v37;
  double v70 = v33;
  double v71 = v43;
  id v49 = v38;
  id v64 = v49;
  long long v72 = *(_OWORD *)location;
  long long v73 = v82;
  long long v74 = v79;
  long long v75 = v80;
  id v50 = v40;
  id v65 = v50;
  id v51 = v41;
  id v66 = v51;
  uint64_t v76 = v42;
  double v52 = (void (**)(void))MEMORY[0x1D948C7A0](v62);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_3;
  v61[3] = &unk_1E6AFA1B8;
  v61[4] = self;
  id v53 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v61);
  if (v60)
  {
    unint64_t v54 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v55 = [(SBMedusaSettings *)self->_medusaSettings platterAnimationSettings];
    [v54 _animateUsingSpringBehavior:v55 tracking:0 animations:v52 completion:v53];
  }
  else
  {
    v52[2](v52);
    v53[2](v53, 1, 0);
  }
}

void __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    char v4 = [WeakRetained isInterrupted];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [v5 _updatePlatterPreviewForSetDown:*(unsigned __int8 *)(a1 + 40) animated:1];
      id v3 = v5;
    }
  }
}

uint64_t __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_2(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 440);
  [*(id *)(a1 + 40) setMode:*(void *)(a1 + 72)];
  objc_msgSend(*(id *)(a1 + 40), "setPlatterSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 40) setSourceViewScale:*(double *)(a1 + 96)];
  [*(id *)(a1 + 40) setRotation:*(double *)(a1 + 104)];
  [*(id *)(a1 + 40) setCornerRadiusConfiguration:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "setDiffuseShadowParameters:", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(double *)(a1 + 136));
  objc_msgSend(*(id *)(a1 + 40), "setRimShadowParameters:", *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168));
  [*(id *)(a1 + 40) setDiffuseShadowFilters:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setRimShadowFilters:*(void *)(a1 + 64)];
  [*(id *)(a1 + 40) setDragState:*(void *)(a1 + 176)];
  id v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

uint64_t __78__SBDragAndDropWorkspaceTransaction__updatePlatterPreviewForSetDown_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interruptForDragExitedDropZoneIfNecessary];
}

- (void)_updatePlatterPreviewWithUpdatedSourceView
{
  double v22 = self->_activePlatterPreview;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  int64_t currentDropAction = self->_currentDropAction;
  if ((unint64_t)(currentDropAction - 8) < 2)
  {
    BOOL v6 = [(SBAppPlatterDragPreview *)v22 sourceView];
    [v6 _removeAllRetargetableAnimations:1];

    goto LABEL_17;
  }
  if (currentDropAction != 10)
  {
    if (self->_draggingExistingItemFromActiveLayoutState)
    {
      [(SBAppPlatterDragPreview *)self->_activePlatterPreview dropDestinationAnimationCompleted];
      goto LABEL_17;
    }
    uint64_t v7 = [(SBDragAndDropWorkspaceTransaction *)self _layoutRoleForDropAction:"_layoutRoleForDropAction:"];
    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:1743 description:@"Invalid role."];

LABEL_8:
      unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SBDragAndDropWorkspaceTransaction.m" lineNumber:1750 description:@"No source view!"];

      uint64_t v10 = 0;
LABEL_14:
      double v17 = [v10 sourceView];
      [(SBAppPlatterDragPreview *)v22 updateSourceView:v17];

      activeSourceViewProvider = self->_activeSourceViewProvider;
      if (activeSourceViewProvider) {
        [(SBAppPlatterDragSourceViewProviding *)activeSourceViewProvider setDragging:0];
      }
      double v19 = self->_activeSourceViewProvider;
      self->_activeSourceViewProvider = (SBAppPlatterDragSourceViewProviding *)v10;
      id v20 = v10;

      unint64_t v21 = [(SBAppPlatterDragPreview *)self->_activePlatterPreview dragState];
      [(SBDragAndDropWorkspaceTransaction *)self _updateActiveSourceViewProviderWithDragState:v21];
      goto LABEL_17;
    }
    uint64_t v11 = v7;
    if (SBLayoutRoleIsValidForSplitView(v7))
    {
      int64_t v12 = [(SBMainDisplayLayoutState *)self->_finalLayoutState appLayout];
      uint64_t v13 = [v12 leafAppLayoutForRole:v11];

      uint64_t v14 = [WeakRetained visibleItemContainers];
      uint64_t v15 = v14;
      double v16 = v13;
    }
    else
    {
      if (v11 != 3) {
        goto LABEL_8;
      }
      uint64_t v13 = [WeakRetained visibleItemContainers];
      uint64_t v15 = [(SBMainDisplayLayoutState *)self->_finalLayoutState floatingAppLayout];
      uint64_t v14 = v13;
      double v16 = v15;
    }
    uint64_t v10 = [v14 objectForKey:v16];

    if (v10) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
LABEL_17:
}

- (void)_updateActiveSourceViewProviderWithDragState:(unint64_t)a3
{
  activeSourceViewProvider = self->_activeSourceViewProvider;
  if (activeSourceViewProvider) {
    [(SBAppPlatterDragSourceViewProviding *)activeSourceViewProvider setDragging:a3 > 1];
  }
}

- (void)_runFinalLayoutStateTransaction
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  BOOL v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  unint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBDragAndDropWorkspaceTransaction.m";
  __int16 v16 = 1024;
  int v17 = 1799;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (BOOL)_shouldFailLayoutStateTransitionForWindowDrag
{
  return [(SBLayoutElement *)self->_layoutElementForWindowDrag layoutRole] == 3;
}

- (void)_addChildWorkspaceTransaction:(id)a3
{
  char v4 = (SBToAppsWorkspaceTransaction *)a3;
  BOOL v5 = self->_currentWorkspaceTransaction;
  if (v5)
  {
    BOOL v6 = [(SBWorkspaceTransaction *)v4 transitionRequest];
    [(SBWorkspaceTransaction *)v5 interruptForTransitionRequest:v6];
  }
  uint64_t v7 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBDragAndDropWorkspaceTransaction _addChildWorkspaceTransaction:]((uint64_t)v4, v7);
  }

  currentWorkspaceTransaction = self->_currentWorkspaceTransaction;
  self->_currentWorkspaceTransaction = v4;
  unint64_t v9 = v4;

  [(SBDragAndDropWorkspaceTransaction *)self addChildTransaction:v9];
}

- (id)_currentGestureEventForGesture:(id)a3
{
  uint64_t v4 = SBGestureModifierPhaseForGestureState([a3 state]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  BOOL v6 = [WeakRetained view];

  uint64_t v7 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
  int v8 = [SBDragAndDropGestureSwitcherModifierEvent alloc];
  gestureID = self->_gestureID;
  __int16 v10 = [(SBFluidSwitcherGesture *)self->_dragAndDropGesture selectedAppLayout];
  uint64_t v11 = [(SBGestureSwitcherModifierEvent *)v8 initWithGestureID:gestureID selectedAppLayout:v10 gestureType:6 phase:v4];

  [v7 locationInView:v6];
  -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v11, "setLocationInContainerView:");
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0166666667];
  -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v11, "setVelocityInContainerView:");
  [(SBGestureSwitcherModifierEvent *)v11 setTouchHistoryProvider:self->_touchHistory];
  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setDropAction:self->_currentDropAction];
  __int16 v12 = [(SBDeviceApplicationSceneHandle *)self->_draggingApplicationSceneHandle sceneIdentifier];
  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setDraggedSceneIdentifier:v12];

  if (self->_currentSwitcherDropRegionContext) {
    int64_t v13 = [(SBFluidSwitcherGesture *)self->_dragAndDropGesture selectedLayoutRole];
  }
  else {
    int64_t v13 = [(SBLayoutElement *)self->_layoutElementForWindowDrag layoutRole];
  }
  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setDraggedSceneLayoutRole:v13];
  [(SBDragAndDropWorkspaceTransaction *)self _platterFrameInSwitcherView];
  -[SBDragAndDropGestureSwitcherModifierEvent setPlatterViewFrame:](v11, "setPlatterViewFrame:");
  [(SBDragAndDropWorkspaceTransaction *)self _platterScale];
  -[SBDragAndDropGestureSwitcherModifierEvent setPlatterScale:](v11, "setPlatterScale:");
  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setSwitcherDropRegionContext:self->_currentSwitcherDropRegionContext];
  __int16 v14 = [(SBApplicationDropSession *)self->_dropSession localContext];
  -[SBDragAndDropGestureSwitcherModifierEvent setWindowDrag:](v11, "setWindowDrag:", [v14 startLocation] == 8);

  uint64_t v15 = [(SBApplicationDropSession *)self->_dropSession localContext];
  -[SBDragAndDropGestureSwitcherModifierEvent setSwitcherDrag:](v11, "setSwitcherDrag:", [v15 startLocation] == 11);

  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setPreviewHasLifted:self->_windowLiftAnimationCompleted];
  [(SBDragAndDropGestureSwitcherModifierEvent *)v11 setPlatterized:self->_windowDragEnteredPlatterZone];
  if ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted])
  {
    [(SBGestureSwitcherModifierEvent *)v11 setCanceled:1];
  }
  else
  {
    __int16 v16 = [(SBDragAndDropWorkspaceTransaction *)self error];
    [(SBGestureSwitcherModifierEvent *)v11 setCanceled:v16 != 0];
  }
  return v11;
}

- (void)_begin
{
  v42.receiver = self;
  v42.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBDragAndDropWorkspaceTransaction *)&v42 _begin];
  id v3 = +[SBKeyboardSuppressionManager sharedInstance];
  uint64_t v4 = [(SBWorkspaceTransaction *)self transitionRequest];
  BOOL v5 = [v4 displayIdentity];
  [v3 startSuppressingKeyboardWithReason:@"medusa-drag" predicate:0 displayIdentity:v5];

  BOOL v6 = [(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:@"SBDragAndDropAppActivationDisableRotationReason"];
  deferOrientationUpdatesForDragAndDropAssertion = self->_deferOrientationUpdatesForDragAndDropAssertion;
  self->_deferOrientationUpdatesForDragAndDropAssertion = v6;

  self->_performedDrop = 0;
  [(SBDragAndDropWorkspaceTransaction *)self addMilestone:@"SBDragAndDropAppActivationDraggingMilestone"];
  int v8 = [(id)SBApp transactionForDismissingSearchTransientOverlay];
  if (v8) {
    [(SBDragAndDropWorkspaceTransaction *)self addChildTransaction:v8 withSchedulingPolicy:0];
  }
  unint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  gestureID = self->_gestureID;
  self->_gestureID = v9;

  if (!self->_currentDropActionProposedLayoutState) {
    [(SBDragAndDropWorkspaceTransaction *)self _updateCurrentDropActionProposedLayoutState];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke;
  v39[3] = &unk_1E6AFBC38;
  objc_copyWeak(&v40, &location);
  uint64_t v11 = (void *)MEMORY[0x1D948C7A0](v39);
  __int16 v12 = [[SBFluidSwitcherGesture alloc] initWithType:6 eventProvider:v11];
  dragAndDropGesture = self->_dragAndDropGesture;
  self->_dragAndDropGesture = v12;

  layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
  if (layoutElementForWindowDrag)
  {
    uint64_t v15 = [(SBLayoutElement *)layoutElementForWindowDrag layoutRole];
    currentLayoutState = self->_currentLayoutState;
    if (v15 == 3)
    {
      id v17 = [(SBMainDisplayLayoutState *)currentLayoutState floatingAppLayout];
      [v17 anyLeafAppLayout];
    }
    else
    {
      id v17 = [(SBMainDisplayLayoutState *)currentLayoutState appLayout];
      objc_msgSend(v17, "leafAppLayoutForRole:", -[SBLayoutElement layoutRole](self->_layoutElementForWindowDrag, "layoutRole"));
    unint64_t v21 = };
    goto LABEL_12;
  }
  if ([(SBMainDisplayLayoutState *)self->_currentLayoutState unlockedEnvironmentMode] == 2)
  {
    __int16 v18 = [(SBDeviceApplicationSceneHandle *)self->_draggingApplicationSceneHandle sceneIdentifier];
    uint64_t v19 = [WeakRetained appLayouts];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_2;
    v37[3] = &unk_1E6AF4B60;
    id v20 = v18;
    id v38 = v20;
    unint64_t v21 = objc_msgSend(v19, "bs_firstObjectPassingTest:", v37);

    double v22 = [v21 allItems];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_3;
    v35[3] = &unk_1E6AF4B38;
    id v17 = v20;
    id v36 = v17;
    double v23 = objc_msgSend(v22, "bs_firstObjectPassingTest:", v35);

    -[SBFluidSwitcherGesture _setSelectedLayoutRole:](self->_dragAndDropGesture, "_setSelectedLayoutRole:", [v21 layoutRoleForItem:v23]);
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v21 = 0;
LABEL_13:
  double v24 = [(SBMainDisplayLayoutState *)self->_initialLayoutState appLayout];
  id v25 = [(SBApplicationDropSession *)self->_dropSession sceneIdentity];
  double v26 = [v25 identifier];
  self->_draggingExistingItemFromActiveLayoutState = [v24 containsItemWithUniqueIdentifier:v26];

  [(SBFluidSwitcherGesture *)self->_dragAndDropGesture _setSelectedAppLayout:v21];
  [(SBFluidSwitcherGesture *)self->_dragAndDropGesture _setState:1];
  if (self->_layoutElementForWindowDrag)
  {
    int v27 = [(SBDeviceApplicationSceneHandle *)self->_draggingApplicationSceneHandle sceneIdentifier];
    uint64_t v28 = [WeakRetained appLayouts];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_4;
    v33[3] = &unk_1E6AF4B60;
    id v29 = v27;
    id v34 = v29;
    double v30 = objc_msgSend(v28, "bs_firstObjectPassingTest:", v33);

    if (v30) {
      [(SBFluidSwitcherGesture *)self->_dragAndDropGesture _setSelectedAppLayout:v30];
    }
  }
  id v31 = objc_loadWeakRetained((id *)&self->_delegate);
  [v31 dragAndDropTransaction:self didBeginGesture:self->_dragAndDropGesture];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

id __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v5 = [WeakRetained _currentGestureEventForGesture:v3];

  return v5;
}

uint64_t __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItemWithUniqueIdentifier:*(void *)(a1 + 32)];
}

uint64_t __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __43__SBDragAndDropWorkspaceTransaction__begin__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsItemWithUniqueIdentifier:*(void *)(a1 + 32)]) {
    BOOL v4 = [v3 environment] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_didComplete
{
  if ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted])
  {
    id v3 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
    [(SBDragAndDropWorkspaceTransaction *)self _handleSessionDidEnd:v3];
  }
  [(SBDragAndDropWorkspaceTransaction *)self _endDragAndDropFluidGesture];
  [(BSInvalidatable *)self->_deferOrientationUpdatesForDragAndDropAssertion invalidate];
  deferOrientationUpdatesForDragAndDropAssertion = self->_deferOrientationUpdatesForDragAndDropAssertion;
  self->_deferOrientationUpdatesForDragAndDropAssertion = 0;

  BOOL v5 = +[SBKeyboardSuppressionManager sharedInstance];
  [v5 stopSuppressingKeyboardWithReason:@"medusa-drag"];

  [(SBAppPlatterDragPreview *)self->_activePlatterPreview invalidateSourceView];
  [(SBAppPlatterDragSourceViewProviding *)self->_activeSourceViewProvider setDragging:0];
  BOOL v6 = [(SBMainWorkspaceTransitionRequest *)self->_dropTransitionRequest completionBlock];

  if (v6)
  {
    uint64_t v7 = [(SBMainWorkspaceTransitionRequest *)self->_dropTransitionRequest completionBlock];
    v7[2](v7, 1);
  }
  v8.receiver = self;
  v8.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBMainWorkspaceTransaction *)&v8 _didComplete];
}

- (void)_endDragAndDropFluidGesture
{
  if (self->_dragAndDropGesture)
  {
    [(CADisplayLink *)self->_displayLinkForWindowDrag invalidate];
    displayLinkForWindowDrag = self->_displayLinkForWindowDrag;
    self->_displayLinkForWindowDrag = 0;

    [(SBFluidSwitcherGesture *)self->_dragAndDropGesture _setState:3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dragAndDropTransaction:self didEndGesture:self->_dragAndDropGesture];

    dragAndDropGesture = self->_dragAndDropGesture;
    self->_dragAndDropGesture = 0;
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  BOOL v4 = (SBToAppsWorkspaceTransaction *)a3;
  v5.receiver = self;
  v5.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBDragAndDropWorkspaceTransaction *)&v5 _childTransactionDidComplete:v4];
  if (self->_currentWorkspaceTransaction == v4)
  {
    self->_currentWorkspaceTransaction = 0;

    self->_layoutStateTransitionCompleted = 1;
    [(NSMutableSet *)self->_pendingSceneUpdatesTransactions removeAllObjects];
    goto LABEL_5;
  }
  if ((SBToAppsWorkspaceTransaction *)self->_sceneUpdateTransactionForWindowDrag == v4)
  {
    self->_sceneUpdateTransactionForWindowDrag = 0;

LABEL_5:
    [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:1 animated:1];
  }
}

- (BOOL)_canBeInterrupted
{
  return [(SBWorkspaceTransaction *)self _isInterruptingForTransitionRequest]
      || self->_dragExitedDropZone;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  if (([(SBDragAndDropWorkspaceTransaction *)self isComplete] & 1) != 0
    || ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] & 1) != 0
    || self->_layoutElementForWindowDrag
    && (!self->_windowDragEnteredPlatterZone || self->_sceneUpdateTransactionForWindowDrag)
    && !self->_performedDrop
    || self->_currentDropAction == 10 && !self->_dropAnimationCompleted
    || ([(SBDragAndDropWorkspaceTransaction *)self isWaitingForMilestone:@"SBDragAndDropAppActivationPlatterFadeOutMilestone"] & 1) != 0|| ([(SBDragAndDropWorkspaceTransaction *)self isWaitingForMilestone:@"SBDragAndDropAppActivationWaitingToAddToAppsTransactionMilestone"] & 1) != 0)
  {
    return 0;
  }
  if ((self->_currentWorkspaceTransaction || self->_performedDrop) && !self->_dropAnimationCompleted) {
    return self->_performedDrop;
  }
  return 1;
}

- (void)_willInterruptWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBDragAndDropWorkspaceTransaction *)&v5 _willInterruptWithReason:a3];
  [(SBDragAndDropWorkspaceTransaction *)self _endDragAndDropFluidGesture];
  BOOL v4 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  if ([v4 isTransitioning])
  {
    [v4 willEndTransition];
    [v4 endTransitionWithError:0];
  }
}

- (void)_willInterruptForTransitionRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  id v4 = a3;
  [(SBWorkspaceTransaction *)&v7 _willInterruptForTransitionRequest:v4];
  uint64_t v5 = objc_opt_class();
  BOOL v6 = SBSafeCast(v5, v4);

  if (objc_msgSend(v6, "source", v7.receiver, v7.super_class) == 27 || self->_performedDrop) {
    [(SBAppPlatterDragPreview *)self->_activePlatterPreview dropDestinationAnimationCompleted];
  }
}

- (void)_didInterruptWithReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDragAndDropWorkspaceTransaction;
  [(SBDragAndDropWorkspaceTransaction *)&v7 _didInterruptWithReason:v4];
  self->_sessionState = 2;
  if (!self->_performedDrop)
  {
    objc_storeStrong((id *)&self->_finalLayoutState, self->_currentLayoutState);
    uint64_t v5 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
    [(SBDragAndDropWorkspaceTransaction *)self _updateCurrentDropActionForSession:v5];

    [(SBDragAndDropWorkspaceTransaction *)self _cleanUpAndCompleteTransactionIfNecessary];
  }
  BOOL v6 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBAppDrop transaction did interrupt for reason: %{public}@", buf, 0xCu);
  }
}

- (CGRect)_platterFrameInSwitcherView
{
  id v3 = [(SBWorkspaceTransaction *)self windowScene];
  id v4 = [v3 switcherController];

  uint64_t v5 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_super v7 = [WeakRetained view];
  [v5 locationInView:v7];

  objc_msgSend(v4, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", -[SBLayoutState interfaceOrientation](self->_currentLayoutState, "interfaceOrientation"), 2);
  objc_super v8 = self->_activePlatterPreview;
  id v9 = [(SBAppPlatterDragPreview *)v8 platterView];
  [v9 bounds];

  [(SBDragAndDropWorkspaceTransaction *)self _platterScale];
  SBRectWithSize();
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[SBAppPlatterDragPreview convertRect:toView:](v8, "convertRect:toView:", v8);

  UIRectCenteredAboutPoint();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)_updateCurrentDropActionForSession:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  id v6 = objc_loadWeakRetained((id *)&self->_switcherContentController);
  objc_super v7 = [v6 view];
  *(void *)&recta.size.double width = [WeakRetained windowScene];
  int v8 = [WeakRetained isChamoisWindowingUIEnabled];
  if (v8
    && [(SBMainDisplayLayoutState *)self->_initialLayoutState unlockedEnvironmentMode] == 3)
  {
    CGPoint v146 = v7;
    id v9 = v4;
    double v10 = [(SBMainDisplayLayoutState *)self->_initialLayoutState appLayout];
    double v11 = [v6 visibleItemContainers];
    double v12 = [v10 leafAppLayoutForRole:1];
    double v13 = [v11 objectForKey:v12];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    double v22 = [v10 itemForLayoutRole:2];

    recta.origin.CGFloat x = v15;
    if (v22)
    {
      id v23 = v6;
      double v24 = [v6 visibleItemContainers];
      id v25 = [v10 leafAppLayoutForRole:2];
      double v26 = [v24 objectForKey:v25];
      [v26 frame];
      double v28 = v27;
      double v30 = v29;

      recta.origin.CGFloat y = v30 + v28 - (v15 + v19);
    }
    else
    {
      recta.origin.CGFloat y = v19;
      id v23 = v6;
    }

    id v4 = v9;
    id v6 = v23;
    objc_super v7 = v146;
  }
  else
  {
    [v7 bounds];
    recta.origin.CGFloat x = v31;
    recta.origin.CGFloat y = v32;
    double v17 = v33;
    double v21 = v34;
  }
  [v4 locationInView:v7];
  double v36 = v35;
  CGFloat v38 = v37;
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
  double v40 = v39;
  uint64_t v42 = v41;
  char v43 = [(SBDragAndDropWorkspaceTransaction *)self isInterrupted];
  if (self->_dragExitedDropZone || (!self->_activePlatterPreview ? (char v44 = 1) : (char v44 = v43), (v44 & 1) != 0))
  {
    int v45 = 0;
    goto LABEL_14;
  }
  uint64_t v144 = v42;
  double v148 = v17;
  CGFloat v72 = v38;
  double v73 = v40;
  double v74 = v21;
  long long v75 = [(SBApplicationDropSession *)self->_dropSession localContext];
  uint64_t v76 = [v75 startLocation];

  id v77 = [*(id *)&recta.size.width floatingDockController];
  [v77 floatingDockScreenFrame];
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;

  double v86 = [*(id *)&recta.size.width screen];
  v87 = [v86 fixedCoordinateSpace];
  objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v87, v79, v81, v83, v85);
  CGFloat v89 = v88;
  CGFloat v91 = v90;
  CGFloat v93 = v92;
  CGFloat v95 = v94;

  if (v76 != 8)
  {
    v188.origin.CGFloat x = v89;
    v188.origin.CGFloat y = v91;
    v188.size.double width = v93;
    v188.size.double height = v95;
    v185.CGFloat x = v36;
    v185.CGFloat y = v72;
    if (CGRectContainsPoint(v188, v185))
    {
      int v45 = 0;
LABEL_61:
      double v21 = v74;
      uint64_t v42 = v144;
      double v17 = v148;
      double v40 = v73;
      CGFloat v38 = v72;
      goto LABEL_14;
    }
  }
  v106 = [(SBDragAndDropWorkspaceTransaction *)self _iconManager];
  int v107 = [v106 hasOpenFolderInLocation:*MEMORY[0x1E4FA6690]];

  if (!v107)
  {
    int v45 = 1;
    goto LABEL_61;
  }
  id v108 = SBLogMedusaDropDestination();
  double v21 = v74;
  double v40 = v73;
  CGFloat v38 = v72;
  uint64_t v42 = v144;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
    -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:](v108);
  }

  int v45 = 0;
  double v17 = v148;
LABEL_14:
  if ([(SBMainDisplayLayoutState *)self->_currentLayoutState unlockedEnvironmentMode] == 3)
  {
    double v46 = [(SBMainDisplayLayoutState *)self->_currentLayoutState appLayout];
    double v47 = [v46 itemForLayoutRole:4];

    if (v47)
    {
      double v48 = SBLogMedusaDropDestination();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[SBDragAndDropWorkspaceTransaction _updateCurrentDropActionForSession:](v48);
      }
      int64_t v49 = 0;
      goto LABEL_85;
    }
  }
  if (v45)
  {
    double v142 = v40;
    id v147 = v4;
    uint64_t v50 = [WeakRetained windowManagementStyle];
    id v51 = [WeakRetained displayIdentity];
    double v52 = +[SBPlatformController sharedInstance];
    int v141 = [v52 isMedusaCapable];

    uint64_t v53 = [WeakRetained windowManagementStyle];
    uint64_t v138 = [WeakRetained windowManagementStyle];
    unint64_t v54 = [(SBApplicationSceneHandle *)self->_draggingApplicationSceneHandle application];
    int v140 = [v54 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:v50 displayIdentity:v51];

    uint64_t v180 = 0;
    v181 = &v180;
    uint64_t v182 = 0x2020000000;
    char v183 = 1;
    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke;
    v176[3] = &unk_1E6B04CC8;
    v176[4] = self;
    uint64_t v179 = v50;
    double v48 = v51;
    v177 = v48;
    v178 = &v180;
    SBLayoutRoleEnumerateAppLayoutRoles(v176);
    [(id)objc_opt_class() prototypeSettingsFullscreenActivationRegionSize];
    SBRectWithSize();
    UIRectCenteredXInRect();
    v184.CGFloat x = v36;
    v184.CGFloat y = v38;
    BOOL v55 = CGRectContainsPoint(v187, v184);
    double v56 = v17;
    [(id)objc_opt_class() prototypeSettingsSideActivationGutterSize];
    double v58 = v57;
    double v59 = v21;
    [(SBLayoutState *)self->_currentLayoutState interfaceOrientation];
    SBLayoutDefaultSideLayoutElementWidth();
    double v61 = v60;
    [(SBDragAndDropWorkspaceTransaction *)self _platterScale];
    if (v8)
    {
      unint64_t v63 = [(SBApplicationDropSession *)self->_dropSession dropZones];
      if (v53)
      {
        if (v141)
        {
          char v64 = v140;
          if (!*((unsigned char *)v181 + 24)) {
            char v64 = 0;
          }
          id v4 = v147;
          if (v64)
          {
            int64_t v49 = v63 < 2;
            char v65 = v63 > 1 || v55;
            if ((v65 & 1) == 0)
            {
              uint64_t v66 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
              CGFloat x = recta.origin.x;
              double v68 = v56;
              CGFloat y = recta.origin.y;
              double v70 = v21;
              if (v66 == 1) {
                BOOL v71 = v36 >= CGRectGetMidX(*(CGRect *)&x);
              }
              else {
                BOOL v71 = v36 < CGRectGetMidX(*(CGRect *)&x);
              }
              id v4 = v147;
              if (v71) {
                int64_t v49 = 4;
              }
              else {
                int64_t v49 = 5;
              }
            }
          }
          else
          {
            int64_t v49 = 1;
          }
          goto LABEL_84;
        }
        int64_t v49 = 1;
      }
      else
      {
        int64_t v49 = v55;
      }
      id v4 = v147;
LABEL_84:

      _Block_object_dispose(&v180, 8);
LABEL_85:

      goto LABEL_86;
    }
    double v96 = v62;
    CGFloat point = v38;
    uint64_t v97 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    CGFloat v98 = v36;
    double v99 = v58 + v58 + v61 * v96 * 0.5;
    double v133 = recta.origin.y * 0.5;
    double v134 = v36 + v142 * 0.15;
    BOOL v100 = v134 < recta.origin.y * 0.5;
    if (v97 == 1) {
      BOOL v100 = v134 >= recta.origin.y * 0.5;
    }
    if (v100) {
      int64_t v49 = 6;
    }
    else {
      int64_t v49 = 7;
    }
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_2;
    v164[3] = &unk_1E6B04CF0;
    v164[4] = self;
    id v135 = WeakRetained;
    id v165 = v135;
    double v166 = v36;
    CGFloat v167 = point;
    CGFloat v168 = recta.origin.x;
    double v169 = v56;
    CGFloat v170 = recta.origin.y;
    double v171 = v59;
    double v172 = v99;
    BOOL v174 = v55;
    int64_t v173 = v49;
    BOOL v175 = v53 != 0;
    id v139 = (uint64_t (**)(void))MEMORY[0x1D948C7A0](v164);
    v162[0] = MEMORY[0x1E4F143A8];
    v162[1] = 3221225472;
    v162[2] = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_3;
    v162[3] = &unk_1E6B04D18;
    *(double *)&v162[5] = v36;
    *(CGFloat *)&v162[6] = point;
    v162[4] = self;
    BOOL v163 = v55;
    id v137 = (uint64_t (**)(double, double, double, double, double, double, double, double, double, double))MEMORY[0x1D948C7A0](v162);
    *(void *)&recta.size.double height = MEMORY[0x1E4F143A8];
    uint64_t v150 = 3221225472;
    CGRect v151 = __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_4;
    CGRect v152 = &unk_1E6B04D40;
    CGRect v153 = self;
    double v154 = v142;
    uint64_t v155 = v42;
    CGFloat v156 = recta.origin.x;
    double v157 = v56;
    CGFloat v158 = recta.origin.y;
    double v159 = v59;
    double v160 = v36;
    CGFloat v161 = point;
    CGPoint v145 = (uint64_t (**)(void))MEMORY[0x1D948C7A0](&recta.size.height);
    int64_t v101 = [(SBApplicationDropSession *)self->_dropSession dropZones];
    if ((v141 & v140 & 1) == 0)
    {
      int64_t v49 = 1;
LABEL_82:
      id v4 = v147;
      goto LABEL_83;
    }
    if (*((unsigned char *)v181 + 24))
    {
      if (v101 != 2)
      {
        if (v101 != 1)
        {
          if (v101)
          {
            int64_t v49 = 0;
            goto LABEL_82;
          }
          id v4 = v147;
          if (![(SBMainDisplayLayoutState *)self->_currentLayoutState isFloatingSwitcherVisible])
          {
            CGFloat v102 = v139;
            if (self->_layoutElementForWindowDrag)
            {
              CGFloat v102 = v139;
              if (!self->_windowDragEnteredPlatterZone)
              {
                int64_t v103 = [(SBLayoutElement *)self->_layoutElementForWindowDrag layoutRole];
                CGFloat v102 = v145;
                if (v103 != 3)
                {
                  uint64_t v104 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
                  BOOL v105 = v134 >= v133;
                  if (v104 != 1) {
                    BOOL v105 = v134 < v133;
                  }
                  if (v105) {
                    int64_t v49 = 4;
                  }
                  else {
                    int64_t v49 = 5;
                  }
                  goto LABEL_82;
                }
              }
            }
            goto LABEL_72;
          }
LABEL_83:

          goto LABEL_84;
        }
        if (v53)
        {
          [(id)objc_opt_class() prototypeSettingsContentDraggingSideActivationWidth];
          double v113 = v112;
          [(id)objc_opt_class() prototypeSettingsContentDraggingFloatingActivationWidth];
          uint64_t v109 = v137[2](recta.origin.x, v56, recta.origin.y, v59, recta.origin.x, v56, recta.origin.y, v59, v113, v114);
          goto LABEL_78;
        }
LABEL_80:
        if (v55) {
          int64_t v49 = 1;
        }
        goto LABEL_82;
      }
      if (!v53) {
        goto LABEL_80;
      }
      [(id)objc_opt_class() prototypeSettingsWindowTearOffDraggingSideActivationWidth];
      double v143 = v110;
      [(id)objc_opt_class() prototypeSettingsWindowTearOffDraggingFloatingActivationWidth];
      id v4 = v147;
      if (!v55)
      {
        double v127 = v111;
        [(id)objc_opt_class() sourceSceneInterfaceOrientedBoundsForDropSession:self->_dropSession switcherController:v135];
        double v128 = v189.origin.x;
        double v129 = v189.origin.y;
        double width = v189.size.width;
        double height = v189.size.height;
        if (CGRectIsNull(v189)
          || (v190.size.double height = height,
              v190.origin.CGFloat x = v128,
              v190.origin.CGFloat y = v129,
              v190.size.double width = width,
              v186.CGFloat x = v98,
              v186.CGFloat y = point,
              !CGRectContainsPoint(v190, v186)))
        {
          uint64_t v132 = v139[2]();
        }
        else
        {
          uint64_t v132 = v137[2](recta.origin.x, v56, recta.origin.y, v59, v128, v129, width, height, recta.origin.y / recta.origin.y * v143, recta.origin.y / recta.origin.y * v127);
        }
        if (v132) {
          int64_t v49 = v132;
        }
        goto LABEL_83;
      }
LABEL_75:
      int64_t v49 = 1;
      goto LABEL_83;
    }
    id v4 = v147;
    if (v55)
    {
      if (!self->_layoutElementForWindowDrag) {
        goto LABEL_75;
      }
      int64_t v49 = 1;
      if (self->_windowDragEnteredPlatterZone) {
        goto LABEL_83;
      }
      CGFloat v102 = v145;
      if (v138 != 1) {
        goto LABEL_83;
      }
    }
    else
    {
      CGFloat v102 = v145;
      if (v138 != 1) {
        goto LABEL_75;
      }
    }
LABEL_72:
    uint64_t v109 = v102[2]();
LABEL_78:
    int64_t v49 = v109;
    goto LABEL_82;
  }
  int64_t v49 = 0;
LABEL_86:
  if ([(SBMainDisplayLayoutState *)self->_currentLayoutState unlockedEnvironmentMode] == 2
    && ([(SBApplicationDropSession *)self->_dropSession localContext],
        long long v115 = objc_claimAutoreleasedReturnValue(),
        uint64_t v116 = [v115 startLocation],
        v115,
        v116 == 11)
    && self->_dragAndDropGesture)
  {
    long long v117 = [(SBApplicationDropSession *)self->_dropSession uiDragDropSession];
    long long v118 = [v6 view];
    [v117 locationInView:v118];
    double v120 = v119;
    double v122 = v121;

    int64_t v123 = [(SBFluidSwitcherGesture *)self->_dragAndDropGesture selectedLayoutRole];
    double v124 = [(SBFluidSwitcherGesture *)self->_dragAndDropGesture selectedAppLayout];
    objc_msgSend(v6, "_switcherDropRegionContextForDraggingLayoutRole:inAppLayout:atLocation:", v123, v124, v120, v122);
    double v125 = (SBSwitcherDropRegionContext *)objc_claimAutoreleasedReturnValue();

    currentSwitcherDropRegionContext = self->_currentSwitcherDropRegionContext;
    self->_currentSwitcherDropRegionContext = v125;

    int64_t v49 = 10;
  }
  else
  {
    long long v117 = self->_currentSwitcherDropRegionContext;
    self->_currentSwitcherDropRegionContext = 0;
  }

  if (self->_currentDropAction != v49)
  {
    self->_int64_t currentDropAction = v49;
    [(SBDragAndDropWorkspaceTransaction *)self _updateCurrentDropActionProposedLayoutState];
  }
}

void __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 248) elementWithRole:a2];
  id v4 = [v3 workspaceEntity];
  id v8 = [v4 applicationSceneEntity];

  uint64_t v5 = v8;
  if (v8)
  {
    id v6 = [v8 application];
    char v7 = [v6 supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:a1[7] displayIdentity:a1[5]];

    uint64_t v5 = v8;
    if ((v7 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 248) layoutContainsRole:2])
  {
    if (*(unsigned char *)(a1 + 113))
    {
      double v41 = *(double *)(a1 + 48);
      if (v41 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 96))
      {
        BOOL v42 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v43 = 4;
        goto LABEL_34;
      }
      double v61 = *(double *)(a1 + 48);
      if (v61 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 96))
      {
        BOOL v59 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v60 = 4;
LABEL_41:
        if (v59) {
          return v60;
        }
        else {
          return v60 + 1;
        }
      }
    }
    if (*(unsigned char *)(a1 + 112)) {
      return 1;
    }
    return *(void *)(a1 + 104);
  }
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 248) appLayout];
  objc_msgSend(v2, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 1, v3, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "interfaceOrientation"));
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = *(void **)(a1 + 40);
  double v13 = [*(id *)(*(void *)(a1 + 32) + 248) appLayout];
  objc_msgSend(v12, "frameForItemWithRole:inMainAppLayout:interfaceOrientation:", 2, v13, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "interfaceOrientation"));
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  CGFloat v75 = v15;
  CGFloat v76 = v21;
  CGFloat v73 = v19;
  CGFloat v74 = v17;
  if (SBSpaceConfigurationIsSplitView([*(id *)(*(void *)(a1 + 32) + 248) spaceConfiguration]))
  {
    v77.origin.CGFloat x = v5;
    v77.origin.CGFloat y = v7;
    v77.size.CGFloat width = v9;
    v77.size.CGFloat height = v11;
    double MinX = CGRectGetMinX(v77);
    v78.origin.CGFloat x = v15;
    v78.origin.CGFloat y = v17;
    v78.size.CGFloat width = v19;
    v78.size.CGFloat height = v21;
    double v22 = CGRectGetMinX(v78);
    BOOL v23 = MinX < v22;
    if (MinX >= v22) {
      CGFloat v24 = v15;
    }
    else {
      CGFloat v24 = v5;
    }
    double v25 = v15;
    if (MinX >= v22) {
      CGFloat v26 = v17;
    }
    else {
      CGFloat v26 = v7;
    }
    double v27 = v17;
    if (MinX >= v22) {
      CGFloat v28 = v19;
    }
    else {
      CGFloat v28 = v9;
    }
    double v29 = v19;
    if (MinX >= v22) {
      CGFloat v30 = v21;
    }
    else {
      CGFloat v30 = v11;
    }
    double v71 = v5;
    if (v23)
    {
      CGFloat v5 = v25;
      double v31 = v27;
    }
    else
    {
      double v31 = v7;
    }
    if (v23) {
      double v32 = v29;
    }
    else {
      double v32 = v9;
    }
    CGFloat v63 = v32;
    CGFloat v64 = v31;
    if (v23) {
      double v33 = v21;
    }
    else {
      double v33 = v11;
    }
    CGFloat rect = v33;
    CGFloat v34 = v24;
    v79.origin.CGFloat x = v24;
    v79.origin.CGFloat y = v26;
    v79.size.CGFloat width = v28;
    v79.size.CGFloat height = v30;
    CGFloat MaxX = CGRectGetMaxX(v79);
    v80.origin.CGFloat x = v34;
    v80.origin.CGFloat y = v26;
    v80.size.CGFloat width = v28;
    v80.size.CGFloat height = v30;
    CGFloat MinY = CGRectGetMinY(v80);
    v81.origin.CGFloat x = v5;
    v81.size.CGFloat width = v63;
    v81.origin.CGFloat y = v64;
    v81.size.CGFloat height = rect;
    double v35 = CGRectGetMinX(v81);
    v82.origin.CGFloat x = v34;
    v82.origin.CGFloat y = v26;
    v82.size.CGFloat width = v28;
    v82.size.CGFloat height = v30;
    CGFloat v36 = v35 - CGRectGetMaxX(v82);
    v83.origin.CGFloat x = v34;
    v83.origin.CGFloat y = v26;
    v83.size.CGFloat width = v28;
    v83.size.CGFloat height = v30;
    v84.size.CGFloat height = CGRectGetHeight(v83);
    v84.origin.CGFloat y = MinY;
    v84.origin.CGFloat x = MaxX;
    v84.size.CGFloat width = v36;
    CGFloat v5 = v71;
    CGRect v85 = CGRectInset(v84, -50.0, 0.0);
    CGFloat x = v85.origin.x;
    CGFloat y = v85.origin.y;
    CGFloat width = v85.size.width;
    CGFloat height = v85.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  objc_msgSend(*(id *)(a1 + 40), "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "interfaceOrientation", *(void *)&rect), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "floatingConfiguration"));
  CGFloat v69 = v45;
  CGFloat v72 = v44;
  CGFloat v65 = v47;
  CGFloat v67 = v46;
  v86.origin.CGFloat x = v5;
  v86.origin.CGFloat y = v7;
  v86.size.CGFloat width = v9;
  v86.size.CGFloat height = v11;
  BOOL v48 = CGRectContainsPoint(v86, *(CGPoint *)(a1 + 48));
  v87.origin.CGFloat y = v74;
  v87.origin.CGFloat x = v75;
  v87.size.CGFloat width = v73;
  v87.size.CGFloat height = v76;
  BOOL v49 = CGRectContainsPoint(v87, *(CGPoint *)(a1 + 48));
  v88.origin.CGFloat x = x;
  v88.origin.CGFloat y = y;
  v88.size.CGFloat width = width;
  v88.size.CGFloat height = height;
  BOOL v50 = CGRectContainsPoint(v88, *(CGPoint *)(a1 + 48));
  if ([*(id *)(*(void *)(a1 + 32) + 248) layoutContainsRole:3])
  {
    [*(id *)(a1 + 32) _platterFrameInSwitcherView];
    v90.origin.CGFloat x = v51;
    v90.origin.CGFloat y = v52;
    v90.size.CGFloat width = v53;
    v90.size.CGFloat height = v54;
    v89.origin.CGFloat y = v69;
    v89.origin.CGFloat x = v72;
    v89.size.CGFloat height = v65;
    v89.size.CGFloat width = v67;
    BOOL v55 = CGRectIntersectsRect(v89, v90);
  }
  else
  {
    BOOL v55 = 0;
  }
  double v56 = *(double *)(a1 + 48);
  if (v56 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 96))
  {
    BOOL v42 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v43 = 2;
LABEL_34:
    if (v42) {
      return v43 + 1;
    }
    else {
      return v43;
    }
  }
  double v58 = *(double *)(a1 + 48);
  if (v58 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 96))
  {
    BOOL v59 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    uint64_t v60 = 2;
    goto LABEL_41;
  }
  if (*(unsigned char *)(a1 + 112)) {
    return 1;
  }
  if (v50 || v55) {
    return *(void *)(a1 + 104);
  }
  uint64_t result = v48 ? 2 : 3;
  if (!v48 && !v49) {
    return *(void *)(a1 + 104);
  }
  return result;
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  v34.origin.CGFloat x = a6;
  v34.origin.CGFloat y = a7;
  v34.size.CGFloat width = a8;
  v34.size.CGFloat height = a9;
  double MinX = CGRectGetMinX(v34);
  v35.origin.CGFloat x = a6;
  v35.origin.CGFloat y = a7;
  v35.size.CGFloat width = a8;
  v35.size.CGFloat height = a9;
  double v25 = CGRectGetMaxX(v35);
  double v26 = *(double *)(a1 + 40);
  int v27 = [*(id *)(*(void *)(a1 + 32) + 248) layoutContainsRole:2];
  if (v26 >= a10 && v26 <= MaxX - a10)
  {
    if (v26 >= MinX + a11 && v26 <= v25 - a11) {
      return *(unsigned __int8 *)(a1 + 56);
    }
    BOOL v30 = v26 < MinX + a11 == ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1);
    uint64_t v31 = 6;
  }
  else
  {
    int v29 = v27;
    BOOL v30 = v26 < a10 == ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1);
    if (v29) {
      uint64_t v31 = 2;
    }
    else {
      uint64_t v31 = 4;
    }
  }
  if (v30) {
    return v31 + 1;
  }
  else {
    return v31;
  }
}

uint64_t __72__SBDragAndDropWorkspaceTransaction__updateCurrentDropActionForSession___block_invoke_4(uint64_t a1)
{
  [(id)objc_opt_class() prototypeSettingsContentDraggingFloatingActivationWidth];
  unint64_t v3 = SBFloatingConfigurationForMovingFloatingApplication([*(id *)(*(void *)(a1 + 32) + 248) floatingConfiguration], *(void **)(*(void *)(a1 + 32) + 464), *(double *)(a1 + 40), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), v2, *(double *)(a1 + 88));
  if (v3 > 4) {
    return 0;
  }
  else {
    return qword_1D8FD1D40[v3];
  }
}

- (BOOL)_showResizeUI
{
  BOOL v3 = self->_sessionState != 2
    && (self->_currentDropAction & 0xFFFFFFFFFFFFFFFELL) == 4
    && (!self->_layoutElementForWindowDrag || self->_windowDragEnteredPlatterZone);
  BOOL v4 = v3 & ([(SBDragAndDropWorkspaceTransaction *)self isInterrupted] ^ 1);
  return self->_sceneUpdateTransactionForWindowDrag || v4;
}

- (id)_transitionRequestForDropAction:(int64_t)a3
{
  CGFloat v5 = self;
  v136[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  CGFloat v7 = [WeakRetained switcherCoordinator];
  double v8 = [WeakRetained contentViewController];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      CGFloat v11 = v10;
    }
    else {
      CGFloat v11 = 0;
    }
  }
  else
  {
    CGFloat v11 = 0;
  }
  id v12 = v11;

  double v13 = [(SBWorkspaceTransaction *)v5 transitionRequest];
  double v14 = [v13 workspace];
  CGFloat v15 = [v13 displayConfiguration];
  double v16 = [v14 createRequestWithOptions:0 displayConfiguration:v15];

  double v112 = v13;
  objc_msgSend(v16, "setSource:", objc_msgSend(v13, "source"));
  [v16 setEventLabel:@"DragAndDropAppActivation"];
  CGFloat v17 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  [(SBWorkspaceApplicationSceneTransitionContext *)v17 setDelegate:v5];
  id v109 = v16;
  [v16 setApplicationContext:v17];
  double v18 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:v5->_draggingApplicationSceneHandle];
  CGFloat v19 = [(SBApplicationDropSession *)v5->_dropSession launchActions];
  [(SBApplicationSceneEntity *)v18 addActions:v19];

  double v20 = [(SBApplicationDropSession *)v5->_dropSession activationSettings];
  [(SBWorkspaceEntity *)v18 applyActivationSettings:v20];

  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke;
  v130[3] = &unk_1E6AFE7D8;
  v130[4] = v5;
  v130[5] = a2;
  double v114 = (uint64_t (**)(void, void, void))MEMORY[0x1D948C7A0](v130);
  CGFloat v21 = [(SBApplicationDropSession *)v5->_dropSession uiDragDropSession];
  double v22 = [v12 view];
  [v21 locationInView:v22];
  double v24 = v23;
  double v26 = v25;

  long long v115 = v12;
  int v27 = [v12 view];
  [v27 bounds];
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v24, v26, v28, v29, v30, v31);
  double v33 = v32;
  double v35 = v34;

  long long v117 = WeakRetained;
  long long v118 = v7;
  uint64_t v116 = v5;
  double v119 = v17;
  double v120 = v18;
  int64_t v113 = a3;
  switch(a3)
  {
    case 0:
      CGFloat v36 = +[SBWorkspaceEntity entity];
      double v37 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:MEMORY[0x1E4F1CBF0] withPolicy:1 centerEntity:v36 floatingEntity:v37];
      goto LABEL_13;
    case 1:
      v136[0] = v18;
      CGFloat v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:1];
      double v39 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:v38 withPolicy:0 centerEntity:0 floatingEntity:v39];

      if (![WeakRetained isChamoisWindowingUIEnabled]) {
        goto LABEL_63;
      }
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 _setRequestedFrontmostEntity:v18];
      double v40 = [(SBWorkspaceApplicationSceneTransitionContext *)v17 requestedLayoutAttributesForEntity:v18];
      double v41 = objc_msgSend(v40, "attributesByModifyingNormalizedCenter:", v33, v35);

      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setRequestedLayoutAttributes:v41 forEntity:v18];
      goto LABEL_62;
    case 2:
      v135[0] = v18;
      CGFloat v36 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];
      v135[1] = v36;
      BOOL v42 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v43 = v135;
      goto LABEL_12;
    case 3:
      CGFloat v36 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];
      v134[0] = v36;
      v134[1] = v18;
      BOOL v42 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v43 = v134;
LABEL_12:
      double v37 = [v42 arrayWithObjects:v43 count:2];
      double v44 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:v37 withPolicy:0 centerEntity:0 floatingEntity:v44];

      double v18 = v120;
LABEL_13:

      goto LABEL_63;
    case 4:
      if ([WeakRetained isChamoisWindowingUIEnabled])
      {
        double v133 = v18;
        double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
        double v46 = &SBLayoutRolePrimary;
        goto LABEL_18;
      }
      layoutElementForWindowDrag = v5->_layoutElementForWindowDrag;
      if (!layoutElementForWindowDrag || v5->_windowDragEnteredPlatterZone)
      {
        [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v18 forLayoutRole:1];
        CGFloat v67 = [(SBLayoutState *)v5->_currentLayoutState elementWithRole:1];
        double v68 = [v67 workspaceEntity];
        [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v68 forLayoutRole:2];

        if (v5->_layoutElementForWindowDrag
          && (unint64_t v69 = SBLayoutRoleMaskAppLayout(),
              SBLayoutRoleMaskContainsRole(v69, [(SBLayoutElement *)v5->_layoutElementForWindowDrag layoutRole])))
        {
          if ([(SBLayoutElement *)v5->_layoutElementForWindowDrag layoutRole] == 2) {
            uint64_t v70 = v114[2](v114, [(SBMainDisplayLayoutState *)v5->_initialLayoutState spaceConfiguration], [(SBLayoutState *)v5->_initialLayoutState interfaceOrientation]);
          }
          else {
            uint64_t v70 = [(SBMainDisplayLayoutState *)v5->_initialLayoutState spaceConfiguration];
          }
          uint64_t v78 = v70;
          CGRect v77 = v17;
        }
        else
        {
          CGRect v77 = v17;
          uint64_t v78 = 3;
        }
        [(SBWorkspaceApplicationSceneTransitionContext *)v77 setRequestedSpaceConfiguration:v78];
        double v18 = v120;
        goto LABEL_61;
      }
      if ([(SBLayoutElement *)layoutElementForWindowDrag layoutRole] != 2) {
        goto LABEL_53;
      }
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v18 forLayoutRole:1];
      CGRect v83 = [(SBLayoutState *)v5->_currentLayoutState elementWithRole:1];
      CGRect v84 = [v83 workspaceEntity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v84 forLayoutRole:2];

      double v18 = v120;
      uint64_t v85 = [(SBMainDisplayLayoutState *)v5->_currentLayoutState spaceConfiguration];
      currentLayoutState = v5->_currentLayoutState;
      goto LABEL_52;
    case 5:
      if (![WeakRetained isChamoisWindowingUIEnabled])
      {
        double v71 = v5->_layoutElementForWindowDrag;
        if (v71 && !v5->_windowDragEnteredPlatterZone)
        {
          if ([(SBLayoutElement *)v71 layoutRole] == 1)
          {
            CGRect v87 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:2];
            [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v87 forLayoutRole:1];

            double v18 = v120;
            [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v120 forLayoutRole:2];
            uint64_t v74 = 248;
LABEL_51:
            uint64_t v85 = [*(id *)((char *)&v5->super.super.super.super.super.isa + v74) spaceConfiguration];
            currentLayoutState = *(SBMainDisplayLayoutState **)((char *)&v5->super.super.super.super.super.isa + v74);
LABEL_52:
            uint64_t v88 = v114[2](v114, v85, [(SBLayoutState *)currentLayoutState interfaceOrientation]);
            goto LABEL_59;
          }
LABEL_53:
          uint64_t v89 = 248;
        }
        else
        {
          CGFloat v72 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:1];
          [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v72 forLayoutRole:1];

          [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v18 forLayoutRole:2];
          if (!v5->_layoutElementForWindowDrag
            || (unint64_t v73 = SBLayoutRoleMaskAppLayout(),
                !SBLayoutRoleMaskContainsRole(v73, [(SBLayoutElement *)v5->_layoutElementForWindowDrag layoutRole])))
          {
            CGRect v79 = v17;
            uint64_t v80 = 3;
LABEL_60:
            [(SBWorkspaceApplicationSceneTransitionContext *)v79 setRequestedSpaceConfiguration:v80];
            goto LABEL_61;
          }
          if ([(SBLayoutElement *)v5->_layoutElementForWindowDrag layoutRole] == 1)
          {
            uint64_t v74 = 240;
            goto LABEL_51;
          }
          uint64_t v89 = 240;
        }
        uint64_t v88 = [*(id *)((char *)&v5->super.super.super.super.super.isa + v89) spaceConfiguration];
LABEL_59:
        uint64_t v80 = v88;
        CGRect v79 = v17;
        goto LABEL_60;
      }
      uint64_t v132 = v18;
      double v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1];
      double v46 = &SBLayoutRoleSide;
LABEL_18:
      uint64_t v47 = *v46;
      BOOL v48 = +[SBWorkspaceEntity entity];
      BOOL v49 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:v45 startingAtLayoutRole:v47 withPolicy:1 centerEntity:v48 floatingEntity:v49];

      double v18 = v120;
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 _setRequestedFrontmostEntity:v120];
      BOOL v50 = [(SBWorkspaceApplicationSceneTransitionContext *)v17 requestedLayoutAttributesForEntity:v120];
      CGFloat v51 = objc_msgSend(v50, "attributesByModifyingNormalizedCenter:", v33, v35);

      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setRequestedLayoutAttributes:v51 forEntity:v120];
LABEL_61:
      double v41 = +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:3];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntity:v41 forLayoutRole:3];
LABEL_62:

LABEL_63:
      double v111 = [(SBApplicationDropSession *)v5->_dropSession localContext];
      double v110 = [v7 _recentAppLayoutsController];
      CGRect v90 = [(SBApplicationSceneEntity *)v18 application];
      double v121 = [v90 bundleIdentifier];

      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id obja = [(SBLayoutState *)v5->_currentLayoutState elements];
      uint64_t v91 = [obja countByEnumeratingWithState:&v124 objects:v131 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = 0;
        uint64_t v94 = *(void *)v125;
        do
        {
          for (uint64_t i = 0; i != v92; ++i)
          {
            if (*(void *)v125 != v94) {
              objc_enumerationMutation(obja);
            }
            double v96 = [*(id *)(*((void *)&v124 + 1) + 8 * i) workspaceEntity];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v97 = objc_opt_class();
              CGFloat v98 = SBSafeCast(v97, v96);
              double v99 = [v98 application];
              BOOL v100 = [v99 bundleIdentifier];
              unsigned int v101 = [v100 isEqualToString:v121];

              v93 += v101;
            }
          }
          uint64_t v92 = [obja countByEnumeratingWithState:&v124 objects:v131 count:16];
        }
        while (v92);
      }
      else
      {
        uint64_t v93 = 0;
      }

      uint64_t v102 = [v111 startLocation];
      int64_t v103 = [(SBApplicationDropSession *)v116->_dropSession launchActions];
      uint64_t v104 = [v103 count];

      uint64_t v105 = [(SBApplicationDropSession *)v116->_dropSession dropZones];
      if (!v104 && v102 != 12 && (v102 & 0xFFFFFFFFFFFFFFFELL) != 8 && v113 && !v105)
      {
        v106 = [v110 recentDisplayItemsForBundleIdentifier:v121 includingHiddenAppLayouts:0];
        if ((unint64_t)[v106 count] >= 2)
        {
          uint64_t v107 = [v106 count];
          if (v113 == 1 && v107 - v93 >= 2)
          {
            [(SBWorkspaceApplicationSceneTransitionContext *)v119 setRequestedAppExposeBundleID:v121];
          }
          else if (v113 != 1)
          {
            [(SBWorkspaceApplicationSceneTransitionContext *)v119 setRequestedWindowPickerRole:[(SBWorkspaceEntity *)v120 layoutRole]];
          }
        }
      }
      [(SBWorkspaceApplicationSceneTransitionContext *)v119 setPreferredInterfaceOrientation:[(SBLayoutState *)v116->_initialLayoutState interfaceOrientation]];

      return v109;
    case 6:
      CGFloat v52 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:MEMORY[0x1E4F1CBF0] withPolicy:1 centerEntity:v52 floatingEntity:v18];

      CGFloat v53 = v17;
      uint64_t v54 = 1;
      goto LABEL_23;
    case 7:
      BOOL v55 = +[SBWorkspaceEntity entity];
      [(SBWorkspaceApplicationSceneTransitionContext *)v17 setEntities:MEMORY[0x1E4F1CBF0] withPolicy:1 centerEntity:v55 floatingEntity:v18];

      CGFloat v53 = v17;
      uint64_t v54 = 2;
      goto LABEL_23;
    case 8:
      CGFloat v53 = v17;
      uint64_t v54 = 3;
      goto LABEL_23;
    case 9:
      CGFloat v53 = v17;
      uint64_t v54 = 4;
LABEL_23:
      [(SBWorkspaceApplicationSceneTransitionContext *)v53 setRequestedFloatingConfiguration:v54];
      goto LABEL_63;
    case 10:
      double v56 = v5->_currentSwitcherDropRegionContext;
      uint64_t v57 = [(SBSwitcherDropRegionContext *)v56 currentDropRegion];
      double v58 = [(SBSwitcherDropRegionContext *)v56 draggingLeafAppLayout];
      BOOL v59 = [v12 appLayouts];
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke_2;
      v128[3] = &unk_1E6AF4B60;
      id v60 = v58;
      id v129 = v60;
      double v61 = objc_msgSend(v59, "bs_firstObjectPassingTest:", v128);

      if ((v57 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        id obj = v60;
        double v62 = [v61 itemForLayoutRole:1];
        CGFloat v63 = [v61 itemForLayoutRole:2];
        CGFloat v64 = [v7 _entityForDisplayItem:v62 switcherController:WeakRetained];
        CGFloat v65 = [v7 _entityForDisplayItem:v63 switcherController:WeakRetained];
        [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v64 forLayoutRole:1];
        [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v65 forLayoutRole:2];
        -[SBWorkspaceApplicationSceneTransitionContext setRequestedSpaceConfiguration:](v119, "setRequestedSpaceConfiguration:", SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v61 configuration]));
      }
      else
      {
        if (v57 == 6)
        {
          id obj = v60;
          double v62 = [v61 itemForLayoutRole:1];
          CGFloat v63 = [v7 _entityForDisplayItem:v62 switcherController:WeakRetained];
          [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v63 forLayoutRole:3];
          CGRect v81 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v81 forLayoutRole:1];

          CGRect v82 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v82 forLayoutRole:2];

          CGFloat v76 = v119;
        }
        else
        {
          if (v57 != 3) {
            goto LABEL_46;
          }
          id obj = v60;
          double v62 = [v61 itemForLayoutRole:1];
          CGFloat v63 = [v7 _entityForDisplayItem:v62 switcherController:WeakRetained];
          [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v63 forLayoutRole:1];
          CGFloat v75 = +[SBWorkspaceEntity entity];
          [(SBWorkspaceApplicationSceneTransitionContext *)v119 setEntity:v75 forLayoutRole:2];

          CGFloat v76 = v119;
        }
        [(SBWorkspaceApplicationSceneTransitionContext *)v76 setRequestedSpaceConfiguration:1];
      }

      id v60 = obj;
LABEL_46:
      [(SBWorkspaceApplicationSceneTransitionContext *)v119 setRequestedUnlockedEnvironmentMode:2];

      CGFloat v5 = v116;
      double v18 = v120;
      goto LABEL_63;
    default:
      goto LABEL_63;
  }
}

unint64_t __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation(a2, a3);
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      CGFloat v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = a1 + 32;
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v8 + 8);
      uint64_t v9 = SBStringForSpaceConfiguration(v4);
      [v5 handleFailureInMethod:v7, v6, @"SBDragAndDropWorkspaceTransaction.m", 2514, @"Can't swap primary/side in space configuration: %@", v9 object file lineNumber description];

      break;
    case 2uLL:
      unint64_t v4 = 4;
      break;
    case 3uLL:
      unint64_t v4 = 3;
      break;
    case 4uLL:
      unint64_t v4 = 2;
      break;
    default:
      return v4;
  }
  return v4;
}

uint64_t __69__SBDragAndDropWorkspaceTransaction__transitionRequestForDropAction___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 itemForLayoutRole:1];
  CGFloat v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 containsItemWithUniqueIdentifier:v5];

  return v6;
}

- (CGSize)_sizeForFloatingApplication
{
  p_cachedSizeForFloatingApplication = &self->_cachedSizeForFloatingApplication;
  if (BSSizeEqualToSize())
  {
    unint64_t v4 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
    CGFloat v5 = [v4 sceneEntityFrameProvider];

    uint64_t v6 = [(SBDragAndDropWorkspaceTransaction *)self _transitionRequestForDropAction:7];
    [v6 finalize];
    uint64_t v7 = [v6 applicationContext];
    uint64_t v8 = [v7 layoutState];

    uint64_t v9 = [v8 elementWithRole:3];
    id v10 = [v9 workspaceEntity];
    [v5 sceneEntityFrameForWorkspaceEntity:v10 inLayoutState:v8];
    p_cachedSizeForFloatingApplication->double width = v11;
    p_cachedSizeForFloatingApplication->double height = v12;
  }
  double width = p_cachedSizeForFloatingApplication->width;
  double height = p_cachedSizeForFloatingApplication->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_cleanUpAndCompleteTransactionIfNecessary
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    dropSession = self->_dropSession;
    int v5 = 138543362;
    uint64_t v6 = dropSession;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "SBAppDrop transaction _cleanUpAndCompleteTransactionIfNecessary for session %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:0 animated:1];
}

- (void)_configurePlatterPreview:(id)a3 forSceneHandle:(id)a4 completion:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v30 platterView];

  if (!v10)
  {
    CGFloat v11 = [v30 sourceView];
    if (v11)
    {
      [v30 configurePlatterForSceneHandle:v8 withTargetView:v11 completion:v9];
    }
    else
    {
      CGFloat v12 = [(SBDeviceApplicationScenePlaceholderContentContext *)[SBMutableDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:0];
      [(SBDeviceApplicationScenePlaceholderContentContext *)v12 setPreferredContentType:1];
      int64_t v13 = [(SBLayoutState *)self->_currentLayoutState interfaceOrientation];
      currentLayoutState = self->_currentLayoutState;
      CGFloat v15 = [v8 sceneIdentifier];
      uint64_t v16 = [(SBLayoutState *)currentLayoutState interfaceOrientationForElementIdentifier:v15];

      CGFloat v17 = [(SBWorkspaceTransaction *)self displayConfiguration];
      [v17 pointScale];
      double v19 = v18;

      double v20 = [v8 mostRecentSceneSnapshotsForScale:v16 launchingOrientation:v19];
      [(SBDragAndDropWorkspaceTransaction *)self _sizeForFloatingApplication];
      double v22 = v21;
      double v24 = v23;
      if ([v20 count])
      {
        double v25 = [v20 sortedArrayUsingComparator:&__block_literal_global_208];

        double v26 = [v25 firstObject];
        [v26 referenceSize];
        double v22 = v27;
        double v24 = v28;

        double v20 = v25;
      }
      double v29 = objc_msgSend(v8, "newSceneViewWithReferenceSize:contentOrientation:containerOrientation:hostRequester:", v16, v13, 0, v22, v24);
      [v29 setPlaceholderContentContext:v12];
      [v29 setDisplayMode:2 animationFactory:0 completion:0];
      [v30 configurePlatterForSceneHandle:v8 withTargetView:v29 completion:v9];
    }
  }
}

uint64_t __88__SBDragAndDropWorkspaceTransaction__configurePlatterPreview_forSceneHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 referenceSize];
  double v6 = v5;
  double v8 = v7;
  [v4 referenceSize];
  double v10 = v9;
  double v12 = v11;

  int64_t v13 = [NSNumber numberWithDouble:v6 * v8];
  double v14 = [NSNumber numberWithDouble:v10 * v12];
  uint64_t v15 = [v13 compare:v14];

  return v15;
}

- (void)_updateAnchorPointForPlatterPreview:(id)a3 dragPreview:(id)a4 withSourceViewBounds:(CGRect)a5 location:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.size.height;
  double width = a5.size.width;
  double v26 = self->_medusaSettings;
  layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(SBLayoutElement *)layoutElementForWindowDrag layoutRole];
  if (v16 == 3) {
    goto LABEL_2;
  }
  uint64_t v19 = v16;
  uint64_t v20 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation([(SBMainDisplayLayoutState *)self->_currentLayoutState spaceConfiguration], [(SBLayoutState *)self->_currentLayoutState interfaceOrientation]);
  if (v20 == 2)
  {
    CGFloat v17 = v26;
    if (v19 == 1) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  if (v20 == 4)
  {
    if (v19 != 1)
    {
LABEL_2:
      CGFloat v17 = v26;
LABEL_3:
      [(SBMedusaSettings *)v17 narrowEdgeSwipeHitTestWidth];
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  double v18 = 0.0;
  if (v20 == 3)
  {
LABEL_11:
    CGFloat v17 = v26;
LABEL_12:
    [(SBMedusaSettings *)v17 wideEdgeSwipeHitTestWidth];
  }
LABEL_13:
  double v21 = v18 * 0.5;
  double v22 = width * 0.5 + v21;
  double v23 = width * 0.5 - v21;
  if (v23 < x) {
    double v23 = x;
  }
  if (v22 <= v23) {
    double v24 = v22;
  }
  else {
    double v24 = v23;
  }
  +[SBNubView height];
  if (y > v25) {
    double y = v25;
  }
  objc_msgSend(v14, "setLiftAnchorPoint:", v24, y);

  objc_msgSend(v15, "setAnchorPoint:", v24 / width, y / height);
}

- (int64_t)_layoutRoleForDropAction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      layoutElementForWindowDrag = self->_layoutElementForWindowDrag;
      if (!layoutElementForWindowDrag)
      {
        id v3 = &SBLayoutRoleUndefined;
        goto LABEL_5;
      }
      return [(SBLayoutElement *)layoutElementForWindowDrag layoutRole];
    case 1:
    case 2:
    case 4:
    case 10:
      id v3 = &SBLayoutRolePrimary;
      goto LABEL_5;
    case 3:
    case 5:
      id v3 = &SBLayoutRoleSide;
      goto LABEL_5;
    case 6:
    case 7:
    case 8:
    case 9:
      id v3 = &SBLayoutRoleFloating;
LABEL_5:
      int64_t result = *v3;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)_createPlatterPreviewForApplication:(id)a3 withSourceView:(id)a4 dropSession:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [(SBDragAndDropWorkspaceTransaction *)self _iconManager];
  int64_t v13 = [v12 iconModel];
  if ([v9 isWebApplication])
  {
    id v14 = [v11 localContext];
    id v15 = [v14 draggedSceneIdentifier];

    uint64_t v16 = +[SBWebApplication _webClipIdentifierFromWebAppIdentifier:v15];
    CGFloat v17 = [v13 leafIconForIdentifier:v16];
  }
  else
  {
    id v15 = [v9 bundleIdentifier];
    CGFloat v17 = [v13 applicationIconForBundleIdentifier:v15];
  }

  if (!v17)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    double v34 = [v9 bundleIdentifier];
    [v33 handleFailureInMethod:a2, self, @"SBDragAndDropWorkspaceTransaction.m", 2871, @"icon must exist for application identifier %@", v34 object file lineNumber description];
  }
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4FA6430]) initWithConfigurationOptions:6];
  [v18 setLocation:*MEMORY[0x1E4FA66D0]];
  uint64_t v19 = [v12 listLayoutProvider];
  [v18 setListLayoutProvider:v19];

  [v18 setDelegate:v12];
  [v18 setIcon:v17];
  [v18 setEnabled:0];
  uint64_t v20 = [[SBAppPlatterDragPreview alloc] initWithReferenceIconView:v18 sourceView:v10];
  [(SBAppPlatterDragPreview *)v20 setAlpha:0.0];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100__SBDragAndDropWorkspaceTransaction__createPlatterPreviewForApplication_withSourceView_dropSession___block_invoke;
  v35[3] = &unk_1E6B00CD8;
  id v21 = v12;
  id v36 = v21;
  [(SBAppPlatterDragPreview *)v20 setCleanUpHandler:v35];
  double v22 = [v21 iconDragManager];
  double v23 = [(SBWorkspaceTransaction *)self windowScene];
  [v22 addPlatterViewToMedusaDragOffscreenWindow:v20 forWindowScene:v23];

  if (v10)
  {
    [v10 bounds];
    UIRectGetCenter();
    double v25 = v24;
    double v27 = v26;
    double v28 = [(SBAppPlatterDragPreview *)v20 window];
    double v29 = v10;
  }
  else
  {
    [v18 iconImageCenter];
    double v25 = v30;
    double v27 = v31;
    double v28 = [v18 window];
    double v29 = v18;
  }
  objc_msgSend(v29, "convertPoint:toView:", v28, v25, v27);
  -[SBAppPlatterDragPreview setCenter:](v20, "setCenter:");

  return v20;
}

void __100__SBDragAndDropWorkspaceTransaction__createPlatterPreviewForApplication_withSourceView_dropSession___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconDragManager];
  [v4 removePlatterViewFromMedusaDragOffscreenWindow:v3];
}

- (void)_updateCurrentDropActionProposedLayoutState
{
  id v6 = [(SBDragAndDropWorkspaceTransaction *)self _transitionRequestForDropAction:self->_currentDropAction];
  [v6 finalize];
  id v3 = [v6 applicationContext];
  id v4 = [v3 layoutState];
  currentDropActionProposedLayoutState = self->_currentDropActionProposedLayoutState;
  self->_currentDropActionProposedLayoutState = v4;
}

- (id)resizeUIAnimationFactory
{
  return (id)[MEMORY[0x1E4F4F898] factoryWithDuration:0.25];
}

- (id)_iconManager
{
  double v2 = [(SBWorkspaceTransaction *)self windowScene];
  id v3 = [v2 homeScreenController];
  id v4 = [v3 iconManager];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = +[SBIconController sharedInstance];
    id v6 = [v7 iconManager];
  }
  return v6;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = a3;
  double v5 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  id v6 = [v5 layoutStateForApplicationTransitionContext:v4];

  return v6;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  return self->_currentLayoutState;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 request];
  [v7 applicationTransitionContext:v6 frameForApplicationSceneEntity:v5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v5 = a3;
  if ([(NSMutableSet *)self->_pendingSceneUpdatesTransactions count])
  {
    [(NSMutableSet *)self->_pendingSceneUpdatesTransactions removeObject:v5];
    if (![(NSMutableSet *)self->_pendingSceneUpdatesTransactions count]) {
      [(SBDragAndDropWorkspaceTransaction *)self _updatePlatterPreviewForSetDown:1 animated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_dragAndDropGesture, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_chamoisSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesForDragAndDropAssertion, 0);
  objc_storeStrong((id *)&self->_contentDragPreview, 0);
  objc_storeStrong((id *)&self->_activeSourceViewProvider, 0);
  objc_storeStrong((id *)&self->_activePlatterPreview, 0);
  objc_storeStrong((id *)&self->_pendingSceneUpdatesTransactions, 0);
  objc_storeStrong((id *)&self->_displayLinkForWindowDrag, 0);
  objc_storeStrong((id *)&self->_sceneUpdateTransactionForWindowDrag, 0);
  objc_storeStrong((id *)&self->_layoutElementForWindowDrag, 0);
  objc_storeStrong((id *)&self->_currentDropActionProposedLayoutState, 0);
  objc_storeStrong((id *)&self->_currentSwitcherDropRegionContext, 0);
  objc_storeStrong((id *)&self->_currentWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_dropTransitionRequest, 0);
  objc_storeStrong((id *)&self->_draggingApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_finalLayoutState, 0);
  objc_storeStrong((id *)&self->_currentLayoutState, 0);
  objc_storeStrong((id *)&self->_initialLayoutState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_addChildWorkspaceTransaction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Adding child transaction: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateCurrentDropActionForSession:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBAppDrop Disallowing drop because dragging to Medusa space while a center window is active is not supported.", v1, 2u);
}

- (void)_updateCurrentDropActionForSession:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBAppDrop Disallowing drop because a folder in the dock is open.", v1, 2u);
}

@end