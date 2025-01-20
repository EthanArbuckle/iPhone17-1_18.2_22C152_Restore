@interface AEAssetActivityItemProvider
- (AEAnnotationPaginationDataSource)paginationDataSource;
- (AEAssetActivityItemProvider)initWithAnnotation:(id)a3 propertySource:(id)a4;
- (AEAssetActivityItemProvider)initWithAnnotations:(id)a3 propertySource:(id)a4;
- (AEAssetActivityItemProvider)initWithPropertySource:(id)a3;
- (AEAssetNotesActivityItemProvider)notesProvider;
- (AEAssetTextActivityItemProvider)textProvider;
- (AEAssetURLActivityItemProvider)urlProvider;
- (BOOL)areCitationsAllowed;
- (BOOL)itemProviderSource:(id)a3 shouldShareActivityType:(id)a4;
- (NSArray)annotations;
- (NSString)activityType;
- (id)expandedItemProviders;
- (id)pasteboardString;
- (id)propertySource;
- (int64_t)shareType;
- (void)dealloc;
- (void)setActivityType:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setCitationsAllowed:(BOOL)a3;
- (void)setNotesProvider:(id)a3;
- (void)setPaginationDataSource:(id)a3;
- (void)setPropertySource:(id)a3;
- (void)setShareType:(int64_t)a3;
- (void)setTextProvider:(id)a3;
- (void)setUrlProvider:(id)a3;
@end

@implementation AEAssetActivityItemProvider

- (AEAssetActivityItemProvider)initWithAnnotation:(id)a3 propertySource:(id)a4
{
  id v6 = a4;
  v7 = +[NSArray arrayWithObject:a3];
  v8 = [(AEAssetActivityItemProvider *)self initWithAnnotations:v7 propertySource:v6];

  if (v8) {
    v8->_shareType = 0;
  }

  return v8;
}

- (AEAssetActivityItemProvider)initWithAnnotations:(id)a3 propertySource:(id)a4
{
  id v7 = a3;
  v8 = [(AEAssetActivityItemProvider *)self initWithPropertySource:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_annotations, a3);
    v9->_shareType = 1;
  }

  return v9;
}

- (AEAssetActivityItemProvider)initWithPropertySource:(id)a3
{
  id v4 = a3;
  v5 = [(AEAssetActivityItemProvider *)self init];
  if (v5)
  {
    id v6 = [v4 copy];
    id propertySource = v5->_propertySource;
    v5->_id propertySource = v6;

    v5->_shareType = 2;
  }

  return v5;
}

- (void)dealloc
{
  id propertySource = self->_propertySource;
  self->_id propertySource = 0;

  objc_storeWeak((id *)&self->_paginationDataSource, 0);
  v4.receiver = self;
  v4.super_class = (Class)AEAssetActivityItemProvider;
  [(AEAssetActivityItemProvider *)&v4 dealloc];
}

- (id)pasteboardString
{
  int64_t v3 = [(AEAssetActivityItemProvider *)self shareType];
  if (v3 == 2)
  {
    id v6 = [(AEAssetActivityItemProvider *)self propertySource];
    uint64_t v8 = +[AEAssetTextActivityItemProvider textItemWithPropertySource:v6];
  }
  else
  {
    if (v3 || ![(AEAssetActivityItemProvider *)self areCitationsAllowed])
    {
      v9 = 0;
      goto LABEL_8;
    }
    objc_super v4 = [(AEAssetActivityItemProvider *)self annotations];
    v5 = [(AEAssetActivityItemProvider *)self propertySource];
    id v6 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v4 propertySource:v5];

    [v6 setCitationsAllowed:1];
    id v7 = [(AEAssetActivityItemProvider *)self paginationDataSource];
    [v6 setPaginationDataSource:v7];

    uint64_t v8 = [v6 activityViewController:0 itemForActivityType:UIActivityTypeCopyToPasteboard];
  }
  v9 = (void *)v8;

LABEL_8:

  return v9;
}

- (id)expandedItemProviders
{
  BOOL v3 = [(AEAssetActivityItemProvider *)self areCitationsAllowed];
  objc_super v4 = [(AEAssetActivityItemProvider *)self propertySource];
  v5 = [(AEAssetActivityItemProvider *)self paginationDataSource];
  int64_t v6 = [(AEAssetActivityItemProvider *)self shareType];
  if (v6 == 2)
  {
    v12 = [[AEAssetTextActivityItemProvider alloc] initWithDelegate:self propertySource:v4];
    [(AEAssetActivityItemProvider *)self setTextProvider:v12];

    v13 = [[AEAssetNotesActivityItemProvider alloc] initWithDelegate:self propertySource:v4];
    [(AEAssetActivityItemProvider *)self setNotesProvider:v13];

    id v7 = [[AEAssetLinkPresentationActivityItemProvider alloc] initWithDelegate:self propertySource:v4];
    v14 = [(AEAssetActivityItemProvider *)self textProvider];
    v28[0] = v14;
    v15 = [(AEAssetActivityItemProvider *)self notesProvider];
    v28[1] = v15;
    v28[2] = v7;
    v11 = +[NSArray arrayWithObjects:v28 count:3];

    v16 = [[AEAssetURLActivityItemProvider alloc] initWithDelegate:self propertySource:v4];
    v17 = [(AEAssetBaseActivityItemProvider *)v16 propertyProvider];
    if ([v17 isStoreAsset])
    {
    }
    else
    {
      char v19 = sub_157B4(v16, 0);

      if ((v19 & 1) == 0)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    [(AEAssetActivityItemProvider *)self setUrlProvider:v16];
    uint64_t v18 = [(AEAnnotationLinkPresentationItemProvider *)v11 arrayByAddingObject:v16];
    goto LABEL_13;
  }
  if (v6 == 1)
  {
    id v7 = [(AEAssetActivityItemProvider *)self annotations];
    v16 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    [(AEAssetURLActivityItemProvider *)v16 setCitationsAllowed:v3];
    [(AEAssetURLActivityItemProvider *)v16 setPaginationDataSource:v5];
    v11 = [(AEAnnotationActivityItemProviderSource *)[AEAnnotationLinkPresentationItemProvider alloc] initWithAnnotations:v7 propertySource:v4];
    v29[0] = v16;
    v29[1] = v11;
    uint64_t v18 = +[NSArray arrayWithObjects:v29 count:2];
LABEL_13:
    uint64_t v20 = v18;
LABEL_16:

    v11 = (AEAnnotationLinkPresentationItemProvider *)v20;
    goto LABEL_17;
  }
  if (v6)
  {
    v11 = (AEAnnotationLinkPresentationItemProvider *)&__NSArray0__struct;
    goto LABEL_19;
  }
  id v7 = [(AEAssetActivityItemProvider *)self annotations];
  uint64_t v8 = [(AEAssetLinkPresentationActivityItemProvider *)v7 objectAtIndexedSubscript:0];
  unsigned int v9 = [v8 annotationHasNote];

  if (v3 | v9)
  {
    v10 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    [v10 setCitationsAllowed:v3];
    [v10 setPaginationDataSource:v5];
    v31 = v10;
    v11 = +[NSArray arrayWithObjects:&v31 count:1];

    if (!v3) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  v11 = (AEAnnotationLinkPresentationItemProvider *)&__NSArray0__struct;
  if (v3)
  {
LABEL_15:
    v16 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    v21 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    v22 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    v23 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    v24 = +[AEAnnotationActivityItemProviderSource activityItemProviderSourceWithAnnotations:v7 propertySource:v4];
    [(AEAssetURLActivityItemProvider *)v16 setCitationsAllowed:1];
    [(AEAnnotationActivityItemProviderSource *)v21 setCitationsAllowed:1];
    [v22 setCitationsAllowed:1];
    [v23 setCitationsAllowed:1];
    [v24 setCitationsAllowed:1];
    [(AEAssetURLActivityItemProvider *)v16 setPaginationDataSource:v5];
    v27 = v21;
    [(AEAnnotationActivityItemProviderSource *)v21 setPaginationDataSource:v5];
    [v22 setPaginationDataSource:v5];
    [v23 setPaginationDataSource:v5];
    [v24 setPaginationDataSource:v5];
    v30[0] = v16;
    v30[1] = v21;
    v30[2] = v22;
    v30[3] = v23;
    v30[4] = v24;
    v25 = +[NSArray arrayWithObjects:v30 count:5];
    uint64_t v20 = [(AEAnnotationLinkPresentationItemProvider *)v11 arrayByAddingObjectsFromArray:v25];

    v11 = v27;
    goto LABEL_16;
  }
LABEL_18:

LABEL_19:

  return v11;
}

- (BOOL)itemProviderSource:(id)a3 shouldShareActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AEAssetActivityItemProvider *)self notesProvider];
  unsigned int v9 = [v8 supportsActivityType:v7];

  v10 = [v6 propertyProvider];
  unsigned int v11 = [v10 isStoreAsset];

  int v12 = sub_157B4(v6, v7);
  id v13 = [(AEAssetActivityItemProvider *)self textProvider];

  if (v13 == v6)
  {
    if ((v11 | v12) == 1)
    {
      uint64_t v18 = [(AEAssetActivityItemProvider *)self urlProvider];
      char v17 = v18 == 0;
    }
    else
    {
      char v17 = 1;
    }
  }
  else
  {
    id v14 = [(AEAssetActivityItemProvider *)self urlProvider];

    if (v14 == v6)
    {
      if (v9) {
        char v17 = v12;
      }
      else {
        char v17 = v11 | v12;
      }
    }
    else
    {
      id v15 = [(AEAssetActivityItemProvider *)self notesProvider];

      if (v15 == v6) {
        char v16 = v9;
      }
      else {
        char v16 = 0;
      }
      char v17 = v16 & v11;
    }
  }

  return v17;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (void)setShareType:(int64_t)a3
{
  self->_shareType = a3;
}

- (id)propertySource
{
  return self->_propertySource;
}

- (void)setPropertySource:(id)a3
{
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paginationDataSource);

  return (AEAnnotationPaginationDataSource *)WeakRetained;
}

- (void)setPaginationDataSource:(id)a3
{
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (AEAssetTextActivityItemProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
}

- (AEAssetURLActivityItemProvider)urlProvider
{
  return self->_urlProvider;
}

- (void)setUrlProvider:(id)a3
{
}

- (AEAssetNotesActivityItemProvider)notesProvider
{
  return self->_notesProvider;
}

- (void)setNotesProvider:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_notesProvider, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_destroyWeak((id *)&self->_paginationDataSource);
  objc_storeStrong(&self->_propertySource, 0);
  objc_storeStrong((id *)&self->_annotations, 0);

  objc_storeStrong((id *)&self->_contentProtected, 0);
}

@end