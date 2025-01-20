@interface PKPeerPaymentAccountFeatureDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentAccountFeatureDescriptor:(id)a3;
- (BOOL)isSupported;
- (NSArray)amountSuggestions;
- (NSArray)frequencyOptions;
- (NSArray)thresholdSuggestions;
- (NSDecimalNumber)feePercentage;
- (NSDecimalNumber)maximumFee;
- (NSDecimalNumber)minimumFee;
- (NSTimeZone)productTimeZone;
- (PKPeerPaymentAccountFeatureDescriptor)initWithCoder:(id)a3;
- (PKPeerPaymentAccountFeatureDescriptor)initWithDictionary:(id)a3;
- (double)proactiveFetchPeriod;
- (id)_suggestionsFromStrings:(id)a3;
- (id)description;
- (int64_t)endProcessingHour;
- (int64_t)maximumPayments;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountSuggestions:(id)a3;
- (void)setEndProcessingHour:(int64_t)a3;
- (void)setFeePercentage:(id)a3;
- (void)setFrequencyOptions:(id)a3;
- (void)setMaximumFee:(id)a3;
- (void)setMaximumPayments:(int64_t)a3;
- (void)setMinimumFee:(id)a3;
- (void)setProactiveFetchPeriod:(double)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setThresholdSuggestions:(id)a3;
@end

@implementation PKPeerPaymentAccountFeatureDescriptor

- (PKPeerPaymentAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v27 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"feePercentage"];
    feePercentage = v5->_feePercentage;
    v5->_feePercentage = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"minimumFee"];
    minimumFee = v5->_minimumFee;
    v5->_minimumFee = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"maximumFee"];
    maximumFee = v5->_maximumFee;
    v5->_maximumFee = (NSDecimalNumber *)v10;

    v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"amountSuggestions"];
    uint64_t v13 = [(PKPeerPaymentAccountFeatureDescriptor *)v5 _suggestionsFromStrings:v12];
    amountSuggestions = v5->_amountSuggestions;
    v5->_amountSuggestions = (NSArray *)v13;

    v15 = [v4 PKArrayContaining:objc_opt_class() forKey:@"thresholdSuggestions"];

    uint64_t v16 = [(PKPeerPaymentAccountFeatureDescriptor *)v5 _suggestionsFromStrings:v15];
    thresholdSuggestions = v5->_thresholdSuggestions;
    v5->_thresholdSuggestions = (NSArray *)v16;

    uint64_t v18 = [v4 PKArrayContaining:objc_opt_class() forKey:@"frequencyOptions"];
    frequencyOptions = v5->_frequencyOptions;
    v5->_frequencyOptions = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAF0];
    v21 = [v4 PKStringForKey:@"productTimeZone"];
    uint64_t v22 = [v20 timeZoneWithName:v21];
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v22;

    v5->_maximumPayments = [v4 PKIntegerForKey:@"maximumPayments"];
    v5->_endProcessingHour = [v4 PKIntegerForKey:@"endProcessingHour"];
    [v4 PKDoubleForKey:@"proactiveFetchPeriod"];
    v5->_proactiveFetchPeriod = v24;
    v25 = [(PKAccountFeatureDescriptor *)v5 osVersionRange];
    v5->_supported = PKDeviceVersionMeetsRequiredVersion(v25);
  }
  return v5;
}

- (id)_suggestionsFromStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C28], "decimalNumberWithString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v4 safelyAddObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccountFeatureDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  id v5 = [(PKAccountFeatureDescriptor *)&v31 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feePercentage"];
    feePercentage = v5->_feePercentage;
    v5->_feePercentage = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumFee"];
    minimumFee = v5->_minimumFee;
    v5->_minimumFee = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumFee"];
    maximumFee = v5->_maximumFee;
    v5->_maximumFee = (NSDecimalNumber *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    long long v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"amountSuggestions"];
    amountSuggestions = v5->_amountSuggestions;
    v5->_amountSuggestions = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"thresholdSuggestions"];
    thresholdSuggestions = v5->_thresholdSuggestions;
    v5->_thresholdSuggestions = (NSArray *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    double v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"frequencyOptions"];
    frequencyOptions = v5->_frequencyOptions;
    v5->_frequencyOptions = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productTimeZone"];
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v27;

    v5->_maximumPayments = [v4 decodeIntegerForKey:@"maximumPayments"];
    v5->_endProcessingHour = [v4 decodeIntegerForKey:@"endProcessingHour"];
    [v4 decodeDoubleForKey:@"proactiveFetchPeriod"];
    v5->_proactiveFetchPeriod = v29;
    v5->_supported = [v4 decodeBoolForKey:@"supported"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  id v4 = a3;
  [(PKAccountFeatureDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_feePercentage, @"feePercentage", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_minimumFee forKey:@"minimumFee"];
  [v4 encodeObject:self->_maximumFee forKey:@"maximumFee"];
  [v4 encodeObject:self->_amountSuggestions forKey:@"amountSuggestions"];
  [v4 encodeObject:self->_thresholdSuggestions forKey:@"thresholdSuggestions"];
  [v4 encodeObject:self->_frequencyOptions forKey:@"frequencyOptions"];
  [v4 encodeObject:self->_productTimeZone forKey:@"productTimeZone"];
  [v4 encodeInteger:self->_maximumPayments forKey:@"maximumPayments"];
  [v4 encodeInteger:self->_endProcessingHour forKey:@"endProcessingHour"];
  [v4 encodeDouble:@"proactiveFetchPeriod" forKey:self->_proactiveFetchPeriod];
  [v4 encodeBool:self->_supported forKey:@"supported"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKAccountFeatureDescriptor *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];
  objc_super v5 = [(PKAccountFeatureDescriptor *)self minimumAmount];
  [v3 appendFormat:@"minimumAmount: '%@'; ", v5];

  uint64_t v6 = [(PKAccountFeatureDescriptor *)self maximumAmount];
  [v3 appendFormat:@"maximumAmount: '%@'; ", v6];

  if (([v4 isEqualToString:@"loadFromCard"] & 1) != 0
    || ([v4 isEqualToString:@"sendToUser"] & 1) != 0
    || [v4 isEqualToString:@"recurringPayments"])
  {
    uint64_t v7 = [(PKAccountFeatureDescriptor *)self merchantIdentifier];
    [v3 appendFormat:@"merchantIdentifier: '%@'; ", v7];

    uint64_t v8 = [(PKAccountFeatureDescriptor *)self supportedNetworks];
    [v3 appendFormat:@"supportedNetworks: '%@'; ", v8];

    v9 = PKMerchantCapabilityToStrings([(PKAccountFeatureDescriptor *)self merchantCapabilities]);
    [v3 appendFormat:@"merchantCapabilities: '%@'; ", v9];
  }
  if ([v4 isEqualToString:@"instantWithdrawal"])
  {
    uint64_t v10 = [(PKPeerPaymentAccountFeatureDescriptor *)self feePercentage];
    [v3 appendFormat:@"feePercentage: '%@'; ", v10];

    v11 = [(PKPeerPaymentAccountFeatureDescriptor *)self minimumFee];
    [v3 appendFormat:@"minimumFee: '%@'; ", v11];

    v12 = [(PKPeerPaymentAccountFeatureDescriptor *)self maximumFee];
    [v3 appendFormat:@"maximumFee: '%@'; ", v12];
  }
  if ([v4 isEqualToString:@"thresholdTopUp"])
  {
    [v3 appendFormat:@"amountSuggestions: '%@'; ", self->_amountSuggestions];
    [v3 appendFormat:@"thresholdSuggestions: '%@'; ", self->_thresholdSuggestions];
  }
  if ([v4 isEqualToString:@"recurringPayments"])
  {
    [v3 appendFormat:@"frequencyOptions: '%@'; ", self->_frequencyOptions];
    [v3 appendFormat:@"productTimeZone: '%@'; ", self->_productTimeZone];
    objc_msgSend(v3, "appendFormat:", @"maximumPayments: '%ld'; ", self->_maximumPayments);
    objc_msgSend(v3, "appendFormat:", @"endProcessingHour: '%ld'; ", self->_endProcessingHour);
    objc_msgSend(v3, "appendFormat:", @"proactiveFetchPeriod: '%lf'; ", *(void *)&self->_proactiveFetchPeriod);
  }
  uint64_t v13 = [(PKAccountFeatureDescriptor *)self osVersionRange];

  if (v13)
  {
    long long v14 = [(PKAccountFeatureDescriptor *)self osVersionRange];
    uint64_t v15 = [v14 asDictionary];
    [v3 appendFormat:@"osVersionRange: '%@'; ", v15];
  }
  if (self->_supported) {
    long long v16 = @"YES";
  }
  else {
    long long v16 = @"NO";
  }
  [v3 appendFormat:@"supported: '%@'; ", v16];
  [v3 appendFormat:@">"];

  return v3;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentAccountFeatureDescriptor;
  id v3 = [(PKAccountFeatureDescriptor *)&v11 hash];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v4 safelyAddObject:self->_feePercentage];
  [v4 safelyAddObject:self->_minimumFee];
  [v4 safelyAddObject:self->_maximumFee];
  [v4 safelyAddObject:self->_amountSuggestions];
  [v4 safelyAddObject:self->_thresholdSuggestions];
  [v4 safelyAddObject:self->_frequencyOptions];
  [v4 safelyAddObject:self->_productTimeZone];
  uint64_t v5 = PKCombinedHash((uint64_t)v3, v4);
  int64_t v6 = self->_maximumPayments - v5 + 32 * v5;
  int64_t v7 = self->_endProcessingHour - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_proactiveFetchPeriod - v7 + 32 * v7;
  unint64_t v9 = self->_supported - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentAccountFeatureDescriptor *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentAccountFeatureDescriptor *)self isEqualToPeerPaymentAccountFeatureDescriptor:v5];

  return v6;
}

- (BOOL)isEqualToPeerPaymentAccountFeatureDescriptor:(id)a3
{
  id v4 = (double *)a3;
  if (![(PKAccountFeatureDescriptor *)self isEqualToAccountFeatureDescriptor:v4]) {
    goto LABEL_50;
  }
  feePercentage = self->_feePercentage;
  BOOL v6 = (NSDecimalNumber *)*((void *)v4 + 10);
  if (feePercentage) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (feePercentage != v6) {
      goto LABEL_50;
    }
  }
  else if ((-[NSDecimalNumber isEqual:](feePercentage, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  minimumFee = self->_minimumFee;
  unint64_t v9 = (NSDecimalNumber *)*((void *)v4 + 11);
  if (minimumFee) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (minimumFee != v9) {
      goto LABEL_50;
    }
  }
  else if ((-[NSDecimalNumber isEqual:](minimumFee, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  maximumFee = self->_maximumFee;
  v12 = (NSDecimalNumber *)*((void *)v4 + 12);
  if (maximumFee) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (maximumFee != v12) {
      goto LABEL_50;
    }
  }
  else if ((-[NSDecimalNumber isEqual:](maximumFee, "isEqual:") & 1) == 0)
  {
    goto LABEL_50;
  }
  amountSuggestions = self->_amountSuggestions;
  uint64_t v15 = (NSArray *)*((void *)v4 + 13);
  if (amountSuggestions && v15)
  {
    if ((-[NSArray isEqual:](amountSuggestions, "isEqual:") & 1) == 0) {
      goto LABEL_50;
    }
  }
  else if (amountSuggestions != v15)
  {
    goto LABEL_50;
  }
  thresholdSuggestions = self->_thresholdSuggestions;
  v17 = (NSArray *)*((void *)v4 + 14);
  if (thresholdSuggestions && v17)
  {
    if ((-[NSArray isEqual:](thresholdSuggestions, "isEqual:") & 1) == 0) {
      goto LABEL_50;
    }
  }
  else if (thresholdSuggestions != v17)
  {
    goto LABEL_50;
  }
  frequencyOptions = self->_frequencyOptions;
  v19 = (NSArray *)*((void *)v4 + 15);
  if (frequencyOptions && v19)
  {
    if ((-[NSArray isEqual:](frequencyOptions, "isEqual:") & 1) == 0) {
      goto LABEL_50;
    }
  }
  else if (frequencyOptions != v19)
  {
    goto LABEL_50;
  }
  productTimeZone = self->_productTimeZone;
  v21 = (NSTimeZone *)*((void *)v4 + 16);
  if (!productTimeZone || !v21)
  {
    if (productTimeZone == v21) {
      goto LABEL_46;
    }
LABEL_50:
    BOOL v22 = 0;
    goto LABEL_51;
  }
  if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0) {
    goto LABEL_50;
  }
LABEL_46:
  if (self->_maximumPayments != *((void *)v4 + 17)
    || self->_endProcessingHour != *((void *)v4 + 18)
    || self->_proactiveFetchPeriod != v4[19])
  {
    goto LABEL_50;
  }
  BOOL v22 = self->_supported == *((unsigned __int8 *)v4 + 72);
LABEL_51:

  return v22;
}

- (NSDecimalNumber)feePercentage
{
  return self->_feePercentage;
}

- (void)setFeePercentage:(id)a3
{
}

- (NSDecimalNumber)minimumFee
{
  return self->_minimumFee;
}

- (void)setMinimumFee:(id)a3
{
}

- (NSDecimalNumber)maximumFee
{
  return self->_maximumFee;
}

- (void)setMaximumFee:(id)a3
{
}

- (NSArray)amountSuggestions
{
  return self->_amountSuggestions;
}

- (void)setAmountSuggestions:(id)a3
{
}

- (NSArray)thresholdSuggestions
{
  return self->_thresholdSuggestions;
}

- (void)setThresholdSuggestions:(id)a3
{
}

- (NSArray)frequencyOptions
{
  return self->_frequencyOptions;
}

- (void)setFrequencyOptions:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (int64_t)maximumPayments
{
  return self->_maximumPayments;
}

- (void)setMaximumPayments:(int64_t)a3
{
  self->_maximumPayments = a3;
}

- (int64_t)endProcessingHour
{
  return self->_endProcessingHour;
}

- (void)setEndProcessingHour:(int64_t)a3
{
  self->_endProcessingHour = a3;
}

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_proactiveFetchPeriod = a3;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_frequencyOptions, 0);
  objc_storeStrong((id *)&self->_thresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_amountSuggestions, 0);
  objc_storeStrong((id *)&self->_maximumFee, 0);
  objc_storeStrong((id *)&self->_minimumFee, 0);
  objc_storeStrong((id *)&self->_feePercentage, 0);
}

@end