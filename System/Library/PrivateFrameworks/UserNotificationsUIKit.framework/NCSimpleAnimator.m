@interface NCSimpleAnimator
- (NCSimpleAnimator)init;
- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (void)performWithoutAnimation:(id)a3;
@end

@implementation NCSimpleAnimator

- (void)performWithoutAnimation:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  v9[4] = sub_1D7D6DF2C;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1D7D2C66C;
  v9[3] = &block_descriptor_142;
  v7 = _Block_copy(v9);
  v8 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel__performWithoutRetargetingAnimations_, v7);
  _Block_release(v7);

  swift_release();
}

- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  if (v8)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    v8 = sub_1D7D6DF28;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = self;
  sub_1D7D6DA18(sub_1D7D6DF2C, v9, (uint64_t)v8, v10);
  sub_1D7D26378((uint64_t)v8);

  swift_release();
}

- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  v11 = _Block_copy(a6);
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  if (v12)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    v12 = sub_1D7D6DF28;
  }
  else
  {
    uint64_t v14 = 0;
  }
  swift_unknownObjectRetain();
  v15 = self;
  sub_1D7D6DB90((uint64_t)a3, a4, sub_1D7D6DF2C, v13, (uint64_t)v12, v14);
  sub_1D7D26378((uint64_t)v12);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  uint64_t v13 = _Block_copy(a7);
  uint64_t v14 = _Block_copy(a8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  if (v14)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v14;
    uint64_t v14 = sub_1D7D6DF28;
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = self;
  sub_1D7D6DD20(a5, (uint64_t (*)(uint64_t, char))sub_1D7D6DF2C, v15, (uint64_t)v14, v16, a3, a4);
  sub_1D7D26378((uint64_t)v14);

  swift_release();
}

- (NCSimpleAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCSimpleAnimator;
  return [(NCSimpleAnimator *)&v3 init];
}

@end