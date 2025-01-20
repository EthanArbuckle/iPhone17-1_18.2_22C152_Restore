@interface _UIMagicMorphAnimation
- (UIView)morphContainer;
- (_UIMagicMorphAnimation)init;
- (id)newInteractionAssertion;
- (void)animateWith:(id)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6;
- (void)cancel;
- (void)geometryTrackingDisplayLinkDidFire:(id)a3;
- (void)morphTo:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)morphTo:(id)a3 reparentWithoutAnimation:(BOOL)a4 completion:(id)a5;
- (void)performCompletionsAsGroup:(id)a3;
@end

@implementation _UIMagicMorphAnimation

- (_UIMagicMorphAnimation)init
{
  return (_UIMagicMorphAnimation *)sub_1855D86EC();
}

- (UIView)morphContainer
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____UIMagicMorphAnimation_morphView));
}

- (void)morphTo:(id)a3 parameters:(id)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_18557A3E4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = (__objc2_class **)a3;
  id v11 = a4;
  v12 = self;
  sub_18597B190(v10, (uint64_t)v11, v8, v9);
  sub_1854AFD40((uint64_t)v8);
}

- (void)morphTo:(id)a3 reparentWithoutAnimation:(BOOL)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_18557A3E4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = (__objc2_class **)a3;
  id v11 = self;
  sub_18597D9C0(v10, a4, v8, v9);
  sub_1854AFD40((uint64_t)v8);
}

- (id)newInteractionAssertion
{
  v2 = self;
  id v3 = sub_18597B0D8();

  return v3;
}

- (void)cancel
{
  v2 = self;
  sub_18597AECC();
}

- (void)geometryTrackingDisplayLinkDidFire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18597F674();
}

- (void)animateWith:(id)a3 tracking:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a5);
  id v11 = (uint64_t (*)())_Block_copy(a6);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  if (v11)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v11;
    id v11 = sub_18557A3E4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_unknownObjectRetain();
  v14 = self;
  sub_18597ABEC(a3, a4, (uint64_t)sub_18557A3E8, v12, (uint64_t)v11, v13);
  sub_1854AFD40((uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)performCompletionsAsGroup:(id)a3
{
  id v4 = (void (**)(void))_Block_copy(a3);
  uint64_t v5 = OBJC_IVAR____UIMagicMorphAnimation_groupCompletion;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphAnimation_groupCompletion);
  v7 = self;
  objc_msgSend(v6, sel_increment);
  v4[2](v4);
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), sel_complete);
  _Block_release(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____UIMagicMorphAnimation____lazy_storage___geometryTrackingDisplayLink));

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphAnimation_animationContainerView);
}

@end