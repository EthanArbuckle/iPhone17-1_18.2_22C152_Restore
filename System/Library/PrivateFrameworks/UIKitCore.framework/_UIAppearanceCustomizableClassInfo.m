@interface _UIAppearanceCustomizableClassInfo
+ (id)_cachedClassInfoForViewClass:(Class)a3 withGuideClass:(Class)a4;
- (BOOL)isEqual:(id)a3;
- (Class)_customizableViewClass;
- (Class)_guideClass;
- (NSString)_classReferenceKey;
- (id)_superClassInfo;
- (id)description;
- (unint64_t)_hash;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UIAppearanceCustomizableClassInfo

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  classReferenceKey = self->_classReferenceKey;
  uint64_t v6 = [a3 _classReferenceKey];
  return [(NSString *)classReferenceKey isEqualToString:v6];
}

- (NSString)_classReferenceKey
{
  return self->_classReferenceKey;
}

- (Class)_customizableViewClass
{
  return self->_customizableViewClass;
}

- (Class)_guideClass
{
  Class result = self->_guideClass;
  if (!result) {
    return self->_customizableViewClass;
  }
  return result;
}

- (id)_superClassInfo
{
  guideClass = self->_guideClass;
  if (guideClass && !self->_isGuideClassRoot)
  {
    Class customizableViewClass = self->_customizableViewClass;
    Class Superclass = class_getSuperclass(guideClass);
    Class v5 = customizableViewClass;
  }
  else
  {
    if (self->_isCustomizableViewClassRoot) {
      return 0;
    }
    Class v5 = class_getSuperclass(self->_customizableViewClass);
    Class Superclass = self->_guideClass;
  }
  return +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:v5 withGuideClass:Superclass];
}

+ (id)_cachedClassInfoForViewClass:(Class)a3 withGuideClass:(Class)a4
{
  v7 = (void *)qword_1EB260D80;
  if (!qword_1EB260D80)
  {
    qword_1EB260D80 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:0];
    qword_1EB260D88 = @"no guide class";
    v7 = (void *)qword_1EB260D80;
  }
  v8 = (void *)[v7 objectForKey:a3];
  if (!v8)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:0];
    [(id)qword_1EB260D80 setObject:v8 forKey:a3];
  }
  if (a4) {
    Class v9 = a4;
  }
  else {
    Class v9 = (Class)qword_1EB260D88;
  }
  v10 = (void *)[v8 objectForKey:v9];
  if (!v10)
  {
    v10 = objc_alloc_init((Class)a1);
    v10[4] = a3;
    v10[5] = a4;
    if (a4)
    {
      id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:a4];
      BOOL v12 = v11 == _UIKitBundle();
    }
    else
    {
      BOOL v12 = 0;
    }
    *((unsigned char *)v10 + 8) = v12;
    if ((Class)objc_opt_class() == a3)
    {
      BOOL v14 = 1;
    }
    else
    {
      Class Superclass = class_getSuperclass(a3);
      BOOL v14 = Superclass == (Class)objc_opt_class();
    }
    *((unsigned char *)v10 + 9) = v14;
    if (a4)
    {
      v15 = NSString;
      v16 = NSStringFromClass(a3);
      v17 = (NSString *)[v15 stringWithFormat:@"%@-%@", v16, NSStringFromClass(a4)];
    }
    else
    {
      v17 = NSStringFromClass(a3);
    }
    v18 = v17;
    v10[2] = v17;
    v10[3] = [(NSString *)v18 hash];
    [v8 setObject:v10 forKey:v9];
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = NSStringFromClass(self->_customizableViewClass);
  guideClass = self->_guideClass;
  if (guideClass) {
    uint64_t v6 = (__CFString *)[NSString stringWithFormat:@", Guide class: %@>", NSStringFromClass(guideClass)];
  }
  else {
    uint64_t v6 = @">";
  }
  return (id)[v3 stringWithFormat:@"<Customizable class: %@%@", v4, v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAppearanceCustomizableClassInfo;
  [(_UIAppearanceCustomizableClassInfo *)&v3 dealloc];
}

- (unint64_t)_hash
{
  return self->_hash;
}

@end