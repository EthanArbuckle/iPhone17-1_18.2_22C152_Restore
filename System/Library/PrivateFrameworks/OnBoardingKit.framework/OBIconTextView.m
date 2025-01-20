@interface OBIconTextView
- (CGSize)iconSize;
- (OBIconTextView)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6;
- (UIImageView)iconView;
- (UITextView)textView;
- (double)baselineFromBoundsTop;
- (double)padding;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)setIconSize:(CGSize)a3;
- (void)setIconView:(id)a3;
- (void)setPadding:(double)a3;
- (void)setTextView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateFont;
@end

@implementation OBIconTextView

- (OBIconTextView)initWithIcon:(id)a3 iconSize:(CGSize)a4 text:(id)a5 dataDetectorTypes:(unint64_t)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a3;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)OBIconTextView;
  v13 = [(OBIconTextView *)&v25 init];
  v14 = v13;
  if (v13)
  {
    v13->_iconSize.CGFloat width = width;
    v13->_iconSize.CGFloat height = height;
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
    iconView = v14->_iconView;
    v14->_iconView = (UIImageView *)v15;

    [(UIImageView *)v14->_iconView setContentMode:2];
    [(UIImageView *)v14->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(OBIconTextView *)v14 addSubview:v14->_iconView];
    id v17 = objc_alloc(MEMORY[0x1E4FB1DD8]);
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textView = v14->_textView;
    v14->_textView = (UITextView *)v18;

    [(UITextView *)v14->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v14->_textView setDataDetectorTypes:a6];
    [(UITextView *)v14->_textView setEditable:0];
    [(UITextView *)v14->_textView setSelectable:1];
    [(UITextView *)v14->_textView setScrollEnabled:0];
    v20 = v14->_textView;
    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v20 setBackgroundColor:v21];

    v22 = v14->_textView;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v22 setTextColor:v23];

    if (v12) {
      [(UITextView *)v14->_textView setText:v12];
    }
    [(OBIconTextView *)v14 updateFont];
    [(OBIconTextView *)v14 addSubview:v14->_textView];
  }

  return v14;
}

- (id)viewForFirstBaselineLayout
{
  return self->_textView;
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (void)updateConstraints
{
  v31[1] = *MEMORY[0x1E4F143B8];
  v3 = [(OBIconTextView *)self constraints];
  [(OBIconTextView *)self removeConstraints:v3];

  v29.receiver = self;
  v29.super_class = (Class)OBIconTextView;
  [(OBIconTextView *)&v29 updateConstraints];
  v4 = (void *)MEMORY[0x1E4F28DC8];
  v30 = @"padding";
  v5 = [NSNumber numberWithDouble:self->_padding];
  v31[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v7 = _NSDictionaryOfVariableBindings(&cfstr_IconviewTextvi.isa, self->_iconView, self->_textView, 0);
  v8 = [v4 constraintsWithVisualFormat:@"|[_iconView]-(padding)-[_textView]|" options:0 metrics:v6 views:v7];
  [v4 activateConstraints:v8];

  v9 = [(UITextView *)self->_textView heightAnchor];
  v10 = [(OBIconTextView *)self heightAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [(UITextView *)self->_textView topAnchor];
  v13 = [(OBIconTextView *)self topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  uint64_t v15 = [(UIImageView *)self->_iconView centerYAnchor];
  v16 = [(UITextView *)self->_textView firstBaselineAnchor];
  id v17 = [(UITextView *)self->_textView font];
  [v17 capHeight];
  v19 = [v15 constraintEqualToAnchor:v16 constant:v18 * -0.5];
  [v19 setActive:1];

  [(OBIconTextView *)self iconSize];
  if (v21 != *MEMORY[0x1E4F1DB30] || v20 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v22 = [(UIImageView *)self->_iconView heightAnchor];
    [(OBIconTextView *)self iconSize];
    v24 = [v22 constraintEqualToConstant:v23];

    LODWORD(v25) = 1148846080;
    [v24 setPriority:v25];
    [v24 setActive:1];
    v26 = [(UIImageView *)self->_iconView widthAnchor];
    [(OBIconTextView *)self iconSize];
    v27 = objc_msgSend(v26, "constraintEqualToConstant:");

    LODWORD(v28) = 1148846080;
    [v27 setPriority:v28];
    [v27 setActive:1];
  }
}

- (void)updateFont
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UITextView *)self->_textView setFont:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBIconTextView;
  [(OBIconTextView *)&v4 traitCollectionDidChange:a3];
  [(OBIconTextView *)self updateFont];
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)baselineFromBoundsTop
{
  return self->_baselineFromBoundsTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end