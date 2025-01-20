@interface _UIIntelligenceButton.FillView
- (_TtCC5UIKit21_UIIntelligenceButton8FillView)initWithCoder:(id)a3;
- (_TtCC5UIKit21_UIIntelligenceButton8FillView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _UIIntelligenceButton.FillView

- (_TtCC5UIKit21_UIIntelligenceButton8FillView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185A86AC8();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UIIntelligenceButton.FillView();
  v2 = (char *)v5.receiver;
  [(UIView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtCC5UIKit21_UIIntelligenceButton8FillView_staticLightView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtCC5UIKit21_UIIntelligenceButton8FillView_livingLightView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (_TtCC5UIKit21_UIIntelligenceButton8FillView)initWithFrame:(CGRect)a3
{
  result = (_TtCC5UIKit21_UIIntelligenceButton8FillView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit21_UIIntelligenceButton8FillView_livingLightView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit21_UIIntelligenceButton8FillView_staticLightView);
}

@end