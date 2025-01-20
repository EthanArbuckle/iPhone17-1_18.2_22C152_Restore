@interface TabOverviewDisplayItem.SelectionCountIndicatorView
- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithFrame:(CGRect)a3;
@end

@implementation TabOverviewDisplayItem.SelectionCountIndicatorView

- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_selectionCount) = 0;
  uint64_t v8 = OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_label;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)_s14descr1ED9F2989C27SelectionCountIndicatorViewCMa();
  v11 = -[TabOverviewDisplayItem.SelectionCountIndicatorView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_18C5B8F78();

  return v11;
}

- (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView *)sub_18C5B8E98(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari22TabOverviewDisplayItem27SelectionCountIndicatorView_label));
}

@end