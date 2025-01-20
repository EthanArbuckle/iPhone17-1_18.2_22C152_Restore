@interface UIDynamicProviderColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UIDynamicProviderColor)initWithProvider:(id)a3;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)description;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
@end

@implementation UIDynamicProviderColor

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [self->_provider hash];
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v5 = a3;
  v6 = +[UITraitCollection _currentTraitCollectionIfExists]();
  +[UITraitCollection setCurrentTraitCollection:v5];
  v7 = (*((void (**)(void))self->_provider + 2))();
  +[UITraitCollection setCurrentTraitCollection:v6];
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIColor.m", 5114, @"Dynamic color provider must return a non-nil color. %@ resolved with %@", self, v5 object file lineNumber description];
  }
  return v7;
}

- (UIDynamicProviderColor)initWithProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicProviderColor;
    id v5 = [(UIDynamicProviderColor *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      id provider = v5->_provider;
      v5->_id provider = (id)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIDynamicProviderColor *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_provider == self->_provider;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)replacementObjectForCoder:(id)a3
{
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = +[UIDevice currentDevice];
  unint64_t v4 = [v3 userInterfaceIdiom];

  char v32 = v4;
  BOOL v6 = v4 < 2 || v4 - 5 < 6;
  BOOL v37 = v6;
  v26 = +[UITraitCollection _currentTraitCollectionIfExists]();
  char v34 = 0;
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v36 = 0;
    uint64_t v9 = *((void *)&xmmword_186B83A90 + v7);
    char v27 = v8;
    if (v8) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = *((void *)&xmmword_186B83A90 + v7);
    }
    char v11 = 1;
    do
    {
      uint64_t v12 = 0;
      char v30 = v11;
      int v13 = 1;
      do
      {
        int v31 = v13;
        uint64_t v14 = 0;
        uint64_t v15 = *((void *)&xmmword_186B8FCC0 + v12);
        char v16 = 1;
        do
        {
          uint64_t v17 = *((void *)&xmmword_186B8FCC0 + v14);
          v18 = _UIThemeKeyFromTraitValues(v32, v9, v36 & 1, v15, v17, 0);
          self;
          v19 = _UITraitCollectionFromThemeKey(v18);
          +[UITraitCollection setCurrentTraitCollection:v19];
          v20 = (*((void (**)(void))self->_provider + 2))();
          if (!v20)
          {
            v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:self file:@"UIColor.m" lineNumber:5065 description:@"Dynamic color provider must return a non-nil color"];
          }
          v21 = _UIThemeKeyFromTraitValues(-1, v10, v36 & 1, v15, v17, 0);
          self;
          v22 = _UITraitCollectionFromThemeKey(v21);
          [v33 setObject:v20 forKey:v22];

          char v23 = v37 & v34 & v16;
          uint64_t v14 = 1;
          char v16 = 0;
        }
        while ((v23 & 1) != 0);
        uint64_t v12 = 1;
        int v13 = 0;
      }
      while ((v37 & v31 & 1) != 0);
      char v11 = 0;
      char v36 = 1;
    }
    while ((v30 & 1) != 0);
    char v8 = 0;
    char v34 = 1;
    uint64_t v7 = 1;
  }
  while ((v27 & 1) != 0);
  +[UITraitCollection setCurrentTraitCollection:v26];
  v24 = +[UIColor _dynamicColorWithColorsByTraitCollection:v33];

  return v24;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  BOOL v6 = _Block_copy(self->_provider);
  v7 = [v3 stringWithFormat:@"<%@: %p id provider = %@>", v5, self, v6];;

  return v7;
}

@end