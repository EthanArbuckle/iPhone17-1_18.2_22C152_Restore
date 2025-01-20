@interface _ShortcutCountObserverWrapper
- (EDMessageCountQueryHandler)queryHandler;
- (EFDebouncer)badgeCountDebouncer;
- (FavoriteItem)favoriteItem;
- (_ShortcutCountObserverWrapper)initWithFavoriteItem:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 countDidChange:(id)a6;
- (void)cancel;
- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4;
- (void)setBadgeCountDebouncer:(id)a3;
- (void)setQueryHandler:(id)a3;
@end

@implementation _ShortcutCountObserverWrapper

- (_ShortcutCountObserverWrapper)initWithFavoriteItem:(id)a3 messagePersistence:(id)a4 hookRegistry:(id)a5 countDidChange:(id)a6
{
  id v11 = a3;
  id v31 = a4;
  id v32 = a5;
  id v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)_ShortcutCountObserverWrapper;
  v13 = [(_ShortcutCountObserverWrapper *)&v36 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_favoriteItem, a3);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10017355C;
    v33[3] = &unk_10060A978;
    id v15 = v11;
    id v34 = v15;
    id v35 = v12;
    v16 = objc_retainBlock(v33);
    id v17 = objc_alloc((Class)EFDebouncer);
    v18 = +[EFScheduler mainThreadScheduler];
    v19 = (EFDebouncer *)[v17 initWithTimeInterval:v18 scheduler:1 startAfter:v16 block:0.1];
    badgeCountDebouncer = v14->_badgeCountDebouncer;
    v14->_badgeCountDebouncer = v19;

    v21 = [v15 countQueryPredicate];
    if (v21)
    {
      id v22 = objc_alloc((Class)NSString);
      v23 = [v15 displayName];
      v24 = [v22 initWithFormat:@"Application Shortcut Count Query %@", v23];

      id v25 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v21 sortDescriptors:&__NSArray0__struct queryOptions:0 label:v24];
      v26 = [v15 serverCountMailboxScope];
      v27 = +[MFApplicationShortcutProvider log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v25 predicate];
        *(_DWORD *)buf = 138412546;
        v38 = v28;
        __int16 v39 = 2112;
        v40 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting count query for predicate: %@ mailboxScope: %@", buf, 0x16u);
      }
      id v29 = [objc_alloc((Class)EDMessageCountQueryHandler) initWithQuery:v25 serverCountMailboxScope:v26 messagePersistence:v31 hookRegistry:v32 observer:v14];
      [(_ShortcutCountObserverWrapper *)v14 setQueryHandler:v29];
    }
    else
    {
      v24 = +[MFApplicationShortcutProvider log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10045BF48((uint64_t)v15, v24);
      }
    }
  }
  return v14;
}

- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4
{
  id v8 = a4;
  [v8 invoke];
  v6 = [(_ShortcutCountObserverWrapper *)self badgeCountDebouncer];
  v7 = +[NSNumber numberWithInteger:a3];
  [v6 debounceResult:v7];
}

- (void)cancel
{
  id v2 = [(_ShortcutCountObserverWrapper *)self queryHandler];
  [v2 cancel];
}

- (FavoriteItem)favoriteItem
{
  return self->_favoriteItem;
}

- (EFDebouncer)badgeCountDebouncer
{
  return self->_badgeCountDebouncer;
}

- (void)setBadgeCountDebouncer:(id)a3
{
}

- (EDMessageCountQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (void)setQueryHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_badgeCountDebouncer, 0);

  objc_storeStrong((id *)&self->_favoriteItem, 0);
}

@end