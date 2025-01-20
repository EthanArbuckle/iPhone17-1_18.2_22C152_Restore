@interface AttributeStylingButton
- (BOOL)isSelected;
- (_TtC8PaperKit22AttributeStylingButton)initWithCoder:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (void)setSelected:(BOOL)a3;
@end

@implementation AttributeStylingButton

- (_TtC8PaperKit22AttributeStylingButton)initWithCoder:(id)a3
{
  result = (_TtC8PaperKit22AttributeStylingButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v8 = one-time initialization token for spacing;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  if (v8 != -1) {
    swift_once();
  }
  CGFloat v13 = -*(double *)&static AttributeStylingButton.spacing;
  objc_msgSend(v11, sel_rect);
  CGRectInset(v17, v13, v13);
  type metadata accessor for UIPointerRegion();
  v14 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v14;
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(AttributeStylingControl *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(AttributeStylingControl *)&v5 setSelected:v3];
  AttributeStylingButton.isSelected.didset();
}

@end