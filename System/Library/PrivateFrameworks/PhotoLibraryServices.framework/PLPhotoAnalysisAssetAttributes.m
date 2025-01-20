@interface PLPhotoAnalysisAssetAttributes
+ (id)entityName;
+ (id)fetchRequest;
@end

@implementation PLPhotoAnalysisAssetAttributes

+ (id)entityName
{
  return @"PhotoAnalysisAssetAttributes";
}

+ (id)fetchRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  v4 = [a1 entityName];
  v5 = (void *)[v3 initWithEntityName:v4];

  return v5;
}

@end