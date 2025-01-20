@interface WorkoutRemoteViewServiceAdaptor
- (_TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor)init;
- (void)closeButtonTapped;
- (void)dismissRemoteViewControllerOn:(id)a3;
- (void)presentRemoteViewControllerOn:(id)a3 with:(id)a4 dismissCompletion:(id)a5 completion:(id)a6;
@end

@implementation WorkoutRemoteViewServiceAdaptor

- (void)presentRemoteViewControllerOn:(id)a3 with:(id)a4 dismissCompletion:(id)a5 completion:(id)a6
{
  uint64_t v11 = sub_2619EE7D0();
  uint64_t v24 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  uint64_t v19 = sub_2619EE790();
  unint64_t v21 = v20;

  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v14;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v15;
  _Block_copy(v15);
  sub_2619EBEB0(v19, v21);
  sub_2619EE7C0();
  sub_2619EC1B8(v16, (uint64_t)v13, (uint64_t)sub_2619ED9D8, v22, (uint64_t)sub_2619ED9E8, v23);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  swift_release();
  _Block_release(v15);
  swift_release();
  sub_2619ED9F0(v19, v21);
}

- (void)dismissRemoteViewControllerOn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2619EC5D8(v4);
}

- (void)closeButtonTapped
{
  v2 = self;
  sub_2619EC6E0();
}

- (_TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor)init
{
  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  id v4 = (objc_class *)type metadata accessor for WorkoutRemoteViewServiceAdaptor();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(WorkoutRemoteViewServiceAdaptor *)&v6 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  sub_2619EC4B8(v3);
}

@end