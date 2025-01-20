@interface _UITraitBasedAppearance
+ (BOOL)_hasAnyCustomizations;
+ (BOOL)_hasCustomizationsForTraitCollection:(id)a3 class:(Class)a4 guideClass:(Class)a5;
+ (id)_appearanceForTraitCollection:(id)a3 forClass:(Class)a4 withContainerList:(id)a5;
+ (void)_setHasAnyCustomizations;
- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3;
- (id)_traitCollection;
- (void)_invalidateAppearanceInWindow:(id)a3;
- (void)dealloc;
@end

@implementation _UITraitBasedAppearance

+ (BOOL)_hasAnyCustomizations
{
  return _didCreateTraitBasedAppearanceNode;
}

+ (void)_setHasAnyCustomizations
{
  _didCreateTraitBasedAppearanceNode = 1;
}

+ (BOOL)_hasCustomizationsForTraitCollection:(id)a3 class:(Class)a4 guideClass:(Class)a5
{
  int v8 = [a1 _hasAnyCustomizations];
  if (v8)
  {
    v9 = (void *)[(id)objc_opt_class() _rootAppearancesNode];
    v10 = (void *)existingAppearancesNodeInNodeForClass(v9, +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:a4 withGuideClass:a5]);
    LOBYTE(v8) = _recursiveExamineAppearancesForTraitCollections(v10, (uint64_t)a3);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UITraitBasedAppearance;
  [(_UIAppearance *)&v3 dealloc];
}

+ (id)_appearanceForTraitCollection:(id)a3 forClass:(Class)a4 withContainerList:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v10 = -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)a3);
    if (v10)
    {
      v15 = v10;
      _UIIsPrivateMainBundle();
      if (dyld_program_sdk_at_least())
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIAppearance.m", 1937, @"Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@", objc_msgSend(v15, "_traitsDescription"));
      }
      else if (os_variant_has_internal_diagnostics())
      {
        v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = [v15 _traitsDescription];
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
        }
      }
      else
      {
        v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_appearanceForTraitCollection_forClass_withContainerList____s_category)+ 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = [v15 _traitsDescription];
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Invalid trait collection for appearance customization, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
        }
      }
    }
    id v11 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:a4 withGuideClass:0];
    v12 = (void *)[a1 _appearanceNodeForClassInfo:v11 containerList:a5];
    v13 = (void *)[v12 objectForKey:a3];
    if (!v13)
    {
      v13 = (void *)[a1 _newAppearanceWithClassInfo:v11 containerList:a5];
      v13[5] = a3;
      [v12 setObject:v13 forKey:a3];
      [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UIAppearanceHasExtendedAppearancesKey"];
      [a1 _setHasAnyCustomizations];
    }
    return v13;
  }
  else
  {
    return +[_UIAppearance _appearanceForClass:a4 withContainerList:a5];
  }
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 _appearanceTraitCollection];
  traitCollection = self->_traitCollection;
  return -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:](v5, (uint64_t)traitCollection);
}

- (void)_invalidateAppearanceInWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITraitBasedAppearance;
  -[_UIAppearance _invalidateAppearanceInWindow:](&v5, sel__invalidateAppearanceInWindow_);
  objc_msgSend(a3, "_invalidateAppearanceForTraitCollection:", -[_UITraitBasedAppearance _traitCollection](self, "_traitCollection"));
}

- (id)_traitCollection
{
  return self->_traitCollection;
}

@end