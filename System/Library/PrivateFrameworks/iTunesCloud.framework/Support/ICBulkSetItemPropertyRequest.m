@interface ICBulkSetItemPropertyRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5;
+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5;
- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6;
- (id)_bodyDataForItemIDs:(id)a3 properties:(id)a4 useLongIDs:(BOOL)a5;
- (id)_bodyDataForItemKind:(unsigned __int8)a3 cloudLibraryIDs:(id)a4 properties:(id)a5;
@end

@implementation ICBulkSetItemPropertyRequest

- (id)_bodyDataForItemKind:(unsigned __int8)a3 cloudLibraryIDs:(id)a4 properties:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  +[ICDAAPPropertyInfo sharedItemPropertyInfo];
  v13 = v6;
  v15 = v14 = v7;
  id v8 = v15;
  id v9 = v7;
  id v10 = v6;
  v11 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v11;
}

- (id)_bodyDataForItemIDs:(id)a3 properties:(id)a4 useLongIDs:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  +[ICDAAPPropertyInfo sharedItemPropertyInfo];
  v13 = v6;
  v15 = v14 = v7;
  id v8 = v15;
  id v9 = v7;
  id v10 = v6;
  v11 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v11;
}

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:@"databases/%u/edit", v6];
  v14.receiver = self;
  v14.super_class = (Class)ICBulkSetItemPropertyRequest;
  v11 = [(ICDRequest *)&v14 initWithAction:v10];

  if (v11)
  {
    [(ICDRequest *)v11 setMethod:1];
    v12 = [(ICBulkSetItemPropertyRequest *)v11 _bodyDataForItemKind:7 cloudLibraryIDs:v8 properties:v9];
    [(ICDRequest *)v11 setBodyData:v12];
  }
  return v11;
}

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSString stringWithFormat:@"databases/%u/edit", v6];
  v14.receiver = self;
  v14.super_class = (Class)ICBulkSetItemPropertyRequest;
  v11 = [(ICDRequest *)&v14 initWithAction:v10];

  if (v11)
  {
    [(ICDRequest *)v11 setMethod:1];
    v12 = [(ICBulkSetItemPropertyRequest *)v11 _bodyDataForItemKind:6 cloudLibraryIDs:v8 properties:v9];
    [(ICDRequest *)v11 setBodyData:v12];
  }
  return v11;
}

- (ICBulkSetItemPropertyRequest)initWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[NSString stringWithFormat:@"databases/%u/items/edit", v8];
  v16.receiver = self;
  v16.super_class = (Class)ICBulkSetItemPropertyRequest;
  v13 = [(ICDRequest *)&v16 initWithAction:v12];

  if (v13)
  {
    [(ICDRequest *)v13 setMethod:1];
    objc_super v14 = [(ICBulkSetItemPropertyRequest *)v13 _bodyDataForItemIDs:v10 properties:v11 useLongIDs:v6];
    [(ICDRequest *)v13 setBodyData:v14];
  }
  return v13;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 albumCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 albumCloudLibraryIDs:v8 properties:v7];

  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 albumArtistCloudLibraryIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 albumArtistCloudLibraryIDs:v8 properties:v7];

  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 itemIDs:(id)a4 properties:(id)a5 useLongIDs:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v8 itemIDs:v10 properties:v9 useLongIDs:v6];

  return v11;
}

@end