@interface PKPaymentShippingAddressDataItem
+ (int64_t)dataType;
- (BOOL)hasShippingAddress;
- (BOOL)isClientError:(id)a3;
- (BOOL)isShippingEditable;
- (BOOL)isShippingServiceableWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3;
- (CNContact)shippingAddress;
- (NSAttributedString)formattedAddressString;
- (NSString)shippingType;
- (id)_shippingName;
- (id)createIncompleteShippingAddressError;
- (id)createRequiredShippingAddressError;
- (id)createShippingAddressErrorFromError:(id)a3;
- (id)createShippingAddressErrorWithDescription:(id)a3 failureReason:(id)a4;
- (id)createUnavailableShippingAddressError;
- (id)errors;
- (id)firstModelError;
- (id)incompleteShippingAddressErrorDescription;
- (id)incompleteShippingAddressErrorFailureReason;
- (id)paymentContactFormatErrors;
- (id)requiredShippingAddressErrorDescription;
- (id)requiredShippingAddressErrorFailureReason;
- (id)unavailableShippingAddressErrorDescription;
- (id)unavailableShippingAddressErrorFailureReason;
- (id)validate;
- (int64_t)context;
- (unint64_t)rawShippingType;
@end

@implementation PKPaymentShippingAddressDataItem

+ (int64_t)dataType
{
  return 5;
}

- (int64_t)context
{
  return 3;
}

- (id)_shippingName
{
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [v3 shippingAddress];

  v5 = [(PKPaymentDataItem *)self model];
  v6 = [v5 paymentRequest];
  v7 = [v6 requiredShippingContactFields];
  int v8 = [v7 containsObject:@"phoneticName"];

  if (v8) {
    [v4 pkFullAndPhoneticName];
  }
  else {
  v9 = [v4 pkFullName];
  }

  return v9;
}

- (NSAttributedString)formattedAddressString
{
  v3 = [(PKPaymentDataItem *)self model];
  v4 = [v3 paymentRequest];
  v5 = [v4 requiredShippingContactFields];
  uint64_t v6 = [v5 containsObject:@"phoneticName"];

  v7 = [(PKPaymentShippingAddressDataItem *)self shippingAddress];
  int v8 = [v7 pkFormattedContactAddressIncludingPhoneticName:v6];
  v9 = objc_msgSend(v8, "pk_uppercaseAttributedString");

  return (NSAttributedString *)v9;
}

- (CNContact)shippingAddress
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 shippingAddress];

  return (CNContact *)v3;
}

- (BOOL)hasShippingAddress
{
  v2 = [(PKPaymentShippingAddressDataItem *)self shippingAddress];
  v3 = [v2 postalAddresses];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSString)shippingType
{
  v2 = [(PKPaymentDataItem *)self model];
  v3 = [v2 shippingType];

  return (NSString *)v3;
}

- (id)errors
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"post";
  v9[1] = @"name";
  v9[2] = @"phoneticName";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v5 = [(PKPaymentDataItem *)self model];
  uint64_t v6 = [v5 paymentErrors];
  v7 = objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (id)paymentContactFormatErrors
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C978];
  v9[0] = @"post";
  v9[1] = @"name";
  v9[2] = @"phoneticName";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  v5 = [(PKPaymentDataItem *)self model];
  uint64_t v6 = [v5 paymentContactFormatErrors];
  v7 = objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);

  return v7;
}

- (BOOL)isShippingEditable
{
  v2 = [(PKPaymentDataItem *)self model];
  char v3 = [v2 isShippingEditable];

  return v3;
}

- (BOOL)isShippingServiceableWithError:(id *)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v5 = [(PKPaymentShippingAddressDataItem *)self errors];
  uint64_t v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_276);

  if (a3 && v6)
  {
    BOOL v7 = [(PKPaymentShippingAddressDataItem *)self hasShippingAddress];
    int v8 = (void *)MEMORY[0x1E4F28C58];
    v13[0] = *MEMORY[0x1E4F28568];
    v9 = [v6 localizedDescription];
    v13[1] = @"PKPaymentErrorIsFieldEmpty";
    v14[0] = v9;
    v10 = [NSNumber numberWithInt:!v7];
    v14[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    *a3 = [v8 errorWithDomain:@"PKPassKitErrorDomain" code:-3003 userInfo:v11];
  }
  return v6 == 0;
}

BOOL __67__PKPaymentShippingAddressDataItem_isShippingServiceableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 domain];
  if ([v3 isEqualToString:@"PKPaymentErrorDomain"]) {
    BOOL v4 = [v2 code] == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  BOOL v4 = [(PKPaymentShippingAddressDataItem *)self validate];
  v5 = v4;
  if (a3 && v4) {
    *a3 = v4;
  }

  return v5 == 0;
}

- (id)validate
{
  if (![(PKPaymentShippingAddressDataItem *)self isShippingEditable])
  {
    v5 = 0;
    goto LABEL_11;
  }
  char v3 = [(PKPaymentShippingAddressDataItem *)self firstModelError];
  if (v3)
  {
    uint64_t v4 = [(PKPaymentShippingAddressDataItem *)self createShippingAddressErrorFromError:v3];
  }
  else if ([(PKPaymentShippingAddressDataItem *)self hasShippingAddress])
  {
    if (![(PKPaymentDataItem *)self isRejected])
    {
      v5 = 0;
      goto LABEL_10;
    }
    uint64_t v4 = [(PKPaymentShippingAddressDataItem *)self createIncompleteShippingAddressError];
  }
  else
  {
    uint64_t v4 = [(PKPaymentShippingAddressDataItem *)self createRequiredShippingAddressError];
  }
  v5 = (void *)v4;
LABEL_10:

LABEL_11:
  return v5;
}

- (id)firstModelError
{
  char v3 = [(PKPaymentShippingAddressDataItem *)self errors];
  uint64_t v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    BOOL v7 = [(PKPaymentShippingAddressDataItem *)self paymentContactFormatErrors];
    id v6 = [v7 firstObject];
  }
  return v6;
}

- (unint64_t)rawShippingType
{
  id v2 = [(PKPaymentDataItem *)self model];
  char v3 = [v2 paymentRequest];
  unint64_t v4 = [v3 shippingType];

  return v4;
}

- (id)createShippingAddressErrorFromError:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F28568]];

  if (-[PKPaymentShippingAddressDataItem isClientError:](self, "isClientError:", v4) && [v6 length])
  {
    BOOL v7 = [(PKPaymentShippingAddressDataItem *)self incompleteShippingAddressErrorDescription];
    uint64_t v8 = [(PKPaymentShippingAddressDataItem *)self createShippingAddressErrorWithDescription:v7 failureReason:v6];
LABEL_17:
    v15 = (void *)v8;
    goto LABEL_18;
  }
  v9 = [v4 userInfo];
  BOOL v7 = [v9 objectForKey:@"PKPaymentErrorContactField"];

  if ([v7 isEqualToString:@"name"])
  {
    v10 = [(PKPaymentDataItem *)self model];
    v11 = [v10 shippingAddress];
    uint64_t v12 = [v11 pkFullName];
  }
  else
  {
    if (![v7 isEqualToString:@"phoneticName"])
    {
      if ([v4 code] == 1) {
        [(PKPaymentShippingAddressDataItem *)self createIncompleteShippingAddressError];
      }
      else {
      uint64_t v8 = [(PKPaymentShippingAddressDataItem *)self createUnavailableShippingAddressError];
      }
      goto LABEL_17;
    }
    v10 = [(PKPaymentDataItem *)self model];
    v11 = [v10 shippingAddress];
    uint64_t v12 = [v11 pkPhoneticName];
  }
  v13 = (void *)v12;

  if (v13 && [v13 length])
  {
    uint64_t v14 = [(PKPaymentShippingAddressDataItem *)self createIncompleteShippingAddressError];
  }
  else
  {
    uint64_t v14 = [(PKPaymentShippingAddressDataItem *)self createRequiredShippingAddressError];
  }
  v15 = (void *)v14;

LABEL_18:
  return v15;
}

- (BOOL)isClientError:(id)a3
{
  char v3 = [a3 userInfo];
  char v4 = [v3 PKBoolForKey:@"PKPaymentErrorIsFromClient"];

  return v4;
}

- (id)createRequiredShippingAddressError
{
  char v3 = [(PKPaymentShippingAddressDataItem *)self requiredShippingAddressErrorDescription];
  char v4 = [(PKPaymentShippingAddressDataItem *)self requiredShippingAddressErrorFailureReason];
  v5 = [(PKPaymentShippingAddressDataItem *)self createShippingAddressErrorWithDescription:v3 failureReason:v4];

  return v5;
}

- (id)requiredShippingAddressErrorDescription
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_REQUIRED";
  }
  else {
    char v3 = off_1E56F7160[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)requiredShippingAddressErrorFailureReason
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_REQUIRED_REASON";
  }
  else {
    char v3 = off_1E56F7178[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)createIncompleteShippingAddressError
{
  char v3 = [(PKPaymentShippingAddressDataItem *)self incompleteShippingAddressErrorDescription];
  char v4 = [(PKPaymentShippingAddressDataItem *)self incompleteShippingAddressErrorFailureReason];
  v5 = [(PKPaymentShippingAddressDataItem *)self createShippingAddressErrorWithDescription:v3 failureReason:v4];

  return v5;
}

- (id)incompleteShippingAddressErrorDescription
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_INCOMPLETE";
  }
  else {
    char v3 = off_1E56F7190[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)incompleteShippingAddressErrorFailureReason
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_INCOMPLETE_REASON";
  }
  else {
    char v3 = off_1E56F71A8[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)createUnavailableShippingAddressError
{
  char v3 = [(PKPaymentShippingAddressDataItem *)self unavailableShippingAddressErrorDescription];
  char v4 = [(PKPaymentShippingAddressDataItem *)self unavailableShippingAddressErrorFailureReason];
  v5 = [(PKPaymentShippingAddressDataItem *)self createShippingAddressErrorWithDescription:v3 failureReason:v4];

  return v5;
}

- (id)unavailableShippingAddressErrorDescription
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_UNAVAILABLE";
  }
  else {
    char v3 = off_1E56F71C0[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)unavailableShippingAddressErrorFailureReason
{
  unint64_t v2 = [(PKPaymentShippingAddressDataItem *)self rawShippingType] - 1;
  if (v2 > 2) {
    char v3 = @"IN_APP_PAYMENT_SHIPPING_ADDRESS_UNAVAILABLE_REASON";
  }
  else {
    char v3 = off_1E56F71D8[v2];
  }
  char v4 = PKLocalizedPaymentString(&v3->isa, 0);
  return v4;
}

- (id)createShippingAddressErrorWithDescription:(id)a3 failureReason:(id)a4
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PKPaymentShippingAddressDataItem *)self hasShippingAddress];
  v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28588];
  v15[0] = *MEMORY[0x1E4F28568];
  v15[1] = v10;
  v16[0] = v7;
  v16[1] = v6;
  v15[2] = @"PKPaymentErrorIsFieldEmpty";
  v11 = [NSNumber numberWithInt:!v8];
  v16[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v13 = [v9 errorWithDomain:@"PKPassKitErrorDomain" code:-3003 userInfo:v12];

  return v13;
}

@end