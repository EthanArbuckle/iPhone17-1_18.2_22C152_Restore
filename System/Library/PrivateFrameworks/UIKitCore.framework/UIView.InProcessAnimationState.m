@interface UIView.InProcessAnimationState
- (BOOL)isInProcess;
- (BOOL)shouldAnimatePropertyWithKey:(id)a3;
- (_TtCE5UIKitCSo6UIView23InProcessAnimationState)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5;
- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10;
@end

@implementation UIView.InProcessAnimationState

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  v17 = _Block_copy(a9);
  v18 = (uint64_t (*)(char))_Block_copy(a10);
  v19 = v18;
  if (v17)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v17;
    v17 = sub_18557A3E8;
    if (v19)
    {
LABEL_3:
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v19;
      v19 = sub_185441B70;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if (v18) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = 0;
LABEL_6:
  id v22 = a5;
  swift_unknownObjectRetain();
  id v23 = a8;
  v24 = self;
  sub_1853C13A4((uint64_t)a5, a6, (uint64_t)a7, (uint64_t)a8, v17, v20, v19, v21, a3, a4);
  sub_1854AFD40((uint64_t)v19);
  sub_1854AFD40((uint64_t)v17);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
}

- (BOOL)isInProcess
{
  return 1;
}

- (_TtCE5UIKitCSo6UIView23InProcessAnimationState)init
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_updateType) = 0;
  v2 = (char *)self + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_animationAndComposerGetter;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_isInteractive) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtCE5UIKitCSo6UIView23InProcessAnimationState_retargeted) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s23InProcessAnimationStateCMa();
  v3 = [(UIViewAnimationState *)&v5 init];
  [(UIViewAnimationState *)v3 setDisallowInheritance:1];
  return v3;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  if (a4)
  {
    uint64_t v8 = sub_186A1E95C();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  id v14 = sub_1854C3000(a3, v8, v10, a5);

  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = sub_186A1E95C();
  uint64_t v6 = v5;
  uint64_t v7 = qword_1E8FAFFF8;
  uint64_t v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  if (sub_1854C33F8(v4, v6, qword_1E8FB0008))
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    uint64_t v10 = (void *)sub_186A1E92C();
    v12.receiver = v8;
    v12.super_class = (Class)_s23InProcessAnimationStateCMa();
    BOOL v9 = [(UIViewAnimationState *)&v12 shouldAnimatePropertyWithKey:v10];

    swift_bridgeObjectRelease();
  }
  return v9;
}

@end