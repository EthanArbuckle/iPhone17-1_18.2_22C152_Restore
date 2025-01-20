@interface PPEventQuery
+ (BOOL)supportsSecureCoding;
- (NSDate)fromDate;
- (NSDate)toDate;
- (PPEventQuery)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFromDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation PPEventQuery

- (NSDate)toDate
{
  return self->_toDate;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)encodeWithCoder:(id)a3
{
  fromDate = self->_fromDate;
  id v5 = a3;
  [v5 encodeObject:fromDate forKey:@"fdt"];
  [v5 encodeObject:self->_toDate forKey:@"tdt"];
}

- (void)setToDate:(id)a3
{
}

- (void)setFromDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
}

- (PPEventQuery)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPEventQuery;
  id v5 = [(PPEventQuery *)&v16 init];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fdt"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tdt"];
  v8 = (NSDate *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    fromDate = v5->_fromDate;
    v5->_fromDate = v6;
    v13 = v6;

    toDate = v5->_toDate;
    v5->_toDate = v8;

LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
  v10 = pp_events_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_error_impl(&dword_18CAA6000, v10, OS_LOG_TYPE_ERROR, "failed to decode fromDate or toDate from %@", buf, 0xCu);
  }

  v11 = 0;
LABEL_11:

  return v11;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPEventQuery f:%@ t:%@>", self->_fromDate, self->_toDate];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end