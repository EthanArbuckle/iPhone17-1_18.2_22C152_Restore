@interface CRTrackingAssociatorResults
- (NSArray)addedRegionIDs;
- (NSArray)removedRegionIDs;
- (NSArray)tracked;
- (NSArray)updatedRegionIDs;
- (double)totalError;
- (void)initWithTotalError:(void *)a3 tracked:(void *)a4 updatedRegionIDs:(void *)a5 removedRegionIDs:(double)a6 addedRegionIDs:;
- (void)setAddedRegionIDs:(id)a3;
- (void)setRemovedRegionIDs:(id)a3;
- (void)setTotalError:(double)a3;
- (void)setTracked:(id)a3;
- (void)setUpdatedRegionIDs:(id)a3;
@end

@implementation CRTrackingAssociatorResults

- (void)initWithTotalError:(void *)a3 tracked:(void *)a4 updatedRegionIDs:(void *)a5 removedRegionIDs:(double)a6 addedRegionIDs:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)CRTrackingAssociatorResults;
    id v15 = objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      [v15 setTotalError:a6];
      [a1 setTracked:v11];
      [a1 setUpdatedRegionIDs:v12];
      [a1 setRemovedRegionIDs:v13];
      [a1 setAddedRegionIDs:v14];
    }
  }

  return a1;
}

- (double)totalError
{
  return self->_totalError;
}

- (void)setTotalError:(double)a3
{
  self->_totalError = a3;
}

- (NSArray)tracked
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTracked:(id)a3
{
}

- (NSArray)updatedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedRegionIDs:(id)a3
{
}

- (NSArray)removedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRemovedRegionIDs:(id)a3
{
}

- (NSArray)addedRegionIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAddedRegionIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedRegionIDs, 0);
  objc_storeStrong((id *)&self->_removedRegionIDs, 0);
  objc_storeStrong((id *)&self->_updatedRegionIDs, 0);
  objc_storeStrong((id *)&self->_tracked, 0);
}

@end