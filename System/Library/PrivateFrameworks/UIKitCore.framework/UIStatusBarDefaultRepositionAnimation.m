@interface UIStatusBarDefaultRepositionAnimation
@end

@implementation UIStatusBarDefaultRepositionAnimation

void ___UIStatusBarDefaultRepositionAnimation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(double *)(a1 + 32);
  double v8 = *(double *)(a1 + 40);
  id v12 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___UIStatusBarDefaultRepositionAnimation_block_invoke_2;
  v13[3] = &unk_1E52DA040;
  id v14 = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___UIStatusBarDefaultRepositionAnimation_block_invoke_3;
  v11[3] = &unk_1E52E8F50;
  id v9 = v6;
  id v10 = v5;
  +[UIView _animateUsingSpringWithTension:0 friction:v13 interactive:v11 animations:v7 completion:v8];
}

uint64_t ___UIStatusBarDefaultRepositionAnimation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___UIStatusBarDefaultRepositionAnimation_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end