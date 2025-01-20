@interface ChevronButton
- (_TtC9SeymourUI13ChevronButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI13ChevronButton)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryChanged;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation ChevronButton

- (_TtC9SeymourUI13ChevronButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13ChevronButton *)sub_239EAED54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13ChevronButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EB0008();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_239EAF3AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239EAF4EC();
}

- (void)contentSizeCategoryChanged
{
  v2 = self;
  id v3 = [(ChevronButton *)v2 traitCollection];
  sub_239EAF784(v3);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v4 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection
                  + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v6 = *(id *)((char *)&self->super.super.super._swiftAnimationInfo + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super._layerRetained + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super._subviewCache + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults));

  sub_239E12CCC(v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);
  uint64_t v11 = *(void *)((char *)&self->super.super.super.super._responderFlags
                  + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);
  v12 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                  + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);
  uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                   + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection
                   + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);
  uint64_t v15 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                   + OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride);

  sub_239EAB4A0(v10, v11, v12, v13, v14, v15);
}

@end