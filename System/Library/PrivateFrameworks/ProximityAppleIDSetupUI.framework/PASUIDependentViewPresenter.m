@interface PASUIDependentViewPresenter
- (BOOL)shouldSignInForSelf;
- (PASUIDependentViewPresenter)init;
- (PASUIDependentViewPresenter)initWithParentViewController:(id)a3;
- (PASUIDependentViewPresenterDelegate)delegate;
- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4;
- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setShouldSignInForSelf:(BOOL)a3;
- (void)setTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4;
- (void)startFlowWithContainerViewController:(id)a3;
- (void)startFlowWithNavigationController:(id)a3;
@end

@implementation PASUIDependentViewPresenter

- (PASUIDependentViewPresenterDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230FA4900](v2);
  return (PASUIDependentViewPresenterDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldSignInForSelf
{
  uint64_t v3 = *(void *)&self->delegate[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40);
  v6 = self;
  char v7 = v5(ObjectType, v3);

  return v7 & 1;
}

- (void)setShouldSignInForSelf:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = *(void *)&self->delegate[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  uint64_t ObjectType = swift_getObjectType();
  char v7 = *(void (**)(BOOL, uint64_t, uint64_t))(v5 + 48);
  v8 = self;
  v7(v3, ObjectType, v5);
}

- (PASUIDependentViewPresenter)init
{
  return (PASUIDependentViewPresenter *)PASUITargetViewPresenter.init()();
}

- (void)dealloc
{
  v2 = self;
  PASUITargetViewPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_22E7B4FDC((uint64_t)self + OBJC_IVAR___PASUIDependentViewPresenter_delegate);
  swift_unknownObjectRelease();
  sub_22E7A7224((uint64_t)self + OBJC_IVAR___PASUIDependentViewPresenter_navigationController, &qword_268610940);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268610AA8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268610AB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22E7D7EAC((uint64_t)v9, (uint64_t)&unk_268610AB8, (uint64_t)v14);
  swift_release();
}

- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268610A88;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268610A90;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22E7D7EAC((uint64_t)v9, (uint64_t)&unk_268610A98, (uint64_t)v14);
  swift_release();
}

- (void)startFlowWithNavigationController:(id)a3
{
  type metadata accessor for PASViewControllerPresentationHandler();
  *(void *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain_n();
  uint64_t v5 = self;
  uint64_t v6 = swift_retain();
  sub_22E7B3820(v6, (uint64_t)v5);
  swift_unknownObjectRelease();

  swift_release_n();
}

- (void)startFlowWithContainerViewController:(id)a3
{
  v4 = (UIViewController *)a3;
  uint64_t v5 = self;
  PASUITargetViewPresenter.startFlow(withContainerViewController:)(v4);
}

- (void)setTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268610A70;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268610A78;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22E7D7EAC((uint64_t)v9, (uint64_t)&unk_2686114C0, (uint64_t)v14);
  swift_release();
}

- (PASUIDependentViewPresenter)initWithParentViewController:(id)a3
{
  return (PASUIDependentViewPresenter *)PASUITargetViewPresenter.init(parentViewController:)(a3);
}

@end