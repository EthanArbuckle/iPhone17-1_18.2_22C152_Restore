@interface UIKeyboardArbiterClientInputDestination
@end

@implementation UIKeyboardArbiterClientInputDestination

void __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, char a4)
{
  v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke_2;
  v8[3] = &unk_1E52ECF60;
  char v10 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v11 = a4;
  [v7 performAsync:v8];

  objc_destroyWeak(&v9);
}

void __74___UIKeyboardArbiterClientInputDestination_startConnectionWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = [WeakRetained pendingKeyboardGrabs];
    [v4 removeAllObjects];

    if (*(unsigned char *)(a1 + 41))
    {
      id v5 = objc_loadWeakRetained(v2);
      [v5 setDisableBecomeFirstResponder:1];
    }
  }
}

void __67___UIKeyboardArbiterClientInputDestination_currentBundleIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)qword_1EB25D288;
  qword_1EB25D288 = v0;
}

uint64_t __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) shouldSnapshot]) {
    [*(id *)(a1 + 32) reloadForSnapshotting];
  }
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) name];
  v4 = [@"notification: " stringByAppendingString:v3];
  id v5 = v4;
  if (v2)
  {
    uint64_t v6 = [v4 UTF8String];
    int v7 = [v2 wantsToShowKeyboard];
    v8 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = v6;
      __int16 v13 = 1024;
      int v14 = v7;
      _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination resumeConnectionForReason:]  Performing resume required scene update for reason: %s; wantsKeyboard: %d",
        (uint8_t *)&v11,
        0x12u);
    }

    id v9 = +[UIWindow _applicationKeyWindow];
    -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](v2, v9, 1);
    [v2 startConnection];
  }
  if ([*(id *)(a1 + 32) wantsToShowKeyboard]
    && ([*(id *)(a1 + 32) isHostedInAnotherProcess] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWindowEnabled:", objc_msgSend(*(id *)(a1 + 32), "allowedToShowKeyboard"));
  }
  [*(id *)(a1 + 32) setEnqueuedWillEnterForegroundActions:0];
  uint64_t result = +[UIKeyboardImpl isFloating];
  if (result)
  {
    return +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_216_1];
  }
  return result;
}

uint64_t __55___UIKeyboardArbiterClientInputDestination_willResume___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 keyboardUIDidChange];
}

uint64_t __55___UIKeyboardArbiterClientInputDestination_didSuspend___block_invoke(uint64_t a1, void *a2)
{
  return [a2 keyboardUIDidChange];
}

uint64_t __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSuppressingKeyboard:0 forScene:0];
}

uint64_t __76___UIKeyboardArbiterClientInputDestination_setSuppressingKeyboard_forScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeactivatedKeyboard:*(unsigned __int8 *)(a1 + 48) forScene:*(void *)(a1 + 40)];
}

void __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke(uint64_t a1)
{
  id v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_2;
  v3[3] = &unk_1E52D9960;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 performAsync:v3];

  objc_destroyWeak(&v5);
}

void __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained pendingKeyboardGrabs];
  [v2 removeObject:*(void *)(a1 + 32)];
}

uint64_t __120___UIKeyboardArbiterClientInputDestination_inputDestinationDidChange_withIAVHeight_isIAVRelevant_notifyRemote_forScene___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _clearPreservedInputViewsWithId:0x1ED117C40 clearKeyboard:0];
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = objc_opt_class();
  id v4 = [v10 scene];
  id v5 = [v3 keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v4];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    int v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "ignoresPinning"));
    [v6 setObject:v7 forKey:v5];

    if (([v10 ignoresPinning] & 1) == 0) {
      [v10 setIgnoresPinning:1];
    }
    v8 = [*(id *)(a1 + 48) sourceSceneIdentityString];
    int v9 = [v8 isEqual:v5];

    if (v9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDontDismissReachability:1];
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  id v5 = [v3 scene];
  uint64_t v6 = [v4 keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v5];

  uint64_t v7 = [*(id *)(a1 + 40) sourceSceneIdentityString];
  if (v7)
  {
    v8 = (void *)v7;
    int v9 = [*(id *)(a1 + 40) sourceSceneIdentityString];
    if ([v9 isEqualToString:v6])
    {

      goto LABEL_11;
    }
    [*(id *)(a1 + 40) sourceDisplayIdentifier];
    id v10 = v21 = v6;
    int v11 = [v3 scene];
    uint64_t v12 = [v11 screen];
    __int16 v13 = [v12 displayConfiguration];
    int v14 = [v13 _nameForDisplayType];
    int v15 = [v10 isEqualToString:v14];

    uint64_t v6 = v21;
    if (!v15) {
      goto LABEL_11;
    }
  }
  v16 = [*(id *)(a1 + 40) hostBundleIdentifier];
  v17 = _UIMainBundleIdentifier();
  int v18 = [v16 isEqualToString:v17];

  if (([*(id *)(a1 + 40) keyboardOnScreen] & 1) != 0 || !v18)
  {
    if (([*(id *)(a1 + 40) keyboardOnScreen] & v18) == 1)
    {
      dispatch_time_t v20 = dispatch_time(0, 300000000);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5;
      v22[3] = &unk_1E52D9F70;
      v22[4] = *(void *)(a1 + 32);
      dispatch_after(v20, MEMORY[0x1E4F14428], v22);
    }
  }
  else
  {
    dispatch_time_t v19 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4;
    block[3] = &unk_1E52D9F70;
    id v24 = v3;
    dispatch_after(v19, MEMORY[0x1E4F14428], block);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceReloadInputViews];
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeMoveKeyboard];
}

uint64_t __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setDontDismissReachability:0];
}

void __123___UIKeyboardArbiterClientInputDestination__didHandleKeyboardClientChange_shouldConsiderSnapshottingKeyboard_isLocalEvent___block_invoke_7(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_opt_class();
  id v4 = [v8 scene];
  id v5 = [v3 keyboardClientFBSSceneIdentityStringOrIdentifierFromScene:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) objectForKey:v5];
    char v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0) {
      [v8 setIgnoresPinning:0];
    }
  }
}

uint64_t __74___UIKeyboardArbiterClientInputDestination_applicationKeyWindowDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setKeyWindowCandidate:0];
}

uint64_t __65___UIKeyboardArbiterClientInputDestination_peekApplicationEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _clearEligibilityToRequestKeyboardFocusWithoutUserInteraction];
}

uint64_t __80___UIKeyboardArbiterClientInputDestination_queue_endInputSessionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 remoteTextInputPartner];
  [v3 endInputSessionOnSwitchingApps];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 208));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 200))
  {
    id v3 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_keyboardChanged:onComplete:]_block_invoke  releasing os transaction for client changed task on timeout for info: %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 200);
    *(void *)(v4 + 200) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 208));
}

void __77___UIKeyboardArbiterClientInputDestination_queue_keyboardChanged_onComplete___block_invoke_269(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) sourceSceneIdentityString];

  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v6 = [WeakRetained pendingKeyboardGrabs];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v2 = *(void **)v28;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void **)v28 != v2) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
          uint64_t v11 = [*(id *)(a1 + 32) sourceSceneIdentityString];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            __int16 v13 = [v10 sceneIdentityString];
            v1 = [*(id *)(a1 + 32) sourceSceneIdentityString];
            char v14 = [v13 isEqual:v1];

            if (v14)
            {
              int v15 = 1;
              goto LABEL_17;
            }
          }
          ++v9;
        }
        while (v8 != v9);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    int v15 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) sourceBundleIdentifier];
    v16 = [(id)objc_opt_class() currentBundleIdentifier];
    if ([v6 isEqualToString:v16])
    {
      int v15 = 1;
    }
    else
    {
      v17 = [*(id *)(a1 + 32) hostBundleIdentifier];
      v1 = [(id)objc_opt_class() currentBundleIdentifier];
      int v15 = [v17 isEqualToString:v1];
    }
  }
LABEL_17:

  char v18 = [(id)UIApp systemIsAnimatingApplicationLifecycleEvent];
  id v19 = objc_loadWeakRetained((id *)(a1 + 56));
  if ([v19 deactivatedByControlCenter]) {
    goto LABEL_21;
  }
  int v20 = [(id)UIApp _isSpringBoard];
  if (v20)
  {
    v1 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v2 = [v1 pendingKeyboardGrabs];
    if ([v2 count])
    {

LABEL_21:
      goto LABEL_26;
    }
  }
  unsigned int v26 = v15;
  id v21 = objc_loadWeakRetained((id *)(a1 + 56));
  v22 = +[_UIKeyboardArbiterClientInputDestination currentBundleIdentifier];
  char v23 = [v21 isSpotlight:v22];

  if (v20)
  {
  }
  if ((v23 & 1) == 0 && (v18 & 1) == 0)
  {
    id v25 = objc_loadWeakRetained((id *)(a1 + 56));
    [v25 _handleKeyboardChanged:*(void *)(a1 + 32) isLocal:v26 onComplete:*(void *)(a1 + 48)];

    return;
  }
LABEL_26:
  uint64_t v24 = *(void *)(a1 + 48);
  if (v24) {
    (*(void (**)(void))(v24 + 16))();
  }
}

uint64_t __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __75___UIKeyboardArbiterClientInputDestination_handleKeyboardUITrackingChange___block_invoke_2(double *a1, void *a2)
{
  id v41 = a2;
  if ([v41 isTrackingKeyboard])
  {
    id v3 = [v41 windowScene];
    uint64_t v4 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v3, [v41 _isHostedInAnotherProcess]);

    objc_msgSend(v41, "convertRect:fromWindow:", v4, a1[4], a1[5], a1[6], a1[7]);
    double v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 actualSceneFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v41 bounds];
    BOOL v22 = v18 == v21;
    BOOL v24 = v20 == v23;
    CGFloat v25 = 0.0;
    if (v22 && v24) {
      double v26 = v16;
    }
    else {
      double v26 = 0.0;
    }
    double v27 = v8 - v26;
    if (v22 && v24) {
      double v28 = v14;
    }
    else {
      double v28 = 0.0;
    }
    CGFloat v29 = v6 - v28;
    [v41 frame];
    v49.origin.CGFloat x = v29;
    v49.origin.double y = v27;
    v49.size.double width = v10;
    v49.size.double height = v12;
    CGRect v44 = CGRectIntersection(v43, v49);
    CGFloat x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
    if (CGRectIsEmpty(v44))
    {
      [v41 frame];
      double MaxY = CGRectGetMaxY(v45);
      [v41 insetForDismissedKeyboardGuide];
      double y = MaxY - v35;
      [v41 insetForDismissedKeyboardGuide];
      double height = v36;
      double width = v18;
    }
    else
    {
      CGFloat v25 = x;
    }
    v37 = [v41 _primaryKeyboardTrackingGuide];
    v46.origin.CGFloat x = v25;
    v46.origin.double y = y;
    v46.size.double width = width;
    v46.size.double height = height;
    double MinX = CGRectGetMinX(v46);
    [v41 frame];
    double v39 = CGRectGetMaxY(v47);
    v48.origin.CGFloat x = v25;
    v48.origin.double y = y;
    v48.size.double width = width;
    v48.size.double height = height;
    objc_msgSend(v37, "changeOffsetConstants:", MinX, v39 - CGRectGetMaxY(v48));

    v40 = [v41 _primaryKeyboardTrackingGuide];
    objc_msgSend(v40, "changeSizingConstants:", width, height);
  }
}

void __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) hasValidNotification])
  {
    uint64_t v4 = [*(id *)(a1 + 32) notificationInfo];
    if (([v4 shouldSendInClient] & 1) == 0)
    {
      uint64_t v5 = [v3 existingContainerRootController];
      if (v5)
      {
        double v6 = (void *)v5;
        double v7 = [v3 existingContainerRootController];
        char v8 = [v7 isRotating];

        if ((v8 & 1) == 0)
        {
          double v9 = NSString;
          int v10 = [*(id *)(a1 + 32) isStartNotification];
          double v11 = @"is end";
          if (v10) {
            double v11 = @"is start";
          }
          CGFloat v12 = [v9 stringWithFormat:@"handleKeyboardUIDidChange: notification from keyboard %@", v11];
          [v4 addKeyboardNotificationDebuggingInfo:v12];

          double v13 = [v3 existingContainerRootController];
          double v14 = [v13 inputViewSet];
          double v15 = [v14 inputAccessoryView];

          if (!v15)
          {
            double v16 = [v3 containerWindow];
            int v17 = [v16 _isHostedInAnotherProcess];

            if (v17)
            {
              double v18 = [v3 containerWindow];
              [v18 hostedViewReference];
              double v20 = v19;
              double v22 = v21;
              CGFloat v24 = v23;
              CGFloat v26 = v25;

              [v4 beginFrame];
              v117.origin.double x = v20;
              v117.origin.double y = v22;
              v117.size.double width = v24;
              v117.size.double height = v26;
              CGRect v113 = CGRectIntersection(v112, v117);
              double x = v113.origin.x;
              double y = v113.origin.y;
              double width = v113.size.width;
              double height = v113.size.height;
              if (!CGRectIsEmpty(v113)) {
                objc_msgSend(v4, "populateStartInfoWithFrame:", x - v20, y - v22, width, height);
              }
              [v4 endFrame];
              v118.origin.double x = v20;
              v118.origin.double y = v22;
              v118.size.double width = v24;
              v118.size.double height = v26;
              CGRect v115 = CGRectIntersection(v114, v118);
              double v31 = v115.origin.x;
              double v32 = v115.origin.y;
              double v33 = v115.size.width;
              double v34 = v115.size.height;
              if (!CGRectIsEmpty(v115)) {
                objc_msgSend(v4, "populateEndInfoWithFrame:", v31 - v20, v32 - v22, v33, v34);
              }
              [v4 addKeyboardNotificationDebuggingInfo:@" is hosted"];
            }
            [v4 setShouldSendInClient:1];
            [v4 duration];
            if (v35 > 0.0)
            {
              double v36 = [*(id *)(a1 + 32) animationFence];
              int v37 = [v36 isUsable];

              if (v37)
              {
                v38 = [v3 scene];
                double v39 = [*(id *)(a1 + 32) animationFence];
                [v38 _synchronizeDrawingWithFence:v39];
              }
            }
            int v40 = [*(id *)(a1 + 32) isStartNotification];
            id v41 = [v3 existingContainerRootController];
            uint64_t v42 = [v4 type];
            if (v40) {
              [v41 postStartNotifications:v42 withInfo:v4];
            }
            else {
              [v41 postEndNotifications:v42 withInfo:v4];
            }
          }
        }
      }
    }

    goto LABEL_90;
  }
  if ([v3 isOnScreen]
    && ([v3 responder], CGRect v43 = objc_claimAutoreleasedReturnValue(), v43, v43))
  {
    CGRect v44 = [v3 scene];
    CGRect v45 = [v44 keyboardSceneDelegate];
    CGRect v46 = [v45 responder];
    CGRect v47 = [v46 _window];

    if (v47 && ([v47 _requiresKeyboardPresentationFence] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      CGRect v48 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      CGRect v49 = [v48 nextAnimationStyle];
      int v50 = [v49 canTakeSnapshot];

      if (v50) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    CGRect v44 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = [v3 isOnScreen];
      v52 = @" not";
      if (v51) {
        v52 = &stru_1ED0E84C0;
      }
      *(_DWORD *)buf = 138412290;
      v106 = v52;
      _os_log_impl(&dword_1853B0000, v44, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination responder is%@ on screen", buf, 0xCu);
    }
  }

  v104 = 0;
  v53 = [*(id *)(a1 + 32) applicationIdentifier];
  v54 = (__CFString *)CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
  LODWORD(v55) = v54 != 0;

  if (v54)
  {
    v56 = +[UIApplication displayIdentifier];
    v54 = (__CFString *)[v56 isEqualToString:v104];

    if (!v54)
    {
      LODWORD(v55) = 0;
      goto LABEL_41;
    }
    if (![*(id *)(a1 + 32) keyboardOnScreen])
    {
      LODWORD(v55) = 1;
      goto LABEL_41;
    }
    v56 = [v3 containerRootController];
    [v56 clearKeyboardSnapshot];
  }
  else
  {
    v56 = KeyboardArbiterClientLog_3();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [*(id *)(a1 + 32) applicationIdentifier];
      *(_DWORD *)buf = 138412546;
      v106 = v104;
      __int16 v107 = 2112;
      v108 = v54;
      _os_log_impl(&dword_1853B0000, v56, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Unexpected bundleIdentifier: %@ for applicationIdentifier: %@", buf, 0x16u);
    }
  }

LABEL_41:
  char v57 = [*(id *)(a1 + 32) keyboardOnScreen];
  if ((v57 & 1) == 0)
  {
    v56 = [v3 containerRootController];
    v54 = [v56 placement];
    if (![(__CFString *)v54 showsInputOrAssistantViews])
    {
      int v58 = 0;
      goto LABEL_49;
    }
  }
  if (v55)
  {
    int v58 = [*(id *)(a1 + 40) disableBecomeFirstResponder] ^ 1;
    if (v57) {
      goto LABEL_50;
    }
LABEL_49:

    goto LABEL_50;
  }
  int v58 = 1;
  if ((v57 & 1) == 0) {
    goto LABEL_49;
  }
LABEL_50:
  v59 = [v3 containerRootController];
  v60 = [v59 inputViewSet];
  v61 = [v60 inputAccessoryView];
  if (v61)
  {
    int v62 = 1;
  }
  else
  {
    v63 = [v3 containerRootController];
    [v63 placement];
    v65 = uint64_t v64 = a1;
    int v62 = [v65 accessoryViewWillAppear];

    a1 = v64;
  }

  int v66 = [*(id *)(a1 + 32) keyboardOnScreen];
  v67 = [v3 containerRootController];
  v68 = [v67 placement];
  int v69 = [v68 showsInputOrAssistantViews];

  v70 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    int v99 = v69;
    int v71 = v66;
    char v72 = (char)v55;
    if (v58) {
      v55 = &stru_1ED0E84C0;
    }
    else {
      v55 = @"not ";
    }
    int v73 = v62;
    id v74 = v3;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      v75 = &stru_1ED0E84C0;
    }
    else {
      v75 = @"not ";
    }
    v76 = [*(id *)(a1 + 40) currentUIState];
    [v76 animationFence];
    uint64_t v100 = a1;
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v106 = v55;
    LOBYTE(v55) = v72;
    int v66 = v71;
    int v69 = v99;
    __int16 v107 = 2112;
    v108 = v75;
    id v3 = v74;
    int v62 = v73;
    __int16 v109 = 2112;
    v110 = v77;
    _os_log_impl(&dword_1853B0000, v70, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination should %@update UI and should %@skip fencing: %@", buf, 0x20u);

    a1 = v100;
  }

  [v3 cleanUpWaitingForInputUI];
  if (v58)
  {
    if (v62) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    int v78 = v66 ^ v69;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v79 = [v3 containerRootController];
      char v80 = [v79 isRotating];

      if ((v80 & 1) == 0)
      {
        v81 = [v3 scene];
        v82 = [*(id *)(a1 + 40) currentUIState];
        v83 = [v82 animationFence];
        [v81 _synchronizeDrawingWithFence:v83];
      }
    }
    if (v55) {
      goto LABEL_75;
    }
    v84 = [*(id *)(a1 + 32) applicationIdentifier];
    if ([v84 isEqualToString:@"com.apple.Spotlight"]
      && [*(id *)(a1 + 32) keyboardOnScreen]
      && [v3 showingKeyboard])
    {
      v85 = [v3 scene];
      uint64_t v86 = [v85 activationState];

      if (v86)
      {
LABEL_75:
        v89 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) keyboardPosition];
          NSStringFromCGRect(v116);
          v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v91 = [*(id *)(a1 + 32) animated];
          v92 = @"unanimated";
          if (v91) {
            v92 = @"animated";
          }
          *(_DWORD *)buf = 138412802;
          v106 = v90;
          __int16 v107 = 2112;
          v108 = v92;
          if (v78) {
            v93 = @"keyboardUIDidChange";
          }
          else {
            v93 = @"updateSizingFromRemoteChange";
          }
          __int16 v109 = 2112;
          v110 = v93;
          _os_log_impl(&dword_1853B0000, v89, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  Keyboard destination updating keyboardPosition %@ for %@ transition using %@", buf, 0x20u);
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke_310;
        aBlock[3] = &unk_1E52D9FC0;
        char v103 = v78 ^ 1;
        id v94 = v3;
        id v102 = v94;
        v95 = (void (**)(void))_Block_copy(aBlock);
        if ([*(id *)(a1 + 32) animated]
          && ([v94 containerRootController],
              v96 = objc_claimAutoreleasedReturnValue(),
              char v97 = [v96 isRotating],
              v96,
              (v97 & 1) == 0))
        {
          v95[2](v95);
        }
        else
        {
          v98 = +[UIInputViewAnimationStyle animationStyleImmediate];
          [v94 pushAnimationStyle:v98];

          v95[2](v95);
          [v94 popAnimationStyle];
        }

        goto LABEL_90;
      }
      v87 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v88 = [v87 responder];
      [v88 resignFirstResponder];

      v84 = KeyboardArbiterClientLog_3();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v84, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputDestination handleKeyboardUIDidChange:]_block_invoke  ResignFirstResponder, due to Spotlight grab InputUI in background", buf, 2u);
      }
    }

    goto LABEL_75;
  }
LABEL_90:
}

void __70___UIKeyboardArbiterClientInputDestination_handleKeyboardUIDidChange___block_invoke_310(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    && ([*(id *)(a1 + 32) containerRootController],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isRotating],
        v2,
        (v3 & 1) == 0))
  {
    id v5 = [*(id *)(a1 + 32) containerRootController];
    [v5 updateSizingFromRemoteChange];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 keyboardUIDidChange];
  }
}

uint64_t __81___UIKeyboardArbiterClientInputDestination_queue_keyboardUIDidChange_onComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyboardUIDidChange:*(void *)(a1 + 40) onComplete:*(void *)(a1 + 48)];
}

uint64_t __84___UIKeyboardArbiterClientInputDestination_queue_activeProcessResignWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentInputDestination:1];
  [*(id *)(a1 + 32) didBecomeActive:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __85___UIKeyboardArbiterClientInputDestination_queue_setKeyboardDisabled_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisableBecomeFirstResponder:*(unsigned __int8 *)(a1 + 48) forSuppressionAssertion:0 updatePlacement:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __84___UIKeyboardArbiterClientInputDestination_queue_sceneBecameFocused_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = KeyboardArbiterClientLog_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    double v19 = [*(id *)(a1 + 32) stringRepresentation];
    *(_DWORD *)buf = 138412290;
    CGFloat v26 = v19;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Scene became focused: %@", buf, 0xCu);
  }
  if (*(void *)(a1 + 32))
  {
    +[UIScene _scenesIncludingInternal:1];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = (id)[v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v3);
          }
          double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          char v8 = objc_msgSend(v7, "_FBSScene", (void)v21);
          double v9 = [v8 identityToken];
          int v10 = BSEqualObjects();

          if (v10)
          {
            id v4 = v7;
            goto LABEL_14;
          }
        }
        id v4 = (id)[v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    double v11 = [v4 keyWindow];
    if (v11 && ([v4 _isTargetOfKeyboardEventDeferringEnvironment] & 1) == 0)
    {
      CGFloat v12 = KeyboardArbiterClientLog_3();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        double v20 = [*(id *)(a1 + 32) stringRepresentation];
        *(_DWORD *)buf = 134218242;
        CGFloat v26 = v11;
        __int16 v27 = 2112;
        double v28 = v20;
        _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Performing required scene update because it was focused in the arbiter: %p; scene: %@",
          buf,
          0x16u);
      }
      -[_UIKeyboardArbiterClientInputDestination _performRequiredSceneUpdateIfPermittedForWindow:withContext:](*(void **)(a1 + 40), v11, 65537);
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 40), "focusedSceneIdentityStringOrIdentifier", (void)v21);
  double v14 = (void *)v13;
  if (!v4)
  {
    if (v13)
    {
      double v15 = [*(id *)(a1 + 32) stringRepresentation];
      char v16 = BSEqualStrings();

      if ((v16 & 1) == 0)
      {
        int v17 = KeyboardArbiterClientLog_3();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEBUG, "-[_UIKeyboardArbiterClientInputDestination queue_sceneBecameFocused:withCompletion:]_block_invoke  Setting focused scene identity or identifier to nil because a scene from another application was focused", buf, 2u);
        }

        [*(id *)(a1 + 40) setFocusedSceneIdentityStringOrIdentifier:0];
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

@end