@interface PGGraphCelebratingEdgeCollection
+ (Class)edgeClass;
- (PGGraphHolidayNodeCollection)holidayNodes;
@end

@implementation PGGraphCelebratingEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphHolidayNodeCollection)holidayNodes
{
  return (PGGraphHolidayNodeCollection *)+[MANodeCollection targetNodesOfEdges:self];
}

@end