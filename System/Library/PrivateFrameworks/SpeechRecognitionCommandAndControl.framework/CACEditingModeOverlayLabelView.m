@interface CACEditingModeOverlayLabelView
- (CACEditingModeOverlayLabelView)initWithFrame:(CGRect)a3;
- (NSString)label;
- (void)setLabel:(id)a3;
@end

@implementation CACEditingModeOverlayLabelView

- (CACEditingModeOverlayLabelView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v16.receiver = self;
  v16.super_class = (Class)CACEditingModeOverlayLabelView;
  v5 = -[CACEditingModeOverlayLabelView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, width, height);
  labelView = v5->_labelView;
  v5->_labelView = (UILabel *)v6;

  [(UILabel *)v5->_labelView setTextAlignment:1];
  v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v5->_labelView setTextColor:v8];

  [(CACEditingModeOverlayLabelView *)v5 addSubview:v5->_labelView];
  v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [(CACEditingModeOverlayLabelView *)v5 setBackgroundColor:v9];

  id v10 = [MEMORY[0x263F825C8] blackColor];
  uint64_t v11 = [v10 CGColor];
  v12 = [(CACEditingModeOverlayLabelView *)v5 layer];
  [v12 setBorderColor:v11];

  v13 = [(CACEditingModeOverlayLabelView *)v5 layer];
  [v13 setBorderWidth:1.0];

  v14 = [(CACEditingModeOverlayLabelView *)v5 layer];
  [v14 setCornerRadius:8.0];

  return v5;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  [(UILabel *)self->_labelView setText:v5];
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end