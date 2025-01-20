@interface PRIncomingCallTextViewAdapter
- (BOOL)callIsActive;
- (BOOL)displayNameIsSuitableForVerticalLayout;
- (BOOL)marqueeRunning;
- (BOOL)multilineNameIsDisplayed;
- (BOOL)statusIsHidden;
- (BOOL)statusIsSuitableForVerticalLayout;
- (CGRect)frame;
- (CGRect)tightFrame;
- (CGSize)sizeThatFitsIn:(CGSize)a3;
- (NSString)displayNameText;
- (NSString)statusText;
- (PRIncomingCallTextViewAdapter)init;
- (PRIncomingCallTextViewAdapter)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5;
- (PRIncomingCallTextViewAdapter)initWithName:(id)a3;
- (PRIncomingCallTextViewAdapter)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5;
- (UIColor)textColor;
- (UIFont)emphasizedNameFont;
- (UIFont)secondaryNameFont;
- (UIFont)statusFont;
- (UIViewController)emojiViewController;
- (UIViewController)viewController;
- (unint64_t)alignment;
- (unint64_t)layout;
- (unint64_t)preferredAlignment;
- (unint64_t)preferredLayout;
- (void)overrideTitleLayoutWith:(unint64_t)a3;
- (void)posterAppearanceDidChange:(id)a3;
- (void)removeTitleLayoutOverride;
- (void)setDisplayNameText:(id)a3;
- (void)setEmphasizedNameFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMarqueeRunning:(BOOL)a3;
- (void)setPreferredAlignment:(unint64_t)a3;
- (void)setPreferredLayout:(unint64_t)a3;
- (void)setSecondaryNameFont:(id)a3;
- (void)setStatusFont:(id)a3;
- (void)setStatusIsHidden:(BOOL)a3;
- (void)setStatusText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFontUsingDefaultFontSizes:(id)a3;
- (void)transitionCallToActiveStateAnimated:(BOOL)a3;
@end

@implementation PRIncomingCallTextViewAdapter

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController));
}

- (UIViewController)emojiViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController));
}

- (BOOL)statusIsHidden
{
  v2 = self;
  char v3 = IncomingCallTextViewAdapter.statusIsHidden.getter();

  return v3 & 1;
}

- (void)setStatusIsHidden:(BOOL)a3
{
  v4 = self;
  swift_retain();
  v5 = sub_18C2B96DC(v8);
  uint64_t v7 = v6;
  sub_18C29E1A4(v6, (uint64_t)v9);
  sub_18C29E1A4((uint64_t)v9, (uint64_t)v10);
  if (sub_18C2A7154((uint64_t)v10) != 1) {
    *(unsigned char *)(v7 + 32) = a3;
  }
  ((void (*)(void *, void))v5)(v8, 0);

  swift_release();
}

- (CGRect)frame
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  char v3 = self;
  id v4 = objc_msgSend(v2, sel_view);
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, sel_frame);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    double v5 = v11;
    double v6 = v13;
    double v7 = v15;
    double v8 = v17;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  IncomingCallTextViewAdapter.frame.setter(x, y, width, height);
}

- (CGRect)tightFrame
{
  v2 = self;
  IncomingCallTextViewAdapter.tightFrame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (unint64_t)preferredAlignment
{
  v2 = self;
  unint64_t v3 = IncomingCallTextViewAdapter.preferredAlignment.getter();

  return v3;
}

- (void)setPreferredAlignment:(unint64_t)a3
{
  double v4 = self;
  IncomingCallTextViewAdapter.preferredAlignment.setter(a3);
}

- (unint64_t)preferredLayout
{
  v2 = self;
  unint64_t v3 = IncomingCallTextViewAdapter.preferredLayout.getter();

  return v3;
}

- (void)setPreferredLayout:(unint64_t)a3
{
  double v4 = self;
  IncomingCallTextViewAdapter.preferredLayout.setter(a3);
}

- (UIColor)textColor
{
  v2 = self;
  id v3 = IncomingCallTextViewAdapter.textColor.getter();

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  double v5 = self;
  IncomingCallTextViewAdapter.textColor.setter(v4);
}

- (UIFont)emphasizedNameFont
{
  v2 = self;
  id v3 = IncomingCallTextViewAdapter.emphasizedNameFont.getter();

  return (UIFont *)v3;
}

- (void)setEmphasizedNameFont:(id)a3
{
  id v4 = a3;
  double v5 = self;
  IncomingCallTextViewAdapter.emphasizedNameFont.setter(v4);
}

- (UIFont)secondaryNameFont
{
  v2 = self;
  id v3 = IncomingCallTextViewAdapter.secondaryNameFont.getter();

  return (UIFont *)v3;
}

- (void)setSecondaryNameFont:(id)a3
{
  id v5 = a3;
  double v6 = self;
  IncomingCallTextViewAdapter.secondaryNameFont.setter(a3);
}

- (UIFont)statusFont
{
  v2 = self;
  id v3 = IncomingCallTextViewAdapter.statusFont.getter();

  return (UIFont *)v3;
}

- (void)setStatusFont:(id)a3
{
  id v5 = a3;
  double v6 = self;
  IncomingCallTextViewAdapter.statusFont.setter(a3);
}

- (NSString)displayNameText
{
  v2 = self;
  IncomingCallTextViewAdapter.displayNameText.getter();

  id v3 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setDisplayNameText:(id)a3
{
  uint64_t v4 = sub_18C2CAA00();
  uint64_t v6 = v5;
  double v7 = self;
  IncomingCallTextViewAdapter.displayNameText.setter(v4, v6);
}

- (NSString)statusText
{
  v2 = self;
  IncomingCallTextViewAdapter.statusText.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_18C2CA9D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setStatusText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18C2CAA00();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  swift_retain();
  sub_18C2BACB0(v4, v6);

  swift_release();
  swift_bridgeObjectRelease();
}

- (unint64_t)alignment
{
  v2 = self;
  swift_retain();
  char v3 = sub_18C2BA400();

  swift_release();
  return v3 & 1;
}

- (unint64_t)layout
{
  uint64_t v3 = sub_18C2CA840();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  swift_retain();
  sub_18C2BA804((uint64_t)v5);
  swift_release();
  unint64_t v7 = sub_18C2B89E8(v5);

  return v7;
}

- (BOOL)displayNameIsSuitableForVerticalLayout
{
  v2 = self;
  char v3 = IncomingCallTextViewAdapter.displayNameIsSuitableForVerticalLayout.getter();

  return v3 & 1;
}

- (BOOL)statusIsSuitableForVerticalLayout
{
  v2 = self;
  char v3 = IncomingCallTextViewAdapter.statusIsSuitableForVerticalLayout.getter();

  return v3 & 1;
}

- (BOOL)marqueeRunning
{
  swift_getKeyPath();
  swift_getKeyPath();
  char v3 = self;
  swift_retain();
  sub_18C2CA530();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

- (void)setMarqueeRunning:(BOOL)a3
{
}

- (BOOL)multilineNameIsDisplayed
{
  v2 = self;
  BOOL v3 = IncomingCallTextViewAdapter.multilineNameIsDisplayed.getter();

  return v3;
}

- (BOOL)callIsActive
{
  swift_getKeyPath();
  swift_getKeyPath();
  BOOL v3 = self;
  swift_retain();
  sub_18C2CA530();
  swift_release();
  swift_release();
  swift_release();

  return v5;
}

- (PRIncomingCallTextViewAdapter)initWithName:(id)a3
{
  sub_18C2CAA00();
  uint64_t v4 = (void *)sub_18C2CA9D0();
  swift_bridgeObjectRelease();
  BOOL v5 = [(PRIncomingCallTextViewAdapter *)self initWithName:v4 status:0 callIsActive:0];

  return v5;
}

- (PRIncomingCallTextViewAdapter)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_18C2CAA00();
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_18C2CAA00();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0;
  }
  uint64_t v14 = sub_18C2BBFFC(v8, v10, v11, v13, a5);
  id v15 = objc_allocWithZone(ObjectType);
  double v16 = (PRIncomingCallTextViewAdapter *)sub_18C2B6E44(v14);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v16;
}

- (PRIncomingCallTextViewAdapter)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4)
  {
    uint64_t v7 = sub_18C2CAA00();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  return (PRIncomingCallTextViewAdapter *)IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(a3, v7, v9, v5);
}

- (PRIncomingCallTextViewAdapter)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController) = 0;

  CGRect result = (PRIncomingCallTextViewAdapter *)sub_18C2CAC50();
  __break(1u);
  return result;
}

- (void)setTextFontUsingDefaultFontSizes:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v4);
}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
  id v4 = self;
  IncomingCallTextViewAdapter.transitionCallToActiveState(animated:)(a3);
}

- (void)overrideTitleLayoutWith:(unint64_t)a3
{
  id v4 = self;
  IncomingCallTextViewAdapter.overrideTitleLayout(with:)(a3);
}

- (void)removeTitleLayoutOverride
{
  v2 = self;
  IncomingCallTextViewAdapter.removeTitleLayoutOverride()();
}

- (CGSize)sizeThatFitsIn:(CGSize)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  id v4 = self;
  id v5 = v3;
  sub_18C2CA6C0();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  BOOL v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
}

- (void)posterAppearanceDidChange:(id)a3
{
  id v4 = a3;
  double v8 = self;
  id v5 = objc_msgSend(v4, sel_font);
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v5);

  id v6 = objc_msgSend(v4, sel_labelColor);
  id v7 = objc_msgSend(v6, sel_color);

  if (v7) {
    IncomingCallTextViewAdapter.textColor.setter(v7);
  }
  IncomingCallTextViewAdapter.preferredAlignment.setter((unint64_t)objc_msgSend(v4, sel_preferredTitleAlignment));
  IncomingCallTextViewAdapter.preferredLayout.setter((uint64_t)objc_msgSend(v4, sel_preferredTitleLayout));
}

@end