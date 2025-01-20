@interface UIPasteboard
+ (UIPasteboard)generalPasteboard;
+ (UISPasteSharingToken)pasteSharingTokenFromOpenURL;
+ (id)_pasteboardWithName:(id)a3 create:(BOOL)a4;
+ (id)_pasteboardWithUniqueName;
+ (void)_attemptAuthenticationWithMessage:(id)a3;
+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3;
+ (void)_performAsDataOwner:(int64_t)a3 block:(id)a4;
+ (void)_performAsDataOwnerForAction:(SEL)a3 responder:(id)a4 block:(id)a5;
+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5;
+ (void)removePasteboardWithName:(UIPasteboardName)pasteboardName;
+ (void)setPasteSharingTokenFromOpenURL:(id)a3;
- (BOOL)canInstantiateObjectsOfClass:(Class)a3;
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes;
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes inItemSet:(NSIndexSet *)itemSet;
- (BOOL)hasColors;
- (BOOL)hasImages;
- (BOOL)hasStrings;
- (BOOL)hasURLs;
- (BOOL)isPersistent;
- (NSArray)URLs;
- (NSArray)availableTypes;
- (NSArray)colors;
- (NSArray)dataForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet;
- (NSArray)images;
- (NSArray)itemProviders;
- (NSArray)items;
- (NSArray)pasteboardTypes;
- (NSArray)pasteboardTypesForItemSet:(NSIndexSet *)itemSet;
- (NSArray)strings;
- (NSArray)valuesForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet;
- (NSData)dataForPasteboardType:(NSString *)pasteboardType;
- (NSIndexSet)itemSetWithPasteboardTypes:(NSArray *)pasteboardTypes;
- (NSInteger)changeCount;
- (NSInteger)numberOfItems;
- (NSString)string;
- (NSURL)URL;
- (UIColor)color;
- (UIImage)image;
- (UIPasteboardName)name;
- (id)_detectedPasteboardTypeStringsForTypes:(id)a3;
- (id)_detectedPasteboardTypesForTypes:(id)a3;
- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3;
- (id)pasteSharingToken;
- (id)valueForPasteboardType:(NSString *)pasteboardType;
- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5;
@end

@implementation UIPasteboard

+ (UIPasteboard)generalPasteboard
{
  return (UIPasteboard *)+[_UIConcretePasteboard generalPasteboard];
}

+ (UISPasteSharingToken)pasteSharingTokenFromOpenURL
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1180);
  id v2 = (id)qword_1EB262160;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1180);
  return (UISPasteSharingToken *)v2;
}

+ (void)setPasteSharingTokenFromOpenURL:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1180);
  uint64_t v4 = [v3 copy];

  v5 = (void *)qword_1EB262160;
  qword_1EB262160 = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1180);
}

- (UIPasteboardName)name
{
  return (UIPasteboardName)@"Nonfunctioning pasteboard";
}

+ (void)removePasteboardWithName:(UIPasteboardName)pasteboardName
{
}

- (BOOL)isPersistent
{
  return 0;
}

- (NSInteger)changeCount
{
  return 0;
}

- (id)pasteSharingToken
{
  return 0;
}

- (NSArray)pasteboardTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes
{
  return 0;
}

- (NSData)dataForPasteboardType:(NSString *)pasteboardType
{
  return 0;
}

- (id)valueForPasteboardType:(NSString *)pasteboardType
{
  return 0;
}

- (NSInteger)numberOfItems
{
  return 0;
}

- (NSArray)pasteboardTypesForItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSIndexSet)itemSetWithPasteboardTypes:(NSArray *)pasteboardTypes
{
  return 0;
}

- (NSArray)valuesForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSArray)dataForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet
{
  return 0;
}

- (NSArray)items
{
  return 0;
}

- (NSString)string
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

- (UIImage)image
{
  return 0;
}

- (UIColor)color
{
  return 0;
}

- (NSArray)strings
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (NSArray)images
{
  return 0;
}

- (NSArray)colors
{
  return 0;
}

- (BOOL)hasStrings
{
  return 0;
}

- (BOOL)hasURLs
{
  return 0;
}

- (BOOL)hasImages
{
  return 0;
}

- (BOOL)hasColors
{
  return 0;
}

+ (void)_attemptAuthenticationWithMessage:(id)a3
{
}

+ (id)_pasteboardWithName:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (([v5 isEqualToString:@"com.apple.UIKit.pboard.find"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.UIKit.pboard.print"])
  {
    v6 = objc_alloc_init(UIPasteboard);
  }
  else
  {
    v6 = +[_UIConcretePasteboard _pasteboardWithName:v5 create:v4];
  }
  v7 = v6;

  return v7;
}

+ (id)_pasteboardWithUniqueName
{
  return +[_UIConcretePasteboard _pasteboardWithUniqueName];
}

+ (void)_pinItemProviders:(id)a3 forPasteboardNamed:(id)a4 withExpirationDate:(id)a5
{
}

+ (void)_clearPinnedItemProvidersForPasteboardNamed:(id)a3
{
}

- (NSArray)availableTypes
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)itemProviders
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)itemProvidersForInstantiatingObjectsOfClass:(Class)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canInstantiateObjectsOfClass:(Class)a3
{
  return 0;
}

- (id)_detectedPasteboardTypesForTypes:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v3;
}

- (id)_detectedPasteboardTypeStringsForTypes:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (void)_performAsDataOwner:(int64_t)a3 block:(id)a4
{
  id v5 = (void (**)(void))a4;
  pthread_once(&_dataOwnerKeyOnce, (void (*)(void))_createDataOwnerKey);
  v6 = pthread_getspecific(_dataOwnerKey);
  pthread_setspecific(_dataOwnerKey, (const void *)a3);
  v5[2](v5);

  pthread_key_t v7 = _dataOwnerKey;
  pthread_setspecific(v7, v6);
}

+ (void)_performAsDataOwnerForAction:(SEL)a3 responder:(id)a4 block:(id)a5
{
  id v11 = a4;
  pthread_key_t v7 = (void (**)(void))a5;
  v8 = [MEMORY[0x1E4FB3418] variantForSelector:a3];

  if (v8)
  {
    uint64_t v9 = [v11 _dataOwnerForPaste];
  }
  else
  {
    if (sel_copy_ != a3 && sel_cut_ != a3)
    {
      v7[2](v7);
      goto LABEL_10;
    }
    uint64_t v9 = [v11 _dataOwnerForCopy];
  }
  +[UIPasteboard _performAsDataOwner:v9 block:v7];
LABEL_10:
}

- (void)_requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2, self, @"UIPasteboard.m", 325, @"-_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock: was called on UIPasteboard, when it should be called on _UIConcretePasteboard" object file lineNumber description];
}

@end