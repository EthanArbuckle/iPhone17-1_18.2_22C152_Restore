@interface BrowsingAssistant.EntityCardCell
- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
@end

@implementation BrowsingAssistant.EntityCardCell

- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView) = 0;
  id v4 = a3;

  result = (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant14EntityCardCell *)sub_18C580CE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_s14EntityCardCellCMa();
  id v4 = a3;
  v5 = (char *)v11.receiver;
  id v6 = [(BrowsingAssistant.EntityCardCell *)&v11 preferredLayoutAttributesFittingAttributes:v4];
  objc_msgSend(v6, sel_size, v11.receiver, v11.super_class);
  double v8 = v7;
  v9 = *(void **)&v5[OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView];
  if (v9) {
    objc_msgSend(v9, sel_systemLayoutSizeFittingSize_, v7);
  }
  objc_msgSend(v6, sel_setSize_, v8);

  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14EntityCardCell_entityView));
}

@end