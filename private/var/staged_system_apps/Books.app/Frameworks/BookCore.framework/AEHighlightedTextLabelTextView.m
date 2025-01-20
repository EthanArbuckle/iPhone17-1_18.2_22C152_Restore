@interface AEHighlightedTextLabelTextView
- (AEHighlightedTextLabelTextView)initWithFrame:(CGRect)a3;
- (AEHighlightedTextLabelTextViewDelegate)delegate;
- (void)drawRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation AEHighlightedTextLabelTextView

- (AEHighlightedTextLabelTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AEHighlightedTextLabelTextView;
  v3 = -[AEHighlightedTextLabelTextView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AEHighlightedTextLabelTextView *)v3 setContentMode:3];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(id)objc_opt_class() areAnimationsEnabled];
  [(id)objc_opt_class() setAnimationsEnabled:0];
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabelTextView;
  -[AEHighlightedTextLabelTextView setFrame:](&v9, "setFrame:", x, y, width, height);
  [(id)objc_opt_class() setAnimationsEnabled:v8];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabelTextView;
  -[AEHighlightedTextLabelTextView drawRect:](&v9, "drawRect:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained drawLabelInRect:x, y, width, height];
}

- (AEHighlightedTextLabelTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AEHighlightedTextLabelTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end