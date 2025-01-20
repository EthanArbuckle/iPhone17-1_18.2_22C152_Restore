@interface WKBackForwardListItem(SafariSharedUIExtras)
- (id)_safari_translationContextSnapshot;
- (id)safari_highlight;
- (void)_safari_setTranslationContextSnapshot:()SafariSharedUIExtras;
- (void)safari_setHighlight:()SafariSharedUIExtras;
@end

@implementation WKBackForwardListItem(SafariSharedUIExtras)

- (id)_safari_translationContextSnapshot
{
  return objc_getAssociatedObject(a1, (const void *)translationContextSnapshotKey);
}

- (void)_safari_setTranslationContextSnapshot:()SafariSharedUIExtras
{
}

- (id)safari_highlight
{
  return objc_getAssociatedObject(a1, (const void *)highlightKey);
}

- (void)safari_setHighlight:()SafariSharedUIExtras
{
}

@end