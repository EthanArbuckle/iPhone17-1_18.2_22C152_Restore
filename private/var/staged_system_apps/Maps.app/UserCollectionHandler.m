@interface UserCollectionHandler
- (BOOL)beingModified;
- (BOOL)canAddContent;
- (BOOL)canDelete;
- (BOOL)canDeleteContent;
- (BOOL)canEditImage;
- (BOOL)canEditTitle;
- (BOOL)containsItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsToBePersisted;
- (BOOL)updateImage:(id)a3;
- (BOOL)updateTitle:(id)a3;
- (MSCollection)collectionAsMapsSyncCollection;
- (UserCollectionHandler)initWithCollection:(id)a3;
- (id)identifier;
- (id)sharingURL;
- (id)stagedTitle;
- (id)title;
- (int)showAction;
- (int64_t)contentType;
- (int64_t)handlerType;
- (void)addObjects:(id)a3 completion:(id)a4;
- (void)endModification;
- (void)rebuildContent;
- (void)removeObjects:(id)a3 completion:(id)a4;
- (void)setCollection:(id)a3;
- (void)setNeedsToBePersisted:(BOOL)a3;
- (void)setStagedTitle:(id)a3;
- (void)startModification;
- (void)updateCollection:(id)a3;
- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5;
- (void)updateWithMapsSyncCollection:(id)a3;
@end

@implementation UserCollectionHandler

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 identifier];
    v6 = [(UserCollectionHandler *)self identifier];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)identifier
{
  v2 = [(CollectionHandler *)self collection];
  v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)updateWithMapsSyncCollection:(id)a3
{
  [(UserCollectionHandler *)self setCollection:a3];

  [(UserCollectionHandler *)self rebuildContent];
}

- (void)setCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = +[NSString stringWithFormat:@"collection is not a MapsSync Collection"];
      *(_DWORD *)buf = 136315906;
      v11 = "-[UserCollectionHandler setCollection:]";
      __int16 v12 = 2080;
      v13 = "UserCollectionHandler.m";
      __int16 v14 = 1024;
      int v15 = 74;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
    }
    if (sub_100BB36BC())
    {
      unsigned __int8 v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UserCollectionHandler;
  [(CollectionHandler *)&v9 setCollection:v4];
}

- (UserCollectionHandler)initWithCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15.receiver = self;
    v15.super_class = (Class)UserCollectionHandler;
    v5 = [(CollectionHandler *)&v15 initWithCollection:v4];
    v6 = v5;
    if (v5)
    {
      v5->_modficationLock._os_unfair_lock_opaque = 0;
      uint64_t v7 = geo_dispatch_queue_create_with_qos();
      contentRebuildQueue = v6->_contentRebuildQueue;
      v6->_contentRebuildQueue = (OS_dispatch_queue *)v7;

      [(UserCollectionHandler *)v6 rebuildContent];
    }
    self = v6;
    objc_super v9 = self;
  }
  else
  {
    v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = +[NSString stringWithFormat:@"collection is not a MapsSync Collection"];
      *(_DWORD *)buf = 136315906;
      v17 = "-[UserCollectionHandler initWithCollection:]";
      __int16 v18 = 2080;
      v19 = "UserCollectionHandler.m";
      __int16 v20 = 1024;
      int v21 = 59;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
    }
    if (sub_100BB36BC())
    {
      __int16 v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    objc_super v9 = 0;
  }

  return v9;
}

- (void)rebuildContent
{
  objc_initWeak(&location, self);
  contentRebuildQueue = self->_contentRebuildQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000977C0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(contentRebuildQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (int64_t)contentType
{
  return 1;
}

- (MSCollection)collectionAsMapsSyncCollection
{
  v3 = [(CollectionHandler *)self collection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CollectionHandler *)self collection];
  }
  else
  {
    v6 = sub_1005762E4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = +[NSString stringWithFormat:@"collection is not a MapsSync Collection"];
      int v11 = 136315906;
      __int16 v12 = "-[UserCollectionHandler collectionAsMapsSyncCollection]";
      __int16 v13 = 2080;
      __int16 v14 = "UserCollectionHandler.m";
      __int16 v15 = 1024;
      int v16 = 82;
      __int16 v17 = 2112;
      __int16 v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v11, 0x26u);
    }
    if (sub_100BB36BC())
    {
      v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_super v9 = +[NSThread callStackSymbols];
        int v11 = 138412290;
        __int16 v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v5 = 0;
  }

  return (MSCollection *)v5;
}

- (void)startModification
{
  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  ++self->_modificationCount;

  os_unfair_lock_unlock(p_modficationLock);
}

- (void)endModification
{
  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  --self->_modificationCount;

  os_unfair_lock_unlock(p_modficationLock);
}

- (BOOL)beingModified
{
  v2 = self;
  p_modficationLock = &self->_modficationLock;
  os_unfair_lock_lock(&self->_modficationLock);
  LOBYTE(v2) = v2->_modificationCount != 0;
  os_unfair_lock_unlock(p_modficationLock);
  return (char)v2;
}

- (int64_t)handlerType
{
  return 0;
}

- (id)sharingURL
{
  return [(CollectionHandler *)self sharingURLFromContainedMapItems];
}

- (id)title
{
  v3 = [(UserCollectionHandler *)self stagedTitle];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(CollectionHandler *)self collection];
    id v5 = [v6 title];
  }

  return v5;
}

- (id)stagedTitle
{
  return self->_stagedTitle;
}

- (void)setStagedTitle:(id)a3
{
}

- (BOOL)canDelete
{
  v2 = [(CollectionHandler *)self collection];
  char v3 = [v2 isLegacyFavoritesCollection] ^ 1;

  return v3;
}

- (BOOL)canEditImage
{
  return 1;
}

- (BOOL)canEditTitle
{
  v2 = [(CollectionHandler *)self collection];
  char v3 = [v2 isLegacyFavoritesCollection] ^ 1;

  return v3;
}

- (BOOL)canAddContent
{
  return 1;
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (BOOL)updateTitle:(id)a3
{
  id v4 = a3;
  [(CollectionHandler *)self setHasBeenModified:1];
  id v5 = [(CollectionHandler *)self collection];
  [v5 setTitle:v4];

  [(UserCollectionHandler *)self setStagedTitle:v4];
  [(CollectionHandler *)self notifyObserversInfoUpdated];
  return 1;
}

- (BOOL)updateImage:(id)a3
{
  id v4 = (UIImage *)a3;
  [(CollectionHandler *)self setHasBeenModified:1];
  [(UIImage *)v4 size];
  if (v5 > 300.0)
  {
    v10.width = 300.0;
    v10.height = 300.0;
    UIGraphicsBeginImageContext(v10);
    -[UIImage drawInRect:](v4, "drawInRect:", 0.0, 0.0, 300.0, 300.0);
    uint64_t v6 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    id v4 = (UIImage *)v6;
  }
  uint64_t v7 = UIImagePNGRepresentation(v4);
  v8 = [(CollectionHandler *)self collection];
  [v8 setImage:v7];

  [(CollectionHandler *)self setStagedImage:v4];
  if (!self->_needsToBePersisted) {
    [(UserCollectionHandler *)self updateCollection:&stru_1012F2D88];
  }
  [(CollectionHandler *)self loadImage];

  return 1;
}

- (void)addObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UserCollectionHandler *)self startModification];
  v8 = [(UserCollectionHandler *)self collectionAsMapsSyncCollection];
  if (v8)
  {
    id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);
    objc_initWeak((id *)location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100649EE0;
    v15[3] = &unk_1012F2DB0;
    objc_copyWeak(&v21, (id *)location);
    id v16 = v6;
    id v17 = 0;
    id v18 = v8;
    id v19 = v9;
    id v20 = v7;
    id v10 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    int v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = +[NSString stringWithFormat:@"self.collection not a MapsSync Collection"];
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "-[UserCollectionHandler addObjects:completion:]";
      __int16 v23 = 2080;
      v24 = "UserCollectionHandler.m";
      __int16 v25 = 1024;
      int v26 = 220;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);
    }
    if (sub_100BB36BC())
    {
      __int16 v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = +[NSThread callStackSymbols];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
      }
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UserCollectionHandler *)self collectionAsMapsSyncCollection];
  id v9 = (void *)v8;
  if (v8)
  {
    v37 = (void *)v8;
    v38 = (void (**)(void, void))v7;
    uint64_t v10 = +[NSMutableArray array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v39 = v6;
    id v11 = v6;
    __int16 v12 = (void *)v10;
    id v13 = v11;
    id v14 = [v11 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v14) {
      goto LABEL_21;
    }
    id v15 = v14;
    uint64_t v16 = *(void *)v48;
    id v17 = GEOResultRefinementSort_ptr;
    while (1)
    {
      id v18 = 0;
      id v40 = v15;
      do
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v46.receiver = self;
          v46.super_class = (Class)UserCollectionHandler;
          id v20 = [(CollectionHandler *)&v46 itemForMapItem:v19];
          if (v20) {
            goto LABEL_18;
          }
        }
        else
        {
          id v21 = v19;
          if ([v21 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitLine]) {
            __int16 v22 = v21;
          }
          else {
            __int16 v22 = 0;
          }
          id v23 = v22;

          if (v23)
          {
            v24 = [(CollectionHandler *)self mapping];
            id v20 = [v24 objectForKey:v23];

            if (!v20)
            {
              __int16 v25 = [(CollectionHandler *)self mapping];
              [v23 name];
              uint64_t v26 = v16;
              __int16 v27 = self;
              v28 = v17;
              id v29 = v13;
              v31 = v30 = v12;
              id v20 = [v25 objectForKey:v31];

              __int16 v12 = v30;
              id v13 = v29;
              id v17 = v28;
              self = v27;
              uint64_t v16 = v26;
              id v15 = v40;
            }
          }
          else
          {
            id v20 = 0;
          }

          if (v20) {
LABEL_18:
          }
            [v12 addObject:v20];
        }

        id v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      id v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v15)
      {
LABEL_21:

        if ([v12 count])
        {
          [(UserCollectionHandler *)self startModification];
          objc_initWeak((id *)location, self);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10064A688;
          block[3] = &unk_1012EC980;
          objc_copyWeak(&v45, (id *)location);
          id v42 = v12;
          id v9 = v37;
          id v43 = v37;
          id v7 = v38;
          v44 = v38;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          objc_destroyWeak(&v45);
          objc_destroyWeak((id *)location);
        }
        else
        {
          id v9 = v37;
          id v7 = v38;
          if (v38)
          {
            v36 = +[NSError GEOErrorWithCode:0 reason:@"No object to remove"];
            ((void (**)(void, void *))v38)[2](v38, v36);
          }
        }

        id v6 = v39;
        goto LABEL_34;
      }
    }
  }
  v32 = sub_1005762E4();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v33 = +[NSString stringWithFormat:@"self.collection not a MapsSync Collection"];
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[UserCollectionHandler removeObjects:completion:]";
    __int16 v53 = 2080;
    v54 = "UserCollectionHandler.m";
    __int16 v55 = 1024;
    int v56 = 272;
    __int16 v57 = 2112;
    v58 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", location, 0x26u);
  }
  if (sub_100BB36BC())
  {
    v34 = sub_1005762E4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = +[NSThread callStackSymbols];
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
    }
  }
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_34:
}

- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(CollectionHandler *)self itemForMapItem:a4];
  [v10 setCustomName:v9];

  id v11 = +[MapsSyncStore sharedStore];
  id v20 = v10;
  __int16 v12 = +[NSArray arrayWithObjects:&v20 count:1];
  id v19 = 0;
  [v11 saveWithObjects:v12 error:&v19];
  id v13 = v19;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10064AAEC;
  block[3] = &unk_1012E5F78;
  id v17 = v13;
  id v18 = v8;
  id v14 = v13;
  id v15 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)containsItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UserCollectionHandler;
  char v3 = [(CollectionHandler *)&v6 itemForMapItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateCollection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10064AC5C;
  v7[3] = &unk_1012F2DD8;
  id v5 = v4;
  id v8 = v5;
  objc_copyWeak(&v9, &location);
  v6.receiver = self;
  v6.super_class = (Class)UserCollectionHandler;
  [(CollectionHandler *)&v6 updateCollection:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (int)showAction
{
  v2 = [(CollectionHandler *)self collection];
  unsigned int v3 = [v2 isLegacyFavoritesCollection];

  if (v3) {
    return 2084;
  }
  else {
    return 2067;
  }
}

- (BOOL)needsToBePersisted
{
  return self->_needsToBePersisted;
}

- (void)setNeedsToBePersisted:(BOOL)a3
{
  self->_needsToBePersisted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRebuildQueue, 0);

  objc_storeStrong((id *)&self->_stagedTitle, 0);
}

@end