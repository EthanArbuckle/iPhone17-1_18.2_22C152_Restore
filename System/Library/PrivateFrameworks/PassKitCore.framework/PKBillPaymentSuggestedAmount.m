@interface PKBillPaymentSuggestedAmount
+ (id)roundingAmount:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)amount;
- (NSString)message;
- (NSString)title;
- (PKBillPaymentSuggestedAmount)initWithAmount:(id)a3 category:(unint64_t)a4;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)merchantCategory;
- (int64_t)priority;
- (unint64_t)category;
- (unint64_t)hash;
- (void)setAmount:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKBillPaymentSuggestedAmount

- (PKBillPaymentSuggestedAmount)initWithAmount:(id)a3 category:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBillPaymentSuggestedAmount;
  v7 = [(PKBillPaymentSuggestedAmount *)&v11 init];
  if (v7)
  {
    uint64_t v8 = +[PKBillPaymentSuggestedAmount roundingAmount:v6];
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    v7->_category = a4;
  }

  return v7;
}

+ (id)roundingAmount:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C30];
  id v4 = a3;
  v5 = [v3 decimalNumberHandlerWithRoundingMode:0 scale:2 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  id v6 = [v4 decimalNumberByRoundingAccordingToBehavior:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    amount = self->_amount;
    id v6 = (NSDecimalNumber *)v4[4];
    if (amount && v6) {
      char v7 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    }
    else {
      char v7 = amount == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  amount = self->_amount;
  id v4 = [a3 amount];
  int64_t v5 = [(NSDecimalNumber *)amount compare:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_message];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_category - v4 + 32 * v4;
  unint64_t v6 = self->_priority - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  uint64_t v4 = PKBillPaymentSuggestedAmountCategoryToString(self->_category);
  [v3 appendFormat:@"category: '%@'; ", v4];

  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"message: '%@'; ", self->_message];
  objc_msgSend(v3, "appendFormat:", @"priority: %ld; ", self->_priority);
  [v3 appendFormat:@">"];
  return v3;
}

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

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end