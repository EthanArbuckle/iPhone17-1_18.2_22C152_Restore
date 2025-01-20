@interface NPKCommutePlanField
- (BOOL)hasPendingUpdate;
- (BOOL)isActive;
- (BOOL)isCountBasedCommutePlan;
- (BOOL)isDeviceBound;
- (NPKCommutePlanField)initWithLabel:(id)a3 detailLabel:(id)a4 formattedValue:(id)a5 rawCountValue:(id)a6 usageDateRange:(id)a7 identifier:(id)a8 details:(id)a9 action:(id)a10 isDeviceBound:(BOOL)a11 pendingUpdateExpireDate:(id)a12;
- (NPKDateRange)usageDateRange;
- (NSArray)details;
- (NSDate)availableFrom;
- (NSDate)availableUntil;
- (NSNumber)rawCountValue;
- (NSString)description;
- (NSString)detailLabel;
- (NSString)formattedValue;
- (NSString)identifier;
- (NSString)label;
- (PKPaymentPassAction)action;
@end

@implementation NPKCommutePlanField

- (NPKCommutePlanField)initWithLabel:(id)a3 detailLabel:(id)a4 formattedValue:(id)a5 rawCountValue:(id)a6 usageDateRange:(id)a7 identifier:(id)a8 details:(id)a9 action:(id)a10 isDeviceBound:(BOOL)a11 pendingUpdateExpireDate:(id)a12
{
  id v38 = a3;
  id v37 = a4;
  id v18 = a5;
  id v36 = a6;
  id v35 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a12;
  v39.receiver = self;
  v39.super_class = (Class)NPKCommutePlanField;
  v23 = [(NPKCommutePlanField *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v38 copy];
    label = v23->_label;
    v23->_label = (NSString *)v24;

    uint64_t v26 = [v37 copy];
    detailLabel = v23->_detailLabel;
    v23->_detailLabel = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    formattedValue = v23->_formattedValue;
    v23->_formattedValue = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    details = v23->_details;
    v23->_details = (NSArray *)v32;

    objc_storeStrong((id *)&v23->_action, a10);
    objc_storeStrong((id *)&v23->_usageDateRange, a7);
    objc_storeStrong((id *)&v23->_rawCountValue, a6);
    v23->_isDeviceBound = a11;
    objc_storeStrong((id *)&v23->_pendingUpdateExpireDate, a12);
  }

  return v23;
}

- (BOOL)hasPendingUpdate
{
  pendingUpdateExpireDate = self->_pendingUpdateExpireDate;
  if (pendingUpdateExpireDate)
  {
    [(NSDate *)pendingUpdateExpireDate timeIntervalSinceNow];
    LOBYTE(pendingUpdateExpireDate) = v3 > 0.0;
  }
  return (char)pendingUpdateExpireDate;
}

- (BOOL)isCountBasedCommutePlan
{
  return self->_formattedValue != 0;
}

- (BOOL)isActive
{
  if ([(NPKCommutePlanField *)self isCountBasedCommutePlan])
  {
    double v3 = [(NPKCommutePlanField *)self rawCountValue];
    uint64_t v4 = [v3 integerValue];

    if (v4 > 0) {
      return 1;
    }
  }
  if ([(NPKCommutePlanField *)self isCountBasedCommutePlan]) {
    return 0;
  }
  v6 = [(NPKCommutePlanField *)self usageDateRange];
  v7 = [v6 expiryDate];

  if (!v7) {
    return 0;
  }
  v8 = [(NPKCommutePlanField *)self usageDateRange];
  v9 = [v8 expiryDate];
  v10 = [MEMORY[0x263EFF910] now];
  uint64_t v11 = [v9 compare:v10];

  if (v11 != 1) {
    return 0;
  }
  v12 = [(NPKCommutePlanField *)self usageDateRange];
  v13 = [v12 startDate];

  if (!v13) {
    return 1;
  }
  v14 = [(NPKCommutePlanField *)self usageDateRange];
  v15 = [v14 startDate];
  v16 = [MEMORY[0x263EFF910] now];
  uint64_t v17 = [v15 compare:v16];

  return v17 == -1;
}

- (NSDate)availableFrom
{
  double v3 = [(NPKDateRange *)self->_usageDateRange startDate];
  if (v3)
  {
    [(PKPaymentPassAction *)self->_action availableFromRelative];
    if (v4 != 0.0)
    {
      [(PKPaymentPassAction *)self->_action availableFromRelative];
      uint64_t v5 = objc_msgSend(v3, "dateByAddingTimeInterval:");
      goto LABEL_6;
    }
  }
  v6 = [(PKPaymentPassAction *)self->_action availableFrom];

  if (v6)
  {
    uint64_t v5 = [(PKPaymentPassAction *)self->_action availableFrom];
LABEL_6:
    v7 = (void *)v5;
    if (v5) {
      goto LABEL_8;
    }
  }
  v7 = [MEMORY[0x263EFF910] distantPast];
LABEL_8:

  return (NSDate *)v7;
}

- (NSDate)availableUntil
{
  double v3 = [(NPKDateRange *)self->_usageDateRange expiryDate];
  if (v3)
  {
    [(PKPaymentPassAction *)self->_action availableUntilRelative];
    if (v4 != 0.0)
    {
      [(PKPaymentPassAction *)self->_action availableUntilRelative];
      uint64_t v5 = objc_msgSend(v3, "dateByAddingTimeInterval:");
      goto LABEL_6;
    }
  }
  v6 = [(PKPaymentPassAction *)self->_action availableUntil];

  if (v6)
  {
    uint64_t v5 = [(PKPaymentPassAction *)self->_action availableUntil];
LABEL_6:
    v7 = (void *)v5;
    if (v5) {
      goto LABEL_8;
    }
  }
  v7 = [MEMORY[0x263EFF910] distantFuture];
LABEL_8:

  return (NSDate *)v7;
}

- (NSString)description
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NPKCommutePlanField *)self label];
  v6 = [(NPKCommutePlanField *)self detailLabel];
  v7 = [(NPKCommutePlanField *)self identifier];
  v8 = [v3 stringWithFormat:@"<%@: %p> {label:%@ detailLabel:%@ ID:%@", v4, self, v5, v6, v7];

  v9 = [(NPKCommutePlanField *)self formattedValue];

  if (v9)
  {
    v10 = [(NPKCommutePlanField *)self formattedValue];
    [v8 appendFormat:@" formattedValue:%@", v10];
  }
  uint64_t v11 = [(NPKCommutePlanField *)self action];

  if (v11)
  {
    v12 = [(NPKCommutePlanField *)self action];
    [v8 appendFormat:@" action:%@", v12];
  }
  v13 = [(NPKCommutePlanField *)self details];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    [v8 appendString:@" details:"];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v15 = [(NPKCommutePlanField *)self details];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v21 = [v20 label];
          id v22 = [v20 value];
          [v8 appendFormat:@" (%@: %@)", v21, v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }
  }
  v23 = [(NPKCommutePlanField *)self usageDateRange];
  uint64_t v24 = [v23 startDate];

  if (v24)
  {
    v25 = [(NPKCommutePlanField *)self usageDateRange];
    uint64_t v26 = [v25 startDate];
    [v8 appendFormat:@" startDate:%@", v26];
  }
  v27 = [(NPKCommutePlanField *)self usageDateRange];
  uint64_t v28 = [v27 expiryDate];

  if (v28)
  {
    v29 = [(NPKCommutePlanField *)self usageDateRange];
    uint64_t v30 = [v29 expiryDate];
    [v8 appendFormat:@" expiryDate:%@", v30];
  }
  [v8 appendString:@"}"];
  return (NSString *)v8;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (NSString)formattedValue
{
  return self->_formattedValue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)details
{
  return self->_details;
}

- (PKPaymentPassAction)action
{
  return self->_action;
}

- (NPKDateRange)usageDateRange
{
  return self->_usageDateRange;
}

- (NSNumber)rawCountValue
{
  return self->_rawCountValue;
}

- (BOOL)isDeviceBound
{
  return self->_isDeviceBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCountValue, 0);
  objc_storeStrong((id *)&self->_usageDateRange, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_formattedValue, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingUpdateExpireDate, 0);
}

@end