@interface PowerUIChargeSession
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)endSoC;
- (NSNumber)startSoC;
- (PowerUIChargeSession)initWithStartDate:(id)a3 withEndDate:(id)a4 withStartSoC:(id)a5 withEndSoC:(id)a6;
- (double)duration;
- (id)description;
@end

@implementation PowerUIChargeSession

- (PowerUIChargeSession)initWithStartDate:(id)a3 withEndDate:(id)a4 withStartSoC:(id)a5 withEndSoC:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PowerUIChargeSession;
  v15 = [(PowerUIChargeSession *)&v21 init];
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

- (id)description
{
  return (id)[NSString stringWithFormat:@"Start: %@ (SoC: %@) - End: %@ (SoC: %@) (duration: %f) - ", self->_startDate, self->_startSoC, self->_endDate, self->_endSoC, *(void *)&self->_duration];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
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