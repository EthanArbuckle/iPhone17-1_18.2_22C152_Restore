@interface EditingHeaderFooterTableView
- (_TtC5TeaUI28EditingHeaderFooterTableView)initWithCoder:(id)a3;
- (_TtC5TeaUI28EditingHeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation EditingHeaderFooterTableView

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  EditingHeaderFooterTableView.setEditing(_:animated:)(a3, a4);
}

- (_TtC5TeaUI28EditingHeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return (_TtC5TeaUI28EditingHeaderFooterTableView *)EditingHeaderFooterTableView.init(frame:style:)();
}

- (_TtC5TeaUI28EditingHeaderFooterTableView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI28EditingHeaderFooterTableView *)EditingHeaderFooterTableView.init(coder:)(a3);
}

@end