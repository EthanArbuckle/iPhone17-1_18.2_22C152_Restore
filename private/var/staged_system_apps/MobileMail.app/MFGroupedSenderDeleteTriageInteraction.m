@interface MFGroupedSenderDeleteTriageInteraction
- (BOOL)isDestructive;
- (id)_alertMessageForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6;
- (id)_alertTitleForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6;
- (id)_previewImageName;
- (id)title;
- (void)_addMessageDeletionActionsForAlertController:(id)a3 triageInteraction:(id)a4 categoryMessageCount:(unint64_t)a5 continuation:(id)a6;
@end

@implementation MFGroupedSenderDeleteTriageInteraction

- (id)title
{
  return (id)_EFLocalizedString();
}

- (id)_previewImageName
{
  return MFImageGlyphTrash;
}

- (BOOL)isDestructive
{
  return 1;
}

- (id)_alertTitleForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6
{
  id v9 = a3;
  if (a6 == a5 || a4 == 4 || a4 == 3 || a4 == 2)
  {
    v10 = _EFLocalizedString();
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v9);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_100619928;
  }

  return v11;
}

- (id)_alertMessageForDisplayName:(id)a3 selectedBucket:(int64_t)a4 categoryMessageCount:(unint64_t)a5 totalMessageCount:(unint64_t)a6
{
  id v9 = a3;
  if (a6 == a5)
  {
    v10 = _EFLocalizedStringFromTable();
    uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a6, v9);
  }
  else
  {
    if ((unint64_t)(a4 - 2) >= 3)
    {
      v10 = 0;
    }
    else
    {
      v10 = _EFLocalizedStringFromTable();
    }
    uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a5, a6, v9);
  }
  v12 = (void *)v11;

  return v12;
}

- (void)_addMessageDeletionActionsForAlertController:(id)a3 triageInteraction:(id)a4 categoryMessageCount:(unint64_t)a5 continuation:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = _EFLocalizedStringFromTable();
  uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a5);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10019AFD4;
  v19[3] = &unk_1006084B0;
  id v12 = v9;
  id v20 = v12;
  v13 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v19];

  [v8 addAction:v13];
  v14 = _EFLocalizedString();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10019AFE8;
  v17[3] = &unk_1006084B0;
  id v15 = v12;
  id v18 = v15;
  v16 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v17];

  [v8 addAction:v16];
}

@end