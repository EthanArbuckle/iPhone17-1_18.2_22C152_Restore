@interface PXSurveyQuestionDefaultConfiguration
- (BOOL)isStale;
- (CGRect)contentRectForOneUp;
- (NSString)title;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionDefaultConfiguration)init;
- (PXSurveyQuestionDefaultConfiguration)initWithTitle:(id)a3;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionDefaultConfiguration

- (UIView)contentView
{
  placeholderView = self->_placeholderView;
  if (!placeholderView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v5 = self->_placeholderView;
    self->_placeholderView = v4;

    v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)self->_placeholderView setBackgroundColor:v6];

    placeholderView = self->_placeholderView;
  }
  return placeholderView;
}

- (PXSurveyQuestionDefaultConfiguration)initWithTitle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSurveyQuestionDefaultConfiguration;
  v5 = [(PXSurveyQuestionDefaultConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_isStale = 0;
  }

  return v5;
}

- (PXSurveyQuestionDefaultConfiguration)init
{
  return [(PXSurveyQuestionDefaultConfiguration *)self initWithTitle:&stru_1F00B0030];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (NSString)title
{
  return self->_title;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
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

@end