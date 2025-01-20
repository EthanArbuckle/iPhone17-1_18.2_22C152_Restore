@interface ICBulkRemoveRequest
- (ICBulkRemoveRequest)initWithDatabaseID:(unsigned int)a3 sagaIDs:(id)a4 itemKind:(unsigned __int8)a5;
- (id)_bodyDataForSagaIDs:(id)a3 itemKind:(unsigned __int8)a4;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation ICBulkRemoveRequest

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[ICDResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  if ([v4 length])
  {
    v5 = +[NSInputStream inputStreamWithData:v4];
    id v6 = [objc_alloc((Class)DKDAAPParser) initWithStream:v5];
    v7 = objc_alloc_init(DeleteFromLibraryResponseParserDelegate);
    [v6 setDelegate:v7];
    [v6 parse];
    objc_msgSend(v3, "setUpdateRequired:", -[DeleteFromLibraryResponseParserDelegate updateRequired](v7, "updateRequired"));
  }

  return v3;
}

- (id)_bodyDataForSagaIDs:(id)a3 itemKind:(unsigned __int8)a4
{
  id v7 = a3;
  id v4 = v7;
  v5 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v5;
}

- (ICBulkRemoveRequest)initWithDatabaseID:(unsigned int)a3 sagaIDs:(id)a4 itemKind:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICBulkRemoveRequest;
  v9 = [(ICBulkRemoveRequest *)&v15 init];
  v10 = +[NSString stringWithFormat:@"databases/%u/edit", v6];
  v14.receiver = v9;
  v14.super_class = (Class)ICBulkRemoveRequest;
  v11 = [(ICDRequest *)&v14 initWithAction:v10];

  if (v11)
  {
    [(ICDRequest *)v11 setMethod:1];
    v12 = [(ICBulkRemoveRequest *)v11 _bodyDataForSagaIDs:v8 itemKind:v5];
    [(ICDRequest *)v11 setBodyData:v12];
  }
  return v11;
}

@end