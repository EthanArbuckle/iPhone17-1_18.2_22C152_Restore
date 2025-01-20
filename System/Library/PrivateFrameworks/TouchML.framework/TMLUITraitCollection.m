@interface TMLUITraitCollection
+ (id)currentTraitCollection:(id)a3;
+ (id)defaultCollection;
+ (id)traitEnvironment:(id)a3 willTransitionToTraitCollection:(id)a4 fromPreviousTraitCollection:(id)a5;
- (NSArray)constraints;
- (NSArray)preferredContentSizeCategories;
- (NSArray)subviews;
- (NSString)preferredContentSizeCategory;
- (TMLUITraitCollection)init;
- (UITraitCollection)traitCollection;
- (double)displayScale;
- (int64_t)forceTouchCapability;
- (int64_t)horizontalSizeClass;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceStyle;
- (int64_t)verticalSizeClass;
- (unint64_t)specificity;
- (void)applyToTraitEnvironment:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setForceTouchCapability:(int64_t)a3;
- (void)setHorizontalSizeClass:(int64_t)a3;
- (void)setPreferredContentSizeCategories:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSubviews:(id)a3;
- (void)setTMLValue:(id)a3 forKeyPath:(id)a4;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVerticalSizeClass:(int64_t)a3;
- (void)tmlDispose;
@end

@implementation TMLUITraitCollection

- (TMLUITraitCollection)init
{
  v5.receiver = self;
  v5.super_class = (Class)TMLUITraitCollection;
  v2 = [(TMLUITraitCollection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_horizontalSizeClass = 0;
    v2->_verticalSizeClass = 0;
    *(_OWORD *)&v2->_userInterfaceStyle = xmmword_23989E880;
    v2->_forceTouchCapability = 0;
    objc_storeStrong((id *)&v2->_preferredContentSizeCategory, (id)*MEMORY[0x263F1D1A0]);
  }
  return v3;
}

- (void)tmlDispose
{
  id subviewsValue = self->_subviewsValue;
  self->_id subviewsValue = 0;

  id constraintsValue = self->_constraintsValue;
  self->_id constraintsValue = 0;

  properties = self->_properties;
  self->_properties = 0;

  propertyKeys = self->_propertyKeys;
  self->_propertyKeys = 0;

  v7.receiver = self;
  v7.super_class = (Class)TMLUITraitCollection;
  [&v7 tmlDispose];
}

+ (id)defaultCollection
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2398505E0;
  block[3] = &unk_264DAB680;
  block[4] = a1;
  if (qword_268A057A0 != -1) {
    dispatch_once(&qword_268A057A0, block);
  }
  v2 = (void *)qword_268A05798;
  return v2;
}

- (void)setTMLValue:(id)a3 forKeyPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_isEqualToString_(v8, v9, v10, @"subviews"))
  {
    p_id subviewsValue = &self->_subviewsValue;
LABEL_5:
    objc_storeStrong(p_subviewsValue, a3);
    goto LABEL_6;
  }
  if (objc_msgSend_isEqualToString_(v8, v11, v12, @"constraints"))
  {
    p_id subviewsValue = &self->_constraintsValue;
    goto LABEL_5;
  }
  if (objc_msgSend_hasPrefix_(v8, v14, v15, @"view."))
  {
    if (!v7)
    {
      objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    properties = self->_properties;
    if (!properties)
    {
      id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
      v22 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v19, v20, v21, 8);
      v23 = self->_properties;
      self->_properties = v22;

      id v24 = objc_alloc(MEMORY[0x263EFF9B0]);
      v27 = (NSMutableOrderedSet *)objc_msgSend_initWithCapacity_(v24, v25, v26, 8);
      propertyKeys = self->_propertyKeys;
      self->_propertyKeys = v27;

      properties = self->_properties;
    }
    objc_msgSend_setObject_forKey_(properties, v16, v17, v7, v8);
    objc_msgSend_addObject_(self->_propertyKeys, v29, v30, v8);
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)TMLUITraitCollection;
    [&v31 setTMLValue:v7 forKeyPath:v8];
  }
LABEL_6:
}

- (UITraitCollection)traitCollection
{
  traitCollection = self->_traitCollection;
  if (traitCollection) {
    goto LABEL_19;
  }
  self->_specificity = 0;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  id v8 = objc_msgSend_initWithCapacity_(v4, v5, v6, 5);
  if (self->_horizontalSizeClass)
  {
    double v10 = objc_msgSend_traitCollectionWithHorizontalSizeClass_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v11, v12, v10);

    ++self->_specificity;
  }
  if (self->_verticalSizeClass)
  {
    v13 = objc_msgSend_traitCollectionWithVerticalSizeClass_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v14, v15, v13);

    ++self->_specificity;
  }
  if (self->_userInterfaceStyle)
  {
    v16 = objc_msgSend_traitCollectionWithUserInterfaceStyle_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v17, v18, v16);

    ++self->_specificity;
  }
  if (self->_userInterfaceIdiom != -1)
  {
    id v19 = objc_msgSend_traitCollectionWithUserInterfaceIdiom_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v20, v21, v19);

    ++self->_specificity;
  }
  if (self->_forceTouchCapability)
  {
    v22 = objc_msgSend_traitCollectionWithForceTouchCapability_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v23, v24, v22);

    ++self->_specificity;
  }
  if (self->_preferredContentSizeCategories) {
    goto LABEL_15;
  }
  if (self->_preferredContentSizeCategory != (NSString *)*MEMORY[0x263F1D1A0])
  {
    v25 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v7, v9);
    objc_msgSend_addObject_(v8, v26, v27, v25);

LABEL_15:
    ++self->_specificity;
  }
  double displayScale = self->_displayScale;
  if (displayScale != 0.0)
  {
    v29 = objc_msgSend_traitCollectionWithDisplayScale_(MEMORY[0x263F1CB00], v7, displayScale);
    objc_msgSend_addObject_(v8, v30, v31, v29);

    ++self->_specificity;
  }
  objc_msgSend_traitCollectionWithTraitsFromCollections_(MEMORY[0x263F1CB00], v7, displayScale, v8);
  v32 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  v33 = self->_traitCollection;
  self->_traitCollection = v32;

  traitCollection = self->_traitCollection;
LABEL_19:
  return traitCollection;
}

- (void)applyToTraitEnvironment:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend_view(v4, v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    double v10 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    goto LABEL_5;
  }
  double v10 = 0;
LABEL_7:
  id subviewsValue = self->_subviewsValue;
  if (subviewsValue) {
    objc_msgSend_setTMLValue_forKey_(v10, v8, v9, subviewsValue, @"subviews");
  }
  id constraintsValue = self->_constraintsValue;
  if (constraintsValue) {
    objc_msgSend_setTMLValue_forKey_(v10, v8, v9, constraintsValue, @"constraints");
  }
  propertyKeys = self->_propertyKeys;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_239850AB0;
  v14[3] = &unk_264DAC480;
  v14[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(propertyKeys, v8, COERCE_DOUBLE(3221225472), v14);
}

+ (id)traitEnvironment:(id)a3 willTransitionToTraitCollection:(id)a4 fromPreviousTraitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_tmlChildren(v8, v11, v12);
  if (!objc_msgSend_count(v13, v14, v15))
  {
    id v31 = 0;
    goto LABEL_21;
  }
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = sub_239850E1C;
  v62[3] = &unk_264DAC4F8;
  id v16 = v9;
  id v63 = v16;
  id v19 = objc_msgSend_indexesOfObjectsPassingTest_(v13, v17, v18, v62);
  if ((unint64_t)objc_msgSend_count(v19, v20, v21) < 2)
  {
    if (objc_msgSend_count(v19, v22, v23) == 1)
    {
      uint64_t Index = objc_msgSend_lastIndex(v19, v32, v33);
      double v30 = objc_msgSend_objectAtIndex_(v13, v35, v36, Index);
    }
    else
    {
      double v30 = 0;
    }
  }
  else
  {
    double v24 = objc_msgSend_objectsAtIndexes_(v13, v22, v23, v19);
    double v27 = objc_msgSend_sortedArrayUsingComparator_(v24, v25, v26, &unk_26ECEBF38);
    double v30 = objc_msgSend_lastObject(v27, v28, v29);
  }
  v37 = objc_getAssociatedObject(v8, &unk_23989E890);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v10 && (isKindOfClass & 1) != 0)
  {
    if (v37 == v30)
    {
      v41 = objc_msgSend_preferredContentSizeCategory(v10, v39, v40);
      v44 = objc_msgSend_preferredContentSizeCategory(v16, v42, v43);

      if (v41 == v44) {
        goto LABEL_18;
      }
    }
  }
  else if (v37 == v30)
  {
    v45 = objc_msgSend_traitCollection(v8, v39, v40);
    objc_msgSend_preferredContentSizeCategory(v45, v46, v47);
    v48 = id v61 = a1;
    v51 = objc_msgSend_preferredContentSizeCategory(v16, v49, v50);

    BOOL v52 = v48 == v51;
    a1 = v61;
    if (v52) {
      goto LABEL_18;
    }
  }
  objc_msgSend_emitTMLSignal_withArguments_(v37, v39, v40, @"leave", 0);
  objc_setAssociatedObject(v8, &unk_23989E890, v30, (void *)1);
  objc_msgSend_emitTMLSignal_withArguments_(v30, v53, v54, @"willEnter", 0);
  if (!v37 || v30)
  {
    objc_msgSend_applyToTraitEnvironment_(v30, v55, v56, v8);
    id v31 = v30;
    goto LABEL_20;
  }
  v57 = objc_msgSend_defaultCollection(a1, v55, v56);
  objc_msgSend_applyToTraitEnvironment_(v57, v58, v59, v8);

LABEL_18:
  id v31 = 0;
LABEL_20:

LABEL_21:
  return v31;
}

+ (id)currentTraitCollection:(id)a3
{
  return objc_getAssociatedObject(a3, &unk_23989E890);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_double displayScale = a3;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  self->_verticalSizeClass = a3;
}

- (int64_t)forceTouchCapability
{
  return self->_forceTouchCapability;
}

- (void)setForceTouchCapability:(int64_t)a3
{
  self->_forceTouchCapability = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (unint64_t)specificity
{
  return self->_specificity;
}

- (NSArray)preferredContentSizeCategories
{
  return self->_preferredContentSizeCategories;
}

- (void)setPreferredContentSizeCategories:(id)a3
{
}

- (NSArray)subviews
{
  return (NSArray *)self->_subviewsValue;
}

- (void)setSubviews:(id)a3
{
}

- (NSArray)constraints
{
  return (NSArray *)self->_constraintsValue;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategories, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_constraintsValue, 0);
  objc_storeStrong(&self->_subviewsValue, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end