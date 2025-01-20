@interface ToolbarButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (_TtC5Books13ToolbarButton)initWithCoder:(id)a3;
- (_TtC5Books13ToolbarButton)initWithFrame:(CGRect)a3;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)accessibilityContrastChanged;
- (void)didHover:(id)a3;
- (void)sendActionsForControlEvents:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setSelected:(BOOL)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ToolbarButton

- (_TtC5Books13ToolbarButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s5Books13ToolbarButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)sendActionsForControlEvents:(unint64_t)a3
{
  v4 = self;
  ToolbarButton.sendActions(for:)(a3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_10004A860(0, (unint64_t *)&qword_100B34360);
  sub_100588EE8();
  uint64_t v6 = sub_1007FE240();
  id v7 = a4;
  v8 = self;
  ToolbarButton.touchesEnded(_:with:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)accessibilityContrastChanged
{
  v2 = self;
  sub_100587600();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_100587824(a4);

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (BOOL)isEnabled
{
  return sub_1005884E0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ToolbarButton();
  id v4 = v7.receiver;
  [(ToolbarButton *)&v7 setEnabled:v3];
  if (objc_msgSend(v4, "isEnabled", v7.receiver, v7.super_class)) {
    id v5 = sub_1005882FC();
  }
  else {
    id v5 = [self tertiaryLabelColor];
  }
  id v6 = v5;
  [v4 setTitleColor:v5 forStates:0];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  char v4 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  v10.value.super.isa = (Class)a3;
  v10.is_nil = v4;
  ToolbarButton.setImage(_:for:)(v10, (UIControlState)v8);
}

- (void)didHover:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100587FD8(v4);
}

- (BOOL)isSelected
{
  return sub_1005884E0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  id v4 = self;
  ToolbarButton.isSelected.setter(a3);
}

- (BOOL)isHighlighted
{
  return sub_1005884E0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  ToolbarButton.isHighlighted.setter(a3);
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ToolbarButton();
  v2 = (char *)v10.receiver;
  [(ToolbarButton *)&v10 intrinsicContentSize];
  double v5 = v4;
  if (v3 > 28.0) {
    double v6 = v3;
  }
  else {
    double v6 = 28.0;
  }
  id v7 = &v2[OBJC_IVAR____TtC5Books13ToolbarButton_size];
  swift_beginAccess();
  LODWORD(v7) = *v7;

  double v8 = 32.0;
  if (!v7) {
    double v8 = 28.0;
  }
  if (v5 > v8) {
    double v8 = v5;
  }
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC5Books13ToolbarButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Books13ToolbarButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_hoverRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_symbolTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books13ToolbarButton_backgroundView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Books13ToolbarButton_highlightView);
}

@end