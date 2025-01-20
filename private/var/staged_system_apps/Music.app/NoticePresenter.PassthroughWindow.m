@interface NoticePresenter.PassthroughWindow
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_canUpdateSceneFocus;
- (BOOL)_shouldControlAutorotation;
- (BOOL)canBecomeFocused;
- (BOOL)canBecomeKeyWindow;
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithContentRect:(CGRect)a3;
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithFrame:(CGRect)a3;
- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation NoticePresenter.PassthroughWindow

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_canUpdateSceneFocus
{
  return 0;
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_100B418C8((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithWindowScene:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return [(NoticePresenter.PassthroughWindow *)&v5 initWithWindowScene:a3];
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return [(NoticePresenter.PassthroughWindow *)&v5 initWithCoder:a3];
}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C117PassthroughWindow_canReceiveTouches) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NoticePresenter.PassthroughWindow();
  return -[NoticePresenter.PassthroughWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end