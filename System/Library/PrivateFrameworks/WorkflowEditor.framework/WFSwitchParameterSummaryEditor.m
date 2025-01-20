@interface WFSwitchParameterSummaryEditor
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
@end

@implementation WFSwitchParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x263F86948]);
  v6 = NSNumber;
  v7 = [(WFModuleSummaryEditor *)self initialState];
  v8 = [v7 number];
  v9 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "BOOLValue") ^ 1);
  v10 = (void *)[v5 initWithNumber:v9];

  [(WFModuleSummaryEditor *)self stageState:v10];
  dispatch_time_t v11 = dispatch_time(0, 50000000);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__WFSwitchParameterSummaryEditor_beginEditingSlotWithIdentifier_presentationAnchor___block_invoke;
  v13[3] = &unk_264BFD500;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_after(v11, MEMORY[0x263EF83A0], v13);
}

uint64_t __84__WFSwitchParameterSummaryEditor_beginEditingSlotWithIdentifier_presentationAnchor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) commitState:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 completeEditing];
}

@end