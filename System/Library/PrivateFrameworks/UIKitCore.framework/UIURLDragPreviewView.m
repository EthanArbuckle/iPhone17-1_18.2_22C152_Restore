@interface UIURLDragPreviewView
+ (id)_titleFont;
+ (id)_urlFont;
+ (id)viewWithTitle:(id)a3 URL:(id)a4;
+ (id)viewWithTitle:(id)a3 URLText:(id)a4;
+ (id)viewWithURL:(id)a3;
+ (id)viewWithURLText:(id)a3;
+ (void)initialize;
- (NSString)title;
- (NSString)urlText;
- (NSURL)url;
- (UIURLDragPreviewView)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUrlText:(id)a3;
- (void)updateConstraints;
@end

@implementation UIURLDragPreviewView

+ (id)viewWithTitle:(id)a3 URL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTitle:v6];

  [v7 setUrl:v5];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
  return v7;
}

+ (id)viewWithURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setUrl:v3];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  return v4;
}

+ (id)viewWithTitle:(id)a3 URLText:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = objc_opt_new();
  [v7 setTitle:v6];

  [v7 setUrlText:v5];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
  return v7;
}

+ (id)viewWithURLText:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setUrlText:v3];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v4, "systemLayoutSizeFittingSize:", 10000.0, 10000.0);
  objc_msgSend(v4, "setFrame:", v5, v6, v7, v8);
  return v4;
}

+ (id)_titleFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:2 options:1];
  id v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (id)_urlFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:0 options:1];
  id v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (void)initialize
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!URLFormattingLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __URLFormattingLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E530A050;
    uint64_t v7 = 0;
    URLFormattingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!URLFormattingLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *URLFormattingLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UIURLDragPreviewView.m", 18, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v2 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v2);
}

- (UIURLDragPreviewView)initWithFrame:(CGRect)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)UIURLDragPreviewView;
  id v3 = -[UIView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v5;

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:4];
    uint64_t v7 = +[UIURLDragPreviewView _titleFont];
    [(UILabel *)v4->_titleLabel setFont:v7];

    uint64_t v8 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v8];

    [(UIView *)v4 addSubview:v4->_titleLabel];
    [(UIView *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = [(UIView *)v4->_titleLabel topAnchor];
    double v10 = [(UIView *)v4 topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    v12 = [(UIView *)v4->_titleLabel leadingAnchor];
    v13 = [(UIView *)v4 leadingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [(UIView *)v4->_titleLabel trailingAnchor];
    v16 = [(UIView *)v4 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    uint64_t v18 = objc_opt_new();
    urlLabel = v4->_urlLabel;
    v4->_urlLabel = (UILabel *)v18;

    [(UILabel *)v4->_urlLabel setNumberOfLines:1];
    [(UILabel *)v4->_urlLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v4->_urlLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_urlLabel setLineBreakMode:4];
    v20 = +[UIURLDragPreviewView _urlFont];
    [(UILabel *)v4->_urlLabel setFont:v20];

    v21 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_urlLabel setTextColor:v21];

    [(UIView *)v4 addSubview:v4->_urlLabel];
    [(UIView *)v4->_urlLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [(UIView *)v4->_urlLabel bottomAnchor];
    v23 = [(UIView *)v4 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    v25 = [(UIView *)v4->_urlLabel leadingAnchor];
    v26 = [(UIView *)v4 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(UIView *)v4->_urlLabel trailingAnchor];
    v29 = [(UIView *)v4 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [(UIView *)v4->_urlLabel topAnchor];
    v32 = [(UIView *)v4 topAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    v48[0] = v33;
    v34 = [(UIView *)v4->_titleLabel heightAnchor];
    v35 = [v34 constraintEqualToConstant:0.0];
    v48[1] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    urlOnlyConstraints = v4->_urlOnlyConstraints;
    v4->_urlOnlyConstraints = (NSArray *)v36;

    v38 = [(UIView *)v4->_urlLabel firstBaselineAnchor];
    v39 = [(UIView *)v4->_titleLabel lastBaselineAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:17.0];
    v47 = v40;
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    titleAndUrlConstraints = v4->_titleAndUrlConstraints;
    v4->_titleAndUrlConstraints = (NSArray *)v41;

    v43 = [(UIView *)v4 widthAnchor];
    v44 = [v43 constraintLessThanOrEqualToConstant:400.0];
    [v44 setActive:1];

    [(UIView *)v4 setNeedsUpdateConstraints];
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(UILabel *)self->_titleLabel setText:v4];
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSURL *)[v4 copy];
  url = self->_url;
  self->_url = v5;

  urlText = self->_urlText;
  self->_urlText = 0;

  uint64_t v8 = objc_msgSend(v4, "_lp_simplifiedDisplayString");

  [(UILabel *)self->_urlLabel setText:v8];
  double v9 = [(UILabel *)self->_urlLabel text];
  uint64_t v10 = [v9 length];

  if (!v10) {
    [(UILabel *)self->_urlLabel setText:&stru_1ED0E84C0];
  }
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)setUrlText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSString *)[v4 copy];
  urlText = self->_urlText;
  self->_urlText = v5;

  url = self->_url;
  self->_url = 0;

  [(UILabel *)self->_urlLabel setText:v4];
  uint64_t v8 = [(UILabel *)self->_urlLabel text];
  uint64_t v9 = [v8 length];

  if (!v9) {
    [(UILabel *)self->_urlLabel setText:&stru_1ED0E84C0];
  }
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v12.receiver = self;
  v12.super_class = (Class)UIURLDragPreviewView;
  [(UIView *)&v12 updateConstraints];
  id v3 = [(UILabel *)self->_titleLabel text];
  id v4 = [(UILabel *)self->_urlLabel text];
  if ([v3 isEqualToString:v4])
  {
  }
  else
  {
    uint64_t v5 = [(UILabel *)self->_titleLabel text];
    long long v6 = [(NSURL *)self->_url absoluteString];
    int v7 = [v5 isEqualToString:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  [(UILabel *)self->_titleLabel setText:0];
LABEL_5:
  uint64_t v8 = [(UILabel *)self->_titleLabel text];
  uint64_t v9 = [v8 length];

  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  if (v9) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 2;
  }
  [MEMORY[0x1E4F5B268] deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIURLDragPreviewView__titleLabel[v10])];
  [MEMORY[0x1E4F5B268] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIURLDragPreviewView__titleLabel[v11])];
  [(UIView *)self setNeedsLayout];
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)urlText
{
  return self->_urlText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndUrlConstraints, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end