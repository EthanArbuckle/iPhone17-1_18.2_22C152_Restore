@interface ICSetFavoriteSongAddToLibraryBehaviorRequest
+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5;
- (ICSetFavoriteSongAddToLibraryBehaviorRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5;
- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 addToLibraryBehavior:(unsigned __int8)a4;
@end

@implementation ICSetFavoriteSongAddToLibraryBehaviorRequest

- (id)_bodyDataForDatabaseRevision:(unsigned int)a3 addToLibraryBehavior:(unsigned __int8)a4
{
  v4 = ICDAAPUtilitiesCreateDataForItemKindContainer();

  return v4;
}

- (ICSetFavoriteSongAddToLibraryBehaviorRequest)initWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  v8 = +[NSString stringWithFormat:@"databases/%u/edit", *(void *)&a3];
  v12.receiver = self;
  v12.super_class = (Class)ICSetFavoriteSongAddToLibraryBehaviorRequest;
  v9 = [(ICDRequest *)&v12 initWithAction:v8];

  if (v9)
  {
    [(ICDRequest *)v9 setMethod:1];
    v10 = [(ICSetFavoriteSongAddToLibraryBehaviorRequest *)v9 _bodyDataForDatabaseRevision:v6 addToLibraryBehavior:v5];
    [(ICDRequest *)v9 setBodyData:v10];
  }
  return v9;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 addToLibraryBehavior:(unsigned __int8)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:*(void *)&a3 databaseRevision:*(void *)&a4 addToLibraryBehavior:a5];

  return v5;
}

@end