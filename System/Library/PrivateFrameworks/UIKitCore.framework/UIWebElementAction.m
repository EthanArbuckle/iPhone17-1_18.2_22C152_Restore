@interface UIWebElementAction
+ (id)customElementActionWithTitle:(id)a3 actionHandler:(id)a4;
+ (id)standardElementActionWithType:(int)a3;
+ (id)standardElementActionWithType:(int)a3 customTitle:(id)a4 context:(id)a5;
- (UIWebElementAction)initWithTitle:(id)a3 actionHandler:(id)a4 type:(int)a5;
- (id)_title;
- (id)dismissalHandler;
- (int)type;
- (void)_runActionWithElement:(id)a3 targetURL:(id)a4 documentView:(id)a5 interactionLocation:(CGPoint)a6;
- (void)dealloc;
- (void)setDismissalHandler:(id)a3;
@end

@implementation UIWebElementAction

- (UIWebElementAction)initWithTitle:(id)a3 actionHandler:(id)a4 type:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UIWebElementAction;
  v8 = [(UIWebElementAction *)&v10 init];
  if (v8)
  {
    v8->_title = (NSString *)a3;
    v8->_type = a5;
    v8->_actionHandler = _Block_copy(a4);
  }
  return v8;
}

- (void)dealloc
{
  self->_title = 0;
  self->_actionHandler = 0;

  self->_dismissalHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIWebElementAction;
  [(UIWebElementAction *)&v3 dealloc];
}

+ (id)customElementActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6 = objc_alloc((Class)a1);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__UIWebElementAction_customElementActionWithTitle_actionHandler___block_invoke;
  v8[3] = &unk_1E5310D80;
  v8[4] = a4;
  return (id)[v6 initWithTitle:a3 actionHandler:v8 type:0];
}

uint64_t __65__UIWebElementAction_customElementActionWithTitle_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)standardElementActionWithType:(int)a3 customTitle:(id)a4 context:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  switch(a3)
  {
    case 1:
      id v7 = (id)[_UIKitBundle() localizedStringForKey:@"Open Link" value:@"Open" table:@"Localizable"];
      v8 = &__block_literal_global_355_2;
      goto LABEL_10;
    case 2:
      id v7 = (id)[_UIKitBundle() localizedStringForKey:@"Copy Link" value:@"Copy" table:@"Localizable"];
      v8 = &__block_literal_global_672;
      goto LABEL_10;
    case 3:
      id v7 = _UINSLocalizedStringWithDefaultValue(@"Save Image", @"Save Image");
      v8 = &__block_literal_global_360_0;
      goto LABEL_10;
    case 4:
      id v7 = _UINSLocalizedStringWithDefaultValue(@"Add to Reading List", @"Add to Reading List");
      v8 = &__block_literal_global_365_1;
      goto LABEL_10;
    case 5:
      uint64_t v10 = [a5 objectForKeyedSubscript:@"UIWebElementActionContextAppLinkKey"];
      id v7 = _UINSLocalizedStringWithDefaultValue(@"Open in Safari", @"Open in Safari");
      v8 = v16;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_5;
      v16[3] = &unk_1E5310DC8;
      v16[4] = v10;
      goto LABEL_10;
    case 6:
      v11 = (void *)[a5 objectForKeyedSubscript:@"UIWebElementActionContextAppLinkKey"];
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "targetApplicationProxy"), "localizedNameForContext:", 0);
      id v7 = (id)[NSString localizedStringWithFormat:objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", @"Open in “%@” (Link Element Action Sheet Button)", @"Open in “%@”", @"Localizable", v12];
      v8 = v15;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_7;
      v15[3] = &unk_1E5310DC8;
      v15[4] = v11;
      goto LABEL_10;
    case 7:
      id v7 = _UINSLocalizedStringWithDefaultValue(@"Share…", @"Share…");
      v8 = &__block_literal_global_385_3;
LABEL_10:
      v13 = [UIWebElementAction alloc];
      if (a4) {
        id v14 = a4;
      }
      else {
        id v14 = v7;
      }
      id result = [(UIWebElementAction *)v13 initWithTitle:v14 actionHandler:v8 type:v5];
      break;
    default:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"There is no standard web element action of type %d.", a5, *(void *)&a3);
      id result = 0;
      break;
  }
  return result;
}

void __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [a3 absoluteString];
    uint64_t v6 = [UIPasteboardTypeListString objectAtIndex:0];
    id v18 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, v6, a3, objc_msgSend(UIPasteboardTypeListURL, "objectAtIndex:", 0), 0);
    id v7 = +[UIPasteboard generalPasteboard];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v18];
    v9 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    uint64_t v11 = [a2 dataRepresentation:1];
    if (!v11) {
      return;
    }
    uint64_t v12 = v11;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = [a2 mimeType];
    uint64_t v14 = [MEMORY[0x1E4F442D8] typeWithTag:v13 tagClass:*MEMORY[0x1E4F442E8] conformingToType:0];
    if (v14)
    {
      v15 = (void *)v14;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_msgSend(v16, "setObject:forKey:", v12, objc_msgSend(v15, "identifier"));
      uint64_t v17 = [a2 absoluteImageURL];
      objc_msgSend(v16, "setObject:forKey:", v17, objc_msgSend((id)*MEMORY[0x1E4F444F8], "identifier"));
      [v18 addObject:v16];
    }
    v9 = +[UIPasteboard generalPasteboard];
    uint64_t v8 = (uint64_t)v18;
  }
  [(UIPasteboard *)v9 setItems:v8];
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 performClick:a4];
}

void __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_3(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = (void *)[a2 dataRepresentation:0];
    if (v3)
    {
      UIImageDataWriteToSavedPhotosAlbum(v3, 0, 0, 0);
    }
  }
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a3 absoluteString];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (uint64_t v6 = (void *)[a2 innerText],
        (id v7 = objc_msgSend(v6, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"))) == 0)|| (v8 = v7, !objc_msgSend(v7, "length")))
  {
    uint64_t v8 = (void *)v5;
  }
  v9 = (void *)[(id)getSSReadingListClass_0() defaultReadingList];
  return [v9 addReadingListItemWithURL:a3 title:v8 previewText:0 error:0];
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) openInWebBrowser:1 setAppropriateOpenStrategyAndWebBrowserState:0 completionHandler:&__block_literal_global_371_3];
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) openInWebBrowser:0 setAppropriateOpenStrategyAndWebBrowserState:0 completionHandler:&__block_literal_global_380_0];
}

uint64_t __72__UIWebElementAction_standardElementActionWithType_customTitle_context___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 _shareElement:a2 withURL:a3];
}

+ (id)standardElementActionWithType:(int)a3
{
  return (id)[a1 standardElementActionWithType:*(void *)&a3 customTitle:0 context:0];
}

- (id)_title
{
  return self->_title;
}

- (void)_runActionWithElement:(id)a3 targetURL:(id)a4 documentView:(id)a5 interactionLocation:(CGPoint)a6
{
  -[UIWebElementActionInfo _setInteractionLocation:](objc_alloc_init(UIWebElementActionInfo), "_setInteractionLocation:", a6.x, a6.y);
  id v7 = (void (*)(void))*((void *)self->_actionHandler + 2);
  v7();
}

- (int)type
{
  return self->_type;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

@end