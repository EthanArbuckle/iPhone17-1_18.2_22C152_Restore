@interface _UITraitOverrides
+ (BOOL)supportsSecureCoding;
- (BOOL)_containsTraitToken:(id)a3;
- (BOOL)containsTrait:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (NSObject)_environmentWrapper;
- (NSString)description;
- (NSString)preferredContentSizeCategory;
- (NSString)typesettingLanguage;
- (UIColor)_tintColor;
- (_UITraitOverrides)initWithCoder:(id)a3;
- (double)_typesettingLanguageAwareLineHeightRatio;
- (double)_valueForCGFloatTraitToken:(id)a3;
- (double)displayScale;
- (double)valueForCGFloatTrait:(Class)a3;
- (id)_description;
- (id)_objectForTraitToken:(id)a3;
- (id)_overridesDescriptionMatching:(int)a3 includingInternalOverrides:(char)a4 isNested:;
- (id)_swiftImplCopy;
- (id)_traitCollectionByApplyingAllOverridesToTraitCollection:(void *)a3 withOverrides:(void *)a4 defaultValueOverrides:;
- (id)_traitOverridesDescriptionMatching:(id)a1;
- (id)objectForTrait:(Class)a3;
- (int64_t)_valueForNSIntegerTraitToken:(id)a3;
- (int64_t)accessibilityContrast;
- (int64_t)activeAppearance;
- (int64_t)displayGamut;
- (int64_t)forceTouchCapability;
- (int64_t)horizontalSizeClass;
- (int64_t)imageDynamicRange;
- (int64_t)layoutDirection;
- (int64_t)legibilityWeight;
- (int64_t)listEnvironment;
- (int64_t)sceneCaptureState;
- (int64_t)toolbarItemPresentationSize;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceLevel;
- (int64_t)userInterfaceStyle;
- (int64_t)valueForNSIntegerTrait:(Class)a3;
- (int64_t)verticalSizeClass;
- (uint64_t)_isEmpty;
- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3;
- (unint64_t)hash;
- (unint64_t)valueForNSUIntegerTrait:(Class)a3;
- (void)_overridesAppliedAfter;
- (void)_overridesAppliedBefore;
- (void)_removeTraitToken:(id)a3;
- (void)_replaceOverrideTraitCollection:(uint64_t)a1;
- (void)_replaceWithOverrides:(id)a3;
- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4;
- (void)_setDelegate:(uint64_t)a1;
- (void)_setEnvironmentWrapper:(id)a3;
- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4;
- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4;
- (void)_setObject:(id)a3 forTraitToken:(id)a4;
- (void)_setOverrideTraitCollection:(void *)a3 defaultValueOverrides:;
- (void)_setTintColor:(id)a3;
- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3;
- (void)_traitCollectionByApplyingOverridesToTraitCollection:(void *)a1;
- (void)_traitOverridesDidChange:(id)a3;
- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)initWithDelegate:(void *)a1;
- (void)removeTrait:(Class)a3;
- (void)setAccessibilityContrast:(int64_t)a3;
- (void)setActiveAppearance:(int64_t)a3;
- (void)setCGFloatValue:(double)a3 forTrait:(Class)a4;
- (void)setDisplayGamut:(int64_t)a3;
- (void)setDisplayScale:(double)a3;
- (void)setForceTouchCapability:(int64_t)a3;
- (void)setHorizontalSizeClass:(int64_t)a3;
- (void)setImageDynamicRange:(int64_t)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLegibilityWeight:(int64_t)a3;
- (void)setListEnvironment:(int64_t)a3;
- (void)setNSIntegerValue:(int64_t)a3 forTrait:(Class)a4;
- (void)setNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4;
- (void)setObject:(id)a3 forTrait:(Class)a4;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSceneCaptureState:(int64_t)a3;
- (void)setToolbarItemPresentationSize:(int64_t)a3;
- (void)setTypesettingLanguage:(id)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setUserInterfaceLevel:(int64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVerticalSizeClass:(int64_t)a3;
@end

@implementation _UITraitOverrides

- (void)_traitCollectionByApplyingOverridesToTraitCollection:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__traitCollectionByApplyingOverridesToTraitCollection_, a1, @"_UITraitOverrides.m", 174, @"Invalid parameter not satisfying: %@", @"baseTraitCollection != nil" object file lineNumber description];
    }
    -[_UITraitOverrides _traitCollectionByApplyingAllOverridesToTraitCollection:withOverrides:defaultValueOverrides:]((uint64_t)a1, v4, a1[1], a1[2]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)_traitCollectionByApplyingAllOverridesToTraitCollection:(void *)a3 withOverrides:(void *)a4 defaultValueOverrides:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      uint64_t v12 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v11, v10);

      id v10 = (id)v12;
    }
    v13 = -[UITraitCollection _traitCollectionByApplyingOverrides:defaultValueOverrides:](v10, (uint64_t)v8, (uint64_t)v9);

    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      uint64_t v15 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v14, v13);

      v13 = (void *)v15;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setNSIntegerValue:(int64_t)a3 forTrait:(Class)a4
{
  +[UITraitCollection _traitTokenForNSIntegerTrait:]((uint64_t)UITraitCollection, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(_UITraitOverrides *)self _setNSIntegerValue:a3 forTraitToken:v6];
}

- (void)setListEnvironment:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  [(_UITraitOverrides *)self setNSIntegerValue:a3 forTrait:v5];
}

- (void)_overridesAppliedBefore
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[5];
    if (!v3)
    {
      v4 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
      uint64_t v5 = (void *)v2[5];
      v2[5] = v4;

      id v3 = (void *)v2[5];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_removeTraitToken:(id)a3
{
  CFNumberRef v4 = (const __CFNumber *)a3;
  defaultValueOverrides = self->_defaultValueOverrides;
  CFNumberRef v13 = v4;
  if (defaultValueOverrides
    && (unint64_t v6 = _UIGetTraitTokenValue(v4),
        _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v6)))
  {
    uint64_t v7 = -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v13);
    id v8 = (_UITraitTokenSet *)v7;
    overrides = self->_overrides;
  }
  else
  {
    BOOL v10 = [(UITraitCollection *)self->_overrides _isTraitTokenSpecified:v13];
    CFNumberRef v11 = v13;
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v7 = [(UITraitCollection *)self->_overrides _traitCollectionByRemovingTraitToken:v13];
    overrides = (UITraitCollection *)v7;
    id v8 = self->_defaultValueOverrides;
  }
  uint64_t v12 = (void *)v7;
  -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, overrides, v8);

  CFNumberRef v11 = v13;
LABEL_7:
}

- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  CFNumberRef v16 = (const __CFNumber *)a4;
  unint64_t v6 = self->_overrides;
  uint64_t v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    unint64_t v9 = _UIGetTraitTokenValue(v16);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  BOOL v10 = +[UITraitCollection _emptyTraitCollection]();
  uint64_t v11 = [v10 _valueForNSIntegerTraitToken:v16];

  if (defaultValueOverrides && v11 != a3)
  {
    uint64_t v12 = -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v16);
LABEL_11:
    uint64_t v14 = (_UITraitTokenSet *)v12;

    uint64_t v7 = v14;
    goto LABEL_12;
  }
  if (v11 == a3) {
    char v13 = (char)defaultValueOverrides;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    uint64_t v12 = -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v16);
    goto LABEL_11;
  }
LABEL_12:
  if ([(UITraitCollection *)self->_overrides _valueForNSIntegerTraitToken:v16] != a3)
  {
    uint64_t v15 = [(UITraitCollection *)self->_overrides _traitCollectionByReplacingNSIntegerValue:a3 forTraitToken:v16];

    unint64_t v6 = (UITraitCollection *)v15;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides) {
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);
  }
}

- (void)initWithDelegate:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_UITraitOverrides;
    CFNumberRef v4 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v4;
    if (v4)
    {
      -[_UITraitOverrides _setDelegate:]((uint64_t)v4, v3);
      uint64_t v5 = +[UITraitCollection _emptyTraitCollection]();
      unint64_t v6 = (void *)a1[1];
      a1[1] = v5;

      uint64_t v7 = +[_UITraitTokenSet emptySet]();
      id v8 = (void *)a1[2];
      a1[2] = v7;
    }
  }

  return a1;
}

- (void)_setDelegate:(uint64_t)a1
{
  id obj = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 32), obj);
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a1 + 24) & 0xFE | objc_opt_respondsToSelector() & 1;
    }
  }
}

- (void)_traitOverridesDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained _traitOverridesDidChange:self];
}

- (void)_setOverrideTraitCollection:(void *)a3 defaultValueOverrides:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (*(unsigned char *)(a1 + 24))
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __71___UITraitOverrides__setOverrideTraitCollection_defaultValueOverrides___block_invoke;
      v9[3] = &unk_1E5305A58;
      v9[4] = a1;
      id v10 = v6;
      id v11 = v7;
      [WeakRetained _traitOverridesWillChange:a1 withApplicator:v9];
    }
    objc_storeStrong((id *)(a1 + 8), a2);
    objc_storeStrong((id *)(a1 + 16), a3);
    [WeakRetained _traitOverridesDidChange:a1];
  }
}

- (void)_traitOverridesWillChange:(id)a3 withApplicator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62___UITraitOverrides__traitOverridesWillChange_withApplicator___block_invoke;
    v9[3] = &unk_1E5305A30;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    [WeakRetained _traitOverridesWillChange:self withApplicator:v9];
  }
}

- (uint64_t)_isEmpty
{
  if (!a1 || a1[5] && !-[_UITraitOverrides _isEmpty]()) {
    return 0;
  }
  if (a1[6] && !-[_UITraitOverrides _isEmpty]()) {
    return 0;
  }
  uint64_t v2 = a1[2];
  if (v2)
  {
    if (_UITraitTokenSetCount(v2 + 16)) {
      return 0;
    }
  }
  uint64_t v5 = (void *)a1[1];
  id v6 = +[UITraitCollection _emptyTraitCollection]();
  id v7 = v5;
  id v8 = v6;
  unint64_t v9 = v8;
  if (v7 == v8)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    if (v7 && v8) {
      uint64_t v3 = [v7 isEqual:v8];
    }
  }

  return v3;
}

- (void)_overridesAppliedAfter
{
  if (a1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = (void *)a1[6];
    if (!v3)
    {
      CFNumberRef v4 = -[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], a1);
      uint64_t v5 = (void *)v2[6];
      v2[6] = v4;

      uint64_t v3 = (void *)v2[6];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)containsTrait:(Class)a3
{
  CFNumberRef v4 = +[UITraitCollection _traitTokenOrPlaceholderForTrait:]((uint64_t)UITraitCollection, a3);
  BOOL v5 = !+[UITraitCollection _isPlaceholderTraitToken:v4]
    && [(_UITraitOverrides *)self _containsTraitToken:v4];

  return v5;
}

- (void)removeTrait:(Class)a3
{
  +[UITraitCollection _traitTokenOrPlaceholderForTrait:]((uint64_t)UITraitCollection, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!+[UITraitCollection _isPlaceholderTraitToken:](UITraitCollection, "_isPlaceholderTraitToken:")) {
    [(_UITraitOverrides *)self _removeTraitToken:v4];
  }
}

- (int64_t)_valueForNSIntegerTraitToken:(id)a3
{
  CFNumberRef v5 = (const __CFNumber *)a3;
  if (![(_UITraitOverrides *)self _containsTraitToken:v5])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v9 = +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    [v8 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 270, @"Can't return value for trait %@ that has no override", v9 object file lineNumber description];
  }
  int64_t v6 = [(UITraitCollection *)self->_overrides _valueForNSIntegerTraitToken:v5];

  return v6;
}

- (BOOL)_containsTraitToken:(id)a3
{
  CFNumberRef v4 = (const __CFNumber *)a3;
  CFNumberRef v5 = v4;
  defaultValueOverrides = self->_defaultValueOverrides;
  BOOL v8 = defaultValueOverrides
    && (unint64_t v7 = _UIGetTraitTokenValue(v4),
        (_UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v7) & 1) != 0)
    || [(UITraitCollection *)self->_overrides _isTraitTokenSpecified:v5];

  return v8;
}

- (int64_t)userInterfaceStyle
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5A48];
}

- (void)setObject:(id)a3 forTrait:(Class)a4
{
  id v6 = a3;
  +[UITraitCollection _traitTokenForObjectTrait:]((uint64_t)UITraitCollection, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(_UITraitOverrides *)self _setObject:v6 forTraitToken:v7];
}

- (void)_setObject:(id)a3 forTraitToken:(id)a4
{
  id v6 = a3;
  CFNumberRef v7 = (const __CFNumber *)a4;
  BOOL v8 = self->_overrides;
  unint64_t v9 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    unint64_t v11 = _UIGetTraitTokenValue(v7);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v11);
  }
  id v12 = +[UITraitCollection _emptyTraitCollection]();
  id v13 = [v12 _objectForTraitToken:v7];
  id v14 = v6;
  uint64_t v15 = v14;
  if (v13 == v14)
  {
    int v16 = 1;
  }
  else
  {
    int v16 = 0;
    if (v14 && v13) {
      int v16 = [v13 isEqual:v14];
    }
  }

  if (!defaultValueOverrides || (v16 & 1) != 0)
  {
    if ((defaultValueOverrides | v16 ^ 1)) {
      goto LABEL_14;
    }
    uint64_t v17 = -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v7);
  }
  else
  {
    uint64_t v17 = -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v7);
  }
  v18 = (_UITraitTokenSet *)v17;

  unint64_t v9 = v18;
LABEL_14:
  v19 = [(UITraitCollection *)self->_overrides _objectForTraitToken:v7];
  v20 = v15;
  v24 = v20;
  if (v19 == v20)
  {

    v22 = v24;
  }
  else
  {
    if (v20 && v19)
    {
      BOOL v21 = [(UITraitCollection *)v19 isEqual:v20];

      if (v21) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v23 = [(UITraitCollection *)self->_overrides _traitCollectionByReplacingObject:v24 forTraitToken:v7];
    v22 = v8;
    BOOL v8 = (UITraitCollection *)v23;
  }

LABEL_23:
  if (v8 != self->_overrides || v9 != self->_defaultValueOverrides) {
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v8, v9);
  }
}

- (void)setCGFloatValue:(double)a3 forTrait:(Class)a4
{
  +[UITraitCollection _traitTokenForCGFloatTrait:]((uint64_t)UITraitCollection, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(_UITraitOverrides *)self _setCGFloatValue:v6 forTraitToken:a3];
}

- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  CFNumberRef v18 = (const __CFNumber *)a4;
  id v6 = self->_overrides;
  CFNumberRef v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    unint64_t v9 = _UIGetTraitTokenValue(v18);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  id v10 = +[UITraitCollection _emptyTraitCollection]();
  [v10 _valueForCGFloatTraitToken:v18];
  double v12 = v11;

  if (defaultValueOverrides && v12 != a3)
  {
    uint64_t v13 = -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v18);
LABEL_11:
    uint64_t v15 = (_UITraitTokenSet *)v13;

    CFNumberRef v7 = v15;
    goto LABEL_12;
  }
  if (v12 == a3) {
    char v14 = (char)defaultValueOverrides;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    uint64_t v13 = -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v18);
    goto LABEL_11;
  }
LABEL_12:
  [(UITraitCollection *)self->_overrides _valueForCGFloatTraitToken:v18];
  if (v16 != a3)
  {
    uint64_t v17 = [(UITraitCollection *)self->_overrides _traitCollectionByReplacingCGFloatValue:v18 forTraitToken:a3];

    id v6 = (UITraitCollection *)v17;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides) {
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridesAppliedAfter, 0);
  objc_storeStrong((id *)&self->_overridesAppliedBefore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultValueOverrides, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
}

- (void)setImageDynamicRange:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  [(_UITraitOverrides *)self setNSIntegerValue:a3 forTrait:v5];
}

- (void)_replaceOverrideTraitCollection:(uint64_t)a1
{
  id v3 = a2;
  CFNumberRef v4 = v3;
  if (!a1) {
    goto LABEL_8;
  }
  if (!v3)
  {
    CFNumberRef v4 = +[UITraitCollection _emptyTraitCollection]();
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 && _UITraitTokenSetCount(v5 + 16)) {
    goto LABEL_6;
  }
  id v7 = *(id *)(a1 + 8);
  id v8 = v4;
  if (v7 == v8)
  {
    id v12 = v8;

LABEL_8:
    id v6 = v4;
    goto LABEL_9;
  }
  if (!v8 || !v7)
  {

LABEL_6:
    +[_UITraitTokenSet emptySet]();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:](a1, v4, v10);

    goto LABEL_8;
  }
  id v11 = v8;
  char v9 = [v7 isEqual:v8];

  id v6 = v11;
  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_9:
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
}

- (id)_swiftImplCopy
{
  id v3 = (id *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], 0);
  CFNumberRef v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 1, self->_overrides);
    objc_storeStrong(v4 + 2, self->_defaultValueOverrides);
  }
  return v4;
}

- (void)_replaceWithOverrides:(id)a3
{
  uint64_t v5 = (_UITraitOverrides *)a3;
  if (self != v5)
  {
    double v16 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 153, @"Unexpected overrides class: %@", v16 object file lineNumber description];
    }
    id v6 = v16;
    id v7 = v6[1];
    id v8 = self->_overrides;
    char v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      id v10 = v9;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6[1], v6[2]);
LABEL_18:

        uint64_t v5 = v16;
        goto LABEL_19;
      }
      BOOL v11 = [(UITraitCollection *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_16;
      }
    }
    id v12 = v6[2];
    id v8 = self->_defaultValueOverrides;
    uint64_t v13 = v12;
    if (v8 == v13)
    {

      goto LABEL_18;
    }
    id v10 = v13;
    if (v8 && v13)
    {
      BOOL v14 = [(UITraitCollection *)v8 isEqual:v13];

      if (v14) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_19:
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UITraitOverrides)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UITraitOverrides;
  id v5 = [(_UITraitOverrides *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overrides"];
    id v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    if (!*((void *)v5 + 1))
    {
      uint64_t v8 = +[UITraitCollection _emptyTraitCollection]();
      char v9 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v8;
    }
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"defaultValueOverrides"];

    if (v13)
    {
      uint64_t v14 = -[_UITraitTokenSet initWithNSSetRepresentation:]([_UITraitTokenSet alloc], v13);
    }
    else
    {
      uint64_t v14 = +[_UITraitTokenSet emptySet]();
    }
    uint64_t v15 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overridesAppliedBefore"];
    uint64_t v17 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v16;

    -[_UITraitOverrides _setDelegate:](*((void *)v5 + 5), v5);
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overridesAppliedAfter"];
    v19 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v18;

    -[_UITraitOverrides _setDelegate:](*((void *)v5 + 6), v5);
  }

  return (_UITraitOverrides *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  overrides = self->_overrides;
  id v5 = +[UITraitCollection _emptyTraitCollection]();
  uint64_t v6 = overrides;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {

LABEL_10:
      [v16 encodeObject:self->_overrides forKey:@"overrides"];
      goto LABEL_11;
    }
    BOOL v10 = [(UITraitCollection *)v6 isEqual:v7];

    if (!v10) {
      goto LABEL_10;
    }
  }
LABEL_11:
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides && _UITraitTokenSetCount((uint64_t)&defaultValueOverrides->_storage))
  {
    id v12 = -[_UITraitTokenSet NSSetRepresentation]((uint64_t)self->_defaultValueOverrides);
    [v16 encodeObject:v12 forKey:@"defaultValueOverrides"];
  }
  overridesAppliedBefore = self->_overridesAppliedBefore;
  if (overridesAppliedBefore) {
    [v16 encodeObject:overridesAppliedBefore forKey:@"overridesAppliedBefore"];
  }
  overridesAppliedAfter = self->_overridesAppliedAfter;
  uint64_t v15 = v16;
  if (overridesAppliedAfter)
  {
    [v16 encodeObject:overridesAppliedAfter forKey:@"overridesAppliedAfter"];
    uint64_t v15 = v16;
  }
}

- (double)valueForCGFloatTrait:(Class)a3
{
  id v4 = +[UITraitCollection _traitTokenForCGFloatTrait:]((uint64_t)UITraitCollection, a3);
  [(_UITraitOverrides *)self _valueForCGFloatTraitToken:v4];
  double v6 = v5;

  return v6;
}

- (double)_valueForCGFloatTraitToken:(id)a3
{
  CFNumberRef v5 = (const __CFNumber *)a3;
  if (![(_UITraitOverrides *)self _containsTraitToken:v5])
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v10 = +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    [v9 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 236, @"Can't return value for trait %@ that has no override", v10 object file lineNumber description];
  }
  [(UITraitCollection *)self->_overrides _valueForCGFloatTraitToken:v5];
  double v7 = v6;

  return v7;
}

- (int64_t)valueForNSIntegerTrait:(Class)a3
{
  id v4 = +[UITraitCollection _traitTokenForNSIntegerTrait:]((uint64_t)UITraitCollection, a3);
  int64_t v5 = [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:v4];

  return v5;
}

- (unint64_t)valueForNSUIntegerTrait:(Class)a3
{
  id v4 = +[UITraitCollection _traitTokenForNSUIntegerTrait:]((uint64_t)UITraitCollection, a3);
  unint64_t v5 = [(_UITraitOverrides *)self _valueForNSUIntegerTraitToken:v4];

  return v5;
}

- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3
{
  CFNumberRef v5 = (const __CFNumber *)a3;
  if (![(_UITraitOverrides *)self _containsTraitToken:v5])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    [v8 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 306, @"Can't return value for trait %@ that has no override", v9 object file lineNumber description];
  }
  unint64_t v6 = [(UITraitCollection *)self->_overrides _valueForNSUIntegerTraitToken:v5];

  return v6;
}

- (void)setNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  +[UITraitCollection _traitTokenForNSUIntegerTrait:]((uint64_t)UITraitCollection, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(_UITraitOverrides *)self _setNSUIntegerValue:a3 forTraitToken:v6];
}

- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  CFNumberRef v16 = (const __CFNumber *)a4;
  id v6 = self->_overrides;
  double v7 = self->_defaultValueOverrides;
  defaultValueOverrides = self->_defaultValueOverrides;
  if (defaultValueOverrides)
  {
    unint64_t v9 = _UIGetTraitTokenValue(v16);
    LODWORD(defaultValueOverrides) = _UITraitTokenSetContains((uint16x8_t **)&defaultValueOverrides->_storage, v9);
  }
  BOOL v10 = +[UITraitCollection _emptyTraitCollection]();
  uint64_t v11 = [v10 _valueForNSUIntegerTraitToken:v16];

  if (defaultValueOverrides && v11 != a3)
  {
    uint64_t v12 = -[_UITraitTokenSet setByRemovingTraitToken:](self->_defaultValueOverrides, v16);
LABEL_11:
    uint64_t v14 = (_UITraitTokenSet *)v12;

    double v7 = v14;
    goto LABEL_12;
  }
  if (v11 == a3) {
    char v13 = (char)defaultValueOverrides;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    uint64_t v12 = -[_UITraitTokenSet setByAddingTraitToken:](self->_defaultValueOverrides, v16);
    goto LABEL_11;
  }
LABEL_12:
  if ([(UITraitCollection *)self->_overrides _valueForNSUIntegerTraitToken:v16] != a3)
  {
    uint64_t v15 = [(UITraitCollection *)self->_overrides _traitCollectionByReplacingNSUIntegerValue:a3 forTraitToken:v16];

    id v6 = (UITraitCollection *)v15;
  }
  if (v6 != self->_overrides || v7 != self->_defaultValueOverrides) {
    -[_UITraitOverrides _setOverrideTraitCollection:defaultValueOverrides:]((uint64_t)self, v6, v7);
  }
}

- (id)objectForTrait:(Class)a3
{
  id v4 = +[UITraitCollection _traitTokenForObjectTrait:]((uint64_t)UITraitCollection, a3);
  CFNumberRef v5 = [(_UITraitOverrides *)self _objectForTraitToken:v4];

  return v5;
}

- (id)_objectForTraitToken:(id)a3
{
  CFNumberRef v5 = (const __CFNumber *)a3;
  if (![(_UITraitOverrides *)self _containsTraitToken:v5])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v9 = +[UITraitCollection _nameForTraitToken:]((uint64_t)UITraitCollection, v5);
    [v8 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 342, @"Can't return value for trait %@ that has no override", v9 object file lineNumber description];
  }
  id v6 = [(UITraitCollection *)self->_overrides _objectForTraitToken:v5];

  return v6;
}

- (NSObject)_environmentWrapper
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  CFNumberRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 372, @"%@ does not support -%@", v6, v7 object file lineNumber description];

  return 0;
}

- (void)_setEnvironmentWrapper:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  CFNumberRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 377, @"%@ does not support -%@", v6, v7 object file lineNumber description];
}

- (UIColor)_tintColor
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  CFNumberRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 381, @"%@ does not support -%@", v6, v7 object file lineNumber description];

  return 0;
}

- (void)_setTintColor:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  CFNumberRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  double v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"_UITraitOverrides.m", 386, @"%@ does not support -%@", v6, v7 object file lineNumber description];
}

- (int64_t)userInterfaceIdiom
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5A30];
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
}

- (int64_t)layoutDirection
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5A60];
}

- (void)setLayoutDirection:(int64_t)a3
{
}

- (double)displayScale
{
  [(_UITraitOverrides *)self _valueForCGFloatTraitToken:0x1ED3F5A78];
  return result;
}

- (void)setDisplayScale:(double)a3
{
}

- (int64_t)horizontalSizeClass
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5A90];
}

- (int64_t)verticalSizeClass
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5AA8];
}

- (void)setVerticalSizeClass:(int64_t)a3
{
}

- (int64_t)forceTouchCapability
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5AC0];
}

- (void)setForceTouchCapability:(int64_t)a3
{
}

- (NSString)preferredContentSizeCategory
{
  return (NSString *)[(_UITraitOverrides *)self _objectForTraitToken:0x1ED3F5AD8];
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (int64_t)displayGamut
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5AF0];
}

- (void)setDisplayGamut:(int64_t)a3
{
}

- (int64_t)accessibilityContrast
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5B08];
}

- (void)setAccessibilityContrast:(int64_t)a3
{
}

- (int64_t)userInterfaceLevel
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5B20];
}

- (int64_t)legibilityWeight
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5B38];
}

- (void)setLegibilityWeight:(int64_t)a3
{
}

- (int64_t)activeAppearance
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5B50];
}

- (void)setActiveAppearance:(int64_t)a3
{
}

- (int64_t)toolbarItemPresentationSize
{
  return [(_UITraitOverrides *)self _valueForNSIntegerTraitToken:0x1ED3F5B68];
}

- (void)setToolbarItemPresentationSize:(int64_t)a3
{
}

- (NSString)typesettingLanguage
{
  id v3 = self;
  id v4 = [(_UITraitOverrides *)self objectForTrait:v3];

  return (NSString *)v4;
}

- (void)setTypesettingLanguage:(id)a3
{
  id v5 = (id)[a3 copy];
  id v4 = self;
  [(_UITraitOverrides *)self setObject:v5 forTrait:v4];
}

- (int64_t)imageDynamicRange
{
  uint64_t v3 = objc_opt_class();
  return [(_UITraitOverrides *)self valueForNSIntegerTrait:v3];
}

- (int64_t)sceneCaptureState
{
  uint64_t v3 = objc_opt_class();
  return [(_UITraitOverrides *)self valueForNSIntegerTrait:v3];
}

- (void)setSceneCaptureState:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();
  [(_UITraitOverrides *)self setNSIntegerValue:a3 forTrait:v5];
}

- (int64_t)listEnvironment
{
  uint64_t v3 = objc_opt_class();
  return [(_UITraitOverrides *)self valueForNSIntegerTrait:v3];
}

- (double)_typesettingLanguageAwareLineHeightRatio
{
  uint64_t v3 = self;
  [(_UITraitOverrides *)self valueForCGFloatTrait:v3];
  double v5 = v4;

  return v5;
}

- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(_UITraitOverrides *)self setCGFloatValue:v5 forTrait:a3];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_UITraitOverrides *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        if (![(UITraitCollection *)self->_overrides isEqual:v6->_overrides]
          || ![(_UITraitTokenSet *)self->_defaultValueOverrides isEqual:v6->_defaultValueOverrides])
        {
          goto LABEL_29;
        }
        overridesAppliedBefore = v6->_overridesAppliedBefore;
        id v8 = self->_overridesAppliedBefore;
        unint64_t v9 = overridesAppliedBefore;
        BOOL v10 = v9;
        if (v8)
        {
          int v11 = -[_UITraitOverrides _isEmpty](v8) ^ 1;
          if (v10)
          {
LABEL_8:
            int v12 = -[_UITraitOverrides _isEmpty](v10) ^ 1;
            goto LABEL_13;
          }
        }
        else
        {
          int v11 = 0;
          if (v9) {
            goto LABEL_8;
          }
        }
        int v12 = 0;
LABEL_13:
        if ((v11 | v12))
        {
          if (v8)
          {
            BOOL v14 = [(_UITraitOverrides *)v8 isEqual:v10];

            if (!v14) {
              goto LABEL_29;
            }
          }
          else
          {
            BOOL v22 = [(_UITraitOverrides *)v10 isEqual:0];

            if (!v22)
            {
LABEL_29:
              char v13 = 0;
LABEL_30:

              goto LABEL_31;
            }
          }
        }
        else
        {
        }
        overridesAppliedAfter = v6->_overridesAppliedAfter;
        CFNumberRef v16 = self->_overridesAppliedAfter;
        uint64_t v17 = overridesAppliedAfter;
        if (v16) {
          int v18 = -[_UITraitOverrides _isEmpty](v16) ^ 1;
        }
        else {
          int v18 = 0;
        }
        if (v17) {
          int v19 = -[_UITraitOverrides _isEmpty](v17) ^ 1;
        }
        else {
          int v19 = 0;
        }
        if ((v18 | v19) == 1)
        {
          if (v16)
          {
            v20 = v16;
            objc_super v21 = v17;
          }
          else
          {
            v20 = v17;
            objc_super v21 = 0;
          }
          char v13 = [(_UITraitOverrides *)v20 isEqual:v21];
        }
        else
        {
          char v13 = 1;
        }

        goto LABEL_30;
      }
    }
    char v13 = 0;
  }
LABEL_31:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UITraitCollection *)self->_overrides hash];
  return [(_UITraitTokenSet *)self->_defaultValueOverrides hash] ^ v3;
}

- (id)_overridesDescriptionMatching:(int)a3 includingInternalOverrides:(char)a4 isNested:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (!a1)
  {
    id v8 = 0;
    goto LABEL_54;
  }
  id v8 = [MEMORY[0x1E4F28E78] string];
  if (a3)
  {
    unint64_t v9 = *(void **)(a1 + 40);
    if (v9)
    {
      if ((-[_UITraitOverrides _isEmpty](v9) & 1) == 0)
      {
        BOOL v10 = -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:](*(void *)(a1 + 40), v7, 1, 1);
        if (![v7 length] || objc_msgSend(v10, "length")) {
          [v8 appendFormat:@"overridesAppliedBefore = %@", v10];
        }
      }
    }
  }
  id v44 = v7;
  int v11 = [MEMORY[0x1E4F28E78] string];
  int v12 = *(void **)(a1 + 8);
  char v13 = +[UITraitCollection _emptyTraitCollection]();
  id v14 = v12;
  id v15 = v13;
  if (v14 == v15)
  {

LABEL_19:
    goto LABEL_20;
  }
  CFNumberRef v16 = v15;
  if (!v14 || !v15)
  {

    goto LABEL_16;
  }
  char v17 = [v14 isEqual:v15];

  if ((v17 & 1) == 0)
  {
LABEL_16:
    id v14 = [*(id *)(a1 + 8) _traitsDescriptionMatching:v44];
    if (![v44 length] || objc_msgSend(v14, "length")) {
      [v11 appendString:v14];
    }
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v18 = *(void *)(a1 + 16);
  int v19 = v44;
  id v20 = v44;
  if (v18)
  {
    id v20 = v44;
    if (_UITraitTokenSetCount(v18 + 16))
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v22 = *(void *)(a1 + 16);
      v42 = v8;
      id v43 = v7;
      int v41 = a3;
      v40 = v11;
      if (v22) {
        uint64_t v23 = _UITraitTokenSetCount(v22 + 16);
      }
      else {
        uint64_t v23 = 0;
      }
      v24 = (void *)[v21 initWithCapacity:v23];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v25 = *(id *)(a1 + 16);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v46 != v28) {
              objc_enumerationMutation(v25);
            }
            CFNumberRef v30 = *(const __CFNumber **)(*((void *)&v45 + 1) + 8 * i);
            self;
            uint64_t v52 = 0;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v49 = 0u;
            _UIGetTraitMetadata(v30, 0, (uint64_t)&v49);
            id v31 = (id)v50;
            v32 = [NSString stringWithFormat:@"%@ = (defaultValue)", v31];
            [v24 addObject:v32];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v27);
      }

      int v19 = v44;
      id v20 = v44;
      a3 = v41;
      if ([v44 length])
      {
        v33 = [v44 lowercaseString];

        v34 = (void *)MEMORY[0x1E4F28F60];
        *(void *)&long long v49 = MEMORY[0x1E4F143A8];
        *((void *)&v49 + 1) = 3221225472;
        *(void *)&long long v50 = __54___UITraitOverrides__rawOverridesDescriptionMatching___block_invoke;
        *((void *)&v50 + 1) = &unk_1E52F3688;
        id v20 = v33;
        *(void *)&long long v51 = v20;
        v35 = [v34 predicateWithBlock:&v49];
        [v24 filterUsingPredicate:v35];
      }
      id v8 = v42;
      id v7 = v43;
      int v11 = v40;
      if ([v24 count])
      {
        if ([v40 length]) {
          [v40 appendString:@", "];
        }
        v36 = [v24 componentsJoinedByString:@", "];
        [v40 appendString:v36];
      }
    }
  }

  if ([v11 length])
  {
    if ([v8 length]) {
      [v8 appendString:@"; "];
    }
    if ((a4 & 1) == 0) {
      [v8 appendString:@"overrides = "];
    }
    [v8 appendFormat:@"{ %@ }", v11];
  }
  if (a3)
  {
    v37 = *(void **)(a1 + 48);
    if (v37)
    {
      if ((-[_UITraitOverrides _isEmpty](v37) & 1) == 0)
      {
        v38 = -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:](*(void *)(a1 + 48), v19, 1, 1);
        if (![v19 length] || objc_msgSend(v38, "length"))
        {
          if ([v8 length]) {
            [v8 appendString:@"; "];
          }
          [v8 appendFormat:@"overridesAppliedAfter = %@", v38];
        }
      }
    }
  }

LABEL_54:
  return v8;
}

- (id)_traitOverridesDescriptionMatching:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)v2, v3, has_internal_diagnostics, 0);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_description
{
  -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)self, 0, 1, 0);
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v3 length])
  {

    id v3 = @"no overrides";
  }
  double v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"<%@: %p; %@>", v6, self, v3];

  return v7;
}

- (NSString)description
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  -[_UITraitOverrides _overridesDescriptionMatching:includingInternalOverrides:isNested:]((uint64_t)self, 0, has_internal_diagnostics, 0);
  double v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v4 length])
  {

    double v4 = @"no overrides";
  }
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [v5 stringWithFormat:@"<%@: %p; %@>", v7, self, v4];

  return (NSString *)v8;
}

@end