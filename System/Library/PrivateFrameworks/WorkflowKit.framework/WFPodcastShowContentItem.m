@interface WFPodcastShowContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)loadsListThumbnailAsynchronously;
@end

@implementation WFPodcastShowContentItem

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Podcasts");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Podcasts (plural)", @"Podcasts");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Podcast", @"Podcast");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F5AA90];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5A880];
  id v3 = WFLocalizedContentPropertyNameMarker(@"Feed URL");
  v4 = [v2 keyPath:@"object.feedURL" name:v3 class:objc_opt_class()];
  v16[0] = v4;
  v5 = (void *)MEMORY[0x1E4F5A880];
  v6 = WFLocalizedContentPropertyNameMarker(@"Genre");
  v7 = [v5 keyPath:@"object.genre" name:v6 class:objc_opt_class()];
  v16[1] = v7;
  v8 = (void *)MEMORY[0x1E4F5A880];
  v9 = WFLocalizedContentPropertyNameMarker(@"Episode Count");
  v10 = [v8 keyPath:@"object.trackCount" name:v9 class:objc_opt_class()];
  v16[2] = v10;
  v11 = (void *)MEMORY[0x1E4F5A880];
  v12 = WFLocalizedContentPropertyNameMarker(@"Artist");
  v13 = [v11 keyPath:@"object.artistName" name:v12 class:objc_opt_class()];
  v16[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  return v14;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E6556870;
    id v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);
  }
  return 1;
}

void __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E65572A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(WFPodcastShowContentItem *)self podcastObject];
    id v7 = [v6 artistName];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

@end