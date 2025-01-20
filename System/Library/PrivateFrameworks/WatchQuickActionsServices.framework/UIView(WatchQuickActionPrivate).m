@interface UIView(WatchQuickActionPrivate)
- (void)_wqa_actuallyClearAndUnregisterQuickAction:()WatchQuickActionPrivate;
- (void)_wqa_registerQuickActionForBoundingPathChanges:()WatchQuickActionPrivate;
- (void)_wqa_unregisterExistingQuickActionForBoundingPathChanges;
@end

@implementation UIView(WatchQuickActionPrivate)

- (void)_wqa_registerQuickActionForBoundingPathChanges:()WatchQuickActionPrivate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier);
  v6 = v5;
  if (v5)
  {
    if ([v5 isEqual:v4]) {
      goto LABEL_10;
    }
    v7 = wqa_services_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_239BF6000, v7, OS_LOG_TYPE_INFO, "unregistering existing path change observer %@ from view: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(a1, "_wqa_actuallyClearAndUnregisterQuickAction:", v6);
  }
  if (v4)
  {
    v8 = wqa_services_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      v12 = a1;
      _os_log_impl(&dword_239BF6000, v8, OS_LOG_TYPE_INFO, "registering path change observer %@ from view: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_setAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier, v4, (void *)1);
    [a1 _addBoundingPathChangeObserver:v4];
  }
LABEL_10:
}

- (void)_wqa_unregisterExistingQuickActionForBoundingPathChanges
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = objc_getAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier);
  if (v2)
  {
    v3 = wqa_services_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412546;
      v5 = v2;
      __int16 v6 = 2112;
      v7 = a1;
      _os_log_impl(&dword_239BF6000, v3, OS_LOG_TYPE_INFO, "unregistering path change observer %@ from view: %@", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(a1, "_wqa_actuallyClearAndUnregisterQuickAction:", v2);
  }
}

- (void)_wqa_actuallyClearAndUnregisterQuickAction:()WatchQuickActionPrivate
{
  objc_msgSend(a1, "_removeBoundingPathChangeObserver:");

  objc_setAssociatedObject(a1, &WQARegisteredQuickActionForBoundingPathChangesIdentifier, 0, (void *)1);
}

@end