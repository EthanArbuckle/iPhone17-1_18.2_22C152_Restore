@interface PatternSectionDecorationView
- (_TtC5TeaUI28PatternSectionDecorationView)initWithCoder:(id)a3;
- (_TtC5TeaUI28PatternSectionDecorationView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PatternSectionDecorationView

- (_TtC5TeaUI28PatternSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI28PatternSectionDecorationView *)PatternSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI28PatternSectionDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5E5820C();
}

- (void)layoutSubviews
{
  v2 = self;
  PatternSectionDecorationView.layoutSubviews()();
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  PatternSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);
}

- (void)didMoveToSuperview
{
  v2 = self;
  PatternSectionDecorationView.didMoveToSuperview()();
}

- (void)applyLayoutAttributes:(id)a3
{
  v4 = (UICollectionViewLayoutAttributes *)a3;
  id v5 = self;
  PatternSectionDecorationView.apply(_:)(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PatternSectionDecorationView.traitCollectionDidChange(_:)(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_patternView));
  sub_1B5E58CD8(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._traitChangeRegistry+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model));
  swift_bridgeObjectRelease();
}

@end