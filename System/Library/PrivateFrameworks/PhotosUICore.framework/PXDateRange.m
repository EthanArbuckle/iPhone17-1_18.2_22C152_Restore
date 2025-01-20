@interface PXDateRange
- (BOOL)intersectsRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStrictlyBeforeRange:(id)a3;
- (PXDateRange)initWithStartDate:(double)a3 endDate:(double)a4;
- (double)endDate;
- (double)startDate;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXDateRange

- (double)endDate
{
  return self->_endDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PXDateRange;
  v4 = [(PXDateRange *)&v11 description];
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(PXDateRange *)self startDate];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  [(PXDateRange *)self endDate];
  v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = [v3 stringWithFormat:@"<%@ startDate=%@, endDate=%@>", v4, v6, v8];

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)fabs(self->_endDate) ^ (unint64_t)fabs(self->_startDate);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXDateRange *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(PXDateRange *)self startDate], double v6 = v5, [(PXDateRange *)v4 startDate], v6 == v7))
    {
      [(PXDateRange *)self endDate];
      double v9 = v8;
      [(PXDateRange *)v4 endDate];
      BOOL v11 = v9 == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isStrictlyBeforeRange:(id)a3
{
  id v4 = a3;
  double startDate = self->_startDate;
  [v4 startDate];
  if (startDate <= v6)
  {
    double endDate = self->_endDate;
    [v4 startDate];
    BOOL v7 = endDate <= v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4 = a3;
  double startDate = self->_startDate;
  [v4 endDate];
  if (startDate <= v6)
  {
    double endDate = self->_endDate;
    [v4 startDate];
    BOOL v7 = endDate >= v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PXDateRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  if (a3 > a4)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXDateRangeSet.m", 16, @"Invalid parameter not satisfying: %@", @"startDate <= endDate" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXDateRange;
  result = [(PXDateRange *)&v10 init];
  if (result)
  {
    result->_double startDate = a3;
    result->_double endDate = a4;
  }
  return result;
}

@end