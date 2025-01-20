@interface VKAnalyticsVisualSearchEvent
- (BOOL)didInteractWithResultItem;
- (BOOL)itemHasFocalPoint;
- (BOOL)serverResultWasCached;
- (NSCountedSet)allItemDomains;
- (NSString)itemDomain;
- (VKAnalyticsVisualSearchEvent)initWithType:(int64_t)a3 items:(id)a4 interactedItem:(id)a5 serverProcessingTime:(double)a6 customIdentifier:(id)a7;
- (VKCVisualSearchResultItem)interactedItem;
- (double)serverProcessingTime;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)eventKey;
- (int64_t)eventType;
- (int64_t)focalPointItemCount;
- (int64_t)itemCount;
- (int64_t)nonFocalPointItemCount;
- (int64_t)type;
- (void)processItems:(id)a3;
- (void)setAllItemDomains:(id)a3;
- (void)setDidInteractWithResultItem:(BOOL)a3;
- (void)setEventType:(int64_t)a3;
- (void)setFocalPointItemCount:(int64_t)a3;
- (void)setInteractedItem:(id)a3;
- (void)setItemCount:(int64_t)a3;
- (void)setServerProcessingTime:(double)a3;
- (void)setServerResultWasCached:(BOOL)a3;
@end

@implementation VKAnalyticsVisualSearchEvent

- (VKAnalyticsVisualSearchEvent)initWithType:(int64_t)a3 items:(id)a4 interactedItem:(id)a5 serverProcessingTime:(double)a6 customIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VKAnalyticsVisualSearchEvent;
  v14 = [(VKAnalyticsEvent *)&v19 initWithCustomIdentifier:a7];
  v15 = v14;
  if (v14)
  {
    v14->_eventType = a3;
    v14->_serverProcessingTime = a6;
    objc_storeStrong((id *)&v14->_interactedItem, a5);
    BOOL v17 = a6 == 0.0 && v15->_eventType == 2;
    v15->_serverResultWasCached = v17;
    [(VKAnalyticsVisualSearchEvent *)v15 processItems:v12];
  }

  return v15;
}

- (id)eventKey
{
  int64_t v2 = [(VKAnalyticsVisualSearchEvent *)self eventType];
  v3 = @"VisualSearchEvent.items.activated";
  if (v2 != 2) {
    v3 = 0;
  }
  if (v2 == 1) {
    return @"VisualSearchEvent.items.hidden";
  }
  else {
    return v3;
  }
}

- (id)coreAnalyticsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = VKMUIStringForVKAnalyticsVisualSearchEventType([(VKAnalyticsVisualSearchEvent *)self eventType]);
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"eventType", v4);

  v5 = [(VKAnalyticsEvent *)self bundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"bundleIdentifier"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsEvent isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  [v3 setObject:v6 forKeyedSubscript:@"automatedTest"];

  int64_t v7 = [(VKAnalyticsVisualSearchEvent *)self eventType];
  if (v7 == 2)
  {
    v14 = [(VKAnalyticsVisualSearchEvent *)self itemDomain];
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"domain", v14);

    v15 = NSNumber;
    [(VKAnalyticsVisualSearchEvent *)self serverProcessingTime];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"serverProcessingTime", v16);

    BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsVisualSearchEvent serverResultWasCached](self, "serverResultWasCached"));
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"serverResultWasCached", v17);

    v11 = [(VKAnalyticsVisualSearchEvent *)self itemDomain];
    id v13 = v3;
    id v12 = @"domain";
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_6;
    }
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VKAnalyticsVisualSearchEvent didInteractWithResultItem](self, "didInteractWithResultItem"));
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"didInteractWithItem", v8);

    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount"));
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"itemCount", v9);

    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount"));
    objc_msgSend(v3, "vk_addKey:forNonNilObject:", @"focalPointItemCount", v10);

    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[VKAnalyticsVisualSearchEvent itemCount](self, "itemCount")- -[VKAnalyticsVisualSearchEvent focalPointItemCount](self, "focalPointItemCount"));
    id v12 = @"nonFocalPointItemCount";
    id v13 = v3;
  }
  objc_msgSend(v13, "vk_addKey:forNonNilObject:", v12, v11);

LABEL_6:
  return v3;
}

- (void)processItems:(id)a3
{
  id v4 = a3;
  -[VKAnalyticsVisualSearchEvent setItemCount:](self, "setItemCount:", [v4 count]);
  id v5 = objc_alloc(MEMORY[0x1E4F28BD0]);
  v6 = objc_msgSend(v4, "vk_compactMap:", &__block_literal_global_18);
  int64_t v7 = (void *)[v5 initWithArray:v6];
  [(VKAnalyticsVisualSearchEvent *)self setAllItemDomains:v7];

  uint64_t v8 = objc_msgSend(v4, "vk_countOfObjectsPassingTest:", &__block_literal_global_69_0);
  [(VKAnalyticsVisualSearchEvent *)self setFocalPointItemCount:v8];
}

id __45__VKAnalyticsVisualSearchEvent_processItems___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = [a2 domainInfo];
  id v3 = [v2 domain];

  return v3;
}

uint64_t __45__VKAnalyticsVisualSearchEvent_processItems___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v2 = [a2 domainInfo];
  uint64_t v3 = [v2 hasFocalPoint];

  return v3;
}

- (int64_t)nonFocalPointItemCount
{
  int64_t v3 = [(VKAnalyticsVisualSearchEvent *)self itemCount];
  return v3 - [(VKAnalyticsVisualSearchEvent *)self focalPointItemCount];
}

- (NSString)itemDomain
{
  int64_t v2 = [(VKAnalyticsVisualSearchEvent *)self interactedItem];
  int64_t v3 = [v2 domainInfo];
  id v4 = [v3 domain];

  return (NSString *)v4;
}

- (BOOL)itemHasFocalPoint
{
  int64_t v2 = [(VKAnalyticsVisualSearchEvent *)self interactedItem];
  int64_t v3 = [v2 domainInfo];
  char v4 = [v3 hasFocalPoint];

  return v4;
}

- (int64_t)type
{
  return 6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  char v4 = [(VKAnalyticsVisualSearchEvent *)self allItemDomains];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __43__VKAnalyticsVisualSearchEvent_description__block_invoke;
  v24[3] = &unk_1E6BF27D0;
  id v25 = v3;
  id v26 = v4;
  id v22 = v4;
  id v5 = v3;
  [v22 enumerateObjectsUsingBlock:v24];
  v21 = NSString;
  v23.receiver = self;
  v23.super_class = (Class)VKAnalyticsVisualSearchEvent;
  v20 = [(VKAnalyticsVisualSearchEvent *)&v23 description];
  v6 = VKMUIStringForVKAnalyticsVisualSearchEventType([(VKAnalyticsVisualSearchEvent *)self eventType]);
  int64_t v19 = [(VKAnalyticsVisualSearchEvent *)self itemCount];
  int64_t v7 = [(VKAnalyticsVisualSearchEvent *)self focalPointItemCount];
  int64_t v8 = [(VKAnalyticsVisualSearchEvent *)self nonFocalPointItemCount];
  v9 = VKMUIStringForBool([(VKAnalyticsVisualSearchEvent *)self didInteractWithResultItem]);
  v10 = [(VKAnalyticsVisualSearchEvent *)self itemDomain];
  v11 = VKMUIStringForBool([(VKAnalyticsVisualSearchEvent *)self itemHasFocalPoint]);
  [(VKAnalyticsVisualSearchEvent *)self serverProcessingTime];
  uint64_t v13 = v12;
  v14 = VKMUIStringForBool([(VKAnalyticsVisualSearchEvent *)self serverResultWasCached]);
  v15 = VKMUIStringForBool([(VKAnalyticsEvent *)self isPerformingAutomatedTest]);
  v16 = [(VKAnalyticsEvent *)self bundleIdentifier];
  BOOL v17 = [v21 stringWithFormat:@"%@ \n eventType: %@ \n itemCount: %lu \n focalPointItemCount: %ld \n nonFocalPointItemCount: %ld \n didInteractWithResultItem: %@ \n allDomains: \n %@itemDomain: %@ \n itemHasFocalPoint: %@ \n serverProcessingTime: %f \n serverResultWasCached: %@ \n automatedTest: %@ \n bundleIdentifier: %@ \n ", v20, v6, v19, v7, v8, v9, v5, v10, v11, v13, v14, v15, v16];

  return v17;
}

void __43__VKAnalyticsVisualSearchEvent_description__block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  [v2 appendFormat:@"\t%@: %ld\n ", v4, objc_msgSend(v3, "countForObject:", v4)];
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (BOOL)didInteractWithResultItem
{
  return self->_didInteractWithResultItem;
}

- (void)setDidInteractWithResultItem:(BOOL)a3
{
  self->_didInteractWithResultItem = a3;
}

- (NSCountedSet)allItemDomains
{
  return self->_allItemDomains;
}

- (void)setAllItemDomains:(id)a3
{
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int64_t)a3
{
  self->_itemCount = a3;
}

- (int64_t)focalPointItemCount
{
  return self->_focalPointItemCount;
}

- (void)setFocalPointItemCount:(int64_t)a3
{
  self->_focalPointItemCount = a3;
}

- (double)serverProcessingTime
{
  return self->_serverProcessingTime;
}

- (void)setServerProcessingTime:(double)a3
{
  self->_serverProcessingTime = a3;
}

- (BOOL)serverResultWasCached
{
  return self->_serverResultWasCached;
}

- (void)setServerResultWasCached:(BOOL)a3
{
  self->_serverResultWasCached = a3;
}

- (VKCVisualSearchResultItem)interactedItem
{
  return self->_interactedItem;
}

- (void)setInteractedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactedItem, 0);
  objc_storeStrong((id *)&self->_allItemDomains, 0);
}

@end