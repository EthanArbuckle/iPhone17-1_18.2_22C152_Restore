@interface NearbyPeerPaymentAppearancePreferencesViewController
- (BOOL)_canShowWhileLocked;
- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)preferredUserInterfaceStyle;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NearbyPeerPaymentAppearancePreferencesViewController

- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F9288CC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19F91EEAC();
}

- (int64_t)preferredUserInterfaceStyle
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2)
    return 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbyPeerPaymentAppearancePreferencesViewController();
  return [(NearbyPeerPaymentAppearancePreferencesViewController *)&v3 preferredUserInterfaceStyle];
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_19F91F4EC();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1A03AF498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v11 = a3;
  v12 = self;
  sub_19F91F808(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 20.0;
  double v5 = 0.0;
  if (a4) {
    double v5 = 20.0;
  }
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2)
    return v5;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_context) != (Class)2
    && a4 == 0)
  {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4 = 0.0;
  if (a4 == 1)
  {
    uint64_t v6 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer);
    id v7 = a3;
    uint64_t v8 = self;
    objc_msgSend(v7, sel_bounds);
    objc_msgSend(v6, sel_sizeThatFits_, CGRectGetWidth(v11), 1.79769313e308);
    double v4 = v9;
  }
  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    id v5 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer));
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_19F91FFBC(v4);
}

- (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_identityManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController_footer));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI52NearbyPeerPaymentAppearancePreferencesViewController____lazy_storage___datasource);
}

@end