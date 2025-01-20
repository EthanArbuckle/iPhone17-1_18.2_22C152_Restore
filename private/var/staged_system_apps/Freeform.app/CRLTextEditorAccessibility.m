@interface CRLTextEditorAccessibility
+ (BOOL)crlaxCommittingRemoteCommand;
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
+ (void)crlaxSetCommittingRemoteCommand:(BOOL)a3;
- (BOOL)_crlaxIsDictating;
- (BOOL)_crlaxShouldSkipSelectionChangedNotification;
- (BOOL)crlaxCurrentSelectionContainsComment;
- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges;
- (BOOL)crlaxShouldSuppressSpeechForNextSelectionChangedNotification;
- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (CRLTextRepAccessibility)crlaxEditingRepWithCaret;
- (CRLWPSelectionAccessibility)crlaxSelection;
- (CRLWPStorageAccessibility)crlaxStorage;
- (Class)_crlaxWPSelectionClass;
- (NSString)crlaxEditorLabel;
- (_NSRange)crlaxSelectedTextRange;
- (_NSRange)crlaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3;
- (id)_crlaxSelectionWithRange:(_NSRange)a3;
- (id)accessibilityValue;
- (id)crlaxEditingRepWithSelection;
- (unint64_t)crlaxInsertionPoint;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_crlaxSetShouldSkipSelectionChangedNotification:(BOOL)a3;
- (void)copy:(id)a3;
- (void)crlaxEditingRepContentsChanged;
- (void)crlaxHandleEditingRepContentsChanged;
- (void)crlaxHandleSelectionChangedWithFlags:(unint64_t)a3;
- (void)crlaxHandleStorageRangeChanged;
- (void)crlaxInsertText:(id)a3;
- (void)crlaxPerformBlockAffectingTextSelection:(id)a3;
- (void)crlaxSetSelectedTextRange:(_NSRange)a3;
- (void)crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4;
- (void)crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:(BOOL)a3;
- (void)cut:(id)a3;
- (void)deleteBackward:(id)a3;
- (void)deleteForward:(id)a3;
- (void)didBecomeTextInputRespondersEditor;
- (void)insertText:(id)a3;
- (void)p_deleteBackwardsOnEmptyListWithRange:(_NSRange)a3 ignoreLevel:(BOOL)a4;
- (void)paste:(id)a3;
- (void)replace:(id)a3 with:(id)a4;
- (void)replaceAction:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
@end

@implementation CRLTextEditorAccessibility

- (BOOL)crlaxShouldSuppressSpeechForNextSelectionChangedNotification
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A8EFA);
}

- (void)crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:(BOOL)a3
{
}

- (void)crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = [(CRLTextEditorAccessibility *)self crlaxSelectedTextRange];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL
    && location != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)v8 <= location
    && (unint64_t)v8 + v9 >= location + length)
  {
    v10 = [(CRLTextEditorAccessibility *)self crlaxStorage];
    unsigned int v11 = [v10 crlaxBoolValueForKey:@"hasSmartFields"];

    if (v11)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x3010000000;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      v24 = "";
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = sub_100054FC8;
      v19 = sub_100054FD8;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100054FE0;
      v14[3] = &unk_1014CE398;
      v14[4] = self;
      v14[5] = &v15;
      v14[7] = location;
      v14[8] = length;
      v14[6] = &v21;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v14)) {
        abort();
      }
      id v12 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

      if (v12) {
        NSUInteger location = v22[4];
      }

      _Block_object_dispose(&v21, 8);
    }
  }
  if (v4)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055058;
    v13[3] = &unk_1014CD898;
    v13[4] = self;
    v13[5] = location;
    v13[6] = length;
    [(CRLTextEditorAccessibility *)self crlaxPerformBlockAffectingTextSelection:v13];
  }
  else
  {
    -[CRLTextEditorAccessibility crlaxSetSelectedTextRange:](self, "crlaxSetSelectedTextRange:", location, length);
  }
}

- (void)crlaxInsertText:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100055104;
  v4[3] = &unk_1014CBE78;
  v4[4] = self;
  id v3 = a3;
  id v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (void)cut:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000551BC;
  v5[3] = &unk_1014CBE78;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(CRLTextEditorAccessibility *)self crlaxHandleTextOperationAction:@"AXTextOperationActionCut" usingBlock:v5];
}

- (void)copy:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000552A4;
  v5[3] = &unk_1014CBE78;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(CRLTextEditorAccessibility *)self crlaxHandleTextOperationAction:@"AXTextOperationActionCopy" usingBlock:v5];
}

- (void)paste:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005538C;
  v5[3] = &unk_1014CBE78;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(CRLTextEditorAccessibility *)self crlaxHandleTextOperationAction:@"AXTextOperationActionPaste" usingBlock:v5];
}

- (void)selectAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v5 selectAll:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  id v4 = CRLAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionSelectAll");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLTextEditorAccessibility *)self crlaxInteractiveCanvasController];
  [v5 crlaxCancelCollaborationOccurredTimer];

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v6 insertText:v4];

  [(CRLTextEditorAccessibility *)self crlaxEditingRepContentsChanged];
}

- (void)deleteBackward:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLTextEditorAccessibility *)self crlaxInteractiveCanvasController];
  [v5 crlaxCancelCollaborationOccurredTimer];

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v6 deleteBackward:v4];

  [(CRLTextEditorAccessibility *)self crlaxEditingRepContentsChanged];
}

- (void)deleteForward:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLTextEditorAccessibility *)self crlaxInteractiveCanvasController];
  [v5 crlaxCancelCollaborationOccurredTimer];

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v6 deleteForward:v4];

  [(CRLTextEditorAccessibility *)self crlaxEditingRepContentsChanged];
}

- (void)replaceAction:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v3 replaceAction:a3];
}

- (void)didBecomeTextInputRespondersEditor
{
  v2.receiver = self;
  v2.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v2 didBecomeTextInputRespondersEditor];
  UIAccessibilityPostNotification(CRLAccessibilityFirstResponderChangedNotification, 0);
}

- (id)accessibilityValue
{
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  objc_super v3 = [v2 textSource];
  id v4 = [v3 string];

  return v4;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
}

- (void)crlaxHandleEditingRepContentsChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005570C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  CRLAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
}

- (void)crlaxHandleSelectionChangedWithFlags:(unint64_t)a3
{
  if ([(CRLTextEditorAccessibility *)self crlaxShouldSuppressSpeechForNextSelectionChangedNotification])
  {
    CFStringRef v5 = @"AXSelectionChangedRemoteUserOperation";
    objc_super v6 = &__kCFBooleanTrue;
    id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [(CRLTextEditorAccessibility *)self crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:0];
  }
  else
  {
    id v4 = 0;
  }
  UIAccessibilityPostNotification(CRLAccessibilitySelectionChangedNotification, v4);
}

- (void)crlaxHandleStorageRangeChanged
{
}

- (BOOL)_crlaxIsDictating
{
  objc_super v2 = +[UIApplication sharedApplication];
  objc_super v3 = [v2 textInputMode];
  id v4 = [v3 primaryLanguage];

  LOBYTE(v2) = [v4 isEqualToString:@"dictation"];
  return (char)v2;
}

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLWPEditor";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_crlaxShouldSkipSelectionChangedNotification
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A94A0);
}

- (void)_crlaxSetShouldSkipSelectionChangedNotification:(BOOL)a3
{
}

+ (BOOL)crlaxCommittingRemoteCommand
{
  return byte_1016A94A1;
}

+ (void)crlaxSetCommittingRemoteCommand:(BOOL)a3
{
  byte_1016A94A1 = a3;
}

- (CRLWPSelectionAccessibility)crlaxSelection
{
  char v8 = 0;
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  objc_super v3 = [v2 selection];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  objc_super v6 = (void *)v5;

  return (CRLWPSelectionAccessibility *)v6;
}

- (_NSRange)crlaxSelectedTextRange
{
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxSelection];
  id v3 = [v2 crlaxRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)crlaxSetSelectedTextRange:(_NSRange)a3
{
  -[CRLTextEditorAccessibility _crlaxSelectionWithRange:](self, "_crlaxSelectionWithRange:", a3.location, a3.length);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLTextEditorAccessibility *)self setValue:v4 forKey:@"selection"];
}

- (CRLTextRepAccessibility)crlaxEditingRepWithCaret
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  id v4 = [v3 editingReps];

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
      if ([v9 isShowingCaret]) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  unsigned int v11 = [(CRLTextEditorAccessibility *)self crlaxEditingRepWithSelection];
  id v10 = [v11 crlaxTarget];

LABEL_12:
  char v17 = 0;
  id v12 = v10;
  v13 = objc_opt_class();
  uint64_t v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v12, 1, &v17);
  if (v17) {
    abort();
  }
  uint64_t v15 = (void *)v14;

  return (CRLTextRepAccessibility *)v15;
}

- (id)crlaxEditingRepWithSelection
{
  unint64_t v16 = [(CRLTextEditorAccessibility *)self crlaxInsertionPoint];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(CRLTextEditorAccessibility *)self crlaxTarget];
    id v5 = [v4 editingReps];

    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      id v3 = 0;
      uint64_t v8 = *(void *)v19;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        id v10 = v3;
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        char v17 = 0;
        id v12 = v11;
        v13 = objc_opt_class();
        uint64_t v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v12, 1, &v17);
        if (v17) {
          abort();
        }
        id v3 = (void *)v14;

        if (v3)
        {
          if [v3 crlaxRespondsToSelector:"crlaxRepRangeContainsLocation:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLTextRepAccessibilityExtras]&& (objc_msgSend(v3, "crlaxRepRangeContainsLocation:", v16))
          {
            break;
          }
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v7) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (CRLWPStorageAccessibility)crlaxStorage
{
  char v8 = 0;
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  id v3 = [v2 storage];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = (void *)v5;

  return (CRLWPStorageAccessibility *)v6;
}

- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  id v3 = [v2 icc];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = (void *)v5;

  return (CRLTextInteractiveCanvasControllerAccessibility *)v6;
}

- (NSString)crlaxEditorLabel
{
  return 0;
}

- (unint64_t)crlaxInsertionPoint
{
  objc_super v2 = [(CRLTextEditorAccessibility *)self crlaxTarget];
  id v3 = [v2 selection];

  if ([v3 isValid]) {
    unint64_t v4 = (unint64_t)[v3 start];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)crlaxEditingRepContentsChanged
{
  if ([(CRLTextEditorAccessibility *)self crlaxRespondsToSelector:"crlaxHandleEditingRepContentsChanged" fromExtrasProtocol:&OBJC_PROTOCOL___CRLTextEditorAccessibilityExtras])
  {
    [(CRLTextEditorAccessibility *)self crlaxHandleEditingRepContentsChanged];
  }
}

- (void)crlaxPerformBlockAffectingTextSelection:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  if ([(CRLTextEditorAccessibility *)self _crlaxShouldSkipSelectionChangedNotification])
  {
    v4[2]();
  }
  else
  {
    [(CRLTextEditorAccessibility *)self _crlaxSetShouldSkipSelectionChangedNotification:1];
    v4[2]();
    [(CRLTextEditorAccessibility *)self _crlaxSetShouldSkipSelectionChangedNotification:0];
  }
}

- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges
{
  id v3 = [(CRLTextEditorAccessibility *)self crlaxStorage];
  unint64_t v4 = [(CRLTextEditorAccessibility *)self crlaxSelection];
  unsigned __int8 v5 = [v3 crlaxSelectionContainsVisibleTrackedChanges:v4];

  return v5;
}

- (_NSRange)crlaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3010000000;
  unsigned int v11 = "";
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024D994;
  v7[3] = &unk_1014CC6B8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  NSUInteger v3 = v9[4];
  NSUInteger v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (void)replace:(id)a3 with:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLTextEditorAccessibility;
  [(CRLTextEditorAccessibility *)&v5 replace:a3 with:a4];
  [(CRLTextEditorAccessibility *)self crlaxEditingRepContentsChanged];
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility selectionDidChangeFromSelection:toSelection:withFlags:](&v16, "selectionDidChangeFromSelection:toSelection:withFlags:", a3, a4);
  if (![(CRLTextEditorAccessibility *)self _crlaxShouldSkipSelectionChangedNotification])
  {
    id v7 = [(CRLTextEditorAccessibility *)self crlaxEditingRepWithCaret];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 crlaxStorage];
      uint64_t v10 = [(CRLTextEditorAccessibility *)self crlaxStorage];

      if (v9 == v10)
      {
        unsigned int v11 = [CRLRepAccessibilitySelectionRangeCache alloc];
        id v12 = [(CRLTextEditorAccessibility *)self crlaxSelectedTextRange];
        uint64_t v14 = -[CRLRepAccessibilitySelectionRangeCache initWithRep:selectedRangeInStorage:](v11, "initWithRep:selectedRangeInStorage:", v8, v12, v13);
        uint64_t v15 = [(CRLTextEditorAccessibility *)self crlaxEditingRepWithCaret];
        [v15 crlaxSetLastSelection:v14];
      }
    }
    if ([(CRLTextEditorAccessibility *)self crlaxRespondsToSelector:"crlaxHandleSelectionChangedWithFlags:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLTextEditorAccessibilityExtras])[(CRLTextEditorAccessibility *)self crlaxHandleSelectionChangedWithFlags:a5]; {
  }
    }
}

- (void)p_deleteBackwardsOnEmptyListWithRange:(_NSRange)a3 ignoreLevel:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:](&v4, "p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:", a3.location, a3.length, a4);
}

- (Class)_crlaxWPSelectionClass
{
  uint64_t v5 = 0;
  NSUInteger v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10024DC54;
  v4[3] = &unk_1014CB090;
  v4[4] = self;
  void v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  id v2 = (id)v6[3];
  _Block_object_dispose(&v5, 8);

  return (Class)v2;
}

- (id)_crlaxSelectionWithRange:(_NSRange)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10024DDDC;
  uint64_t v15 = sub_10024DDEC;
  id v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10024DDF4;
  v9[3] = &unk_1014D3490;
  v9[4] = self;
  v9[5] = &v11;
  _NSRange v10 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v9)) {
    abort();
  }
  id v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  LOBYTE(v11) = 0;
  id v4 = v3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v11);
  if ((_BYTE)v11) {
    abort();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (BOOL)crlaxCurrentSelectionContainsComment
{
  return self->_crlaxCurrentSelectionContainsComment;
}

@end