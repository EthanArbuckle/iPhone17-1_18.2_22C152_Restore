@interface PXCPLActionManager
- (id)actionPerformerForActionType:(id)a3;
- (void)performAction:(int64_t)a3 forCPLUIStatus:(id)a4;
@end

@implementation PXCPLActionManager

- (id)actionPerformerForActionType:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXCPLActionManager.m", 46, @"Method %s is a responsibility of subclass %@", "-[PXCPLActionManager actionPerformerForActionType:]", v8 object file lineNumber description];

  abort();
}

- (void)performAction:(int64_t)a3 forCPLUIStatus:(id)a4
{
  id v13 = a4;
  if (!v13)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCPLActionManager.m", 35, @"Invalid parameter not satisfying: %@", @"cplUIStatus" object file lineNumber description];
  }
  switch(a3)
  {
    case 0:
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXCPLActionManager.m", 36, @"Invalid parameter not satisfying: %@", @"serviceAction != PXCPLStatusActionNone" object file lineNumber description];

      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"PXCPLActionType _ActionTypeForServiceAction(PXCPLStatusAction)"];
      [v11 handleFailureInFunction:v12 file:@"PXCPLActionManager.m" lineNumber:56 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      v7 = @"PXCPLActionTypePause";
      break;
    case 2:
      v7 = @"PXCPLActionTypeResume";
      break;
    case 3:
      v7 = @"PXCPLActionTypeManageCloudStorage";
      break;
    case 4:
      v7 = @"PXCPLActionTypeManageLocalStorage";
      break;
    case 5:
      v7 = @"PXCPLActionTypeManageCellularDataDisabled";
      break;
    case 6:
      v7 = @"PXCPLActionTypeManageAirplaneMode";
      break;
    case 7:
      v7 = @"PXCPLActionTypeViewItemsFailingToUpload";
      break;
    case 8:
      v7 = @"PXCPLActionTypeManageExitMode";
      break;
    case 9:
      v7 = @"PXCPLActionTypeLearnMoreClientVersionTooOld";
      break;
    case 10:
      v7 = @"PXCPLActionTypeManageClientAuthentication";
      break;
    case 11:
      v7 = @"PXCPLActionTypeLearnMoreUpgradeSuggested";
      break;
    default:
      v7 = 0;
      break;
  }
  v8 = [(PXCPLActionManager *)self actionPerformerForActionType:v7];
  [v8 performActionWithCPLUIStatus:v13 completionHandler:0];
}

@end