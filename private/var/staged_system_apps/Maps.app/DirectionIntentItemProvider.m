@interface DirectionIntentItemProvider
- (void)_continueWithOrigin:(id)a3 destination:(id)a4 transportType:(int)a5 completion:(id)a6;
- (void)directionItemWithDirectionIntent:(id)a3 localSearchCompletionOrigin:(id)a4 localSearchCompletionDestination:(id)a5 searchResultOrigin:(id)a6 searchResultDestination:(id)a7 completion:(id)a8;
- (void)directionItemWithDirectionIntent:(id)a3 searchResults:(id)a4 completion:(id)a5;
- (void)directionItemWithLocalSearchCompletion:(id)a3 completion:(id)a4;
- (void)searchFieldItemWithResolveditem:(id)a3 localSearchCompletionFromServer:(id)a4 searchResultFromServer:(id)a5 completion:(id)a6;
@end

@implementation DirectionIntentItemProvider

- (void)directionItemWithLocalSearchCompletion:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v10 = [v7 directionIntent];
    v8 = [v7 directionIntentOrigin];
    v9 = [v7 directionIntentDestination];

    [(DirectionIntentItemProvider *)self directionItemWithDirectionIntent:v10 localSearchCompletionOrigin:v8 localSearchCompletionDestination:v9 searchResultOrigin:0 searchResultDestination:0 completion:v6];
  }
}

- (void)directionItemWithDirectionIntent:(id)a3 searchResults:(id)a4 completion:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = [v20 origin];
    if ([v10 hasResultIndex])
    {
      v11 = [v20 origin];
      id v12 = [v11 resultIndex];
      id v13 = [v8 count];

      if (v12 >= v13)
      {
        v14 = 0;
LABEL_8:
        v15 = [v20 destination];
        if ([v15 hasResultIndex])
        {
          v16 = [v20 destination];
          id v17 = [v16 resultIndex];
          id v18 = [v8 count];

          if (v17 >= v18)
          {
            v19 = 0;
            goto LABEL_14;
          }
          v15 = [v20 destination];
          v19 = [v8 objectAtIndexedSubscript:[v15 resultIndex]];
        }
        else
        {
          v19 = 0;
        }

LABEL_14:
        [(DirectionIntentItemProvider *)self directionItemWithDirectionIntent:v20 localSearchCompletionOrigin:0 localSearchCompletionDestination:0 searchResultOrigin:v14 searchResultDestination:v19 completion:v9];

        goto LABEL_15;
      }
      id v10 = [v20 origin];
      v14 = [v8 objectAtIndexedSubscript:[v10 resultIndex]];
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_8;
  }
LABEL_15:
}

- (void)directionItemWithDirectionIntent:(id)a3 localSearchCompletionOrigin:(id)a4 localSearchCompletionDestination:(id)a5 searchResultOrigin:(id)a6 searchResultDestination:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v19)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_1001044C0;
    v38[4] = sub_100104AD0;
    id v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = sub_1001044C0;
    v36[4] = sub_100104AD0;
    id v37 = 0;
    id v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    v21 = [v14 origin];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100CA0DFC;
    v33[3] = &unk_101320650;
    v35 = v38;
    v22 = v20;
    v34 = v22;
    [(DirectionIntentItemProvider *)self searchFieldItemWithResolveditem:v21 localSearchCompletionFromServer:v15 searchResultFromServer:v17 completion:v33];

    dispatch_group_enter(v22);
    v23 = [v14 destination];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100CA0E5C;
    v30[3] = &unk_101320650;
    v32 = v36;
    v24 = v22;
    v31 = v24;
    [(DirectionIntentItemProvider *)self searchFieldItemWithResolveditem:v23 localSearchCompletionFromServer:v16 searchResultFromServer:v18 completion:v30];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CA0EBC;
    block[3] = &unk_101320678;
    block[4] = self;
    v28 = v38;
    v29 = v36;
    id v26 = v14;
    id v27 = v19;
    dispatch_group_notify(v24, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
  }
}

- (void)_continueWithOrigin:(id)a3 destination:(id)a4 transportType:(int)a5 completion:(id)a6
{
  id v19 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a6;
  v11 = +[NSMutableArray array];
  id v12 = v11;
  if (v19)
  {
    [v11 addObject:];
    if (v9)
    {
LABEL_3:
      [v12 addObject:v9];
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = +[SearchResult currentLocationSearchResult];
    id v14 = +[SearchFieldItem searchFieldItemWithObject:v13];
    [v12 addObject:v14];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = objc_opt_new();
  [v12 addObject:v15];

LABEL_6:
  if ([v12 count])
  {
    id v16 = [DirectionItem alloc];
    if ((a5 - 1) > 5) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = qword_100F73D48[a5 - 1];
    }
    id v18 = [(DirectionItem *)v16 initWithItems:v12 transportType:v17];
    v10[2](v10, v18);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)searchFieldItemWithResolveditem:(id)a3 localSearchCompletionFromServer:(id)a4 searchResultFromServer:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (v12)
  {
    id v13 = objc_alloc_init(ClientTypeResolver);
    id v14 = objc_alloc_init(SearchFieldItem);
    switch([v9 itemType])
    {
      case 0u:
        v12[2](v12, 0);
        break;
      case 1u:
      case 2u:
      case 6u:
        id v15 = [(ClientTypeResolver *)v13 personalizedItemSource];
        id v16 = [v9 itemType];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100CA1334;
        v23[3] = &unk_1013206A0;
        v24 = v14;
        v25 = v12;
        [v15 addressOrLOIWithType:v16 completion:v23];

        uint64_t v17 = v24;
        goto LABEL_6;
      case 3u:
        id v18 = [(ClientTypeResolver *)v13 parkedCarSource];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100CA1408;
        v20[3] = &unk_1012FA958;
        v21 = v14;
        v22 = v12;
        [v18 objectWithCompletion:v20];

        uint64_t v17 = v21;
LABEL_6:

        break;
      case 4u:
        id v19 = +[SearchResult currentLocationSearchResult];
        [(SearchFieldItem *)v14 setSearchResult:v19];

        goto LABEL_12;
      case 5u:
        if (v10)
        {
          [(SearchFieldItem *)v14 setCompletion:v10];
        }
        else if (v11)
        {
          [(SearchFieldItem *)v14 setSearchResult:v11];
        }
LABEL_12:
        ((void (**)(id, SearchFieldItem *))v12)[2](v12, v14);
        break;
      default:
        break;
    }
  }
}

@end