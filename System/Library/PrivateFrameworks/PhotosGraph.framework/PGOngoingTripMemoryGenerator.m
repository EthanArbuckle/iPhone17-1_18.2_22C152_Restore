@interface PGOngoingTripMemoryGenerator
+ (id)tripTypeNodesInGraph:(id)a3;
+ (unint64_t)memoryCategory;
+ (unint64_t)memoryCategorySubcategory;
@end

@implementation PGOngoingTripMemoryGenerator

+ (id)tripTypeNodesInGraph:(id)a3
{
  return +[PGGraphHighlightTypeNodeCollection onGoingTripTypeNodesInGraph:a3];
}

+ (unint64_t)memoryCategorySubcategory
{
  return 12003;
}

+ (unint64_t)memoryCategory
{
  return 31;
}

@end