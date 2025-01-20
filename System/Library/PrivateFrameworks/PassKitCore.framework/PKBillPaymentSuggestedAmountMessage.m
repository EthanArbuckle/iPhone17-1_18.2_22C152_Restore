@interface PKBillPaymentSuggestedAmountMessage
- (NSString)message;
- (NSString)title;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKBillPaymentSuggestedAmountMessage

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end