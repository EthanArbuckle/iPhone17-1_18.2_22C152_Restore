@interface PKPassShareTimeConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassShareTimeConfiguration:(id)a3;
- (NSArray)schedules;
- (NSDate)expirationDate;
- (NSDate)startDate;
- (PKPassShareTimeConfiguration)initWithCoder:(id)a3;
- (PKPassShareTimeConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intersect:(id)a3;
- (unint64_t)hash;
- (unint64_t)support;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setSchedules:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSupport:(unint64_t)a3;
@end

@implementation PKPassShareTimeConfiguration

- (PKPassShareTimeConfiguration)initWithDictionary:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKPassShareTimeConfiguration;
  self = [(PKPassShareTimeConfiguration *)&v21 init];
  if (self)
  {
    v5 = [v4 PKStringForKey:@"timeSupport"];
    self->_support = PKPassShareTimeConfigurationSupportFromString(v5);

    v6 = [v4 PKDateForKey:@"startDate"];
    startDate = self->_startDate;
    self->_startDate = v6;

    v8 = [v4 PKDateForKey:@"expirationDate"];
    expirationDate = self->_expirationDate;
    self->_expirationDate = v8;

    v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"schedules"];
    objc_msgSend(v10, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_103);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    schedules = self->_schedules;
    self->_schedules = v11;

    uint64_t v13 = [v4 PKDictionaryForKey:@"schedule"];
    v14 = (void *)v13;
    if (!self->_schedules && v13)
    {
      v15 = [[PKPassShareTimeSchedule alloc] initWithDictionary:v13];
      v16 = v15;
      if (v15)
      {
        v22[0] = v15;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        v18 = self->_schedules;
        self->_schedules = v17;
      }
    }
    if (self->_support || self->_startDate || self->_expirationDate || self->_schedules)
    {

      goto LABEL_13;
    }

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
LABEL_13:
  self = self;
  v19 = self;
LABEL_16:

  return v19;
}

PKPassShareTimeSchedule *__51__PKPassShareTimeConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPassShareTimeSchedule alloc] initWithDictionary:v2];

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  unint64_t v5 = self->_support - 1;
  if (v5 > 2) {
    v6 = @"none";
  }
  else {
    v6 = off_1E56E7C00[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"timeSupport"];
  startDate = self->_startDate;
  if (startDate)
  {
    v8 = PKW3CDateStringFromDate(startDate);
    [v4 setObject:v8 forKeyedSubscript:@"startDate"];
  }
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    v10 = PKW3CDateStringFromDate(expirationDate);
    [v4 setObject:v10 forKeyedSubscript:@"expirationDate"];
  }
  v11 = [(NSArray *)self->_schedules pk_arrayByApplyingBlock:&__block_literal_global_43_1];
  [v4 setObject:v11 forKeyedSubscript:@"schedules"];

  v12 = (void *)[v4 copy];
  return v12;
}

uint64_t __56__PKPassShareTimeConfiguration_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEmpty
{
  return !self->_startDate && !self->_expirationDate && [(NSArray *)self->_schedules count] == 0;
}

- (id)intersect:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = self;
    goto LABEL_40;
  }
  unint64_t v5 = self->_startDate;
  v6 = (NSDate *)*((id *)v4 + 2);
  v7 = v6;
  if ((v5 != 0) == (v6 != 0))
  {
    v9 = [(NSDate *)v5 laterDate:v6];
  }
  else
  {
    if (v5) {
      v8 = v5;
    }
    else {
      v8 = v6;
    }
    v9 = v8;
  }
  v11 = v9;
  v12 = self->_expirationDate;
  id v13 = *((id *)v4 + 3);
  v14 = v13;
  if ((v12 != 0) == (v13 != 0))
  {
    v16 = [v13 earlierDate:v13];
  }
  else
  {
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = v7;
    }
    v16 = v15;
  }
  v17 = v16;
  if (v11 && v16 && [(NSDate *)v11 compare:v16] == NSOrderedDescending)
  {
    v18 = PKLogFacilityTypeGetObject(0x21uLL);
    v36 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      __int16 v40 = 2112;
      id v41 = v4;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKPassShareTimeConfiguration: Intersected time configurations and found start date after expiration date. \n lhs: %@ \n\n rhs: %@", buf, 0x16u);
    }
    id v19 = 0;
    v10 = 0;
    goto LABEL_39;
  }
  uint64_t v20 = [(NSArray *)self->_schedules firstObject];
  uint64_t v21 = [*((id *)v4 + 4) firstObject];
  v35 = (void *)v21;
  v36 = (void *)v20;
  if ((v20 != 0) == (v21 != 0))
  {
    if (v20 | v21)
    {
      id v19 = [(id)v20 intersect:v21];
      if (!v19)
      {
        v23 = PKLogFacilityTypeGetObject(0x21uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v39 = (PKPassShareTimeConfiguration *)v20;
          __int16 v40 = 2112;
          id v41 = v35;
          _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "PKPassShareTimeConfiguration: Intersected schedules and found no common schedule. \n lhs: %@ \n\n rhs: %@", buf, 0x16u);
        }

        id v19 = 0;
        v10 = 0;
        goto LABEL_38;
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = (void *)v21;
    }
    id v19 = v22;
  }
  v10 = objc_alloc_init(PKPassShareTimeConfiguration);
  [(PKPassShareTimeConfiguration *)v10 setStartDate:v11];
  [(PKPassShareTimeConfiguration *)v10 setExpirationDate:v17];
  if (v19)
  {
    id v37 = v19;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v34 = self;
    id v24 = v4;
    v25 = v17;
    v26 = v14;
    v27 = v12;
    v28 = v11;
    v29 = v7;
    v31 = v30 = v5;
    [(PKPassShareTimeConfiguration *)v10 setSchedules:v31];

    unint64_t v5 = v30;
    v7 = v29;
    v11 = v28;
    v12 = v27;
    v14 = v26;
    v17 = v25;
    id v4 = v24;
    self = v34;
  }
  if (self->_support >= *((void *)v4 + 1)) {
    unint64_t support = *((void *)v4 + 1);
  }
  else {
    unint64_t support = self->_support;
  }
  [(PKPassShareTimeConfiguration *)v10 setSupport:support];
LABEL_38:

LABEL_39:
LABEL_40:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareTimeConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassShareTimeConfiguration;
  unint64_t v5 = [(PKPassShareTimeConfiguration *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"support"];
    v5->_unint64_t support = PKPassShareTimeConfigurationSupportFromString(v6);

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"schedules"];
    schedules = v5->_schedules;
    v5->_schedules = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = self->_support - 1;
  if (v4 > 2) {
    unint64_t v5 = @"none";
  }
  else {
    unint64_t v5 = off_1E56E7C00[v4];
  }
  id v6 = a3;
  [v6 encodeObject:v5 forKey:@"support"];
  [v6 encodeObject:self->_startDate forKey:@"startDate"];
  [v6 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v6 encodeObject:self->_schedules forKey:@"schedules"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@; ", v5];

  unint64_t v7 = self->_support - 1;
  if (v7 > 2) {
    v8 = @"none";
  }
  else {
    v8 = off_1E56E7C00[v7];
  }
  [v6 appendFormat:@"support: '%@'; ", v8];
  [v6 appendFormat:@"startDate: '%@'; ", self->_startDate];
  [v6 appendFormat:@"expirationDate: '%@'; ", self->_expirationDate];
  [v6 appendFormat:@"schedules: '%@'; ", self->_schedules];
  [v6 appendFormat:@">"];
  uint64_t v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = v3;
  if (self->_startDate) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_expirationDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_schedules) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_support - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPassShareTimeConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassShareTimeConfiguration *)self isEqualToPassShareTimeConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToPassShareTimeConfiguration:(id)a3
{
  unint64_t v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  startDate = self->_startDate;
  BOOL v6 = (NSDate *)v4[2];
  if (startDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (startDate != v6) {
      goto LABEL_17;
    }
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  expirationDate = self->_expirationDate;
  uint64_t v9 = (NSDate *)v4[3];
  if (!expirationDate || !v9)
  {
    if (expirationDate == v9) {
      goto LABEL_13;
    }
LABEL_17:
    char v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  schedules = self->_schedules;
  v11 = (NSArray *)v4[4];
  if (schedules && v11) {
    char v12 = -[NSArray isEqual:](schedules, "isEqual:");
  }
  else {
    char v12 = schedules == v11;
  }
LABEL_18:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[PKPassShareTimeConfiguration allocWithZone:a3] init];
  v4->_unint64_t support = self->_support;
  uint64_t v5 = [(NSDate *)self->_startDate copy];
  startDate = v4->_startDate;
  v4->_startDate = (NSDate *)v5;

  uint64_t v7 = [(NSDate *)self->_expirationDate copy];
  expirationDate = v4->_expirationDate;
  v4->_expirationDate = (NSDate *)v7;

  uint64_t v9 = [(NSArray *)self->_schedules pk_arrayByApplyingBlock:&__block_literal_global_72_2];
  schedules = v4->_schedules;
  v4->_schedules = (NSArray *)v9;

  return v4;
}

id __45__PKPassShareTimeConfiguration_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];
  return v2;
}

- (unint64_t)support
{
  return self->_support;
}

- (void)setSupport:(unint64_t)a3
{
  self->_unint64_t support = a3;
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

- (NSArray)schedules
{
  return self->_schedules;
}

- (void)setSchedules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end