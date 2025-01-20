@interface TTRIListDetailContainerViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC9Reminders37TTRIListDetailContainerViewController)initWithCoder:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
@end

@implementation TTRIListDetailContainerViewController

- (_TtC9Reminders37TTRIListDetailContainerViewController)initWithCoder:(id)a3
{
  result = (_TtC9Reminders37TTRIListDetailContainerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_1004F5004();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004F52D8();
}

@end