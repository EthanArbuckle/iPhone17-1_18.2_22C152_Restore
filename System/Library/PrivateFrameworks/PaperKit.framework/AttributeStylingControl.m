@interface AttributeStylingControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (_TtC8PaperKit23AttributeStylingControl)initWithCoder:(id)a3;
- (_TtC8PaperKit23AttributeStylingControl)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AttributeStylingControl

- (_TtC8PaperKit23AttributeStylingControl)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized AttributeStylingControl.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  AttributeStylingControl.layoutSubviews()();
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  AttributeStylingControl.addTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  AttributeStylingControl.removeTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (BOOL)isSelected
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentStackView);
  double v3 = *MEMORY[0x263F83810];
  double v4 = *(double *)(MEMORY[0x263F83810] + 8);
  v5 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  double v7 = *(double *)((char *)&v5->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);
  double v8 = v6
     + *(double *)((char *)&v5->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets)
     + *(double *)((char *)&v5->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);
  double v10 = v9
      + *(double *)((char *)&v5->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);

  double v11 = v10 + v7;
  double v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AttributeStylingControl();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AttributeStylingControl *)&v6 traitCollectionDidChange:v4];
  AttributeStylingControl.updateUI()();
}

- (_TtC8PaperKit23AttributeStylingControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8PaperKit23AttributeStylingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_titleLabelFont));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_font));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_image);
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  double v10 = self;
  if (![(AttributeStylingControl *)v10 isSelected])
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v14[4] = partial apply for closure #1 in AttributeStylingControl.pointerInteraction(_:willEnter:animator:);
    v14[5] = v11;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v14[3] = &block_descriptor_19_0;
    double v12 = _Block_copy(v14);
    id v13 = v8;
    swift_release();
    objc_msgSend(a5, sel_addAnimations_, v12);
    _Block_release(v12);
  }
  swift_unknownObjectRelease();
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = self;
  v16[4] = partial apply for closure #1 in AttributeStylingControl.pointerInteraction(_:willExit:animator:);
  v16[5] = v9;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v16[3] = &block_descriptor_22;
  double v10 = _Block_copy(v16);
  id v11 = a3;
  double v12 = self;
  id v13 = v11;
  v14 = v12;
  id v15 = a4;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a5, sel_addAnimations_, v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = objc_msgSend(self, sel_systemPointerStyle);
  return v4;
}

@end