@interface CuratedCollectionTextActivityProvider
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation CuratedCollectionTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:UIActivityTypeMail])
  {
    v6 = [(CuratedCollectionActivityProvider *)self curatedCollection];

    if (v6)
    {
      v7 = [(CuratedCollectionActivityProvider *)self curatedCollection];
      v8 = [v7 photos];
      v9 = [v8 firstObject];
      uint64_t v37 = HTMLStringForPhoto();

      v10 = +[NSBundle mainBundle];
      v11 = [v10 localizedStringForKey:@"Maps Guide: Guide Name [Curated Guide Sharing]" value:@"localized string not found" table:0];
      v12 = [(CuratedCollectionActivityProvider *)self title];
      v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
      v14 = [v13 _navigation_sanitizedStringForDisplayInHTML];

      v15 = [(CuratedCollectionActivityProvider *)self curatedCollection];
      v16 = [v15 publisher];
      v17 = [v16 publisherAttribution];
      v18 = [v17 displayName];
      v19 = [v18 _navigation_sanitizedStringForDisplayInHTML];

      v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"count_of_places" value:@"localized string not found" table:0];
      v22 = [(CuratedCollectionActivityProvider *)self curatedCollection];
      v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, [v22 numberOfItems]);
      v24 = [v23 _navigation_sanitizedStringForDisplayInHTML];

      v25 = +[NSString stringWithFormat:@"<b>%@</b><br>%@<br>%@", v14, v19, v24];
      v26 = [(CuratedCollectionActivityProvider *)self url];
      v27 = +[NSBundle mainBundle];
      v28 = [v27 localizedStringForKey:@"Open in Apple Maps [Curated Guide Sharing]" value:@"localized string not found" table:0];
      v29 = HTMLStringForURLWithLabel();

      v30 = (CuratedCollectionLinkMetadataProvider *)v37;
      v31 = HTMLBodyWrapperStringWithFormat();

LABEL_9:
      goto LABEL_11;
    }
    v32 = [(CuratedCollectionActivityProvider *)self publisher];

    if (v32)
    {
      v33 = [CuratedCollectionLinkMetadataProvider alloc];
      v34 = [(CuratedCollectionActivityProvider *)self publisher];
      v30 = [(CuratedCollectionActivityProvider *)v33 initWithPublisher:v34];

      v35 = [(CuratedCollectionTextActivityProvider *)self delegate];
      [(CuratedCollectionLinkMetadataProvider *)v30 setDelegate:v35];

      v14 = [(CuratedCollectionLinkMetadataProvider *)v30 activityViewControllerLinkPresentationMetadata:0];
      v31 = HTMLStringForMetadata();
      goto LABEL_9;
    }
  }
  else if (([v5 isEqualToString:UIActivityTypeMessage] & 1) == 0 {
         && ([v5 isEqualToString:UIActivityTypeCopyToPasteboard] & 1) == 0)
  }
  {
    v31 = [(CuratedCollectionActivityProvider *)self title];
    goto LABEL_11;
  }
  v31 = 0;
LABEL_11:

  return v31;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_101324E70;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = [(CuratedCollectionActivityProvider *)self publisher];

  if (v5)
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Maps Guides: %@ [Sharing]" value:@"localized string not found" table:0];
    v8 = [(CuratedCollectionActivityProvider *)self title];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
  }
  else
  {
    v9 = [(CuratedCollectionActivityProvider *)self title];
  }

  return v9;
}

@end