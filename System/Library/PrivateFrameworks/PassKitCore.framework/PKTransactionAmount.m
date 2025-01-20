@interface PKTransactionAmount
- (id)initWithTransientCurrencyAmount:(id)a3;
@end

@implementation PKTransactionAmount

- (id)initWithTransientCurrencyAmount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKTransactionAmount;
  v5 = [(PKTransactionAmount *)&v10 init];
  if (v5)
  {
    v6 = [v4 unitIdentifier];
    [(PKTransactionAmount *)v5 setUnitIdentifier:v6];

    v7 = [v4 currencyAmount];
    [(PKTransactionAmount *)v5 setAmount:v7];

    v8 = [v4 label];
    [(PKTransactionAmount *)v5 setLabel:v8];

    -[PKTransactionAmount setPending:](v5, "setPending:", [v4 pending]);
  }

  return v5;
}

@end