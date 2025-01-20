@interface UISwipeAction
+ (id)swipeActionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5;
- (BOOL)canBeTriggeredBySwipe;
- (BOOL)resetsSwipedRow;
- (UISwipeAction)init;
- (UIVisualEffect)backgroundEffect;
- (id)completionHandler;
- (void)resetSwipedRow;
- (void)setBackgroundEffect:(id)a3;
- (void)setCanBeTriggeredBySwipe:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setResetsSwipedRow:(BOOL)a3;
@end

@implementation UISwipeAction

+ (id)swipeActionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__UISwipeAction_swipeActionWithStyle_title_handler___block_invoke;
  v12[3] = &unk_1E52E4E90;
  id v13 = v8;
  id v9 = v8;
  v10 = [a1 contextualActionWithStyle:a3 title:a4 handler:v12];

  return v10;
}

void __52__UISwipeAction_swipeActionWithStyle_title_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void (**)(uint64_t, id, uint64_t))(v7 + 16);
  id v9 = a4;
  v8(v7, v10, a3);
  if ([v10 resetsSwipedRow]) {
    v9[2](v9, 1);
  }
  else {
    [v10 setCompletionHandler:v9];
  }
}

- (UISwipeAction)init
{
  v5.receiver = self;
  v5.super_class = (Class)UISwipeAction;
  v2 = [(UISwipeAction *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UISwipeAction *)v2 setResetsSwipedRow:1];
    [(UISwipeAction *)v3 setCanBeTriggeredBySwipe:1];
  }
  return v3;
}

- (void)resetSwipedRow
{
  v3 = [(UISwipeAction *)self completionHandler];

  if (v3)
  {
    v4 = [(UISwipeAction *)self completionHandler];
    v4[2](v4, 1);

    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;
  }
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
}

- (BOOL)canBeTriggeredBySwipe
{
  return self->_canBeTriggeredBySwipe;
}

- (void)setCanBeTriggeredBySwipe:(BOOL)a3
{
  self->_canBeTriggeredBySwipe = a3;
}

- (BOOL)resetsSwipedRow
{
  return self->_resetsSwipedRow;
}

- (void)setResetsSwipedRow:(BOOL)a3
{
  self->_resetsSwipedRow = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
}

@end