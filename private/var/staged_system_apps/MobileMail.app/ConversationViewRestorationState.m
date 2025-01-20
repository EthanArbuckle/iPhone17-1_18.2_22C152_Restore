@interface ConversationViewRestorationState
+ (OS_os_log)signpostLog;
+ (id)_queryByRemovingSearchPredicate:(id)a3 messageRepository:(id)a4;
+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4;
+ (id)loadFromDictionary:(id)a3 usingRepository:(id)a4;
+ (id)log;
+ (id)stateWithBuilder:(id)a3;
- (BOOL)showAsConversation;
- (EFPromise)collectionDidLoadReferenceIDPromise;
- (EMCollectionItemID)expectedReferenceItemID;
- (EMCollectionItemID)scrolledItemID;
- (EMMessageList)referenceMessageList;
- (EMMessageListItem)referenceMessageListItem;
- (MFDynamicCellOffsetRepresentation)scrolledItemOffset;
- (NSDictionary)expansionTrackerState;
- (NSSet)disabledMarkAsReadMessageItemIDs;
- (NSSet)expandedContentItemIDs;
- (id)_beginLoadingWithQuery:(id)a3 itemID:(id)a4 usingRepository:(id)a5;
- (id)dictionaryRepresentation;
- (unint64_t)signpostID;
- (void)_logSignpostForCollectionLoadBegin;
- (void)_logSignpostForCollectionLoadEndFindingItemID:(BOOL)a3;
- (void)_logSignpostForReferenceItemLoadCompleteWithSuccess:(BOOL)a3;
- (void)_logSignpostForReferenceItemRequest;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)setCollectionDidLoadReferenceIDPromise:(id)a3;
- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3;
- (void)setExpandedContentItemIDs:(id)a3;
- (void)setExpansionTrackerState:(id)a3;
- (void)setExpectedReferenceItemID:(id)a3;
- (void)setReferenceMessageList:(id)a3;
- (void)setReferenceMessageListItem:(id)a3;
- (void)setScrolledItemID:(id)a3;
- (void)setScrolledItemOffset:(id)a3;
- (void)setShowAsConversation:(BOOL)a3;
@end

@implementation ConversationViewRestorationState

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5F98;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699440 != -1) {
    dispatch_once(&qword_100699440, block);
  }
  v2 = (void *)qword_100699438;

  return v2;
}

+ (OS_os_log)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A60BC;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699450 != -1) {
    dispatch_once(&qword_100699450, block);
  }
  v2 = (void *)qword_100699448;

  return (OS_os_log *)v2;
}

- (unint64_t)signpostID
{
  v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

+ (id)stateWithBuilder:(id)a3
{
  os_signpost_id_t v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init((Class)a1);
  v4[2](v4, v5);
  v6 = [v5 referenceMessageListItem];
  if (v6)
  {
    id v7 = [v5 referenceMessageList];

    if (v7)
    {
      v8 = [v5 disabledMarkAsReadMessageItemIDs];
      v9 = v8;
      if (!v8)
      {
        v9 = +[NSSet set];
      }
      [v5 setDisabledMarkAsReadMessageItemIDs:v9];
      if (!v8) {

      }
      v10 = [v5 expansionTrackerState];
      v11 = v10;
      if (!v10)
      {
        v11 = +[NSDictionary dictionary];
      }
      [v5 setExpansionTrackerState:v11];
      if (!v10) {

      }
      v12 = [v5 expandedContentItemIDs];
      v13 = v12;
      if (!v12)
      {
        v13 = +[NSSet set];
      }
      [v5 setExpandedContentItemIDs:v13];
      if (!v12) {

      }
      v14 = [v5 scrolledItemID];
      if (v14)
      {
        v15 = [v5 scrolledItemOffset];
      }
      else
      {
        v15 = 0;
      }
      [v5 setScrolledItemOffset:v15];
      if (v14) {

      }
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4
{
  id v6 = a3;
  id v7 = [a4 messageRepository];
  v8 = [a1 loadFromDictionary:v6 usingRepository:v7];

  return v8;
}

+ (id)loadFromDictionary:(id)a3 usingRepository:(id)a4
{
  id v6 = a3;
  id v56 = a4;
  id v7 = +[ConversationViewRestorationState log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Beginning load of state from dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  v8 = [v6 objectForKeyedSubscript:@"ConversationViewStateVersion"];
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 integerValue];
    if ((uint64_t)v10 > 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v73 = 0x3032000000;
      v74 = sub_1000A6E20;
      v75 = sub_1000A6E30;
      id v76 = 0;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1000A6E38;
      v57[3] = &unk_100606358;
      id v11 = v6;
      id v58 = v11;
      p_long long buf = &buf;
      v12 = objc_retainBlock(v57);
      uint64_t v13 = objc_opt_class();
      v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
      v55 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateReferenceItemID", v14);

      if (v55)
      {
        v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
        v16 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateMessageListQuery", v15);

        v17 = [a1 _queryByRemovingSearchPredicate:v16 messageRepository:v56];

        if (v17)
        {
          if ([v17 isValid])
          {
            v54 = objc_alloc_init(ConversationViewRestorationState);
            v18 = [v11 objectForKeyedSubscript:@"ConversationViewStateShowAsConversation"];
            unsigned int v53 = [v18 BOOLValue];

            [(ConversationViewRestorationState *)v54 setShowAsConversation:v53];
            uint64_t v19 = objc_opt_class();
            uint64_t v20 = objc_opt_class();
            uint64_t v21 = objc_opt_class();
            v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
            v23 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateExpansionTrackerState", v22);
            v24 = v23;
            if (!v23)
            {
              v24 = +[NSDictionary dictionary];
            }
            [(ConversationViewRestorationState *)v54 setExpansionTrackerState:v24];
            if (!v23) {

            }
            uint64_t v25 = objc_opt_class();
            uint64_t v26 = objc_opt_class();
            v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, v26, objc_opt_class(), 0);
            v28 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateDisableMarkAsReadIDs", v27);
            v29 = v28;
            if (!v28)
            {
              v29 = +[NSSet set];
            }
            [(ConversationViewRestorationState *)v54 setDisabledMarkAsReadMessageItemIDs:v29];
            if (!v28) {

            }
            uint64_t v30 = objc_opt_class();
            uint64_t v31 = objc_opt_class();
            v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, v31, objc_opt_class(), 0);
            v33 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStatekExpandedContentIDs", v32);
            v34 = v33;
            if (!v33)
            {
              v34 = +[NSSet set];
            }
            [(ConversationViewRestorationState *)v54 setExpandedContentItemIDs:v34];
            if (!v33) {

            }
            uint64_t v35 = objc_opt_class();
            v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v35, objc_opt_class(), 0);
            v37 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateScrolledItemID", v36);
            [(ConversationViewRestorationState *)v54 setScrolledItemID:v37];

            v38 = [(ConversationViewRestorationState *)v54 scrolledItemID];

            if (v38)
            {
              v39 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
              v40 = ((void (*)(void *, const __CFString *, void *))v12[2])(v12, @"ConversationViewStateScrolledOffsetID", v39);
              [(ConversationViewRestorationState *)v54 setScrolledItemOffset:v40];
            }
            v41 = [(ConversationViewRestorationState *)v54 scrolledItemID];

            v42 = [(ConversationViewRestorationState *)v54 expansionTrackerState];
            id v43 = [v42 count];

            v44 = [(ConversationViewRestorationState *)v54 disabledMarkAsReadMessageItemIDs];
            id v45 = [v44 count];

            v46 = +[ConversationViewRestorationState log];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v60 = 138413570;
              v61 = v55;
              __int16 v62 = 2112;
              v63 = v17;
              __int16 v64 = 1024;
              unsigned int v65 = v53;
              __int16 v66 = 1024;
              BOOL v67 = v41 != 0;
              __int16 v68 = 1024;
              BOOL v69 = v43 != 0;
              __int16 v70 = 1024;
              BOOL v71 = v45 != 0;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Decoded dictionary representation: referenceItemID=%@ messageListQuery=%@ showAsConversation=%{BOOL}d hasScrolledItem=%{BOOL}d hasExpandedItems=%{BOOL}d hasDisabledMarkAsReadItems=%{BOOL}d", v60, 0x2Eu);
            }

            v47 = v54;
            uint64_t v48 = [(ConversationViewRestorationState *)v54 _beginLoadingWithQuery:v17 itemID:v55 usingRepository:v56];
          }
          else
          {
            v47 = +[NSError mf_restorationQueryInvalid];
            uint64_t v48 = +[EFFuture futureWithError:v47];
          }
        }
        else
        {
          v47 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:*(void *)(*((void *)&buf + 1) + 40)];
          uint64_t v48 = +[EFFuture futureWithError:v47];
        }
        v51 = (void *)v48;
      }
      else
      {
        v17 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:*(void *)(*((void *)&buf + 1) + 40)];
        v51 = +[EFFuture futureWithError:v17];
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_34;
    }
  }
  else
  {
    id v10 = 0;
  }
  v49 = +[ConversationViewRestorationState log];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
    sub_100459010((uint64_t)v10, v49);
  }

  v50 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:0];
  v51 = +[EFFuture futureWithError:v50];

LABEL_34:

  return v51;
}

+ (id)_queryByRemovingSearchPredicate:(id)a3 messageRepository:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 queryOptions] & 0x20) != 0)
  {
    v8 = [v5 predicate];
    v9 = [v6 mailboxRepository];
    id v10 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v8 withMailboxTypeResolver:v9];

    id v11 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v10];
    id v7 = [v5 queryWithPredicate:v11];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)_beginLoadingWithQuery:(id)a3 itemID:(id)a4 usingRepository:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ConversationViewRestorationState *)self setExpectedReferenceItemID:v9];
  [(ConversationViewRestorationState *)self _logSignpostForCollectionLoadBegin];
  id v11 = +[ConversationViewRestorationState log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543874;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Starting load of message list using itemID: %{public}@, repository: %{public}@, query: %{public}@", buf, 0x20u);
  }

  v12 = +[EFPromise promise];
  [(ConversationViewRestorationState *)self setCollectionDidLoadReferenceIDPromise:v12];

  id v13 = [objc_alloc((Class)EMMessageList) initWithQuery:v8 repository:v10];
  [(ConversationViewRestorationState *)self setReferenceMessageList:v13];

  v14 = [(ConversationViewRestorationState *)self referenceMessageList];
  [v14 beginObserving:self];

  v15 = [(ConversationViewRestorationState *)self collectionDidLoadReferenceIDPromise];
  v16 = [v15 future];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A74E8;
  v24[3] = &unk_100606380;
  v24[4] = self;
  id v17 = v9;
  id v25 = v17;
  v18 = [v16 then:v24];
  uint64_t v19 = [v18 recover:&stru_1006063C0];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A7770;
  v23[3] = &unk_1006063E8;
  v23[4] = self;
  uint64_t v20 = [v19 then:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000A7890;
  v22[3] = &unk_100604F70;
  v22[4] = self;
  [v20 addFailureBlock:v22];

  return v20;
}

- (id)dictionaryRepresentation
{
  v3 = [(ConversationViewRestorationState *)self referenceMessageListItem];
  os_signpost_id_t v4 = [v3 itemID];

  id v5 = [(ConversationViewRestorationState *)self referenceMessageList];
  id v6 = [v5 query];

  id v7 = 0;
  if (v4 && v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A7D3C;
    v19[3] = &unk_100606410;
    id v8 = (id)objc_opt_new();
    id v20 = v8;
    id v9 = objc_retainBlock(v19);
    if ((unsigned int (*)(void *, void *, const __CFString *))v9[2])(v9, v4, @"ConversationViewStateReferenceItemID")&& (((uint64_t (*)(void *, void *, const __CFString *))v9[2])(v9, v6, @"ConversationViewStateMessageListQuery"))
    {
      id v10 = [(ConversationViewRestorationState *)self disabledMarkAsReadMessageItemIDs];
      ((void (*)(void *, void *, const __CFString *))v9[2])(v9, v10, @"ConversationViewStateDisableMarkAsReadIDs");

      id v11 = [(ConversationViewRestorationState *)self expansionTrackerState];
      ((void (*)(void *, void *, const __CFString *))v9[2])(v9, v11, @"ConversationViewStateExpansionTrackerState");

      v12 = [(ConversationViewRestorationState *)self expandedContentItemIDs];
      ((void (*)(void *, void *, const __CFString *))v9[2])(v9, v12, @"ConversationViewStatekExpandedContentIDs");

      id v13 = [(ConversationViewRestorationState *)self scrolledItemID];

      if (v13)
      {
        v14 = [(ConversationViewRestorationState *)self scrolledItemID];
        ((void (*)(void *, void *, const __CFString *))v9[2])(v9, v14, @"ConversationViewStateScrolledItemID");

        v15 = [(ConversationViewRestorationState *)self scrolledItemOffset];

        if (v15)
        {
          v16 = [(ConversationViewRestorationState *)self scrolledItemOffset];
          ((void (*)(void *, void *, const __CFString *))v9[2])(v9, v16, @"ConversationViewStateScrolledOffsetID");
        }
      }
      id v17 = +[NSNumber numberWithBool:[(ConversationViewRestorationState *)self showAsConversation]];
      [v8 setObject:v17 forKeyedSubscript:@"ConversationViewStateShowAsConversation"];

      [v8 setObject:&off_10062A5F0 forKeyedSubscript:@"ConversationViewStateVersion"];
      id v7 = [v8 copy];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)_logSignpostForCollectionLoadBegin
{
  v3 = +[ConversationViewRestorationState signpostLog];
  os_signpost_id_t v4 = [(ConversationViewRestorationState *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    id v5 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
    int v6 = 138543362;
    id v7 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ConversationViewStateCollectionLoad", "ItemID=%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_logSignpostForCollectionLoadEndFindingItemID:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ConversationViewRestorationState signpostLog];
  os_signpost_id_t v6 = [(ConversationViewRestorationState *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v7 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
    v8[0] = 67240450;
    v8[1] = v3;
    __int16 v9 = 2114;
    id v10 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ConversationViewStateCollectionLoad", "DidFindItemID=%{public,signpost.telemetry:number1}u ItemID=%{public}@ enableTelemetry=YES ", (uint8_t *)v8, 0x12u);
  }
}

- (void)_logSignpostForReferenceItemRequest
{
  BOOL v3 = +[ConversationViewRestorationState signpostLog];
  os_signpost_id_t v4 = [(ConversationViewRestorationState *)self signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    id v5 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
    int v6 = 138543362;
    id v7 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ConversationViewStateReferenceItemLoad", "ItemID=%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_logSignpostForReferenceItemLoadCompleteWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ConversationViewRestorationState signpostLog];
  os_signpost_id_t v6 = [(ConversationViewRestorationState *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    id v7 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
    v8[0] = 67240450;
    v8[1] = v3;
    __int16 v9 = 2114;
    id v10 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ConversationViewStateReferenceItemLoad", "Success=%{public,signpost.telemetry:number1}u ItemID=%{public}@ enableTelemetry=YES ", (uint8_t *)v8, 0x12u);
  }
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  id v5 = +[ConversationViewRestorationState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    os_signpost_id_t v6 = [v4 ef_publicDescription];
    sub_100459270(v6, v8, v5);
  }

  id v7 = [(ConversationViewRestorationState *)self collectionDidLoadReferenceIDPromise];
  [v7 finishWithResult:v4];

  [(ConversationViewRestorationState *)self _logSignpostForCollectionLoadEndFindingItemID:0];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
  unsigned int v10 = [v8 containsObject:v9];

  if (v10)
  {
    id v11 = +[ConversationViewRestorationState log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1004592C8(v11);
    }

    v12 = [(ConversationViewRestorationState *)self collectionDidLoadReferenceIDPromise];
    [v12 finishWithResult:v7];

    [(ConversationViewRestorationState *)self _logSignpostForCollectionLoadEndFindingItemID:1];
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [(ConversationViewRestorationState *)self expectedReferenceItemID];
  unsigned int v10 = [v8 containsObject:v9];

  if (v10)
  {
    id v11 = +[ConversationViewRestorationState log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1004592C8(v11);
    }

    v12 = [(ConversationViewRestorationState *)self collectionDidLoadReferenceIDPromise];
    [v12 finishWithResult:v7];

    [(ConversationViewRestorationState *)self _logSignpostForCollectionLoadEndFindingItemID:1];
  }
}

- (EMMessageListItem)referenceMessageListItem
{
  return self->_referenceMessageListItem;
}

- (void)setReferenceMessageListItem:(id)a3
{
}

- (EMMessageList)referenceMessageList
{
  return self->_referenceMessageList;
}

- (void)setReferenceMessageList:(id)a3
{
}

- (BOOL)showAsConversation
{
  return self->_showAsConversation;
}

- (void)setShowAsConversation:(BOOL)a3
{
  self->_showAsConversation = a3;
}

- (NSDictionary)expansionTrackerState
{
  return self->_expansionTrackerState;
}

- (void)setExpansionTrackerState:(id)a3
{
}

- (NSSet)disabledMarkAsReadMessageItemIDs
{
  return self->_disabledMarkAsReadMessageItemIDs;
}

- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3
{
}

- (NSSet)expandedContentItemIDs
{
  return self->_expandedContentItemIDs;
}

- (void)setExpandedContentItemIDs:(id)a3
{
}

- (EMCollectionItemID)scrolledItemID
{
  return self->_scrolledItemID;
}

- (void)setScrolledItemID:(id)a3
{
}

- (MFDynamicCellOffsetRepresentation)scrolledItemOffset
{
  return self->_scrolledItemOffset;
}

- (void)setScrolledItemOffset:(id)a3
{
}

- (EFPromise)collectionDidLoadReferenceIDPromise
{
  return self->_collectionDidLoadReferenceIDPromise;
}

- (void)setCollectionDidLoadReferenceIDPromise:(id)a3
{
}

- (EMCollectionItemID)expectedReferenceItemID
{
  return self->_expectedReferenceItemID;
}

- (void)setExpectedReferenceItemID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedReferenceItemID, 0);
  objc_storeStrong((id *)&self->_collectionDidLoadReferenceIDPromise, 0);
  objc_storeStrong((id *)&self->_scrolledItemOffset, 0);
  objc_storeStrong((id *)&self->_scrolledItemID, 0);
  objc_storeStrong((id *)&self->_expandedContentItemIDs, 0);
  objc_storeStrong((id *)&self->_disabledMarkAsReadMessageItemIDs, 0);
  objc_storeStrong((id *)&self->_expansionTrackerState, 0);
  objc_storeStrong((id *)&self->_referenceMessageList, 0);

  objc_storeStrong((id *)&self->_referenceMessageListItem, 0);
}

@end