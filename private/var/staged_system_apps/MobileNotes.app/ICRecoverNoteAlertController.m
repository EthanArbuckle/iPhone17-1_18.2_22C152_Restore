@interface ICRecoverNoteAlertController
- (BOOL)showFromViewController:(id)a3;
- (ICNote)note;
- (ICRecoverNoteAlertController)init;
- (ICRecoverNoteAlertController)initWithNote:(id)a3;
- (ICRecoverNoteAlertController)initWithNote:(id)a3 selectedRange:(_NSRange)a4;
- (NSNotificationCenter)notificationCenter;
- (NSString)cancelButtonTitle;
- (NSString)detail;
- (NSString)message;
- (NSString)recoverButtonTitle;
- (NSString)title;
- (_NSRange)selectedRange;
- (void)recoverNote;
- (void)recoverNotePostingNotifications;
- (void)setNotificationCenter:(id)a3;
@end

@implementation ICRecoverNoteAlertController

- (ICNote)note
{
  return (ICNote *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___ICRecoverNoteAlertController_note));
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter));
}

- (void)setNotificationCenter:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter) = (Class)a3;
  id v3 = a3;
}

- (_NSRange)selectedRange
{
  v2 = (char *)self + OBJC_IVAR___ICRecoverNoteAlertController_selectedRange;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_selectedRange);
  NSUInteger v4 = *((void *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSString)title
{
  return (NSString *)sub_1003C9CA4();
}

- (NSString)message
{
  return (NSString *)sub_1003C9CA4();
}

- (NSString)detail
{
  return (NSString *)sub_1003C9CA4();
}

- (NSString)cancelButtonTitle
{
  return (NSString *)sub_1003C9CA4();
}

- (NSString)recoverButtonTitle
{
  return (NSString *)sub_1003C9CA4();
}

- (ICRecoverNoteAlertController)initWithNote:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  v7 = (ICRecoverNoteAlertController *)sub_1003CAF38(v6, location, length);

  return v7;
}

- (ICRecoverNoteAlertController)initWithNote:(id)a3
{
  return -[ICRecoverNoteAlertController initWithNote:selectedRange:](self, "initWithNote:selectedRange:", a3, 0, 0);
}

- (void)recoverNote
{
  v2 = self;
  sub_1003C9DC0();
}

- (void)recoverNotePostingNotifications
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICRecoverNoteAlertController_notificationCenter);
  v5 = self;
  id v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 postNotificationName:v4 object:v5];

  sub_1003C9DC0();
  sub_1003CA6C8();
}

- (BOOL)showFromViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1003CA1E4(v4);

  return self & 1;
}

- (ICRecoverNoteAlertController)init
{
  _NSRange result = (ICRecoverNoteAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end