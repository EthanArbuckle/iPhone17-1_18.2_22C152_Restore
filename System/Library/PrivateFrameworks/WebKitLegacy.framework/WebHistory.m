@interface WebHistory
+ (WebHistory)optionalSharedHistory;
+ (void)_setVisitedLinkTrackingEnabled:(BOOL)a3;
+ (void)setOptionalSharedHistory:(WebHistory *)history;
- (BOOL)containsURL:(id)a3;
- (BOOL)loadFromURL:(NSURL *)URL error:(NSError *)error;
- (BOOL)saveToURL:(NSURL *)URL error:(NSError *)error;
- (NSArray)orderedItemsLastVisitedOnDay:(NSCalendarDate *)calendarDate;
- (NSArray)orderedLastVisitedDays;
- (WebHistory)init;
- (WebHistoryItem)itemForURL:(NSURL *)URL;
- (id)_data;
- (id)_itemForURLString:(id)a3;
- (id)allItems;
- (int)historyAgeInDaysLimit;
- (int)historyItemLimit;
- (void)_addVisitedLinksToVisitedLinkStore:(void *)a3;
- (void)_sendNotification:(id)a3 entries:(id)a4;
- (void)_visitedURL:(id)a3 withTitle:(id)a4 method:(id)a5 wasFailure:(BOOL)a6;
- (void)addItems:(NSArray *)newItems;
- (void)dealloc;
- (void)removeAllItems;
- (void)removeItems:(NSArray *)items;
- (void)setHistoryAgeInDaysLimit:(int)historyAgeInDaysLimit;
- (void)setHistoryItemLimit:(int)historyItemLimit;
- (void)timeZoneChanged:(id)a3;
@end

@implementation WebHistory

+ (WebHistory)optionalSharedHistory
{
  if (byte_1EB3A9781 == 1) {
    return (WebHistory *)qword_1EB3A9790;
  }
  result = 0;
  qword_1EB3A9790 = 0;
  byte_1EB3A9781 = 1;
  return result;
}

+ (void)setOptionalSharedHistory:(WebHistory *)history
{
  if (byte_1EB3A9781 == 1)
  {
    v4 = (void *)qword_1EB3A9790;
    if ((WebHistory *)qword_1EB3A9790 == history) {
      return;
    }
  }
  else
  {
    v4 = 0;
    qword_1EB3A9790 = 0;
    byte_1EB3A9781 = 1;
    if (!history) {
      return;
    }
  }
  if (history)
  {
    CFRetain(history);
    v4 = (void *)qword_1EB3A9790;
  }
  qword_1EB3A9790 = (uint64_t)history;
  if (v4) {
    CFRelease(v4);
  }
  if (s_shouldTrackVisitedLinks == (history != 0) || (s_shouldTrackVisitedLinks = history != 0, history))
  {
  }
  else
  {
    v4 = (void *)WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)v4, (void *)a2);
  }
  WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)v4, (void *)a2);
}

- (void)timeZoneChanged:(id)a3
{
}

- (WebHistory)init
{
  v5.receiver = self;
  v5.super_class = (Class)WebHistory;
  v2 = [(WebHistory *)&v5 init];
  if (v2)
  {
    v2->_historyPrivate = objc_alloc_init(WebHistoryPrivate);
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_timeZoneChanged_ name:*MEMORY[0x1E4F1C4F8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C4F8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WebHistory;
  [(WebHistory *)&v4 dealloc];
}

- (void)_sendNotification:(id)a3 entries:(id)a4
{
  v5[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = WebHistoryItemsKey;
  v5[0] = a4;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  WebThreadPostNotification();
}

- (void)removeItems:(NSArray *)items
{
  if (-[WebHistoryPrivate removeItems:](self->_historyPrivate, "removeItems:"))
  {
    objc_super v5 = WebHistoryItemsRemovedNotification;
    [(WebHistory *)self _sendNotification:v5 entries:items];
  }
}

- (void)removeAllItems
{
  id v3 = [(WebHistoryPrivate *)self->_historyPrivate allItems];
  if ([(WebHistoryPrivate *)self->_historyPrivate removeAllItems])
  {
    objc_super v4 = WebHistoryAllItemsRemovedNotification;
    [(WebHistory *)self _sendNotification:v4 entries:v3];
  }
}

- (void)addItems:(NSArray *)newItems
{
  -[WebHistoryPrivate addItems:](self->_historyPrivate, "addItems:");
  objc_super v5 = WebHistoryItemsAddedNotification;
  [(WebHistory *)self _sendNotification:v5 entries:newItems];
}

- (NSArray)orderedLastVisitedDays
{
  return (NSArray *)[(WebHistoryPrivate *)self->_historyPrivate orderedLastVisitedDays];
}

- (NSArray)orderedItemsLastVisitedOnDay:(NSCalendarDate *)calendarDate
{
  return (NSArray *)[(WebHistoryPrivate *)self->_historyPrivate orderedItemsLastVisitedOnDay:calendarDate];
}

- (BOOL)containsURL:(id)a3
{
  return [(WebHistoryPrivate *)self->_historyPrivate containsURL:a3];
}

- (WebHistoryItem)itemForURL:(NSURL *)URL
{
  return (WebHistoryItem *)[(WebHistoryPrivate *)self->_historyPrivate itemForURL:URL];
}

- (BOOL)loadFromURL:(NSURL *)URL error:(NSError *)error
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v8 = [(WebHistoryPrivate *)self->_historyPrivate loadFromURL:URL collectDiscardedItemsInto:v7 error:error];
  if (v8)
  {
    WebThreadPostNotification();
    if ([v7 count]) {
      [(WebHistory *)self _sendNotification:WebHistoryItemsDiscardedWhileLoadingNotification entries:v7];
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

- (BOOL)saveToURL:(NSURL *)URL error:(NSError *)error
{
  BOOL v4 = [(WebHistoryPrivate *)self->_historyPrivate saveToURL:URL error:error];
  if (v4) {
    WebThreadPostNotification();
  }
  return v4;
}

- (void)setHistoryItemLimit:(int)historyItemLimit
{
}

- (int)historyItemLimit
{
  return [(WebHistoryPrivate *)self->_historyPrivate historyItemLimit];
}

- (void)setHistoryAgeInDaysLimit:(int)historyAgeInDaysLimit
{
}

- (int)historyAgeInDaysLimit
{
  return [(WebHistoryPrivate *)self->_historyPrivate historyAgeInDaysLimit];
}

- (id)_itemForURLString:(id)a3
{
  return [(WebHistoryPrivate *)self->_historyPrivate itemForURLString:a3];
}

- (id)allItems
{
  return [(WebHistoryPrivate *)self->_historyPrivate allItems];
}

- (id)_data
{
  return [(WebHistoryPrivate *)self->_historyPrivate data];
}

+ (void)_setVisitedLinkTrackingEnabled:(BOOL)a3
{
  if (s_shouldTrackVisitedLinks != a3)
  {
    s_shouldTrackVisitedLinks = a3;
    if (!a3) {
      WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)a1, (void *)a2);
    }
  }
}

- (void)_visitedURL:(id)a3 withTitle:(id)a4 method:(id)a5 wasFailure:(BOOL)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v9 = -[WebHistoryPrivate visitedURL:withTitle:](self->_historyPrivate, "visitedURL:withTitle:", a3, a4, a5);
  *(unsigned char *)(*(void *)(v9[1] + 8) + 144) = a6;
  uint64_t v10 = v9[1];
  v11 = *(WTF **)(v10 + 24);
  *(void *)(v10 + 24) = 0;
  if (v11)
  {
    uint64_t v12 = *((unsigned int *)v11 + 3);
    if (v12)
    {
      v13 = *(WTF::StringImpl ***)v11;
      uint64_t v14 = 8 * v12;
      do
      {
        v15 = *v13;
        *v13 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2) {
            WTF::StringImpl::destroy(v15, v8);
          }
          else {
            *(_DWORD *)v15 -= 2;
          }
        }
        ++v13;
        v14 -= 8;
      }
      while (v14);
    }
    v16 = *(WTF **)v11;
    if (*(void *)v11)
    {
      *(void *)v11 = 0;
      *((_DWORD *)v11 + 2) = 0;
      WTF::fastFree(v16, v8);
    }
    WTF::fastFree(v11, v8);
  }
  v17[0] = v9;
  -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryItemsAddedNotification, [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1]);
}

- (void)_addVisitedLinksToVisitedLinkStore:(void *)a3
{
}

@end