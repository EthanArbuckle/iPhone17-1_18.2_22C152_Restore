@interface _TFTypographySettingsContentViewController
- (TypographyPanelDelegate)delegate;
- (_TFTypographySettingsContentViewController)init;
- (_TFTypographySettingsContentViewController)initWithCoder:(id)a3;
- (_TFTypographySettingsContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (__TFTypographySettingsContentViewControllerDelegate)_delegate;
- (void)_setSelectedFont:(id)a3;
- (void)hide;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setSelectedFont:(id)a3;
- (void)set_delegate:(id)a3;
- (void)typographyPanelDidUpdateWithFont:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _TFTypographySettingsContentViewController

- (_TFTypographySettingsContentViewController)init
{
  return (_TFTypographySettingsContentViewController *)sub_25EB4893C();
}

- (_TFTypographySettingsContentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController_delegate) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate) = 0;
  id v4 = a3;

  result = (_TFTypographySettingsContentViewController *)sub_25EB4E5B8();
  __break(1u);
  return result;
}

- (void)hide
{
}

- (void)loadView
{
  v2 = self;
  _TFTypographySettingsContentViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(_TFTypographySettingsContentViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_superview);

    if (v7)
    {
      id v8 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
      objc_msgSend(v7, sel_setBackgroundColor_, v8);

      id v4 = v8;
    }
  }
  else
  {
    __break(1u);
  }
}

- (TypographyPanelDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();
  return (TypographyPanelDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)setSelectedFont:(id)a3
{
}

- (void)typographyPanelDidUpdateWithFont:(id)a3
{
  id v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate);
  swift_beginAccess();
  if (*v4) {
    objc_msgSend(*v4, sel__typographySettingsViewControllerDidUpdateFont_, a3);
  }
}

- (__TFTypographySettingsContentViewControllerDelegate)_delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (__TFTypographySettingsContentViewControllerDelegate *)v2;
}

- (void)set_delegate:(id)a3
{
  id v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TFTypographySettingsContentViewController__delegate);
  swift_beginAccess();
  *id v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)_setSelectedFont:(id)a3
{
}

- (_TFTypographySettingsContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TFTypographySettingsContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TFTypographySettingsContentViewController__typographyPanel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end