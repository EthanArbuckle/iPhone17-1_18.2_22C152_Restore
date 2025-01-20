@interface PXContextualMemoriesOptions
- (NSDate)peopleProximityDate;
- (PXContextualMemoriesOptions)init;
- (double)accuracy;
- (void)setAccuracy:(double)a3;
- (void)setPeopleProximityDate:(id)a3;
@end

@implementation PXContextualMemoriesOptions

- (void).cxx_destruct
{
}

- (void)setPeopleProximityDate:(id)a3
{
}

- (NSDate)peopleProximityDate
{
  return self->_peopleProximityDate;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (PXContextualMemoriesOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXContextualMemoriesOptions;
  v2 = [(PXContextualMemoriesOptions *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_accuracy = *(double *)MEMORY[0x1E4F1E718];
    v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [v4 startOfDayForDate:v5];
    peopleProximityDate = v3->_peopleProximityDate;
    v3->_peopleProximityDate = (NSDate *)v6;
  }
  return v3;
}

@end