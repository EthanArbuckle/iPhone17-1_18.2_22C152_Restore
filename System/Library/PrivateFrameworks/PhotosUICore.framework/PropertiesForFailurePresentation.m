@interface PropertiesForFailurePresentation
@end

@implementation PropertiesForFailurePresentation

void ___PropertiesForFailurePresentation_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  v9 = [[PXAlertAction alloc] initWithTitle:v8 style:a3 action:v7];

  [v6 addObject:v9];
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_4()
{
  return +[PXSystemNavigation navigateToDestination:4 completion:0];
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_3()
{
  return +[PXSystemNavigation navigateToDestination:4 completion:0];
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_2()
{
  return +[PXSystemNavigation navigateToDestination:10 completion:0];
}

uint64_t ___PropertiesForFailurePresentation_block_invoke_368()
{
  return +[PXSystemNavigation navigateToDestination:9 completion:0];
}

@end