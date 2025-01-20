@interface RTVisitDecoded
- (BOOL)completeVisit;
- (BOOL)noVisit;
- (BOOL)partialVisit;
- (NSDate)entryDate;
- (NSDate)exitDate;
- (NSNumber)outputType;
- (RTVisitDecoded)init;
- (RTVisitDecoded)initWithEntryDate:(id)a3 exitDate:(id)a4 logProbability:(double)a5;
- (double)logProbability;
- (id)description;
- (void)setEntryDate:(id)a3;
- (void)setExitDate:(id)a3;
- (void)setLogProbability:(double)a3;
@end

@implementation RTVisitDecoded

- (RTVisitDecoded)init
{
  return [(RTVisitDecoded *)self initWithEntryDate:0 exitDate:0 logProbability:0.0];
}

- (RTVisitDecoded)initWithEntryDate:(id)a3 exitDate:(id)a4 logProbability:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTVisitDecoded;
  v11 = [(RTVisitDecoded *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entryDate, a3);
    objc_storeStrong((id *)&v12->_exitDate, a4);
    v12->_logProbability = a5;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  double logProbability = self->_logProbability;
  v5 = [(NSDate *)self->_entryDate stringFromDate];
  v6 = [(NSDate *)self->_exitDate stringFromDate];
  v7 = [v3 stringWithFormat:@"logProbability=%f, entryDate=%@, exitDate=%@", *(void *)&logProbability, v5, v6];

  return v7;
}

- (BOOL)completeVisit
{
  return self->_entryDate && self->_exitDate != 0;
}

- (BOOL)partialVisit
{
  return self->_entryDate && self->_exitDate == 0;
}

- (BOOL)noVisit
{
  return !self->_entryDate && self->_exitDate == 0;
}

- (NSNumber)outputType
{
  if ([(RTVisitDecoded *)self noVisit])
  {
    uint64_t v3 = 0;
LABEL_7:
    v4 = [NSNumber numberWithInt:v3];
    goto LABEL_8;
  }
  if ([(RTVisitDecoded *)self partialVisit])
  {
    uint64_t v3 = 2;
    goto LABEL_7;
  }
  if ([(RTVisitDecoded *)self completeVisit])
  {
    uint64_t v3 = 3;
    goto LABEL_7;
  }
  v4 = 0;
LABEL_8:

  return (NSNumber *)v4;
}

- (double)logProbability
{
  return self->_logProbability;
}

- (void)setLogProbability:(double)a3
{
  self->_double logProbability = a3;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)setExitDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDate, 0);

  objc_storeStrong((id *)&self->_entryDate, 0);
}

@end