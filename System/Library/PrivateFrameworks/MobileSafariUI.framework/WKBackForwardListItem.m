@interface WKBackForwardListItem
- (id)safari_urlForDisplay;
- (uint64_t)safari_bookmarkID;
- (uint64_t)safari_navigationSnapshotRequiresBars;
- (void)safari_setBookmarkID:(void *)a1;
- (void)safari_setNavigationSnapshotRequiresBars:(void *)a1;
@end

@implementation WKBackForwardListItem

- (uint64_t)safari_bookmarkID
{
  if (!a1) {
    return 0;
  }
  v1 = objc_getAssociatedObject(a1, (const void *)bookmarkIDKey);
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (void)safari_setBookmarkID:(void *)a1
{
  if (a1)
  {
    v3 = (const void *)bookmarkIDKey;
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
    objc_setAssociatedObject(a1, v3, v4, (void *)1);
  }
}

- (uint64_t)safari_navigationSnapshotRequiresBars
{
  if (!a1) {
    return 0;
  }
  v1 = objc_getAssociatedObject(a1, (const void *)navigationSnapshotRequiresBarsKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)safari_setNavigationSnapshotRequiresBars:(void *)a1
{
  if (a1)
  {
    v3 = (const void *)navigationSnapshotRequiresBarsKey;
    id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    objc_setAssociatedObject(a1, v3, v4, (void *)3);
  }
}

- (id)safari_urlForDisplay
{
  if (a1)
  {
    uint64_t v2 = [a1 URL];
    if ([v2 isFileURL])
    {
      v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      id v4 = [v3 bookmarkWithID:-[WKBackForwardListItem safari_bookmarkID](a1)];

      if ([v4 isReadingListItem])
      {
        v5 = [v4 nextPageURLs];
        v6 = [v2 resourceSpecifier];
        v7 = [v5 allKeysForObject:v6];

        if ([v7 count]) {
          [v7 firstObject];
        }
        else {
        v8 = [v4 address];
        }
        uint64_t v9 = objc_msgSend(v8, "safari_bestURLForUserTypedString");

        uint64_t v2 = (void *)v9;
      }
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

@end