@interface UIWindowScene(SBUISystemAperture)
- (BOOL)SBUI_isHostedBySystemAperture;
- (SBUISystemApertureElementSource)systemApertureElementSource;
- (id)systemApertureElementContext;
- (id)systemApertureElementSourceIfExists;
- (id)systemApertureElementViewControllerProvider;
- (id)systemApertureHostedElementContext;
- (void)setSystemApertureElementViewControllerProvider:()SBUISystemAperture;
@end

@implementation UIWindowScene(SBUISystemAperture)

- (BOOL)SBUI_isHostedBySystemAperture
{
  v2 = [a1 systemApertureElementSourceIfExists];
  uint64_t v3 = [v2 layoutMode];

  if (v3) {
    return 1;
  }
  v5 = [a1 _FBSScene];
  v6 = [v5 settings];
  uint64_t v7 = objc_msgSend(v6, "SBUISA_layoutMode");

  return v7 != 0;
}

- (id)systemApertureElementContext
{
  v1 = [a1 systemApertureElementContextPrivate];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[SBUISystemApertureElementUnassociatedContext unassociatedContext];
  }
  v4 = v3;

  return v4;
}

- (id)systemApertureHostedElementContext
{
  if ((SBUIIsSystemApertureEnabled() & 1) != 0 || objc_msgSend(a1, "SBUI_isHostedBySystemAperture"))
  {
    v2 = [a1 systemApertureElementSource];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)systemApertureElementSourceIfExists
{
  v1 = [a1 _sceneComponentForKey:@"SBUISystemApertureElementSourceKey"];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (SBUISystemApertureElementSource)systemApertureElementSource
{
  uint64_t v2 = [a1 _sceneComponentForKey:@"SBUISystemApertureElementSourceKey"];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    v6 = objc_alloc_init(SBUISystemApertureElementSource);
    [(SBUISystemApertureElementSource *)v6 registerWithScene:a1];
  }
  return v6;
}

- (id)systemApertureElementViewControllerProvider
{
  v1 = [a1 systemApertureElementContextPrivate];
  uint64_t v2 = [v1 systemApertureElementViewControllerProvider];

  return v2;
}

- (void)setSystemApertureElementViewControllerProvider:()SBUISystemAperture
{
  id v4 = a3;
  id v5 = [a1 systemApertureElementContextPrivate];
  [v5 setSystemApertureElementViewControllerProvider:v4];
}

@end