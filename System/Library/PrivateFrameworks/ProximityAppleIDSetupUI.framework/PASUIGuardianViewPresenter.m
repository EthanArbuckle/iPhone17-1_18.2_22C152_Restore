@interface PASUIGuardianViewPresenter
- (PASUIGuardianViewPresenter)init;
- (PASUIGuardianViewPresenter)initWithSharingViewController:(id)a3;
- (PASUIGuardianViewPresenterDelegate)delegate;
- (void)activateWithTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setTemplateMessageSession:(CUMessageSession *)a3 completion:(id)a4;
@end

@implementation PASUIGuardianViewPresenter

- (PASUIGuardianViewPresenterDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230FA4900](v2);
  return (PASUIGuardianViewPresenterDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (PASUIGuardianViewPresenter)initWithSharingViewController:(id)a3
{
  id v3 = a3;
  v4 = (PASUIGuardianViewPresenter *)sub_22E7D8278(v3);

  return v4;
}

- (void)dealloc
{
  v2 = self;
  PASUISourceViewPresenter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_22E7B4FDC((uint64_t)self + OBJC_IVAR___PASUIGuardianViewPresenter_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  sub_22E7A7224((uint64_t)self + OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter, &qword_268611688);
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
  v13[4] = &unk_268611670;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268611678;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_22E7D7EAC((uint64_t)v9, (uint64_t)&unk_268611680, (uint64_t)v14);
  swift_release();
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
  v13[4] = &unk_268611640;
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

- (PASUIGuardianViewPresenter)init
{
  result = (PASUIGuardianViewPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end