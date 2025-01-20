@interface PGGraphIngestBusinessItemContainer
- (BOOL)hasRoutineVisit;
- (CLCircularRegion)region;
- (CLSBusinessItem)businessItem;
- (CLSLocationOfInterestVisit)visit;
- (NSArray)businessCategories;
- (NSDateInterval)dateInterval;
- (NSString)name;
- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 dateInterval:(id)a4;
- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4;
- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4 dateInterval:(id)a5;
- (double)routineVisitConfidence;
- (int64_t)venueCapacity;
- (unint64_t)muid;
- (void)updateBusinessItem:(id)a3;
@end

@implementation PGGraphIngestBusinessItemContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_visit, 0);
  objc_storeStrong((id *)&self->_businessItem, 0);
}

- (CLSLocationOfInterestVisit)visit
{
  return self->_visit;
}

- (CLSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (CLCircularRegion)region
{
  return (CLCircularRegion *)[(CLSBusinessItem *)self->_businessItem region];
}

- (int64_t)venueCapacity
{
  return [(CLSBusinessItem *)self->_businessItem venueCapacity];
}

- (double)routineVisitConfidence
{
  [(CLSLocationOfInterestVisit *)self->_visit confidence];
  return result;
}

- (BOOL)hasRoutineVisit
{
  return self->_visit != 0;
}

- (NSDateInterval)dateInterval
{
  dateInterval = [(CLSLocationOfInterestVisit *)self->_visit visitInterval];
  v4 = dateInterval;
  if (!dateInterval) {
    dateInterval = self->_dateInterval;
  }
  v5 = dateInterval;

  return v5;
}

- (NSArray)businessCategories
{
  return (NSArray *)[(CLSBusinessItem *)self->_businessItem businessCategories];
}

- (unint64_t)muid
{
  return [(CLSBusinessItem *)self->_businessItem muid];
}

- (NSString)name
{
  return (NSString *)[(CLSBusinessItem *)self->_businessItem name];
}

- (void)updateBusinessItem:(id)a3
{
  v5 = (CLSBusinessItem *)a3;
  businessItem = self->_businessItem;
  p_businessItem = &self->_businessItem;
  if (businessItem != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_businessItem, a3);
    v5 = v8;
  }
}

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 dateInterval:(id)a4
{
  return [(PGGraphIngestBusinessItemContainer *)self initWithBusinessItem:a3 visit:0 dateInterval:a4];
}

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4
{
  return [(PGGraphIngestBusinessItemContainer *)self initWithBusinessItem:a3 visit:a4 dateInterval:0];
}

- (PGGraphIngestBusinessItemContainer)initWithBusinessItem:(id)a3 visit:(id)a4 dateInterval:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGGraphIngestBusinessItemContainer;
  v12 = [(PGGraphIngestBusinessItemContainer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_businessItem, a3);
    objc_storeStrong((id *)&v13->_visit, a4);
    objc_storeStrong((id *)&v13->_dateInterval, a5);
  }

  return v13;
}

@end