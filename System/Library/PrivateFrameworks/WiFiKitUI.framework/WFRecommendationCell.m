@interface WFRecommendationCell
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (void)setDescriptionLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation WFRecommendationCell

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionLabel);
  return (UILabel *)WeakRetained;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
}

@end