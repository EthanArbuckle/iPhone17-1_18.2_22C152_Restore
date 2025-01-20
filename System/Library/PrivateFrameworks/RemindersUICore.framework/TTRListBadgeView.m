@interface TTRListBadgeView
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)ttrAccessibilityShouldIgnoreAccessibilityName;
- (BOOL)ttrAccessibilityShouldIgnoreTintColorValue;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC15RemindersUICore16TTRListBadgeView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore16TTRListBadgeView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)setTtrAccessibilityShouldIgnoreAccessibilityName:(BOOL)a3;
- (void)setTtrAccessibilityShouldIgnoreTintColorValue:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation TTRListBadgeView

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  [(TTRListBadgeView *)v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(TTRListBadgeView *)v11 hitTestInsets];
  double v22 = UIEdgeInsetsInsetRect(v13, v15, v17, v19, v20, v21);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  objc_msgSend(v9, sel_location);
  v34.x = v29;
  v34.y = v30;
  v35.origin.x = v22;
  v35.origin.y = v24;
  v35.size.width = v26;
  v35.size.height = v28;
  if (CGRectContainsPoint(v35, v34))
  {
    sub_1B90BFD68(0, &qword_1E9F06358);
    v31 = (void *)sub_1B996F730();
  }
  else
  {

    v31 = 0;
  }

  return v31;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)_s15RemindersUICore16TTRListBadgeViewC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0jG0C_So0J6RegionCtF_0();

  return v9;
}

- (_TtC15RemindersUICore16TTRListBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore16TTRListBadgeView *)TTRListBadgeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore16TTRListBadgeView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore16TTRListBadgeView *)TTRListBadgeView.init(coder:)(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListBadgeView();
  v2 = v3.receiver;
  [(TTRListBadgeView *)&v3 layoutSubviews];
  sub_1B989C41C();
  if (v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_layerColorsDirty] == 1)
  {
    v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_layerColorsDirty] = 0;
    sub_1B989BE70();
  }
}

- (void)tintColorDidChange
{
}

- (BOOL)ttrAccessibilityShouldIgnoreAccessibilityName
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreAccessibilityName;
  swift_beginAccess();
  return *v2;
}

- (void)setTtrAccessibilityShouldIgnoreAccessibilityName:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreAccessibilityName;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)ttrAccessibilityShouldIgnoreTintColorValue
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreTintColorValue;
  swift_beginAccess();
  return *v2;
}

- (void)setTtrAccessibilityShouldIgnoreTintColorValue:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreTintColorValue;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRListBadgeView();
  [(TTRListBadgeView *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B989D568(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1B989D568(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityValue.getter);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1B989D568(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityIdentifier.getter);
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  BOOL v3 = TTRListBadgeView.accessibilityUserInputLabels.getter();

  if (v3)
  {
    objc_super v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRListBadgeView();
  v2 = (char *)v8.receiver;
  unint64_t v3 = [(TTRListBadgeView *)&v8 accessibilityTraits];
  objc_super v4 = &v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selected];
  swift_beginAccess();
  if (*v4 == 1)
  {
    uint64_t v5 = *MEMORY[0x1E4FB2590];

    if ((v5 & ~v3) != 0) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v3 |= v6;
  }
  else
  {
  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  Swift::Bool v3 = TTRListBadgeView.accessibilityActivate()();

  return v3;
}

- (void).cxx_destruct
{
  sub_1B9110C84(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *((unsigned char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_imageParams));
  Swift::Bool v3 = *(CALayer **)((char *)&self->super._layerRetained
                   + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  objc_super v4 = *(NSArray **)((char *)&self->super._subviewCache
                   + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  uint64_t v5 = *(uint64_t *)((char *)&self->super._window + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  uint64_t v6 = *(NSArray **)((char *)&self->super._gestureRecognizers
                   + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  id v7 = *(UIViewController **)((char *)&self->super._viewDelegate
                            + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  sub_1B98A074C(*(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(unsigned int *)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams));
  sub_1B98A0784(v3, v4, v5, v6, v7);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selectionParams));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selectedLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_shadowLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiView));
  sub_1B91109DC(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_customSmartListActionViews), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_customSmartListActionViews));
  sub_1B98A0784(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings));
  sub_1B98A0784(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings));
  swift_bridgeObjectRelease();
  objc_super v8 = (char *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_accessibilityDelegate;

  sub_1B98A08A4((uint64_t)v8);
}

@end