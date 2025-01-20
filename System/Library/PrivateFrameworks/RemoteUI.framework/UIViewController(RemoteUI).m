@interface UIViewController(RemoteUI)
- (BOOL)containsDescendant:()RemoteUI;
- (BOOL)containsDescendantFromArray:()RemoteUI;
@end

@implementation UIViewController(RemoteUI)

- (BOOL)containsDescendant:()RemoteUI
{
  id v4 = a3;
  if (a1 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = [a1 childViewControllers];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__UIViewController_RemoteUI__containsDescendant___block_invoke;
    v9[3] = &unk_2642116B0;
    id v10 = v4;
    v6 = objc_msgSend(v5, "aaf_firstObjectPassingTest:", v9);
    BOOL v7 = v6 != 0;
  }
  return v7;
}

- (BOOL)containsDescendantFromArray:()RemoteUI
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__UIViewController_RemoteUI__containsDescendantFromArray___block_invoke;
  v6[3] = &unk_2642116B0;
  v6[4] = a1;
  v3 = objc_msgSend(a3, "aaf_firstObjectPassingTest:", v6);
  BOOL v4 = v3 != 0;

  return v4;
}

@end