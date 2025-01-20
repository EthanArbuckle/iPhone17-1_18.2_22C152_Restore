@interface PXBaseDisplayAssetCollection
- (BOOL)isAggregation;
- (BOOL)isEnriched;
- (BOOL)isEnrichmentComplete;
- (BOOL)isRecent;
- (NSArray)localizedLocationNames;
- (NSString)localizedDateDescription;
- (NSString)localizedDebugDescription;
- (NSString)localizedShortDateDescription;
- (NSString)localizedSmartDescription;
- (NSString)localizedSubtitle;
- (NSString)uuid;
- (double)promotionScore;
- (id)localizedDateDescriptionWithOptions:(unint64_t)a3;
- (int64_t)px_highlightKind;
- (unint64_t)estimatedAssetCount;
- (unsigned)px_highlightEnrichmentState;
@end

@implementation PXBaseDisplayAssetCollection

- (unint64_t)estimatedAssetCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  return 0;
}

- (NSString)localizedSmartDescription
{
  return 0;
}

- (NSString)localizedShortDateDescription
{
  return 0;
}

- (NSString)localizedDateDescription
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (NSString)localizedDebugDescription
{
  return 0;
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)@"base";
}

- (int64_t)px_highlightKind
{
  return -1;
}

- (unsigned)px_highlightEnrichmentState
{
  return 0;
}

- (BOOL)isRecent
{
  return 0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (double)promotionScore
{
  return 0.0;
}

- (BOOL)isEnrichmentComplete
{
  return 1;
}

- (BOOL)isEnriched
{
  return 0;
}

@end