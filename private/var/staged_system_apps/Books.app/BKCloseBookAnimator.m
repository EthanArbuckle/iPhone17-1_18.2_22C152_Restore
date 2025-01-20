@interface BKCloseBookAnimator
- (BKCloseBookAnimator)init;
- (BKCloseBookAnimator)initWithContentHelper:(id)a3 coverSource:(id)a4;
- (UIImage)coverImage;
- (double)transitionDuration:(id)a3;
- (id)animationComplete;
- (id)spreadSnapshot;
- (void)animateTransition:(id)a3;
- (void)setAnimationComplete:(id)a3;
- (void)setCoverImage:(id)a3;
- (void)setSpreadSnapshot:(id)a3;
@end

@implementation BKCloseBookAnimator

- (UIImage)coverImage
{
  if (self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8]) {
    id v2 = 0;
  }
  else {
    id v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
  }

  return (UIImage *)v2;
}

- (void)setCoverImage:(id)a3
{
  if (a3)
  {
    v3 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
    uint64_t v5 = *(void *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent];
    *(void *)v3 = a3;
    *((void *)v3 + 1) = 0;
    char v6 = v3[16];
    v3[16] = 0;
    id v7 = a3;
    sub_100471BCC(v4, v5, v6);
  }
}

- (id)spreadSnapshot
{
  id v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
  if (self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8] == 1)
  {
    uint64_t v3 = v2[1];
    v6[4] = *v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_100471E4C;
    v6[3] = &unk_100A5BB38;
    v4 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSpreadSnapshot:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
    v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent);
    uint64_t v8 = *(void *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent];
    *(void *)id v7 = sub_100474280;
    *((void *)v7 + 1) = v6;
    char v10 = v7[16];
    v7[16] = 1;
    sub_100471BCC(v9, v8, v10);
  }
}

- (id)animationComplete
{
  id v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100023798;
    aBlock[3] = &unk_100A5BAC0;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAnimationComplete:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100051634;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *uint64_t v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10003E138(v7);
}

- (BKCloseBookAnimator)initWithContentHelper:(id)a3 coverSource:(id)a4
{
  v4 = (char *)self + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 2;
  uint64_t v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_contentHelper) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_coverSource) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CloseBookAnimator();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return [(BKCloseBookAnimator *)&v7 init];
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  CloseBookAnimator.animateTransition(using:)(a3);
  swift_unknownObjectRelease();
}

- (BKCloseBookAnimator)init
{
  result = (BKCloseBookAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100471BCC(*(void **)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_crossFadeContent), *(void *)&self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent], self->crossFadeContent[OBJC_IVAR___BKCloseBookAnimator_crossFadeContent + 8]);
  sub_10003E138(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKCloseBookAnimator_animationComplete));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end