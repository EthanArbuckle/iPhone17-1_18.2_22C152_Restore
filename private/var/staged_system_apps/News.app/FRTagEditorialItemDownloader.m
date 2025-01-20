@interface FRTagEditorialItemDownloader
- (FCTagController)tagController;
- (FREditorialItemEntryManager)editorialItemEntryManager;
- (FRTagEditorialItemDownloader)initWithTagController:(id)a3 editorialItemEntryManager:(id)a4;
- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4;
@end

@implementation FRTagEditorialItemDownloader

- (FRTagEditorialItemDownloader)initWithTagController:(id)a3 editorialItemEntryManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007C4A0();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007C3C0();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRTagEditorialItemDownloader;
  v9 = [(FRTagEditorialItemDownloader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tagController, a3);
    objc_storeStrong((id *)&v10->_editorialItemEntryManager, a4);
  }

  return v10;
}

- (void)downloadEditorialItemWithIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(location, self);
    id v8 = [(FRTagEditorialItemDownloader *)self tagController];
    id v9 = &_dispatch_main_q;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006BD88;
    v11[3] = &unk_1000CA8A8;
    objc_copyWeak(&v13, location);
    id v12 = v7;
    [v8 fetchTagsForTagIDs:v6 qualityOfService:9 callbackQueue:&_dispatch_main_q completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    location[1] = _NSConcreteStackBlock;
    location[2] = (id)3221225472;
    location[3] = sub_10006BD68;
    location[4] = &unk_1000C6E28;
    id v10 = v7;
    id v15 = v10;
    if (v10)
    {
      (*((void (**)(id, void *))v10 + 2))(v10, &__NSDictionary0__struct);
    }
  }
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);

  objc_storeStrong((id *)&self->_tagController, 0);
}

@end