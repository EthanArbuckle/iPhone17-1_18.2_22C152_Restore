@interface UIAccessibilityHierarchyEncoder
- (BOOL)shouldResolveRemoteElements;
- (CGRect)_convertAccessibilityFrameOfElement:(id)a3 toViewSpaceOfContainer:(id)a4 remoteParent:(id)a5;
- (UIAccessibilityElementTraversalOptions)traversalOptions;
- (UIAccessibilityHierarchyEncoder)initWithRootElement:(id)a3 traversalOptions:(id)a4;
- (id)encodeWithError:(id *)a3;
- (id)encodeWithLeafElements:(id)a3 error:(id *)a4;
- (id)rootElement;
- (void)_resolveLeafElementsForRemoteElement:(id)a3 rootElement:(id)a4 addingToLeafElementDescriptions:(id)a5;
- (void)setRootElement:(id)a3;
- (void)setShouldResolveRemoteElements:(BOOL)a3;
- (void)setTraversalOptions:(id)a3;
@end

@implementation UIAccessibilityHierarchyEncoder

- (UIAccessibilityHierarchyEncoder)initWithRootElement:(id)a3 traversalOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityHierarchyEncoder;
  v8 = [(UIAccessibilityHierarchyEncoder *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(UIAccessibilityHierarchyEncoder *)v8 setRootElement:v6];
    if (v7)
    {
      [(UIAccessibilityHierarchyEncoder *)v9 setTraversalOptions:v7];
    }
    else
    {
      v10 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
      [(UIAccessibilityHierarchyEncoder *)v9 setTraversalOptions:v10];
    }
    [(UIAccessibilityHierarchyEncoder *)v9 setShouldResolveRemoteElements:1];
  }

  return v9;
}

- (id)encodeWithError:(id *)a3
{
  v5 = [(UIAccessibilityHierarchyEncoder *)self rootElement];
  id v6 = [(UIAccessibilityHierarchyEncoder *)self traversalOptions];
  id v7 = [v5 _accessibilityLeafDescendantsWithOptions:v6];

  v8 = [(UIAccessibilityHierarchyEncoder *)self encodeWithLeafElements:v7 error:a3];

  return v8;
}

- (id)encodeWithLeafElements:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(UIAccessibilityHierarchyDescription);
  id v7 = [(UIAccessibilityHierarchyEncoder *)self rootElement];
  v8 = +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v7, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  v22 = v6;
  [(UIAccessibilityHierarchyDescription *)v6 setRootElement:v8];

  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (![(UIAccessibilityHierarchyEncoder *)self shouldResolveRemoteElements]) {
            continue;
          }
          v16 = [(UIAccessibilityHierarchyEncoder *)self rootElement];
          [(UIAccessibilityHierarchyEncoder *)self _resolveLeafElementsForRemoteElement:v15 rootElement:v16 addingToLeafElementDescriptions:v9];
        }
        else
        {
          v16 = [(UIAccessibilityHierarchyEncoder *)self rootElement];
          [(UIAccessibilityHierarchyEncoder *)self _convertAccessibilityFrameOfElement:v15 toViewSpaceOfContainer:v16 remoteParent:0];
          v17 = +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v15);
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  [(UIAccessibilityHierarchyDescription *)v22 setLeafElements:v9];
  id v24 = 0;
  v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v24];
  id v19 = v24;
  v20 = v19;
  if (a4) {
    *a4 = v19;
  }

  return v18;
}

- (CGRect)_convertAccessibilityFrameOfElement:(id)a3 toViewSpaceOfContainer:(id)a4 remoteParent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v8 accessibilityFrameInContainerSpace], !CGRectIsNull(v49)))
  {
    [v8 accessibilityFrameInContainerSpace];
    double v14 = v32;
    double v16 = v33;
    double v18 = v34;
    double v20 = v35;
  }
  else
  {
    uint64_t v11 = [(UIAccessibilityHierarchyEncoder *)self rootElement];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIAccessibilityHierarchyEncoder *)self rootElement];
    }
    else {
    uint64_t v12 = [v9 _accessibilityParentView];
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 bounds];
      objc_msgSend(v8, "convertRect:toView:", v12);
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [MEMORY[0x1E4F488F8] elementWithUIElement:v8];
        [v21 frame];
        double v14 = v22;
        double v16 = v23;
        double v18 = v24;
        double v20 = v25;
        long long v26 = [v12 window];

        if (v10 && !v26)
        {
          long long v27 = [v10 _accessibilityParentView];
          objc_msgSend(v27, "convertRect:toView:", v12, v14, v16, v18, v20);
          double v14 = v28;
          double v16 = v29;
          double v18 = v30;
          double v20 = v31;
        }
      }
      else
      {
        [v8 accessibilityFrame];
        double v14 = v36;
        double v16 = v37;
        double v18 = v38;
        double v20 = v39;
      }
      v40 = [v12 window];
      v50.origin.x = v14;
      v50.origin.y = v16;
      v50.size.width = v18;
      v50.size.height = v20;
      if (!CGRectIsEmpty(v50) && v12 && v40)
      {
        objc_msgSend(v40, "convertRect:toView:", v12, v14, v16, v18, v20);
        double v14 = v41;
        double v16 = v42;
        double v18 = v43;
        double v20 = v44;
      }
    }
  }

  double v45 = v14;
  double v46 = v16;
  double v47 = v18;
  double v48 = v20;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (void)_resolveLeafElementsForRemoteElement:(id)a3 rootElement:(id)a4 addingToLeafElementDescriptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__UIAccessibilityHierarchyEncoder__resolveLeafElementsForRemoteElement_rootElement_addingToLeafElementDescriptions___block_invoke;
  v15[3] = &unk_1E59B8AF8;
  id v11 = v10;
  id v16 = v11;
  double v17 = self;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  double v20 = &v21;
  [v13 getLeafElementsFromRemoteSide:v15];
  CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D418];
  while (!*((unsigned char *)v22 + 24))
    CFRunLoopRunInMode(v14, 0.1, 1u);

  _Block_object_dispose(&v21, 8);
}

void __116__UIAccessibilityHierarchyEncoder__resolveLeafElementsForRemoteElement_rootElement_addingToLeafElementDescriptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        [*(id *)(a1 + 40) _convertAccessibilityFrameOfElement:v8 toViewSpaceOfContainer:*(void *)(a1 + 48) remoteParent:*(void *)(a1 + 56)];
        id v10 = +[UIAccessibilityElementDescription descriptionWithElement:frameInContainerSpaceOrNil:](UIAccessibilityElementDescription, "descriptionWithElement:frameInContainerSpaceOrNil:", v8);
        [v9 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

- (id)rootElement
{
  return self->_rootElement;
}

- (void)setRootElement:(id)a3
{
}

- (UIAccessibilityElementTraversalOptions)traversalOptions
{
  return self->_traversalOptions;
}

- (void)setTraversalOptions:(id)a3
{
}

- (BOOL)shouldResolveRemoteElements
{
  return self->_shouldResolveRemoteElements;
}

- (void)setShouldResolveRemoteElements:(BOOL)a3
{
  self->_shouldResolveRemoteElements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversalOptions, 0);

  objc_storeStrong(&self->_rootElement, 0);
}

@end