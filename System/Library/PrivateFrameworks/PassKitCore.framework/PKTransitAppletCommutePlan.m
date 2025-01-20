@interface PKTransitAppletCommutePlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommutePlan:(id)a3;
- (NSDate)expirationDate;
- (NSDate)startDate;
- (NSString)identifier;
- (NSString)uniqueIdentifier;
- (PKTransitAppletCommutePlan)initWithCoder:(id)a3;
- (PKTransitAppletCommutePlan)initWithDictionary:(id)a3;
- (PKTransitAppletCommutePlan)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expirationDate:(id)a6 status:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation PKTransitAppletCommutePlan

- (BOOL)isEqual:(id)a3
{
  v4 = (PKTransitAppletCommutePlan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransitAppletCommutePlan *)self isEqualToCommutePlan:v5];

  return v6;
}

- (BOOL)isEqualToCommutePlan:(id)a3
{
  v4 = a3;
  if (v4)
  {
    identifier = self->_identifier;
    BOOL v6 = (NSString *)v4[1];
    if (identifier) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (identifier == v6) {
        goto LABEL_10;
      }
    }
    else
    {
      char v9 = -[NSString isEqual:](identifier, "isEqual:");
      if (v9)
      {
LABEL_10:
        v10 = [(PKTransitAppletCommutePlan *)self uniqueIdentifier];
        uint64_t v11 = [v4 uniqueIdentifier];
        v12 = (void *)v11;
        if (v10 && v11)
        {
          if (([v10 isEqual:v11] & 1) == 0) {
            goto LABEL_25;
          }
        }
        else if (v10 != (void *)v11)
        {
          goto LABEL_25;
        }
        startDate = self->_startDate;
        v14 = (NSDate *)v4[4];
        if (startDate && v14)
        {
          if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
            goto LABEL_25;
          }
        }
        else if (startDate != v14)
        {
          goto LABEL_25;
        }
        expirationDate = self->_expirationDate;
        v16 = (NSDate *)v4[5];
        if (expirationDate && v16)
        {
          if (-[NSDate isEqual:](expirationDate, "isEqual:"))
          {
LABEL_23:
            BOOL v8 = self->_status == v4[3];
LABEL_26:

            goto LABEL_27;
          }
        }
        else if (expirationDate == v16)
        {
          goto LABEL_23;
        }
LABEL_25:
        BOOL v8 = 0;
        goto LABEL_26;
      }
    }
  }
  BOOL v8 = 0;
LABEL_27:

  return v8;
}

- (id)description
{
  v3 = NSString;
  identifier = self->_identifier;
  uint64_t v5 = [(PKTransitAppletCommutePlan *)self uniqueIdentifier];
  BOOL v6 = (void *)v5;
  unint64_t v7 = self->_status - 1;
  if (v7 > 3) {
    BOOL v8 = @"unknown";
  }
  else {
    BOOL v8 = off_1E56EDF00[v7];
  }
  char v9 = [v3 stringWithFormat:@"Applet Plan: %@ %@ %@ %@ %@", identifier, v5, self->_startDate, self->_expirationDate, v8];

  return v9;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier) {
    uniqueIdentifier = self->_identifier;
  }
  v3 = uniqueIdentifier;
  return v3;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  v4 = [(PKTransitAppletCommutePlan *)self uniqueIdentifier];
  [v3 safelyAddObject:v4];

  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_expirationDate];
  uint64_t v5 = PKCombinedHash(17, v3);
  unint64_t v6 = self->_status - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletCommutePlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletCommutePlan;
  uint64_t v5 = [(PKTransitAppletCommutePlan *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  uint64_t v5 = [(PKTransitAppletCommutePlan *)self uniqueIdentifier];
  [v6 encodeObject:v5 forKey:@"UniqueIdentifier"];

  [v6 encodeObject:self->_startDate forKey:@"startDate"];
  [v6 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v6 encodeInteger:self->_status forKey:@"status"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(PKTransitAppletCommutePlan *)self uniqueIdentifier];
  uint64_t v9 = [v8 copyWithZone:a3];
  uint64_t v10 = (void *)v5[2];
  v5[2] = v9;

  uint64_t v11 = [(NSDate *)self->_startDate copyWithZone:a3];
  uint64_t v12 = (void *)v5[4];
  v5[4] = v11;

  uint64_t v13 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  v14 = (void *)v5[5];
  v5[5] = v13;

  v5[3] = self->_status;
  return v5;
}

- (PKTransitAppletCommutePlan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKTransitAppletCommutePlan;
  uint64_t v5 = [(PKTransitAppletCommutePlan *)&v20 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [v4 objectForKeyedSubscript:@"CommutePlanIdentifier"];
    uint64_t v8 = [v7 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"CommutePlanUniqueIdentifier"];
    uint64_t v11 = [v10 copy];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v11;

    v6->_status = [v4 PKIntegerForKey:@"ContractStatus"];
    uint64_t v13 = [v4 PKDateComponentsForKey:@"CommutePlanValidityStartDate"];
    uint64_t v14 = PKDateFromDateComponents(v13);
    startDate = v6->_startDate;
    v6->_startDate = (NSDate *)v14;

    v16 = [v4 PKDateComponentsForKey:@"CommutePlanValidityEndDate"];
    uint64_t v17 = PKDateFromDateComponents(v16);
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v17;
  }
  return v6;
}

- (PKTransitAppletCommutePlan)initWithIdentifier:(id)a3 uniqueIdentifier:(id)a4 startDate:(id)a5 expirationDate:(id)a6 status:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKTransitAppletCommutePlan;
  v16 = [(PKTransitAppletCommutePlan *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v19;

    uint64_t v21 = PKDateFromDateComponents(v14);
    startDate = v16->_startDate;
    v16->_startDate = (NSDate *)v21;

    uint64_t v23 = PKDateFromDateComponents(v15);
    expirationDate = v16->_expirationDate;
    v16->_expirationDate = (NSDate *)v23;

    v16->_status = a7;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end