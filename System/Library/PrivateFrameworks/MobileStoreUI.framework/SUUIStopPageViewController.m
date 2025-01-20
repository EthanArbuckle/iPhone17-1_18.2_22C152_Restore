@interface SUUIStopPageViewController
+ (BOOL)isStopPageBagValueOverrideEnabledForTabIdentifier:(id)a3;
+ (BOOL)isStopPageEnabledForTabIdentifier:(id)a3;
- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithCoder:(id)a3;
- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)initForTabIdentifier:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artworkDictionary:(id)a7 deeplinkUrl:(id)a8 purchasesUrl:(id)a9 wishlistButtonTitle:(id)a10 showWishlistButton:(BOOL)a11 clientContext:(id)a12;
- (unint64_t)supportedInterfaceOrientations;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SUUIStopPageViewController

+ (BOOL)isStopPageEnabledForTabIdentifier:(id)a3
{
  return sub_256867064((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE7Enabled3forSbSS_tFZ_0);
}

+ (BOOL)isStopPageBagValueOverrideEnabledForTabIdentifier:(id)a3
{
  return sub_256867064((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE23BagValueOverrideEnabled3forSbSS_tFZ_0);
}

- (id)initForTabIdentifier:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artworkDictionary:(id)a7 deeplinkUrl:(id)a8 purchasesUrl:(id)a9 wishlistButtonTitle:(id)a10 showWishlistButton:(BOOL)a11 clientContext:(id)a12
{
  v53 = self;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F6AE40);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v22 = (char *)&v44 - v21;
  uint64_t v23 = sub_2568703D0();
  uint64_t v51 = v24;
  uint64_t v52 = v23;
  if (a4)
  {
    uint64_t v25 = sub_2568703D0();
    unint64_t v49 = v26;
    uint64_t v50 = v25;
    if (a5)
    {
LABEL_3:
      uint64_t v27 = sub_2568703D0();
      uint64_t v47 = v28;
      uint64_t v48 = v27;
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v49 = 0;
    uint64_t v50 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v47 = 0;
  uint64_t v48 = 0;
LABEL_6:
  if (a6)
  {
    uint64_t v29 = sub_2568703D0();
    uint64_t v45 = v30;
    uint64_t v46 = v29;
    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  if (a7) {
LABEL_8:
  }
    a7 = (id)sub_256870350();
LABEL_9:
  id v31 = a8;
  id v32 = a9;
  id v33 = a10;
  id v34 = a12;
  if (v31)
  {
    sub_256870260();

    uint64_t v35 = sub_256870280();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v22, 0, 1, v35);
  }
  else
  {
    uint64_t v36 = sub_256870280();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v22, 1, 1, v36);
  }
  if (v32)
  {
    sub_256870260();

    uint64_t v37 = sub_256870280();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v20, 0, 1, v37);
  }
  else
  {
    uint64_t v38 = sub_256870280();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v20, 1, 1, v38);
  }
  if (v33)
  {
    uint64_t v39 = sub_2568703D0();
    uint64_t v41 = v40;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v41 = 0;
  }
  id v42 = sub_25686C3FC(v52, v51, v50, v49, v48, v47, v46, v45, (uint64_t)a7, (uint64_t)v22, (uint64_t)v20, v39, v41, a11, v34);

  return v42;
}

- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView) = 0;
  id v4 = a3;

  result = (_TtC13MobileStoreUI26SUUIStopPageViewController *)sub_256870520();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  SUUIStopPageViewController.viewDidLoad()();
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SUUIStopPageViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  SUUIStopPageViewController.traitCollectionDidChange(_:)(v9);
}

- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13MobileStoreUI26SUUIStopPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25686CCA0((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork, &qword_269F6AE50);
  sub_25686CCA0((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl, &qword_269F6AE40);
  sub_25686CCA0((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl, &qword_269F6AE40);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext);
}

@end