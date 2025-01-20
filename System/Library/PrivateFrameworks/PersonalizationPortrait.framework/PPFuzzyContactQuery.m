@interface PPFuzzyContactQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFuzzyContactQuery:(id)a3;
- (BOOL)onlyAddressBook;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)sourceBundleIds;
- (PPFuzzyContactQuery)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setOnlyAddressBook:(BOOL)a3;
- (void)setSourceBundleIds:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PPFuzzyContactQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sourceBundleIds, 0);
}

- (void)setOnlyAddressBook:(BOOL)a3
{
  self->_onlyAddressBook = a3;
}

- (BOOL)onlyAddressBook
{
  return self->_onlyAddressBook;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setSourceBundleIds:(id)a3
{
}

- (NSSet)sourceBundleIds
{
  return self->_sourceBundleIds;
}

- (BOOL)isEqualToFuzzyContactQuery:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  sourceBundleIds = self->_sourceBundleIds;
  v7 = (NSSet *)v4[2];
  if (sourceBundleIds == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = sourceBundleIds;
    char v10 = [(NSSet *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_12;
    }
  }
  startDate = self->_startDate;
  v12 = (NSDate *)v5[3];
  if (startDate == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = startDate;
    char v15 = [(NSDate *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
  endDate = self->_endDate;
  v17 = (NSDate *)v5[4];
  if (endDate == v17)
  {

    goto LABEL_14;
  }
  v18 = v17;
  v19 = endDate;
  char v20 = [(NSDate *)v19 isEqual:v18];

  if (v20)
  {
LABEL_14:
    BOOL v21 = self->_onlyAddressBook == *((unsigned __int8 *)v5 + 8);
    goto LABEL_15;
  }
LABEL_12:
  BOOL v21 = 0;
LABEL_15:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPFuzzyContactQuery *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPFuzzyContactQuery *)self isEqualToFuzzyContactQuery:v5];

  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPFuzzyContactQuery ids:'%@' s:'%@' e:'%@' ab:'%d'>", self->_sourceBundleIds, self->_startDate, self->_endDate, self->_onlyAddressBook];
  return v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_sourceBundleIds hash];
  uint64_t v4 = [(NSDate *)self->_startDate hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_endDate hash] - v4 + 32 * v4;
  BOOL v6 = [NSNumber numberWithBool:self->_onlyAddressBook];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[PPFuzzyContactQuery allocWithZone:a3] init];
  [(PPFuzzyContactQuery *)v4 setSourceBundleIds:self->_sourceBundleIds];
  [(PPFuzzyContactQuery *)v4 setStartDate:self->_startDate];
  [(PPFuzzyContactQuery *)v4 setEndDate:self->_endDate];
  [(PPFuzzyContactQuery *)v4 setOnlyAddressBook:self->_onlyAddressBook];
  return v4;
}

- (PPFuzzyContactQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  BOOL v6 = (void *)MEMORY[0x1E4F93B90];
  unint64_t v7 = (void *)MEMORY[0x192F97350]();
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = objc_opt_class();
  char v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  v11 = pp_contacts_log_handle();
  v12 = [v6 robustDecodeObjectOfClasses:v10 forKey:@"bids" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v11];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  char v15 = pp_contacts_log_handle();
  v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"sd" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v15];

  v17 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v18 = objc_opt_class();
  v19 = pp_contacts_log_handle();
  char v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"ed" withCoder:v4 expectNonNull:0 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v19];

  BOOL v21 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v22 = objc_opt_class();
  v23 = pp_contacts_log_handle();
  v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"ab" withCoder:v4 expectNonNull:1 errorDomain:@"PPErrorDomain" errorCode:23 logHandle:v23];

  if (v24)
  {
    [v5 setSourceBundleIds:v12];
    [v5 setStartDate:v16];
    [v5 setEndDate:v20];
    objc_msgSend(v5, "setOnlyAddressBook:", objc_msgSend(v24, "BOOLValue"));
    v25 = v5;
  }
  else
  {
    v26 = pp_contacts_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18CAA6000, v26, OS_LOG_TYPE_ERROR, "PPFuzzyContactQuery: decoding failed for address book state", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  sourceBundleIds = self->_sourceBundleIds;
  id v5 = a3;
  [v5 encodeObject:sourceBundleIds forKey:@"bids"];
  [v5 encodeObject:self->_startDate forKey:@"sd"];
  [v5 encodeObject:self->_endDate forKey:@"ed"];
  id v6 = [NSNumber numberWithBool:self->_onlyAddressBook];
  [v5 encodeObject:v6 forKey:@"ab"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end