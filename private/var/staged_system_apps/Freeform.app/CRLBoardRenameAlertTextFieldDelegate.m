@interface CRLBoardRenameAlertTextFieldDelegate
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldClear:(id)a3;
- (_TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate)init;
@end

@implementation CRLBoardRenameAlertTextFieldDelegate

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1005D1774(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    [v6 setEnabled:0];
  }
  return 1;
}

- (_TtC8FreeformP33_1F7AC1847BE2554B067346642BF3ED1536CRLBoardRenameAlertTextFieldDelegate)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLBoardRenameAlertTextFieldDelegate();
  return [(CRLBoardRenameAlertTextFieldDelegate *)&v4 init];
}

- (void).cxx_destruct
{
}

@end