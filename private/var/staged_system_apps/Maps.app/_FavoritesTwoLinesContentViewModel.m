@interface _FavoritesTwoLinesContentViewModel
- (MSPQuery)observedQuery;
- (id)_secondaryTitleForPlaceCount:(unint64_t)a3 transitLineCount:(unint64_t)a4;
- (id)_secondaryTitlePlacesOnly:(unint64_t)a3;
- (id)_secondaryTitleTransitLineOnly:(unint64_t)a3;
- (void)_updateSubtitleWithContents:(id)a3;
- (void)setObservedQuery:(id)a3;
@end

@implementation _FavoritesTwoLinesContentViewModel

- (void)setObservedQuery:(id)a3
{
  v5 = (MSPQuery *)a3;
  if (self->_observedQuery != v5)
  {
    objc_storeStrong((id *)&self->_observedQuery, a3);
    objc_initWeak(&location, self);
    observedQuery = self->_observedQuery;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A120A4;
    v8[3] = &unk_1013145C0;
    objc_copyWeak(&v9, &location);
    id v7 = &_dispatch_main_q;
    [(MSPQuery *)observedQuery setChangeHandler:v8 queue:&_dispatch_main_q];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_updateSubtitleWithContents:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          ++v7;
        }
        else {
          v8 += [v11 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
    if (v8)
    {
      if (v7) {
        [(_FavoritesTwoLinesContentViewModel *)self _secondaryTitleForPlaceCount:v7 transitLineCount:v8];
      }
      else {
      v12 = [(_FavoritesTwoLinesContentViewModel *)self _secondaryTitleTransitLineOnly:v8];
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  v12 = [(_FavoritesTwoLinesContentViewModel *)self _secondaryTitlePlacesOnly:v7];
LABEL_17:
  v13 = v12;
  if (![(__CFString *)v12 length])
  {

    v13 = @" ";
  }
  [(_BasicTwoLinesContentViewModel *)self setSubtitleText:v13];
}

- (id)_secondaryTitlePlacesOnly:(unint64_t)a3
{
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"count_of_places" value:@"localized string not found" table:0];

  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)_secondaryTitleTransitLineOnly:(unint64_t)a3
{
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"count_of_transit_lines" value:@"localized string not found" table:0];

  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (id)_secondaryTitleForPlaceCount:(unint64_t)a3 transitLineCount:(unint64_t)a4
{
  id v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"count_of_places" value:@"localized string not found" table:0];

  uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, a3);
  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"count_of_transit_lines" value:@"localized string not found" table:0];

  v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a4);
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"count_of_places_and_transit_lines" value:@"localized string not found" table:0];

  long long v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v11);

  return v14;
}

- (MSPQuery)observedQuery
{
  return self->_observedQuery;
}

- (void).cxx_destruct
{
}

@end