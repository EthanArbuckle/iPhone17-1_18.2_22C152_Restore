@interface RoutePlanningTiming
+ (RoutePlanningTiming)timingWithArrivalDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5;
+ (RoutePlanningTiming)timingWithDepartureDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5;
+ (RoutePlanningTiming)timingWithTimePoint:(GEOTimepoint *)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5;
+ (RoutePlanningTiming)timingWithUserInfo:(id)a3;
+ (id)leaveNowTiming;
- (BOOL)isDepartNow;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoutePlanningTiming:(id)a3;
- (GEOTimepoint)timepoint;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSTimeZone)arrivalTimeZone;
- (NSTimeZone)bestTimeZone;
- (NSTimeZone)departureTimeZone;
- (RoutePlanningTiming)initWithDepartureDate:(id)a3 arrivalDate:(id)a4 departureTimeZone:(id)a5 arrivalTimeZone:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation RoutePlanningTiming

- (RoutePlanningTiming)initWithDepartureDate:(id)a3 arrivalDate:(id)a4 departureTimeZone:(id)a5 arrivalTimeZone:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RoutePlanningTiming;
  v14 = [(RoutePlanningTiming *)&v25 init];
  if (v14)
  {
    v15 = (NSDate *)[v10 copy];
    departureDate = v14->_departureDate;
    v14->_departureDate = v15;

    v17 = (NSDate *)[v11 copy];
    arrivalDate = v14->_arrivalDate;
    v14->_arrivalDate = v17;

    v19 = (NSTimeZone *)[v12 copy];
    departureTimeZone = v14->_departureTimeZone;
    v14->_departureTimeZone = v19;

    v21 = (NSTimeZone *)[v13 copy];
    arrivalTimeZone = v14->_arrivalTimeZone;
    v14->_arrivalTimeZone = v21;

    v23 = v14;
  }

  return v14;
}

+ (id)leaveNowTiming
{
  id v2 = [objc_alloc((Class)a1) initWithDepartureDate:0 arrivalDate:0 departureTimeZone:0 arrivalTimeZone:0];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RoutePlanningTiming *)self departureDate];
  v6 = [(RoutePlanningTiming *)self arrivalDate];
  v7 = [(RoutePlanningTiming *)self departureTimeZone];
  v8 = [(RoutePlanningTiming *)self arrivalTimeZone];
  id v9 = [v4 initWithDepartureDate:v5 arrivalDate:v6 departureTimeZone:v7 arrivalTimeZone:v8];

  return v9;
}

+ (RoutePlanningTiming)timingWithDepartureDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithDepartureDate:v10 arrivalDate:0 departureTimeZone:v9 arrivalTimeZone:v8];

  return (RoutePlanningTiming *)v11;
}

+ (RoutePlanningTiming)timingWithArrivalDate:(id)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithDepartureDate:0 arrivalDate:v10 departureTimeZone:v9 arrivalTimeZone:v8];

  return (RoutePlanningTiming *)v11;
}

+ (RoutePlanningTiming)timingWithTimePoint:(GEOTimepoint *)a3 departureTimeZone:(id)a4 arrivalTimeZone:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((~*(unsigned char *)&a3->var3 & 6) != 0)
  {
    id v14 = 0;
    id v13 = 0;
    goto LABEL_16;
  }
  int var2 = a3->var2;
  id v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var1];
  id v12 = v11;
  if (var2 == 1)
  {
    id v14 = v11;
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  if (var2)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315650;
      v21 = "+[RoutePlanningTiming timingWithTimePoint:departureTimeZone:arrivalTimeZone:]";
      __int16 v22 = 2080;
      v23 = "RoutePlanningTiming.m";
      __int16 v24 = 1024;
      int v25 = 65;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        int v20 = 138412290;
        v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
      }
    }
    id v14 = 0;
    goto LABEL_14;
  }
  id v13 = v11;
  id v14 = 0;
LABEL_15:

LABEL_16:
  id v18 = [objc_alloc((Class)a1) initWithDepartureDate:v13 arrivalDate:v14 departureTimeZone:v8 arrivalTimeZone:v9];

  return (RoutePlanningTiming *)v18;
}

- (BOOL)isDepartNow
{
  return !self->_departureDate && self->_arrivalDate == 0;
}

- (NSTimeZone)bestTimeZone
{
  if (self->_arrivalDate) {
    [(RoutePlanningTiming *)self arrivalTimeZone];
  }
  else {
  id v2 = [(RoutePlanningTiming *)self departureTimeZone];
  }

  return (NSTimeZone *)v2;
}

- (BOOL)isEqualToRoutePlanningTiming:(id)a3
{
  v6 = (RoutePlanningTiming *)a3;
  v7 = v6;
  if (v6)
  {
    if (self != v6)
    {
      id v8 = [(RoutePlanningTiming *)self departureDate];
      if (v8
        || ([(RoutePlanningTiming *)v7 departureDate],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(RoutePlanningTiming *)self departureDate];
        id v9 = [(RoutePlanningTiming *)v7 departureDate];
        unsigned __int8 v10 = [v4 isEqualToDate:v9];

        if (v8)
        {
LABEL_11:

          id v12 = [(RoutePlanningTiming *)self arrivalDate];
          if (v12
            || ([(RoutePlanningTiming *)v7 arrivalDate],
                (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v13 = [(RoutePlanningTiming *)self arrivalDate];
            id v14 = [(RoutePlanningTiming *)v7 arrivalDate];
            unsigned __int8 v15 = [v13 isEqualToDate:v14];

            if (v12)
            {
LABEL_17:

              v16 = [(RoutePlanningTiming *)self departureTimeZone];
              uint64_t v17 = [(RoutePlanningTiming *)v7 departureTimeZone];
              unsigned __int8 v18 = [v16 _navigation_hasSameOffsetFromGMTAsTimeZone:v17];

              v19 = [(RoutePlanningTiming *)self arrivalTimeZone];
              int v20 = [(RoutePlanningTiming *)v7 arrivalTimeZone];
              LOBYTE(v17) = [v19 _navigation_hasSameOffsetFromGMTAsTimeZone:v20];

              char v11 = v10 & v15 & v18 & v17;
              goto LABEL_18;
            }
          }
          else
          {
            unsigned __int8 v15 = 1;
          }

          goto LABEL_17;
        }
      }
      else
      {
        unsigned __int8 v10 = 1;
      }

      goto LABEL_11;
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(RoutePlanningTiming *)self isEqualToRoutePlanningTiming:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(RoutePlanningTiming *)self departureDate];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(RoutePlanningTiming *)self arrivalDate];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(RoutePlanningTiming *)self departureTimeZone];
  unint64_t v8 = (unint64_t)[v7 hash];
  id v9 = [(RoutePlanningTiming *)self arrivalTimeZone];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (GEOTimepoint)timepoint
{
  retstr->var0 = 0.0;
  retstr->var1 = 0.0;
  *(void *)&retstr->int var2 = 0;
  result = (GEOTimepoint *)self->_departureDate;
  if (result)
  {
    *(unsigned char *)&retstr->var3 = 4;
  }
  else
  {
    result = (GEOTimepoint *)self->_arrivalDate;
    if (!result) {
      return result;
    }
    *(unsigned char *)&retstr->var3 = 4;
    retstr->int var2 = 1;
  }
  result = (GEOTimepoint *)[(GEOTimepoint *)result timeIntervalSinceReferenceDate];
  *(unsigned char *)&retstr->var3 = 6;
  retstr->var1 = v6;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p - departure: %@, arrival: %@, departureTimeZone: %@, arrivalTimeZone: %@>", objc_opt_class(), self, self->_departureDate, self->_arrivalDate, self->_departureTimeZone, self->_arrivalTimeZone];
}

- (NSTimeZone)departureTimeZone
{
  departureTimeZone = self->_departureTimeZone;
  if (!departureTimeZone)
  {
    unint64_t v4 = +[NSTimeZone localTimeZone];
    BOOL v5 = self->_departureTimeZone;
    self->_departureTimeZone = v4;

    departureTimeZone = self->_departureTimeZone;
  }

  return departureTimeZone;
}

- (NSTimeZone)arrivalTimeZone
{
  arrivalTimeZone = self->_arrivalTimeZone;
  if (!arrivalTimeZone)
  {
    unint64_t v4 = +[NSTimeZone localTimeZone];
    BOOL v5 = self->_arrivalTimeZone;
    self->_arrivalTimeZone = v4;

    arrivalTimeZone = self->_arrivalTimeZone;
  }

  return arrivalTimeZone;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalTimeZone, 0);

  objc_storeStrong((id *)&self->_departureTimeZone, 0);
}

+ (RoutePlanningTiming)timingWithUserInfo:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "+[RoutePlanningTiming(DirectionsUserInfo) timingWithUserInfo:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "RoutePlanningPreferences+DirectionsUserInfo.m";
      *(_WORD *)&buf[22] = 1024;
      int v23 = 46;
      __int16 v24 = 2080;
      int v25 = "userInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unsigned __int8 v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  unint64_t v4 = [v3 objectForKeyedSubscript:@"GEOURLTimePoint"];

  if (v4)
  {
    BOOL v5 = [v3 objectForKeyedSubscript:@"GEOURLTimePoint"];
    if ([v5 hasTime])
    {
      [v5 time];
      uint64_t v7 = v6;
      uint8_t v8 = 2;
    }
    else
    {
      uint8_t v8 = 0;
      uint64_t v7 = 0;
    }
    if (![v5 hasType]) {
      goto LABEL_12;
    }
    unsigned int v10 = [v5 type];
    if (!v10)
    {
      int v11 = 0;
      v8 |= 4u;
      goto LABEL_16;
    }
    if (v10 == 1)
    {
      v8 |= 4u;
      int v11 = 1;
    }
    else
    {
LABEL_12:
      int v11 = 0;
    }
LABEL_16:
    *(void *)buf = 0;
    *(void *)&buf[8] = v7;
    *(_DWORD *)&buf[16] = v11;
    buf[20] = v8;
    *(_WORD *)&buf[21] = 0;
    buf[23] = 0;
    unsigned __int8 v15 = +[RoutePlanningTiming timingWithTimePoint:buf departureTimeZone:0 arrivalTimeZone:0];

    goto LABEL_17;
  }
  id v9 = [v3 objectForKeyedSubscript:@"DirectionsDepartureDateKey"];
  if (v9)
  {

LABEL_14:
    memset(buf, 0, sizeof(buf));
    id v13 = [v3 objectForKeyedSubscript:@"DirectionsDepartureDateKey"];
    id v14 = [v3 objectForKeyedSubscript:@"DirectionsArrivalDateKey"];
    sub_100620928((uint64_t)buf, v13, v14);

    long long v20 = *(_OWORD *)buf;
    uint64_t v21 = *(void *)&buf[16];
    unsigned __int8 v15 = +[RoutePlanningTiming timingWithTimePoint:&v20 departureTimeZone:0 arrivalTimeZone:0];
    goto LABEL_17;
  }
  id v12 = [v3 objectForKeyedSubscript:@"DirectionsArrivalDateKey"];

  if (v12) {
    goto LABEL_14;
  }
  unsigned __int8 v15 = 0;
LABEL_17:

  return (RoutePlanningTiming *)v15;
}

@end