@interface PXSurveyQuestionTextConfiguration
- (BOOL)isStale;
- (CGRect)contentRectForOneUp;
- (NSString)questionText;
- (NSString)title;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionTextConfiguration)init;
- (PXSurveyQuestionTextConfiguration)initWithTitle:(id)a3 questionText:(id)a4 shouldScaleForLongText:(BOOL)a5;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionTextConfiguration

- (UIView)contentView
{
  questionLabel = self->_questionLabel;
  if (!questionLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_questionLabel;
    self->_questionLabel = v5;

    [(UILabel *)self->_questionLabel setTextAlignment:1];
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_questionLabel setTextColor:v7];

    v8 = [(PXSurveyQuestionTextConfiguration *)self questionText];
    [(UILabel *)self->_questionLabel setText:v8];

    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_questionLabel setBackgroundColor:v9];

    v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2928] addingSymbolicTraits:0 options:0];
    v11 = self->_questionLabel;
    if (self->_shouldScaleForLongText)
    {
      [(UILabel *)v11 setNumberOfLines:0];
      [(UILabel *)self->_questionLabel setAdjustsFontSizeToFitWidth:0];
      [(UILabel *)self->_questionLabel setLineBreakMode:0];
      double v12 = 26.0;
    }
    else
    {
      [(UILabel *)v11 setMinimumScaleFactor:0.75];
      [(UILabel *)self->_questionLabel setNumberOfLines:1];
      [(UILabel *)self->_questionLabel setAdjustsFontSizeToFitWidth:1];
      double v12 = 64.0;
    }
    v13 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v10 size:v12];
    [(UILabel *)self->_questionLabel setFont:v13];

    questionLabel = self->_questionLabel;
  }
  return (UIView *)questionLabel;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)questionText
{
  return self->_questionText;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionTextConfiguration)initWithTitle:(id)a3 questionText:(id)a4 shouldScaleForLongText:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSurveyQuestionTextConfiguration;
  v10 = [(PXSurveyQuestionTextConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    questionText = v10->_questionText;
    v10->_questionText = (NSString *)v13;

    v10->_isStale = 0;
    v10->_shouldScaleForLongText = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionText, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_questionLabel, 0);
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (CGRect)contentRectForOneUp
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (PXSurveyQuestionTextConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionTextConfiguration.m", 35, @"%s is not available as initializer", "-[PXSurveyQuestionTextConfiguration init]");

  abort();
}

@end