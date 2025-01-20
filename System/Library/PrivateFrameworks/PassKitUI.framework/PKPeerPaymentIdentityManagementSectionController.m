@interface PKPeerPaymentIdentityManagementSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (NSArray)allSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (PKPeerPaymentIdentityManagementSectionController)init;
- (PKPeerPaymentIdentityManagementSectionController)initWithDelegate:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4;
- (void)preflight:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPeerPaymentIdentityManagementSectionController

- (PKPeerPaymentIdentityManagementSectionController)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  sub_19FCC5C5C();
  v4 = v3;
  swift_unknownObjectRelease();
  return v4;
}

- (NSArray)allSectionIdentifiers
{
  v2 = (void *)sub_1A03B4C38();

  return (NSArray *)v2;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC5valid3forSbSo09PKPaymentA0C_tFZ_0(v3);

  return v4 & 1;
}

- (void)preflight:(id)a3
{
  unsigned __int8 v4 = (void (**)(void))_Block_copy(a3);
  swift_getKeyPath();
  sub_19FCC675C((unint64_t *)&qword_1E94A4530, (void (*)(uint64_t))type metadata accessor for PeerPaymentIdentityManager);
  v5 = self;
  sub_1A03AF5C8();
  swift_release();
  v4[2](v4);
  _Block_release(v4);
}

- (NSArray)sectionIdentifiers
{
  v2 = self;
  PeerPaymentIdentityManagementSectionController.sectionIdentifiers.getter();

  id v3 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_account);
  id v6 = a3;
  v7 = self;
  if (objc_msgSend(v5, sel_supportsDeviceTap)
    && (PKCashDeviceTapEnabled() & 1) != 0
    && (PKIsVision() & 1) == 0
    && (PKIsPhone() & 1) != 0)
  {
    id v8 = [(PKPaymentPassDetailSectionController *)v7 detailViewStyle];

    return v8 != (id)2;
  }
  else
  {

    return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v12 = a3;
  v13 = self;
  id v14 = _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC9tableView_12cellForRowAt17sectionIdentifierSo07UITableK4CellCSgSo0rK0C_10Foundation9IndexPathVSStF_0(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v14;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  return sub_19FCC5768(self);
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return sub_19FCC5768(self);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v7 = sub_1A03AF498();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AF458();
  id v12 = a3;
  v13 = self;
  _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC9tableView_14didSelectRowAt17sectionIdentifierySo07UITableK0C_10Foundation9IndexPathVSStF_0(v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  _s9PassKitUI46PeerPaymentIdentityManagementSectionControllerC04peereF7Manager_30didUpdateProfileAppearanceDatayAA0defK0C_So06PKPeerenoP0CtF_0();
}

- (PKPeerPaymentIdentityManagementSectionController)init
{
  result = (PKPeerPaymentIdentityManagementSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_account));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_identityManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_renderer));
  id v3 = (char *)self + OBJC_IVAR___PKPeerPaymentIdentityManagementSectionController_delegate;

  sub_19F482DB0((uint64_t)v3);
}

@end