@interface SwiftUICoverAnimationProvider
- (BOOL)coverAnimationSourceUseLargeCover;
- (BOOL)isInNonHorizontalLayout;
- (_TtC11BookStoreUI29SwiftUICoverAnimationProvider)init;
- (double)cardStackTransitioningCoverSourceExtraXOffset;
- (double)cardStackTransitioningCoverSourceFrame;
- (id)cardStackTransitioningCoverSourceHide;
- (id)coverAnimationSourceImage;
- (id)coverAnimationSourceReferenceView;
- (id)coverAnimationSourceView;
- (int64_t)coverAnimationSourceAlignment;
- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3;
- (void)coverAnimationSourceFinalize;
- (void)coverAnimationSourcePrepare;
- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3;
@end

@implementation SwiftUICoverAnimationProvider

- (BOOL)isInNonHorizontalLayout
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_isInNonHorizontalLayout);
}

- (double)cardStackTransitioningCoverSourceExtraXOffset
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_cardStackTransitioningCoverSourceExtraXOffset);
  swift_beginAccess();
  double *v4 = a3;
}

- (_TtC11BookStoreUI29SwiftUICoverAnimationProvider)init
{
  result = (_TtC11BookStoreUI29SwiftUICoverAnimationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_coverSourceImage));
  swift_release();

  swift_release();
}

- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3
{
  id v4 = a3;
  v5 = self;
  SwiftUICoverAnimationProvider.cardStackTransitioningCoverSourceReplaceReferenceView(_:)((UIView)v4);
}

- (id)cardStackTransitioningCoverSourceHide
{
  char v7 = 0;
  v2 = self;
  sub_63BAC(&qword_3CCAD8);
  sub_2E3290();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  aBlock[4] = sub_1594A8;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_74DF8;
  aBlock[3] = &unk_395460;
  id v4 = _Block_copy(aBlock);
  swift_release();

  return v4;
}

- (double)cardStackTransitioningCoverSourceFrame
{
  return *(double *)(a1 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceFrame);
}

- (id)coverAnimationSourceReferenceView
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView));
}

- (id)coverAnimationSourceImage
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_coverSourceImage));
}

- (id)coverAnimationSourceView
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11BookStoreUI29SwiftUICoverAnimationProvider_sourceReferenceView);
  uint64_t v3 = self;
  id v4 = v2;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_2E4A20();

  swift_bridgeObjectRelease();

  return v5;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (void)coverAnimationSourcePrepare
{
}

- (void)coverAnimationSourceFinalize
{
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

@end