@interface NCNoAnimationAnimator
- (NCNoAnimationAnimator)init;
- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (void)performWithoutAnimation:(id)a3;
@end

@implementation NCNoAnimationAnimator

- (void)performWithoutAnimation:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v9 = sub_1D7D6DF28;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void (*)(void *))v7[2];
  v11 = self;
  v10(v7);
  if (v8)
  {
    swift_retain();
    v9(1, 0);
    sub_1D7D26378((uint64_t)v9);
    sub_1D7D26378((uint64_t)v9);
  }
  _Block_release(v7);
}

- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  v9 = _Block_copy(a6);
  v10 = _Block_copy(a7);
  if (v10)
  {
    *(void *)(swift_allocObject() + 16) = v10;
    v11 = sub_1D7D6DF28;
  }
  else
  {
    v11 = 0;
  }
  v12 = (void (*)(void *))v9[2];
  swift_unknownObjectRetain();
  v13 = self;
  v12(v9);
  if (v10)
  {
    swift_retain();
    v11(1, 0);
    sub_1D7D26378((uint64_t)v11);
    sub_1D7D26378((uint64_t)v11);
  }
  _Block_release(v9);

  swift_unknownObjectRelease();
}

- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  v10 = _Block_copy(a7);
  v11 = _Block_copy(a8);
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    v12 = sub_1D7D6D9D0;
  }
  else
  {
    v12 = 0;
  }
  v13 = (void (*)(void *))v10[2];
  v14 = self;
  v13(v10);
  if (v11)
  {
    swift_retain();
    v12(1, 0);
    sub_1D7D26378((uint64_t)v12);
    sub_1D7D26378((uint64_t)v12);
  }
  _Block_release(v10);
}

- (NCNoAnimationAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCNoAnimationAnimator;
  return [(NCNoAnimationAnimator *)&v3 init];
}

@end