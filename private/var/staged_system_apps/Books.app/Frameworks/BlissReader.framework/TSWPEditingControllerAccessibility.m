@interface TSWPEditingControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxShouldSkipSelectionChangedNotification;
- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (TSWPRepAccessibility)tsaxEditingRepWithCaret;
- (TSWPSelectionAccessibility)tsaxSelection;
- (TSWPStorageAccessibility)tsaxStorage;
- (_NSRange)tsaxSelectedTextRange;
- (_NSRange)tsaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3;
- (id)accessibilityValue;
- (id)tsaxHintForTextRep:(id)a3;
- (id)tsaxListItemLabelForLineAtCurrentSelection;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_tsaxAllowNextMenuToBecomeVisible;
- (void)_tsaxDidHideMenu:(id)a3;
- (void)_tsaxSetShouldSkipSelectionChangedNotification:(BOOL)a3;
- (void)assignIntProperty:(int)a3 value:(int)a4 toSelection:(id)a5 forParagraph:(BOOL)a6;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)definitionAction:(id)a3;
- (void)insertText:(id)a3;
- (void)p_addSelectedTextItemsIntoMenu:(id)a3;
- (void)p_didInsertPBAtRange:(_NSRange)a3 hasLabel:(BOOL)a4 shouldTerminateList:(BOOL)a5 newListStyle:(id)a6 newLabelLength:(unint64_t)a7 newListOverridePropertyMap:(id)a8;
- (void)p_updateHUDState;
- (void)paste:(id)a3;
- (void)replaceAction:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4;
- (void)styleAction:(id)a3;
- (void)tsaxEditingRepContentsChanged;
- (void)tsaxHandleEditingRepContentsChanged;
- (void)tsaxHandleSelectionChanged;
- (void)tsaxInsertText:(id)a3;
- (void)tsaxPerformBlockAffectingTextSelection:(id)a3;
- (void)tsaxReplaceRange:(_NSRange)a3 withText:(id)a4;
- (void)tsaxSetSelectedTextRange:(_NSRange)a3;
- (void)tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4;
@end

@implementation TSWPEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPEditingController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxShouldSkipSelectionChangedNotification
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738C8);
}

- (void)_tsaxSetShouldSkipSelectionChangedNotification:(BOOL)a3
{
}

- (TSWPSelectionAccessibility)tsaxSelection
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPEditingControllerAccessibility *)self tsaxValueForKey:@"selection"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (_NSRange)tsaxSelectedTextRange
{
  v2 = [(TSWPEditingControllerAccessibility *)self tsaxSelection];

  id v3 = [(TSWPSelectionAccessibility *)v2 tsaxRange];
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (void)tsaxSetSelectedTextRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_263284;
  v11 = sub_263294;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2632A0;
  v5[3] = &unk_46BCE8;
  v5[4] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  NSUInteger v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  [(TSWPEditingControllerAccessibility *)self setValue:v4 forKey:@"selection"];
}

- (TSWPRepAccessibility)tsaxEditingRepWithCaret
{
  id v3 = [(TSWPEditingControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"insertionPoint"];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v4 = v3;
  char v20 = 0;
  char v5 = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, [(TSWPEditingControllerAccessibility *)self tsaxValueForKey:@"editingReps"], 1, &v20);
  if (v20) {
LABEL_17:
  }
    abort();
  _NSRange v6 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v17;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
      char v20 = 0;
      uint64_t v12 = objc_opt_class();
      Class v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 1, &v20);
      if (v20) {
        goto LABEL_17;
      }
      v14 = (TSWPRepAccessibility *)v13;
      if (v13
        && [(objc_class *)v13 tsaxRespondsToSelector:"tsaxRepRangeContainsLocation:" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPRepAccessibilityExtras]&& [(TSWPRepAccessibility *)v14 tsaxRepRangeContainsLocation:v4])
      {
        return v14;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  }
  while (v8);
  return v14;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  char v5 = 0;
  id v3 = objc_opt_class();
  _NSRange result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPEditingControllerAccessibility *)self tsaxValueForKey:@"storage"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  _NSRange result = (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPEditingControllerAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxHintForTextRep:(id)a3
{
  if ([a3 tsaxShouldIgnoreParentShape]) {
    return 0;
  }
  id v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[a3 tsaxParentRep], 0, 0);
  if ([(objc_class *)v5 tsaxIsIgnored]) {
    return 0;
  }

  return [(objc_class *)v5 tsaxShapeLabel];
}

- (void)tsaxEditingRepContentsChanged
{
  if ([(TSWPEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxHandleEditingRepContentsChanged" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPEditingControllerAccessibilityExtras])
  {
    [(TSWPEditingControllerAccessibility *)self tsaxHandleEditingRepContentsChanged];
  }
}

- (void)tsaxPerformBlockAffectingTextSelection:(id)a3
{
  if ([(TSWPEditingControllerAccessibility *)self _tsaxShouldSkipSelectionChangedNotification])
  {
    Class v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    [(TSWPEditingControllerAccessibility *)self _tsaxSetShouldSkipSelectionChangedNotification:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSWPEditingControllerAccessibility *)self _tsaxSetShouldSkipSelectionChangedNotification:0];
  }
}

- (void)tsaxInsertText:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_26374C;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)tsaxReplaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = [(TSWPStorageAccessibility *)[(TSWPEditingControllerAccessibility *)self tsaxStorage] tsaxRange];
  NSUInteger v10 = v9;
  v19.NSUInteger location = location;
  v19.NSUInteger length = length;
  v22.NSUInteger location = (NSUInteger)v8;
  v22.NSUInteger length = v10;
  if (NSIntersectionRange(v19, v22).length)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_263868;
    v18[3] = &unk_45BF00;
    v18[6] = location;
    v18[7] = length;
    v18[4] = self;
    v18[5] = a4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v18)) {
      goto LABEL_3;
    }
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v20.NSUInteger location = location;
    v20.NSUInteger length = length;
    uint64_t v12 = NSStringFromRange(v20);
    v21.NSUInteger location = (NSUInteger)v8;
    v21.NSUInteger length = v10;
    NSStringFromRange(v21);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Out of bounds range: %@, storage range: %@", v13, v14, v15, v16, v17, (uint64_t)v12))LABEL_3:abort(); {
  }
    }
}

- (_NSRange)tsaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  NSUInteger v9 = &v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_41622E;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_263954;
  v7[3] = &unk_458E98;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
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

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v5 selectionChangedWithFlags:a3 wpFlags:a4];
  if (![(TSWPEditingControllerAccessibility *)self _tsaxShouldSkipSelectionChangedNotification])
  {
    if ([(TSWPEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxHandleSelectionChanged" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPEditingControllerAccessibilityExtras])[(TSWPEditingControllerAccessibility *)self tsaxHandleSelectionChanged]; {
  }
    }
}

- (void)tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = [(TSWPEditingControllerAccessibility *)self tsaxSelectedTextRange];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL
    && location != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)v8 <= location
    && (unint64_t)v8 + v9 >= location + length
    && [(TSWPStorageAccessibility *)[(TSWPEditingControllerAccessibility *)self tsaxStorage] tsaxBoolValueForKey:@"hasSmartFields"])
  {
    uint64_t v19 = 0;
    NSRange v20 = &v19;
    uint64_t v21 = 0x3010000000;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    NSRange v22 = &unk_41622E;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3052000000;
    uint64_t v16 = sub_264088;
    uint64_t v17 = sub_264098;
    uint64_t v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2640A4;
    v12[3] = &unk_46BD10;
    v12[4] = self;
    v12[5] = &v13;
    v12[7] = location;
    v12[8] = length;
    v12[6] = &v19;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v12)) {
      abort();
    }
    uint64_t v10 = v14[5];
    _Block_object_dispose(&v13, 8);
    if (v10) {
      NSUInteger location = v20[4];
    }
    _Block_object_dispose(&v19, 8);
  }
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2640EC;
    v11[3] = &unk_46BBE0;
    v11[4] = self;
    v11[5] = location;
    v11[6] = length;
    [(TSWPEditingControllerAccessibility *)self tsaxPerformBlockAffectingTextSelection:v11];
  }
  else
  {
    -[TSWPEditingControllerAccessibility tsaxSetSelectedTextRange:](self, "tsaxSetSelectedTextRange:", location, length);
  }
}

- (id)tsaxListItemLabelForLineAtCurrentSelection
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = sub_264088;
  uint64_t v15 = sub_264098;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2642E0;
  v6[3] = &unk_46BD38;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  v6[7] = [(TSWPEditingControllerAccessibility *)self tsaxSelectedTextRange];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  if ([(id)v12[5] length])
  {
    if (*((unsigned char *)v8 + 24))
    {
      CFStringRef v17 = @"UIAccessibilityTokenLiteralText";
      CFBooleanRef v18 = kCFBooleanTrue;
      v2 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v3 = objc_alloc((Class)NSAttributedString);
      id v4 = [v3 initWithString:v12[5] attributes:v2];
    }
    else
    {
      id v4 = (id)v12[5];
    }
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)dealloc
{
  [(TSWPEditingControllerAccessibility *)self tsaxAccessibilityUnregister];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerDidHideMenuNotification object:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v3 dealloc];
}

- (void)assignIntProperty:(int)a3 value:(int)a4 toSelection:(id)a5 forParagraph:(BOOL)a6
{
  v20.receiver = self;
  v20.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v20 assignIntProperty:*(void *)&a3 value:*(void *)&a4 toSelection:a5 forParagraph:a6];
  switch(a3)
  {
    case 19:
      CFStringRef v9 = @"bold";
      goto LABEL_7;
    case 22:
      CFStringRef v9 = @"underline";
      goto LABEL_7;
    case 20:
      CFStringRef v9 = @"italic";
LABEL_7:
      char v10 = TSAccessibilityLocalizedString((uint64_t)v9);
      goto LABEL_9;
  }
  char v10 = 0;
LABEL_9:
  if ([(NSString *)v10 length])
  {
    if (a4 == 1) {
      CFStringRef v11 = @"font.attribute.on";
    }
    else {
      CFStringRef v11 = @"font.attribute.off";
    }
    uint64_t v12 = TSAccessibilityLocalizedString((uint64_t)v11);
    uint64_t v19 = __TSAccessibilityStringForVariables(1, v10, v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    TSAccessibilityPostAnnouncementNotification((uint64_t)self, (uint64_t)v19);
  }
}

- (void)cut:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2644F4;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSWPEditingControllerAccessibility *)self tsaxHandleTextOperationAction:@"AXTextOperationActionCut" usingBlock:v3];
}

- (void)copy:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2645AC;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSWPEditingControllerAccessibility *)self tsaxHandleTextOperationAction:@"AXTextOperationActionCopy" usingBlock:v3];
}

- (void)paste:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_264664;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSWPEditingControllerAccessibility *)self tsaxHandleTextOperationAction:@"AXTextOperationActionPaste" usingBlock:v3];
}

- (void)selectAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v5 selectAll:a3];
  UIAccessibilityNotifications v3 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionSelectAll");
  UIAccessibilityPostNotification(v3, UIKitLocalizedString);
}

- (void)insertText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v4 insertText:a3];
  [(TSWPEditingControllerAccessibility *)self tsaxEditingRepContentsChanged];
}

- (void)p_addSelectedTextItemsIntoMenu:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t ShouldPreventActualLookup = TSUIReferenceLibraryViewControllerAccessibilityShouldPreventActualLookup();
    TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(1);
  }
  else
  {
    uint64_t ShouldPreventActualLookup = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v6 p_addSelectedTextItemsIntoMenu:a3];
  if (UIAccessibilityIsVoiceOverRunning()) {
    TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(ShouldPreventActualLookup);
  }
}

- (void)definitionAction:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()
    && (objc_super v5 = [(TSWPEditingControllerAccessibility *)self tsaxStorage],
        (objc_opt_respondsToSelector() & 1) != 0)
    && (id v6 = [(TSWPEditingControllerAccessibility *)self tsaxSelectedTextRange],
        id v8 = -[TSWPStorageAccessibility substringWithRange:](v5, "substringWithRange:", v6, v7),
        uint64_t ShouldPreventActualLookup = TSUIReferenceLibraryViewControllerAccessibilityShouldPreventActualLookup(),
        TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(0),
        LOBYTE(v8) = +[UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:v8], TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(ShouldPreventActualLookup), (v8 & 1) == 0))
  {
    UIAccessibilityNotifications v10 = UIAccessibilityAnnouncementNotification;
    CFStringRef v11 = TSAccessibilityLocalizedString(@"definition.missing");
    UIAccessibilityPostNotification(v10, v11);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TSWPEditingControllerAccessibility;
    [(TSWPEditingControllerAccessibility *)&v12 definitionAction:a3];
  }
}

- (void)styleAction:(id)a3
{
  [(TSWPEditingControllerAccessibility *)self _tsaxAllowNextMenuToBecomeVisible];
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v5 styleAction:a3];
}

- (void)replaceAction:(id)a3
{
  [(TSWPEditingControllerAccessibility *)self _tsaxAllowNextMenuToBecomeVisible];
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v5 replaceAction:a3];
}

- (void)p_updateHUDState
{
  if (UIAccessibilityIsVoiceOverRunning()
    && ([NSClassFromString(@"TSWPEditMenuController") tsaxBoolValueForKey:@"isAnimating"] & 1) == 0)
  {
    id v3 = [NSClassFromString(@"TSWPEditMenuController") tsaxValueForKey:@"sharedEditMenuController"];
    if (![v3 tsaxAllowsMenuVisible]) {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPEditingControllerAccessibility;
  [(TSWPEditingControllerAccessibility *)&v4 p_updateHUDState];
  [v3 tsaxSetAllowsMenuVisible:0];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_tsaxDidHideMenu:" name:UIMenuControllerDidHideMenuNotification object:0];
}

- (void)p_didInsertPBAtRange:(_NSRange)a3 hasLabel:(BOOL)a4 shouldTerminateList:(BOOL)a5 newListStyle:(id)a6 newLabelLength:(unint64_t)a7 newListOverridePropertyMap:(id)a8
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility p_didInsertPBAtRange:hasLabel:shouldTerminateList:newListStyle:newLabelLength:newListOverridePropertyMap:](&v10, "p_didInsertPBAtRange:hasLabel:shouldTerminateList:newListStyle:newLabelLength:newListOverridePropertyMap:", a3.location, a3.length, a4, a5, a6, a7, a8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_264AEC;
  block[3] = &unk_456DE0;
  block[4] = self;
  TSAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
}

- (id)accessibilityValue
{
  return [(TSWPEditingControllerAccessibility *)self tsaxValueForKey:@"unfilteredText"];
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
}

- (void)tsaxHandleEditingRepContentsChanged
{
}

- (void)tsaxHandleSelectionChanged
{
}

- (void)_tsaxDidHideMenu:(id)a3
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:UIMenuControllerDidHideMenuNotification object:0];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_super v4 = [(TSWPEditingControllerAccessibility *)self tsaxSelection];
    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_264C30;
      v5[3] = &unk_456E38;
      v5[4] = v4;
      void v5[5] = self;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
        abort();
      }
    }
  }
}

- (void)_tsaxAllowNextMenuToBecomeVisible
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v2 = [NSClassFromString(@"TSWPEditMenuController") tsaxValueForKey:@"sharedEditMenuController"];
    [v2 tsaxSetAllowsMenuVisible:1];
  }
}

@end