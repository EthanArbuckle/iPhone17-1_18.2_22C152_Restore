@interface CarSmallWidgetShortcutsView
- (CarSmallWidgetShortcutsView)initWithShortcutsProvider:(id)a3;
- (id)data;
- (id)modelForItemAtIndexPath:(id)a3;
- (void)didSelectItemAtIndexPath:(id)a3;
@end

@implementation CarSmallWidgetShortcutsView

- (CarSmallWidgetShortcutsView)initWithShortcutsProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetShortcutsView;
  v6 = -[CarSmallWidgetCollectionView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortcutsProvider, a3);
    [(CarSmallWidgetShortcutsView *)v7 setAccessibilityIdentifier:@"CarSmallWidgetShortcutsView"];
  }

  return v7;
}

- (id)data
{
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v3 = +[MapsFavoritesManager sharedManager];
    v4 = [v3 shortcutsForCarplay];
  }
  else
  {
    v4 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
  }

  return v4;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    v6 = [v5 shortcutsForCarplay];
    id v7 = [v4 row];

    v8 = [v6 objectAtIndexedSubscript:v7];

    objc_super v9 = [[SuggestionShortcutsRowCellModel alloc] initWithMapsFavoriteItem:v8];
  }
  else
  {
    v10 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
    id v11 = [v4 row];

    v8 = [v10 objectAtIndexedSubscript:v11];

    objc_super v9 = [[SuggestionShortcutsRowCellModel alloc] initWithMapsSuggestionsEntry:v8];
  }
  v12 = v9;

  return v12;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v5 = +[MapsFavoritesManager sharedManager];
    v6 = [v5 shortcutsForCarplay];
    id v7 = [v6 objectAtIndexedSubscript:[v4 row]];
  }
  else
  {
    id v5 = [(CarShortcutsProvider *)self->_shortcutsProvider shortcuts];
    id v7 = [v5 objectAtIndexedSubscript:[v4 row]];
  }

  v8 = sub_100577F64();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = self;
    if (!v9)
    {
      v14 = @"<nil>";
      goto LABEL_13;
    }
    v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(CarSmallWidgetShortcutsView *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_11;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_11:

LABEL_13:
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItemAtIndexPath: %@", buf, 0x16u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D5F1A0;
  v16[3] = &unk_1012E5D58;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  +[MapsCarPlayServicesShim openMapsCarPlayApplicationWithCompletion:v16];
}

- (void).cxx_destruct
{
}

@end