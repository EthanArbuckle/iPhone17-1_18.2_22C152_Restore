@interface PPMockRTLocationOfInterestVisit
+ (id)mockLocationOfInterestVisitWithEntryDate:(id)a3 exitDate:(id)a4;
- (NSDate)entryDate;
- (NSDate)exitDate;
- (void)setEntryDate:(id)a3;
- (void)setExitDate:(id)a3;
@end

@implementation PPMockRTLocationOfInterestVisit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
}

- (void)setExitDate:(id)a3
{
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)setEntryDate:(id)a3
{
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

+ (id)mockLocationOfInterestVisitWithEntryDate:(id)a3 exitDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setEntryDate:v6];

  [v7 setExitDate:v5];
  return v7;
}

@end