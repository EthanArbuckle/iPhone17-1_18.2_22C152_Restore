@interface TSWPHyperlinkAction
+ (id)hyperlinkActionWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5;
- (TSWPHyperlinkAction)initWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5;
- (void)dealloc;
@end

@implementation TSWPHyperlinkAction

- (TSWPHyperlinkAction)initWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke;
  v10[3] = &unk_2646B0750;
  v10[4] = a3;
  v10[5] = a4;
  v9.receiver = self;
  v9.super_class = (Class)TSWPHyperlinkAction;
  v7 = [(TSWPTwoPartAction *)&v9 initWithStartAction:v10 cancelAction:&__block_literal_global_65 finishAction:a5];
  if (v7)
  {
    v7->_hyperlinkField = (TSWPHyperlinkField *)a3;
    v7->_hyperlinkRep = (TSWPHyperlinkHostRepProtocol *)a4;
  }
  return v7;
}

uint64_t __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke(uint64_t a1)
{
  id v2 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];
  [v2 endUISession];
  [v2 startUISessionForHyperlinkField:*(void *)(a1 + 32) inRep:*(void *)(a1 + 40)];

  return [v2 showHyperlinkHighlight];
}

uint64_t __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke_2()
{
  id v0 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];

  return [v0 endUISession];
}

+ (id)hyperlinkActionWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHyperlink:a3 inRep:a4 action:a5];

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkAction;
  [(TSWPTwoPartAction *)&v3 dealloc];
}

@end