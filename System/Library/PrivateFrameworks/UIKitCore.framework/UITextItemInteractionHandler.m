@interface UITextItemInteractionHandler
@end

@implementation UITextItemInteractionHandler

id __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) menu];
  v3 = v2;
  if (!v2) {
    v2 = *(void **)(a1 + 40);
  }
  id v4 = v2;

  return v4;
}

id __57___UITextItemInteractionHandler_contextMenuConfiguration__block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setView:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) frame];
  objc_msgSend(v2, "setPreferredContentSize:", v3, v4);
  return v2;
}

void __46___UITextItemInteractionHandler_primaryAction__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) item];
  unint64_t v3 = [v2 preferredMenuExpression];

  if (v3 >= 2)
  {
    if (v3 != 2) {
      return;
    }
    id v8 = [*(id *)(a1 + 32) item];
    v6 = [v8 editMenuInteraction];
    v7 = [*(id *)(a1 + 32) _editMenuConfiguration];
    [v6 presentEditMenuWithConfiguration:v7];
  }
  else
  {
    double v4 = [*(id *)(a1 + 32) item];
    v5 = [v4 contextMenuInteraction];
    [v5 _setFallbackDriverStyle:1];

    id v8 = [*(id *)(a1 + 32) item];
    v6 = [v8 contextMenuInteraction];
    v7 = [*(id *)(a1 + 32) item];
    [v7 location];
    objc_msgSend(v6, "_presentMenuAtLocation:");
  }
}

@end