@interface NUArticleKeyCommandManager
- (BOOL)hasBeenTraversed;
- (UIScrollView)scrollView;
- (id)keyCommandsWithSelector:(SEL)a3;
- (void)handleKey:(id)a3 flags:(int64_t)a4;
- (void)handleKeyCommand:(id)a3;
- (void)registerScrollView:(id)a3;
- (void)setHasBeenTraversed:(BOOL)a3;
@end

@implementation NUArticleKeyCommandManager

- (id)keyCommandsWithSelector:(SEL)a3
{
  v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F1D3E8];
  v17 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3E8] modifierFlags:0 action:a3];
  [v17 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v17];
  v16 = [MEMORY[0x263F1C708] keyCommandWithInput:v5 modifierFlags:0x80000 action:a3];
  [v16 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v16];
  uint64_t v6 = *MEMORY[0x263F1D3C8];
  v15 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3C8] modifierFlags:0 action:a3];
  [v15 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v15];
  v7 = [MEMORY[0x263F1C708] keyCommandWithInput:v6 modifierFlags:0x80000 action:a3];
  [v7 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v7];
  v8 = [MEMORY[0x263F1C708] keyCommandWithInput:@"UIKeyInputPageUp" modifierFlags:0 action:a3];
  [v8 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v8];
  v9 = [MEMORY[0x263F1C708] keyCommandWithInput:@"UIKeyInputPageDown" modifierFlags:0 action:a3];
  [v9 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v9];
  v10 = [MEMORY[0x263F1C708] keyCommandWithInput:@" " modifierFlags:0 action:a3];
  [v10 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v10];
  v11 = [MEMORY[0x263F1C708] keyCommandWithInput:@" " modifierFlags:0x20000 action:a3];
  [v11 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v11];
  v12 = [MEMORY[0x263F1C708] keyCommandWithInput:v5 modifierFlags:0x100000 action:a3];
  [v12 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v12];
  v13 = [MEMORY[0x263F1C708] keyCommandWithInput:v6 modifierFlags:0x100000 action:a3];
  [v12 setWantsPriorityOverSystemBehavior:1];
  [v4 addObject:v13];

  return v4;
}

- (void)handleKeyCommand:(id)a3
{
  id v4 = a3;
  id v6 = [v4 input];
  uint64_t v5 = [v4 modifierFlags];

  [(NUArticleKeyCommandManager *)self handleKey:v6 flags:v5];
}

- (void)handleKey:(id)a3 flags:(int64_t)a4
{
  int v4 = a4;
  id v32 = a3;
  [(NUArticleKeyCommandManager *)self setHasBeenTraversed:1];
  id v6 = [(NUArticleKeyCommandManager *)self scrollView];
  [v6 adjustedContentInset];
  double v8 = v7;
  double v10 = v9;

  v11 = [(NUArticleKeyCommandManager *)self scrollView];
  [v11 contentOffset];
  double v13 = v12;

  v14 = [(NUArticleKeyCommandManager *)self scrollView];
  [v14 contentSize];
  double v16 = v15;

  v17 = [(NUArticleKeyCommandManager *)self scrollView];
  [v17 bounds];
  CGFloat v30 = v19;
  CGFloat v31 = v18;
  CGFloat v21 = v20;
  double v23 = v22;

  double v24 = (v23 - (v8 + v10)) * 0.8;
  if ((id)*MEMORY[0x263F1D3E8] == v32)
  {
    if ((v4 & 0x100000) != 0)
    {
      double v13 = -v8;
      goto LABEL_19;
    }
    if ((v4 & 0x80000) != 0) {
      goto LABEL_11;
    }
    double v25 = -100.0;
LABEL_15:
    double v13 = v13 + v25;
    goto LABEL_19;
  }
  if ((id)*MEMORY[0x263F1D3C8] != v32)
  {
    if (![v32 isEqualToString:@"UIKeyInputPageUp"])
    {
      if ([v32 isEqualToString:@"UIKeyInputPageDown"]) {
        goto LABEL_17;
      }
      if (![v32 isEqualToString:@" "]) {
        goto LABEL_19;
      }
      if ((v4 & 0x20000) == 0) {
        goto LABEL_17;
      }
    }
LABEL_11:
    double v13 = v13 - v24;
    goto LABEL_19;
  }
  if ((v4 & 0x100000) == 0)
  {
    if ((v4 & 0x80000) != 0)
    {
LABEL_17:
      double v13 = v13 + v24;
      goto LABEL_19;
    }
    double v25 = 100.0;
    goto LABEL_15;
  }
  v34.origin.y = v30;
  v34.origin.x = v31;
  v34.size.width = v21;
  v34.size.height = v23;
  double v13 = v8 + v10 + v16 - CGRectGetHeight(v34);
LABEL_19:
  v35.origin.y = v30;
  v35.origin.x = v31;
  v35.size.width = v21;
  v35.size.height = v23;
  double v26 = v8 + v10 + v16 - CGRectGetHeight(v35);
  if (v13 <= -v8) {
    double v27 = -v8;
  }
  else {
    double v27 = v13;
  }
  if (v27 >= v26) {
    double v28 = v26;
  }
  else {
    double v28 = v27;
  }
  v29 = [(NUArticleKeyCommandManager *)self scrollView];
  objc_msgSend(v29, "setContentOffset:animated:", 1, 0.0, v28);
}

- (void)registerScrollView:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (UIScrollView *)WeakRetained;
}

- (BOOL)hasBeenTraversed
{
  return self->_hasBeenTraversed;
}

- (void)setHasBeenTraversed:(BOOL)a3
{
  self->_hasBeenTraversed = a3;
}

- (void).cxx_destruct
{
}

@end