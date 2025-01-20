@interface PKTransitAppletPlan
+ (BOOL)supportsSecureCoding;
- (NSDate)expirationDate;
- (NSString)commutePlanIdentifier;
- (PKTransitAppletPlan)initWithCoder:(id)a3;
- (PKTransitAppletPlan)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCommutePlanIdentifier:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation PKTransitAppletPlan

- (PKTransitAppletPlan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitAppletPlan;
  v5 = [(PKTransitAppletPlan *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [v4 objectForKeyedSubscript:@"CommutePlanIdentifier"];
    uint64_t v8 = [v7 copy];
    commutePlanIdentifier = v6->_commutePlanIdentifier;
    v6->_commutePlanIdentifier = (NSString *)v8;

    v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v11 = [v4 objectForKeyedSubscript:@"CommutePlanExpirationDate"];
    uint64_t v12 = [v10 dateFromComponents:v11];
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v12;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_commutePlanIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  commutePlanIdentifier = self->_commutePlanIdentifier;
  id v5 = a3;
  [v5 encodeObject:commutePlanIdentifier forKey:@"commutePlanIdentifier"];
  [v5 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (PKTransitAppletPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransitAppletPlan;
  id v5 = [(PKTransitAppletPlan *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commutePlanIdentifier"];
    commutePlanIdentifier = v5->_commutePlanIdentifier;
    v5->_commutePlanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;
  }
  return v5;
}

- (NSString)commutePlanIdentifier
{
  return self->_commutePlanIdentifier;
}

- (void)setCommutePlanIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_commutePlanIdentifier, 0);
}

@end