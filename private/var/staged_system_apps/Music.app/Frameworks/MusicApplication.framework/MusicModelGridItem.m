@interface MusicModelGridItem
+ (id)__accessorySocialPersons_KEY;
+ (id)__backgroundArtworkCatalogBlock_KEY;
+ (id)__buttonText_KEY;
+ (id)__contentItem_KEY;
+ (id)__descriptionText_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__headlineColor_KEY;
+ (id)__headlineText_KEY;
+ (id)__overlaySubtitleText_KEY;
+ (id)__overlayTitleText_KEY;
+ (id)__subtitleText_KEY;
+ (id)__titleText_KEY;
+ (id)__videoBackgroundArtworkCatalogBlock_KEY;
+ (id)requiredStoreLibraryPersonalizationProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavoritedModelObject:(id)a3;
- (id)backgroundArtworkCatalog;
- (id)editorialArtworkCatalog;
- (id)innermostModelObject;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
- (id)storeContentItemObject;
- (id)storeContentItemObjectPropertiesFor:(id)a3;
- (id)videoBackgroundArtworkCatalog;
@end

@implementation MusicModelGridItem

+ (id)__contentItem_KEY
{
  return @"MusicModelRelationshipGridItemContentItem";
}

+ (id)__titleText_KEY
{
  return @"MusicModelPropertyGridItemTitleText";
}

+ (id)__subtitleText_KEY
{
  return @"MusicModelPropertyGridItemSubtitleText";
}

+ (id)__overlayTitleText_KEY
{
  return @"MusicModelPropertyGridItemOverlayTitleText";
}

+ (id)__overlaySubtitleText_KEY
{
  return @"MusicModelPropertyGridItemOverlaySubtitleText";
}

+ (id)__descriptionText_KEY
{
  return @"MusicModelPropertyGridItemDescriptionText";
}

+ (id)__headlineText_KEY
{
  return @"MusicModelPropertyGridItemHeadlineText";
}

+ (id)__headlineColor_KEY
{
  return @"MusicModelPropertyGridItemHeadlineColor";
}

+ (id)__buttonText_KEY
{
  return @"MusicModelPropertyGridItemButtonText";
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyGridItemBackgroundArtwork";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyGridItemEditorialArtwork";
}

+ (id)__videoBackgroundArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyGridItemVideoBackgroundArtwork";
}

+ (id)__accessorySocialPersons_KEY
{
  return @"MusicModelPropertyGridItemAccessorySocialPersons";
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3 = [(MusicModelGridItem *)self backgroundArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MusicModelGridItem *)self editorialArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)videoBackgroundArtworkCatalog
{
  uint64_t v3 = [(MusicModelGridItem *)self videoBackgroundArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelGridItem *))(v3 + 16))(v3, self);
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
    CFStringRef v7 = @"MusicModelRelationshipGridItemContentItem";
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
  id v5 = [(MusicModelGridItem *)self contentItem];
  v6 = [v4 relationships];

  CFStringRef v7 = [v6 objectForKey:@"MusicModelRelationshipGridItemContentItem"];
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
  v2 = [(MusicModelGridItem *)self contentItem];
  id v3 = [v2 relativeModelObjectForStoreLibraryPersonalization];

  return v3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicModelGridItem *)self identifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __79__MusicModelGridItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_CCB760;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MusicModelGridItem *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

void __79__MusicModelGridItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contentItem];
  id v6 = [v5 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 40)];

  [v4 setContentItem:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __30__MusicModelGridItem_isEqual___block_invoke;
    v7[3] = &unk_CCB788;
    v9 = self;
    id v10 = &v11;
    id v8 = v4;
    +[MPModelObject performWithoutEnforcement:v7];
    BOOL v5 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __30__MusicModelGridItem_isEqual___block_invoke(uint64_t a1)
{
  id v75 = *(id *)(a1 + 32);
  v2 = [*(id *)(a1 + 40) contentItem];
  id v3 = [v2 identifiers];
  id v4 = [v75 contentItem];
  BOOL v5 = [v4 identifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 intersectsSet:v5];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    id v7 = [*(id *)(a1 + 40) contentItem];
    id v8 = [v7 innerObject];
    v9 = [v8 identifiers];
    id v10 = [v75 contentItem];
    uint64_t v11 = [v10 innerObject];
    v12 = [v11 identifiers];
    if (v9 == v12)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v73 = [*(id *)(a1 + 40) contentItem];
      v72 = [v73 innerObject];
      uint64_t v13 = [v72 identifiers];
      [v75 contentItem];
      char v14 = v74 = v7;
      v15 = [v14 innerObject];
      [v15 identifiers];
      v17 = v16 = v9;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v13 intersectsSet:v17];

      v9 = v16;
      id v7 = v74;
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v18 + 24))
  {
    v19 = *(void **)(a1 + 40);
    v20 = [v19 contentItem];
    v21 = [v20 innerObject];
    LOBYTE(v19) = [v19 isFavoritedModelObject:v21];
    v22 = *(void **)(a1 + 40);
    v23 = [v75 contentItem];
    v24 = [v23 innerObject];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19 ^ [v22 isFavoritedModelObject:v24] ^ 1;
  }
  else
  {
    *(unsigned char *)(v18 + 24) = 0;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v25 + 24))
  {
    v26 = [*(id *)(a1 + 40) titleText];
    v27 = [v75 titleText];
    if (v26 == v27)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v28 = [*(id *)(a1 + 40) titleText];
      v29 = [v75 titleText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v28 isEqualToString:v29];
    }
  }
  else
  {
    *(unsigned char *)(v25 + 24) = 0;
  }
  uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v30 + 24))
  {
    v31 = [*(id *)(a1 + 40) subtitleText];
    v32 = [v75 subtitleText];
    if (v31 == v32)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v33 = [*(id *)(a1 + 40) subtitleText];
      v34 = [v75 subtitleText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v33 isEqualToString:v34];
    }
  }
  else
  {
    *(unsigned char *)(v30 + 24) = 0;
  }
  uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v35 + 24))
  {
    v36 = [*(id *)(a1 + 40) overlayTitleText];
    v37 = [v75 overlayTitleText];
    if (v36 == v37)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v38 = [*(id *)(a1 + 40) overlayTitleText];
      v39 = [v75 overlayTitleText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v38 isEqualToString:v39];
    }
  }
  else
  {
    *(unsigned char *)(v35 + 24) = 0;
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v40 + 24))
  {
    v41 = [*(id *)(a1 + 40) overlaySubtitleText];
    v42 = [v75 overlaySubtitleText];
    if (v41 == v42)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v43 = [*(id *)(a1 + 40) overlaySubtitleText];
      v44 = [v75 overlaySubtitleText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v43 isEqualToString:v44];
    }
  }
  else
  {
    *(unsigned char *)(v40 + 24) = 0;
  }
  uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v45 + 24))
  {
    v46 = [*(id *)(a1 + 40) descriptionText];
    v47 = [v75 descriptionText];
    if (v46 == v47)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v48 = [*(id *)(a1 + 40) descriptionText];
      v49 = [v75 descriptionText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v48 isEqualToString:v49];
    }
  }
  else
  {
    *(unsigned char *)(v45 + 24) = 0;
  }
  uint64_t v50 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v50 + 24))
  {
    v51 = [*(id *)(a1 + 40) headlineText];
    v52 = [v75 headlineText];
    if (v51 == v52)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v53 = [*(id *)(a1 + 40) headlineText];
      v54 = [v75 headlineText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v53 isEqualToString:v54];
    }
  }
  else
  {
    *(unsigned char *)(v50 + 24) = 0;
  }
  uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
  char v56 = *(unsigned char *)(v55 + 24);
  if (v56)
  {
    id v57 = [*(id *)(a1 + 40) headlineColor];
    char v56 = v57 == [v75 headlineColor];
    uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v55 + 24) = v56;
  uint64_t v58 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v58 + 24))
  {
    v59 = [*(id *)(a1 + 40) buttonText];
    v60 = [v75 buttonText];
    if (v59 == v60)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v61 = [*(id *)(a1 + 40) buttonText];
      v62 = [v75 buttonText];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v61 isEqualToString:v62];
    }
  }
  else
  {
    *(unsigned char *)(v58 + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v63 = [*(id *)(a1 + 40) backgroundArtworkCatalog];
    v64 = [v75 backgroundArtworkCatalog];
    char v65 = v63 == v64 ? 1 : [v63 isEqual:v64];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v65;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v66 = [*(id *)(a1 + 40) editorialArtworkCatalog];
      v67 = [v75 editorialArtworkCatalog];
      char v68 = v66 == v67 ? 1 : [v66 isEqual:v67];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v68;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        v69 = [*(id *)(a1 + 40) videoBackgroundArtworkCatalog];
        v70 = [v75 videoBackgroundArtworkCatalog];
        if (v69 == v70) {
          unsigned __int8 v71 = 1;
        }
        else {
          unsigned __int8 v71 = [v69 isEqual:v70];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v71;
      }
    }
  }
}

- (BOOL)isFavoritedModelObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v4 = [v3 isFavorite];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)storeContentItemObject
{
  return sub_2A08EC(self, (uint64_t)a2, (SEL *)&selRef_contentItem);
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  id v6 = sub_2A0964(v4);

  return v6;
}

- (id)innermostModelObject
{
  id v1 = a1;
  id v2 = [v1 contentItem];
  if (v2)
  {
    id v3 = v2;
    id v4 = [v2 innermostModelObject];

    id v1 = v4;
  }

  return v1;
}

@end