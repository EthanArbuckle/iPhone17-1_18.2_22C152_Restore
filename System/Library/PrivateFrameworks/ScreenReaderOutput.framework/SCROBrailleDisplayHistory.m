@interface SCROBrailleDisplayHistory
+ (void)initialize;
- (BOOL)_moveIndexBy:(int64_t)a3;
- (BOOL)hasUnread;
- (BOOL)isOnMostRecent;
- (BOOL)moveToNext;
- (BOOL)moveToPrevious;
- (SCROBrailleDisplayHistory)init;
- (id)currentString;
- (void)addString:(id)a3;
- (void)dealloc;
- (void)markSnapshotAsRead;
- (void)moveToMostRecent;
- (void)snapshotUnread;
@end

@implementation SCROBrailleDisplayHistory

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = objc_alloc(NSDictionary);
    id v12 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x263EFFA88], kSCROHistoryAttribute, MEMORY[0x263EFFA80], kSCROUnreadAttribute, 0);
    id v5 = objc_alloc(MEMORY[0x263F086A0]);
    v6 = (void *)MEMORY[0x263F086E0];
    v7 = self;
    v8 = [v6 bundleForClass:v7];
    v9 = [v8 localizedStringForKey:@"noAnnouncements" value:&stru_26CCE0B50 table:@"Server"];
    uint64_t v10 = [v5 initWithString:v9 attributes:v12];
    v11 = (void *)_NoAnnouncementString;
    _NoAnnouncementString = v10;
  }
}

- (SCROBrailleDisplayHistory)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleDisplayHistory;
  v2 = [(SCROBrailleDisplayHistory *)&v6 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    id v4 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    v2->_announcements = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    v2->_unreadSnapshot = CFArrayCreateMutable(v3, 0, v4);
    v2->_currentIndex = -1;
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->_announcements);
  self->_announcements = 0;
  CFRelease(self->_unreadSnapshot);
  self->_unreadSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleDisplayHistory;
  [(SCROBrailleDisplayHistory *)&v3 dealloc];
}

- (void)addString:(id)a3
{
  value = (void *)[a3 mutableCopy];
  if ([value length])
  {
    objc_msgSend(value, "removeAttribute:range:", kSCROAlertAttribute[0], 0, 1);
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
    [value appendAttributedString:v4];
  }
  uint64_t v5 = MEMORY[0x263EFFA88];
  objc_msgSend(value, "addAttribute:value:range:", kSCROHistoryAttribute, MEMORY[0x263EFFA88], 0, 1);
  objc_msgSend(value, "addAttribute:value:range:", kSCROUnreadAttribute, v5, 0, 1);
  CFArrayAppendValue(self->_announcements, value);
  if (self->_currentIndex < 0) {
    self->_int64_t currentIndex = 0;
  }
  ++self->_unreadCount;
  if (CFArrayGetCount(self->_announcements) >= 11)
  {
    do
    {
      objc_super v6 = CFArrayGetValueAtIndex(self->_announcements, 0);
      if (SCROBrailleDisplayHistoryIsStringUnread(v6)) {
        --self->_unreadCount;
      }
      CFArrayRemoveValueAtIndex(self->_announcements, 0);
      int64_t currentIndex = self->_currentIndex;
      BOOL v8 = currentIndex < 1;
      int64_t v9 = currentIndex - 1;
      if (!v8) {
        self->_int64_t currentIndex = v9;
      }
    }
    while (CFArrayGetCount(self->_announcements) > 10);
  }
}

- (void)snapshotUnread
{
  CFArrayRemoveAllValues(self->_unreadSnapshot);
  CFIndex Count = CFArrayGetCount(self->_announcements);
  if (Count >= 1)
  {
    CFIndex v4 = Count + 1;
    while (1)
    {
      value = CFArrayGetValueAtIndex(self->_announcements, v4 - 2);
      if (!SCROBrailleDisplayHistoryIsStringUnread(value)) {
        break;
      }
      CFArrayAppendValue(self->_unreadSnapshot, value);

      if ((unint64_t)--v4 <= 1) {
        return;
      }
    }
  }
}

- (void)markSnapshotAsRead
{
  CFIndex Count = CFArrayGetCount(self->_unreadSnapshot);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0; i != v4; ++i)
    {
      objc_super v6 = CFArrayGetValueAtIndex(self->_unreadSnapshot, i);
      if (SCROBrailleDisplayHistoryIsStringUnread(v6))
      {
        objc_msgSend(v6, "removeAttribute:range:", kSCROUnreadAttribute, 0, 1);
        --self->_unreadCount;
      }
    }
  }
  unreadSnapshot = self->_unreadSnapshot;

  CFArrayRemoveAllValues(unreadSnapshot);
}

- (BOOL)hasUnread
{
  return self->_unreadCount > 0;
}

- (id)currentString
{
  CFIndex currentIndex = self->_currentIndex;
  if (currentIndex < 0
    || (CFArrayGetValueAtIndex(self->_announcements, currentIndex), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = (id)_NoAnnouncementString;
  }
  else
  {
    uint64_t v5 = (void *)v4;
    CFIndex Count = CFArrayGetCount(self->_announcements);
    v7 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v5];
    BOOL v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld ", Count - self->_currentIndex);
    objc_msgSend(v7, "replaceCharactersInRange:withString:", 0, 0, v8);
    id v9 = (id)[v7 copy];
  }

  return v9;
}

- (BOOL)moveToNext
{
  return [(SCROBrailleDisplayHistory *)self _moveIndexBy:1];
}

- (BOOL)moveToPrevious
{
  return [(SCROBrailleDisplayHistory *)self _moveIndexBy:-1];
}

- (BOOL)_moveIndexBy:(int64_t)a3
{
  CFIndex currentIndex = self->_currentIndex;
  CFIndex Count = CFArrayGetCount(self->_announcements);
  int64_t v7 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  int64_t v8 = self->_currentIndex;
  if (v8 + a3 < Count) {
    int64_t v7 = v8 + a3;
  }
  if (v8 + a3 < 0) {
    int64_t v7 = 0;
  }
  if (v7 == v8) {
    return 0;
  }
  self->_CFIndex currentIndex = v7;
  uint64_t v10 = CFArrayGetValueAtIndex(self->_announcements, currentIndex);
  if (SCROBrailleDisplayHistoryIsStringUnread(v10))
  {
    objc_msgSend(v10, "removeAttribute:range:", kSCROUnreadAttribute, 0, 1);
    --self->_unreadCount;
  }

  return 1;
}

- (BOOL)isOnMostRecent
{
  int64_t currentIndex = self->_currentIndex;
  return currentIndex == CFArrayGetCount(self->_announcements) - 1;
}

- (void)moveToMostRecent
{
  self->_int64_t currentIndex = CFArrayGetCount(self->_announcements) - 1;
}

@end