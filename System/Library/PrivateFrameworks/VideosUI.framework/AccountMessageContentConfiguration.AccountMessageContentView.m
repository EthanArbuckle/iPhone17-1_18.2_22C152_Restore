@interface AccountMessageContentConfiguration.AccountMessageContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithCoder:(id)a3;
- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AccountMessageContentConfiguration.AccountMessageContentView

- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31F6C00();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1E31F6C88(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E31F6DCC();
}

- (_TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView_configuration);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI34AccountMessageContentConfiguration25AccountMessageContentView_accountMessageView);
}

@end