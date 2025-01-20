@interface TUReplyWithMessageStore
- (TUReplyWithMessageStore)init;
- (id)_cannedRepliesForSending:(BOOL)a3;
- (id)_defaultRepliesForSending:(BOOL)a3;
- (id)cannedReplies;
- (id)cannedRepliesForSending;
- (id)cannedReplyActionSheetOptions;
- (id)customReplies;
- (id)defaultReplies;
- (int)count;
- (void)_handleMessagesStoreChanged;
- (void)dealloc;
- (void)setCustomReply:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation TUReplyWithMessageStore

- (TUReplyWithMessageStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUReplyWithMessageStore;
  v2 = [(TUReplyWithMessageStore *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_TUReplyWithMessageStore_HandleMessageStoreChanged, @"com.apple.TelephonyUtilities.TUReplyWithMessageStoreChanged", v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TUReplyWithMessageStore;
  [(TUReplyWithMessageStore *)&v4 dealloc];
}

- (int)count
{
  return 3;
}

- (id)_defaultRepliesForSending:(BOOL)a3
{
  objc_super v4 = @"CANNED_REPLY_%d";
  if (a3) {
    objc_super v4 = @"CANNED_REPLY_SENDING_%d";
  }
  objc_super v5 = v4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  if ([(TUReplyWithMessageStore *)self count] >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", v5, v7);
      v9 = TUBundle();
      v10 = [v9 localizedStringForKey:v8 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      [v6 addObject:v10];

      uint64_t v7 = (v7 + 1);
    }
    while ((int)v7 < [(TUReplyWithMessageStore *)self count]);
  }
  v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v11;
}

- (id)defaultReplies
{
  return [(TUReplyWithMessageStore *)self _defaultRepliesForSending:0];
}

- (id)customReplies
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"TUReplyWithMessageStoreReplyArray", TUMobilePhoneDomain);
  if (v3)
  {
    objc_super v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
      CFRelease(v4);
      if (v6) {
        goto LABEL_7;
      }
    }
    else
    {
      CFRelease(v4);
    }
  }
  v6 = [MEMORY[0x1E4F1CA48] array];
LABEL_7:
  unint64_t v7 = [v6 count];
  if (v7 < [(TUReplyWithMessageStore *)self count])
  {
    do
    {
      [v6 addObject:&stru_1EECEA668];
      unint64_t v8 = [v6 count];
    }
    while (v8 < [(TUReplyWithMessageStore *)self count]);
  }
  v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v9;
}

- (id)_cannedRepliesForSending:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F1CA48];
  CFTypeID v5 = [(TUReplyWithMessageStore *)self _defaultRepliesForSending:a3];
  v6 = [v4 arrayWithArray:v5];

  unint64_t v7 = [(TUReplyWithMessageStore *)self customReplies];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v10;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        if (([v14 isEqualToString:&stru_1EECEA668] & 1) == 0) {
          [v6 replaceObjectAtIndex:v13 + v12 withObject:v14];
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      int v10 = v13 + v12;
    }
    while (v9);
  }
  v15 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];

  return v15;
}

- (id)cannedReplies
{
  return [(TUReplyWithMessageStore *)self _cannedRepliesForSending:0];
}

- (id)cannedReplyActionSheetOptions
{
  CFPropertyListRef v3 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v4 = [(TUReplyWithMessageStore *)self cannedReplies];
  CFTypeID v5 = [v3 arrayWithArray:v4];

  if ([(TUReplyWithMessageStore *)self count] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      unint64_t v7 = [v5 objectAtIndex:v6];
      uint64_t v8 = _TUFormatReplyForOptions(v7);
      [v5 replaceObjectAtIndex:v6 withObject:v8];

      ++v6;
    }
    while (v6 < [(TUReplyWithMessageStore *)self count]);
  }
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

  return v9;
}

- (id)cannedRepliesForSending
{
  return [(TUReplyWithMessageStore *)self _cannedRepliesForSending:1];
}

- (void)setCustomReply:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = (__CFString *)a3;
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"TUReplyWithMessageStoreReplyArray", TUMobilePhoneDomain);
  if (v7)
  {
    uint64_t v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID())
    {
      int v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
      CFRelease(v8);
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  int v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[TUReplyWithMessageStore count](self, "count"));
  if ([(TUReplyWithMessageStore *)self count] >= 1)
  {
    int v11 = 0;
    do
    {
      [v10 addObject:&stru_1EECEA668];
      ++v11;
    }
    while (v11 < [(TUReplyWithMessageStore *)self count]);
  }
LABEL_9:
  if (v6) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = &stru_1EECEA668;
  }
  v14 = v12;
  objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a4);
  CFPreferencesSetAppValue(@"TUReplyWithMessageStoreReplyArray", v10, TUMobilePhoneDomain);
  CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.TelephonyUtilities.TUReplyWithMessageStoreChanged", 0, 0, 1u);
}

- (void)_handleMessagesStoreChanged
{
}

@end