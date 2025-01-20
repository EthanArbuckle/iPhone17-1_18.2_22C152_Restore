@interface UIButtonBar
@end

@implementation UIButtonBar

void __38___UIButtonBar__updateEffectiveLayout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = a2;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5[8];
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    }
  }
  v8 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v6];
  if (!v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v6;
    if (v9)
    {
      v8 = [[_UIButtonBarItemGroupLayout alloc] initWithLayoutMetrics:*(void *)(v9 + 56) barButtonItemGroup:v10];
      [(_UIButtonBarItemGroupLayout *)v8 setUseGroupSizing:*(unsigned __int8 *)(v9 + 128)];
      objc_initWeak(&location, (id)v9);
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __32___UIButtonBar__newGroupLayout___block_invoke;
      v20 = &unk_1E52DD9E0;
      objc_copyWeak(&v21, &location);
      [(_UIButtonBarItemGroupLayout *)v8 setItemViewGenerator:&v17];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      v8 = 0;
    }
  }
  -[_UIButtonBarItemGroupLayout setFixed:](v8, "setFixed:", a3, v17, v18, v19, v20);
  [(_UIButtonBarItemGroupLayout *)v8 setSuppressSpacing:*(unsigned __int8 *)(a1 + 64)];
  [(_UIButtonBarItemGroupLayout *)v8 setSuppressCustomSpacing:*(unsigned __int8 *)(*(void *)(a1 + 32) + 129)];
  [(_UIButtonBarItemGroupLayout *)v8 setLeadingSpacerType:0];
  [*(id *)(a1 + 40) setObject:v8 forKey:v6];
  [*(id *)(a1 + 48) addObject:v8];
  if ([v6 _isCritical])
  {
    if (!v6 || (uint64_t v11 = *((void *)v6 + 6), v11 != 1) && (v11 || (*((unsigned char *)v6 + 24) & 1) == 0))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      if (!*(unsigned char *)(v12 + 24))
      {
        *(unsigned char *)(v12 + 24) = 1;
        [(_UIButtonBarItemGroupLayout *)v8 setCritical:1];
        goto LABEL_19;
      }
      if (!os_variant_has_internal_diagnostics())
      {
        v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F118) + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Only one critical group allowed per button bar", (uint8_t *)&v17, 2u);
          if (a3) {
            goto LABEL_24;
          }
          goto LABEL_20;
        }
LABEL_19:
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v17) = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Only one critical group allowed per button bar", (uint8_t *)&v17, 2u);
      }

      if ((a3 & 1) == 0)
      {
LABEL_20:
        if (os_variant_has_internal_diagnostics())
        {
          v16 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v17) = 0;
            _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "critical group should have been marked as fixed already", (uint8_t *)&v17, 2u);
          }
        }
        else
        {
          v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F120) + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "critical group should have been marked as fixed already", (uint8_t *)&v17, 2u);
          }
        }
        [(_UIButtonBarItemGroupLayout *)v8 setFixed:1];
      }
    }
  }
LABEL_24:
}

void __35___UIButtonBar_trailingVisibleItem__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __34___UIButtonBar_leadingVisibleItem__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __34___UIButtonBar_needsLeadingSpacer__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __35___UIButtonBar_needsTrailingSpacer__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

id __32___UIButtonBar__newGroupLayout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v8 = [WeakRetained _updatedViewForBarButtonItem:v6 withView:v5];

  return v8;
}

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *a4 = result;
  return result;
}

uint64_t __33___UIButtonBar_hasVisibleContent__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void __39___UIButtonBar_hasAlwaysOverflowGroups__block_invoke(uint64_t a1, void *a2)
{
  v4 = a2;
  char v3 = [v4 isHidden];
  if (v4 && (v3 & 1) == 0 && (v4[24] & 8) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void __39___UIButtonBar_elementsForOverflowMenu__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = [v5 isHidden];
  v4 = v5;
  if (v5 && (v3 & 1) == 0 && (v5[24] & 8) != 0)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

void __35___UIButtonBar_itemAtPoint_inView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v6 = [v7 view];
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

BOOL __46___UIButtonBar__forwardEnumerateVisibleItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup enumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

BOOL __46___UIButtonBar__reverseEnumerateVisibleItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = -[UIBarButtonItemGroup reverseEnumerateVisibleItems:](a2, *(void **)(a1 + 32));
  *a4 = result;
  return result;
}

void __36___UIButtonBar_trailingClippingItem__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    *a3 = 1;
  }
  else {
    *(unsigned char *)(v6 + 24) = 1;
  }
}

uint64_t __36___UIButtonBar__enumerateAllGroups___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end