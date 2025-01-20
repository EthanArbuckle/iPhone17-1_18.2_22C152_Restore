@interface MusicModelLiveRadioCaseItem
+ (id)__accessoryButtonTitleText_KEY;
+ (id)__backgroundArtworkCatalogBlock_KEY;
+ (id)__contentItem_KEY;
+ (id)__headerSubtitleText_KEY;
+ (id)__headerTitleText_KEY;
+ (id)__headlineText_KEY;
+ (id)__subtitleText_KEY;
+ (id)__titleText_KEY;
+ (id)__videoBackgroundArtworkCatalogBlock_KEY;
+ (id)requiredStoreLibraryPersonalizationProperties;
- (BOOL)isEqual:(id)a3;
- (id)backgroundArtworkCatalog;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
- (id)videoBackgroundArtworkCatalog;
@end

@implementation MusicModelLiveRadioCaseItem

+ (id)__contentItem_KEY
{
  return @"MusicModelRelationshipLiveRadioCaseItemContentItem";
}

+ (id)__headerTitleText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemHeaderTitleText";
}

+ (id)__headerSubtitleText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemHeaderSubtitleText";
}

+ (id)__accessoryButtonTitleText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemAccessoryButtonTitleText";
}

+ (id)__headlineText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemHeadlineText";
}

+ (id)__titleText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemTitleText";
}

+ (id)__subtitleText_KEY
{
  return @"MusicModelPropertyLiveRadioCaseItemSubtitleText";
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyLiveRadioCaseBackgroundArtwork";
}

+ (id)__videoBackgroundArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyLiveRadioCaseVideoBackgroundArtwork";
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3 = [(MusicModelLiveRadioCaseItem *)self backgroundArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelLiveRadioCaseItem *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)videoBackgroundArtworkCatalog
{
  uint64_t v3 = [(MusicModelLiveRadioCaseItem *)self videoBackgroundArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelLiveRadioCaseItem *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v2 = +[MPModelStoreBrowseContentItem requiredStoreLibraryPersonalizationProperties];
  if (v2)
  {
    id v3 = objc_alloc((Class)MPPropertySet);
    CFStringRef v7 = @"MusicModelRelationshipLiveRadioCaseItemContentItem";
    v8 = v2;
    v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v5 = [v3 initWithProperties:&__NSArray0__struct relationships:v4];
  }
  else
  {
    id v5 = +[MPPropertySet emptyPropertySet];
  }

  return v5;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicModelLiveRadioCaseItem *)self contentItem];
  v6 = [v4 relationships];

  CFStringRef v7 = [v6 objectForKey:@"MusicModelRelationshipLiveRadioCaseItemContentItem"];
  v8 = v7;
  if (!v7)
  {
    v8 = +[MPPropertySet emptyPropertySet];
  }
  v9 = [v5 personalizationScopedPropertiesForProperties:v8];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[MPPropertySet emptyPropertySet];
  }
  v12 = v11;

  if (!v7) {

  }
  return v12;
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  v2 = [(MusicModelLiveRadioCaseItem *)self contentItem];
  id v3 = [v2 relativeModelObjectForStoreLibraryPersonalization];

  return v3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicModelLiveRadioCaseItem *)self identifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __88__MusicModelLiveRadioCaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_CCB670;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MusicModelLiveRadioCaseItem *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

void __88__MusicModelLiveRadioCaseItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contentItem];
  id v6 = [v5 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 40)];

  [v4 setContentItem:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MusicModelLiveRadioCaseItem *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(MusicModelLiveRadioCaseItem *)self contentItem];
      id v7 = [(MusicModelLiveRadioCaseItem *)v5 contentItem];
      if (v6 == v7)
      {
      }
      else
      {
        unsigned int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          BOOL v9 = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      id v10 = [(MusicModelLiveRadioCaseItem *)self headerTitleText];
      id v11 = [(MusicModelLiveRadioCaseItem *)v5 headerTitleText];
      if (v10 == v11)
      {
      }
      else
      {
        unsigned int v12 = [v10 isEqual:v11];

        if (!v12)
        {
          BOOL v9 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      id v13 = [(MusicModelLiveRadioCaseItem *)self headerSubtitleText];
      id v14 = [(MusicModelLiveRadioCaseItem *)v5 headerSubtitleText];
      v55 = v13;
      if (v13 == v14)
      {
      }
      else
      {
        unsigned int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          BOOL v9 = 0;
LABEL_46:

          goto LABEL_47;
        }
      }
      id v16 = [(MusicModelLiveRadioCaseItem *)self accessoryButtonTitleText];
      id v17 = [(MusicModelLiveRadioCaseItem *)v5 accessoryButtonTitleText];
      v53 = v16;
      v54 = v17;
      if (v16 == v17)
      {
      }
      else
      {
        v18 = v17;
        unsigned int v19 = [v16 isEqual:v17];

        if (!v19)
        {
          BOOL v9 = 0;
          v20 = v53;
LABEL_45:

          goto LABEL_46;
        }
      }
      id v21 = [(MusicModelLiveRadioCaseItem *)self headlineText];
      id v22 = [(MusicModelLiveRadioCaseItem *)v5 headlineText];
      v50 = v22;
      v51 = v21;
      if (v21 == v22)
      {
      }
      else
      {
        v23 = v22;
        unsigned int v24 = [v21 isEqual:v22];

        if (!v24)
        {
          BOOL v9 = 0;
          v20 = v53;
LABEL_44:

          goto LABEL_45;
        }
      }
      id v25 = [(MusicModelLiveRadioCaseItem *)self subtitleText];
      id v26 = [(MusicModelLiveRadioCaseItem *)v5 subtitleText];
      v52 = v25;
      v49 = v26;
      if (v25 == v26)
      {
      }
      else
      {
        v27 = v26;
        unsigned int v28 = [v52 isEqual:v26];

        if (!v28)
        {
          BOOL v9 = 0;
          v20 = v53;
LABEL_43:

          goto LABEL_44;
        }
      }
      id v29 = [(MusicModelLiveRadioCaseItem *)self titleText];
      id v30 = [(MusicModelLiveRadioCaseItem *)v5 titleText];
      v47 = v30;
      v48 = v29;
      if (v29 == v30)
      {
      }
      else
      {
        v31 = v30;
        unsigned int v32 = [v29 isEqual:v30];

        if (!v32)
        {
          BOOL v9 = 0;
          v20 = v53;
LABEL_42:

          goto LABEL_43;
        }
      }
      id v33 = [(MusicModelLiveRadioCaseItem *)self backgroundArtworkCatalog];
      id v34 = [(MusicModelLiveRadioCaseItem *)v5 backgroundArtworkCatalog];
      v46 = v34;
      if (v33 == v34)
      {
      }
      else
      {
        id v35 = v34;
        v36 = v33;
        v44 = v33;
        v37 = v35;
        unsigned int v38 = [v36 isEqual:v35];

        id v33 = v44;
        if (!v38)
        {
          BOOL v9 = 0;
          v20 = v53;
LABEL_41:

          goto LABEL_42;
        }
      }
      v39 = [(MusicModelLiveRadioCaseItem *)self videoBackgroundArtworkCatalog];
      v40 = [(MusicModelLiveRadioCaseItem *)v5 videoBackgroundArtworkCatalog];
      v45 = v39;
      if (v39 == v40)
      {
        BOOL v9 = 1;
      }
      else
      {
        v41 = v40;
        unsigned __int8 v42 = [v39 isEqual:v40];
        v40 = v41;
        BOOL v9 = v42;
      }
      v20 = v53;

      goto LABEL_41;
    }
    BOOL v9 = 0;
  }
LABEL_49:

  return v9;
}

@end