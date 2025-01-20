@interface UIView(SBUISystemAperturePrivate)
- (SBUISystemApertureLayoutGuide)SBUISA_systemApertureLayoutGuideWithIdentifier:()SBUISystemAperturePrivate;
- (uint64_t)SBUISA_systemApertureMaximumContentSizeLayoutGuide;
- (uint64_t)SBUISA_systemApertureMinimumContentSizeLayoutGuide;
@end

@implementation UIView(SBUISystemAperturePrivate)

- (SBUISystemApertureLayoutGuide)SBUISA_systemApertureLayoutGuideWithIdentifier:()SBUISystemAperturePrivate
{
  id v4 = a3;
  v5 = [a1 layoutGuides];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__UIView_SBUISystemAperturePrivate__SBUISA_systemApertureLayoutGuideWithIdentifier___block_invoke;
  v13[3] = &unk_1E5CCE2D0;
  id v6 = v4;
  id v14 = v6;
  v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v13);

  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    [(SBUISystemApertureLayoutGuide *)v11 activateConstraintsIfNeeded];
  }
  else
  {
    v11 = objc_alloc_init(SBUISystemApertureLayoutGuide);
    [(SBUISystemApertureLayoutGuide *)v11 setIdentifier:v6];
    [a1 addLayoutGuide:v11];
    [(SBUISystemApertureLayoutGuide *)v11 prepareIfNeeded];
    v9 = v11;
  }

  return v9;
}

- (uint64_t)SBUISA_systemApertureMaximumContentSizeLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureMaximumContentSizeLayoutMarginsGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureMinimumContentSizeLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"kSBUISystemApertureMinimumContentSizeLayoutMarginsGuideIdentifier");
}

@end