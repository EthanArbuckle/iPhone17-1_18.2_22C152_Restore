@interface ICBulkItemArtworkInfoRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5;
@end

@implementation ICBulkItemArtworkInfoRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 useLongIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 cloudIDs:v7 itemKind:2 useLongIDs:v5];

  return v8;
}

@end