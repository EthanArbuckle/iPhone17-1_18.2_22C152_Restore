@interface PKAccountScheduledTransfer
+ (BOOL)supportsSecureCoding;
- (PKAccountScheduledTransfer)init;
- (PKAccountScheduledTransfer)initWithCoder:(id)a3;
- (PKAccountScheduledTransfer)initWithCurrencyAmount:(id)a3 type:(unint64_t)a4 externalAccount:(id)a5;
- (PKAccountTransferExternalAccount)externalAccount;
- (PKCurrencyAmount)currencyAmount;
- (id)hashComponent;
- (id)jsonDictionaryRepresentation;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setExternalAccount:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountScheduledTransfer

- (PKAccountScheduledTransfer)init
{
  return [(PKAccountScheduledTransfer *)self initWithCurrencyAmount:0 type:0 externalAccount:0];
}

- (PKAccountScheduledTransfer)initWithCurrencyAmount:(id)a3 type:(unint64_t)a4 externalAccount:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountScheduledTransfer;
  v11 = [(PKAccountScheduledTransfer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currencyAmount, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_externalAccount, a5);
  }

  return v12;
}

- (id)jsonDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(PKCurrencyAmount *)self->_currencyAmount amount];
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "pk_isNotANumber") & 1) == 0)
  {
    v7 = [v6 stringValue];
    [v4 setObject:v7 forKeyedSubscript:@"amount"];

    v8 = [(PKCurrencyAmount *)self->_currencyAmount currency];
    [v4 setObject:v8 forKeyedSubscript:@"currencyCode"];
  }
  id v9 = [(PKAccountPaymentFundingSource *)self->_externalAccount jsonDictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"transferDetails"];
  [v3 setObject:v9 forKeyedSubscript:@"externalAccount"];
  id v10 = PKAccountTransferTypeToString(self->_type);
  [v3 setObject:v10 forKeyedSubscript:@"type"];

  v11 = (void *)[v3 copy];
  return v11;
}

- (id)hashComponent
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(PKAccountTransferExternalAccount *)self->_externalAccount hashComponent];
  if (v4) {
    [v3 appendString:v4];
  }
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    v6 = [(PKCurrencyAmount *)currencyAmount amount];
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "pk_isNotANumber") & 1) == 0)
    {
      v8 = [v7 stringValue];
      [v3 appendString:v8];

      id v9 = [(PKCurrencyAmount *)self->_currencyAmount currency];
      [v3 appendString:v9];
    }
  }
  id v10 = PKAccountTransferTypeToString(self->_type);
  [v3 appendString:v10];

  v11 = (void *)[v3 copy];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountScheduledTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledTransfer;
  v5 = [(PKAccountScheduledTransfer *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalAccount"];
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v8;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  currencyAmount = self->_currencyAmount;
  id v5 = a3;
  [v5 encodeObject:currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_externalAccount forKey:@"externalAccount"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKAccountTransferExternalAccount)externalAccount
{
  return self->_externalAccount;
}

- (void)setExternalAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAccount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end