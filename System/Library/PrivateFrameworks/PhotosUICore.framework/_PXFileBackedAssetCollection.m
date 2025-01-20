@interface _PXFileBackedAssetCollection
- (BOOL)isAggregation;
- (BOOL)isEnriched;
- (BOOL)isEnrichmentComplete;
- (BOOL)isRecent;
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)localizedDateDescription;
- (NSString)localizedDebugDescription;
- (NSString)localizedShortDateDescription;
- (NSString)localizedSmartDescription;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)uuid;
- (double)promotionScore;
- (id)localizedDateDescriptionWithOptions:(unint64_t)a3;
- (int64_t)px_highlightKind;
- (unint64_t)estimatedAssetCount;
- (unsigned)px_highlightEnrichmentState;
@end

@implementation _PXFileBackedAssetCollection

- (unint64_t)estimatedAssetCount
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

- (NSDate)endDate
{
  return 0;
}

- (NSDate)startDate
{
  return 0;
}

- (NSString)localizedSmartDescription
{
  return 0;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXFileBackedAssetsDataSource.m" lineNumber:72 description:@"This code path is not implemented."];

  abort();
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

- (NSString)localizedTitle
{
  return 0;
}

- (double)promotionScore
{
  return 0.0;
}

- (int64_t)px_highlightKind
{
  return -1;
}

- (unsigned)px_highlightEnrichmentState
{
  return 0;
}

- (BOOL)isEnrichmentComplete
{
  return 0;
}

- (BOOL)isEnriched
{
  return 0;
}

- (NSString)uuid
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"%@-%p", v5, self];

  return (NSString *)v6;
}

@end