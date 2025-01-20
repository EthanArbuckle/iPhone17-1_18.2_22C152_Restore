@interface FMFSaveFavoritesCommand
- (FMFSaveFavoritesCommand)initWithClientSession:(id)a3 andFavorites:(id)a4;
- (NSArray)favorites;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setFavorites:(id)a3;
@end

@implementation FMFSaveFavoritesCommand

- (FMFSaveFavoritesCommand)initWithClientSession:(id)a3 andFavorites:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFSaveFavoritesCommand;
  v7 = [(FMFBaseCmd *)&v10 initWithClientSession:a3];
  if (v7)
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesCommand initialized with favorites: %@", buf, 0xCu);
    }

    [(FMFSaveFavoritesCommand *)v7 setFavorites:v6];
  }

  return v7;
}

- (id)pathSuffix
{
  return @"saveFavorites";
}

- (id)jsonBodyDictionary
{
  v20.receiver = self;
  v20.super_class = (Class)FMFSaveFavoritesCommand;
  v14 = [(FMFBaseCmd *)&v20 jsonBodyDictionary];
  v3 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(FMFSaveFavoritesCommand *)self favorites];
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 serverId];
        objc_super v10 = [v8 favoriteOrder];
        v11 = +[NSDictionary dictionaryWithObjectsAndKeys:v9, @"id", v10, @"order", 0];

        [v3 addObject:v11];
      }
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v5);
  }

  [v14 setObject:v3 forKey:@"favorites"];
  id v12 = sub_100005560();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesCommand jsonBodyDictionary: %@", buf, 0xCu);
  }

  return v14;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
}

- (void).cxx_destruct
{
}

@end