@interface CRLiOSBoardViewController.TextEditingAllowingAlertController
- (BOOL)staysOpenOnSelectionChange;
- (_TtCC8Freeform25CRLiOSBoardViewController34TextEditingAllowingAlertController)initWithCoder:(id)a3;
- (_TtCC8Freeform25CRLiOSBoardViewController34TextEditingAllowingAlertController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation CRLiOSBoardViewController.TextEditingAllowingAlertController

- (BOOL)staysOpenOnSelectionChange
{
  return 1;
}

- (_TtCC8Freeform25CRLiOSBoardViewController34TextEditingAllowingAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)_s34TextEditingAllowingAlertControllerCMa();
  v9 = [(CRLiOSBoardViewController.TextEditingAllowingAlertController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtCC8Freeform25CRLiOSBoardViewController34TextEditingAllowingAlertController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s34TextEditingAllowingAlertControllerCMa();
  return [(CRLiOSBoardViewController.TextEditingAllowingAlertController *)&v5 initWithCoder:a3];
}

@end