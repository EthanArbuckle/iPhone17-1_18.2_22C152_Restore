@interface UIViewController(InModalPresentation)
- (uint64_t)isInModalPresentation;
@end

@implementation UIViewController(InModalPresentation)

- (uint64_t)isInModalPresentation
{
  uint64_t v2 = [a1 navigationController];

  if (v2)
  {
    id v3 = a1;
    v4 = [v3 parentViewController];

    if (v4)
    {
      do
      {
        v5 = [v3 parentViewController];

        v6 = [v5 parentViewController];

        id v3 = v5;
      }
      while (v6);
    }
    else
    {
      v5 = v3;
    }
    v7 = [v5 presentingViewController];
    uint64_t v2 = v7 != 0;
  }
  return v2;
}

@end