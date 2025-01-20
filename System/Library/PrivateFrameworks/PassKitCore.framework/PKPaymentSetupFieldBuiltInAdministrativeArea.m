@interface PKPaymentSetupFieldBuiltInAdministrativeArea
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInAdministrativeArea)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInAdministrativeArea

- (PKPaymentSetupFieldBuiltInAdministrativeArea)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldBuiltInAdministrativeArea;
  return [(PKPaymentSetupFieldText *)&v5 initWithIdentifier:@"administrativeArea" type:a4];
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end