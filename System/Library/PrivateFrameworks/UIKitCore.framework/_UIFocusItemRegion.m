@interface _UIFocusItemRegion
- (BOOL)_canBeOccludedByRegionsAbove;
- (BOOL)_canOccludeRegionsBelow;
- (BOOL)isEqual:(id)a3;
- (UIFocusItem)item;
- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6;
- (id)_debugAssociatedObject;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_defaultFocusItem;
- (id)_descriptionBuilder;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (int64_t)_preferredDistanceComparisonType;
- (unint64_t)_focusableBoundaries;
@end

@implementation _UIFocusItemRegion

- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_UIFocusItemRegion initWithFrame:coordinateSpace:item:focusSystem:](self, "initWithFrame:coordinateSpace:item:focusSystem:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIFocusItemRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 item:(id)a5 focusSystem:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)_UIFocusItemRegion;
  v15 = -[_UIFocusRegion initWithFrame:coordinateSpace:](&v38, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    v17 = v15;
    id v18 = v13;
    id v19 = v14;
    objc_storeWeak((id *)&v17->_item, v18);
    unsigned __int8 v39 = 0;
    if (v18)
    {
      char IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v18, &v39);
      int v21 = v39;
    }
    else
    {
      int v21 = 0;
      char IsEligibleForFocusOcclusion = 0;
    }
    v22 = &OBJC_IVAR___UIDeferredMenuElement__sender;
    *(unsigned char *)&v17->_flags = *(unsigned char *)&v17->_flags & 0xFE | IsEligibleForFocusOcclusion;
    if (!v19 && v21)
    {
      id v19 = +[UIFocusSystem focusSystemForEnvironment:v18];
      if (os_variant_has_internal_diagnostics())
      {
        v23 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          if (v19)
          {
            v34 = NSString;
            id v35 = v19;
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            v33 = [v34 stringWithFormat:@"<%@: %p>", v37, v35];
          }
          else
          {
            v33 = @"(nil)";
          }
          *(_DWORD *)buf = 138412290;
          v41 = v33;
          _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "_UIFocusItemRegion got called with a nil focus system. Inferring focus system found %@", buf, 0xCu);

          v22 = &OBJC_IVAR___UIDeferredMenuElement__sender;
        }
      }
      else
      {
        v23 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_CommonInit___s_category) + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          if (v19)
          {
            v24 = NSString;
            id v25 = v19;
            v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            v28 = [v24 stringWithFormat:@"<%@: %p>", v27, v25];

            v22 = &OBJC_IVAR___UIDeferredMenuElement__sender;
          }
          else
          {
            v28 = @"(nil)";
          }
          *(_DWORD *)buf = 138412290;
          v41 = v28;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "_UIFocusItemRegion got called with a nil focus system. Inferring focus system found %@", buf, 0xCu);
        }
      }

      int v21 = v39;
    }
    if (v21)
    {
      if (_UIFocusItemCanBecomeFocused(v18, v19)) {
        LOBYTE(v21) = 2;
      }
      else {
        LOBYTE(v21) = 0;
      }
    }
    *((unsigned char *)&v17->super.super.isa + v22[882]) = *((unsigned char *)&v17->super.super.isa + v22[882]) & 0xFD | v21;
    uint64_t v29 = v22[882];
    char v30 = *((unsigned char *)&v17->super.super.isa + v29);
    if ((v30 & 2) != 0)
    {
      char v31 = 0;
    }
    else
    {
      if (_UIFocusItemIsTransparentFocusItem(v18)) {
        char v31 = 4;
      }
      else {
        char v31 = 0;
      }
      uint64_t v29 = v22[882];
      char v30 = *((unsigned char *)&v17->super.super.isa + v29);
    }
    *((unsigned char *)&v17->super.super.isa + v29) = v30 & 0xFB | v31;
  }
  return v16;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusItemRegion;
  uint64_t v5 = -[_UIFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_storeWeak((id *)(v5 + 56), WeakRetained);

  *($4C59EE55ECBB4E4B9AB7F9871DE0ED47 *)(v5 + 48) = self->_flags;
  return (id)v5;
}

- (id)_descriptionBuilder
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusItemRegion;
  v3 = [(_UIFocusRegion *)&v9 _descriptionBuilder];
  v4 = [(_UIFocusItemRegion *)self item];
  id v5 = (id)[v3 appendName:@"item" object:v4 usingLightweightDescription:1];

  id v6 = (id)[v3 appendName:@"focusable" BOOLValue:(*(unsigned char *)&self->_flags >> 1) & 1];
  id v7 = (id)[v3 appendName:@"transparent" BOOLValue:(*(unsigned char *)&self->_flags >> 2) & 1];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusItemRegion;
  if ([(_UIFocusRegion *)&v15 isEqual:v4])
  {
    id v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    id v7 = objc_loadWeakRetained(v5 + 7);
    id v8 = WeakRetained;
    id v9 = v7;
    v10 = v9;
    if (v8 != v9)
    {
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        int v13 = [v8 isEqual:v9];

        if (v13) {
          goto LABEL_12;
        }
      }
      BOOL v12 = 0;
LABEL_16:

      goto LABEL_17;
    }

LABEL_12:
    BOOL v12 = ((*((unsigned char *)v5 + 48) ^ *(unsigned char *)&self->_flags) & 3) == 0
       && ((*((unsigned char *)v5 + 48) ^ *(unsigned char *)&self->_flags) & 4) == 0;
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_canOccludeRegionsBelow
{
  return (*(unsigned char *)&self->_flags & 5) == 1;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return 0;
  }
  v3 = [(_UIFocusItemRegion *)self item];
  BOOL v2 = v3 != 0;

  return v2;
}

- (id)_defaultFocusItem
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    BOOL v2 = [(_UIFocusItemRegion *)self item];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (unint64_t)_focusableBoundaries
{
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return 0;
  }
  BOOL v2 = [(_UIFocusItemRegion *)self item];

  if (!v2) {
    return 0;
  }
  if (dyld_program_sdk_at_least()) {
    return 32;
  }
  return 16;
}

- (int64_t)_preferredDistanceComparisonType
{
  if (!dyld_program_sdk_at_least()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusItemRegion;
  return [(_UIFocusRegion *)&v4 _preferredDistanceComparisonType];
}

- (id)_debugAssociatedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return WeakRetained;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  objc_super v4 = [(_UIFocusItemRegion *)self _focusableBoundaries];
  if (v4)
  {
    objc_super v4 = +[_UIFocusRegionDebugDrawingConfiguration itemConfigurationForRegion:self];
  }
  return v4;
}

- (UIFocusItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (UIFocusItem *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end