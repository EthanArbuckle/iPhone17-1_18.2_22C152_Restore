@interface CRLTextInteractiveCanvasControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges;
- (BOOL)crlaxEditHyperlinkIfPossible:(id)a3 withRep:(id)a4;
- (BOOL)crlaxHandleDoubleTapAtPoint:(CGPoint)a3;
- (BOOL)crlaxOpenHyperlinkIfPossible:(id)a3 withRep:(id)a4;
- (BOOL)crlaxSupportsHeadingsRotor;
- (CRLWPTextGestureDelegate)crlaxGestureDelegate;
- (NSMutableDictionary)_crlaxRegisteredLinkedTextContainerElements;
- (UIAccessibilityCustomRotor)_crlaxHeadingsRotor;
- (UIAccessibilityCustomRotor)crlaxHyperlinksRotor;
- (UIAccessibilityCustomRotor)crlaxMisspelledWordsRotor;
- (id)_crlaxStoredHeadingsRotor;
- (id)_crlaxStoredHeadingsRotorSearchController;
- (id)_crlaxStoredHyperlinksRotor;
- (id)_crlaxStoredHyperlinksRotorSearchController;
- (id)_crlaxStoredMisspelledWordsRotor;
- (id)_crlaxStoredMisspelledWordsRotorSearchController;
- (id)crlaxCustomRotors;
- (id)crlaxFocusTextRangeFromSearchReference:(id)a3;
- (id)crlaxRepForSearchReference:(id)a3;
- (id)crlaxRotorSearchControllerForRotor:(id)a3;
- (id)crlaxSearchReferenceForSelectionPath:(id)a3;
- (id)crlaxTextRepsForStorage:(id)a3;
- (id)crlaxTextSearchReferenceFromRange:(_NSRange)a3;
- (void)_crlaxSetRegisteredLinkedTextContainerElements:(id)a3;
- (void)_crlaxSetStoredHeadingsRotor:(id)a3;
- (void)_crlaxSetStoredHeadingsRotorSearchController:(id)a3;
- (void)_crlaxSetStoredHyperlinksRotor:(id)a3;
- (void)_crlaxSetStoredHyperlinksRotorSearchController:(id)a3;
- (void)_crlaxSetStoredMisspelledWordsRotor:(id)a3;
- (void)_crlaxSetStoredMisspelledWordsRotorSearchController:(id)a3;
- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4;
- (void)crlaxRegisterLinkedTextElement:(id)a3;
- (void)crlaxUnregisterLinkedTextElement:(id)a3;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation CRLTextInteractiveCanvasControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLInteractiveCanvasController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSMutableDictionary)_crlaxRegisteredLinkedTextContainerElements
{
  return (NSMutableDictionary *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A92EC);
}

- (void)_crlaxSetRegisteredLinkedTextContainerElements:(id)a3
{
}

- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges
{
  id v3 = objc_opt_class();
  v4 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCanvasEditor];
  v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  LOBYTE(v4) = [v5 crlaxCurrentSelectionContainsVisibleTrackedChanges];
  return (char)v4;
}

- (CRLWPTextGestureDelegate)crlaxGestureDelegate
{
  return 0;
}

- (id)crlaxTextRepsForStorage:(id)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1001DFD18;
  v16 = sub_1001DFD28;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001DFD30;
  v9[3] = &unk_1014CEE50;
  v11 = &v12;
  v9[4] = self;
  id v3 = a3;
  id v10 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9)) {
    abort();
  }

  id v4 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  LOBYTE(v12) = 0;
  id v5 = v4;
  uint64_t v6 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v5, 1, &v12);
  if ((_BYTE)v12) {
    abort();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)crlaxRegisterLinkedTextElement:(id)a3
{
  id v4 = a3;
  id v7 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxRegisteredLinkedTextContainerElements];
  if (!v7)
  {
    id v7 = (id)objc_opt_new();
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetRegisteredLinkedTextContainerElements:](self, "_crlaxSetRegisteredLinkedTextContainerElements:");
  }
  id v5 = [[CRLAccessibilityBoxedWeakReference alloc] initWithObject:v4];
  uint64_t v6 = +[NSString stringWithFormat:@"%p", v4];

  [v7 setObject:v5 forKeyedSubscript:v6];
}

- (void)crlaxUnregisterLinkedTextElement:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxRegisteredLinkedTextContainerElements];
  id v5 = +[NSString stringWithFormat:@"%p", v4];

  [v6 setObject:0 forKeyedSubscript:v5];
}

- (BOOL)crlaxOpenHyperlinkIfPossible:(id)a3 withRep:(id)a4
{
  id v5 = [a3 url];
  id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  unsigned __int8 v7 = [v6 openURL:v5];

  return v7;
}

- (BOOL)crlaxEditHyperlinkIfPossible:(id)a3 withRep:(id)a4
{
  return 0;
}

- (void)dealloc
{
  id v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxRegisteredLinkedTextContainerElements];
  [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetRegisteredLinkedTextContainerElements:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 allValues];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) reference];
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___CRLWPRepAccessibilityContainedElement])[v9 crlaxSetParentInteractiveCanvasController:0]; {

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  [(CRLTextInteractiveCanvasControllerAccessibility *)&v10 dealloc];
}

- (void)scrollViewDidScroll:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  [(CRLTextInteractiveCanvasControllerAccessibility *)&v3 scrollViewDidScroll:a3];
}

- (id)_crlaxStoredHeadingsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9570);
}

- (void)_crlaxSetStoredHeadingsRotor:(id)a3
{
}

- (id)_crlaxStoredHeadingsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9571);
}

- (void)_crlaxSetStoredHeadingsRotorSearchController:(id)a3
{
}

- (id)_crlaxStoredMisspelledWordsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9572);
}

- (void)_crlaxSetStoredMisspelledWordsRotor:(id)a3
{
}

- (id)_crlaxStoredMisspelledWordsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9573);
}

- (void)_crlaxSetStoredMisspelledWordsRotorSearchController:(id)a3
{
}

- (id)_crlaxStoredHyperlinksRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9574);
}

- (void)_crlaxSetStoredHyperlinksRotor:(id)a3
{
}

- (id)_crlaxStoredHyperlinksRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1016A9575);
}

- (void)_crlaxSetStoredHyperlinksRotorSearchController:(id)a3
{
}

- (id)crlaxCustomRotors
{
  v12.receiver = self;
  v12.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  if ([(CRLTextInteractiveCanvasControllerAccessibility *)&v12 respondsToSelector:"crlaxCustomRotors"]&& (v11.receiver = self, v11.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility, [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v11 crlaxCustomRotors], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    id v5 = +[NSMutableArray arrayWithArray:v3];
  }
  else
  {
    id v5 = +[NSMutableArray array];
  }
  id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxMisspelledWordsRotor];
  [v5 insertObject:v6 atIndex:0];

  uint64_t v7 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxHyperlinksRotor];
  [v5 insertObject:v7 atIndex:0];

  if ([(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxSupportsHeadingsRotor])
  {
    v8 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxHeadingsRotor];
    [v5 insertObject:v8 atIndex:0];
  }
  id v9 = [v5 copy];

  return v9;
}

- (UIAccessibilityCustomRotor)_crlaxHeadingsRotor
{
  id v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredHeadingsRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"Document headings" value:0 table:0];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10028C0D4;
    v12[3] = &unk_1014E7940;
    objc_copyWeak(&v14, &location);
    id v6 = v5;
    id v13 = v6;
    uint64_t v7 = objc_retainBlock(v12);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredHeadingsRotor:v3];
    v8 = [CRLHeadingRotorSearchController alloc];
    id v9 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    objc_super v10 = [(CRLRotorSearchController *)v8 initWithInteractiveCanvasController:v9];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredHeadingsRotorSearchController:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxMisspelledWordsRotor
{
  id v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredMisspelledWordsRotor];
  if (!v3)
  {
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithSystemType:13 itemSearchBlock:&stru_1014E7980];
    objc_initWeak(&location, v3);
    objc_initWeak(&from, self);
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    objc_super v11 = sub_10028C304;
    objc_super v12 = &unk_1014E79A8;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    id v4 = objc_retainBlock(&v9);
    [v3 setItemSearchBlock:v4, v9, v10, v11, v12];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredMisspelledWordsRotor:v3];
    id v5 = [CRLMisspelledWordRotorSearchController alloc];
    id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    uint64_t v7 = [(CRLRotorSearchController *)v5 initWithInteractiveCanvasController:v6];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredMisspelledWordsRotorSearchController:v7];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxHyperlinksRotor
{
  id v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredHyperlinksRotor];
  if (!v3)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"Links" value:0 table:0];

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10028C540;
    v12[3] = &unk_1014E7940;
    objc_copyWeak(&v14, &location);
    id v6 = v5;
    id v13 = v6;
    uint64_t v7 = objc_retainBlock(v12);
    id v3 = [objc_alloc((Class)UIAccessibilityCustomRotor) initWithName:v6 itemSearchBlock:v7];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredHyperlinksRotor:v3];
    v8 = [CRLHyperlinkRotorSearchController alloc];
    id v9 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    uint64_t v10 = [(CRLRotorSearchController *)v8 initWithInteractiveCanvasController:v9];
    [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxSetStoredHyperlinksRotorSearchController:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 orderedSelections];
  id v6 = [v5 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_class();
    v8 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
    id v9 = [v8 infosForSelectionPath:v4];
    uint64_t v10 = [v9 crl_onlyObject];
    objc_super v11 = sub_1002469D0(v7, v10);

    objc_super v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    objc_super v12 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v14 crlaxSearchReferenceForSelectionPath:v4];
  }

  return v12;
}

- (id)crlaxRotorSearchControllerForRotor:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredHeadingsRotor];

  if (v5 == v4)
  {
    uint64_t v9 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredHeadingsRotorSearchController];
  }
  else
  {
    id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredMisspelledWordsRotor];

    if (v6 == v4)
    {
      uint64_t v9 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredMisspelledWordsRotorSearchController];
    }
    else
    {
      uint64_t v7 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxHyperlinksRotor];
      unsigned int v8 = [v4 isEqual:v7];

      if (v8)
      {
        uint64_t v9 = [(CRLTextInteractiveCanvasControllerAccessibility *)self _crlaxStoredHyperlinksRotorSearchController];
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
        uint64_t v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v12 crlaxRotorSearchControllerForRotor:v4];
      }
    }
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxFocusElementFromSearchReference:v5];
    uint64_t v7 = objc_opt_class();
    unsigned int v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 0, 0);
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 crlaxTextEditor];
      [v10 crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:1];

      id v11 = [v5 range];
      id v13 = [v9 crlaxRepRangeWithStorageRange:v11, v12];
      v15 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v13, v14);
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
      v15 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v19 crlaxFocusTextRangeFromSearchReference:v5];
    }
    v16 = v15;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    v16 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v18 crlaxFocusTextRangeFromSearchReference:v4];
  }

  return v16;
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxTrackedChangesRotor];
  if ([v7 isEqual:v8]) {
    goto LABEL_4;
  }
  uint64_t v9 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxCommentsRotor];
  if ([v7 isEqual:v9])
  {

LABEL_4:
    goto LABEL_5;
  }
  v25 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxHighlightsRotor];
  unsigned __int8 v26 = [v7 isEqual:v25];

  if ((v26 & 1) == 0)
  {
    v27.receiver = self;
    v27.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v27 crlaxAnnounceSearchReference:v6 forRotor:v7];
    goto LABEL_14;
  }
LABEL_5:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    id v11 = objc_opt_class();
    uint64_t v12 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxRepForSearchReference:v10];
    id v13 = __CRLAccessibilityCastAsSafeCategory(v11, (uint64_t)v12, 0, 0);

    if (v13)
    {
      v20 = __CRLAccessibilityStringForVariables(1, &stru_101538650, v14, v15, v16, v17, v18, v19, 0);
      id v21 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v20];
      if ([0 length])
      {
        id v22 = [v20 rangeOfString:0];
        [v21 addAttribute:@"UIAccessibilityTokenLowPitch" value:&__kCFBooleanTrue range:v22, v23];
      }
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v21);
      v24 = [v13 crlaxTextEditor];
      [v24 crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:1];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v28 crlaxAnnounceSearchReference:v6 forRotor:v7];
  }
LABEL_14:
}

- (id)crlaxTextSearchReferenceFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_opt_class();
  id v7 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)self crlaxFocusedRep];
  unsigned int v8 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v7, 0, 0);

  uint64_t v9 = [v8 crlaxStorage];
  id v10 = [v9 crlaxTarget];

  id v11 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  uint64_t v12 = [v11 selectionModelTranslator];
  id v13 = [v12 selectionPathForRange:location length:length onStorage:v10];

  uint64_t v14 = [v13 mostSpecificSelectionOfClass:objc_opt_class()];
  uint64_t v15 = +[CRLWPSearchReference searchReferenceWithStorage:v10 selection:v14 selectionPath:v13];

  return v15;
}

- (BOOL)crlaxSupportsHeadingsRotor
{
  return 0;
}

- (id)crlaxRepForSearchReference:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10028CE44;
  uint64_t v18 = sub_10028CE54;
  id v19 = 0;
  id v5 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v6 = [(CRLTextInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  id v7 = [v4 selectionPath];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10028CE5C;
  v11[3] = &unk_1014E79D0;
  id v13 = &v14;
  id v8 = v5;
  id v12 = v8;
  [v6 withLayoutForSelectionPath:v7 performBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)crlaxHandleDoubleTapAtPoint:(CGPoint)a3
{
  -[CRLTextInteractiveCanvasControllerAccessibility convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:", a3.x, a3.y);

  return -[CRLTextInteractiveCanvasControllerAccessibility handleDoubleTapAtPoint:inputType:](self, "handleDoubleTapAtPoint:inputType:", 1);
}

@end