@interface CRLAccessibilitySummaryContainerElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (CRLAccessibilitySummaryContainerElement)initWithAccessibilityContainer:(id)a3 containedElements:(id)a4;
- (NSArray)containedElements;
- (id)accessibilityElements;
- (id)accessibilityLabel;
@end

@implementation CRLAccessibilitySummaryContainerElement

- (CRLAccessibilitySummaryContainerElement)initWithAccessibilityContainer:(id)a3 containedElements:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLAccessibilitySummaryContainerElement;
  v7 = [(CRLAccessibilitySummaryContainerElement *)&v20 initWithAccessibilityContainer:a3];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    containedElements = v7->_containedElements;
    v7->_containedElements = v8;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = v7->_containedElements;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) setIsAccessibilityElement:0 v16];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v5 = [(CRLAccessibilitySummaryContainerElement *)self containedElements];
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    CGFloat v36 = CGRectZero.origin.y;
    CGFloat v34 = CGRectZero.size.height;
    CGFloat v35 = CGRectZero.size.width;
    CGFloat v9 = height;
    CGFloat v10 = width;
    CGFloat v11 = y;
    CGFloat x = CGRectNull.origin.x;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (CRLAccessibilityShouldPerformValidationChecks())
        {
          [v14 accessibilityFrame];
          v46.origin.CGFloat y = v36;
          v46.origin.CGFloat x = CGRectZero.origin.x;
          v46.size.CGFloat height = v34;
          v46.size.CGFloat width = v35;
          if (CGRectEqualToRect(v42, v46))
          {
            int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Found CGRectZero AX frame for contained element, this is probably a bug", v16, v17, v18, v19, v20, *(uint64_t *)&v34))abort(); {
          }
            }
        }
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = v11;
        v43.size.CGFloat width = v10;
        v43.size.CGFloat height = v9;
        v47.origin.CGFloat x = CGRectNull.origin.x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        BOOL v21 = CGRectEqualToRect(v43, v47);
        [v14 accessibilityFrame];
        CGFloat v26 = v22;
        double v27 = v23;
        double v28 = v24;
        double v29 = v25;
        if (!v21)
        {
          v44.origin.CGFloat x = x;
          v44.origin.CGFloat y = v11;
          v44.size.CGFloat width = v10;
          v44.size.CGFloat height = v9;
          *(CGRect *)&CGFloat v22 = CGRectUnion(v44, *(CGRect *)&v26);
        }
        CGFloat x = v22;
        CGFloat v11 = v23;
        CGFloat v10 = v24;
        CGFloat v9 = v25;
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }
  else
  {
    CGFloat v9 = height;
    CGFloat v10 = width;
    CGFloat v11 = y;
    CGFloat x = CGRectNull.origin.x;
  }

  double v30 = x;
  double v31 = v11;
  double v32 = v10;
  double v33 = v9;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (id)accessibilityLabel
{
  v3 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(CRLAccessibilitySummaryContainerElement *)self containedElements];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) accessibilityLabel];
        [v3 crlaxAddObjectIfNotNil:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v17 = __CRLAccessibilityStringForArraysAndVariables(v3, v10, v11, v12, v13, v14, v15, v16, @"__CRLAccessibilityStringForArraysAndVariablesSentinel");

  return v17;
}

- (NSArray)containedElements
{
  return self->_containedElements;
}

- (void).cxx_destruct
{
}

@end