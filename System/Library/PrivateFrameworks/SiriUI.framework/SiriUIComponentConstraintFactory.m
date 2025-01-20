@interface SiriUIComponentConstraintFactory
+ (id)sharedConstraintFactory;
- (SiriUIComponentConstraintFactory)init;
- (id)_bestDistanceFromComponentType:(unint64_t)a3 toComponentType:(unint64_t)a4 layoutStyle:(int64_t)a5;
- (id)_createMapForLayoutStyle:(int64_t)a3;
- (id)bottomConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6;
- (id)bottomConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6;
- (id)topConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6;
- (id)topConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6;
- (id)verticalConstraintFromUpperView:(id)a3 lowerView:(id)a4 upperTemplateComponent:(id)a5 lowerTemplateComponent:(id)a6 layoutStyle:(int64_t)a7;
- (int64_t)_layoutAttributeForView:(id)a3 componentType:(unint64_t)a4 isLower:(BOOL)a5;
- (unint64_t)_componentTypeForView:(id)a3 component:(id)a4;
- (void)_addConstants:(id)a3 forLowerComponentStyle:(unint64_t)a4 toMap:(id)a5;
- (void)_setupMaps;
@end

@implementation SiriUIComponentConstraintFactory

+ (id)sharedConstraintFactory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SiriUIComponentConstraintFactory_sharedConstraintFactory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedConstraintFactory_onceToken != -1) {
    dispatch_once(&sharedConstraintFactory_onceToken, block);
  }
  v2 = (void *)s_sharedConstraintFactory;
  return v2;
}

uint64_t __59__SiriUIComponentConstraintFactory_sharedConstraintFactory__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = s_sharedConstraintFactory;
  s_sharedConstraintFactory = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUIComponentConstraintFactory)init
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIComponentConstraintFactory;
  v2 = [(SiriUIComponentConstraintFactory *)&v4 init];
  [(SiriUIComponentConstraintFactory *)v2 _setupMaps];
  return v2;
}

- (void)_setupMaps
{
  v52[6] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  self->_layoutStyleToComponentLayoutMaps = v3;

  v5 = [(SiriUIComponentConstraintFactory *)self _createMapForLayoutStyle:0];
  v21 = [(SiriUIComponentConstraintFactory *)self _createMapForLayoutStyle:1];
  v22 = [(SiriUIComponentConstraintFactory *)self _createMapForLayoutStyle:2];
  v51[0] = &unk_26D657E60;
  v51[1] = &unk_26D657E78;
  v52[0] = &unk_26D658088;
  v52[1] = &unk_26D658098;
  v51[2] = &unk_26D657E90;
  v51[3] = &unk_26D657EA8;
  v52[2] = &unk_26D6580A8;
  v52[3] = &unk_26D6580A8;
  v51[4] = &unk_26D657EC0;
  v51[5] = &unk_26D657ED8;
  v52[4] = &unk_26D658098;
  v52[5] = &unk_26D6580B8;
  v6 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v6 forLowerComponentStyle:1 toMap:v5];
  v49[0] = &unk_26D657E60;
  v49[1] = &unk_26D657ED8;
  v50[0] = &unk_26D6580C8;
  v50[1] = &unk_26D6580D8;
  v7 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v7 forLowerComponentStyle:1 toMap:v21];
  v47[0] = &unk_26D657E60;
  v47[1] = &unk_26D657ED8;
  v48[0] = &unk_26D6580C8;
  v48[1] = &unk_26D6580E8;
  v20 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v20 forLowerComponentStyle:1 toMap:v22];
  v45[0] = &unk_26D657E60;
  v45[1] = &unk_26D657E78;
  v46[0] = &unk_26D6580F8;
  v46[1] = &unk_26D658098;
  v45[2] = &unk_26D657ED8;
  v46[2] = &unk_26D658108;
  v19 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v19 forLowerComponentStyle:0 toMap:v5];
  v43[0] = &unk_26D657E60;
  v43[1] = &unk_26D657E78;
  v44[0] = &unk_26D658098;
  v44[1] = &unk_26D658108;
  v43[2] = &unk_26D657EA8;
  v43[3] = &unk_26D657ED8;
  v44[2] = &unk_26D6580B8;
  v44[3] = &unk_26D6580D8;
  v8 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v8 forLowerComponentStyle:3 toMap:v5];
  v41[0] = &unk_26D657E78;
  v41[1] = &unk_26D657EA8;
  v42[0] = &unk_26D6580B8;
  v42[1] = &unk_26D658118;
  v41[2] = &unk_26D657EC0;
  v41[3] = &unk_26D657ED8;
  v42[2] = &unk_26D658098;
  v42[3] = &unk_26D6580D8;
  v9 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v9 forLowerComponentStyle:3 toMap:v21];
  v39[0] = &unk_26D657E78;
  v39[1] = &unk_26D657EA8;
  v40[0] = &unk_26D6580B8;
  v40[1] = &unk_26D658118;
  v39[2] = &unk_26D657EC0;
  v39[3] = &unk_26D657ED8;
  v40[2] = &unk_26D658098;
  v40[3] = &unk_26D6580E8;
  v18 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v18 forLowerComponentStyle:3 toMap:v22];
  v37[0] = &unk_26D657E60;
  v37[1] = &unk_26D657E78;
  v38[0] = &unk_26D658128;
  v38[1] = &unk_26D658138;
  v37[2] = &unk_26D657E90;
  v37[3] = &unk_26D657EA8;
  v38[2] = &unk_26D658108;
  v38[3] = &unk_26D6580B8;
  v37[4] = &unk_26D657EC0;
  v37[5] = &unk_26D657ED8;
  v38[4] = &unk_26D658098;
  v38[5] = &unk_26D658148;
  v10 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:6];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v10 forLowerComponentStyle:2 toMap:v5];
  v35[0] = &unk_26D657E78;
  v35[1] = &unk_26D657EA8;
  v36[0] = &unk_26D658098;
  v36[1] = &unk_26D658118;
  v35[2] = &unk_26D657ED8;
  v36[2] = &unk_26D6580E8;
  v17 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v17 forLowerComponentStyle:2 toMap:v21];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v17 forLowerComponentStyle:2 toMap:v22];
  v33[0] = &unk_26D657E78;
  v33[1] = &unk_26D657E90;
  v34[0] = &unk_26D658138;
  v34[1] = &unk_26D658108;
  v33[2] = &unk_26D657EA8;
  v33[3] = &unk_26D657ED8;
  v34[2] = &unk_26D6580B8;
  v34[3] = &unk_26D6580D8;
  v16 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v16 forLowerComponentStyle:4 toMap:v5];
  v31[0] = &unk_26D657E60;
  v31[1] = &unk_26D657E78;
  v32[0] = &unk_26D6580F8;
  v32[1] = &unk_26D658158;
  v31[2] = &unk_26D657E90;
  v31[3] = &unk_26D657ED8;
  v32[2] = &unk_26D658158;
  v32[3] = &unk_26D658108;
  v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v11 forLowerComponentStyle:5 toMap:v5];
  v29 = &unk_26D657ED8;
  v30 = &unk_26D6580C8;
  v12 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v12 forLowerComponentStyle:5 toMap:v21];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v12 forLowerComponentStyle:5 toMap:v22];
  v27[0] = &unk_26D657E60;
  v27[1] = &unk_26D657ED8;
  v28[0] = &unk_26D6580D8;
  v28[1] = &unk_26D6580E8;
  v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v13 forLowerComponentStyle:8 toMap:v5];
  v25 = &unk_26D657E60;
  v26 = &unk_26D6580E8;
  v14 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  [(SiriUIComponentConstraintFactory *)self _addConstants:v14 forLowerComponentStyle:8 toMap:v22];
  v23[0] = &unk_26D657E60;
  v23[1] = &unk_26D657ED8;
  v24[0] = &unk_26D658088;
  v24[1] = &unk_26D6580B8;
  v15 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [(SiriUIComponentConstraintFactory *)self _addConstants:v15 forLowerComponentStyle:9 toMap:v5];
}

- (id)verticalConstraintFromUpperView:(id)a3 lowerView:(id)a4 upperTemplateComponent:(id)a5 lowerTemplateComponent:(id)a6 layoutStyle:(int64_t)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  unint64_t v15 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v12 component:a5];
  unint64_t v16 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v13 component:v14];

  int64_t v17 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v12 componentType:v15 isLower:0];
  int64_t v18 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v13 componentType:v16 isLower:1];
  v19 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:v15 toComponentType:v16 layoutStyle:a7];
  if (v19) {
    goto LABEL_5;
  }
  v20 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v25 = 136315906;
    v26 = "-[SiriUIComponentConstraintFactory verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTempl"
          "ateComponent:layoutStyle:]";
    __int16 v27 = 2048;
    unint64_t v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = v16;
    __int16 v31 = 2048;
    int64_t v32 = a7;
    _os_log_error_impl(&dword_2231EF000, v20, OS_LOG_TYPE_ERROR, "%s No template distance found for component type %zd to %zd (layoutStyle %zd)", (uint8_t *)&v25, 0x2Au);
  }
  v19 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:1 toComponentType:v16 layoutStyle:a7];
  if (v19)
  {
LABEL_5:
    v21 = (void *)MEMORY[0x263F08938];
    [v19 floatValue];
    v23 = [v21 constraintWithItem:v13 attribute:v18 relatedBy:0 toItem:v12 attribute:v17 multiplier:1.0 constant:v22];
  }
  else
  {
    v23 = [MEMORY[0x263F08938] constraintWithItem:v13 attribute:3 relatedBy:0 toItem:v12 attribute:4 multiplier:1.0 constant:0.0];
  }

  return v23;
}

- (id)topConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v10 component:a5];
  int64_t v13 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v10 componentType:6 isLower:1];
  id v14 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:6 toComponentType:v12 layoutStyle:a6];
  unint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = (void *)MEMORY[0x263F08938];
    [v14 floatValue];
    int64_t v18 = [v16 constraintWithItem:v10 attribute:v13 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:v17];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (id)bottomConstraintForView:(id)a3 inSuperview:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v10 component:a5];
  int64_t v13 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v10 componentType:v12 isLower:0];
  id v14 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:7 toComponentType:v12 layoutStyle:a6];
  unint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = (void *)MEMORY[0x263F08938];
    [v14 floatValue];
    int64_t v18 = [v16 constraintWithItem:v11 attribute:4 relatedBy:1 toItem:v10 attribute:v13 multiplier:1.0 constant:v17];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (id)topConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v10 component:a5];
  int64_t v13 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v10 componentType:6 isLower:1];
  id v14 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:6 toComponentType:v12 layoutStyle:a6];
  unint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = (void *)MEMORY[0x263F08938];
    [v14 floatValue];
    int64_t v18 = [v16 constraintWithItem:v10 attribute:v13 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:v17];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (id)bottomConstraintForView:(id)a3 fromLayoutGuide:(id)a4 templateComponent:(id)a5 layoutStyle:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = [(SiriUIComponentConstraintFactory *)self _componentTypeForView:v10 component:a5];
  int64_t v13 = [(SiriUIComponentConstraintFactory *)self _layoutAttributeForView:v10 componentType:v12 isLower:0];
  id v14 = [(SiriUIComponentConstraintFactory *)self _bestDistanceFromComponentType:7 toComponentType:v12 layoutStyle:a6];
  unint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = (void *)MEMORY[0x263F08938];
    [v14 floatValue];
    int64_t v18 = [v16 constraintWithItem:v11 attribute:4 relatedBy:1 toItem:v10 attribute:v13 multiplier:1.0 constant:v17];
  }
  else
  {
    int64_t v18 = 0;
  }

  return v18;
}

- (id)_bestDistanceFromComponentType:(unint64_t)a3 toComponentType:(unint64_t)a4 layoutStyle:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  v9 = [NSNumber numberWithInteger:a5];
  id v10 = [(NSMutableDictionary *)layoutStyleToComponentLayoutMaps objectForKeyedSubscript:v9];
  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  unint64_t v12 = [v10 objectForKey:v11];
  int64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
  id v14 = [v12 objectForKey:v13];

  if (!v14)
  {
    unint64_t v15 = [(NSMutableDictionary *)self->_layoutStyleToComponentLayoutMaps objectForKeyedSubscript:&unk_26D657EF0];
    unint64_t v16 = [NSNumber numberWithUnsignedInteger:a4];
    float v17 = [v15 objectForKey:v16];
    int64_t v18 = [NSNumber numberWithUnsignedInteger:a3];
    id v14 = [v17 objectForKey:v18];

    if (!v14)
    {
      v19 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = "-[SiriUIComponentConstraintFactory _bestDistanceFromComponentType:toComponentType:layoutStyle:]";
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        __int16 v26 = 2048;
        unint64_t v27 = a4;
        __int16 v28 = 2048;
        int64_t v29 = a5;
        _os_log_impl(&dword_2231EF000, v19, OS_LOG_TYPE_DEFAULT, "%s Template component distance is not specified between types %zd and %zd for layoutStyle: %zd", buf, 0x2Au);
      }
      id v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)_componentTypeForView:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector()) {
      unint64_t v7 = 9;
    }
    else {
      unint64_t v7 = [v6 style];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = 8;
    }
    else {
      unint64_t v7 = -1;
    }
  }

  return v7;
}

- (int64_t)_layoutAttributeForView:(id)a3 componentType:(unint64_t)a4 isLower:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = [v7 viewForFirstBaselineLayout];

  v9 = [v7 viewForLastBaselineLayout];

  int64_t v10 = 12;
  if (!v8) {
    int64_t v10 = 3;
  }
  if (!v5) {
    int64_t v10 = 3;
  }
  int64_t v11 = 11;
  if (!v9) {
    int64_t v11 = 4;
  }
  uint64_t v12 = 12;
  if (!v8) {
    uint64_t v12 = 3;
  }
  if (v5) {
    int64_t v11 = v12;
  }
  if (v9) {
    int v13 = v5;
  }
  else {
    int v13 = 1;
  }
  BOOL v14 = v13 == 0;
  uint64_t v15 = 11;
  if (!v14) {
    uint64_t v15 = 4;
  }
  if (a4 == 7) {
    int64_t v11 = v15;
  }
  if (a4 == 6) {
    return v10;
  }
  else {
    return v11;
  }
}

- (id)_createMapForLayoutStyle:(int64_t)a3
{
  layoutStyleToComponentLayoutMaps = self->_layoutStyleToComponentLayoutMaps;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)layoutStyleToComponentLayoutMaps objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = self->_layoutStyleToComponentLayoutMaps;
    int64_t v10 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
  }
  int64_t v11 = self->_layoutStyleToComponentLayoutMaps;
  uint64_t v12 = [NSNumber numberWithInteger:a3];
  int v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];

  return v13;
}

- (void)_addConstants:(id)a3 forLowerComponentStyle:(unint64_t)a4 toMap:(id)a5
{
  id v7 = NSNumber;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 numberWithUnsignedInteger:a4];
  [v8 setObject:v9 forKey:v10];
}

- (void).cxx_destruct
{
}

@end