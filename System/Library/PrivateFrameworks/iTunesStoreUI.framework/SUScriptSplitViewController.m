@interface SUScriptSplitViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)usesSharedPlaceholder;
- (NSNumber)splitShadowOpacity;
- (NSNumber)splitShadowRadius;
- (NSString)splitType;
- (NSString)title;
- (SUScriptViewController)firstViewController;
- (SUScriptViewController)secondViewController;
- (id)_className;
- (id)_splitViewController;
- (id)minimumPaneSize;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (id)splitPosition;
- (id)splitShadowColor;
- (void)setFirstViewController:(id)a3;
- (void)setMinimumPaneSize:(id)a3;
- (void)setSecondViewController:(id)a3;
- (void)setSplitPosition:(id)a3;
- (void)setSplitShadowColor:(id)a3;
- (void)setSplitShadowOpacity:(id)a3;
- (void)setSplitShadowRadius:(id)a3;
- (void)setSplitType:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsesSharedPlaceholder:(BOOL)a3;
@end

@implementation SUScriptSplitViewController

- (id)newNativeViewController
{
  v3 = objc_alloc_init(SUSplitViewController);
  [(SUViewController *)v3 setClientInterface:[(SUScriptObject *)self clientInterface]];
  return v3;
}

- (id)_className
{
  return @"iTunesSplitViewController";
}

- (SUScriptViewController)firstViewController
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __50__SUScriptSplitViewController_firstViewController__block_invoke;
  v10 = &unk_264812E48;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __50__SUScriptSplitViewController_firstViewController__block_invoke, &unk_264812E48, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __50__SUScriptSplitViewController_firstViewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "firstViewController"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)minimumPaneSize
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __46__SUScriptSplitViewController_minimumPaneSize__block_invoke, &unk_264812E48, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __46__SUScriptSplitViewController_minimumPaneSize__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "minimumPaneSize");
  double v3 = v2;
  id v4 = [NSString alloc];
  if (v3 > 0.00000011920929 && v3 < 1.0) {
    uint64_t result = objc_msgSend(v4, "initWithFormat:", @"%.0f%%", floor(v3 * 100.0));
  }
  else {
    uint64_t result = objc_msgSend(v4, "initWithFormat:", @"%.0fpx", *(void *)&v3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptViewController)secondViewController
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__17;
  v17 = __Block_byref_object_dispose__17;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __51__SUScriptSplitViewController_secondViewController__block_invoke;
  uint64_t v10 = &unk_264812E48;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __51__SUScriptSplitViewController_secondViewController__block_invoke, &unk_264812E48, v11, &v13), (double v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __51__SUScriptSplitViewController_secondViewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "secondViewController"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setFirstViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __54__SUScriptSplitViewController_setFirstViewController___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = [*(id *)(a1 + 40) nativeViewController];

  return [v2 setFirstViewController:v3];
}

- (void)setMinimumPaneSize:(id)a3
{
  if (+[SUSplitViewController isValidSplitPositionValue:](SUSplitViewController, "isValidSplitPositionValue:"))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __50__SUScriptSplitViewController_setMinimumPaneSize___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = *(void **)(a1 + 40);
  if (isKindOfClass) {
    goto LABEL_4;
  }
  if ([v4 hasSuffix:@"px"])
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", objc_msgSend(*(id *)(a1 + 40), "length") - 2);
LABEL_4:
    [v4 floatValue];
    goto LABEL_5;
  }
  uint64_t result = [*(id *)(a1 + 40) hasSuffix:@"%"];
  if (!result) {
    return result;
  }
  float v5 = (float)(int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", objc_msgSend(*(id *)(a1 + 40), "length") - 1), "intValue")/ 100.0;
LABEL_5:
  double v6 = v5;

  return [v2 setMinimumPaneSize:v6];
}

- (void)setSecondViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __55__SUScriptSplitViewController_setSecondViewController___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = [*(id *)(a1 + 40) nativeViewController];

  return [v2 setSecondViewController:v3];
}

- (void)setSplitPosition:(id)a3
{
  if (+[SUSplitViewController isValidSplitPositionValue:](SUSplitViewController, "isValidSplitPositionValue:"))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __48__SUScriptSplitViewController_setSplitPosition___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setSplitPositionAndLayoutTypeFromValue:v3];
}

- (void)setSplitShadowColor:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SUScriptColor alloc] initWithStyleString:a3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v4 = (SUScriptColor *)a3;
  }
  float v5 = v4;
  if (v4)
  {
    WebThreadRunOnMainThread();

    return;
  }
LABEL_10:
  double v6 = (void *)MEMORY[0x263F1FA90];

  [v6 throwException:@"Invalid argument"];
}

void __51__SUScriptSplitViewController_setSplitShadowColor___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  id v3 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  objc_msgSend(v3, "setColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
  [v2 setSplitShadow:v3];
}

- (void)setSplitShadowOpacity:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

void __53__SUScriptSplitViewController_setSplitShadowOpacity___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  id v4 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  [*(id *)(a1 + 40) floatValue];
  [v4 setOpacity:v3];
  [v2 setSplitShadow:v4];
}

- (void)setSplitShadowRadius:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    float v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

void __52__SUScriptSplitViewController_setSplitShadowRadius___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  id v4 = (id)objc_msgSend((id)objc_msgSend(v2, "splitShadow"), "copy");
  [*(id *)(a1 + 40) floatValue];
  [v4 setRadius:v3];
  [v2 setSplitShadow:v4];
}

- (void)setSplitType:(id)a3
{
  if (+[SUSplitViewController isValidSplitTypeString:](SUSplitViewController, "isValidSplitTypeString:"))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    float v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __44__SUScriptSplitViewController_setSplitType___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setSplitTypeString:v3];
}

- (void)setTitle:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __40__SUScriptSplitViewController_setTitle___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setMainTitle:v3];
}

- (void)setUsesSharedPlaceholder:(BOOL)a3
{
}

uint64_t __56__SUScriptSplitViewController_setUsesSharedPlaceholder___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _splitViewController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 setUsesSharedPlaceholder:v3];
}

- (id)splitPosition
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __44__SUScriptSplitViewController_splitPosition__block_invoke, &unk_264812E70, self, &v8);
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __44__SUScriptSplitViewController_splitPosition__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitPositionString");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)splitShadowColor
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __47__SUScriptSplitViewController_splitShadowColor__block_invoke, &unk_264812E48, self, &v8);
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __47__SUScriptSplitViewController_splitShadowColor__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow"), "color");
  if (!v2) {
    uint64_t v2 = [MEMORY[0x263F1C550] blackColor];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) initWithUIColor:v2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)splitShadowOpacity
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSNumber *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __49__SUScriptSplitViewController_splitShadowOpacity__block_invoke, &unk_264812E48, self, &v8);
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __49__SUScriptSplitViewController_splitShadowOpacity__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow");
  id v3 = objc_alloc(NSNumber);
  if (v2)
  {
    [v2 opacity];
    *(float *)&double v4 = v4;
  }
  else
  {
    double v4 = 0.0;
  }
  uint64_t result = [v3 initWithFloat:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)splitShadowRadius
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSNumber *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __48__SUScriptSplitViewController_splitShadowRadius__block_invoke, &unk_264812E48, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptSplitViewController_splitShadowRadius__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitShadow");
  id v3 = objc_alloc(NSNumber);
  if (v2)
  {
    [v2 radius];
    *(float *)&double v4 = v4;
  }
  else
  {
    double v4 = 0.0;
  }
  uint64_t result = [v3 initWithFloat:v4];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)splitType
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __40__SUScriptSplitViewController_splitType__block_invoke, &unk_264812E70, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __40__SUScriptSplitViewController_splitType__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "splitTypeString");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)title
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__17;
  v12 = __Block_byref_object_dispose__17;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __36__SUScriptSplitViewController_title__block_invoke, &unk_264812E70, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptSplitViewController_title__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "mainTitle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)usesSharedPlaceholder
{
  uint64_t v4 = 0;
  float v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptSplitViewController_usesSharedPlaceholder__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_splitViewController"), "usesSharedPlaceholder");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_splitViewController
{
  char v2 = [(SUScriptViewController *)self nativeViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_28, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSplitViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSplitViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_28, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_28 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"firstViewController", @"minimumPaneSize", @"minimumPaneSize", @"secondViewController", @"secondViewController", @"splitPosition", @"splitPosition", @"splitShadowColor", @"splitShadowColor", @"splitShadowOpacity", @"splitShadowOpacity", @"splitShadowRadius", @"splitShadowRadius", @"splitType", @"splitType", @"title", @"title",
  }
                        @"usesSharedPlaceholder",
                        @"usesSharedPlaceholder",
                        0);
}

@end