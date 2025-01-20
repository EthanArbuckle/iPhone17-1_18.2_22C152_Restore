@interface PKAccountEvent
+ (BOOL)supportsSecureCoding;
+ (id)accountIdentifierFromRecord:(id)a3;
+ (id)eventIdentifierFromRecordName:(id)a3;
+ (id)recordNameForEventIdentifier:(id)a3;
+ (id)recordNamePrefix;
+ (int64_t)accountEventTypeFromRecord:(id)a3;
- (BOOL)blockNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEvent:(id)a3;
- (BOOL)updateReasonIsInitialDownload;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSSet)items;
- (NSString)accountIdentifier;
- (NSString)altDSID;
- (NSString)identifier;
- (PKAccountEvent)initWithCloudStoreCoder:(id)a3;
- (PKAccountEvent)initWithCoder:(id)a3;
- (id)description;
- (id)primaryIdentifier;
- (id)recordName;
- (id)recordNameForItem:(id)a3;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)updateReasonsDescription;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)updateReasons;
- (void)_encodeServerDataForCloudStoreCoder:(id)a3;
- (void)addUpdateReasons:(unint64_t)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBlockNotification:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItems:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAccountEvent

+ (id)eventIdentifierFromRecordName:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"event-" withString:&stru_1EE0F5368];
}

+ (int64_t)accountEventTypeFromRecord:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  v5 = [v3 recordType];
  v6 = @"AccountEvent";
  if (v5 == v6)
  {

    goto LABEL_8;
  }
  v7 = v6;
  if (!v5 || !v6)
  {

    int64_t v9 = 0;
    goto LABEL_10;
  }
  int v8 = [(__CFString *)v5 isEqualToString:v6];

  if (v8)
  {
LABEL_8:
    objc_msgSend(v4, "pk_encryptedStringForKey:", @"type");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int64_t v9 = PKAccountEventTypeFromString(v5);
LABEL_10:

    goto LABEL_11;
  }
LABEL_6:
  int64_t v9 = 0;
LABEL_11:

  return v9;
}

+ (id)accountIdentifierFromRecord:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  v5 = [v3 recordType];
  v6 = @"AccountEvent";
  if (v5 == v6)
  {

    goto LABEL_8;
  }
  v7 = v6;
  if (v5 && v6)
  {
    int v8 = [(__CFString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_10;
    }
LABEL_8:
    int64_t v9 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"identifier");
    goto LABEL_11;
  }

LABEL_10:
  int64_t v9 = 0;
LABEL_11:

  return v9;
}

- (id)recordName
{
  id v3 = objc_opt_class();
  identifier = self->_identifier;
  return (id)[v3 recordNameForEventIdentifier:identifier];
}

+ (id)recordNameForEventIdentifier:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [a1 recordNamePrefix];
  v7 = [v4 stringWithFormat:@"%@%@", v6, v5];

  return v7;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (BOOL)updateReasonIsInitialDownload
{
  return (self->_updateReasons & 3) != 0;
}

- (id)updateReasonsDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t updateReasons = self->_updateReasons;
  if (updateReasons)
  {
    int v5 = 1;
    for (unint64_t i = 1; i <= updateReasons; unint64_t i = 1 << v5++)
    {
      if ((i & updateReasons) != 0)
      {
        if (i == 1)
        {
          v7 = @"InitialCloudKitSync";
          goto LABEL_8;
        }
        if (i == 2)
        {
          v7 = @"FetchAllRecords";
LABEL_8:
          [v3 addObject:v7];
          unint64_t updateReasons = self->_updateReasons;
        }
      }
    }
  }
  int v8 = [v3 description];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAccountEvent;
  int v5 = [(PKAccountEvent *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_blockNotification = [v4 decodeBoolForKey:@"blockNotification"];
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v35, "setWithObjects:", v34, v33, v32, v31, v30, v29, v28, v16, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSSet *)v25;

    v5->_unint64_t updateReasons = [v4 decodeIntegerForKey:@"updateReasons"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeBool:self->_blockNotification forKey:@"blockNotification"];
  [v5 encodeObject:self->_items forKey:@"items"];
  [v5 encodeInteger:self->_updateReasons forKey:@"updateReasons"];
}

- (PKAccountEvent)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountEvent;
  id v5 = [(PKAccountEvent *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(PKAccountEvent *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }

  return v6;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 recordsWithRecordType:@"AccountEvent"];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    objc_msgSend(v6, "pk_encryptedStringForKey:", @"identifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v7;

    objc_msgSend(v6, "pk_encryptedStringForKey:", @"accountIdentifier");
    int64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v9;

    objc_msgSend(v6, "pk_encryptedStringForKey:", @"altDSID");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    altDSID = self->_altDSID;
    self->_altDSID = v11;

    objc_msgSend(v6, "pk_encryptedDateForKey:", @"expirationDate");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    expirationDate = self->_expirationDate;
    self->_expirationDate = v13;

    objc_msgSend(v6, "pk_encryptedDateForKey:", @"date");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v15;

    uint64_t v17 = objc_msgSend(v6, "pk_encryptedStringForKey:", @"type");
    self->_type = PKAccountEventTypeFromString(v17);

    v75 = v6;
    v77 = self;
    self->_blockNotification = objc_msgSend(v6, "pk_encryptedBoolForKey:", @"blockNotification");
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v76 = v4;
    id obj = [v4 records];
    uint64_t v19 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (!v19) {
      goto LABEL_131;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v80;
    v74 = @"AssistanceProgram";
    while (1)
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v80 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v79 + 1) + 8 * v22);
        objc_msgSend(v23, "recordType", v74);
        v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = v24;
        if (v24 == @"Rewards")
        {

LABEL_13:
          v27 = PKAccountRewards;
          goto LABEL_30;
        }
        if (@"Rewards" && v24)
        {
          int v26 = [(__CFString *)v24 isEqualToString:@"Rewards"];

          if (v26) {
            goto LABEL_13;
          }
        }
        else
        {
        }
        uint64_t v28 = v25;
        if (v28 == @"Statement")
        {

LABEL_21:
          v27 = PKCreditAccountStatement;
          goto LABEL_30;
        }
        uint64_t v29 = v28;
        if (@"Statement" && v25)
        {
          int v30 = [(__CFString *)v28 isEqualToString:@"Statement"];

          if (v30) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        uint64_t v31 = v29;
        if (v31 == @"Servicing")
        {

LABEL_29:
          v27 = PKAccountServicingEvent;
          goto LABEL_30;
        }
        uint64_t v32 = v31;
        if (@"Servicing" && v25)
        {
          int v33 = -[__CFString isEqualToString:](v31, "isEqualToString:");

          if (v33) {
            goto LABEL_29;
          }
        }
        else
        {
        }
        v35 = v32;
        if (v35 == @"Payment")
        {

LABEL_42:
          uint64_t v34 = [[PKAccountPayment alloc] initWithRecord:v23];
          unint64_t v38 = [(PKAccountEvent *)v77 type] - 5;
          if (v38 <= 3)
          {
            v39 = &unk_191675618;
            goto LABEL_53;
          }
LABEL_31:
          [v18 addObject:v34];
LABEL_32:

          goto LABEL_33;
        }
        objc_super v36 = v35;
        if (@"Payment" && v25)
        {
          int v37 = -[__CFString isEqualToString:](v35, "isEqualToString:");

          if (v37) {
            goto LABEL_42;
          }
        }
        else
        {
        }
        v40 = v36;
        if (v40 == @"Transfer")
        {

LABEL_51:
          uint64_t v34 = [[PKAccountTransfer alloc] initWithRecord:v23];
          unint64_t v38 = [(PKAccountEvent *)v77 type] - 19;
          if (v38 > 5) {
            goto LABEL_31;
          }
          v39 = &unk_191675638;
LABEL_53:
          uint64_t v43 = v39[v38];
LABEL_54:
          [(PKAccountPayment *)v34 setState:v43];
          goto LABEL_31;
        }
        v41 = v40;
        if (@"Transfer" && v25)
        {
          int v42 = -[__CFString isEqualToString:](v40, "isEqualToString:");

          if (v42) {
            goto LABEL_51;
          }
        }
        else
        {
        }
        v44 = v41;
        if (v44 == @"AccountHold")
        {

LABEL_62:
          uint64_t v34 = [[PKAccountHold alloc] initWithRecord:v23];
          uint64_t v47 = [(PKAccountEvent *)v77 type];
          if (v47 == 25)
          {
            uint64_t v43 = 1;
          }
          else
          {
            if (v47 != 26) {
              goto LABEL_31;
            }
            uint64_t v43 = 2;
          }
          goto LABEL_54;
        }
        v45 = v44;
        if (@"AccountHold" && v25)
        {
          int v46 = -[__CFString isEqualToString:](v44, "isEqualToString:");

          if (v46) {
            goto LABEL_62;
          }
        }
        else
        {
        }
        v48 = v45;
        if (v48 == @"PaymentReminder")
        {

LABEL_73:
          v27 = PKAccountPaymentReminder;
LABEL_30:
          uint64_t v34 = (PKAccountPayment *)[[v27 alloc] initWithRecord:v23];
          goto LABEL_31;
        }
        v49 = v48;
        if (@"PaymentReminder" && v25)
        {
          int v50 = -[__CFString isEqualToString:](v48, "isEqualToString:");

          if (v50) {
            goto LABEL_73;
          }
        }
        else
        {
        }
        v51 = v49;
        if (v51 == @"CreditTermsUpdate")
        {

LABEL_81:
          v27 = PKAccountCreditTermsUpdate;
          goto LABEL_30;
        }
        v52 = v51;
        if (@"CreditTermsUpdate" && v25)
        {
          int v53 = -[__CFString isEqualToString:](v51, "isEqualToString:");

          if (v53) {
            goto LABEL_81;
          }
        }
        else
        {
        }
        v54 = v52;
        if (v54 == @"PhysicalCardStatusUpdate")
        {

LABEL_89:
          v27 = PKAccountPhysicalCardStatusUpdate;
          goto LABEL_30;
        }
        v55 = v54;
        if (@"PhysicalCardStatusUpdate" && v25)
        {
          int v56 = -[__CFString isEqualToString:](v54, "isEqualToString:");

          if (v56) {
            goto LABEL_89;
          }
        }
        else
        {
        }
        v57 = v55;
        if (v57 == @"PhysicalCardShippingUpdate")
        {

LABEL_97:
          v27 = PKAccountPhysicalCardShippingUpdate;
          goto LABEL_30;
        }
        v58 = v57;
        if (@"PhysicalCardShippingUpdate" && v25)
        {
          int v59 = -[__CFString isEqualToString:](v57, "isEqualToString:");

          if (v59) {
            goto LABEL_97;
          }
        }
        else
        {
        }
        v60 = v58;
        if (v60 == @"VirtualCardStatusUpdate")
        {

LABEL_105:
          v27 = PKAccountVirtualCardStatusUpdate;
          goto LABEL_30;
        }
        v61 = v60;
        if (@"VirtualCardStatusUpdate" && v25)
        {
          int v62 = -[__CFString isEqualToString:](v60, "isEqualToString:");

          if (v62) {
            goto LABEL_105;
          }
        }
        else
        {
        }
        v63 = v61;
        if (v63 == @"BillPaymentSelectedSuggestedAmount")
        {

LABEL_113:
          v27 = PKBillPaymentSelectedSuggestedAmountData;
          goto LABEL_30;
        }
        v64 = v63;
        if (@"BillPaymentSelectedSuggestedAmount" && v25)
        {
          int v65 = -[__CFString isEqualToString:](v63, "isEqualToString:");

          if (v65) {
            goto LABEL_113;
          }
        }
        else
        {
        }
        v66 = v64;
        if (v66 == @"UserInfo")
        {

LABEL_121:
          v27 = PKAccountUserInfoUpdate;
          goto LABEL_30;
        }
        v67 = v66;
        if (@"UserInfo" && v25)
        {
          int v68 = -[__CFString isEqualToString:](v66, "isEqualToString:");

          if (v68) {
            goto LABEL_121;
          }
        }
        else
        {
        }
        v69 = v67;
        if (v69 == v74)
        {

LABEL_129:
          v27 = PKAccountAssistanceProgramMessage;
          goto LABEL_30;
        }
        uint64_t v34 = (PKAccountPayment *)v69;
        if (!v74 || !v25) {
          goto LABEL_32;
        }
        int v70 = -[__CFString isEqualToString:](v69, "isEqualToString:");

        if (v70) {
          goto LABEL_129;
        }
LABEL_33:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v71 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
      uint64_t v20 = v71;
      if (!v71)
      {
LABEL_131:

        uint64_t v72 = [v18 copy];
        items = v77->_items;
        v77->_items = (NSSet *)v72;

        uint64_t v6 = v75;
        id v4 = v76;
        break;
      }
    }
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if (a4 - 1 <= 1) {
    [(PKAccountEvent *)self _encodeServerDataForCloudStoreCoder:a3];
  }
}

- (void)_encodeServerDataForCloudStoreCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v4 = [v27 recordsWithRecordType:@"AccountEvent"];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 encryptedValues];
  [v6 setObject:self->_identifier forKey:@"identifier"];
  [v6 setObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v6 setObject:self->_altDSID forKey:@"altDSID"];
  [v6 setObject:self->_date forKey:@"date"];
  [v6 setObject:self->_expirationDate forKey:@"expirationDate"];
  v7 = PKAccountEventTypeToString(self->_type);
  [v6 setObject:v7 forKey:@"type"];

  objc_super v8 = [NSNumber numberWithBool:self->_blockNotification];
  v24 = v6;
  [v6 setObject:v8 forKey:@"blockNotification"];

  int64_t v9 = [v5 recordID];
  uint64_t v28 = [v9 zoneID];

  uint64_t v25 = v5;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecord:v5 action:1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v11 = self;
  id obj = self->_items;
  uint64_t v12 = [(NSSet *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        id v17 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        id v18 = [(PKAccountEvent *)v11 recordNameForItem:v16];
        uint64_t v19 = (void *)[v17 initWithRecordName:v18 zoneID:v28];

        id v20 = objc_alloc(MEMORY[0x1E4F1A2D8]);
        uint64_t v21 = [(id)objc_opt_class() recordType];
        uint64_t v22 = (void *)[v20 initWithRecordType:v21 recordID:v19];

        uint64_t v23 = [v22 valuesByKey];
        [v23 setObject:v10 forKey:@"accountEventReference"];

        [v16 encodeWithRecord:v22];
        if (v22) {
          [v27 addRecord:v22];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSSet *)obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  int v26 = @"AccountEvent";
  id v5 = NSString;
  uint64_t v6 = [(id)objc_opt_class() recordNamePrefix];
  v7 = [v5 stringWithFormat:@"%@%@", v6, self->_identifier];
  v27[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [v4 addObject:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v9 = self->_items;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = [(id)objc_opt_class() recordType];
        uint64_t v23 = v15;
        uint64_t v16 = [(PKAccountEvent *)self recordNameForItem:v14];
        v24 = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v4 addObject:v17];
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }

  return v4;
}

- (id)recordNameForItem:(id)a3
{
  id v4 = NSString;
  id v5 = [(id)objc_opt_class() recordNamePrefix];
  uint64_t v6 = [v4 stringWithFormat:@"%@%@", v5, self->_identifier];

  return v6;
}

- (id)primaryIdentifier
{
  return self->_identifier;
}

- (unint64_t)itemType
{
  return 5;
}

+ (id)recordNamePrefix
{
  return @"event-";
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_altDSID];
  [v3 safelyAddObject:self->_expirationDate];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_items];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_blockNotification - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountEvent *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountEvent *)self isEqualToAccountEvent:v5];

  return v6;
}

- (BOOL)isEqualToAccountEvent:(id)a3
{
  uint64_t v4 = a3;
  identifier = self->_identifier;
  BOOL v6 = (NSString *)v4[2];
  if (identifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (identifier != v6) {
      goto LABEL_36;
    }
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  accountIdentifier = self->_accountIdentifier;
  int64_t v9 = (NSString *)v4[3];
  if (accountIdentifier && v9)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (accountIdentifier != v9)
  {
    goto LABEL_36;
  }
  altDSID = self->_altDSID;
  uint64_t v11 = (NSString *)v4[4];
  if (altDSID && v11)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (altDSID != v11)
  {
    goto LABEL_36;
  }
  expirationDate = self->_expirationDate;
  uint64_t v13 = (NSDate *)v4[7];
  if (expirationDate && v13)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (expirationDate != v13)
  {
    goto LABEL_36;
  }
  date = self->_date;
  uint64_t v15 = (NSDate *)v4[6];
  if (date && v15)
  {
    if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0) {
      goto LABEL_36;
    }
  }
  else if (date != v15)
  {
    goto LABEL_36;
  }
  items = self->_items;
  id v17 = (NSSet *)v4[8];
  if (!items || !v17)
  {
    if (items == v17) {
      goto LABEL_34;
    }
LABEL_36:
    BOOL v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSSet isEqual:](items, "isEqual:") & 1) == 0) {
    goto LABEL_36;
  }
LABEL_34:
  if (self->_type != v4[5]) {
    goto LABEL_36;
  }
  BOOL v18 = self->_blockNotification == *((unsigned __int8 *)v4 + 8);
LABEL_37:

  return v18;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"account identifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"altDSID: '%@'; ", self->_altDSID];
  uint64_t v4 = PKAccountEventTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  int64_t v5 = [(NSDate *)self->_date description];
  [v3 appendFormat:@"date: '%@'; ", v5];

  BOOL v6 = [(NSDate *)self->_expirationDate description];
  [v3 appendFormat:@"expiration date: '%@'; ", v6];

  BOOL v7 = [(NSSet *)self->_items description];
  [v3 appendFormat:@"items: '%@'; ", v7];

  if (self->_blockNotification) {
    objc_super v8 = @"YES";
  }
  else {
    objc_super v8 = @"NO";
  }
  [v3 appendFormat:@"blockNotification: '%@'; ", v8];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end