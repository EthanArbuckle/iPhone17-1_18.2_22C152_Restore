@interface MusicModelTVShowEpisodeDetailItem
+ (id)__backgroundArtworkCatalogBlock_KEY;
+ (id)__contentItem_KEY;
+ (id)__descriptionText_KEY;
+ (id)__episodeInformationItems_KEY;
+ (id)__headlineText_KEY;
+ (id)__showNameText_KEY;
+ (id)__titleText_KEY;
+ (id)requiredStoreLibraryPersonalizationProperties;
- (id)backgroundArtworkCatalog;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
- (id)relativeModelObjectForStoreLibraryPersonalization;
- (id)storeContentItemObject;
- (id)storeContentItemObjectPropertiesFor:(id)a3;
@end

@implementation MusicModelTVShowEpisodeDetailItem

+ (id)__contentItem_KEY
{
  return @"MusicModelRelationshipTVShowEpisodeDetailItemContentItem";
}

+ (id)__headlineText_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemHeadlineText";
}

+ (id)__titleText_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemTitleText";
}

+ (id)__showNameText_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemShowNameText";
}

+ (id)__descriptionText_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemDescriptionText";
}

+ (id)__episodeInformationItems_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemEpisodeInformationItems";
}

+ (id)__backgroundArtworkCatalogBlock_KEY
{
  return @"MusicModelPropertyTVShowEpisodeDetailItemBackgroundArtwork";
}

- (id)backgroundArtworkCatalog
{
  uint64_t v3 = [(MusicModelTVShowEpisodeDetailItem *)self backgroundArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MusicModelTVShowEpisodeDetailItem *))(v3 + 16))(v3, self);
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
    CFStringRef v7 = @"MusicModelRelationshipTVShowEpisodeDetailItemContentItem";
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
  id v5 = [(MusicModelTVShowEpisodeDetailItem *)self contentItem];
  v6 = [v4 relationships];

  CFStringRef v7 = [v6 objectForKey:@"MusicModelRelationshipTVShowEpisodeDetailItemContentItem"];
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
  v2 = [(MusicModelTVShowEpisodeDetailItem *)self contentItem];
  id v3 = [v2 relativeModelObjectForStoreLibraryPersonalization];

  return v3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicModelTVShowEpisodeDetailItem *)self identifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __94__MusicModelTVShowEpisodeDetailItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke;
  v9[3] = &unk_CCBC48;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MusicModelTVShowEpisodeDetailItem *)self copyWithIdentifiers:v5 block:v9];

  return v7;
}

void __94__MusicModelTVShowEpisodeDetailItem_objectWithStoreLibraryPersonalizationRelativeModelObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contentItem];
  id v6 = [v5 objectWithStoreLibraryPersonalizationRelativeModelObject:*(void *)(a1 + 40)];

  [v4 setContentItem:v6];
}

- (id)storeContentItemObject
{
  return sub_2A08EC(self, (uint64_t)a2, (SEL *)&selRef_contentItem);
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_2A0964(v4);

  return v6;
}

@end