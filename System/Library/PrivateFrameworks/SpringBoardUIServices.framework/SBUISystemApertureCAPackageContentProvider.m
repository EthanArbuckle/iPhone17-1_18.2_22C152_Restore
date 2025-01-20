@interface SBUISystemApertureCAPackageContentProvider
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (CGSize)intrinsicPackageSize;
- (SBUISystemApertureCAPackageContentProvider)initWithPackageName:(id)a3 inBundle:(id)a4;
- (SBUISystemApertureCAPackageContentProvider)initWithURL:(id)a3;
- (id)publishedObjectWithName:(id)a3;
- (void)setIntrinsicPackageSize:(CGSize)a3;
@end

@implementation SBUISystemApertureCAPackageContentProvider

- (SBUISystemApertureCAPackageContentProvider)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBUISystemApertureCAPackageContentProvider.m", 25, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBUISystemApertureCAPackageContentProvider.m", 26, @"Invalid parameter not satisfying: %@", @"bundle" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v10 = [(BSUICAPackageView *)[_SBUISystemApertureCAPackageView alloc] initWithPackageName:v7 inBundle:v9];
  packageView = self->_packageView;
  self->_packageView = v10;

  v12 = [(SBUISystemApertureAspectFittingContentProvider *)self initWithView:self->_packageView];
  return v12;
}

- (SBUISystemApertureCAPackageContentProvider)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBUISystemApertureCAPackageContentProvider.m", 32, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v6 = [(BSUICAPackageView *)[_SBUISystemApertureCAPackageView alloc] initWithURL:v5];
  packageView = self->_packageView;
  self->_packageView = v6;

  id v8 = [(SBUISystemApertureAspectFittingContentProvider *)self initWithView:self->_packageView];
  return v8;
}

- (CGSize)intrinsicPackageSize
{
  packageView = self->_packageView;
  if (packageView)
  {
    p_width = &packageView->_intrinsicPackageSize.width;
    double v4 = *p_width;
    double v5 = p_width[1];
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setIntrinsicPackageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBUISystemApertureCAPackageContentProvider *)self intrinsicPackageSize];
  if (width != v7 || height != v6)
  {
    packageView = self->_packageView;
    if (packageView)
    {
      p_double width = &packageView->_intrinsicPackageSize.width;
      double *p_width = width;
      p_width[1] = height;
    }
    id v11 = [(SBUISystemApertureCustomContentProvider *)self contentContainer];
    [v11 preferredContentSizeDidInvalidateForContentViewProvider:self];
  }
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return [(BSUICAPackageView *)self->_packageView setState:a3 animated:a4];
}

- (id)publishedObjectWithName:(id)a3
{
  return [(BSUICAPackageView *)self->_packageView publishedObjectWithName:a3];
}

- (void).cxx_destruct
{
}

@end