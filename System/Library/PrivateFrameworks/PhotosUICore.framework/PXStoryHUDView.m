@interface PXStoryHUDView
- (CGRect)clippingRect;
- (PXStoryHUDView)initWithFrame:(CGRect)a3;
- (PXStoryHUDViewConfiguration)userData;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXStoryHUDView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (PXStoryHUDViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v4 = (PXStoryHUDViewConfiguration *)[a3 copy];
  userData = self->_userData;
  self->_userData = v4;

  [(PXStoryHUDView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v56[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryHUDView *)self userData];
  [v3 textRelativePosition];
  double v5 = v4;
  double v7 = v6;
  [v3 textInsets];
  double v9 = v8;
  double v11 = v10;
  v12 = [v3 tintColor];
  [v3 borderWidth];
  double v14 = v13;
  v15 = [(PXStoryHUDView *)self layer];
  [v15 setBorderWidth:v14];
  id v16 = v12;
  objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));
  [v15 setZPosition:10000.0];
  [(PXStoryHUDView *)self bounds];
  CGRect v58 = CGRectInset(v57, v9 + v14, v11 + v14);
  double x = v58.origin.x;
  double y = v58.origin.y;
  double width = v58.size.width;
  double height = v58.size.height;
  v51 = [(PXStoryHUDView *)self titleLabel];
  v52 = [(PXStoryHUDView *)self bodyLabel];
  id v21 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  v22 = v21;
  uint64_t v23 = 2;
  if (v5 <= 0.75) {
    uint64_t v23 = 1;
  }
  if (v5 >= 0.25) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  [v21 setAlignment:v24];
  [v22 setLineBreakMode:0];
  v25 = (void *)MEMORY[0x1E4FB08E0];
  [v3 fontSize];
  uint64_t v26 = objc_msgSend(v25, "monospacedSystemFontOfSize:weight:");
  uint64_t v27 = *MEMORY[0x1E4FB0700];
  v55[0] = *MEMORY[0x1E4FB0700];
  v28 = v16;
  if (!v16)
  {
    v28 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v56[0] = v28;
  uint64_t v29 = *MEMORY[0x1E4FB06C0];
  v55[1] = *MEMORY[0x1E4FB06C0];
  v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
  uint64_t v31 = *MEMORY[0x1E4FB06F8];
  v56[1] = v30;
  v56[2] = v26;
  uint64_t v32 = *MEMORY[0x1E4FB0738];
  v55[2] = v31;
  v55[3] = v32;
  v56[3] = v22;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];

  if (!v16) {
  id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
  }
  uint64_t v35 = [v3 text];
  v36 = (void *)v35;
  if (v35) {
    v37 = (__CFString *)v35;
  }
  else {
    v37 = &stru_1F00B0030;
  }
  v38 = (void *)[v34 initWithString:v37 attributes:v33];
  [v52 setAttributedText:v38];

  v39 = (void *)MEMORY[0x1E4FB08E0];
  [v3 fontSize];
  v41 = [v39 monospacedSystemFontOfSize:v40 + 2.0 weight:*MEMORY[0x1E4FB09A8]];
  v53[0] = v27;
  v42 = v16;
  if (!v16)
  {
    v42 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v54[0] = v42;
  v53[1] = v29;
  v43 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
  v54[1] = v43;
  v54[2] = v41;
  v53[2] = v31;
  v53[3] = v32;
  v54[3] = v22;
  uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];

  if (!v16) {
  id v45 = objc_alloc(MEMORY[0x1E4F28B18]);
  }
  uint64_t v46 = [v3 title];
  v47 = (void *)v46;
  if (v46) {
    v48 = (__CFString *)v46;
  }
  else {
    v48 = &stru_1F00B0030;
  }
  v49 = (void *)[v45 initWithString:v48 attributes:v44];
  [v51 setAttributedText:v49];

  [v41 lineHeight];
  objc_msgSend(v51, "setFrame:", x + v5 * (width - width), y + v7 * (height - v50), width, v50);
  PXEdgeInsetsMake();
}

- (PXStoryHUDView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryHUDView;
  v3 = -[PXStoryHUDView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setOpaque:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(PXStoryHUDView *)v3 addSubview:v3->_titleLabel];
    double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v6;

    [(UILabel *)v3->_bodyLabel setOpaque:0];
    [(UILabel *)v3->_bodyLabel setNumberOfLines:0];
    [(PXStoryHUDView *)v3 addSubview:v3->_bodyLabel];
    [(PXStoryHUDView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

@end