@interface UIDragItem(SBHIconDragUtilities)
- (id)sbh_appDragLocalContext;
- (void)sbh_setAppDragLocalContext:()SBHIconDragUtilities;
@end

@implementation UIDragItem(SBHIconDragUtilities)

- (id)sbh_appDragLocalContext
{
  v2 = [a1 localObject];
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = v2;
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    v6 = objc_getAssociatedObject(a1, "com.apple.springboard.appDragLocalContext");
    v7 = self;
    char v8 = objc_opt_isKindOfClass();

    if (v8) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }

    if (v5) {
      goto LABEL_11;
    }
  }
  id v5 = +[SBIconView dragContextForDragItem:a1];
  if (v5 && !v2) {
    objc_msgSend(a1, "sbh_setAppDragLocalContext:", v5);
  }
LABEL_11:

  return v5;
}

- (void)sbh_setAppDragLocalContext:()SBHIconDragUtilities
{
  id value = a3;
  [a1 setLocalObject:value];
  objc_setAssociatedObject(a1, "com.apple.springboard.appDragLocalContext", value, (void *)1);
}

@end