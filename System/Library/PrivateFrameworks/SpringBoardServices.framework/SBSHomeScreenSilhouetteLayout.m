@interface SBSHomeScreenSilhouetteLayout
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)icons;
- (NSString)description;
- (SBSHomeScreenRectangleSilhouette)dock;
- (SBSHomeScreenSilhouetteLayout)init;
- (SBSHomeScreenSilhouetteLayout)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenSilhouetteLayout)initWithCoder:(id)a3;
- (SBSHomeScreenSilhouetteLayout)initWithIcons:(id)a3 dock:(id)a4;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSHomeScreenSilhouetteLayout

- (SBSHomeScreenSilhouetteLayout)initWithIcons:(id)a3 dock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSHomeScreenSilhouetteLayout;
  v8 = [(SBSHomeScreenSilhouetteLayout *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    icons = v8->_icons;
    v8->_icons = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dock, a4);
  }

  return v8;
}

- (SBSHomeScreenSilhouetteLayout)init
{
  return [(SBSHomeScreenSilhouetteLayout *)self initWithIcons:MEMORY[0x1E4F1CBF0] dock:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSHomeScreenSilhouetteLayout *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = [(SBSHomeScreenSilhouetteLayout *)self icons];
      uint64_t v9 = [(SBSHomeScreenSilhouetteLayout *)v7 icons];
      int v10 = BSEqualObjects();

      if (v10)
      {
        v11 = [(SBSHomeScreenSilhouetteLayout *)self dock];
        objc_super v12 = [(SBSHomeScreenSilhouetteLayout *)v7 dock];
        char v13 = BSEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(SBSHomeScreenSilhouetteLayout *)self icons];
  uint64_t v4 = [v3 hash];
  v5 = [(SBSHomeScreenSilhouetteLayout *)self dock];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __44__SBSHomeScreenSilhouetteLayout_description__block_invoke;
  int v10 = &unk_1E566BB08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = [v4 descriptionWithLocale:v7 arguments:v8, v9, v10, v11];

  return (NSString *)v5;
}

uint64_t __44__SBSHomeScreenSilhouetteLayout_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SBSHomeScreenSilhouetteLayout *)self icons];
  [v4 encodeObject:v5 forKey:@"icons"];

  id v6 = [(SBSHomeScreenSilhouetteLayout *)self dock];
  [v4 encodeObject:v6 forKey:@"dock"];
}

- (SBSHomeScreenSilhouetteLayout)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = [v4 setWithObject:v6];
  uint64_t v8 = [v5 decodeArrayOfObjectsOfClasses:v7 forKey:@"icons"];

  uint64_t v9 = self;
  int v10 = [v5 decodeObjectOfClass:v9 forKey:@"dock"];

  v11 = [(SBSHomeScreenSilhouetteLayout *)self initWithIcons:v8 dock:v10];
  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSHomeScreenSilhouetteLayout *)self icons];
  [v4 encodeObject:v5 forKey:@"icons"];

  id v6 = [(SBSHomeScreenSilhouetteLayout *)self dock];
  [v4 encodeObject:v6 forKey:@"dock"];
}

- (SBSHomeScreenSilhouetteLayout)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = self;
  uint64_t v7 = [v4 decodeCollectionOfClass:v5 containingClass:v6 forKey:@"icons"];

  uint64_t v8 = self;
  uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"dock"];

  int v10 = [(SBSHomeScreenSilhouetteLayout *)self initWithIcons:v7 dock:v9];
  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(SBSHomeScreenSilhouetteLayout *)self icons];
  id v5 = (id)[v8 appendObject:v4 withName:@"icons"];

  id v6 = [(SBSHomeScreenSilhouetteLayout *)self dock];
  id v7 = (id)[v8 appendObject:v6 withName:@"dock"];
}

- (NSArray)icons
{
  return self->_icons;
}

- (SBSHomeScreenRectangleSilhouette)dock
{
  return self->_dock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dock, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end