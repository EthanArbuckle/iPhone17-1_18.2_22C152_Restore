@interface MessageListRestorationState
+ (OS_os_log)log;
+ (id)_loadMailboxesFromEncodedMailboxes:(id)a3 daemonInterface:(id)a4;
+ (id)_loadMailboxesFromObjectIDData:(id)a3 daemonInterface:(id)a4;
+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4;
- (BOOL)scrolledToTop;
- (EFPromise)firstVisibleItemIDPromise;
- (EMCollectionItemID)lastSelectedItemID;
- (EMMessageList)messageList;
- (MessageListRestorationState)initWithMessageList:(id)a3 mailboxes:(id)a4 visibleItems:(id)a5 scrolledToTop:(BOOL)a6 lastSelectedItemID:(id)a7;
- (NSArray)mailboxes;
- (NSArray)visibleItems;
- (NSOrderedSet)previouslyVisibleItemIDs;
- (id)_beginLoadingWithMailboxesFuture:(id)a3 threaded:(BOOL)a4 trackOldest:(BOOL)a5 updateDisplayDate:(BOOL)a6 daemonInterface:(id)a7;
- (id)_firstVisibleItemFromAddedItemIDs:(id)a3;
- (id)dictionaryRepresentation;
- (void)_handleItemIDsAdded:(id)a3 messageList:(id)a4;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)setFirstVisibleItemIDPromise:(id)a3;
- (void)setLastSelectedItemID:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setPreviouslyVisibleItemIDs:(id)a3;
- (void)setScrolledToTop:(BOOL)a3;
- (void)setVisibleItems:(id)a3;
@end

@implementation MessageListRestorationState

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013C578;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006998E8 != -1) {
    dispatch_once(&qword_1006998E8, block);
  }
  v2 = (void *)qword_1006998E0;

  return (OS_os_log *)v2;
}

+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4
{
  id v6 = a3;
  id v43 = a4;
  v7 = [v6 objectForKeyedSubscript:@"MessageListStateVersion"];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = (uint64_t)[v7 integerValue];
    if (v9 > 2)
    {
      v10 = +[MessageListRestorationState log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v47 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Decoding v%li state from dictionary...", buf, 0xCu);
      }

      v11 = [v6 objectForKeyedSubscript:@"MessageListStateEncodedMailboxes"];
      v42 = [v6 objectForKeyedSubscript:@"MessageListStateVisibleItems"];
      v41 = [v6 objectForKeyedSubscript:@"MessageListStateLastSelectedItemID"];
      v38 = [v6 objectForKeyedSubscript:@"MessageListStateScrolledToTop"];
      v39 = [v6 objectForKeyedSubscript:@"MessageListStateIsThreaded"];
      v40 = [v6 objectForKeyedSubscript:@"MessageListStateTrackOldest"];
      v12 = [v6 objectForKeyedSubscript:@"MessageListStateUpdateDisplayDate"];
      unsigned int v36 = [v12 BOOLValue];

      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
      id v45 = 0;
      v37 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v16 fromData:v42 error:&v45];
      id v17 = v45;
      if (v17)
      {
        v18 = v17;
        v19 = +[MessageListRestorationState log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [v18 ef_publicDescription];
          objc_claimAutoreleasedReturnValue();
          sub_10045B5FC();
        }

        v20 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:v18];
        v21 = +[EFFuture futureWithError:v20];
        goto LABEL_27;
      }
      if ([v41 length])
      {
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = objc_opt_class();
        v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v24, objc_opt_class(), 0);
        id v44 = 0;
        v20 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v25 fromData:v41 error:&v44];
        v26 = v25;
        id v27 = v44;
        if (v27)
        {
          v18 = v27;
          v28 = +[MessageListRestorationState log];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            [v18 ef_publicDescription];
            objc_claimAutoreleasedReturnValue();
            sub_10045B5B8();
          }

          v29 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:v18];
          v21 = +[EFFuture futureWithError:v29];
          v30 = v26;
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
      }
      else
      {
        v20 = 0;
      }
      if (v38) {
        uint64_t v31 = (uint64_t)[v38 BOOLValue];
      }
      else {
        uint64_t v31 = 1;
      }
      id v32 = [v39 BOOLValue];
      id v33 = [v40 BOOLValue];
      v30 = [a1 _loadMailboxesFromEncodedMailboxes:v11 daemonInterface:v43];
      v34 = +[MessageListRestorationState log];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Decoded dictionary representation. Beginning load....", buf, 2u);
      }

      v29 = objc_alloc_init(MessageListRestorationState);
      [(MessageListRestorationState *)v29 setLastSelectedItemID:v20];
      [(MessageListRestorationState *)v29 setVisibleItems:v37];
      [(MessageListRestorationState *)v29 setScrolledToTop:v31];
      v21 = [(MessageListRestorationState *)v29 _beginLoadingWithMailboxesFuture:v30 threaded:v32 trackOldest:v33 updateDisplayDate:v36 daemonInterface:v43];
      v18 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  v22 = +[MessageListRestorationState log];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10045B530(v9, v22);
  }

  v11 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:0];
  v21 = +[EFFuture futureWithError:v11];
LABEL_28:

  return v21;
}

+ (id)_loadMailboxesFromObjectIDData:(id)a3 daemonInterface:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  id v19 = 0;
  uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v5 error:&v19];
  id v10 = v19;

  if (v10)
  {
    v11 = +[MessageListRestorationState log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [v10 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045B640();
    }

    v12 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:v10];
    uint64_t v13 = +[EFFuture futureWithError:v12];
  }
  else
  {
    uint64_t v14 = +[MessageListRestorationState log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requesting mailboxes by object ID (v1)...", buf, 2u);
    }

    uint64_t v15 = [v6 mailboxRepository];
    v16 = [v15 mailboxesForObjectIDs:v9];
    v12 = +[EFFuture join:v16];

    uint64_t v13 = [v12 recover:&stru_1006094E8];
  }
  id v17 = (void *)v13;

  return v17;
}

+ (id)_loadMailboxesFromEncodedMailboxes:(id)a3 daemonInterface:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[MessageListRestorationState log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Decoding mailboxes (v2)...", buf, 2u);
  }

  v8 = +[MessageListRestorationState log];
  uint64_t v9 = +[RestorationMailboxDecoder decoderWithDaemonInterface:v6 log:v8];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013D30C;
  v14[3] = &unk_100609510;
  id v10 = v9;
  id v15 = v10;
  v11 = [v5 ef_map:v14];
  v12 = +[EFFuture join:v11];

  return v12;
}

- (MessageListRestorationState)initWithMessageList:(id)a3 mailboxes:(id)a4 visibleItems:(id)a5 scrolledToTop:(BOOL)a6 lastSelectedItemID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MessageListRestorationState;
  id v17 = [(MessageListRestorationState *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageList, a3);
    objc_storeStrong((id *)&v18->_mailboxes, a4);
    objc_storeStrong((id *)&v18->_visibleItems, a5);
    v18->_scrolledToTop = a6;
    objc_storeStrong((id *)&v18->_lastSelectedItemID, a7);
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  v3 = [(MessageListRestorationState *)self messageList];
  v4 = [v3 query];

  id v5 = [(MessageListRestorationState *)self mailboxes];
  id v6 = [v5 ef_map:&stru_100609530];

  if (!v4
    || ![v6 count]
    || ([(MessageListRestorationState *)self visibleItems],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    id v17 = 0;
    goto LABEL_22;
  }
  id v28 = objc_alloc_init((Class)NSMutableDictionary);
  v8 = +[MessageListRestorationState log];
  uint64_t v9 = +[RestorationMailboxEncoder encoderWithLog:v8];

  id v10 = [(MessageListRestorationState *)self mailboxes];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10013DA6C;
  v31[3] = &unk_100609558;
  id v11 = v9;
  id v32 = v11;
  v12 = [v10 ef_compactMap:v31];

  if (![v12 count])
  {
    id v14 = +[MessageListRestorationState log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10045B6C8(v14);
    }
    id v17 = 0;
    id v15 = 0;
    goto LABEL_21;
  }
  [v28 setObject:v12 forKeyedSubscript:@"MessageListStateEncodedMailboxes"];
  id v13 = [(MessageListRestorationState *)self visibleItems];
  id v30 = 0;
  id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v30];
  id v15 = v30;

  if (!v15)
  {
    [v28 setObject:v14 forKeyedSubscript:@"MessageListStateVisibleItems"];
    uint64_t v27 = [(MessageListRestorationState *)self lastSelectedItemID];
    if (v27)
    {
      id v29 = 0;
      id v16 = v27;
      v18 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v29];
      id v15 = v29;
      if (v15)
      {
        id v19 = +[MessageListRestorationState log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [v15 ef_publicDescription];
          objc_claimAutoreleasedReturnValue();
          sub_10045B70C();
        }

        goto LABEL_17;
      }
      [v28 setObject:v18 forKeyedSubscript:@"MessageListStateLastSelectedItemID"];
    }
    id v16 = v27;
    objc_super v20 = +[NSNumber numberWithBool:[(MessageListRestorationState *)self scrolledToTop]];
    [v28 setObject:v20 forKeyedSubscript:@"MessageListStateScrolledToTop"];

    v21 = [(MessageListRestorationState *)self messageList];
    v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v21 isThreaded]);
    [v28 setObject:v22 forKeyedSubscript:@"MessageListStateIsThreaded"];

    uint64_t v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (unint64_t)[v4 queryOptions] & 1);
    [v28 setObject:v23 forKeyedSubscript:@"MessageListStateTrackOldest"];

    uint64_t v24 = [v4 targetClassOptions];
    v25 = [v24 objectForKeyedSubscript:EMMessageListItemQueryOptionUpdateDisplayDate];
    [v28 setObject:v25 forKeyedSubscript:@"MessageListStateUpdateDisplayDate"];

    [v28 setObject:&off_10062AA40 forKeyedSubscript:@"MessageListStateVersion"];
    id v17 = [v28 copy];
    id v15 = 0;
    goto LABEL_20;
  }
  id v16 = +[MessageListRestorationState log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    [v15 ef_publicDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10045B750();
  }
LABEL_17:
  id v17 = 0;
LABEL_20:

LABEL_21:
LABEL_22:

  return v17;
}

- (id)_beginLoadingWithMailboxesFuture:(id)a3 threaded:(BOOL)a4 trackOldest:(BOOL)a5 updateDisplayDate:(BOOL)a6 daemonInterface:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = +[EFPromise promise];
  [(MessageListRestorationState *)self setFirstVisibleItemIDPromise:v14];

  id v15 = [(MessageListRestorationState *)self visibleItems];
  id v16 = [v15 count];

  if (v16)
  {
    id v17 = [(MessageListRestorationState *)self visibleItems];
    v18 = [v17 ef_mapSelector:@"itemID"];
    id v19 = +[NSOrderedSet orderedSetWithArray:v18];
    [(MessageListRestorationState *)self setPreviouslyVisibleItemIDs:v19];
  }
  objc_super v20 = +[NSUserDefaults em_userDefaults];
  BOOL v21 = v16 != 0;
  char v22 = [v20 BOOLForKey:DisableThreadingKey] ^ 1;

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10013DD68;
  v29[3] = &unk_100609580;
  v29[4] = self;
  id v23 = v13;
  id v30 = v23;
  BOOL v31 = a5;
  BOOL v32 = a4;
  char v33 = v22;
  BOOL v34 = a6;
  BOOL v35 = v21;
  uint64_t v24 = [v12 then:v29];
  v25 = [v24 recover:&stru_1006095A0];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10013E2BC;
  v28[3] = &unk_1006095C8;
  v28[4] = self;
  v26 = [v25 then:v28];

  return v26;
}

- (void)_handleItemIDsAdded:(id)a3 messageList:(id)a4
{
  id v5 = -[MessageListRestorationState _firstVisibleItemFromAddedItemIDs:](self, "_firstVisibleItemFromAddedItemIDs:", a3, a4);
  if (v5)
  {
    id v6 = +[MessageListRestorationState log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Message list has loaded the first visible item. Continuing...", v9, 2u);
    }

    uint64_t v7 = [(MessageListRestorationState *)self firstVisibleItemIDPromise];
    [v7 finishWithResult:v5];

    v8 = [(MessageListRestorationState *)self messageList];
    [v8 stopObserving:self];
  }
}

- (id)_firstVisibleItemFromAddedItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListRestorationState *)self previouslyVisibleItemIDs];
  id v6 = [v5 mutableCopy];

  uint64_t v7 = +[NSOrderedSet orderedSetWithArray:v4];
  [v6 intersectOrderedSet:v7];
  v8 = [v6 firstObject];

  return v8;
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  id v5 = +[MessageListRestorationState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 ef_publicDescription];
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finished initial load for: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [(MessageListRestorationState *)self firstVisibleItemIDPromise];
  v8 = +[NSError em_internalErrorWithReason:@"no visible item IDs after initial load"];
  [v7 finishWithError:v8];

  uint64_t v9 = [(MessageListRestorationState *)self messageList];
  [v9 stopObserving:self];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (void)setMessageList:(id)a3
{
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (NSArray)visibleItems
{
  return self->_visibleItems;
}

- (void)setVisibleItems:(id)a3
{
}

- (BOOL)scrolledToTop
{
  return self->_scrolledToTop;
}

- (void)setScrolledToTop:(BOOL)a3
{
  self->_scrolledToTop = a3;
}

- (EMCollectionItemID)lastSelectedItemID
{
  return self->_lastSelectedItemID;
}

- (void)setLastSelectedItemID:(id)a3
{
}

- (EFPromise)firstVisibleItemIDPromise
{
  return (EFPromise *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstVisibleItemIDPromise:(id)a3
{
}

- (NSOrderedSet)previouslyVisibleItemIDs
{
  return self->_previouslyVisibleItemIDs;
}

- (void)setPreviouslyVisibleItemIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyVisibleItemIDs, 0);
  objc_storeStrong((id *)&self->_firstVisibleItemIDPromise, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_messageList, 0);
}

@end