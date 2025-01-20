@interface CLDurianJourneyStats
- (CLDurianJourneyStats)init;
- (id)description;
- (int64_t)journeyCount;
- (void)dealloc;
- (void)setJourneyCount:(int64_t)a3;
@end

@implementation CLDurianJourneyStats

- (CLDurianJourneyStats)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianJourneyStats;
  result = [(CLDurianJourneyStats *)&v3 init];
  if (result) {
    result->_journeyCount = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLDurianJourneyStats;
  [(CLDurianJourneyStats *)&v2 dealloc];
}

- (id)description
{
  objc_super v2 = +[NSNumber numberWithInteger:[(CLDurianJourneyStats *)self journeyCount]];

  return [(NSNumber *)v2 stringValue];
}

- (int64_t)journeyCount
{
  return self->_journeyCount;
}

- (void)setJourneyCount:(int64_t)a3
{
  self->_journeyCount = a3;
}

@end