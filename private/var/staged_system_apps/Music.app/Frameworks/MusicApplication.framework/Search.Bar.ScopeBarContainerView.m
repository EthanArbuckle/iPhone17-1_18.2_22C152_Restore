@interface Search.Bar.ScopeBarContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)init;
- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithCoder:(id)a3;
- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation Search.Bar.ScopeBarContainerView

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)init
{
  return (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView *)sub_2C5B0C();
}

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2C804C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2C5DC8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_s3BarC21ScopeBarContainerViewCMa();
  id v4 = v8.receiver;
  id v5 = a3;
  [(Search.Bar.ScopeBarContainerView *)&v8 traitCollectionDidChange:v5];
  id v6 = [v4 traitCollection];
  id v7 = [v6 horizontalSizeClass];

  if (!v5 || v7 != [v5 horizontalSizeClass]) {
    [v4 setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_resultScopeBar);
  id v3 = self;
  [v2 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  [*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_sourceScopeBar) intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  if (v5 > v9) {
    double v12 = v5;
  }
  else {
    double v12 = v9;
  }
  double v13 = fmax(v7, 32.0);
  if (v13 <= v11) {
    double v13 = v11;
  }
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_2C624C(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (_TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_resultScopeBar));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCC16MusicApplication6Search3BarP33_27F18EE4A78475F0B90E1F3E8DDA223A21ScopeBarContainerView_sourceScopeBar);
}

@end