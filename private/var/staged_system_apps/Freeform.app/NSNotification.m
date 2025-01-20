@interface NSNotification
+ (id)CRLBoardDataStoreDidUpdateHierarchy;
+ (id)CRLBoardRealTimeNewParticipantDidJoinSession;
+ (id)CRLBoardRealTimeStateDidChange;
+ (id)CRLCommandControllerDidCloseUndoGroup;
+ (id)CRLCommandControllerDidExecuteUserCommand;
+ (id)CRLCommandControllerDidOpenUndoGroup;
+ (id)CRLCommandControllerDidRedo;
+ (id)CRLCommandControllerDidUndo;
+ (id)CRLCommandControllerHistoryStateDidChange;
+ (id)CRLCommandControllerWillCloseUndoGroup;
+ (id)CRLCommandControllerWillRedo;
+ (id)CRLCommandControllerWillUndo;
+ (id)CRLSearchStringChanged;
+ (id)CRLTextInputResponderDidBecomeFirstResponder;
+ (id)CRLTextInputResponderDidReloadInputViewsWithChangedEditor;
+ (id)CRLTextInputResponderDidResignFirstResponder;
+ (id)CRLiCloudDeviceToDeviceEncryptionAvailabilityChanged;
+ (id)CRLiCloudStatusChanged;
+ (id)CRLiCloudUserRecordIDChanged;
+ (id)CRLiOSSceneDidBecomeActive;
+ (id)CRLiOSSceneDidEnterBackground;
+ (id)CRLiOSSceneWillEnterForeground;
+ (id)CRLiOSSceneWillResignActive;
@end

@implementation NSNotification

+ (id)CRLSearchStringChanged
{
  if (qword_10166ED80 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10171A158;

  return v2;
}

+ (id)CRLTextInputResponderDidBecomeFirstResponder
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166EEC0, &qword_10171A4F8);
}

+ (id)CRLTextInputResponderDidResignFirstResponder
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166EEC8, &qword_10171A500);
}

+ (id)CRLTextInputResponderDidReloadInputViewsWithChangedEditor
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166EED0, &qword_10171A508);
}

+ (id)CRLCommandControllerDidOpenUndoGroup
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F080, &qword_10171A810);
}

+ (id)CRLCommandControllerWillCloseUndoGroup
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F088, &qword_10171A818);
}

+ (id)CRLCommandControllerDidCloseUndoGroup
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F090, &qword_10171A820);
}

+ (id)CRLCommandControllerHistoryStateDidChange
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F098, (void **)&qword_10171A828);
}

+ (id)CRLCommandControllerWillUndo
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F0A0, &qword_10171A830);
}

+ (id)CRLCommandControllerDidUndo
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F0A8, &qword_10171A838);
}

+ (id)CRLCommandControllerWillRedo
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F0B0, &qword_10171A840);
}

+ (id)CRLCommandControllerDidRedo
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F0B8, &qword_10171A848);
}

+ (id)CRLCommandControllerDidExecuteUserCommand
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F0C0, &qword_10171A850);
}

+ (id)CRLiOSSceneDidBecomeActive
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F828, (void **)&qword_10171B718);
}

+ (id)CRLiOSSceneWillResignActive
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F830, (void **)&qword_10171B720);
}

+ (id)CRLiOSSceneWillEnterForeground
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F838, (void **)&qword_10171B728);
}

+ (id)CRLiOSSceneDidEnterBackground
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F840, (void **)&qword_10171B730);
}

+ (id)CRLiCloudDeviceToDeviceEncryptionAvailabilityChanged
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F888, &qword_10171B7A0);
}

+ (id)CRLiCloudStatusChanged
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F890, &qword_10171B7A8);
}

+ (id)CRLiCloudUserRecordIDChanged
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166F898, &qword_10171B7B0);
}

+ (id)CRLBoardDataStoreDidUpdateHierarchy
{
  if (qword_10166FE30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10171C328;

  return v2;
}

+ (id)CRLBoardRealTimeStateDidChange
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166FE60, (void **)&qword_10171C3C0);
}

+ (id)CRLBoardRealTimeNewParticipantDidJoinSession
{
  return sub_1007115B4((uint64_t)a1, (uint64_t)a2, &qword_10166FE68, (void **)&qword_10171C3C8);
}

@end