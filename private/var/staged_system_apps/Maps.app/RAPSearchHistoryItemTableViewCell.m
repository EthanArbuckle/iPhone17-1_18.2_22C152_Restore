@interface RAPSearchHistoryItemTableViewCell
- (void)setHistoryItem:(id)a3;
@end

@implementation RAPSearchHistoryItemTableViewCell

- (void)setHistoryItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 historyItem];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1001045E0;
  v31 = sub_100104B60;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1001045E0;
  v25 = sub_100104B60;
  id v26 = 0;
  uint64_t v6 = [v4 searchText];
  v7 = (void *)v28[5];
  v28[5] = v6;

  v8 = [v5 historyEntry];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100DB3CE8;
  v17[3] = &unk_101324010;
  v19 = &v27;
  v20 = &v21;
  id v9 = v4;
  id v18 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100DB3E18;
  v16[3] = &unk_1012F8798;
  v16[4] = &v27;
  [v8 ifSearch:v17 ifRoute:0 ifPlaceDisplay:v16 ifTransitLineItem:0];

  if (!v22[5])
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"[RAP] Cell_subtitle_for_a_previous_search_with_results_and_no_location" value:@"localized string not found" table:0];

    uint64_t v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, [v9 searchResultsCount]);
    v13 = (void *)v22[5];
    v22[5] = v12;
  }
  v14 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  [(RAPTwoLinesViewModelImpl *)v14 setTitle:v28[5]];
  [(RAPTwoLinesViewModelImpl *)v14 setSubtitle:v22[5]];
  v15 = +[UIImage imageNamed:@"search"];
  [(RAPTwoLinesViewModelImpl *)v14 setImage:v15];

  [(RAPTwoLinesMenuTableViewCell *)self setViewModel:v14];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

@end