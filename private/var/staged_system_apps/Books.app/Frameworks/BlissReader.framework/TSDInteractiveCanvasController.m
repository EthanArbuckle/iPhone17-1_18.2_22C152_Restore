@interface TSDInteractiveCanvasController
- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4;
- (id)avTransportDelegate;
- (id)gestureRecognizerWithKind:(id)a3;
- (id)gestureWithKind:(id)a3;
- (id)scrollableCanvasHost;
- (id)widgetHost;
- (void)disableAllGestures;
- (void)disableGestureKinds:(id)a3;
- (void)disableNormalGestures;
- (void)enableGestureKinds:(id)a3;
- (void)pulseStorage:(id)a3 range:(_NSRange)a4;
@end

@implementation TSDInteractiveCanvasController

- (void)disableAllGestures
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [[[self layerHost] asiOSCVC] view].gestureRecognizers;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setEnabled:0];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)disableNormalGestures
{
  id v3 = [self layerHost].asiOSCVC;
  [v3 view];
  objc_msgSend(objc_msgSend(v3, "knobDragGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend(objc_msgSend(v3, "singleTapGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend(objc_msgSend(v3, "doubleTapGestureRecognizer"), "setEnabled:", 0);
  objc_opt_class();
  [self layerHost].asiOSCVC;
  objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "hyperlinkGestureRecognizer"), "setEnabled:", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(objc_msgSend(v3, "view", 0, 0), "gestureRecognizers");
  uint64_t v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        [(id)TSUDynamicCast() setEnabled:0];
        ++v8;
      }
      while (v6 != v8);
      v6 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)enableGestureKinds:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [[[self layerHost:0] asiOSCVC] view].gestureRecognizers;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        long long v10 = (void *)TSUProtocolCast();
        if (v10)
        {
          if (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "gestureKind"))) {
            [v9 setEnabled:1];
          }
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)disableGestureKinds:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [[[self layerHost:0] asiOSCVC] view].gestureRecognizers;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        long long v10 = (void *)TSUProtocolCast();
        if (v10)
        {
          if (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "gestureKind"))) {
            [v9 setEnabled:0];
          }
        }
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)gestureWithKind:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [[[self layerHost:0, 0] asiOSCVC] view].gestureRecognizers;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v4);
      }
      long long v10 = (void *)TSUProtocolCast();
      if (v10)
      {
        long long v11 = v10;
        if ([v10 gestureKind] == a3) {
          uint64_t v7 = v11;
        }
      }
    }
    id v6 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
  return v7;
}

- (id)gestureRecognizerWithKind:(id)a3
{
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self gestureWithKind:a3];

  return (id)TSUDynamicCast();
}

- (id)widgetHost
{
  [(TSDInteractiveCanvasController *)self delegate];

  return (id)TSUProtocolCast();
}

- (id)avTransportDelegate
{
  [(TSDInteractiveCanvasController *)self delegate];

  return (id)TSUProtocolCast();
}

- (id)scrollableCanvasHost
{
  [(TSDInteractiveCanvasController *)self delegate];

  return (id)TSUProtocolCast();
}

- (void)pulseStorage:(id)a3 range:(_NSRange)a4
{
  id v6 = [objc_alloc((Class)TSWPSearchReference) initWithStorage:a3 selection:[objc_alloc((Class)TSWPSelection) initWithRange:a4.location, a4.length]];
  uint64_t v7 = +[NSArray arrayWithObject:v6];

  id v8 = [objc_alloc((Class)TSURetainedPointerKeyDictionary) initWithObjectsAndKeys:v7, a3, 0];
  id v9 = objc_alloc((Class)NSDictionary);
  id v10 = [v9 initWithObjectsAndKeys:v8, TSKSearchReferencesToHighlightKey, self, @"THStorageReferenceKey", [NSNumber numberWithBool:1], @"THMessageIsForTHWPRep", 0];
  long long v11 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v11 postNotificationName:TSKFindUIStateChangedNotification object:self userInfo:v10];

  [(TSDInteractiveCanvasController *)self layoutInvalidated];
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(@"_accessibilitySpeak:") == a3
      || NSSelectorFromString(@"_accessibilityPauseSpeaking:") == a3;
}

@end