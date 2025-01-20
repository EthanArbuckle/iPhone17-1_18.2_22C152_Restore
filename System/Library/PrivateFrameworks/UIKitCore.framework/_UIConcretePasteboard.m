@interface _UIConcretePasteboard
+ (id)_loadRequestContextForBlockingUIKitCall;
+ (id)_loadRequestContextForBlockingUIKitCall:(BOOL)a3;
+ (id)_loadRequestContextForNonBlockingUIKitCall;
+ (id)_pasteboardNamed:(id)a3 createIfNotFound:(BOOL)a4;
+ (id)_pasteboardWithUniqueName;
+ (id)_remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5;
+ (id)clientValueForValue:(id)a3 pattern:(id)a4;
+ (id)generalPasteboard;
+ (void)_asynchronouslyEnumerateItemSet:(id)a3 itemsCompletionHandler:(id)a4 usingItemBlock:(id)a5;
+ (void)_attemptAuthenticationWithMessage:(id)a3;
+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3;
+ (void)_detectPatternsForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6;
+ (void)_detectValuesForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6;
+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5;
+ (void)removePasteboardWithName:(id)a3;
- (BOOL)_pasteboardCacheQueue_isPersistent;
- (BOOL)_pasteboardCacheQueue_saveItemCollection:(id)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5;
- (BOOL)_pasteboardCacheQueue_setPersistent:(BOOL)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5;
- (BOOL)canInstantiateObjectsOfClass:(Class)a3;
- (BOOL)containsPasteboardTypes:(id)a3;
- (BOOL)containsPasteboardTypes:(id)a3 inItemSet:(id)a4;
- (BOOL)hasColors;
- (BOOL)hasImages;
- (BOOL)hasStrings;
- (BOOL)hasURLs;
- (BOOL)isPersistent;
- (NSString)name;
- (OS_dispatch_group)saveCompletionGroup;
- (UISPasteSharingToken)sharingToken;
- (id)URL;
- (id)URLs;
- (id)_detectedPasteboardTypeStringsForTypes:(id)a3;
- (id)_detectedPasteboardTypesForTypes:(id)a3;
- (id)_initWithName:(id)a3;
- (id)_itemsCoercibleToClass:(Class)a3;
- (id)availableTypes;
- (id)color;
- (id)colors;
- (id)dataForPasteboardType:(id)a3;
- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4;
- (id)image;
- (id)images;
- (id)itemProviders;
- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3;
- (id)itemProvidersWithRetryBehavior:(BOOL)a3;
- (id)itemSetWithPasteboardTypes:(id)a3;
- (id)items;
- (id)pasteSharingToken;
- (id)pasteboardTypes;
- (id)pasteboardTypesForItemSet:(id)a3;
- (id)string;
- (id)strings;
- (id)valueForPasteboardType:(id)a3;
- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4;
- (int64_t)_changeCountIgnoringPinningActivity;
- (int64_t)changeCount;
- (int64_t)numberOfItems;
- (void)_clearItems;
- (void)_clearPinnedItemProviders;
- (void)_pinItemCollection:(id)a3;
- (void)_pinItemProviders:(id)a3 expirationDate:(id)a4;
- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5;
- (void)_saveItemCollection:(id)a3;
- (void)_sendPasteboardTypesChangedNotificationOldTypes:(id)a3 newTypes:(id)a4;
- (void)_setItemsAndSave:(id)a3 options:(id)a4;
- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5;
- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5 dataOwner:(int64_t)a6;
- (void)_setItemsAndSaveFromObjects:(id)a3 ofClass:(Class)a4;
- (void)_setPersistent:(BOOL)a3;
- (void)addItems:(id)a3;
- (void)detectPatternsForPatterns:(id)a3 completionHandler:(id)a4;
- (void)detectPatternsForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5;
- (void)detectValuesForPatterns:(id)a3 completionHandler:(id)a4;
- (void)detectValuesForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5;
- (void)setColor:(id)a3;
- (void)setColors:(id)a3;
- (void)setData:(id)a3 forPasteboardType:(id)a4;
- (void)setImage:(id)a3;
- (void)setImages:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setItemProviders:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5;
- (void)setItemProviders:(id)a3 options:(id)a4;
- (void)setItems:(id)a3;
- (void)setItems:(id)a3 options:(id)a4;
- (void)setName:(id)a3;
- (void)setObjects:(id)a3;
- (void)setObjects:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5;
- (void)setObjects:(id)a3 options:(id)a4;
- (void)setSharingToken:(id)a3;
- (void)setString:(id)a3;
- (void)setStrings:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLs:(id)a3;
- (void)setValue:(id)a3 forPasteboardType:(id)a4;
@end

@implementation _UIConcretePasteboard

- (id)_initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIConcretePasteboard;
  v6 = [(_UIConcretePasteboard *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    dispatch_group_t v8 = dispatch_group_create();
    saveCompletionGroup = v7->_saveCompletionGroup;
    v7->_saveCompletionGroup = (OS_dispatch_group *)v8;
  }
  return v7;
}

+ (id)_pasteboardNamed:(id)a3 createIfNotFound:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__151;
    v26 = __Block_byref_object_dispose__151;
    id v27 = 0;
    if (([(id)UIApp _isActivating] & 1) != 0
      || [(id)UIApp _isResigningActive])
    {
      char v7 = [v6 isEqualToString:@"com.apple.UIKit.pboard.general"];
    }
    else
    {
      char v7 = 0;
    }
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v9 = _pasteboardCacheQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59___UIConcretePasteboard__pasteboardNamed_createIfNotFound___block_invoke;
    block[3] = &unk_1E52FF968;
    v13 = &v22;
    char v16 = v7;
    BOOL v17 = a4;
    v14 = &v18;
    id v15 = a1;
    id v12 = v6;
    dispatch_sync(v9, block);

    if (*((unsigned char *)v19 + 24)) {
      _sendPasteboardChangedNotification((void *)v23[5]);
    }
    id v8 = (id)v23[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)generalPasteboard
{
  return (id)[a1 _pasteboardNamed:@"com.apple.UIKit.pboard.general" createIfNotFound:1];
}

- (BOOL)_pasteboardCacheQueue_saveItemCollection:(id)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5
{
  id v8 = a3;
  if (![v8 isPersistent])
  {
    _pasteboardCacheQueue_setItemCollectionForName(self->_name, v8);
    objc_msgSend(v8, "setChangeCount:", objc_msgSend(v8, "changeCount") + 1);
    BOOL v14 = 1;
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  dispatch_group_enter((dispatch_group_t)self->_saveCompletionGroup);
  id v9 = v8;
  v10 = _serverConnection();
  objc_super v11 = [v9 dataConsumersEndpoint];
  id v21 = 0;
  id v12 = [v10 savePasteboard:v9 dataProviderEndpoint:v11 error:&v21];

  id v13 = v21;
  BOOL v14 = v13 == 0;
  if (v13)
  {
    id v15 = v13;
    id v16 = 0;
  }
  else
  {
    id v16 = v12;
  }

  id v17 = v16;
  id v18 = v13;
  if (v13)
  {
    v19 = [v9 name];
    NSLog(&cfstr_CouldNotSavePa.isa, v19, v18);
  }
  else
  {
    if ([v9 isPersistent]) {
      _pasteboardCacheQueue_removeItemCollectionForName(self->_name);
    }
    a4 = [v17 notificationState];
    v19 = [v17 sharingToken];
    [(_UIConcretePasteboard *)self setSharingToken:v19];
  }

  dispatch_group_leave((dispatch_group_t)self->_saveCompletionGroup);
  if (a5) {
LABEL_13:
  }
    *a5 = a4;
LABEL_14:

  return v14;
}

- (void)_saveItemCollection:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    id v5 = self->_name;
    int v6 = [v4 isPersistent];
    char v7 = _pasteboardCacheQueue();
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke;
      block[3] = &unk_1E52D9F70;
      id v8 = (id *)&v29;
      v29 = v5;
      id v9 = v5;
      dispatch_sync(v7, block);

      dispatch_group_enter((dispatch_group_t)self->_saveCompletionGroup);
      v10 = _serverConnection();
      objc_super v11 = [v4 dataConsumersEndpoint];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_2;
      v26[3] = &unk_1E52FF940;
      v26[4] = self;
      id v27 = v4;
      [v10 savePasteboard:v27 dataProviderEndpoint:v11 completionBlock:v26];

      id v12 = v27;
    }
    else
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_4;
      v23[3] = &unk_1E52D9F98;
      id v8 = (id *)&v24;
      uint64_t v24 = v5;
      id v14 = v4;
      id v25 = v14;
      id v15 = v5;
      dispatch_sync(v7, v23);

      objc_msgSend(v14, "setChangeCount:", objc_msgSend(v14, "changeCount") + 1);
      id v12 = v25;
    }

    _sendPasteboardChangedNotification(self);
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v13 = _pasteboardCacheQueue();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45___UIConcretePasteboard__saveItemCollection___block_invoke_5;
    v16[3] = &unk_1E52E1B98;
    id v18 = &v19;
    v16[4] = self;
    id v17 = v4;
    dispatch_sync(v13, v16);

    if (*((unsigned char *)v20 + 24)) {
      _sendPasteboardChangedNotification(self);
    }

    _Block_object_dispose(&v19, 8);
  }
}

- (void)_pinItemCollection:(id)a3
{
  id v4 = a3;
  id v5 = _pasteboardCacheQueue();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44___UIConcretePasteboard__pinItemCollection___block_invoke;
  v7[3] = &unk_1E52D9F98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (void)removePasteboardWithName:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__151;
  uint64_t v20 = __Block_byref_object_dispose__151;
  id v21 = 0;
  id v4 = _pasteboardCacheQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___UIConcretePasteboard_removePasteboardWithName___block_invoke;
  block[3] = &unk_1E52E3210;
  id v15 = &v16;
  id v5 = v3;
  id v14 = v5;
  dispatch_sync(v4, block);

  id v6 = _serverConnection();
  id v12 = 0;
  uint64_t v7 = [v6 deletePersistentPasteboardWithName:v5 error:&v12];
  id v8 = v12;

  if (!v8)
  {
    id v9 = _notificationStateQueue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50___UIConcretePasteboard_removePasteboardWithName___block_invoke_2;
    v11[3] = &__block_descriptor_40_e5_v8__0l;
    v11[4] = v7;
    dispatch_sync(v9, v11);

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"UIPasteboardRemovedNotification" object:v17[5] userInfo:0];
  }
  _Block_object_dispose(&v16, 8);
}

+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v38;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithNSItemProvider:*(void *)(*((void *)&v37 + 1) + 8 * v14)];
          [v10 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v12);
    }

    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__151;
    v35 = __Block_byref_object_dispose__151;
    id v36 = 0;
    uint64_t v16 = _pasteboardCacheQueue();
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __81___UIConcretePasteboard__pinItemProviders_forPasteboardNamed_withExpirationDate___block_invoke;
    v28 = &unk_1E52E3210;
    v30 = &v31;
    id v17 = v8;
    id v29 = v17;
    dispatch_sync(v16, &v25);

    uint64_t v18 = objc_msgSend((id)v32[5], "copyWithItems:", v10, v25, v26, v27, v28);
    [v18 setName:v17];
    [v18 setLocalOnly:1];
    uint64_t v19 = v9;
    if (!v9)
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
    }
    [v18 setExpirationDate:v19];
    if (!v9) {

    }
    id v20 = v17;
    id v21 = v18;
    char v22 = _pasteboardCacheQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___setPinnedItemCollectionForName_block_invoke;
    block[3] = &unk_1E52D9F98;
    id v42 = v20;
    id v43 = v21;
    id v23 = v20;
    id v24 = v21;
    dispatch_sync(v22, block);

    _Block_object_dispose(&v31, 8);
  }
}

+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    _removePinnedItemCollectionForName(v3);
  }
}

+ (void)_attemptAuthenticationWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = _pasteboardAuthenticatedMessageQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___UIConcretePasteboard__attemptAuthenticationWithMessage___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (id)_remoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = _serverConnection();
  v10 = [v9 remoteContentForLayerContextWithId:a3 slotStyle:v8 pasteButtonTag:v7 error:0];

  return v10;
}

+ (id)_loadRequestContextForBlockingUIKitCall:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() == 1)
  {
    if (v3) {
      LODWORD(v5) = 3;
    }
    else {
      LODWORD(v5) = 1;
    }
    if ([(id)UIApp _hasApplicationCalledLaunchDelegate]) {
      uint64_t v5 = v5 | 4;
    }
    else {
      uint64_t v5 = v5;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F881D8]);
  id v7 = [a1 pasteSharingTokenFromOpenURL];
  id v8 = (void *)[v6 initWithOptions:v5 pasteSharingToken:v7];

  return v8;
}

+ (id)_loadRequestContextForBlockingUIKitCall
{
  return (id)[a1 _loadRequestContextForBlockingUIKitCall:1];
}

+ (id)_loadRequestContextForNonBlockingUIKitCall
{
  return (id)[a1 _loadRequestContextForBlockingUIKitCall:0];
}

- (BOOL)isPersistent
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = _pasteboardCacheQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___UIConcretePasteboard_isPersistent__block_invoke;
  v5[3] = &unk_1E52E3210;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_pasteboardCacheQueue_isPersistent
{
  v2 = _pasteboardCacheQueue_existingItemCollectionWithName(self->_name, 0);
  char v3 = [v2 isPersistent];

  return v3;
}

- (BOOL)_pasteboardCacheQueue_setPersistent:(BOOL)a3 currentNotificationState:(unint64_t)a4 outNewNotificationState:(unint64_t *)a5
{
  BOOL v7 = a3;
  char v9 = _pasteboardCacheQueue_existingItemCollectionWithName(self->_name, 0);
  v10 = v9;
  if (v9)
  {
    [v9 setPersistent:v7];
LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
  id v11 = (objc_class *)MEMORY[0x1E4F881C8];
  uint64_t v12 = self->_name;
  id v13 = [v11 alloc];
  uint64_t v14 = (void *)[v13 initWithItems:MEMORY[0x1E4F1CBF0]];
  [v14 setName:v12];
  [v14 setPersistent:1];
  _pasteboardCacheQueue_setItemCollectionForName(v12, v14);

  BOOL v15 = [(_UIConcretePasteboard *)self _pasteboardCacheQueue_saveItemCollection:v14 currentNotificationState:a4 outNewNotificationState:a5];
LABEL_6:

  return v15;
}

- (void)_setPersistent:(BOOL)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = _pasteboardCacheQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___UIConcretePasteboard__setPersistent___block_invoke;
  block[3] = &unk_1E52FF990;
  void block[4] = self;
  block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v9 + 24)) {
    _sendPasteboardChangedNotification(self);
  }
  _Block_object_dispose(&v8, 8);
}

- (int64_t)changeCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  char v3 = _pasteboardCacheQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36___UIConcretePasteboard_changeCount__block_invoke;
  v6[3] = &unk_1E52E4728;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)_changeCountIgnoringPinningActivity
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  char v3 = _pasteboardCacheQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60___UIConcretePasteboard__changeCountIgnoringPinningActivity__block_invoke;
  v6[3] = &unk_1E52E4728;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)pasteSharingToken
{
  saveCompletionGroup = self->_saveCompletionGroup;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E4F88258] * 1000000000.0));
  dispatch_group_wait(saveCompletionGroup, v4);
  return [(_UIConcretePasteboard *)self sharingToken];
}

- (void)setItemProviders:(id)a3
{
}

- (void)setItemProviders:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x1E4F881C0]);
        uint64_t v16 = objc_msgSend(v15, "initWithNSItemProvider:", v14, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(_UIConcretePasteboard *)self _setItemsAndSave:v8 options:v7 coerceStringsToURLs:0];
}

- (void)setItemProviders:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        id v17 = objc_alloc(MEMORY[0x1E4F881C0]);
        long long v18 = objc_msgSend(v17, "initWithNSItemProvider:", v16, (void)v20);
        [v10 addObject:v18];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  long long v19 = objc_alloc_init(_UIPasteboardOptions);
  [(_UIPasteboardOptions *)v19 setPinned:0];
  [(_UIPasteboardOptions *)v19 setLocalOnly:v6];
  if (v9) {
    [(_UIPasteboardOptions *)v19 setExpirationDate:v9];
  }
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", v10, v19, 0, (void)v20);
}

- (void)_pinItemProviders:(id)a3 expirationDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x1E4F881C0]);
        uint64_t v16 = objc_msgSend(v15, "initWithNSItemProvider:", v14, (void)v19);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v17 = objc_alloc_init(_UIPasteboardOptions);
  [(_UIPasteboardOptions *)v17 setPinned:1];
  [(_UIPasteboardOptions *)v17 setLocalOnly:1];
  if (v7)
  {
    [(_UIPasteboardOptions *)v17 setExpirationDate:v7];
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
    [(_UIPasteboardOptions *)v17 setExpirationDate:v18];
  }
  -[_UIConcretePasteboard _setItemsAndSave:options:coerceStringsToURLs:](self, "_setItemsAndSave:options:coerceStringsToURLs:", v8, v17, 0, (void)v19);
}

- (void)_clearPinnedItemProviders
{
}

- (void)setObjects:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x1E4F28D78]);
        uint64_t v16 = objc_msgSend(v15, "initWithObject:", v14, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(_UIConcretePasteboard *)self setItemProviders:v8 options:v7];
}

- (void)setObjects:(id)a3
{
}

- (void)setObjects:(id)a3 localOnly:(BOOL)a4 expirationDate:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        id v17 = objc_alloc(MEMORY[0x1E4F28D78]);
        long long v18 = objc_msgSend(v17, "initWithObject:", v16, (void)v20);
        [v10 addObject:v18];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  long long v19 = objc_alloc_init(_UIPasteboardOptions);
  [(_UIPasteboardOptions *)v19 setLocalOnly:v6];
  if (v9) {
    [(_UIPasteboardOptions *)v19 setExpirationDate:v9];
  }
  -[_UIConcretePasteboard setItemProviders:options:](self, "setItemProviders:options:", v10, v19, (void)v20);
}

- (id)availableTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  dispatch_time_t v4 = _existingItemCollectionWithName(self->_name);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(v4, "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) availableTypes];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v3 allObjects];

  return v11;
}

- (id)itemProviders
{
  return [(_UIConcretePasteboard *)self itemProvidersWithRetryBehavior:1];
}

- (id)itemProvidersWithRetryBehavior:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = _existingItemCollectionWithName(self->_name);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 items];
  uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v8 = [(id)objc_opt_class() _loadRequestContextForNonBlockingUIKitCall];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = objc_msgSend(v4, "items", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    if (v3) {
      long long v13 = &__block_literal_global_414;
    }
    else {
      long long v13 = 0;
    }
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = [[UIItemProvider alloc] initWithPBItem:*(void *)(*((void *)&v17 + 1) + 8 * i) loadRequestContext:v8 secureRetryHandler:v13];
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v4 = [(_UIConcretePasteboard *)self itemProvidersWithRetryBehavior:0];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "canLoadObjectOfClass:", a3, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)canInstantiateObjectsOfClass:(Class)a3
{
  BOOL v3 = [(_UIConcretePasteboard *)self itemProvidersForInstantiatingObjectsOfClass:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (int64_t)numberOfItems
{
  v2 = _existingItemCollectionWithName(self->_name);
  BOOL v3 = [v2 items];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  id v4 = a3;
  id v5 = _existingItemCollectionWithName(self->_name);
  id v6 = [v5 items];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    if (!v4)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v9 = [v5 items];
      objc_msgSend(v8, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51___UIConcretePasteboard_pasteboardTypesForItemSet___block_invoke;
    v15[3] = &unk_1E52DADC0;
    id v16 = v5;
    id v11 = v10;
    id v17 = v11;
    [v4 enumerateIndexesUsingBlock:v15];
    uint64_t v12 = v17;
    id v13 = v11;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)containsPasteboardTypes:(id)a3 inItemSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v8 = _existingItemCollectionWithName(self->_name);
  uint64_t v9 = v8;
  if (v8)
  {
    if (!v7)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28D60];
      id v11 = [v8 items];
      objc_msgSend(v10, "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59___UIConcretePasteboard_containsPasteboardTypes_inItemSet___block_invoke;
    v14[3] = &unk_1E52FF9B8;
    id v15 = v9;
    id v16 = v6;
    id v17 = &v18;
    [v7 enumerateIndexesUsingBlock:v14];
  }
  char v12 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)itemSetWithPasteboardTypes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    id v6 = _existingItemCollectionWithName(self->_name);
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 items];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          id v11 = [v7 items];
          char v12 = [v11 objectAtIndexedSubscript:v10];

          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v13 = v4;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([v12 hasRepresentationConformingToType:*(void *)(*((void *)&v21 + 1) + 8 * i)])
                {
                  [v5 addIndex:v10];
                  goto LABEL_15;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
LABEL_15:

          ++v10;
          uint64_t v18 = [v7 items];
          unint64_t v19 = [v18 count];
        }
        while (v10 < v19);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _existingItemCollectionWithName(self->_name);
  uint64_t v9 = [v8 items];
  uint64_t v10 = [v9 count];

  if (v10 && [v6 length])
  {
    if (!v7)
    {
      id v11 = (void *)MEMORY[0x1E4F28D60];
      char v12 = [v8 items];
      objc_msgSend(v11, "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__151;
    uint64_t v26 = __Block_byref_object_dispose__151;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [(id)objc_opt_class() _loadRequestContextForBlockingUIKitCall];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59___UIConcretePasteboard_valuesForPasteboardType_inItemSet___block_invoke;
    v17[3] = &unk_1E52FFA08;
    id v18 = v8;
    id v19 = v6;
    id v14 = v13;
    id v20 = v14;
    long long v21 = &v22;
    [v7 enumerateIndexesUsingBlock:v17];
    id v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _existingItemCollectionWithName(self->_name);
  uint64_t v9 = [v8 items];
  uint64_t v10 = [v9 count];

  if (v10 && [v6 length])
  {
    if (!v7)
    {
      id v11 = (void *)MEMORY[0x1E4F28D60];
      char v12 = [v8 items];
      objc_msgSend(v11, "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = [(id)objc_opt_class() _loadRequestContextForBlockingUIKitCall];
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__151;
    uint64_t v26 = __Block_byref_object_dispose__151;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57___UIConcretePasteboard_dataForPasteboardType_inItemSet___block_invoke;
    v17[3] = &unk_1E52FFA08;
    id v18 = v8;
    id v19 = v6;
    id v14 = v13;
    id v20 = v14;
    long long v21 = &v22;
    [v7 enumerateIndexesUsingBlock:v17];
    id v15 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)items
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v17 = [MEMORY[0x1E4F1CA48] array];
  id v14 = _existingItemCollectionWithName(self->_name);
  long long v21 = [(id)objc_opt_class() _loadRequestContextForBlockingUIKitCall];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [v14 items];
  uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v43;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v43 != v16)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v19 = v3;
        id v5 = *(void **)(*((void *)&v42 + 1) + 8 * v3);
        id v6 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v20 = [v5 availableTypes];
        uint64_t v7 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v39 != v8) {
                objc_enumerationMutation(v20);
              }
              uint64_t v10 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v32 = 0;
              uint64_t v33 = &v32;
              uint64_t v34 = 0x3032000000;
              v35 = __Block_byref_object_copy__151;
              id v36 = __Block_byref_object_dispose__151;
              id v37 = 0;
              uint64_t v26 = 0;
              id v27 = &v26;
              uint64_t v28 = 0x3032000000;
              id v29 = __Block_byref_object_copy__151;
              v30 = __Block_byref_object_dispose__151;
              id v31 = 0;
              dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __30___UIConcretePasteboard_items__block_invoke;
              v22[3] = &unk_1E52FFAA8;
              uint64_t v24 = &v32;
              uint64_t v25 = &v26;
              v22[4] = v10;
              char v12 = v11;
              long long v23 = v12;
              objc_msgSend(v5, "uikit_loadRepresentationAsType:context:completionBlock:", v10, v21, v22);
              dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

              [v6 setObject:v33[5] forKeyedSubscript:v10];
              _recordHangAssertionIfNecessaryForResponseMetadata((void *)v27[5]);
              _Block_object_dispose(&v26, 8);

              _Block_object_dispose(&v32, 8);
            }
            uint64_t v7 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v7);
        }

        [v17 addObject:v6];
        uint64_t v3 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v18);
  }

  return v17;
}

- (void)setItems:(id)a3
{
}

- (void)setItems:(id)a3 options:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v39;
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v38 + 1) + 8 * v6);
        uint64_t v8 = [v7 objectForKeyedSubscript:@"com.apple.uikit.type-automatic"];
        v30 = (void *)v8;
        uint64_t v31 = v6;
        if (v8) {
          id v9 = (id)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v8];
        }
        else {
          id v9 = objc_alloc_init(MEMORY[0x1E4F881C0]);
        }
        uint64_t v10 = v9;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v35 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              if (([v16 isEqualToString:@"com.apple.uikit.type-automatic"] & 1) == 0)
              {
                id v17 = [v11 objectForKeyedSubscript:v16];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  id v29 = (void *)MEMORY[0x1E4F1CA00];
                                  uint64_t v18 = _NSFullMethodName();
                                  [v29 raise:v24, @"%@: value for pasteboard type '%@' is not a valid property list type", v18, v16 format];
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                if (v17)
                {
                  uint64_t v19 = ConvertValueToData(v17, v16);
                  if (v19)
                  {
                    v32[0] = MEMORY[0x1E4F143A8];
                    v32[1] = 3221225472;
                    v32[2] = __42___UIConcretePasteboard_setItems_options___block_invoke;
                    v32[3] = &unk_1E52FFAD0;
                    id v33 = v19;
                    id v20 = v19;
                    objc_msgSend(v10, "uikit_addRepresentationType:loaderBlock:", v16, v32);
                  }
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v13);
        }

        [v27 addObject:v10];
        uint64_t v6 = v31 + 1;
      }
      while (v31 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v28);
  }

  long long v21 = +[_UIPasteboardOptions optionsWithDictionary:v22];
  [(_UIConcretePasteboard *)self _setItemsAndSave:v27 options:v21];
}

- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5 dataOwner:(int64_t)a6
{
  BOOL v6 = a5;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v43 = a4;
  if (v6)
  {
    long long v40 = self;
    uint64_t v44 = [(id)objc_opt_class() _loadRequestContextForBlockingUIKitCall];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v42;
    uint64_t v9 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v67;
      id v11 = (void *)*MEMORY[0x1E4F444F8];
      v46 = (void *)*MEMORY[0x1E4F443F0];
      long long v45 = (void *)*MEMORY[0x1E4F44538];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v67 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x18C108260]();
          id v15 = [v11 identifier];
          char v16 = [v13 hasRepresentationConformingToType:v15];

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = objc_opt_class();
            uint64_t v18 = [v46 identifier];
            v70[0] = v18;
            uint64_t v19 = [v45 identifier];
            v70[1] = v19;
            id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
            LODWORD(v17) = objc_msgSend(v13, "uikit_canInstantiateObjectOfClass:excludingCoercionsFromTypes:", v17, v20);

            if (v17)
            {
              uint64_t v60 = 0;
              v61 = &v60;
              uint64_t v62 = 0x3032000000;
              v63 = __Block_byref_object_copy__151;
              v64 = __Block_byref_object_dispose__151;
              id v65 = 0;
              uint64_t v54 = 0;
              v55 = &v54;
              uint64_t v56 = 0x3032000000;
              v57 = __Block_byref_object_copy__151;
              v58 = __Block_byref_object_dispose__151;
              id v59 = 0;
              dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
              uint64_t v22 = objc_opt_class();
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v50[2] = __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke;
              v50[3] = &unk_1E52FFA30;
              v52 = &v60;
              v53 = &v54;
              long long v23 = v21;
              v51 = v23;
              id v24 = (id)objc_msgSend(v13, "uikit_loadObjectOfClass:context:completionBlock:", v22, v44, v50);
              dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

              _recordHangAssertionIfNecessaryForResponseMetadata((void *)v55[5]);
              uint64_t v25 = v61[5];
              if (v25)
              {
                uint64_t v26 = [MEMORY[0x1E4F1CB10] URLWithString:v25 encodingInvalidCharacters:0];
                id v27 = [v26 scheme];
                BOOL v28 = [v27 length] == 0;

                if (!v28)
                {
                  id v29 = _convertURLToDataRepresentation(v26);
                  v30 = [v11 identifier];
                  v48[0] = MEMORY[0x1E4F143A8];
                  v48[1] = 3221225472;
                  v48[2] = __80___UIConcretePasteboard__setItemsAndSave_options_coerceStringsToURLs_dataOwner___block_invoke_2;
                  v48[3] = &unk_1E52FFAD0;
                  id v31 = v29;
                  id v49 = v31;
                  objc_msgSend(v13, "uikit_addRepresentationType:loaderBlock:", v30, v48);
                }
              }
              _Block_object_dispose(&v54, 8);

              _Block_object_dispose(&v60, 8);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v9);
    }

    self = v40;
  }
  uint64_t v32 = self;
  _existingItemCollectionWithName(self->_name);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33) {
    id v33 = objc_alloc_init(MEMORY[0x1E4F881C8]);
  }
  long long v34 = objc_msgSend(v33, "availableRepresentationTypes", v40);
  long long v35 = (void *)[v33 copyWithItems:v42];
  [v35 setName:self->_name];
  objc_msgSend(v35, "setChangeCount:", objc_msgSend(v33, "changeCount"));
  [v35 setOriginatorDataOwner:a6];
  if (v43)
  {
    int v36 = [v43 isPinned];
    uint64_t v37 = [v43 isLocalOnly];
    long long v38 = [v43 expirationDate];
  }
  else
  {
    uint64_t v37 = [v33 isLocalOnly];
    long long v38 = [v33 expirationDate];
    int v36 = 0;
  }
  [v35 setLocalOnly:v37];
  [v35 setExpirationDate:v38];
  if (v36)
  {
    [(_UIConcretePasteboard *)self _pinItemCollection:v35];
  }
  else
  {
    [(_UIConcretePasteboard *)self _saveItemCollection:v35];
    long long v39 = [v35 availableRepresentationTypes];
    [(_UIConcretePasteboard *)v32 _sendPasteboardTypesChangedNotificationOldTypes:v34 newTypes:v39];
  }
}

- (void)_setItemsAndSave:(id)a3 options:(id)a4 coerceStringsToURLs:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(_UIConcretePasteboard *)self _setItemsAndSave:v9 options:v8 coerceStringsToURLs:v5 dataOwner:_pasteboardThreadLocalDataOwner()];
}

- (void)_setItemsAndSave:(id)a3 options:(id)a4
{
}

- (void)addItems:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = self;
  _existingItemCollectionWithName(self->_name);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F881C8]);
    [v5 setName:self->_name];
  }
  long long v23 = v5;
  BOOL v6 = [v5 items];
  uint64_t v7 = [v6 mutableCopy];

  BOOL v28 = (void *)v7;
  if (!v7)
  {
    BOOL v28 = [MEMORY[0x1E4F1CA48] array];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v40;
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        uint64_t v10 = [v9 objectForKeyedSubscript:@"com.apple.uikit.type-automatic"];
        id v31 = (void *)v10;
        uint64_t v32 = v8;
        if (v10) {
          id v11 = (id)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v10];
        }
        else {
          id v11 = objc_alloc_init(MEMORY[0x1E4F881C0]);
        }
        uint64_t v12 = v11;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = v9;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (([v18 isEqualToString:@"com.apple.uikit.type-automatic"] & 1) == 0)
              {
                uint64_t v19 = [v13 objectForKeyedSubscript:v18];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  v30 = (void *)MEMORY[0x1E4F1CA00];
                                  id v20 = _NSFullMethodName();
                                  [v30 raise:v25, @"%@: value for pasteboard type '%@' is not a valid property list type", v20, v18 format];
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
                if (v19)
                {
                  dispatch_semaphore_t v21 = ConvertValueToData(v19, v18);
                  if (v21)
                  {
                    v33[0] = MEMORY[0x1E4F143A8];
                    v33[1] = 3221225472;
                    v33[2] = __34___UIConcretePasteboard_addItems___block_invoke;
                    v33[3] = &unk_1E52FFAD0;
                    id v34 = v21;
                    id v22 = v21;
                    objc_msgSend(v12, "uikit_addRepresentationType:loaderBlock:", v18, v33);
                  }
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v15);
        }

        [v28 addObject:v12];
        uint64_t v8 = v32 + 1;
      }
      while (v32 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v29);
  }

  [(_UIConcretePasteboard *)v26 _setItemsAndSave:v28 options:0];
}

- (id)pasteboardTypes
{
  v2 = _existingItemCollectionWithName(self->_name);
  uint64_t v3 = [v2 items];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 availableTypes];

  if (v5) {
    BOOL v6 = (void *)v5;
  }
  else {
    BOOL v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (BOOL)containsPasteboardTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _existingItemCollectionWithName(self->_name);
  BOOL v6 = [v5 items];
  uint64_t v7 = [v6 firstObject];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(v7, "hasRepresentationConformingToType:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)dataForPasteboardType:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28D60];
  id v5 = a3;
  BOOL v6 = [v4 indexSetWithIndex:0];
  uint64_t v7 = [(_UIConcretePasteboard *)self dataForPasteboardType:v5 inItemSet:v6];

  id v8 = [v7 firstObject];

  return v8;
}

- (id)valueForPasteboardType:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28D60];
  id v5 = a3;
  BOOL v6 = [v4 indexSetWithIndex:0];
  uint64_t v7 = [(_UIConcretePasteboard *)self valuesForPasteboardType:v5 inItemSet:v6];

  id v8 = [v7 firstObject];

  return v8;
}

- (void)setValue:(id)a3 forPasteboardType:(id)a4
{
  uint64_t v17 = (UIImage *)a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v8 = *MEMORY[0x1E4F1C3C8];
                uint64_t v9 = _NSFullMethodName();
                [v7 raise:v8, @"%@: value is not a valid property list type", v9 format];
              }
            }
          }
        }
      }
    }
  }
  if (!v17)
  {
    id v11 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v17;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [(UIImage *)v17 dataUsingEncoding:4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [(UIImage *)v17 baseURL];
          long long v13 = (void *)MEMORY[0x1E4F1C978];
          if (v12)
          {
            long long v14 = [(UIImage *)v17 relativeString];
            long long v15 = [v12 absoluteString];
            long long v16 = objc_msgSend(v13, "arrayWithObjects:", v14, v15, 0);
          }
          else
          {
            long long v14 = [(UIImage *)v17 absoluteString];
            long long v16 = objc_msgSend(v13, "arrayWithObjects:", v14, &stru_1ED0E84C0, 0);
          }

          id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v16 format:200 options:0 error:0];

          goto LABEL_18;
        }
        uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:200 options:0 error:0];
        goto LABEL_17;
      }
      if ([v6 isEqual:0x1ED154EA0])
      {
LABEL_16:
        _UIEncodeObjectToPasteboardData(v17);
        uint64_t v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        UIImagePNGRepresentation(v17);
        uint64_t v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
LABEL_17:
  id v11 = v10;
LABEL_18:
  [(_UIConcretePasteboard *)self setData:v11 forPasteboardType:v6];
}

- (void)_sendPasteboardTypesChangedNotificationOldTypes:(id)a3 newTypes:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v15 = [v6 setWithArray:a3];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];

  uint64_t v9 = (void *)[v8 mutableCopy];
  [v9 minusSet:v15];
  uint64_t v10 = (void *)[v15 mutableCopy];
  [v10 minusSet:v8];
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([v9 count])
    {
      uint64_t v12 = [v9 allObjects];
      [v11 setObject:v12 forKeyedSubscript:@"UIPasteboardChangedTypesAddedKey"];
    }
    if ([v10 count])
    {
      long long v13 = [v10 allObjects];
      [v11 setObject:v13 forKeyedSubscript:@"UIPasteboardChangedTypesRemovedKey"];
    }
    long long v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"UIPasteboardChangedNotification" object:self userInfo:v11];
  }
}

- (void)setData:(id)a3 forPasteboardType:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F881C0]);
  uint64_t v9 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v7 allowUndeclared:1];
  unint64_t v10 = 0x1E4F88000;
  if (![v9 conformsToType:*MEMORY[0x1E4F444A8]]) {
    goto LABEL_9;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28CF0]) initWithSerializedRepresentation:v6];
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v25 = self;
  long long v13 = _UITemporaryFolderURL(@"com.apple.UIKit");
  long long v14 = [v9 localizedDescription];
  if (!v14)
  {
    long long v14 = [(id)*MEMORY[0x1E4F44408] localizedDescription];
  }
  id v24 = [v14 stringByAppendingPathExtensionForType:v9];
  id v15 = objc_msgSend(v13, "URLByAppendingPathComponent:");
  int v16 = [v12 writeToURL:v15 options:1 originalContentsURL:0 error:0];
  char v17 = v16;
  if (v16)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F881D0]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke;
    v28[3] = &unk_1E52FFAF8;
    id v29 = v15;
    id v30 = v13;
    uint64_t v18 = objc_msgSend(v23, "initWithType:preferredRepresentation:v3_loader:", v7, 1, v28);
    [v8 addRepresentation:v18];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v19 removeItemAtURL:v13 error:0];
  }
  self = v25;
  unint64_t v10 = 0x1E4F88000uLL;
  if ((v17 & 1) == 0)
  {
LABEL_9:
    id v20 = objc_alloc(*(Class *)(v10 + 464));
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __51___UIConcretePasteboard_setData_forPasteboardType___block_invoke_3;
    v26[3] = &unk_1E52FFB20;
    id v27 = v6;
    dispatch_semaphore_t v21 = objc_msgSend(v20, "initWithType:preferredRepresentation:v3_loader:", v7, 0, v26);
    [v8 addRepresentation:v21];
  }
  v31[0] = v8;
  id v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 1, v23);
  [(_UIConcretePasteboard *)self _setItemsAndSave:v22 options:0];
}

- (id)_itemsCoercibleToClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = _existingItemCollectionWithName(self->_name);
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = _coerceItemToClass(*(void **)(*((void *)&v13 + 1) + 8 * i), (uint64_t)a3);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)string
{
  v2 = _existingItemCollectionWithName(self->_name);
  uint64_t v3 = [v2 items];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  id v6 = _coerceItemToClass(v4, v5);

  return v6;
}

- (void)_clearItems
{
  uint64_t v3 = objc_alloc_init(_UIPasteboardOptions);
  [(_UIConcretePasteboard *)self _setItemsAndSave:0 options:v3];
}

- (void)setString:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      uint64_t v7 = _NSFullMethodName();
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v5 raise:v6, @"%@: Argument is not an object of type NSString [%@]", v7, v9 format];
    }
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v4];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = objc_alloc_init(_UIPasteboardOptions);
    [(_UIConcretePasteboard *)self _setItemsAndSave:v11 options:v12];
  }
  else
  {
    [(_UIConcretePasteboard *)self _clearItems];
  }
}

- (id)strings
{
  uint64_t v3 = objc_opt_class();
  return [(_UIConcretePasteboard *)self _itemsCoercibleToClass:v3];
}

- (void)_setItemsAndSaveFromObjects:(id)a3 ofClass:(Class)a4
{
  id v7 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__151;
  long long v15 = __Block_byref_object_dispose__151;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___UIConcretePasteboard__setItemsAndSaveFromObjects_ofClass___block_invoke;
  v10[3] = &unk_1E52FFB48;
  v10[6] = a4;
  v10[7] = a2;
  v10[4] = self;
  v10[5] = &v11;
  [v7 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = v12[5];
  uint64_t v9 = objc_alloc_init(_UIPasteboardOptions);
  [(_UIConcretePasteboard *)self _setItemsAndSave:v8 options:v9];

  _Block_object_dispose(&v11, 8);
}

- (void)setStrings:(id)a3
{
  id v4 = a3;
  [(_UIConcretePasteboard *)self _setItemsAndSaveFromObjects:v4 ofClass:objc_opt_class()];
}

- (id)URL
{
  v2 = _existingItemCollectionWithName(self->_name);
  uint64_t v3 = [v2 items];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = _coerceItemToClass(v4, v5);

  return v6;
}

- (void)setURL:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      id v7 = _NSFullMethodName();
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v5 raise:v6, @"%@: Argument is not an object of type NSURL [%@]", v7, v9 format];
    }
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v4];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = objc_alloc_init(_UIPasteboardOptions);
    [(_UIConcretePasteboard *)self _setItemsAndSave:v11 options:v12];
  }
  else
  {
    [(_UIConcretePasteboard *)self _clearItems];
  }
}

- (id)URLs
{
  uint64_t v3 = objc_opt_class();
  return [(_UIConcretePasteboard *)self _itemsCoercibleToClass:v3];
}

- (void)setURLs:(id)a3
{
  id v4 = a3;
  [(_UIConcretePasteboard *)self _setItemsAndSaveFromObjects:v4 ofClass:objc_opt_class()];
}

- (id)image
{
  v2 = _existingItemCollectionWithName(self->_name);
  uint64_t v3 = [v2 items];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = _coerceItemToClass(v4, v5);

  return v6;
}

- (void)setImage:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      id v7 = _NSFullMethodName();
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v5 raise:v6, @"%@: Argument is not an object of type UIImage [%@]", v7, v9 format];
    }
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v4];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = objc_alloc_init(_UIPasteboardOptions);
    [(_UIConcretePasteboard *)self _setItemsAndSave:v11 options:v12];
  }
  else
  {
    [(_UIConcretePasteboard *)self _clearItems];
  }
}

- (id)images
{
  uint64_t v3 = objc_opt_class();
  return [(_UIConcretePasteboard *)self _itemsCoercibleToClass:v3];
}

- (void)setImages:(id)a3
{
  id v4 = a3;
  [(_UIConcretePasteboard *)self _setItemsAndSaveFromObjects:v4 ofClass:objc_opt_class()];
}

- (id)color
{
  v2 = _existingItemCollectionWithName(self->_name);
  uint64_t v3 = [v2 items];
  id v4 = [v3 firstObject];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = _coerceItemToClass(v4, v5);

  return v6;
}

- (void)setColor:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3C8];
      id v7 = _NSFullMethodName();
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      [v5 raise:v6, @"%@: Argument is not an object of type UIColor [%@]", v7, v9 format];
    }
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F881C0]) initWithObject:v4];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = objc_alloc_init(_UIPasteboardOptions);
    [(_UIConcretePasteboard *)self _setItemsAndSave:v11 options:v12];
  }
  else
  {
    [(_UIConcretePasteboard *)self _clearItems];
  }
}

- (id)colors
{
  uint64_t v3 = objc_opt_class();
  return [(_UIConcretePasteboard *)self _itemsCoercibleToClass:v3];
}

- (void)setColors:(id)a3
{
  id v4 = a3;
  [(_UIConcretePasteboard *)self _setItemsAndSaveFromObjects:v4 ofClass:objc_opt_class()];
}

- (BOOL)hasStrings
{
  v2 = _existingItemCollectionWithName(self->_name);
  char v3 = [v2 canInstantiateObjectOfClass:objc_opt_class()];

  return v3;
}

- (BOOL)hasURLs
{
  v2 = _existingItemCollectionWithName(self->_name);
  char v3 = [v2 canInstantiateObjectOfClass:objc_opt_class()];

  return v3;
}

- (BOOL)hasImages
{
  v2 = _existingItemCollectionWithName(self->_name);
  char v3 = [v2 canInstantiateObjectOfClass:objc_opt_class()];

  return v3;
}

- (BOOL)hasColors
{
  v2 = _existingItemCollectionWithName(self->_name);
  char v3 = [v2 canInstantiateObjectOfClass:objc_opt_class()];

  return v3;
}

+ (id)_pasteboardWithUniqueName
{
  char v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [a1 _pasteboardNamed:v4 createIfNotFound:1];

  uint64_t v6 = objc_alloc_init(_UIPasteboardOptions);
  [v5 _setItemsAndSave:MEMORY[0x1E4F1CBF0] options:v6];

  return v5;
}

- (id)_detectedPasteboardTypesForTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _existingItemCollectionWithName(self->_name);
  uint64_t v6 = [v5 items];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke;
    v23[3] = &unk_1E52FFB70;
    id v9 = v8;
    id v24 = v9;
    unint64_t v10 = [v7 enumeratePatternDetectionsForPatterns:v4 usingBlock:v23];
    if ([v10 count])
    {
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      uint64_t v18 = _serverConnection();
      uint64_t v12 = [v5 name];
      uint64_t v13 = [v5 UUID];
      long long v14 = _pasteboardThreadLocalDataOwner();
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __58___UIConcretePasteboard__detectedPasteboardTypesForTypes___block_invoke_2;
      v19[3] = &unk_1E52FFBC0;
      id v20 = v9;
      id v21 = v7;
      dispatch_semaphore_t v22 = v11;
      long long v15 = v11;
      [v18 requestPatternDetectionsFromPasteboardWithName:v12 UUID:v13 authenticationMessage:0 itemIndex:0 patterns:v10 needValues:0 dataOwner:v14 completionBlock:v19];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
    id v16 = v9;
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v16;
}

- (id)_detectedPasteboardTypeStringsForTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _existingItemCollectionWithName(self->_name);
  uint64_t v6 = [v5 items];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke;
    v28[3] = &unk_1E52FFBE8;
    id v10 = v8;
    id v29 = v10;
    id v11 = v9;
    id v30 = v11;
    uint64_t v12 = [v7 enumeratePatternDetectionsForPatterns:v4 usingBlock:v28];
    [v11 unionSet:v12];

    if ([v11 count])
    {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      long long v14 = _serverConnection();
      [v5 name];
      long long v15 = v23 = v4;
      id v16 = [v5 UUID];
      uint64_t v22 = _pasteboardLastAuthenticatedMessage;
      char v17 = _pasteboardThreadLocalDataOwner();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64___UIConcretePasteboard__detectedPasteboardTypeStringsForTypes___block_invoke_2;
      v24[3] = &unk_1E52FFBC0;
      id v25 = v10;
      id v26 = v7;
      dispatch_semaphore_t v27 = v13;
      uint64_t v18 = v13;
      [v14 requestPatternDetectionsFromPasteboardWithName:v15 UUID:v16 authenticationMessage:v22 itemIndex:0 patterns:v11 needValues:1 dataOwner:v17 completionBlock:v24];

      id v4 = v23;
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v19 = v30;
    id v20 = v10;
  }
  else
  {
    id v20 = (id)MEMORY[0x1E4F1CC08];
  }

  return v20;
}

+ (void)_detectPatternsForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 items];
  if ([v12 count] <= a4)
  {
    id v29 = _pasteboardCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke;
    block[3] = &unk_1E52DA9A8;
    id v42 = v11;
    unint64_t v43 = a4;
    dispatch_async(v29, block);

    dispatch_semaphore_t v13 = v42;
  }
  else
  {
    dispatch_semaphore_t v13 = [v12 objectAtIndexedSubscript:a4];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2;
    v39[3] = &unk_1E52FFB70;
    id v15 = v14;
    id v40 = v15;
    id v16 = [v13 enumeratePatternDetectionsForPatterns:v9 usingBlock:v39];
    if ([v16 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4;
      aBlock[3] = &unk_1E52FFC10;
      id v35 = v11;
      id v33 = v15;
      id v34 = v13;
      id v31 = v16;
      char v17 = _Block_copy(aBlock);
      uint64_t v18 = _serverConnection();
      uint64_t v19 = [v10 name];
      [v10 UUID];
      id v30 = v12;
      id v20 = v13;
      id v21 = v10;
      id v22 = v11;
      id v23 = v15;
      v25 = id v24 = v9;
      [v18 requestPatternDetectionsFromPasteboardWithName:v19 UUID:v25 authenticationMessage:0 itemIndex:a4 patterns:v31 needValues:0 dataOwner:_pasteboardThreadLocalDataOwner() completionBlock:v17];

      id v9 = v24;
      id v15 = v23;
      id v11 = v22;
      id v10 = v21;
      dispatch_semaphore_t v13 = v20;
      uint64_t v12 = v30;

      id v26 = &v33;
      dispatch_semaphore_t v27 = &v35;

      id v16 = v31;
      BOOL v28 = v34;
    }
    else
    {
      BOOL v28 = _pasteboardCompletionQueue();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __93___UIConcretePasteboard__detectPatternsForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3;
      v36[3] = &unk_1E52DB330;
      dispatch_semaphore_t v27 = &v38;
      id v38 = v11;
      id v26 = &v37;
      id v37 = v15;
      dispatch_async(v28, v36);
    }
  }
}

+ (id)clientValueForValue:(id)a3 pattern:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (qword_1EB25C9C8 != -1) {
    dispatch_once(&qword_1EB25C9C8, &__block_literal_global_90_1);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend((id)_MergedGlobals_5_12, "objectForKeyedSubscript:", v6, (void)v20);
          id v15 = (void *)v14;
          if (v14)
          {
            id v16 = (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v13);
            [v7 addObject:v16];
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v17 = [(id)_MergedGlobals_5_12 objectForKeyedSubscript:v6];
    id v8 = (id)v17;
    if (v17)
    {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v5);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = v5;
    }
    id v7 = v18;
  }

  return v7;
}

+ (void)_detectValuesForPatterns:(id)a3 atIndex:(unint64_t)a4 itemCollection:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 items];
  if ([v13 count] <= a4)
  {
    id v34 = _pasteboardCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke;
    block[3] = &unk_1E52DA9A8;
    id v50 = v12;
    unint64_t v51 = a4;
    dispatch_async(v34, block);

    uint64_t v14 = v50;
  }
  else
  {
    uint64_t v14 = [v13 objectAtIndexedSubscript:a4];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_2;
    v45[3] = &unk_1E52FFD38;
    id v17 = v15;
    id v46 = v17;
    id v48 = a1;
    id v18 = v16;
    id v47 = v18;
    id v37 = v10;
    uint64_t v19 = [v14 enumeratePatternDetectionsForPatterns:v10 usingBlock:v45];
    [v18 unionSet:v19];

    if ([v18 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_4;
      aBlock[3] = &unk_1E52FFD88;
      v41[0] = v12;
      id v39 = v17;
      v41[1] = a1;
      id v40 = v14;
      id v36 = v18;
      long long v20 = _Block_copy(aBlock);
      long long v21 = _serverConnection();
      long long v22 = [v11 name];
      [v11 UUID];
      long long v23 = v35 = v17;
      id v24 = v13;
      id v25 = v11;
      id v26 = v14;
      id v27 = v12;
      uint64_t v28 = _pasteboardLastAuthenticatedMessage;
      id v29 = _pasteboardThreadLocalDataOwner();
      uint64_t v30 = v28;
      id v12 = v27;
      uint64_t v14 = v26;
      id v11 = v25;
      uint64_t v13 = v24;
      id v31 = (id *)v41;
      [v21 requestPatternDetectionsFromPasteboardWithName:v22 UUID:v23 authenticationMessage:v30 itemIndex:a4 patterns:v36 needValues:1 dataOwner:v29 completionBlock:v20];

      id v17 = v35;
      uint64_t v32 = &v39;

      id v18 = v36;
      id v33 = v40;
    }
    else
    {
      id v33 = _pasteboardCompletionQueue();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __91___UIConcretePasteboard__detectValuesForPatterns_atIndex_itemCollection_completionHandler___block_invoke_3;
      v42[3] = &unk_1E52DB330;
      id v31 = &v44;
      id v44 = v12;
      uint64_t v32 = &v43;
      id v43 = v17;
      dispatch_async(v33, v42);
    }

    id v10 = v37;
  }
}

+ (void)_asynchronouslyEnumerateItemSet:(id)a3 itemsCompletionHandler:(id)a4 usingItemBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v10 = [v7 count];
  if (v10 == 1)
  {
    uint64_t v14 = [v7 firstIndex];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_2;
    v28[3] = &unk_1E52FFDB0;
    id v29 = v8;
    v9[2](v9, v14, v28);
    uint64_t v13 = v29;
    goto LABEL_5;
  }
  size_t v11 = v10;
  if (!v10)
  {
    id v12 = _pasteboardCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke;
    block[3] = &unk_1E52DA040;
    id v31 = v8;
    dispatch_async(v12, block);

    uint64_t v13 = v31;
LABEL_5:

    goto LABEL_9;
  }
  id v15 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
  id v20 = v7;
  [v7 getIndexes:v15 maxCount:v11 inIndexRange:0];
  id v16 = malloc_type_calloc(v11, 8uLL, 0x80040B8603338uLL);
  uint64_t v17 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  do
  {
    uint64_t v19 = v15[v17];
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __95___UIConcretePasteboard__asynchronouslyEnumerateItemSet_itemsCompletionHandler_usingItemBlock___block_invoke_3;
    v21[3] = &unk_1E52FFDD8;
    long long v23 = v27;
    id v24 = v16;
    uint64_t v25 = v17;
    size_t v26 = v11;
    id v22 = v8;
    v9[2](v9, v19, v21);

    ++v17;
  }
  while (v11 != v17);
  free(v15);
  _Block_object_dispose(v27, 8);
  id v7 = v20;
LABEL_9:
}

- (void)detectPatternsForPatterns:(id)a3 completionHandler:(id)a4
{
  name = self->_name;
  id v6 = a4;
  id v7 = a3;
  _existingItemCollectionWithName(name);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIConcretePasteboard _detectPatternsForPatterns:v7 atIndex:0 itemCollection:v8 completionHandler:v6];
}

- (void)detectPatternsForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _existingItemCollectionWithName(self->_name);
  uint64_t v13 = v10;
  if (!v10)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28D60]);
    id v5 = [v12 items];
    uint64_t v13 = objc_msgSend(v14, "initWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79___UIConcretePasteboard_detectPatternsForPatterns_inItemSet_completionHandler___block_invoke;
  v17[3] = &unk_1E52FFE00;
  id v18 = v9;
  id v19 = v12;
  id v15 = v12;
  id v16 = v9;
  +[_UIConcretePasteboard _asynchronouslyEnumerateItemSet:v13 itemsCompletionHandler:v11 usingItemBlock:v17];
  if (!v10)
  {
  }
}

- (void)detectValuesForPatterns:(id)a3 completionHandler:(id)a4
{
  name = self->_name;
  id v6 = a4;
  id v7 = a3;
  _existingItemCollectionWithName(name);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIConcretePasteboard _detectValuesForPatterns:v7 atIndex:0 itemCollection:v8 completionHandler:v6];
}

- (void)detectValuesForPatterns:(id)a3 inItemSet:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _existingItemCollectionWithName(self->_name);
  uint64_t v13 = v10;
  if (!v10)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28D60]);
    id v5 = [v12 items];
    uint64_t v13 = objc_msgSend(v14, "initWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77___UIConcretePasteboard_detectValuesForPatterns_inItemSet_completionHandler___block_invoke;
  v17[3] = &unk_1E52FFE00;
  id v18 = v9;
  id v19 = v12;
  id v15 = v12;
  id v16 = v9;
  +[_UIConcretePasteboard _asynchronouslyEnumerateItemSet:v13 itemsCompletionHandler:v11 usingItemBlock:v17];
  if (!v10)
  {
  }
}

- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5
{
  id v7 = a5;
  id v8 = _pasteboardAuthenticatedMessageQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115___UIConcretePasteboard__requestSecurePasteAuthenticationMessageWithContext_forClientVersionedPID_completionBlock___block_invoke;
  block[3] = &unk_1E52FFE28;
  unint64_t v12 = a3;
  int64_t v13 = a4;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (UISPasteSharingToken)sharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharingToken:(id)a3
{
}

- (OS_dispatch_group)saveCompletionGroup
{
  return self->_saveCompletionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveCompletionGroup, 0);
  objc_storeStrong((id *)&self->_sharingToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end