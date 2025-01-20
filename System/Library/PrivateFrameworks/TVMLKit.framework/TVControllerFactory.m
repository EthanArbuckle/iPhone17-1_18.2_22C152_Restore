@interface TVControllerFactory
@end

@implementation TVControllerFactory

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _shelfControllerForElement:a2 existingController:a3];
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _gridControllerForElement:a2 existingController:a3];
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _listControllerForElement:a2 existingController:a3];
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _textFieldControllerForElement:a2 existingController:a3];
}

uint64_t __51___TVControllerFactory__registerControllerCreators__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _carouselControllerForElement:a2 layout:a3 existingController:a4];
}

_TVRotatingViewController *__51___TVControllerFactory__registerControllerCreators__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = +[TVInterfaceFactory sharedInterfaceFactory];
  v7 = [v5 view];
  v8 = [v6 _viewFromElement:v4 existingView:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = (_TVRotatingViewController *)v5;
  }
  else {
    v9 = objc_alloc_init(_TVRotatingViewController);
  }
  v10 = v9;
  [(_TVRotatingViewController *)v9 setView:v8];
  [v10 tv_setAssociatedIKViewElement:v4];

  return v10;
}

@end