@interface UICollectionViewTableLayoutSwipeAction
+ (id)actionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5;
@end

@implementation UICollectionViewTableLayoutSwipeAction

+ (id)actionWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__UICollectionViewTableLayoutSwipeAction_actionWithStyle_title_handler___block_invoke;
  v13[3] = &unk_1E52E4E90;
  id v14 = v8;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___UICollectionViewTableLayoutSwipeAction;
  id v9 = v8;
  v10 = objc_msgSendSuper2(&v12, sel_contextualActionWithStyle_title_handler_, a3, a4, v13);

  return v10;
}

void __72__UICollectionViewTableLayoutSwipeAction_actionWithStyle_title_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  id v8 = a4;
  v7(v6, a2, a3);
  v8[2](v8, 1);
}

@end