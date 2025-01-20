@interface TMLFont
+ (void)initializeJSContext:(id)a3;
- (NSString)familyName;
- (NSString)fontName;
- (TMLFont)initWithFont:(id)a3;
- (TMLFont)initWithFontDescriptor:(id)a3;
- (double)ascender;
- (double)capHeight;
- (double)descender;
- (double)leading;
- (double)lineHeight;
- (double)pointSize;
- (double)xHeight;
- (id)UIFontValue;
- (id)bold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)italic;
- (id)withAXRestrictedStyle:(id)a3;
- (id)withAttributes:(id)a3;
- (id)withFamily:(id)a3;
- (id)withScale:(double)a3;
- (id)withScaleTransform:(double)a3;
- (id)withSize:(double)a3;
- (id)withStyle:(id)a3;
- (id)withSymbolicTraits:(unsigned int)a3;
- (id)withWeight:(double)a3;
- (id)withWidth:(double)a3;
@end

@implementation TMLFont

- (TMLFont)initWithFont:(id)a3
{
  id v5 = a3;
  v8 = objc_msgSend_fontDescriptor(v5, v6, v7);
  v11 = (TMLFont *)objc_msgSend_initWithFontDescriptor_(self, v9, v10, v8);

  if (v11) {
    objc_storeStrong((id *)&v11->_font, a3);
  }

  return v11;
}

- (TMLFont)initWithFontDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLFont;
  v6 = [(TMLFont *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fontDescriptor, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  fontDescriptor = self->_fontDescriptor;
  return (id)objc_msgSend_initWithFontDescriptor_(v8, v9, v10, fontDescriptor);
}

- (id)UIFontValue
{
  font = self->_font;
  if (!font)
  {
    id v5 = (void *)MEMORY[0x263F81708];
    fontDescriptor = self->_fontDescriptor;
    objc_msgSend_pointSize(fontDescriptor, a2, v2);
    objc_msgSend_fontWithDescriptor_size_(v5, v7, v8, fontDescriptor);
    objc_super v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_font;
    self->_font = v9;

    font = self->_font;
  }
  return font;
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_23986D8AC;
  v27[3] = &unk_264DAE468;
  v27[4] = a1;
  id v5 = (void *)MEMORY[0x23ECA7DD0](v27);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v6, v7, v5, @"font");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, &unk_26ECED268, @"includeFont");
  if (qword_268A05900 != -1) {
    dispatch_once(&qword_268A05900, &unk_26ECED288);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_23986DBFC;
  v26[3] = &unk_264DAE4A8;
  v26[4] = a1;
  double v10 = (void *)MEMORY[0x23ECA7DD0](v26);
  v13 = objc_msgSend_objectForKeyedSubscript_(v4, v11, v12, @"font");
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, v15, v10, @"style");

  v18 = objc_msgSend_objectForKeyedSubscript_(v4, v16, v17, @"font");
  objc_msgSend_setObject_forKeyedSubscript_(v18, v19, v20, &unk_26ECED2A8, @"scaledValueForTextStyle");

  v23 = objc_msgSend_objectForKeyedSubscript_(v4, v21, v22, @"font");
  objc_msgSend_setObject_forKeyedSubscript_(v23, v24, v25, &unk_26ECED2C8, @"scaledValueForValue");
}

- (id)bold
{
  id v3 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  int v7 = objc_msgSend_symbolicTraits(fontDescriptor, v5, v6);
  double v10 = objc_msgSend_fontDescriptorWithSymbolicTraits_(fontDescriptor, v8, v9, v7 | 2u);
  v13 = objc_msgSend_initWithFontDescriptor_(v3, v11, v12, v10);

  return v13;
}

- (id)italic
{
  id v3 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  int v7 = objc_msgSend_symbolicTraits(fontDescriptor, v5, v6);
  double v10 = objc_msgSend_fontDescriptorWithSymbolicTraits_(fontDescriptor, v8, v9, v7 | 1u);
  v13 = objc_msgSend_initWithFontDescriptor_(v3, v11, v12, v10);

  return v13;
}

- (id)withSize:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  int v7 = objc_msgSend_fontDescriptorWithSize_(self->_fontDescriptor, v6, a3);
  double v10 = objc_msgSend_initWithFontDescriptor_(v5, v8, v9, v7);

  return v10;
}

- (id)withFamily:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  double v8 = objc_msgSend_fontDescriptorWithFamily_(self->_fontDescriptor, v6, v7, v4);

  v11 = objc_msgSend_initWithFontDescriptor_(v5, v9, v10, v8);
  return v11;
}

- (id)withWeight:(double)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  fontDescriptor = self->_fontDescriptor;
  uint64_t v23 = *MEMORY[0x263F817A0];
  uint64_t v21 = *MEMORY[0x263F81850];
  id v5 = objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  double v22 = v5;
  double v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, v7, &v22, &v21, 1);
  v24[0] = v8;
  v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, v10, v24, &v23, 1);
  objc_msgSend_fontDescriptorByAddingAttributes_(fontDescriptor, v12, v13, v11);
  v14 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

  id v15 = objc_alloc((Class)objc_opt_class());
  v18 = v14;
  if (!v14) {
    v18 = self->_fontDescriptor;
  }
  v19 = objc_msgSend_initWithFontDescriptor_(v15, v16, v17, v18);

  return v19;
}

- (id)withWidth:(double)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  fontDescriptor = self->_fontDescriptor;
  uint64_t v23 = *MEMORY[0x263F817A0];
  uint64_t v21 = *MEMORY[0x263F81868];
  id v5 = objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  double v22 = v5;
  double v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, v7, &v22, &v21, 1);
  v24[0] = v8;
  v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, v10, v24, &v23, 1);
  objc_msgSend_fontDescriptorByAddingAttributes_(fontDescriptor, v12, v13, v11);
  v14 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

  id v15 = objc_alloc((Class)objc_opt_class());
  v18 = v14;
  if (!v14) {
    v18 = self->_fontDescriptor;
  }
  v19 = objc_msgSend_initWithFontDescriptor_(v15, v16, v17, v18);

  return v19;
}

- (id)withSymbolicTraits:(unsigned int)a3
{
  int v6 = objc_msgSend_symbolicTraits(self->_fontDescriptor, a2, v3);
  objc_msgSend_fontDescriptorWithSymbolicTraits_(self->_fontDescriptor, v7, v8, v6 | a3);
  double v9 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();
  id v10 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = v9;
  if (!v9) {
    fontDescriptor = self->_fontDescriptor;
  }
  v14 = objc_msgSend_initWithFontDescriptor_(v10, v11, v12, fontDescriptor);

  return v14;
}

- (id)withAttributes:(id)a3
{
  objc_msgSend_fontDescriptorByAddingAttributes_(self->_fontDescriptor, a2, v3, a3);
  id v5 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = v5;
  if (!v5) {
    fontDescriptor = self->_fontDescriptor;
  }
  id v10 = objc_msgSend_initWithFontDescriptor_(v6, v7, v8, fontDescriptor);

  return v10;
}

- (id)withStyle:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1C668];
  id v5 = a3;
  double v8 = objc_msgSend_metricsForTextStyle_(v4, v6, v7, v5);
  v11 = objc_msgSend_UIFontValue(self, v9, v10);
  double v12 = (void *)MEMORY[0x263F81720];
  id v15 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v13, v14, *MEMORY[0x263F1D180]);
  v18 = objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v12, v16, v17, v5, v15);

  objc_msgSend_pointSize(v18, v19, v20);
  uint64_t v23 = objc_msgSend_fontWithSize_(v11, v21, v22);

  v24 = [TMLFont alloc];
  v27 = objc_msgSend_scaledFontForFont_(v8, v25, v26, v23);
  v30 = objc_msgSend_initWithFont_(v24, v28, v29, v27);

  return v30;
}

- (id)withAXRestrictedStyle:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F1C668];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v9 = objc_msgSend_initForTextStyle_(v6, v7, v8, v5);
  double v10 = (void *)MEMORY[0x263F81720];
  double v13 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v11, v12, *MEMORY[0x263F1D180]);
  v16 = objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v10, v14, v15, v5, v13);

  double v17 = (void *)MEMORY[0x263F81720];
  uint64_t v18 = *MEMORY[0x263F1D160];
  uint64_t v21 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v19, v20, *MEMORY[0x263F1D160]);
  v24 = objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v17, v22, v23, v5, v21);

  objc_msgSend_pointSize(self, v25, v26);
  double v28 = v27;
  objc_msgSend_pointSize(v16, v29, v27);
  if (v28 == v31)
  {
    v40 = objc_msgSend_UIFontValue(self, v30, v31);
    goto LABEL_5;
  }
  objc_msgSend_pointSize(self, v30, v31);
  double v33 = v32;
  v36 = objc_msgSend_UIFontValue(self, v34, v32);
  if (v33 == 0.0)
  {
    objc_msgSend_pointSize(v16, v35, v37);
    v40 = objc_msgSend_fontWithSize_(v36, v38, v39);

LABEL_5:
    objc_msgSend_pointSize(v24, v41, v42);
    v45 = objc_msgSend_scaledFontForFont_maximumPointSize_(v9, v43, v44, v40);
    goto LABEL_7;
  }
  v46 = objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x263F1CB00], v35, v37, v18);
  v40 = objc_msgSend_scaledFontForFont_compatibleWithTraitCollection_(v9, v47, v48, v36, v46);

  v51 = objc_msgSend_UIFontValue(self, v49, v50);
  objc_msgSend_pointSize(v40, v52, v53);
  v45 = objc_msgSend_scaledFontForFont_maximumPointSize_(v9, v54, v55, v51);

LABEL_7:
  v56 = [TMLFont alloc];
  v59 = objc_msgSend_initWithFont_(v56, v57, v58, v45);

  return v59;
}

- (id)withScale:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  objc_msgSend_pointSize(fontDescriptor, v7, v8);
  v11 = objc_msgSend_fontDescriptorWithSize_(fontDescriptor, v10, v9 * a3);
  double v14 = objc_msgSend_initWithFontDescriptor_(v5, v12, v13, v11);

  return v14;
}

- (id)withScaleTransform:(double)a3
{
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, a3, a3);
  id v4 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  CGAffineTransform v12 = v13;
  double v7 = objc_msgSend_fontDescriptorWithMatrix_(fontDescriptor, v6, v13.tx, &v12);
  double v10 = objc_msgSend_initWithFontDescriptor_(v4, v8, v9, v7);

  return v10;
}

- (NSString)familyName
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  id v6 = objc_msgSend_familyName(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)fontName
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  id v6 = objc_msgSend_familyName(v3, v4, v5);

  return (NSString *)v6;
}

- (double)pointSize
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_pointSize(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)ascender
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_ascender(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)descender
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_descender(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)capHeight
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_capHeight(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)xHeight
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_xHeight(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)lineHeight
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_lineHeight(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (double)leading
{
  double v3 = objc_msgSend_UIFontValue(self, a2, v2);
  objc_msgSend_leading(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end