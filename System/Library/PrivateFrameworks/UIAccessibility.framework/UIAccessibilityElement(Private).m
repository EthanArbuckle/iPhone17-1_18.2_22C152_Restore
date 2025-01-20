@interface UIAccessibilityElement(Private)
- (double)bounds;
- (id)accessibilityDelegate;
- (uint64_t)_accessibilityViewIsVisible;
- (void)delegateSpecificsForAttribute:()Private delegate:selector:;
- (void)setAccessibilityDelegate:()Private;
- (void)setBounds:()Private;
- (void)setDelegate:()Private forAttribute:withSelector:;
@end

@implementation UIAccessibilityElement(Private)

- (id)accessibilityDelegate
{
  v1 = objc_getAssociatedObject(a1, &AXDelegateKey);
  v2 = [v1 delegate];

  return v2;
}

- (void)setAccessibilityDelegate:()Private
{
  id v4 = a3;
  value = objc_alloc_init(UIAccessibilityElementWeakDelegateContainer);
  [(UIAccessibilityElementWeakDelegateContainer *)value setDelegate:v4];

  objc_setAssociatedObject(a1, &AXDelegateKey, value, (void *)1);
}

- (uint64_t)_accessibilityViewIsVisible
{
  v1 = [a1 _accessibilityParentView];
  uint64_t v2 = [v1 _accessibilityViewIsVisible];

  return v2;
}

- (void)setDelegate:()Private forAttribute:withSelector:
{
  id v8 = a3;
  id v13 = [a1 _accessibilityValueForKey:@"UIAXDelegateSpecific"];
  if (!v13)
  {
    id v13 = (id)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:");
  }
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  v10 = NSStringFromSelector(a5);
  v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v8, @"UIAXDelegate", v10, @"selector", 0);

  v12 = [NSNumber numberWithLong:a4];
  [v13 setObject:v11 forKey:v12];
}

- (void)delegateSpecificsForAttribute:()Private delegate:selector:
{
  id v11 = [a1 _accessibilityValueForKey:@"UIAXDelegateSpecific"];
  if (v11)
  {
    id v8 = [NSNumber numberWithLong:a3];
    v9 = [v11 objectForKey:v8];

    *a4 = [v9 objectForKey:@"UIAXDelegate"];
    v10 = [v9 objectForKey:@"selector"];
    *a5 = NSSelectorFromString(v10);
  }
}

- (void)setBounds:()Private
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetValue:v2 forKey:@"AXElementBounds" storageMode:0];
}

- (double)bounds
{
  v1 = [a1 _accessibilityValueForKey:@"AXElementBounds"];
  id v2 = v1;
  if (v1)
  {
    [v1 rectValue];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
  }

  return v4;
}

@end