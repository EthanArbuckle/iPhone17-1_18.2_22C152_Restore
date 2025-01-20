@interface SearchUIAnimator
+ (id)animateWith:(id)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateWithLayer:(id)a3 with:(id)a4 key:(id)a5 animations:(id)a6 delegate:(id)a7;
- (_TtC8SearchUI16SearchUIAnimator)init;
@end

@implementation SearchUIAnimator

+ (void)animateWithLayer:(id)a3 with:(id)a4 key:(id)a5 animations:(id)a6 delegate:(id)a7
{
  sub_1E46A6050();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE56540);
  uint64_t v10 = sub_1E46A6110();
  v11 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = v10;
  v17.receiver = v12;
  v17.super_class = v11;
  id v13 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v14 = objc_msgSendSuper2(&v17, sel_init);
  v15 = (void *)sub_1E46A0B8C((uint64_t)a4);
  objc_msgSend(v15, sel_setDelegate_, a7, v17.receiver, v17.super_class);
  v16 = (void *)sub_1E46A6040();
  objc_msgSend(v13, sel_addAnimation_forKey_, v15, v16);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)animateWith:(id)a3 animations:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_1E46A2254;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (void *)swift_unknownObjectRetain();
  id v11 = _s8SearchUI0A10UIAnimatorC7animate4with10animations10completionSo22UIViewPropertyAnimatorCAA0A19UIAnimationSettings_p_yycySbcSgtFZ_0(v10, (uint64_t (*)(uint64_t))sub_1E46A2234, v8, (uint64_t)v7, v9);
  sub_1E46A2244((uint64_t)v7);
  swift_unknownObjectRelease();
  swift_release();
  return v11;
}

- (_TtC8SearchUI16SearchUIAnimator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIAnimator();
  return [(SearchUIAnimator *)&v3 init];
}

@end