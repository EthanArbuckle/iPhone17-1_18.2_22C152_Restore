@interface SUScriptSegmentedControl
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSArray)rawSegments;
- (NSNumber)noSegmentIndex;
- (NSNumber)selectedIndex;
- (NSNumber)selectedSegmentIndex;
- (NSString)cancelButtonTitle;
- (NSString)moreListTitle;
- (NSString)style;
- (SUScriptSegmentedControl)initWithPageSectionGroup:(id)a3;
- (SUSegmentedControl)activeSegmentedControl;
- (SUSegmentedControl)nativeSegmentedControl;
- (SUStorePageViewController)storePageViewController;
- (double)maximumWidth;
- (id)_className;
- (id)_newNativeSegmentedControl;
- (id)_newPageSectionGroupWithSegments:(id)a3;
- (id)_newSegmentsFromPageSectionGroup:(id)a3;
- (id)makeSegmentWithTitle:(id)a3 userInfo:(id)a4;
- (id)newPageSectionGroup;
- (id)scriptAttributeKeys;
- (id)segments;
- (id)showsMoreListAutomatically;
- (id)tintColor;
- (id)titleColorForControlState:(unint64_t)a3;
- (id)titleShadowColorForControlState:(unint64_t)a3;
- (int64_t)_sectionsStyleForString:(id)a3;
- (int64_t)maximumNumberOfItems;
- (int64_t)nativeSelectedIndex;
- (int64_t)tintStyle;
- (int64_t)tintStyleDark;
- (int64_t)tintStyleDefault;
- (unint64_t)controlStateDisabled;
- (unint64_t)controlStateHighlighted;
- (unint64_t)controlStateNormal;
- (unint64_t)controlStateSelected;
- (void)_reloadSegmentedControl:(id)a3 withSegments:(id)a4;
- (void)_reloadViewControllerPageSectionGroup;
- (void)_setColor:(id)a3 forTitleTextAttribute:(id)a4 controlState:(unint64_t)a5;
- (void)_setRawSegments:(id)a3;
- (void)dealloc;
- (void)hideMoreListAnimated:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setMaximumNumberOfItems:(int64_t)a3;
- (void)setMaximumWidth:(double)a3;
- (void)setMoreListTitle:(id)a3;
- (void)setNativeSegmentedControl:(id)a3;
- (void)setSegments:(id)a3;
- (void)setSelectedIndex:(id)a3;
- (void)setShowsMoreListAutomatically:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setTintStyle:(int64_t)a3;
- (void)setTitleColor:(id)a3 forControlState:(unint64_t)a4;
- (void)setTitleShadowColor:(id)a3 forControlState:(unint64_t)a4;
- (void)showMoreListAnimated:(BOOL)a3;
- (void)showPopoverController:(id)a3 fromSegmentIndex:(int64_t)a4 animated:(BOOL)a5;
@end

@implementation SUScriptSegmentedControl

- (SUScriptSegmentedControl)initWithPageSectionGroup:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUScriptSegmentedControl;
  v4 = [(SUScriptObject *)&v8 init];
  v5 = v4;
  if (v4)
  {
    id v6 = [(SUScriptSegmentedControl *)v4 _newSegmentsFromPageSectionGroup:a3];
    [(SUScriptSegmentedControl *)v5 setSegments:v6];
    -[SUScriptSegmentedControl setSelectedIndex:](v5, "setSelectedIndex:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "defaultSectionIndex")));
    v5->_style = [a3 style];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControl;
  [(SUScriptObject *)&v3 dealloc];
}

- (SUSegmentedControl)nativeSegmentedControl
{
  objc_super v3 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v3 = [(SUScriptSegmentedControl *)self _newNativeSegmentedControl];
    [(SUScriptObject *)self setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v3]];
    v4 = v3;
  }
  return v3;
}

- (int64_t)nativeSelectedIndex
{
  v2 = [(SUScriptSegmentedControl *)self activeSegmentedControl];

  return [(SUSegmentedControl *)v2 selectedItemIndex];
}

- (id)newPageSectionGroup
{
  id v3 = [(SUScriptSegmentedControl *)self segments];

  return [(SUScriptSegmentedControl *)self _newPageSectionGroupWithSegments:v3];
}

- (void)setNativeSegmentedControl:(id)a3
{
  v4 = +[SUScriptNativeObject objectWithNativeObject:a3];

  [(SUScriptObject *)self setNativeObject:v4];
}

- (void)hideMoreListAnimated:(BOOL)a3
{
}

uint64_t __49__SUScriptSegmentedControl_hideMoreListAnimated___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 showMoreList:0 animated:v3];
}

- (id)makeSegmentWithTitle:(id)a3 userInfo:(id)a4
{
  v7 = objc_alloc_init(SUScriptSegmentedControlItem);
  [(SUScriptSegmentedControlItem *)v7 setTitle:a3];
  [(SUScriptSegmentedControlItem *)v7 setUserInfo:a4];
  [(SUScriptObject *)self checkInScriptObject:v7];

  return v7;
}

- (void)setTitleColor:(id)a3 forControlState:(unint64_t)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  uint64_t v7 = *MEMORY[0x263F1C240];

  [(SUScriptSegmentedControl *)self _setColor:a3 forTitleTextAttribute:v7 controlState:a4];
}

- (void)setTitleShadowColor:(id)a3 forControlState:(unint64_t)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  uint64_t v7 = *MEMORY[0x263F1D618];

  [(SUScriptSegmentedControl *)self _setColor:a3 forTitleTextAttribute:v7 controlState:a4];
}

- (void)showMoreListAnimated:(BOOL)a3
{
}

uint64_t __49__SUScriptSegmentedControl_showMoreListAnimated___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 showMoreList:1 animated:v3];
}

- (void)showPopoverController:(id)a3 fromSegmentIndex:(int64_t)a4 animated:(BOOL)a5
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  WebThreadRunOnMainThread();
}

uint64_t __76__SUScriptSegmentedControl_showPopoverController_fromSegmentIndex_animated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) presentablePopoverController];
  if (result)
  {
    uint64_t v3 = (void *)result;
    v4 = (void *)[*(id *)(a1 + 40) activeSegmentedControl];
    objc_msgSend(v3, "setPassthroughViews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0));
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    return [v4 showPopover:v3 fromSegmentIndex:v5 animated:v6];
  }
  return result;
}

- (id)titleColorForControlState:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  objc_super v8 = __Block_byref_object_copy__34;
  v9 = __Block_byref_object_dispose__34;
  uint64_t v10 = 0;
  WebThreadRunOnMainThread();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v3;
}

SUScriptColor *__54__SUScriptSegmentedControl_titleColorForControlState___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "titleTextAttributesForState:", *(void *)(a1 + 48));
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F1C240]];
  objc_opt_class();
  uint64_t result = (SUScriptColor *)objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [[SUScriptColor alloc] initWithUIColor:v3];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)titleShadowColorForControlState:(unint64_t)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  objc_super v8 = __Block_byref_object_copy__34;
  v9 = __Block_byref_object_dispose__34;
  uint64_t v10 = 0;
  WebThreadRunOnMainThread();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v3;
}

SUScriptColor *__60__SUScriptSegmentedControl_titleShadowColorForControlState___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "titleTextAttributesForState:", *(void *)(a1 + 48));
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F1D618]];
  objc_opt_class();
  uint64_t result = (SUScriptColor *)objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = [[SUScriptColor alloc] initWithUIColor:v3];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)cancelButtonTitle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__34;
  objc_super v8 = __Block_byref_object_dispose__34;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __45__SUScriptSegmentedControl_cancelButtonTitle__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "cancelButtonTitle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesSegmentedControl";
}

- (int64_t)maximumNumberOfItems
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __48__SUScriptSegmentedControl_maximumNumberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "maximumNumberOfItems");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)maximumWidth
{
  uint64_t v4 = 0;
  uint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __40__SUScriptSegmentedControl_maximumWidth__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "maximumWidth");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSString)moreListTitle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__34;
  objc_super v8 = __Block_byref_object_dispose__34;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  double v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __41__SUScriptSegmentedControl_moreListTitle__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "moreListTitle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)segments
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__34;
  v12 = __Block_byref_object_dispose__34;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __36__SUScriptSegmentedControl_segments__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptSegmentedControl_segments__block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) storePageViewController];
  id v3 = *(id **)(a1 + 32);
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(v3, "_newSegmentsFromPageSectionGroup:", objc_msgSend(v2, "sectionGroup"));
    uint64_t v4 = *(void **)(a1 + 32);
    return (id)[v4 _setRawSegments:0];
  }
  else
  {
    id result = v3[9];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSNumber)selectedIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  uint64_t v4 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (NSNumber *)objc_msgSend(NSNumber, "numberWithInteger:", v7[3], v4, 3221225472, __41__SUScriptSegmentedControl_selectedIndex__block_invoke, &unk_264812E70, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __41__SUScriptSegmentedControl_selectedIndex__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "selectedItemIndex");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSNumber)selectedSegmentIndex
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  uint64_t v4 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (NSNumber *)objc_msgSend(NSNumber, "numberWithInteger:", v7[3], v4, 3221225472, __48__SUScriptSegmentedControl_selectedSegmentIndex__block_invoke, &unk_264812E70, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __48__SUScriptSegmentedControl_selectedSegmentIndex__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "selectedSegmentIndex");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCancelButtonTitle:(id)a3
{
}

uint64_t __49__SUScriptSegmentedControl_setCancelButtonTitle___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setCancelButtonTitle:v3];
}

- (void)setMaximumNumberOfItems:(int64_t)a3
{
}

uint64_t __52__SUScriptSegmentedControl_setMaximumNumberOfItems___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setMaximumNumberOfItems:v3];
}

- (void)setMaximumWidth:(double)a3
{
}

uint64_t __44__SUScriptSegmentedControl_setMaximumWidth___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  [v2 setMaximumWidth:*(double *)(a1 + 40)];
  [v2 sizeToFitUserInterfaceIdiom];
  uint64_t v3 = (void *)[v2 superview];

  return [v3 setNeedsLayout];
}

- (void)setMoreListTitle:(id)a3
{
}

uint64_t __45__SUScriptSegmentedControl_setMoreListTitle___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setMoreListTitle:v3];
}

- (void)setSegments:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        id v4 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v6 = [v4 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
  if (!v6)
  {
LABEL_8:
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = (void *)v6;
  WebThreadRunOnMainThread();
LABEL_9:
}

uint64_t __40__SUScriptSegmentedControl_setSegments___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRawSegments:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) storePageViewController];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _reloadViewControllerPageSectionGroup];
  }
  else
  {
    uint64_t result = [v3 activeSegmentedControl];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      return [v6 _reloadSegmentedControl:v5 withSegments:v7];
    }
  }
  return result;
}

- (void)setSelectedIndex:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __45__SUScriptSegmentedControl_setSelectedIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return [v2 setSelectedItemIndex:v4];
}

- (void)setShowsMoreListAutomatically:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __58__SUScriptSegmentedControl_setShowsMoreListAutomatically___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = [*(id *)(a1 + 40) BOOLValue];

  return [v2 setShowsMoreListAutomatically:v3];
}

- (void)setStyle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptSegmentedControl_setStyle___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 32) _sectionsStyleForString:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) storePageViewController];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _reloadViewControllerPageSectionGroup];
  }
  else
  {
    uint64_t v5 = (void *)[v3 activeSegmentedControl];
    uint64_t v6 = v5;
    if (*(void *)(*(void *)(a1 + 32) + 80) == 1)
    {
      uint64_t v7 = 7;
    }
    else
    {
      uint64_t result = _UIApplicationUsesLegacyUI();
      if (!result) {
        return result;
      }
      uint64_t v5 = v6;
      uint64_t v7 = 2;
    }
    return [v5 setSegmentedControlStyle:v7];
  }
}

- (void)setTintColor:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [[SUScriptColor alloc] initWithStyleString:a3];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (SUScriptColor *)a3;
LABEL_8:
    uint64_t v5 = v4;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if (!a3)
  {
LABEL_13:
    WebThreadRunOnMainThread();
    goto LABEL_14;
  }
LABEL_11:
  if (v5) {
    goto LABEL_13;
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_14:
}

uint64_t __41__SUScriptSegmentedControl_setTintColor___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = [*(id *)(a1 + 40) nativeColor];

  return [v2 setTintColor:v3];
}

- (void)setTintStyle:(int64_t)a3
{
}

uint64_t __41__SUScriptSegmentedControl_setTintStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setTintStyle:v3];
}

- (id)showsMoreListAutomatically
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    uint64_t v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __54__SUScriptSegmentedControl_showsMoreListAutomatically__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "showsMoreListAutomatically");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)style
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  if (v5[3] == 1) {
    uint64_t v2 = @"body";
  }
  else {
    uint64_t v2 = @"navigation";
  }
  _Block_object_dispose(&v4, 8);
  return &v2->isa;
}

void *__33__SUScriptSegmentedControl_style__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t result = (void *)[*(id *)(a1 + 32) storePageViewController];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(result, "sectionGroup"), "style");
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (id)tintColor
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__34;
  char v8 = __Block_byref_object_dispose__34;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

SUScriptColor *__37__SUScriptSegmentedControl_tintColor__block_invoke(uint64_t a1)
{
  uint64_t result = (SUScriptColor *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "tintColor");
  if (result)
  {
    uint64_t result = [[SUScriptColor alloc] initWithUIColor:result];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (int64_t)tintStyle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __37__SUScriptSegmentedControl_tintStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "activeSegmentedControl"), "tintStyle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)controlStateDisabled
{
  return 2;
}

- (unint64_t)controlStateHighlighted
{
  return 1;
}

- (unint64_t)controlStateNormal
{
  return 0;
}

- (unint64_t)controlStateSelected
{
  return 4;
}

- (NSNumber)noSegmentIndex
{
  return (NSNumber *)[NSNumber numberWithInteger:-1];
}

- (int64_t)tintStyleDark
{
  return 1;
}

- (int64_t)tintStyleDefault
{
  return 0;
}

- (SUSegmentedControl)activeSegmentedControl
{
  uint64_t result = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  if (!result)
  {
    uint64_t result = [(SUStorePageViewController *)[(SUScriptSegmentedControl *)self storePageViewController] sectionSegmentedControl];
    if (!result)
    {
      return [(SUScriptSegmentedControl *)self nativeSegmentedControl];
    }
  }
  return result;
}

- (NSArray)rawSegments
{
  return self->_segments;
}

- (SUStorePageViewController)storePageViewController
{
  int64_t v2 = [(SUScriptNativeObject *)[[(SUScriptObject *)self parentScriptObject] nativeObject] object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)_newNativeSegmentedControl
{
  id v3 = [(SUScriptObject *)self copyObjectForScriptFromPoolWithClass:objc_opt_class()];
  objc_msgSend(v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  [(SUScriptSegmentedControl *)self _reloadSegmentedControl:v3 withSegments:self->_segments];
  return v3;
}

- (id)_newPageSectionGroupWithSegments:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) newPageSection];
        if (!v10)
        {
          v12 = 0;
          goto LABEL_13;
        }
        v11 = (void *)v10;
        [v5 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v12 = objc_alloc_init(SUPageSectionGroup);
  int64_t v13 = [(SUSegmentedControl *)[(SUScriptSegmentedControl *)self activeSegmentedControl] selectedItemIndex];
  if (v13 != -1) {
    [(SUPageSectionGroup *)v12 setDefaultSectionIndex:v13];
  }
  [(SUPageSectionGroup *)v12 setSections:v5];
  [(SUPageSectionGroup *)v12 setStyle:self->_style];
LABEL_13:

  return v12;
}

- (id)_newSegmentsFromPageSectionGroup:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = (void *)[a3 sections];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [[SUScriptSegmentedControlItem alloc] initWithPageSection:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10)
        {
          v11 = v10;
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v4;
}

- (void)_reloadSegmentedControl:(id)a3 withSegments:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a4);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v11 image];
        if (!v12) {
          uint64_t v12 = [v11 title];
        }
        [v6 addObject:v12];
      }
      uint64_t v8 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [a3 setItems:v6];
}

- (void)_reloadViewControllerPageSectionGroup
{
  id v3 = [(SUScriptSegmentedControl *)self storePageViewController];
  if (v3)
  {
    id v4 = v3;
    id v5 = [(SUScriptSegmentedControl *)self _newPageSectionGroupWithSegments:self->_segments];
    [(SUStorePageViewController *)v4 reloadForSectionsWithGroup:v5];
  }
}

- (int64_t)_sectionsStyleForString:(id)a3
{
  return [a3 isEqualToString:@"body"];
}

- (void)_setColor:(id)a3 forTitleTextAttribute:(id)a4 controlState:(unint64_t)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [[SUScriptColor alloc] initWithStyleString:a3];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (SUScriptColor *)a3;
LABEL_5:
    uint64_t v7 = v6;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  if (!a3)
  {
LABEL_10:
    WebThreadRunOnMainThread();
    goto LABEL_11;
  }
LABEL_8:
  if (v7) {
    goto LABEL_10;
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_11:
}

void __73__SUScriptSegmentedControl__setColor_forTitleTextAttribute_controlState___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)[*(id *)(a1 + 32) activeSegmentedControl];
  id v5 = (id)objc_msgSend((id)objc_msgSend(v2, "titleTextAttributesForState:", *(void *)(a1 + 56)), "mutableCopy");
  uint64_t v3 = [*(id *)(a1 + 40) nativeColor];
  if (v3)
  {
    uint64_t v4 = v3;
    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v5 setObject:v4 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    [v5 removeObjectForKey:*(void *)(a1 + 48)];
  }
  [v2 setTitleTextAttributes:v5 forState:*(void *)(a1 + 56)];
}

- (void)_setRawSegments:(id)a3
{
  segments = self->_segments;
  if (segments != a3)
  {
    if (segments)
    {
      -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
      id v6 = self->_segments;
    }
    else
    {
      id v6 = 0;
    }

    uint64_t v7 = (NSArray *)a3;
    self->_segments = v7;
    if (v7)
    {
      [(SUScriptObject *)self checkInScriptObjects:v7];
    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_46, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControl;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_37, 8);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControl;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSegmentedControl;
  int64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_46 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_37 = (uint64_t)sel_hideMoreListAnimated_;
    unk_2681B5230 = @"hideMoreList";
    qword_2681B5238 = (uint64_t)sel_makeSegmentWithTitle_userInfo_;
    unk_2681B5240 = @"createSegment";
    qword_2681B5248 = (uint64_t)sel_setTitleColor_forControlState_;
    unk_2681B5250 = @"setTitleColor";
    qword_2681B5258 = (uint64_t)sel_setTitleShadowColor_forControlState_;
    unk_2681B5260 = @"setTitleShadowColor";
    qword_2681B5268 = (uint64_t)sel_showMoreListAnimated_;
    unk_2681B5270 = @"showMoreList";
    qword_2681B5278 = (uint64_t)sel_showPopoverController_fromSegmentIndex_animated_;
    unk_2681B5280 = @"showPopOver";
    qword_2681B5288 = (uint64_t)sel_titleColorForControlState_;
    unk_2681B5290 = @"getTitleColor";
    qword_2681B5298 = (uint64_t)sel_titleShadowColorForControlState_;
    unk_2681B52A0 = @"getTitleShadowColor";
    __KeyMapping_46 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"cancelButtonTitle", @"maximumNumberOfItems", @"maximumNumberOfItems", @"maximumWidth", @"maximumWidth", @"moreListTitle", @"moreListTitle", @"segments", @"segments", @"selectedIndex", @"selectedIndex", @"selectedSegmentIndex", @"selectedSegmentIndex", @"showsMoreListAutomatically", @"showsMoreListAutomatically", @"style", @"style",
                        @"tintColor",
                        @"tintColor",
                        @"tintStyle",
                        @"tintStyle",
                        @"CONTROL_STATE_DISABLED",
                        @"controlStateDisabled",
                        @"CONTROL_STATE_HIGHLIGHTED",
                        @"controlStateHighlighted",
                        @"CONTROL_STATE_NORMAL",
                        @"controlStateNormal",
                        @"CONTROL_STATE_SELECTED",
                        @"controlStateSelected",
                        @"NO_SEGMENT_INDEX",
                        @"noSegmentIndex",
                        @"TINT_STYLE_DARK",
                        @"tintStyleDark",
                        @"TINT_STYLE_DEFAULT",
                        @"tintStyleDefault",
                        0);
  }
}

@end