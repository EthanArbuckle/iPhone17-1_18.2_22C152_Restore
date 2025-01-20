@interface PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end