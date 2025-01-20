@interface _UISheetPresentationControllerAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (_UISheetPresentationControllerAppearance)appearanceWithLargestUndimmedDetentIdentifier:(id)a3;
+ (_UISheetPresentationControllerAppearance)appearanceWithSmallestDimmedDetentIdentifier:(id)a3;
+ (id)appearancePreferringDimmingVisible:(BOOL)a3;
- (BOOL)_isDimmingAlwaysVisible;
- (BOOL)_prefersDimmingVisible;
- (BOOL)isEqual:(id)a3;
- (NSString)_largestUndimmedDetentIdentifier;
- (NSString)_smallestDimmedDetentIdentifier;
- (NSString)description;
- (_UISheetPresentationControllerAppearance)initWithBSXPCCoder:(id)a3;
- (_UISheetPresentationControllerAppearance)initWithCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISheetPresentationControllerAppearance

+ (id)appearancePreferringDimmingVisible:(BOOL)a3
{
  v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = a3;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__smallestDimmedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__largestUndimmedDetentIdentifier, 0);
}

- (NSString)_largestUndimmedDetentIdentifier
{
  return self->__largestUndimmedDetentIdentifier;
}

- (NSString)_smallestDimmedDetentIdentifier
{
  return self->__smallestDimmedDetentIdentifier;
}

- (BOOL)_prefersDimmingVisible
{
  return self->__prefersDimmingVisible;
}

- (BOOL)_isDimmingAlwaysVisible
{
  if (![(_UISheetPresentationControllerAppearance *)self _prefersDimmingVisible]) {
    return 0;
  }
  v3 = [(_UISheetPresentationControllerAppearance *)self _largestUndimmedDetentIdentifier];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(_UISheetPresentationControllerAppearance *)self _smallestDimmedDetentIdentifier];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

+ (_UISheetPresentationControllerAppearance)appearanceWithLargestUndimmedDetentIdentifier:(id)a3
{
  v3 = (NSString *)a3;
  BOOL v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = 1;
  largestUndimmedDetentIdentifier = v4->__largestUndimmedDetentIdentifier;
  v4->__largestUndimmedDetentIdentifier = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(_UISheetPresentationControllerAppearance *)self _prefersDimmingVisible];
    if (v6 != [v5 _prefersDimmingVisible])
    {
      LOBYTE(v7) = 0;
LABEL_19:

      goto LABEL_20;
    }
    v8 = [(_UISheetPresentationControllerAppearance *)self _largestUndimmedDetentIdentifier];
    v9 = [v5 _largestUndimmedDetentIdentifier];
    id v10 = v8;
    id v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {
    }
    else
    {
      LOBYTE(v7) = 0;
      v13 = v11;
      id v14 = v10;
      if (!v10 || !v11)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      int v7 = [v10 isEqual:v11];

      if (!v7) {
        goto LABEL_18;
      }
    }
    v15 = [(_UISheetPresentationControllerAppearance *)self _smallestDimmedDetentIdentifier];
    v16 = [v5 _smallestDimmedDetentIdentifier];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      LOBYTE(v7) = 0;
      if (v14 && v17) {
        LOBYTE(v7) = [v14 isEqual:v17];
      }
    }

    goto LABEL_17;
  }
  LOBYTE(v7) = 0;
LABEL_20:

  return v7;
}

+ (_UISheetPresentationControllerAppearance)appearanceWithSmallestDimmedDetentIdentifier:(id)a3
{
  v3 = (NSString *)a3;
  id v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = 0;
  smallestDimmedDetentIdentifier = v4->__smallestDimmedDetentIdentifier;
  v4->__smallestDimmedDetentIdentifier = v3;

  return v4;
}

- (NSString)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__prefersDimmingVisible);
  v9 = v3;
  id v4 = NSStringFromSelector(sel__largestUndimmedDetentIdentifier);
  id v10 = v4;
  id v5 = NSStringFromSelector(sel__smallestDimmedDetentIdentifier);
  id v11 = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  int v7 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);

  return (NSString *)v7;
}

- (_UISheetPresentationControllerAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerAppearance;
  id v5 = [(_UISheetPresentationControllerAppearance *)&v11 init];
  if (v5)
  {
    v5->__prefersDimmingVisible = [v4 decodeBoolForKey:@"_prefersDimmingVisible"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_largestUndimmedDetentIdentifier"];
    largestUndimmedDetentIdentifier = v5->__largestUndimmedDetentIdentifier;
    v5->__largestUndimmedDetentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smallestDimmedDetentIdentifier"];
    smallestDimmedDetentIdentifier = v5->__smallestDimmedDetentIdentifier;
    v5->__smallestDimmedDetentIdentifier = (NSString *)v8;
  }
  return v5;
}

- (_UISheetPresentationControllerAppearance)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerAppearance;
  id v5 = [(_UISheetPresentationControllerAppearance *)&v11 init];
  if (v5)
  {
    v5->__prefersDimmingVisible = [v4 decodeBoolForKey:@"_prefersDimmingVisible"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_largestUndimmedDetentIdentifier"];
    largestUndimmedDetentIdentifier = v5->__largestUndimmedDetentIdentifier;
    v5->__largestUndimmedDetentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smallestDimmedDetentIdentifier"];
    smallestDimmedDetentIdentifier = v5->__smallestDimmedDetentIdentifier;
    v5->__smallestDimmedDetentIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible"), @"_prefersDimmingVisible");
  id v5 = [(_UISheetPresentationControllerAppearance *)self _largestUndimmedDetentIdentifier];
  [v4 encodeObject:v5 forKey:@"_largestUndimmedDetentIdentifier"];

  id v6 = [(_UISheetPresentationControllerAppearance *)self _smallestDimmedDetentIdentifier];
  [v4 encodeObject:v6 forKey:@"_smallestDimmedDetentIdentifier"];
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible"), @"_prefersDimmingVisible");
  id v5 = [(_UISheetPresentationControllerAppearance *)self _largestUndimmedDetentIdentifier];
  [v4 encodeObject:v5 forKey:@"_largestUndimmedDetentIdentifier"];

  id v6 = [(_UISheetPresentationControllerAppearance *)self _smallestDimmedDetentIdentifier];
  [v4 encodeObject:v6 forKey:@"_smallestDimmedDetentIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end