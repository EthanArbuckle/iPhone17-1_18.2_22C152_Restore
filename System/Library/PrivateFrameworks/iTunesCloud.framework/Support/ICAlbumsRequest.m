@interface ICAlbumsRequest
- (ICAlbumsRequest)initWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4;
- (double)timeoutInterval;
@end

@implementation ICAlbumsRequest

- (double)timeoutInterval
{
  return 180.0;
}

- (ICAlbumsRequest)initWithDatabaseID:(unsigned int)a3 paginationToken:(id)a4
{
  v5 = +[NSString stringWithFormat:@"databases/%u/groups?groupType=albums", a4, *(void *)&a3];
  v8.receiver = self;
  v8.super_class = (Class)ICAlbumsRequest;
  v6 = [(ICDRequest *)&v8 initWithAction:v5];

  if (v6)
  {
    [(ICDRequest *)v6 setRequestGroupEntityPayloadForTrackSourceMatch:1];
    [(ICDRequest *)v6 setMethod:1];
    [(ICDRequest *)v6 setRequestPersonalizationStyle:2];
  }
  return v6;
}

@end