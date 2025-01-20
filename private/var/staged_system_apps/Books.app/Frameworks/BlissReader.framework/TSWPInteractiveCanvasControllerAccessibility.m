@interface TSWPInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxHyperlinkPopoverIsShown;
- (NSMutableSet)_tsaxRegisteredLinkedTextContainerElements;
- (id)tsaxTextRepsForStorage:(id)a3;
- (void)_tsaxSetRegisteredLinkedTextContainerElements:(id)a3;
- (void)dealloc;
- (void)tsaxRegisterLinkedTextElement:(id)a3;
- (void)tsaxUnregisterLinkedTextElement:(id)a3;
@end

@implementation TSWPInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSMutableSet)_tsaxRegisteredLinkedTextContainerElements
{
  return (NSMutableSet *)__TSAccessibilityGetAssociatedObject(self, &unk_573888);
}

- (void)_tsaxSetRegisteredLinkedTextContainerElements:(id)a3
{
}

- (BOOL)tsaxHyperlinkPopoverIsShown
{
  return [(TSWPInteractiveCanvasControllerAccessibility *)self tsaxBoolValueForKey:@"hyperlinkPopoverIsShown"];
}

- (id)tsaxTextRepsForStorage:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_253668;
  v10 = sub_253678;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_253684;
  v5[3] = &unk_457DA0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  id result = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v3, 1, &v6);
  if ((_BYTE)v6) {
    abort();
  }
  return result;
}

- (void)tsaxRegisterLinkedTextElement:(id)a3
{
  v5 = [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxRegisteredLinkedTextContainerElements];
  if (!v5)
  {
    v5 = (NSMutableSet *)objc_opt_new();
    [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxSetRegisteredLinkedTextContainerElements:v5];
  }
  uint64_t v6 = +[NSValue valueWithNonretainedObject:a3];

  [(NSMutableSet *)v5 addObject:v6];
}

- (void)tsaxUnregisterLinkedTextElement:(id)a3
{
  v5 = [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxRegisteredLinkedTextContainerElements];
  [(NSMutableSet *)v5 removeObject:+[NSValue valueWithNonretainedObject:a3]];
  if (![(NSMutableSet *)v5 count])
  {
    [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxSetRegisteredLinkedTextContainerElements:0];
  }
}

- (void)dealloc
{
  v3 = [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxRegisteredLinkedTextContainerElements];
  [(TSWPInteractiveCanvasControllerAccessibility *)self _tsaxSetRegisteredLinkedTextContainerElements:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) nonretainedObjectValue];
        if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TSWPRepAccessibilityContainedElement])[v8 tsaxSetParentInteractiveCanvasController:0]; {
        v7 = (char *)v7 + 1;
        }
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)TSWPInteractiveCanvasControllerAccessibility;
  [(TSWPInteractiveCanvasControllerAccessibility *)&v9 dealloc];
}

@end