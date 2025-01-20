@interface CollectionAddViewController
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (CollectionSaveSession)editSession;
- (id)headerTitle;
- (int)requestSource;
- (void)saveMapItem:(id)a3;
- (void)setEditSession:(id)a3;
@end

@implementation CollectionAddViewController

- (id)headerTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[Guide] Save to My Guides" value:@"localized string not found" table:0];

  return v3;
}

- (int)requestSource
{
  return 22;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6 = a4;
  editSession = self->_editSession;
  id v8 = a3;
  v9 = [(CollectionEditSession *)editSession collection];
  v15.receiver = self;
  v15.super_class = (Class)CollectionAddViewController;
  LOBYTE(self) = [(AddFromACViewController *)&v15 searchDataSource:v8 shouldFilterItem:v6];

  if ((self & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v6 geoCompletionItem];
      v12 = [v11 geoMapItem];

      id v13 = [objc_alloc((Class)MKMapItem) initWithGeoMapItem:v12 isPlaceHolderPlace:0];
      if (!v13)
      {
LABEL_9:
        unsigned __int8 v10 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      id v13 = v6;
      if (!v13) {
        goto LABEL_9;
      }
    }
    unsigned __int8 v10 = [v9 containsItem:v13];

    goto LABEL_10;
  }
  unsigned __int8 v10 = 1;
LABEL_10:

  return v10;
}

- (void)saveMapItem:(id)a3
{
  id v4 = a3;
  v5 = [(CollectionEditSession *)self->_editSession collection];
  [(CollectionEditSession *)self->_editSession addSelectedObject:v4];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10089DE98;
  v15[3] = &unk_1012E5D58;
  v15[4] = self;
  id v6 = v5;
  id v16 = v6;
  v7 = objc_retainBlock(v15);
  if ([(CollectionSaveSession *)self->_editSession canRenameSelectedObjectInCollection:v6])
  {
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_10089E07C;
    v12 = &unk_1012E8EE0;
    id v13 = v4;
    v14 = v7;
    id v8 = +[UIViewController _maps_viewControllerForRenamingMapItem:v13 saveHandler:&v9 cancelHandler:0];
    -[CollectionAddViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0, v9, v10, v11, v12);
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
}

- (CollectionSaveSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end