@interface PXGViewEnvironment
- (BOOL)accessibilityEnabled;
- (BOOL)checkmarkEmphasized;
- (BOOL)emphasized;
- (BOOL)hasDifferentColorAppearanceComparedTo:(id)a3;
- (BOOL)hasEqualAppearanceTo:(id)a3;
- (BOOL)isBeingFullPageSnapshotted;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsFocusRing;
- (CGColor)checkmarkColor;
- (CGColor)focusRingColor;
- (PXGViewEnvironment)init;
- (PXGViewEnvironment)initWithView:(id)a3 accessibilityEnabled:(BOOL)a4 isBeingFullPageSnapshotted:(BOOL)a5;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (UITraitCollection)traitCollection;
- (int64_t)userInterfaceStyle;
- (void)dealloc;
@end

@implementation PXGViewEnvironment

- (PXGViewEnvironment)initWithView:(id)a3 accessibilityEnabled:(BOOL)a4 isBeingFullPageSnapshotted:(BOOL)a5
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXGViewEnvironment;
  v7 = [(PXGViewEnvironment *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 backgroundColor];
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v8;

    uint64_t v10 = [v6 tintColor];
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v10;

    uint64_t v12 = [v6 traitCollection];
    traitCollection = v7->_traitCollection;
    v7->_traitCollection = (UITraitCollection *)v12;

    [v6 traitCollection];
    objc_claimAutoreleasedReturnValue();
    PXUserInterfaceStyleFromUITraitCollection();
  }

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGViewEnvironment *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(PXGViewEnvironment *)self hasEqualAppearanceTo:v5])
      {
        id v6 = [(PXGViewEnvironment *)self traitCollection];
        v7 = [(PXGViewEnvironment *)v5 traitCollection];
        if (v6 == v7) {
          char v8 = 1;
        }
        else {
          char v8 = [v6 isEqual:v7];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)hasEqualAppearanceTo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v5 = [(PXGViewEnvironment *)self traitCollection];
  id v6 = [v4 traitCollection];
  BOOL v7 = v6 == 0;

  if ((v5 != 0) == v7
    || [(PXGViewEnvironment *)self hasDifferentColorAppearanceComparedTo:v4])
  {
    goto LABEL_14;
  }
  id v8 = [(PXGViewEnvironment *)self backgroundColor];
  id v9 = [v4 backgroundColor];
  if (v8 == v9)
  {
  }
  else
  {
    uint64_t v10 = v9;
    char v11 = [v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_14;
    }
  }
  int64_t v12 = [(PXGViewEnvironment *)self userInterfaceStyle];
  if (v12 == [v4 userInterfaceStyle])
  {
    int v13 = [(PXGViewEnvironment *)self accessibilityEnabled];
    if (v13 == [v4 accessibilityEnabled])
    {
      int v14 = [(PXGViewEnvironment *)self emphasized];
      if (v14 == [v4 emphasized])
      {
        int v15 = [(PXGViewEnvironment *)self wantsFocusRing];
        if (v15 == [v4 wantsFocusRing])
        {
          int v16 = [(PXGViewEnvironment *)self isBeingFullPageSnapshotted];
          if (v16 == [v4 isBeingFullPageSnapshotted])
          {
            int v17 = [(PXGViewEnvironment *)self checkmarkEmphasized];
            if (v17 == [v4 checkmarkEmphasized])
            {
              v20 = [(PXGViewEnvironment *)self tintColor];
              v21 = [(PXGViewEnvironment *)self traitCollection];
              v22 = [v20 resolvedColorWithTraitCollection:v21];

              v23 = [v4 tintColor];
              v24 = [v4 traitCollection];
              v25 = [v23 resolvedColorWithTraitCollection:v24];

              char v18 = [v22 _isSimilarToColor:v25 withinPercentage:0.000000999999997];
              goto LABEL_15;
            }
          }
        }
      }
    }
  }
LABEL_14:
  char v18 = 0;
LABEL_15:

  return v18;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (BOOL)hasDifferentColorAppearanceComparedTo:(id)a3
{
  id v4 = a3;
  v5 = [(PXGViewEnvironment *)self traitCollection];
  id v6 = [v4 traitCollection];

  LOBYTE(v4) = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v6];
  return (char)v4;
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (BOOL)wantsFocusRing
{
  return self->_wantsFocusRing;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isBeingFullPageSnapshotted
{
  return self->_isBeingFullPageSnapshotted;
}

- (BOOL)emphasized
{
  return self->_emphasized;
}

- (BOOL)checkmarkEmphasized
{
  return self->_checkmarkEmphasized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

CGColorRef __83__PXGViewEnvironment_initWithView_accessibilityEnabled_isBeingFullPageSnapshotted___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = CGColorRetain((CGColorRef)[*(id *)(a1 + 40) CGColor]);
  CGColorRef result = CGColorRetain((CGColorRef)[*(id *)(a1 + 48) CGColor]);
  *(void *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->_checkmarkColor);
  CGColorRelease(self->_focusRingColor);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewEnvironment;
  [(PXGViewEnvironment *)&v3 dealloc];
}

- (CGColor)focusRingColor
{
  return self->_focusRingColor;
}

- (CGColor)checkmarkColor
{
  return self->_checkmarkColor;
}

- (PXGViewEnvironment)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGViewEnvironment.m", 93, @"%s is not available as initializer", "-[PXGViewEnvironment init]");

  abort();
}

@end