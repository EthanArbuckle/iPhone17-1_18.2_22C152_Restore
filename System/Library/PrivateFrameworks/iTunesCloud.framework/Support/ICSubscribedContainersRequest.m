@interface ICSubscribedContainersRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
- (ICSubscribedContainersRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4;
- (id)_bodyDataForContainerIDs:(id)a3;
@end

@implementation ICSubscribedContainersRequest

- (id)_bodyDataForContainerIDs:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  v4 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v4;
}

- (ICSubscribedContainersRequest)initWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"databases/%u/subscribed-containers", v4];
  v11.receiver = self;
  v11.super_class = (Class)ICSubscribedContainersRequest;
  v8 = [(ICDRequest *)&v11 initWithAction:v7];

  if (v8)
  {
    [(ICDRequest *)v8 setMethod:1];
    v9 = [(ICSubscribedContainersRequest *)v8 _bodyDataForContainerIDs:v6];
    [(ICDRequest *)v8 setBodyData:v9];
  }
  return v8;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerIDs:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:v4 containerIDs:v5];

  return v6;
}

@end