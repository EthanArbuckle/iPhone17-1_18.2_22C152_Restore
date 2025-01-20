@interface PPTripPart
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForTripMode:(unsigned __int8)a3;
- (CLPlacemark)mainLocation;
- (NSArray)eventIdentifiers;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)endLocation;
- (NSString)fallbackLocationString;
- (NSString)startLocation;
- (PPTripPart)initWithCoder:(id)a3;
- (PPTripPart)initWithStartDate:(id)a3 endDate:(id)a4 eventIdentifiers:(id)a5 mode:(unsigned __int8)a6 location:(id)a7 fallbackLocationString:(id)a8;
- (id)description;
- (id)destinationString;
- (unsigned)tripMode;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackLocationString:(id)a3;
- (void)setMainLocation:(id)a3;
@end

@implementation PPTripPart

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLocationString, 0);
  objc_storeStrong((id *)&self->_mainLocation, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
}

- (unsigned)tripMode
{
  return self->_tripMode;
}

- (void)setFallbackLocationString:(id)a3
{
}

- (NSString)fallbackLocationString
{
  return self->_fallbackLocationString;
}

- (void)setMainLocation:(id)a3
{
}

- (CLPlacemark)mainLocation
{
  return self->_mainLocation;
}

- (NSString)endLocation
{
  return self->_endLocation;
}

- (NSString)startLocation
{
  return self->_startLocation;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 setDateFormat:@"d MMM yyyy"];
  id v4 = [NSString alloc];
  v5 = objc_msgSend((id)objc_opt_class(), "descriptionForTripMode:", -[PPTripPart tripMode](self, "tripMode"));
  v6 = [(PPTripPart *)self destinationString];
  v7 = [(PPTripPart *)self startDate];
  v8 = [v3 stringFromDate:v7];
  v9 = [(PPTripPart *)self endDate];
  v10 = [v3 stringFromDate:v9];
  v11 = (void *)[v4 initWithFormat:@"[%@] %@, %@ -> %@ ", v5, v6, v8, v10];

  return v11;
}

- (id)destinationString
{
  v3 = [(PPTripPart *)self mainLocation];

  if (v3)
  {
    id v4 = [(PPTripPart *)self mainLocation];
    v5 = [v4 locality];

    v6 = [(PPTripPart *)self mainLocation];
    v7 = [v6 country];

    if (v5 && v7)
    {
      v8 = (__CFString *)[[NSString alloc] initWithFormat:@"%@, %@", v5, v7];
LABEL_11:
      v10 = v8;

      goto LABEL_13;
    }
    if (v5)
    {
      v8 = v5;
      goto LABEL_11;
    }
    if (v7)
    {
      v8 = v7;
      goto LABEL_11;
    }
  }
  else
  {
    v9 = [(PPTripPart *)self fallbackLocationString];

    if (v9)
    {
      v10 = [(PPTripPart *)self fallbackLocationString];
      goto LABEL_13;
    }
  }
  v10 = &stru_1EDA56F70;
LABEL_13:
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"sdt"];
  [v5 encodeObject:self->_endDate forKey:@"edt"];
  [v5 encodeInt32:self->_tripMode forKey:@"tpm"];
  [v5 encodeObject:self->_eventIdentifiers forKey:@"eid"];
  [v5 encodeObject:self->_mainLocation forKey:@"tploc"];
  [v5 encodeObject:self->_fallbackLocationString forKey:@"tpfallloc"];
}

- (PPTripPart)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"sdt"];
  v8 = [v4 decodeObjectOfClass:v6 forKey:@"edt"];
  unsigned __int8 v9 = [v4 decodeInt32ForKey:@"tpm"];
  v10 = (void *)MEMORY[0x192F97350]();
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"eid"];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tploc"];
  v16 = [v4 decodeObjectOfClass:v5 forKey:@"tpfallloc"];
  v17 = 0;
  if (v7 && v8 && v14)
  {
    self = [(PPTripPart *)self initWithStartDate:v7 endDate:v8 eventIdentifiers:v14 mode:v9 location:v15 fallbackLocationString:v16];
    v17 = self;
  }

  return v17;
}

- (PPTripPart)initWithStartDate:(id)a3 endDate:(id)a4 eventIdentifiers:(id)a5 mode:(unsigned __int8)a6 location:(id)a7 fallbackLocationString:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PPTripPart;
  v18 = [(PPTripPart *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_eventIdentifiers, a5);
    v19->_tripMode = a6;
    objc_storeStrong((id *)&v19->_mainLocation, a7);
    objc_storeStrong((id *)&v19->_fallbackLocationString, a8);
  }

  return v19;
}

+ (id)descriptionForTripMode:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 < 9u) {
    return off_1E550F750[a3];
  }
  uint64_t v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_fault_impl(&dword_18CAA6000, v5, OS_LOG_TYPE_FAULT, "PPScoredEvent::descriptionForTripMode, unsupported trip mode: %hhu", (uint8_t *)v6, 8u);
  }

  return @"Unknown";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end