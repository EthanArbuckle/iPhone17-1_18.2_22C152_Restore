@interface ICMiniPlayerViewController
+ (NSString)accessibilityIdentifierForPlayerView;
- (BOOL)_canShowWhileLocked;
- (ICAttachment)attachment;
- (ICMiniPlayerViewController)initWithCoder:(id)a3;
- (ICMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)close:(id)a3;
- (void)hideCloseButton:(id)a3;
- (void)loadView;
- (void)setAttachment:(id)a3;
- (void)swipe:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation ICMiniPlayerViewController

- (ICAttachment)attachment
{
  return (ICAttachment *)sub_20C02DB1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMiniPlayerViewController_attachment);
}

- (void)setAttachment:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_attachment);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_20C07F3DC(v6);
}

- (void)loadView
{
  v2 = self;
  sub_20C07FCA0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20C080984();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (NSString)accessibilityIdentifierForPlayerView
{
  v2 = (void *)sub_20C162A80();

  return (NSString *)v2;
}

- (void)swipe:(id)a3
{
  id v4 = a3;
  id v7 = self;
  BOOL v5 = objc_msgSend(v4, sel_direction) == (id)2;
  char v6 = *((unsigned char *)&v7->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton);
  *((unsigned char *)&v7->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton) = v5;
  sub_20C080EA8(v6);
}

- (void)close:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_20C1638F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    BOOL v5 = self;
  }
  sub_20C0813BC();

  sub_20BFCEDFC((uint64_t)v6, &qword_26AD81380);
}

- (void)hideCloseButton:(id)a3
{
  char v4 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_showCloseButton) = 0;
  id v5 = a3;
  char v6 = self;
  sub_20C080EA8(v4);
}

- (ICMiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_20C162AC0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ICMiniPlayerViewController *)MiniPlayerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (ICMiniPlayerViewController)initWithCoder:(id)a3
{
  return (ICMiniPlayerViewController *)MiniPlayerViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_20BFCDA14(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_closeHandler));

  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMiniPlayerViewController_labelColor);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = _s11NotesEditor24MiniPlayerViewControllerC22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

@end