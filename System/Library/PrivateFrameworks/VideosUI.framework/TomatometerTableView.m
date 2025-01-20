@interface TomatometerTableView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)accessibilityItemViews;
- (_TtC8VideosUI20TomatometerTableView)initWithCoder:(id)a3;
- (_TtC8VideosUI20TomatometerTableView)initWithFrame:(CGRect)a3;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)vuiBaselineHeight;
- (double)vui_baselineOffsetFromBottom;
- (void)vui_prepareForReuse;
@end

@implementation TomatometerTableView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  sub_1E316B5FC(a4, width);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E316C038();
}

- (NSArray)accessibilityItemViews
{
  v2 = self;
  v3 = sub_1E316C26C();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFAFA40);
    sub_1E387CC88();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (_TtC8VideosUI20TomatometerTableView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI20TomatometerTableView *)sub_1E316C4D4();
}

- (_TtC8VideosUI20TomatometerTableView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI20TomatometerTableView *)sub_1E316C548(a3);
}

- (void).cxx_destruct
{
}

- (double)vuiBaselineHeight
{
  v2 = self;
  sub_1E316C668();
  double v4 = v3;

  return v4;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v7 = a3;
  double v8 = self;
  sub_1E316C770((uint64_t)a3, a4);
  double v10 = v9;

  return v10;
}

- (double)vui_baselineOffsetFromBottom
{
  v2 = self;
  sub_1E316C948();
  double v4 = v3;

  return v4;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  double v4 = self;
  sub_1E316CA80(a3);
  double v6 = v5;

  return v6;
}

@end