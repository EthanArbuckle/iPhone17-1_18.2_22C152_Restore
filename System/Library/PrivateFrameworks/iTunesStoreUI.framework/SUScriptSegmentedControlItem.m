@interface SUScriptSegmentedControlItem
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (NSString)identifier;
- (NSString)imageURL;
- (NSString)title;
- (SUScriptCanvasContext)canvas;
- (SUScriptSegmentedControlItem)initWithPageSection:(id)a3;
- (UIImage)image;
- (id)_className;
- (id)_segmentedControl;
- (id)newPageSection;
- (id)scriptAttributeKeys;
- (id)userInfo;
- (void)_reloadUserInterface;
- (void)_setImage:(id)a3;
- (void)dealloc;
- (void)setCanvas:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SUScriptSegmentedControlItem

- (SUScriptSegmentedControlItem)initWithPageSection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptSegmentedControlItem;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4)
  {
    v4->_identifier = (NSString *)(id)[a3 identifier];
    v4->_image = (UIImage *)(id)[a3 image];
    v4->_title = (NSString *)(id)[a3 title];
    v4->_userInfo = -[SUScriptURLRequest initWithNativeRequestProperties:]([SUScriptURLRequest alloc], "initWithNativeRequestProperties:", [a3 URLRequestProperties]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlItem;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)newPageSection
{
  objc_super v3 = objc_alloc_init(SUPageSection);
  id v4 = [(SUScriptSegmentedControlItem *)self userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUPageSection *)v3 setStructuredPageType:+[SUStructuredPage pageTypeForStorePageString:v4]];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = (void *)[v4 copyNativeRequestProperties];
      [(SUPageSection *)v3 setURLRequestProperties:v5];
    }
  }
  if ([(SUPageSection *)v3 URLRequestProperties]
    || [(SUPageSection *)v3 structuredPageType] == 8)
  {
    objc_super v6 = [(SUScriptSegmentedControlItem *)self identifier];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    [(SUPageSection *)v3 setIdentifier:v7];
    [(SUPageSection *)v3 setImage:[(SUScriptSegmentedControlItem *)self image]];
    v8 = [(SUScriptSegmentedControlItem *)self title];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    [(SUPageSection *)v3 setTitle:v9];
  }
  else
  {

    return 0;
  }
  return v3;
}

- (SUScriptCanvasContext)canvas
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_canvas;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  v5 = (void *)MEMORY[0x263EFF9D0];

  return (SUScriptCanvasContext *)[v5 null];
}

- (id)_className
{
  return @"iTunesSegmentedControlItem";
}

- (NSString)identifier
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_identifier;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  v5 = (void *)MEMORY[0x263EFF9D0];

  return (NSString *)[v5 null];
}

- (NSString)imageURL
{
  [(SUScriptObject *)self lock];
  objc_super v3 = self->_imageURLString;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  v5 = (void *)MEMORY[0x263EFF9D0];

  return (NSString *)[v5 null];
}

- (void)setCanvas:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), v5 = (SUScriptCanvasContext *)a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    canvas = self->_canvas;
    if (canvas != v5)
    {

      self->_canvas = v5;
    }
    [(SUScriptObject *)self unlock];
    id v8 = [(SUScriptCanvasContext *)v5 copyCanvasImage];
    WebThreadRunOnMainThread();

    return;
  }
  v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

uint64_t __42__SUScriptSegmentedControlItem_setCanvas___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setImage:*(void *)(a1 + 40)];
}

- (void)setIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    identifier = self->_identifier;
    if (identifier != v5)
    {

      self->_identifier = v5;
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  v5 = (NSString *)a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  id v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (void)setImageURL:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (NSString *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_10;
        }
      }
    }
  }
  uint64_t v7 = [objc_alloc(NSURL) initWithString:v5];
  if (v7)
  {
    id v8 = (void *)v7;
    [(SUScriptObject *)self lock];
    imageURLString = self->_imageURLString;
    if (imageURLString != v5)
    {

      self->_imageURLString = v5;
    }
    [(SUScriptObject *)self unlock];
    WebThreadRunOnMainThread();

    return;
  }
LABEL_10:
  v10 = (void *)MEMORY[0x263F1FA90];

  [v10 throwException:@"Invalid argument"];
}

void __44__SUScriptSegmentedControlItem_setImageURL___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) newImageWithURL:*(void *)(a1 + 40)];
  if (v2)
  {
    id v11 = (id)v2;
    [*(id *)(a1 + 32) _setImage:v2];
  }
  else
  {
    objc_super v3 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v5 &= 2u;
    }
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      LODWORD(v10) = 22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v12, v10);
        free(v9);
        SSFileLog();
      }
    }
  }
}

- (void)setTitle:(id)a3
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
    int v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __41__SUScriptSegmentedControlItem_setTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[13];
  if (v3 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(a1 + 32) + 104) = *(id *)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 32);
  }

  return [v2 _reloadUserInterface];
}

- (void)setUserInfo:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  [(SUScriptObject *)self lock];
  id userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_id userInfo = a3;
  }

  [(SUScriptObject *)self unlock];
}

- (NSString)title
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  id v11 = __Block_byref_object_copy__35;
  int v12 = __Block_byref_object_dispose__35;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __37__SUScriptSegmentedControlItem_title__block_invoke, &unk_264812E70, self, &v8);
  }
  int v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __37__SUScriptSegmentedControlItem_title__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)userInfo
{
  [(SUScriptObject *)self lock];
  id v3 = self->_userInfo;
  [(SUScriptObject *)self unlock];
  if (v3) {
    return v3;
  }
  int v5 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v5 null];
}

- (void)_reloadUserInterface
{
  id v3 = [(SUScriptSegmentedControlItem *)self _segmentedControl];
  int v4 = (void *)[v3 rawSegments];
  if (v4)
  {
    uint64_t v5 = [v4 indexOfObjectIdenticalTo:self];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      uint64_t v7 = (void *)[v3 activeSegmentedControl];
      [v7 setImage:self->_image forSegmentAtIndex:v6];
      [v7 setTitle:self->_title forSegmentAtIndex:v6];
      uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "storePageViewController"), "sectionGroup"), "sections"), "objectAtIndex:", v6);
      [v8 setImage:self->_image];
      title = self->_title;
      [v8 setTitle:title];
    }
  }
}

- (id)_segmentedControl
{
  uint64_t v2 = [(SUScriptObject *)self parentScriptObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)_setImage:(id)a3
{
  image = self->_image;
  if (image != a3)
  {

    self->_image = (UIImage *)a3;
  }

  [(SUScriptSegmentedControlItem *)self _reloadUserInterface];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_47, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSegmentedControlItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSegmentedControlItem;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_47 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_47 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"canvas", @"identifier", @"identifier", @"imageURL", @"imageURL", @"title", @"title", @"userInfo", @"userInfo", 0);
  }
}

- (UIImage)image
{
  return self->_image;
}

@end