@interface PKPaymentSetupFieldBuiltInSubLocality
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInSubLocality)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInSubLocality

- (PKPaymentSetupFieldBuiltInSubLocality)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldBuiltInSubLocality;
  return [(PKPaymentSetupFieldText *)&v5 initWithIdentifier:@"subLocality" type:a4];
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end