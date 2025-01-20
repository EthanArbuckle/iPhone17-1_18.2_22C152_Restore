@interface PeerPaymentAccountResolutionControllerModel
- (_TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel)init;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
@end

@implementation PeerPaymentAccountResolutionControllerModel

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB940);
  uint64_t v10 = MEMORY[0x1F4188790](v8 - 8, v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v13);
  v15 = (char *)&v21 - v14;
  if (a4)
  {
    id v16 = a4;
    id v17 = a3;
    v18 = self;
    sub_1A03AF148();
    uint64_t v19 = type metadata accessor for WrapperViewController();
    *(void *)&v15[*(int *)(v19 + 20)] = v16;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 0, 1, v19);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_19F90F4F4((uint64_t)v15, (uint64_t)v12);
    v20 = v18;
    sub_1A03B10B8();
    sub_19F90F55C((uint64_t)v15);
  }
  else
  {
    __break(1u);
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_19F90F5BC();
}

- (_TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel)init
{
  return (_TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel *)sub_19F90ED30();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel__currentView;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AB948);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel__loading;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_updateAccountAction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_account));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_resolutionController));
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI43PeerPaymentAccountResolutionControllerModel_webService);
}

@end