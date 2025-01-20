@interface ICBulkRemovePlaylistRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4;
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
@end

@implementation ICBulkRemovePlaylistRequest

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v4 sagaIDs:v5 itemKind:1];

  return v6;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = +[NSNumber numberWithUnsignedInt:v4];
  v11 = v7;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [v6 initWithDatabaseID:v5 sagaIDs:v8 itemKind:1];

  return v9;
}

@end