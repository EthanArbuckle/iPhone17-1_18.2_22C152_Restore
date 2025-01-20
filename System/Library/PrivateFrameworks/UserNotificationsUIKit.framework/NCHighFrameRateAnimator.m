@interface NCHighFrameRateAnimator
- (NCHighFrameRateAnimator)init;
- (NCHighFrameRateAnimator)initWithAnimator:(id)a3;
- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (void)performWithoutAnimation:(id)a3;
@end

@implementation NCHighFrameRateAnimator

- (NCHighFrameRateAnimator)initWithAnimator:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NCHighFrameRateAnimator_animator) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)NCHighFrameRateAnimator;
  swift_unknownObjectRetain();
  return [(NCHighFrameRateAnimator *)&v4 init];
}

- (void)performWithoutAnimation:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NCHighFrameRateAnimator_animator);
  v9[4] = sub_1D7D6DF2C;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1D7D2C66C;
  v9[3] = &block_descriptor_84;
  v7 = _Block_copy(v9);
  v8 = self;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performWithoutAnimation_, v7);
  _Block_release(v7);

  swift_release();
  swift_unknownObjectRelease();
}

- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    v9 = (uint64_t (*)())sub_1D7D6DF28;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = self;
  sub_1D7D6CA6C(a3, sub_1D7D6DF2C, v10, v9, v11);
  sub_1D7D26378((uint64_t)v9);

  swift_release();
}

- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a6);
  v13 = (uint64_t (*)())_Block_copy(a7);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  if (v13)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v13;
    v13 = (uint64_t (*)())sub_1D7D6DF28;
  }
  else
  {
    uint64_t v15 = 0;
  }
  swift_unknownObjectRetain();
  v16 = self;
  sub_1D7D6CDA8((uint64_t)a3, a4, a5, sub_1D7D6DF2C, v14, v13, v15);
  sub_1D7D26378((uint64_t)v13);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  uint64_t v14 = _Block_copy(a7);
  uint64_t v15 = (uint64_t (*)())_Block_copy(a8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  if (v15)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v15;
    uint64_t v15 = (uint64_t (*)())sub_1D7D6DF28;
  }
  else
  {
    uint64_t v17 = 0;
  }
  v18 = self;
  sub_1D7D6D124(a5, a6, sub_1D7D6D9F0, v16, v15, v17, a3, a4);
  sub_1D7D26378((uint64_t)v15);

  swift_release();
}

- (NCHighFrameRateAnimator)init
{
  result = (NCHighFrameRateAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end