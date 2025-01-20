@interface UIKBCacheToken_Keyplane
+ (id)tokenForKeyplane:(id)a3;
- ($5C396DA91E87D63640AC871340DC94CC)styling;
- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4;
- (CGSize)size;
- (id)_initWithKeyplane:(id)a3 keylayout:(id)a4;
- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4;
- (void)annotateWithBool:(BOOL)a3;
- (void)annotateWithInt:(int)a3;
- (void)setSize:(CGSize)a3;
- (void)setStyling:(id)a3;
@end

@implementation UIKBCacheToken_Keyplane

- (id)_initWithKeyplane:(id)a3 keylayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 name];
  v33.receiver = self;
  v33.super_class = (Class)UIKBCacheToken_Keyplane;
  v9 = [(UIKBCacheToken *)&v33 initWithName:v8];

  if (v9)
  {
    [v7 frame];
    v9->_size.width = v10;
    v9->_size.height = v11;
    uint64_t v12 = [v6 visualStyling];
    *(void *)&v9->_style.styling = v12;
    v9->_style.intValue = v12 & 0xFFFFFF7F;
    v13 = [v7 geometrySet:0];
    uint64_t v14 = [v13 name];
    v15 = (void *)v14;
    v16 = &stru_1ED0E84C0;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v17 = v16;

    v18 = [v7 keySet];
    v19 = [v18 name];

    uint64_t v20 = _UIKBTrimKBStarName_iOS(v17);

    geometrySetName = v9->_geometrySetName;
    v9->_geometrySetName = (NSString *)v20;

    uint64_t v22 = _UIKBTrimKBStarName_iOS(v19);
    keySetName = v9->_keySetName;
    v9->_keySetName = (NSString *)v22;

    v24 = [v7 cachedGestureLayout];
    v25 = [v24 keySet];
    v26 = [v25 name];
    uint64_t v27 = _UIKBTrimKBStarName_iOS(v26);
    cachedGestureKeySetName = v9->_cachedGestureKeySetName;
    v9->_cachedGestureKeySetName = (NSString *)v27;

    v29 = [MEMORY[0x1E4F1CA20] preferredLocale];
    uint64_t v30 = [v29 localeIdentifier];
    locale = v9->_locale;
    v9->_locale = (NSString *)v30;

    v9->super._scale = 0.0;
  }

  return v9;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(void *)&self->_style.styling;
}

- (void)setStyling:(id)a3
{
  *(void *)&self->_style.styling = *(void *)&a3;
}

- (void)annotateWithBool:(BOOL)a3
{
  BOOL v3 = a3;
  annotations = self->_annotations;
  if (!annotations)
  {
    id v6 = [NSString string];
    id v7 = self->_annotations;
    self->_annotations = v6;

    annotations = self->_annotations;
  }
  if (v3) {
    v8 = @"1";
  }
  else {
    v8 = @"0";
  }
  v9 = [(NSString *)annotations stringByAppendingString:v8];
  CGFloat v10 = self->_annotations;
  self->_annotations = v9;
}

- (void)annotateWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  annotations = self->_annotations;
  if (!annotations)
  {
    id v6 = [NSString string];
    id v7 = self->_annotations;
    self->_annotations = v6;

    annotations = self->_annotations;
  }
  v8 = [(NSString *)annotations stringByAppendingFormat:@"%d", v3];
  v9 = self->_annotations;
  self->_annotations = v8;
}

+ (id)tokenForKeyplane:(id)a3
{
  id v3 = a3;
  v4 = [v3 subtrees];
  if (![v4 count])
  {
    id v7 = 0;
    goto LABEL_5;
  }
  v5 = [v3 subtrees];
  uint64_t v6 = [v5 objectAtIndex:0];

  if (v6)
  {
    id v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithKeyplane:v3 keylayout:v6];
    v4 = (void *)v6;
LABEL_5:

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__UIKBCacheToken_Keyplane_stringForSplitState_handBias___block_invoke;
  v6[3] = &unk_1E52F3D60;
  BOOL v7 = a3;
  v6[4] = self;
  v6[5] = a4;
  v4 = [(UIKBCacheToken *)self stringForConstruction:v6];
  return v4;
}

- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4
{
  char v4 = a4;
  uint64_t v6 = a3;
  BOOL v7 = v6;
  if (self->_style.intValue != v6[18]) {
    goto LABEL_8;
  }
  transformationIdentifiers = self->super._transformationIdentifiers;
  v9 = [v6 transformationIdentifiers];
  LODWORD(transformationIdentifiers) = [(NSSet *)transformationIdentifiers isEqualToSet:v9];

  if (!transformationIdentifiers) {
    goto LABEL_8;
  }
  if ((v4 & 0x34) == 0)
  {
    if ((v4 & 3) != 0)
    {
      geometrySetName = self->_geometrySetName;
      cachedGestureKeySetName = (NSString *)v7[10];
      goto LABEL_12;
    }
LABEL_13:
    char v15 = 1;
    goto LABEL_9;
  }
  if (![(NSString *)self->_keySetName isEqualToString:v7[11]])
  {
LABEL_8:
    char v15 = 0;
    goto LABEL_9;
  }
  CGFloat v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  CGFloat v11 = [v10 preferencesActions];
  int v12 = [v11 BOOLForPreferenceKey:@"GesturesEnabled"];

  if (!v12) {
    goto LABEL_13;
  }
  cachedGestureKeySetName = self->_cachedGestureKeySetName;
  geometrySetName = (NSString *)v7[12];
  if (cachedGestureKeySetName)
  {
LABEL_12:
    char v15 = [(NSString *)geometrySetName isEqualToString:cachedGestureKeySetName];
    goto LABEL_9;
  }
  char v15 = geometrySetName == 0;
LABEL_9:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_cachedGestureKeySetName, 0);
  objc_storeStrong((id *)&self->_keySetName, 0);
  objc_storeStrong((id *)&self->_geometrySetName, 0);
}

@end