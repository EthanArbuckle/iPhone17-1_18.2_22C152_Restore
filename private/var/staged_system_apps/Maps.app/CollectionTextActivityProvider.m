@interface CollectionTextActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation CollectionTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:UIActivityTypeMail])
  {
    v6 = [(CollectionActivityProvider *)self mapItems];
    v7 = HTMLStringForAnnotatedSnapshotImageWithMapItems();

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Maps Guide: Guide Name [User Guide Sharing]" value:@"localized string not found" table:0];
    v10 = [(CollectionActivityProvider *)self collectionInfo];
    v11 = [v10 title];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);
    uint64_t v13 = [v12 _navigation_sanitizedStringForDisplayInHTML];

    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"count_of_places" value:@"localized string not found" table:0];
    v16 = [(CollectionActivityProvider *)self mapItems];
    v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, [v16 count]);
    v18 = [v17 _navigation_sanitizedStringForDisplayInHTML];

    v19 = (void *)v13;
    v20 = +[NSString stringWithFormat:@"<b>%@</b><br>%@", v13, v18];
    v21 = [(CollectionActivityProvider *)self collectionInfo];
    v22 = [v21 sharingURL];
    v23 = +[NSBundle mainBundle];
    v24 = [v23 localizedStringForKey:@"Open in Apple Maps [User Guide Sharing]" value:@"localized string not found" table:0];
    v25 = HTMLStringForURLWithLabel();

    v26 = HTMLBodyWrapperStringWithFormat();
  }
  else
  {
    if (([v5 isEqualToString:UIActivityTypeMessage] & 1) != 0
      || ([v5 isEqualToString:UIActivityTypeCopyToPasteboard] & 1) != 0)
    {
      v26 = 0;
      goto LABEL_8;
    }
    v7 = [(CollectionActivityProvider *)self collectionInfo];
    v26 = [v7 title];
  }

LABEL_8:

  return v26;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_101324E70;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v4 = [(CollectionActivityProvider *)self collectionInfo];
  id v5 = [v4 title];

  return v5;
}

@end