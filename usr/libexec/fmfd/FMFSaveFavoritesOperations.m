@interface FMFSaveFavoritesOperations
- (FMFClientSession)clientSession;
- (FMFSaveFavoritesOperations)initWithFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5;
- (NSArray)favorites;
- (NSUUID)identifier;
- (id)completionBlock;
- (void)executeWithCompletion:(id)a3;
- (void)setClientSession:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFavorites:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation FMFSaveFavoritesOperations

- (FMFSaveFavoritesOperations)initWithFavorites:(id)a3 clientSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FMFSaveFavoritesOperations;
  v11 = [(FMFSaveFavoritesOperations *)&v17 init];
  if (v11)
  {
    v12 = objc_opt_new();
    [(FMFSaveFavoritesOperations *)v11 setIdentifier:v12];

    id v13 = [v8 copy];
    [(FMFSaveFavoritesOperations *)v11 setFavorites:v13];

    [(FMFSaveFavoritesOperations *)v11 setClientSession:v9];
    [(FMFSaveFavoritesOperations *)v11 setCompletionBlock:v10];
    v14 = sub_100005560();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(FMFSaveFavoritesOperations *)v11 identifier];
      *(_DWORD *)buf = 138412546;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations initialized: %@ withFavorites: %@", buf, 0x16u);
    }
  }

  return v11;
}

- (void)executeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FMFSaveFavoritesOperations *)self identifier];
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations executing: %@", buf, 0xCu);
  }
  v7 = +[FMFCommandManager sharedInstance];
  id v8 = [(FMFSaveFavoritesOperations *)self favorites];
  id v9 = [(FMFSaveFavoritesOperations *)self clientSession];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003EB00;
  v11[3] = &unk_1000A20B0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v7 saveFavorites:v8 clientSession:v9 completion:v11];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
}

- (FMFClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_favorites, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end