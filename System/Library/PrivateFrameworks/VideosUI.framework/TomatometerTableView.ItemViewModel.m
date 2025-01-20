@interface TomatometerTableView.ItemViewModel
- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithCoder:(id)a3;
- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithFrame:(CGRect)a3;
@end

@implementation TomatometerTableView.ItemViewModel

- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI20TomatometerTableView13ItemViewModel *)sub_1E316AF78();
}

- (_TtCC8VideosUI20TomatometerTableView13ItemViewModel)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI20TomatometerTableView13ItemViewModel *)sub_1E316B01C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI20TomatometerTableView13ItemViewModel_headerLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI20TomatometerTableView13ItemViewModel_textLabel);
}

@end