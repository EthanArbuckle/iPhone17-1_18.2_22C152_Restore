@interface FlowcaseViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI16FlowcaseViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI16FlowcaseViewCell)initWithFrame:(CGRect)a3;
- (void)onImageDidLoad:(id)a3;
- (void)vui_cellDidEndDisplaying;
- (void)vui_cellWillBeDisplayed;
- (void)vui_prepareForReuse;
@end

@implementation FlowcaseViewCell

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E34B82E8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E34B84D4(a4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)onImageDidLoad:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_6();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  double v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  double v10 = self;
  sub_1E34B88D8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

- (_TtC8VideosUI16FlowcaseViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI16FlowcaseViewCell *)sub_1E34BA2E8();
}

- (_TtC8VideosUI16FlowcaseViewCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI16FlowcaseViewCell *)sub_1E34BA384(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16FlowcaseViewCell_backgroundMediaController));
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_19_90((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI16FlowcaseViewCell_imageViewContext));
  swift_release();
  swift_release();
  swift_release();
}

- (void)vui_cellWillBeDisplayed
{
  v2 = self;
  sub_1E34BABBC();
}

- (void)vui_cellDidEndDisplaying
{
  v2 = self;
  sub_1E34BAE20();
}

@end