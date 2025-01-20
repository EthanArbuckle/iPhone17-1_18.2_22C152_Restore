@interface ICBulkSetContainerPropertyRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5;
- (ICBulkSetContainerPropertyRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5;
- (id)_bodyDataForContainerIDs:(id)a3 properties:(id)a4;
@end

@implementation ICBulkSetContainerPropertyRequest

- (id)_bodyDataForContainerIDs:(id)a3 properties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[ICDAAPPropertyInfo sharedContainerPropertyInfo];
  v12 = v5;
  v14 = v13 = v6;
  id v7 = v14;
  id v8 = v6;
  id v9 = v5;
  v10 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v10;
}

- (ICBulkSetContainerPropertyRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSString stringWithFormat:@"databases/%u/containers/edit", v6];
  v14.receiver = self;
  v14.super_class = (Class)ICBulkSetContainerPropertyRequest;
  v11 = [(ICDRequest *)&v14 initWithAction:v10];

  if (v11)
  {
    [(ICDRequest *)v11 setMethod:1];
    v12 = [(ICBulkSetContainerPropertyRequest *)v11 _bodyDataForContainerIDs:v8 properties:v9];
    [(ICDRequest *)v11 setBodyData:v12];
  }
  return v11;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4 properties:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v6 containerIDs:v8 properties:v7];

  return v9;
}

@end