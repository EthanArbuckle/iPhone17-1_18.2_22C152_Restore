@interface VideosExtrasDetailTextCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (VideosExtrasDetailTextCell)initWithFrame:(CGRect)a3;
- (void)configureForTextElement:(id)a3 style:(id)a4;
- (void)dealloc;
@end

@implementation VideosExtrasDetailTextCell

- (VideosExtrasDetailTextCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasDetailTextCell;
  v3 = -[VideosExtrasDetailTextCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1930]) initForAutolayout];
    label = v3->_label;
    v3->_label = (UILabel *)v4;

    [(UILabel *)v3->_label MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:1];
    [(UILabel *)v3->_label setNumberOfLines:0];
    [(VideosExtrasDetailTextCell *)v3 addSubview:v3->_label];
    v6 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v3->_label, v3, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(VideosExtrasDetailTextCell *)v3 addConstraints:v6];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__dynamicTypeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasDetailTextCell;
  [(VideosExtrasDetailTextCell *)&v4 dealloc];
}

- (void)configureForTextElement:(id)a3 style:(id)a4
{
  v6 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v6 clearColor];
  [(VideosExtrasDetailTextCell *)self setBackgroundColor:v9];

  v10 = [MEMORY[0x1E4FB1618] clearColor];
  [(UILabel *)self->_label setBackgroundColor:v10];

  v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
  [(UILabel *)self->_label setTextColor:v11];

  id v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v7];
  [(UILabel *)self->_label configureForIKTextElement:v8 fontDescriptor:v12 textStyle:v7];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end