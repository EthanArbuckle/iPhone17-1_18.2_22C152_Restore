@interface PKTransitAppletHistoryRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransitAppletHistoryRecord:(id)a3;
- (NSArray)amounts;
- (NSArray)plans;
- (NSData)endStation;
- (NSData)startStation;
- (NSDate)time;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)balance;
- (NSNumber)cityCode;
- (NSNumber)historySequenceNumber;
- (NSNumber)loyaltyAmount;
- (NSNumber)loyaltyBalance;
- (NSString)transitDetail;
- (PKTransitAppletHistoryRecord)initWithCoder:(id)a3;
- (PKTransitAppletHistoryRecord)initWithDictionary:(id)a3;
- (id)_transactionAmountsWithBalanceLabels:(id)a3 planLabels:(id)a4 unitDictionary:(id)a5;
- (id)_transactionCommutePlanUnitsWithPlanLabels:(id)a3;
- (id)concreteTransactionWithCurrency:(id)a3 balanceLabels:(id)a4 unitDictionary:(id)a5 planLabels:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)felicaHistoryRecord;
- (int64_t)paymentTransactionType;
- (int64_t)recordType;
- (int64_t)transitTransactionSubtype;
- (unint64_t)detail;
- (unint64_t)hash;
- (unint64_t)subtype;
- (unint64_t)transitTransactionModifier;
- (unint64_t)type;
- (void)_setTransactionHistoryDetailsFromString:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setAmounts:(id)a3;
- (void)setBalance:(id)a3;
- (void)setCityCode:(id)a3;
- (void)setDetail:(unint64_t)a3;
- (void)setEndStation:(id)a3;
- (void)setHistorySequenceNumber:(id)a3;
- (void)setLoyaltyAmount:(id)a3;
- (void)setLoyaltyBalance:(id)a3;
- (void)setPlans:(id)a3;
- (void)setRecordType:(int64_t)a3;
- (void)setStartStation:(id)a3;
- (void)setSubtype:(unint64_t)a3;
- (void)setTime:(id)a3;
- (void)setTransitDetail:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKTransitAppletHistoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)paymentTransactionType
{
  return 2;
}

- (int64_t)transitTransactionSubtype
{
  uint64_t v3 = [(PKTransitAppletHistoryRecord *)self subtype];
  if (v3 > 65)
  {
    if ((unint64_t)(v3 - 128) >= 3)
    {
      if (v3 == 66)
      {
        return 514;
      }
      else if (v3 == 67)
      {
        return 518;
      }
      else
      {
LABEL_10:
        unint64_t v9 = [(PKTransitAppletHistoryRecord *)self type];
        if (v9 > 4) {
          return 1;
        }
        else {
          return qword_191673F30[v9];
        }
      }
    }
    else
    {
      return 513;
    }
  }
  else
  {
    uint64_t v4 = v3 - 1;
    int64_t result = 8;
    switch(v4)
    {
      case 0:
        BOOL v6 = [(PKTransitAppletHistoryRecord *)self detail] == 64;
        int64_t v7 = 2;
        int64_t v8 = 1026;
        goto LABEL_21;
      case 1:
        return 3;
      case 2:
        unint64_t v11 = [(PKTransitAppletHistoryRecord *)self detail];
        int64_t v7 = 258;
        int64_t v8 = 4;
        uint64_t v12 = 4;
        if (v11 == 129) {
          uint64_t v12 = 257;
        }
        if (v11 != 128) {
          int64_t v7 = v12;
        }
        BOOL v6 = v11 == 0;
LABEL_21:
        if (v6) {
          return v8;
        }
        else {
          return v7;
        }
      case 3:
        uint64_t v10 = [(PKTransitAppletHistoryRecord *)self detail];
        if (v10 <= 192)
        {
          if (v10 == 192) {
            return 259;
          }
          return 5;
        }
        if (v10 != 194)
        {
          if (v10 == 193) {
            return 260;
          }
          return 5;
        }
        int64_t result = 261;
        break;
      case 4:
        if ([(PKTransitAppletHistoryRecord *)self detail] - 256 >= 2) {
          return 6;
        }
        else {
          return 1025;
        }
      case 5:
        return 7;
      case 6:
        return result;
      default:
        goto LABEL_10;
    }
  }
  return result;
}

- (unint64_t)transitTransactionModifier
{
  return self->_transitModifiers;
}

- (id)_transactionCommutePlanUnitsWithPlanLabels:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v6 = self->_plans;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "commutePlanIdentifier", (void)v16);
        if (v11)
        {
          uint64_t v12 = [v4 objectForKeyedSubscript:v11];
          v13 = [[PKTransactionCommutePlanUnit alloc] initWithTimedPlanIdentifier:v11 label:v12];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (id)_transactionAmountsWithBalanceLabels:(id)a3 planLabels:(id)a4 unitDictionary:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v32 = a4;
  id v35 = a5;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_amounts;
  uint64_t v38 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v10 = [v9 balanceIdentifier];
        if (v10)
        {
          id v11 = [v36 objectForKeyedSubscript:v10];
          uint64_t v12 = v11;
          if (!v11 || (uint64_t v13 = [v11 length], v12, !v13))
          {
            uint64_t v14 = [v32 objectForKeyedSubscript:v10];

            uint64_t v12 = (void *)v14;
          }
          v15 = [v35 objectForKeyedSubscript:v10];
          uint64_t v16 = [v15 integerValue];
          long long v17 = [v9 amount];
          long long v18 = [v9 currency];
          uint64_t v19 = [v9 exponent];
          PKLocalizedPaymentUnitKeyForType(v16);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = v18;
          v22 = v21;
          if (v21 == @"XXX")
          {

            if (!v15) {
              goto LABEL_18;
            }
LABEL_15:
            if (!v20) {
              goto LABEL_20;
            }
            v24 = objc_msgSend(v17, "pk_absoluteValue");
            v25 = PKLocalizedPaymentString(v20, &cfstr_Lu.isa, [v24 unsignedLongValue]);

            v26 = [[PKCurrencyAmount alloc] initWithAmount:v17 exponent:v19 preformattedString:v25];
          }
          else
          {
            if (@"XXX" && v21)
            {
              int v23 = -[__CFString isEqualToString:](v21, "isEqualToString:");

              if (v23)
              {
                if (v15) {
                  goto LABEL_15;
                }
LABEL_18:
                v27 = PKLocalizedPaymentString(&cfstr_TransactionPen.isa, 0);
                v26 = [[PKCurrencyAmount alloc] initWithAmount:v17 exponent:v19 preformattedString:v27];

                v28 = [[PKTransactionAmount alloc] initWithPendingCurrencyAmount:v26 unitIdentifier:v10];
LABEL_22:
                v29 = v28;
                [v34 addObject:v28];

                goto LABEL_23;
              }
            }
            else
            {
            }
LABEL_20:
            v26 = [[PKCurrencyAmount alloc] initWithAmount:v17 currency:v22 exponent:v19];
          }
          v28 = [[PKTransactionAmount alloc] initWithCurrencyAmount:v26 label:v12];
          goto LABEL_22;
        }
LABEL_23:
      }
      uint64_t v38 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v38);
  }

  v30 = (void *)[v34 copy];
  return v30;
}

- (PKTransitAppletHistoryRecord)initWithDictionary:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PKTransitAppletHistoryRecord;
  id v5 = [(PKTransitAppletHistoryRecord *)&v74 init];
  BOOL v6 = v5;
  if (!v4 || !v5) {
    goto LABEL_46;
  }
  uint64_t v7 = [v4 PKNumberForKey:@"SerialNumber"];
  uint64_t v8 = [v7 copy];
  historySequenceNumber = v6->_historySequenceNumber;
  v6->_historySequenceNumber = (NSNumber *)v8;

  uint64_t v10 = [v4 PKDateComponentsForKey:@"TransactionTime"];
  uint64_t v11 = PKDateFromDateComponents(v10);
  time = v6->_time;
  v6->_time = (NSDate *)v11;

  uint64_t v13 = [v4 PKDecimalNumberForKey:@"FinalBalance"];
  uint64_t v14 = [v13 copy];
  balance = v6->_balance;
  v6->_balance = (NSDecimalNumber *)v14;

  uint64_t v16 = [v4 PKNumberForKey:@"PointsBalance"];
  uint64_t v17 = [v16 copy];
  loyaltyBalance = v6->_loyaltyBalance;
  v6->_loyaltyBalance = (NSNumber *)v17;

  uint64_t v19 = [v4 PKNumberForKey:@"CityCode"];
  uint64_t v20 = [v19 copy];
  cityCode = v6->_cityCode;
  v6->_cityCode = (NSNumber *)v20;

  v22 = [v4 PKStringForKey:@"TypeDetail"];
  uint64_t v23 = [v22 copy];
  transitDetail = v6->_transitDetail;
  v6->_transitDetail = (NSString *)v23;

  [(PKTransitAppletHistoryRecord *)v6 _setTransactionHistoryDetailsFromString:v6->_transitDetail];
  v25 = [v4 PKDecimalNumberForKey:@"Amount"];
  uint64_t v26 = [v25 copy];
  amount = v6->_amount;
  v6->_amount = (NSDecimalNumber *)v26;

  v28 = [v4 PKNumberForKey:@"PointsAmount"];
  uint64_t v29 = [v28 copy];
  loyaltyAmount = v6->_loyaltyAmount;
  v6->_loyaltyAmount = (NSNumber *)v29;

  uint64_t v31 = [v4 PKDataForKey:@"StartStation"];
  startStation = v6->_startStation;
  v6->_startStation = (NSData *)v31;

  uint64_t v33 = [v4 PKDataForKey:@"EndStation"];
  endStation = v6->_endStation;
  v6->_endStation = (NSData *)v33;

  v6->_recordType = 0;
  id v35 = [v4 PKStringForKey:@"IgnoreReason"];
  id v36 = v35;
  if (v35)
  {
    if ([v35 isEqual:@"EnRoute"])
    {
      uint64_t v37 = 1;
LABEL_15:
      v6->_recordType = v37;
      goto LABEL_16;
    }
    if ([v36 isEqual:@"Merged"])
    {
      uint64_t v37 = 2;
      goto LABEL_15;
    }
    uint64_t v38 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v36;
      long long v39 = "PKTransitAppletHistoryRecord: Unexpected ATL ignore reason: %@";
      long long v40 = v38;
      uint32_t v41 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ([(NSString *)v6->_transitDetail isEqualToString:@"PointsConversion"])
  {
    uint64_t v38 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v40 = v38;
      uint32_t v41 = 2;
LABEL_13:
      _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    }
LABEL_14:

    uint64_t v37 = -1;
    goto LABEL_15;
  }
LABEL_16:
  v64 = v36;
  v6->_transitModifiers = 0;
  long long v42 = [v4 PKArrayContaining:objc_opt_class() forKey:@"TypeModifiers"];
  v43 = v42;
  if (v42)
  {
    if ([v42 containsObject:@"TransferDiscount"]) {
      v6->_transitModifiers |= 2uLL;
    }
    if ([v43 containsObject:@"CommuteDiscount"]) {
      v6->_transitModifiers |= 1uLL;
    }
    if ([v43 containsObject:@"FareCapped"]) {
      v6->_transitModifiers |= 4uLL;
    }
    if ([v43 containsObject:@"FareAdjustment"]) {
      v6->_transitModifiers |= 8uLL;
    }
    if ([v43 containsObject:@"FareRebate"]) {
      v6->_transitModifiers |= 0x10uLL;
    }
  }
  v63 = v43;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45 = [v4 PKArrayContaining:objc_opt_class() forKey:@"Amounts"];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v70 objects:v76 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v71 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = [[PKTransitAppletAmount alloc] initWithDictionary:*(void *)(*((void *)&v70 + 1) + 8 * i)];
        if (v50) {
          [v44 addObject:v50];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v47);
  }
  uint64_t v51 = [v44 copy];
  amounts = v6->_amounts;
  v6->_amounts = (NSArray *)v51;

  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v65 = v4;
  v54 = [v4 PKArrayContaining:objc_opt_class() forKey:@"CommutePlans"];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v67 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = [[PKTransitAppletPlan alloc] initWithDictionary:*(void *)(*((void *)&v66 + 1) + 8 * j)];
        if (v59) {
          [v53 addObject:v59];
        }
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v56);
  }
  uint64_t v60 = [v53 copy];
  plans = v6->_plans;
  v6->_plans = (NSArray *)v60;

  id v4 = v65;
LABEL_46:

  return v6;
}

- (void)_setTransactionHistoryDetailsFromString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if ([v4 isEqual:@"Transit"])
    {
      unint64_t v5 = 1;
LABEL_4:
      self->_subtype = 0;
      self->_detail = 0;
      self->_type = v5;
LABEL_11:
      id v4 = v8;
      goto LABEL_71;
    }
    if ([v8 isEqual:@"TransitMetro"])
    {
      int64x2_t v6 = vdupq_n_s64(1uLL);
LABEL_7:
      *(int64x2_t *)&self->_type = v6;
      self->_detail = 0;
      goto LABEL_11;
    }
    if ([v8 isEqual:@"TransitMetroUpgrade"])
    {
      *(int64x2_t *)&self->_type = vdupq_n_s64(1uLL);
      unint64_t v7 = 64;
LABEL_10:
      self->_detail = v7;
      goto LABEL_11;
    }
    if ([v8 isEqual:@"TransitLightRail"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673F20;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitBus"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191656DC0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitTrain"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191656BD0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitTrainMaglev"])
    {
      *(_OWORD *)&self->_type = xmmword_191656BD0;
      unint64_t v7 = 128;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitTrainShinkansen"])
    {
      *(_OWORD *)&self->_type = xmmword_191656BD0;
      unint64_t v7 = 129;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitOther"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673F10;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitOtherTaxi"])
    {
      *(_OWORD *)&self->_type = xmmword_191673F10;
      unint64_t v7 = 192;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitOtherFerry"])
    {
      *(_OWORD *)&self->_type = xmmword_191673F10;
      unint64_t v7 = 193;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitOtherBike"])
    {
      *(_OWORD *)&self->_type = xmmword_191673F10;
      unint64_t v7 = 194;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitSpecial"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673EF0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitSpecialGreenCarUsed"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EF0;
      unint64_t v7 = 256;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TransitOtherCableCar"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673F00;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TransitSpecialGreenCarSeated"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EF0;
      unint64_t v7 = 257;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"Purchase"])
    {
      unint64_t v5 = 2;
      goto LABEL_4;
    }
    if ([v8 isEqual:@"PurchaseRetail"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673EE0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"PurchaseRetailMerchant"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EE0;
      unint64_t v7 = 320;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"PurchaseRetailGasStation"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EE0;
      unint64_t v7 = 321;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"PurchaseAdmission"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673ED0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"PurchaseAdmissionParking"])
    {
      *(_OWORD *)&self->_type = xmmword_191673ED0;
      unint64_t v7 = 384;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"PurchaseAdmissionGarden"])
    {
      *(_OWORD *)&self->_type = xmmword_191673ED0;
      unint64_t v7 = 385;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"PurchaseRefund"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673EC0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"PurchaseRefundReturn"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EC0;
      unint64_t v7 = 448;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"PurchaseRefundCancellation"])
    {
      *(_OWORD *)&self->_type = xmmword_191673EC0;
      unint64_t v7 = 449;
      goto LABEL_10;
    }
    if ([v8 isEqual:@"TopUp"]) {
      goto LABEL_59;
    }
    if ([v8 isEqual:@"TopUpContactless"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673EB0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TopUpAuto"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673EA0;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"TopUpServer"])
    {
      int64x2_t v6 = (int64x2_t)xmmword_191673E90;
      goto LABEL_7;
    }
    if ([v8 isEqual:@"Points"])
    {
LABEL_59:
      unint64_t v5 = 3;
      goto LABEL_4;
    }
    if ([v8 isEqual:@"CardRead"])
    {
      unint64_t v5 = 4;
      goto LABEL_4;
    }
    [v8 isEqual:@"Unknown"];
    id v4 = v8;
  }
  self->_type = 0;
  self->_subtype = 0;
  self->_detail = 0;
LABEL_71:
}

- (PKTransitAppletHistoryRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKTransitAppletHistoryRecord *)self initWithDictionary:0];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"historySequenceNumber"];
    historySequenceNumber = v5->_historySequenceNumber;
    v5->_historySequenceNumber = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDate *)v8;

    v5->_type = [v4 decodeIntegerForKey:@"transactionType"];
    v5->_subtype = [v4 decodeIntegerForKey:@"transactionSubtype"];
    v5->_detail = [v4 decodeIntegerForKey:@"transactionDetail"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transitDetail"];
    transitDetail = v5->_transitDetail;
    v5->_transitDetail = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loyaltyBalance"];
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loyaltyAmount"];
    loyaltyAmount = v5->_loyaltyAmount;
    v5->_loyaltyAmount = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startStation"];
    startStation = v5->_startStation;
    v5->_startStation = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStation"];
    endStation = v5->_endStation;
    v5->_endStation = (NSData *)v22;

    v5->_recordType = [v4 decodeIntegerForKey:@"recordType"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cityCode"];
    cityCode = v5->_cityCode;
    v5->_cityCode = (NSNumber *)v24;

    v5->_transitModifiers = [v4 decodeIntegerForKey:@"transitModifiers"];
    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"amounts"];
    amounts = v5->_amounts;
    v5->_amounts = (NSArray *)v29;

    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"plans"];
    plans = v5->_plans;
    v5->_plans = (NSArray *)v34;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSNumber *)self->_historySequenceNumber copyWithZone:a3];
  unint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDate *)self->_time copyWithZone:a3];
  uint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  v5[3] = self->_type;
  v5[4] = self->_subtype;
  v5[5] = self->_detail;
  uint64_t v10 = [(NSString *)self->_transitDetail copyWithZone:a3];
  uint64_t v11 = (void *)v5[16];
  v5[16] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_balance copyWithZone:a3];
  uint64_t v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSNumber *)self->_loyaltyBalance copyWithZone:a3];
  v15 = (void *)v5[8];
  v5[8] = v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_amount copyWithZone:a3];
  uint64_t v17 = (void *)v5[9];
  v5[9] = v16;

  uint64_t v18 = [(NSNumber *)self->_loyaltyAmount copyWithZone:a3];
  uint64_t v19 = (void *)v5[10];
  v5[10] = v18;

  uint64_t v20 = [(NSData *)self->_startStation copyWithZone:a3];
  uint64_t v21 = (void *)v5[12];
  v5[12] = v20;

  uint64_t v22 = [(NSData *)self->_endStation copyWithZone:a3];
  uint64_t v23 = (void *)v5[13];
  v5[13] = v22;

  v5[17] = self->_recordType;
  uint64_t v24 = [(NSNumber *)self->_cityCode copyWithZone:a3];
  v25 = (void *)v5[11];
  v5[11] = v24;

  v5[1] = self->_transitModifiers;
  uint64_t v26 = [(NSArray *)self->_amounts copyWithZone:a3];
  uint64_t v27 = (void *)v5[14];
  v5[14] = v26;

  uint64_t v28 = [(NSArray *)self->_plans copyWithZone:a3];
  uint64_t v29 = (void *)v5[15];
  v5[15] = v28;

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKTransitAppletHistoryRecord;
  [(PKTransitAppletHistoryRecord *)&v2 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  historySequenceNumber = self->_historySequenceNumber;
  id v5 = a3;
  [v5 encodeObject:historySequenceNumber forKey:@"historySequenceNumber"];
  [v5 encodeObject:self->_time forKey:@"time"];
  [v5 encodeInteger:self->_type forKey:@"transactionType"];
  [v5 encodeInteger:self->_subtype forKey:@"transactionSubtype"];
  [v5 encodeInteger:self->_detail forKey:@"transactionDetail"];
  [v5 encodeObject:self->_transitDetail forKey:@"transitDetail"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_loyaltyBalance forKey:@"loyaltyBalance"];
  [v5 encodeObject:self->_amount forKey:@"amount"];
  [v5 encodeObject:self->_loyaltyAmount forKey:@"loyaltyAmount"];
  [v5 encodeObject:self->_startStation forKey:@"startStation"];
  [v5 encodeObject:self->_endStation forKey:@"endStation"];
  [v5 encodeInteger:self->_recordType forKey:@"recordType"];
  [v5 encodeObject:self->_cityCode forKey:@"cityCode"];
  [v5 encodeInteger:self->_transitModifiers forKey:@"transitModifiers"];
  [v5 encodeObject:self->_amounts forKey:@"amounts"];
  [v5 encodeObject:self->_plans forKey:@"plans"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKTransitAppletHistoryRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransitAppletHistoryRecord *)self isEqualToTransitAppletHistoryRecord:v5];

  return v6;
}

- (BOOL)isEqualToTransitAppletHistoryRecord:(id)a3
{
  id v4 = a3;
  historySequenceNumber = self->_historySequenceNumber;
  BOOL v6 = (NSNumber *)v4[2];
  if (historySequenceNumber) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (historySequenceNumber != v6) {
      goto LABEL_68;
    }
  }
  else
  {
    char v8 = -[NSNumber isEqual:](historySequenceNumber, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_68;
    }
  }
  time = self->_time;
  uint64_t v10 = (NSDate *)v4[6];
  if (time && v10)
  {
    if ((-[NSDate isEqual:](time, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (time != v10)
  {
    goto LABEL_68;
  }
  if (self->_type != v4[3] || self->_subtype != v4[4] || self->_detail != v4[5]) {
    goto LABEL_68;
  }
  uint64_t v11 = (void *)v4[16];
  uint64_t v12 = self->_transitDetail;
  uint64_t v13 = v11;
  if (v12 == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_68;
    }
    BOOL v15 = [(NSString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_68;
    }
  }
  balance = self->_balance;
  uint64_t v17 = (NSDecimalNumber *)v4[7];
  if (balance && v17)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (balance != v17)
  {
    goto LABEL_68;
  }
  loyaltyBalance = self->_loyaltyBalance;
  uint64_t v19 = (NSNumber *)v4[8];
  if (loyaltyBalance && v19)
  {
    if ((-[NSNumber isEqual:](loyaltyBalance, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (loyaltyBalance != v19)
  {
    goto LABEL_68;
  }
  amount = self->_amount;
  uint64_t v21 = (NSDecimalNumber *)v4[9];
  if (amount && v21)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (amount != v21)
  {
    goto LABEL_68;
  }
  loyaltyAmount = self->_loyaltyAmount;
  uint64_t v23 = (NSNumber *)v4[10];
  if (loyaltyAmount && v23)
  {
    if ((-[NSNumber isEqual:](loyaltyAmount, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (loyaltyAmount != v23)
  {
    goto LABEL_68;
  }
  startStation = self->_startStation;
  v25 = (NSData *)v4[12];
  if (startStation && v25)
  {
    if ((-[NSData isEqual:](startStation, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (startStation != v25)
  {
    goto LABEL_68;
  }
  endStation = self->_endStation;
  uint64_t v27 = (NSData *)v4[13];
  if (endStation && v27)
  {
    if ((-[NSData isEqual:](endStation, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (endStation != v27)
  {
    goto LABEL_68;
  }
  if (self->_recordType != v4[17]) {
    goto LABEL_68;
  }
  cityCode = self->_cityCode;
  uint64_t v29 = (NSNumber *)v4[11];
  if (cityCode && v29)
  {
    if ((-[NSNumber isEqual:](cityCode, "isEqual:") & 1) == 0) {
      goto LABEL_68;
    }
  }
  else if (cityCode != v29)
  {
    goto LABEL_68;
  }
  if (self->_transitModifiers != v4[1]) {
    goto LABEL_68;
  }
  amounts = self->_amounts;
  uint64_t v31 = (NSArray *)v4[14];
  if (!amounts || !v31)
  {
    if (amounts == v31) {
      goto LABEL_64;
    }
LABEL_68:
    char v34 = 0;
    goto LABEL_69;
  }
  if ((-[NSArray isEqual:](amounts, "isEqual:") & 1) == 0) {
    goto LABEL_68;
  }
LABEL_64:
  plans = self->_plans;
  uint64_t v33 = (NSArray *)v4[15];
  if (plans && v33) {
    char v34 = -[NSArray isEqual:](plans, "isEqual:");
  }
  else {
    char v34 = plans == v33;
  }
LABEL_69:

  return v34;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_historySequenceNumber];
  [v3 safelyAddObject:self->_time];
  [v3 safelyAddObject:self->_transitDetail];
  [v3 safelyAddObject:self->_balance];
  [v3 safelyAddObject:self->_loyaltyBalance];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_loyaltyAmount];
  [v3 safelyAddObject:self->_startStation];
  [v3 safelyAddObject:self->_endStation];
  [v3 safelyAddObject:self->_cityCode];
  [v3 safelyAddObject:self->_amounts];
  [v3 safelyAddObject:self->_plans];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_subtype - v5 + 32 * v5;
  unint64_t v7 = self->_detail - v6 + 32 * v6;
  int64_t v8 = self->_recordType - v7 + 32 * v7;
  unint64_t v9 = self->_transitModifiers - v8 + 32 * v8;

  return v9;
}

- (NSNumber)historySequenceNumber
{
  return self->_historySequenceNumber;
}

- (void)setHistorySequenceNumber:(id)a3
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

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (unint64_t)detail
{
  return self->_detail;
}

- (void)setDetail:(unint64_t)a3
{
  self->_detail = a3;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSNumber)loyaltyBalance
{
  return self->_loyaltyBalance;
}

- (void)setLoyaltyBalance:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSNumber)loyaltyAmount
{
  return self->_loyaltyAmount;
}

- (void)setLoyaltyAmount:(id)a3
{
}

- (NSNumber)cityCode
{
  return self->_cityCode;
}

- (void)setCityCode:(id)a3
{
}

- (NSData)startStation
{
  return self->_startStation;
}

- (void)setStartStation:(id)a3
{
}

- (NSData)endStation
{
  return self->_endStation;
}

- (void)setEndStation:(id)a3
{
}

- (NSArray)amounts
{
  return self->_amounts;
}

- (void)setAmounts:(id)a3
{
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
}

- (NSString)transitDetail
{
  return self->_transitDetail;
}

- (void)setTransitDetail:(id)a3
{
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(int64_t)a3
{
  self->_recordType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitDetail, 0);
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_endStation, 0);
  objc_storeStrong((id *)&self->_startStation, 0);
  objc_storeStrong((id *)&self->_cityCode, 0);
  objc_storeStrong((id *)&self->_loyaltyAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_historySequenceNumber, 0);
}

- (id)concreteTransactionWithCurrency:(id)a3 balanceLabels:(id)a4 unitDictionary:(id)a5 planLabels:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[PKPaymentTransaction paymentTransactionWithSource:1];
  [v14 setOriginatedByDevice:1];
  [v14 setTransactionType:2];
  objc_msgSend(v14, "setTransitType:", -[PKTransitAppletHistoryRecord transitTransactionSubtype](self, "transitTransactionSubtype"));
  objc_msgSend(v14, "setTransitModifiers:", -[PKTransitAppletHistoryRecord transitTransactionModifier](self, "transitTransactionModifier"));
  BOOL v15 = [(PKTransitAppletHistoryRecord *)self startStation];
  [v14 setStartStationCode:v15];

  uint64_t v16 = [(PKTransitAppletHistoryRecord *)self endStation];
  [v14 setEndStationCode:v16];

  uint64_t v17 = [(PKTransitAppletHistoryRecord *)self time];
  [v14 setTransactionDate:v17];

  uint64_t v18 = [(PKTransitAppletHistoryRecord *)self cityCode];
  [v14 setCityCode:v18];

  [v14 setCurrencyCode:v13];
  uint64_t v19 = [(PKTransitAppletHistoryRecord *)self _transactionAmountsWithBalanceLabels:v12 planLabels:v10 unitDictionary:v11];

  [v14 setAmounts:v19];
  uint64_t v20 = [(PKTransitAppletHistoryRecord *)self _transactionCommutePlanUnitsWithPlanLabels:v10];

  [v14 setPlans:v20];
  uint64_t v21 = [(PKTransitAppletHistoryRecord *)self amount];
  uint64_t v22 = [MEMORY[0x1E4F28C28] zero];
  if ([v21 isEqualToNumber:v22])
  {
    if ([(PKTransitAppletHistoryRecord *)self recordType] == 1)
    {

      goto LABEL_9;
    }
    BOOL v23 = [(PKTransitAppletHistoryRecord *)self transitTransactionSubtype] == 1026;
  }
  else
  {
    BOOL v23 = 0;
  }

  if (v21 && !v23) {
    [v14 setAmount:v21];
  }
LABEL_9:

  return v14;
}

- (id)felicaHistoryRecord
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

@end