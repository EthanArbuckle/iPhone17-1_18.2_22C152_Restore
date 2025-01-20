@interface _UIButtonBarTargetAction
- (SEL)proxyAction;
- (UIBarButtonItem)barButtonItem;
- (_UIButtonBarTargetAction)init;
- (_UIButtonBarTargetAction)initWithBarButtonItem:(id)a3;
- (id)actionFilter;
- (void)_invoke:(id)a3 forEvent:(id)a4;
- (void)setActionFilter:(id)a3;
@end

@implementation _UIButtonBarTargetAction

- (SEL)proxyAction
{
  return sel__invoke_forEvent_;
}

- (void)setActionFilter:(id)a3
{
}

- (_UIButtonBarTargetAction)initWithBarButtonItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIButtonBarTargetAction;
  v6 = [(_UIButtonBarTargetAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_barButtonItem, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionFilter, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

- (_UIButtonBarTargetAction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s should not be called", "-[_UIButtonBarTargetAction init]");
  v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];
  [v6 raise];

  return 0;
}

- (void)_invoke:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __45___UIButtonBarTargetAction__invoke_forEvent___block_invoke;
  v17 = &unk_1E52D9F98;
  v18 = self;
  id v8 = v7;
  id v19 = v8;
  objc_super v9 = (void (**)(void))_Block_copy(&v14);
  actionFilter = (void (**)(id, id, _UIButtonBarTargetAction *, void (**)(void)))self->_actionFilter;
  if (actionFilter)
  {
    actionFilter[2](actionFilter, v6, self, v9);
  }
  else
  {
    v9[2](v9);
    v11 = self->_barButtonItem;
    if ((dyld_program_sdk_at_least() & 1) == 0 && qword_1EB25F128 != -1) {
      dispatch_once(&qword_1EB25F128, &__block_literal_global_46);
    }
    if (_MergedGlobals_957)
    {
      v12 = [(UIBarButtonItem *)v11 target];
      if ([(UIBarButtonItem *)v11 action] == sel_rightBttnAction
        && [v12 isMemberOfClass:NSClassFromString(&cfstr_Bahtlocationss.isa)])
      {
        v13 = [v12 view];
        [v13 setNeedsLayout];
      }
    }
  }
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (id)actionFilter
{
  return self->_actionFilter;
}

@end