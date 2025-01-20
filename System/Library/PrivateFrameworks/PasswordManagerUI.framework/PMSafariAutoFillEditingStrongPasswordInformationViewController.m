@interface PMSafariAutoFillEditingStrongPasswordInformationViewController
+ (BOOL)shouldShowView;
- (CGSize)contentSize;
- (NSString)websiteTitle;
- (NSURL)formURL;
- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithCoder:(id)a3;
- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithWebsiteTitle:(id)a3 url:(id)a4;
- (PMSafariAutoFillEditingStrongPasswordInformationViewControllerDelegate)delegate;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setFormURL:(id)a3;
- (void)setWebsiteTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMSafariAutoFillEditingStrongPasswordInformationViewController

+ (BOOL)shouldShowView
{
  unsigned int v2 = objc_msgSend(self, sel_isPasswordsAppInstalled);
  if (v2)
  {
    id v3 = objc_msgSend(self, sel_pm_defaults);
    v4 = (void *)sub_258D6F458();
    unsigned __int8 v5 = objc_msgSend(v3, sel_BOOLForKey_, v4);

    LOBYTE(v2) = v5 ^ 1;
  }
  return v2;
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewControllerDelegate)delegate
{
  unsigned int v2 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController_delegate;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x25A2D1DD0](v2);

  return (PMSafariAutoFillEditingStrongPasswordInformationViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)contentSize
{
  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v4 = self;
  if (objc_msgSend(ObjCClassFromMetadata, sel_shouldShowView))
  {
    id v5 = [(PMSafariAutoFillEditingStrongPasswordInformationViewController *)v4 view];
    if (!v5)
    {
      __break(1u);
      goto LABEL_7;
    }
    v8 = v5;
    objc_msgSend(v5, sel_intrinsicContentSize);
    double v10 = v9;
    double v12 = v11;
  }
  else
  {

    double v10 = 0.0;
    double v12 = 0.0;
  }
  double v6 = v10;
  double v7 = v12;
LABEL_7:
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)websiteTitle
{
  id v3 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle;
  swift_beginAccess();
  sub_25892C33C((uint64_t)v3, (uint64_t)v7);
  v4 = self;
  swift_dynamicCast();

  id v5 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setWebsiteTitle:(id)a3
{
  uint64_t v4 = sub_258D6F498();
  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)&long long v8 = v4;
  *((void *)&v8 + 1) = v5;
  double v6 = (_OWORD *)((char *)self
                + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle);
  swift_beginAccess();
  double v7 = self;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_258A7474C(&v8, v6);
  swift_endAccess();
}

- (NSURL)formURL
{
  uint64_t v3 = sub_258D6B528();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  double v7 = (char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL;
  swift_beginAccess();
  sub_25892C33C((uint64_t)v7, (uint64_t)v11);
  swift_dynamicCast();
  long long v8 = (void *)sub_258D6B4B8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v8;
}

- (void)setFormURL:(id)a3
{
  uint64_t v4 = sub_258D6B528();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  sub_258D6B4D8();
  uint64_t v13 = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_0, v7, v4);
  uint64_t v9 = (_OWORD *)((char *)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL);
  swift_beginAccess();
  double v10 = self;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  sub_258A7474C(v12, v9);
  swift_endAccess();
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithWebsiteTitle:(id)a3 url:(id)a4
{
  uint64_t v4 = sub_258D6B528();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_258D6F498();
  unint64_t v9 = v8;
  sub_258D6B4D8();
  return (PMSafariAutoFillEditingStrongPasswordInformationViewController *)PMSafariAutoFillEditingStrongPasswordInformationViewController.init(websiteTitle:url:)(v7, v9, (uint64_t)v6);
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = (_OWORD *)((char *)self
                + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyIconController);
  *uint64_t v5 = 0u;
  v5[1] = 0u;
  id v6 = a3;

  CGSize result = (PMSafariAutoFillEditingStrongPasswordInformationViewController *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (void)loadView
{
  unsigned int v2 = self;
  PMSafariAutoFillEditingStrongPasswordInformationViewController.loadView()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PMSafariAutoFillEditingStrongPasswordInformationViewController;
  uint64_t v4 = self;
  [(PMSafariAutoFillEditingStrongPasswordInformationViewController *)&v5 viewWillAppear:v3];
  sub_258D331D4();
}

- (PMSafariAutoFillEditingStrongPasswordInformationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (PMSafariAutoFillEditingStrongPasswordInformationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25892DE34((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anywebsiteTitle);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyFormURL);
  sub_258921D90((uint64_t)self + OBJC_IVAR___PMSafariAutoFillEditingStrongPasswordInformationViewController__anyIconController, (uint64_t *)&unk_26A0A96E0);
  swift_release();

  swift_release();
}

@end