@interface WFSystemShortcutPickerViewControllerCoordinator
- (WFSystemShortcutPickerViewControllerCoordinatorDelegate)delegate;
- (id)createViewControllerWithEditingContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)smartShortcutPickerViewControllerDidFinishWithSystemActionWithSystemAction:(id)a3 error:(id)a4;
@end

@implementation WFSystemShortcutPickerViewControllerCoordinator

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFSystemShortcutPickerViewControllerCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSystemShortcutPickerViewControllerCoordinatorDelegate *)WeakRetained;
}

- (void)smartShortcutPickerViewControllerDidFinishWithSystemActionWithSystemAction:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFSystemShortcutPickerViewControllerCoordinator *)self delegate];
  [v8 smartShortcutPickerViewControllerDidFinishWithSystemAction:v7 error:v6];
}

- (id)createViewControllerWithEditingContext:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11[0] = 0;
  if (!WorkflowUILibraryCore_frameworkLibrary)
  {
    v11[1] = (void *)MEMORY[0x263EF8330];
    v11[2] = (void *)3221225472;
    v11[3] = __WorkflowUILibraryCore_block_invoke;
    v11[4] = &__block_descriptor_40_e5_v8__0l;
    v11[5] = v11;
    long long v12 = xmmword_264BFCD18;
    uint64_t v13 = 0;
    WorkflowUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (WorkflowUILibraryCore_frameworkLibrary)
  {
    v5 = v11[0];
    if (!v11[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    a3 = [MEMORY[0x263F08690] currentHandler];
    self = [NSString stringWithUTF8String:"void *WorkflowUILibrary(void)"];
    objc_msgSend((id)a3, "handleFailureInFunction:file:lineNumber:description:", self, @"WFSystemShortcutPickerViewControllerCoordinator.m", 14, @"%s", v11[0]);

    __break(1u);
  }
  free(v5);
LABEL_5:
  id v6 = objc_alloc_init(NSClassFromString(&cfstr_WorkflowuiSmar.isa));
  if (objc_opt_respondsToSelector()) {
    [v6 performSelector:sel_setDelegate_ withObject:self];
  }
  SEL v7 = NSSelectorFromString(&cfstr_Makeviewcontro.isa);
  if (objc_opt_respondsToSelector())
  {
    id v8 = [NSNumber numberWithInteger:a3];
    v9 = [v6 performSelector:v7 withObject:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end