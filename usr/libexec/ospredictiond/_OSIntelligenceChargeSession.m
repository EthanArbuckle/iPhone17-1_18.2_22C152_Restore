@interface _OSIntelligenceChargeSession
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)endSoC;
- (NSNumber)startSoC;
- (NSString)description;
- (_OSIntelligenceChargeSession)initWithStartDate:(id)a3 withEndDate:(id)a4 withStartSoC:(id)a5 withEndSoC:(id)a6;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _OSIntelligenceChargeSession

- (_OSIntelligenceChargeSession)initWithStartDate:(id)a3 withEndDate:(id)a4 withStartSoC:(id)a5 withEndSoC:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_OSIntelligenceChargeSession;
  v15 = [(_OSIntelligenceChargeSession *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
    objc_storeStrong((id *)&v16->_startSoC, a5);
    objc_storeStrong((id *)&v16->_endSoC, a6);
    [v12 timeIntervalSinceReferenceDate];
    double v18 = v17;
    [v11 timeIntervalSinceReferenceDate];
    v16->_duration = v18 - v19;
  }

  return v16;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"Start: %@ (SoC: %@) - End: %@ (SoC: %@) (duration: %f) - ", self->_startDate, self->_startSoC, self->_endDate, self->_endSoC, *(void *)&self->_duration];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_OSIntelligenceChargeSession *)self startDate];
  id v6 = [v5 copy];
  v7 = [(_OSIntelligenceChargeSession *)self endDate];
  id v8 = [v7 copy];
  v9 = [(_OSIntelligenceChargeSession *)self startSoC];
  id v10 = [v9 copy];
  id v11 = [(_OSIntelligenceChargeSession *)self endSoC];
  id v12 = [v11 copy];
  id v13 = [v4 initWithStartDate:v6 withEndDate:v8 withStartSoC:v10 withEndSoC:v12];

  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSNumber)startSoC
{
  return self->_startSoC;
}

- (NSNumber)endSoC
{
  return self->_endSoC;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endSoC, 0);
  objc_storeStrong((id *)&self->_startSoC, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end