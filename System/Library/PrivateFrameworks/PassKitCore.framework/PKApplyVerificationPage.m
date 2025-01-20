@interface PKApplyVerificationPage
- (PKApplyVerificationPage)initWithDictionary:(id)a3 type:(unint64_t)a4 codeLength:(unint64_t)a5 fieldOptions:(id)a6;
- (PKApplyVerificationPage)initWithDictonary:(id)a3;
- (unint64_t)verificationCodeLength;
- (unint64_t)verificationType;
@end

@implementation PKApplyVerificationPage

- (PKApplyVerificationPage)initWithDictonary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"verificationType"];
  uint64_t v6 = PKApplyVerificationTypeFromString(v5);

  v7 = -[PKApplyVerificationPage initWithDictionary:type:codeLength:fieldOptions:](self, "initWithDictionary:type:codeLength:fieldOptions:", v4, v6, [v4 PKIntegerForKey:@"verificationCodeLength"], 0);
  return v7;
}

- (PKApplyVerificationPage)initWithDictionary:(id)a3 type:(unint64_t)a4 codeLength:(unint64_t)a5 fieldOptions:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a4)
  {
    if (a4 != 1 || a5)
    {
      v14.receiver = self;
      v14.super_class = (Class)PKApplyVerificationPage;
      v12 = [(PKDynamicProvisioningFieldsPageContent *)&v14 initWithDictionary:v10 fieldOptions:v11 businessChatIdentifier:0];
      if (v12)
      {
        v12->_verificationType = a4;
        v12->_verificationCodeLength = a5;
      }
      self = v12;
      a5 = (unint64_t)self;
    }
  }
  else
  {
    a5 = 0;
  }

  return (PKApplyVerificationPage *)a5;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (unint64_t)verificationCodeLength
{
  return self->_verificationCodeLength;
}

@end