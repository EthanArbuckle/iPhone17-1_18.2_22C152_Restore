@interface UIActivityItemMapping
@end

@implementation UIActivityItemMapping

uint64_t __62___UIActivityItemMapping__addToActiveActivityViewControllers___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
  uint64_t v1 = _activeActivityViewControllers;
  _activeActivityViewControllers = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[7];
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v6 = a2;
  v7 = [v3 _activityViewControllerForActivityItem:v5];
  id v8 = [v4 activityViewController:v7 itemForActivityType:a1[6]];

  v6[2](v6, v8, 0);
}

uint64_t __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

void __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_3(double *a1, void *a2)
{
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  double v4 = a1[6];
  double v5 = a1[7];
  v6 = a2;
  +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v2, v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);
}

@end