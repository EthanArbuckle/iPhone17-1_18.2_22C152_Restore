@interface WFDataConfigurationParametersDataSource
- (BOOL)showsParameterDescription;
- (NSArray)footerButtons;
- (WFDataConfigurationParametersDataSource)initWithTableView:(id)a3 cellProvider:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4;
- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5;
- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4 hiddenParameterKeys:(id)a5 completion:(id)a6;
- (void)setFooterButtons:(id)a3;
- (void)setShowsParameterDescription:(BOOL)a3;
@end

@implementation WFDataConfigurationParametersDataSource

- (void).cxx_destruct
{
}

- (void)setFooterButtons:(id)a3
{
}

- (NSArray)footerButtons
{
  return self->_footerButtons;
}

- (void)setShowsParameterDescription:(BOOL)a3
{
  self->_showsParameterDescription = a3;
}

- (BOOL)showsParameterDescription
{
  return self->_showsParameterDescription;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(WFDataConfigurationParametersDataSource *)self snapshot];
  v7 = [v6 sectionIdentifiers];
  if ((unint64_t)[v7 count] <= a4)
  {

    v13 = 0;
  }
  else
  {
    unsigned __int8 v8 = [(WFDataConfigurationParametersDataSource *)self showsParameterDescription];

    if ((v8 & 1) == 0)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v9 = [(WFDataConfigurationParametersDataSource *)self snapshot];
    v10 = [v9 sectionIdentifiers];
    v11 = [v10 objectAtIndexedSubscript:a4];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v6 = v12;

    v13 = [v6 sectionFooter];
  }

LABEL_12:
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(WFDataConfigurationParametersDataSource *)self snapshot];
  v7 = [v6 sectionIdentifiers];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= a4)
  {
    v13 = 0;
  }
  else
  {
    v9 = [(WFDataConfigurationParametersDataSource *)self snapshot];
    v10 = [v9 sectionIdentifiers];
    v11 = [v10 objectAtIndexedSubscript:a4];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v14 = v12;

    v13 = [v14 sectionTitle];
  }
  return v13;
}

- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4 hiddenParameterKeys:(id)a5 completion:(id)a6
{
  BOOL v34 = a4;
  id v9 = a3;
  id v10 = a5;
  id v36 = a6;
  v11 = [v9 configurableParameters];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10001E848;
  v55[3] = &unk_10002DCE8;
  id v12 = v10;
  id v56 = v12;
  v13 = objc_msgSend(v11, "if_objectsPassingTest:", v55);

  if ([v13 count])
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10001E890;
    v53[3] = &unk_10002DD10;
    v53[4] = self;
    v35 = [v13 indexesOfObjectsWithOptions:1 passingTest:v53];
    id v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
    if ([v35 count])
    {
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      uint64_t v52 = 0;
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      uint64_t v48 = 0;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10001E918;
      v40[3] = &unk_10002DD38;
      v43 = &v49;
      id v15 = v13;
      id v41 = v15;
      v44 = &v45;
      id v16 = v14;
      id v42 = v16;
      [v35 enumerateIndexesUsingBlock:v40];
      unint64_t v17 = v50[3];
      if (v17 < (unint64_t)[v15 count])
      {
        uint64_t v18 = v50[3];
        v19 = (char *)[v15 count];
        v20 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v18, &v19[-v50[3]]);
        v21 = [v15 objectsAtIndexes:v20];
        v22 = [WFDataConfigurationParametersSection alloc];
        ++v46[3];
        v23 = -[WFDataConfigurationParametersSection initWithParameters:sectionIndex:](v22, "initWithParameters:sectionIndex:", v21);
        [v16 addObject:v23];
      }
      _Block_object_dispose(&v45, 8);
      _Block_object_dispose(&v49, 8);
    }
    else
    {
      v25 = [[WFDataConfigurationParametersSection alloc] initWithParameters:v13 sectionIndex:0];
      [v14 addObject:v25];
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001EA8C;
    v38[3] = &unk_10002DD60;
    id v26 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    id v39 = v26;
    [v14 enumerateObjectsUsingBlock:v38];
    v27 = [(WFDataConfigurationParametersDataSource *)self footerButtons];
    if ([v27 count])
    {
      v28 = [[WFDataConfigurationButtonsSection alloc] initWithButtons:v27];
      v57 = v28;
      v29 = +[NSArray arrayWithObjects:&v57 count:1];
      [v26 appendSectionsWithIdentifiers:v29];

      v30 = [(WFDataConfigurationButtonsSection *)v28 buttons];
      v31 = objc_msgSend(v30, "if_map:", &stru_10002DDA0);
      [v26 appendItemsWithIdentifiers:v31];
    }
    v32 = [(WFDataConfigurationParametersDataSource *)self snapshot];
    unsigned __int8 v33 = [v32 isEqual:v26];

    if ((v33 & 1) == 0)
    {
      v37.receiver = self;
      v37.super_class = (Class)WFDataConfigurationParametersDataSource;
      [(WFDataConfigurationParametersDataSource *)&v37 applySnapshot:v26 animatingDifferences:v34 completion:v36];
    }
  }
  else
  {
    id v24 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    v54.receiver = self;
    v54.super_class = (Class)WFDataConfigurationParametersDataSource;
    [(WFDataConfigurationParametersDataSource *)&v54 applySnapshot:v24 animatingDifferences:v34 completion:v36];
  }
}

- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4 completion:(id)a5
{
}

- (void)applyParametersFromAction:(id)a3 animatingDifferences:(BOOL)a4
{
}

- (WFDataConfigurationParametersDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFDataConfigurationParametersDataSource;
  v4 = [(WFDataConfigurationParametersDataSource *)&v8 initWithTableView:a3 cellProvider:a4];
  v5 = v4;
  if (v4)
  {
    [(WFDataConfigurationParametersDataSource *)v4 setDefaultRowAnimation:0];
    id v6 = v5;
  }

  return v5;
}

@end