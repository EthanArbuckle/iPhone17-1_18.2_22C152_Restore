@interface TSTableView
+ (int64_t)ts_preferredStyleForStyle:(int64_t)a3;
- (BOOL)tsaxPrefersCustomReorderMessage;
- (OS_dispatch_group)touchDeferGroup;
- (TSTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)_accessibilityReorderMessageForNewIndexPath:(id)a3 swappedWithRow:(int64_t)a4 movingDown:(BOOL)a5;
- (id)contextualActionForDeletingRowAtIndexPath:(id)a3;
- (int64_t)touchDeferCounter;
- (void)_deferWhenTouchingWithBlock:(id)a3;
- (void)setTouchDeferCounter:(int64_t)a3;
- (void)setTsaxPrefersCustomReorderMessage:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TSTableView

- (TSTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSTableView;
  v4 = -[TSTableView initWithFrame:style:](&v8, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    dispatch_group_t v5 = dispatch_group_create();
    touchDeferGroup = v4->_touchDeferGroup;
    v4->_touchDeferGroup = (OS_dispatch_group *)v5;

    v4->_touchDeferCounter = 0;
  }
  return v4;
}

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_group_t v5 = [(TSTableView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(TSTableView *)self delegate];
    objc_super v8 = [v7 tableView:self trailingSwipeActionsConfigurationForRowAtIndexPath:v4];

    if (v8)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v9 = [v8 actions];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v14 style] == 1)
            {
              id v15 = v14;

              goto LABEL_14;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSTableView;
  id v15 = [(TSTableView *)&v17 contextualActionForDeletingRowAtIndexPath:v4];
LABEL_14:

  return v15;
}

+ (int64_t)ts_preferredStyleForStyle:(int64_t)a3
{
  return a3;
}

- (id)_accessibilityReorderMessageForNewIndexPath:(id)a3 swappedWithRow:(int64_t)a4 movingDown:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (![(TSTableView *)self tsaxPrefersCustomReorderMessage]) {
    goto LABEL_11;
  }
  v9 = [(TSTableView *)self indexPathForRowAtGlobalRow:a4];
  uint64_t v10 = [v9 row];
  if (v10 >= -[TSTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", [v9 section]))
  {
LABEL_10:

LABEL_11:
    v22.receiver = self;
    v22.super_class = (Class)TSTableView;
    long long v19 = [(TSTableView *)&v22 _accessibilityReorderMessageForNewIndexPath:v8 swappedWithRow:a4 movingDown:v5];
    goto LABEL_12;
  }
  uint64_t v11 = [(TSTableView *)self cellForRowAtIndexPath:v9];
  if (([v11 conformsToProtocol:&unk_1F0FB1BE8] & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v12 = [v11 tsaxAccessibilityLabelForReordering];
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = v13;
    if (v5) {
      id v15 = @"below";
    }
    else {
      id v15 = @"above";
    }
    long long v21 = [v13 localizedStringForKey:v15 value:&stru_1F0F22E30 table:0];

    v16 = NSString;
    objc_super v17 = [MEMORY[0x1E4F28B50] mainBundle];
    long long v18 = [v17 localizedStringForKey:@"Move %1$@ %2$@." value:&stru_1F0F22E30 table:0];
    long long v19 = objc_msgSend(v16, "stringWithFormat:", v18, v21, v12);
  }
  else
  {
    long long v19 = 0;
  }

  if (!v19) {
    goto LABEL_11;
  }
LABEL_12:

  return v19;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  [(TSTableView *)&v6 touchesBegan:a3 withEvent:a4];
  BOOL v5 = [(TSTableView *)self touchDeferGroup];
  dispatch_group_enter(v5);

  [(TSTableView *)self setTouchDeferCounter:[(TSTableView *)self touchDeferCounter] + 1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  [(TSTableView *)&v6 touchesEnded:a3 withEvent:a4];
  if ([(TSTableView *)self touchDeferCounter] >= 1)
  {
    BOOL v5 = [(TSTableView *)self touchDeferGroup];
    dispatch_group_leave(v5);

    [(TSTableView *)self setTouchDeferCounter:[(TSTableView *)self touchDeferCounter] - 1];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  [(TSTableView *)&v6 touchesCancelled:a3 withEvent:a4];
  if ([(TSTableView *)self touchDeferCounter] >= 1)
  {
    BOOL v5 = [(TSTableView *)self touchDeferGroup];
    dispatch_group_leave(v5);

    [(TSTableView *)self setTouchDeferCounter:[(TSTableView *)self touchDeferCounter] - 1];
  }
}

- (void)_deferWhenTouchingWithBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TSTableView *)self touchDeferGroup];
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], v4);
}

- (BOOL)tsaxPrefersCustomReorderMessage
{
  return self->_tsaxPrefersCustomReorderMessage;
}

- (void)setTsaxPrefersCustomReorderMessage:(BOOL)a3
{
  self->_tsaxPrefersCustomReorderMessage = a3;
}

- (OS_dispatch_group)touchDeferGroup
{
  return self->_touchDeferGroup;
}

- (int64_t)touchDeferCounter
{
  return self->_touchDeferCounter;
}

- (void)setTouchDeferCounter:(int64_t)a3
{
  self->_touchDeferCounter = a3;
}

- (void).cxx_destruct
{
}

@end