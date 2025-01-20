@interface VOSDefaultHapticPack
- (NSDictionary)eventToHapticFilenameMapping;
- (id)hapticAssetURLForOutputEvent:(id)a3;
@end

@implementation VOSDefaultHapticPack

- (NSDictionary)eventToHapticFilenameMapping
{
  if (eventToHapticFilenameMapping_onceToken != -1) {
    dispatch_once(&eventToHapticFilenameMapping_onceToken, &__block_literal_global);
  }
  v2 = (void *)eventToHapticFilenameMapping__Map;

  return (NSDictionary *)v2;
}

void __52__VOSDefaultHapticPack_eventToHapticFilenameMapping__block_invoke()
{
  v111[54] = *MEMORY[0x263EF8340];
  v109 = +[VOSOutputEvent DidActivateElement];
  v108 = [v109 rawValue];
  v110[0] = v108;
  v111[0] = @"DidActivateElement.ahap";
  v107 = +[VOSOutputEvent NoResultsFound];
  v106 = [v107 rawValue];
  v110[1] = v106;
  v111[1] = @"NoResultsFound.ahap";
  v105 = +[VOSOutputEvent BoundaryEncountered];
  v104 = [v105 rawValue];
  v110[2] = v104;
  v111[2] = @"BoundaryEncountered.ahap";
  v103 = +[VOSOutputEvent DidFocusOnElement];
  v102 = [v103 rawValue];
  v110[3] = v102;
  v111[3] = @"DidFocusOnElement.ahap";
  v101 = +[VOSOutputEvent DidFocusOnScreenRecognitionElement];
  v100 = [v101 rawValue];
  v110[4] = v100;
  v111[4] = @"DidFocusOnElement.ahap";
  v99 = +[VOSOutputEvent DidReorderItem];
  v98 = [v99 rawValue];
  v110[5] = v98;
  v111[5] = @"DidReorderItem.ahap";
  v97 = +[VOSOutputEvent UnknownCommand];
  v96 = [v97 rawValue];
  v110[6] = v96;
  v111[6] = @"UnknownCommand.ahap";
  v95 = +[VOSOutputEvent DidWrapBackwards];
  v94 = [v95 rawValue];
  v110[7] = v94;
  v111[7] = @"DidWrapBackwards.ahap";
  v93 = +[VOSOutputEvent DidWrapForwards];
  v92 = [v93 rawValue];
  v110[8] = v92;
  v111[8] = @"DidWrapForwards.ahap";
  v91 = +[VOSOutputEvent DidScrollByPage];
  v90 = [v91 rawValue];
  v110[9] = v90;
  v111[9] = @"DidScrollByPage.ahap";
  v89 = +[VOSOutputEvent DidBeginPassthrough];
  v88 = [v89 rawValue];
  v110[10] = v88;
  v111[10] = @"DidBeginPassthrough.ahap";
  v87 = +[VOSOutputEvent DidSelectAutofill];
  v86 = [v87 rawValue];
  v110[11] = v86;
  v111[11] = @"DidSelectAutofill.ahap";
  v85 = +[VOSOutputEvent DidSelectPreviousRotor];
  v84 = [v85 rawValue];
  v110[12] = v84;
  v111[12] = @"DidSelectPreviousRotor.ahap";
  v83 = +[VOSOutputEvent DidSelectNextRotor];
  v82 = [v83 rawValue];
  v110[13] = v82;
  v111[13] = @"DidSelectNextRotor.ahap";
  v81 = +[VOSOutputEvent PreviousRotorProgress];
  v80 = [v81 rawValue];
  v110[14] = v80;
  v111[14] = @"PreviousRotorProgress.ahap";
  v79 = +[VOSOutputEvent NextRotorProgress];
  v78 = [v79 rawValue];
  v110[15] = v78;
  v111[15] = @"NextRotorProgress.ahap";
  v77 = +[VOSOutputEvent DidEnterTouchContainer];
  v76 = [v77 rawValue];
  v110[16] = v76;
  v111[16] = @"DidEnterTouchContainer.ahap";
  v75 = +[VOSOutputEvent DidEnterSecureText];
  v74 = [v75 rawValue];
  v110[17] = v74;
  v111[17] = @"DidEnterSecureText.ahap";
  v73 = +[VOSOutputEvent DidEnterTargetArea];
  v72 = [v73 rawValue];
  v110[18] = v72;
  v111[18] = @"DidEnterTargetArea.ahap";
  v71 = +[VOSOutputEvent DidLeaveTargetArea];
  v70 = [v71 rawValue];
  v110[19] = v70;
  v111[19] = @"DidLeaveTargetArea.ahap";
  v69 = +[VOSOutputEvent DidSyncWithSystemFocus];
  v68 = [v69 rawValue];
  v110[20] = v68;
  v111[20] = @"DidSyncWithSystemFocus.ahap";
  v67 = +[VOSOutputEvent DidChangeTextSelectionDirection];
  v66 = [v67 rawValue];
  v110[21] = v66;
  v111[21] = @"DidChangeTextSelectionDirection.ahap";
  v65 = +[VOSOutputEvent NoItemExists];
  v64 = [v65 rawValue];
  v110[22] = v64;
  v111[22] = @"NoItemExists.ahap";
  v63 = +[VOSOutputEvent IsInteractable];
  v62 = [v63 rawValue];
  v110[23] = v62;
  v111[23] = @"IsInteractable.ahap";
  v61 = +[VOSOutputEvent AlertDidAppear];
  v60 = [v61 rawValue];
  v110[24] = v60;
  v111[24] = @"AlertDidAppear.ahap";
  v59 = +[VOSOutputEvent NotificationDidAppear];
  v58 = [v59 rawValue];
  v110[25] = v58;
  v111[25] = @"NotificationDidAppear.ahap";
  v57 = +[VOSOutputEvent PopoverDidAppear];
  v56 = [v57 rawValue];
  v110[26] = v56;
  v111[26] = @"PopoverDidAppear.ahap";
  v55 = +[VOSOutputEvent ScreenDidChange];
  v54 = [v55 rawValue];
  v110[27] = v54;
  v111[27] = @"ScreenDidChange.ahap";
  v53 = +[VOSOutputEvent ItemIsLoading];
  v52 = [v53 rawValue];
  v110[28] = v52;
  v111[28] = @"ItemIsLoading.ahap";
  v51 = +[VOSOutputEvent ItemDidLoad];
  v50 = [v51 rawValue];
  v110[29] = v50;
  v111[29] = @"ItemDidLoad.ahap";
  v49 = +[VOSOutputEvent ScreenDidTurnOff];
  v48 = [v49 rawValue];
  v110[30] = v48;
  v111[30] = @"ScreenDidTurnOff.ahap";
  v47 = +[VOSOutputEvent CollaborationOccurred];
  v46 = [v47 rawValue];
  v110[31] = v46;
  v111[31] = @"CollaborationOccurred.ahap";
  v45 = +[VOSOutputEvent InsertionPointDidMove];
  v44 = [v45 rawValue];
  v110[32] = v44;
  v111[32] = @"InsertionPointDidMove.ahap";
  v43 = +[VOSOutputEvent AutofillDidAppear];
  v42 = [v43 rawValue];
  v110[33] = v42;
  v111[33] = @"AutofillDidAppear.ahap";
  v41 = +[VOSOutputEvent AutofillDidDismiss];
  v40 = [v41 rawValue];
  v110[34] = v40;
  v111[34] = @"AutofillDidDismiss.ahap";
  v39 = +[VOSOutputEvent FolderWillOpen];
  v38 = [v39 rawValue];
  v110[35] = v38;
  v111[35] = @"FolderWillOpen.ahap";
  v37 = +[VOSOutputEvent FolderDidOpen];
  v36 = [v37 rawValue];
  v110[36] = v36;
  v111[36] = @"FolderDidOpen.ahap";
  v35 = +[VOSOutputEvent FolderDidClose];
  v34 = [v35 rawValue];
  v110[37] = v34;
  v111[37] = @"FolderDidClose.ahap";
  v33 = +[VOSOutputEvent KeyboardAppeared];
  v32 = [v33 rawValue];
  v110[38] = v32;
  v111[38] = @"KeyboardAppeared.ahap";
  v31 = +[VOSOutputEvent KeyboardDisappeared];
  v30 = [v31 rawValue];
  v110[39] = v30;
  v111[39] = @"KeyboardDisappeared.ahap";
  v29 = +[VOSOutputEvent BrailleDisplayConnected];
  v28 = [v29 rawValue];
  v110[40] = v28;
  v111[40] = @"BrailleDisplayConnected.ahap";
  v27 = +[VOSOutputEvent BrailleDisplayDisconnected];
  v26 = [v27 rawValue];
  v110[41] = v26;
  v111[41] = @"BrailleDisplayDisconnected.ahap";
  v25 = +[VOSOutputEvent ItemMemorizationSucceeded];
  v24 = [v25 rawValue];
  v110[42] = v24;
  v111[42] = @"ItemMemorizationSucceeded.ahap";
  v23 = +[VOSOutputEvent ItemMemorizationFailed];
  v22 = [v23 rawValue];
  v110[43] = v22;
  v111[43] = @"ItemMemorizationFailed.ahap";
  v21 = +[VOSOutputEvent ItemMemorizationInProgress];
  v20 = [v21 rawValue];
  v110[44] = v20;
  v111[44] = @"ItemMemorizationInProgress.ahap";
  v19 = +[VOSOutputEvent DockDidAppear];
  v18 = [v19 rawValue];
  v110[45] = v18;
  v111[45] = @"DockDidAppear.ahap";
  v17 = +[VOSOutputEvent DockDidDisappear];
  v16 = [v17 rawValue];
  v110[46] = v16;
  v111[46] = @"DockDidDisappear.ahap";
  v15 = +[VOSOutputEvent ReachabilityDidBegin];
  v14 = [v15 rawValue];
  v110[47] = v14;
  v111[47] = @"ReachabilityDidBegin.ahap";
  v13 = +[VOSOutputEvent ReachabilityDidEnd];
  v12 = [v13 rawValue];
  v110[48] = v12;
  v111[48] = @"ReachabilityDidEnd.ahap";
  v0 = +[VOSOutputEvent TouchIDAuthenticated];
  v1 = [v0 rawValue];
  v110[49] = v1;
  v111[49] = @"TouchIDAuthenticated.ahap";
  v2 = +[VOSOutputEvent TouchIDFailed];
  v3 = [v2 rawValue];
  v110[50] = v3;
  v111[50] = @"TouchIDFailed.ahap";
  v4 = +[VOSOutputEvent Startup];
  v5 = [v4 rawValue];
  v110[51] = v5;
  v111[51] = @"Startup.ahap";
  v6 = +[VOSOutputEvent BSIDidEnterChord];
  v7 = [v6 rawValue];
  v110[52] = v7;
  v111[52] = @"DidFocusOnElement.ahap";
  v8 = +[VOSOutputEvent BrailleDisplayReconnectionTriggered];
  v9 = [v8 rawValue];
  v110[53] = v9;
  v111[53] = @"BrailleDisplayReconnectionTriggered.ahap";
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:54];
  v11 = (void *)eventToHapticFilenameMapping__Map;
  eventToHapticFilenameMapping__Map = v10;
}

- (id)hapticAssetURLForOutputEvent:(id)a3
{
  id v4 = a3;
  if ([v4 supportsHaptic])
  {
    v5 = [(VOSDefaultHapticPack *)self eventToHapticFilenameMapping];
    v6 = [v4 rawValue];
    v7 = [v5 objectForKeyedSubscript:v6];

    v8 = [v7 pathExtension];
    v9 = [v7 stringByDeletingPathExtension];

    uint64_t v10 = VOSVoiceOverBundle();
    v11 = [v10 URLForResource:v9 withExtension:v8 subdirectory:@"Haptics"];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end