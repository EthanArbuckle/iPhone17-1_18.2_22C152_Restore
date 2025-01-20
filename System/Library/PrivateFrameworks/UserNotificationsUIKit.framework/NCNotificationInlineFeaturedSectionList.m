@interface NCNotificationInlineFeaturedSectionList
- (BOOL)_shouldHideNotificationGroupList:(id)a3;
- (BOOL)_shouldHideNotificationRequest:(id)a3;
- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3;
- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3;
- (NSArray)featuredNotificationContentProviders;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (id)footerViewForNotificationList:(id)a3;
- (id)headerViewForNotificationList:(id)a3;
- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4;
- (void)_configureSectionListView:(id)a3;
- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8;
- (void)setFeaturedNotificationContentProviders:(id)a3;
- (void)updateContent;
@end

@implementation NCNotificationInlineFeaturedSectionList

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  id v5 = a3;
  if (BSEqualArrays())
  {
    [(NCNotificationInlineFeaturedSectionList *)self updateContent];
  }
  else
  {
    featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke;
    v9[3] = &unk_1E6A946D8;
    v9[4] = self;
    [(NSArray *)featuredNotificationContentProviders enumerateObjectsUsingBlock:v9];
    richContentProviders = self->_richContentProviders;
    self->_richContentProviders = 0;

    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke_2;
    v8[3] = &unk_1E6A946D8;
    v8[4] = self;
    [v5 enumerateObjectsUsingBlock:v8];
  }
}

void __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 notificationRequest];
  [v2 removeNotificationRequest:v3];
}

void __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 notificationRequest];
  [v2 insertNotificationRequest:v3];
}

- (void)updateContent
{
  id v3 = [(NSArray *)self->_featuredNotificationContentProviders firstObject];
  uint64_t v4 = [v3 isDeviceAuthenticated];

  [(NCNotificationStructuredSectionList *)self setDeviceAuthenticated:v4];
  richContentProviders = self->_richContentProviders;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke;
  v9[3] = &__block_descriptor_33_e80_v32__0__NCNotificationRequest_8__NCNotificationRequestRichContentProvider_16_B24l;
  char v10 = v4;
  [(NSMutableDictionary *)richContentProviders enumerateKeysAndObjectsUsingBlock:v9];
  featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke_2;
  v8[3] = &unk_1E6A946D8;
  v8[4] = self;
  [(NSArray *)featuredNotificationContentProviders enumerateObjectsUsingBlock:v8];
  v7 = [(NCNotificationStructuredSectionList *)self listView];
  [v7 invalidateHeight];
}

uint64_t __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDeviceAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

void __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 notificationRequest];
  [v2 reloadNotificationRequest:v3];
}

- (id)headerViewForNotificationList:(id)a3
{
  return 0;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (id)footerViewForNotificationList:(id)a3
{
  return 0;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 1;
}

- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  richContentProviders = self->_richContentProviders;
  if (!richContentProviders)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v10 = self->_richContentProviders;
    self->_richContentProviders = v9;

    richContentProviders = self->_richContentProviders;
  }
  v11 = [(NSMutableDictionary *)richContentProviders objectForKey:v7];
  if (!v11)
  {
    v11 = [(NCNotificationRequestCoalescingContentProvider *)[NCNotificationRequestRichContentProvider alloc] initWithNotificationRequest:v7];
    [(NCNotificationRequestRichContentProvider *)v11 setIconVisible:1];
    v12 = [(NSArray *)self->_featuredNotificationContentProviders firstObject];
    -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v11, "setDeviceAuthenticated:", [v12 isDeviceAuthenticated]);

    [(NSMutableDictionary *)self->_richContentProviders bs_setSafeObject:v11 forKey:v7];
  }

  return v11;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  return 0;
}

- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v20 = a4;
  id v13 = a7;
  id v14 = a8;
  id v15 = a5;
  id v16 = [v15 defaultAction];

  if (v16 == v20)
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v13];
    v18 = [NSNumber numberWithBool:1];
    [v17 setObject:v18 forKey:@"NCNotificationActionDeferClearForNotificationSummaryKey"];

    id v13 = v17;
  }
  v19 = [(NCNotificationStructuredSectionList *)self delegate];
  [v19 notificationListComponent:self requestsExecuteAction:v20 forNotificationRequest:v15 requestAuthentication:v10 withParameters:v13 completion:v14];
}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (void)_configureSectionListView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationInlineFeaturedSectionList;
  id v3 = a3;
  [(NCNotificationStructuredSectionList *)&v4 _configureSectionListView:v3];
  objc_msgSend(v3, "setRevealed:", 1, v4.receiver, v4.super_class);
  [v3 setRevealPercentage:1.0];
  [v3 setGroupingAnimationStyle:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richContentProviders, 0);

  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end