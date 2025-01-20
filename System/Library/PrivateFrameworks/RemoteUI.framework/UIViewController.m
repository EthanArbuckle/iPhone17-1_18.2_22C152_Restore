@interface UIViewController
@end

@implementation UIViewController

uint64_t __49__UIViewController_RemoteUI__containsDescendant___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "containsDescendant:");
  }
}

uint64_t __58__UIViewController_RemoteUI__containsDescendantFromArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsDescendant:a2];
}

@end