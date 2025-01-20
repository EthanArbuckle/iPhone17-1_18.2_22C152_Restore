@interface QUSpans
- (NSArray)locationNameRanges;
- (NSArray)peopleNameRanges;
- (void)setLocationNameRanges:(id)a3;
- (void)setPeopleNameRanges:(id)a3;
@end

@implementation QUSpans

- (NSArray)peopleNameRanges
{
  return self->_peopleNameRanges;
}

- (void)setPeopleNameRanges:(id)a3
{
}

- (NSArray)locationNameRanges
{
  return self->_locationNameRanges;
}

- (void)setLocationNameRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNameRanges, 0);
  objc_storeStrong((id *)&self->_peopleNameRanges, 0);
}

@end