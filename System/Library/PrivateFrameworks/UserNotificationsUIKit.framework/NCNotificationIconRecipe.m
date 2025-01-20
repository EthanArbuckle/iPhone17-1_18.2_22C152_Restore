@interface NCNotificationIconRecipe
+ (id)iconRecipeForApplicationIdentifier:(id)a3;
+ (id)iconRecipeForDate:(id)a3;
+ (id)iconRecipeForDateIconIdentifier:(id)a3;
+ (id)iconRecipeForSectionIcon:(id)a3 scale:(double)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithIconRecipeForApplicationIdentifier:(id)a3;
- (id)_initWithIconRecipeForDate:(id)a3;
- (id)_initWithIconRecipeForDateIconIdentifier:(id)a3;
- (id)_initWithIconRecipeForSectionIcon:(id)a3 scale:(double)a4;
- (id)imagesForIconFormat:(int64_t)a3;
- (unint64_t)hash;
@end

@implementation NCNotificationIconRecipe

+ (id)iconRecipeForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconRecipeForApplicationIdentifier:v4];

  return v5;
}

+ (id)iconRecipeForSectionIcon:(id)a3 scale:(double)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithIconRecipeForSectionIcon:v6 scale:a4];

  return v7;
}

+ (id)iconRecipeForDateIconIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconRecipeForDateIconIdentifier:v4];

  return v5;
}

+ (id)iconRecipeForDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconRecipeForDate:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_type];
  id v5 = (id)[v3 appendString:self->_applicationIdentifier];
  id v6 = (id)[v3 appendObject:self->_sectionIcon];
  id v7 = (id)[v3 appendCGFloat:self->_scale];
  id v8 = (id)[v3 appendString:self->_dateIconIdentifier];
  id v9 = (id)[v3 appendObject:self->_date];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NCNotificationIconRecipe *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      if (self->_type == v5->_type
        && BSEqualStrings()
        && BSEqualObjects()
        && BSFloatEqualToFloat()
        && BSEqualStrings())
      {
        char v6 = BSEqualObjects();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)_initWithIconRecipeForApplicationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationIconRecipe;
  char v6 = [(NCNotificationIconRecipe *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_applicationIdentifier, a3);
  }

  return v7;
}

- (id)_initWithIconRecipeForSectionIcon:(id)a3 scale:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationIconRecipe;
  id v8 = [(NCNotificationIconRecipe *)&v11 init];
  objc_super v9 = (double *)v8;
  if (v8)
  {
    v8->_type = 1;
    objc_storeStrong((id *)&v8->_sectionIcon, a3);
    v9[4] = a4;
  }

  return v9;
}

- (id)_initWithIconRecipeForDateIconIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationIconRecipe;
  char v6 = [(NCNotificationIconRecipe *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_dateIconIdentifier, a3);
  }

  return v7;
}

- (id)_initWithIconRecipeForDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationIconRecipe;
  char v6 = [(NCNotificationIconRecipe *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v7;
}

- (id)imagesForIconFormat:(int64_t)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  char v14 = 0;
  switch(self->_type)
  {
    case 0:
      id v5 = NCIconImageForApplicationIdentifierWithFormat(self->_applicationIdentifier, a3, 1);
      uint64_t v6 = NCIconImageForApplicationIdentifierWithFormat(self->_applicationIdentifier, a3, 2);
      goto LABEL_8;
    case 1:
      uint64_t v8 = [(BBSectionIcon *)self->_sectionIcon nc_imageForFormat:a3 scale:1 userInterfaceStyle:&v14 usedUserInterfaceStyle:self->_scale];
      id v5 = (void *)v8;
      if (v14)
      {
        uint64_t v6 = [(BBSectionIcon *)self->_sectionIcon nc_imageForFormat:a3 scale:2 userInterfaceStyle:&v14 usedUserInterfaceStyle:self->_scale];
LABEL_8:
        id v7 = (void *)v6;
        if (v5) {
          goto LABEL_9;
        }
      }
      else
      {
        id v7 = 0;
        if (v8)
        {
LABEL_9:
          int v9 = 0;
          unint64_t v10 = v5;
          goto LABEL_12;
        }
      }
LABEL_11:
      unint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      id v5 = 0;
      int v9 = 1;
LABEL_12:
      v15[0] = v10;
      objc_super v11 = v7;
      if (!v7)
      {
        objc_super v11 = [MEMORY[0x1E4F1CA98] null];
      }
      v15[1] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      if (v7)
      {
        if (!v9) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }

      if (v9) {
LABEL_16:
      }

LABEL_17:
      return v12;
    case 2:
      id v5 = NCDateIconImageForDateIconIdentifierWithFormat(a3, 1, self->_dateIconIdentifier);
      uint64_t v6 = NCDateIconImageForDateIconIdentifierWithFormat(a3, 2, self->_dateIconIdentifier);
      goto LABEL_8;
    case 3:
      id v5 = NCDateIconImageForDateWithFormat(a3, 1, self->_date);
      uint64_t v6 = NCDateIconImageForDateWithFormat(a3, 2, self->_date);
      goto LABEL_8;
    default:
      id v7 = 0;
      goto LABEL_11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateIconIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIcon, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end