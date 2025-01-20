@interface UIKBKeyDisplayContents
+ (id)displayContents;
- (BOOL)fillPath;
- (BOOL)flipImageHorizontally;
- (BOOL)force1xImages;
- (BOOL)forceImageKeycap;
- (BOOL)stringKeycapOverImage;
- (NSArray)highlightedVariantsList;
- (NSArray)secondaryDisplayStringImages;
- (NSArray)secondaryDisplayStrings;
- (NSArray)variantDisplayContents;
- (NSString)bundlePathOverride;
- (NSString)displayString;
- (NSString)displayStringImage;
- (UIImage)displayImage;
- (UIKBKeyDisplayContents)fallbackContents;
- (id)description;
- (int64_t)displayPathType;
- (void)setBundlePathOverride:(id)a3;
- (void)setDisplayImage:(id)a3;
- (void)setDisplayPathType:(int64_t)a3;
- (void)setDisplayString:(id)a3;
- (void)setDisplayStringImage:(id)a3;
- (void)setFallbackContents:(id)a3;
- (void)setFillPath:(BOOL)a3;
- (void)setFlipImageHorizontally:(BOOL)a3;
- (void)setForce1xImages:(BOOL)a3;
- (void)setForceImageKeycap:(BOOL)a3;
- (void)setHighlightedVariantsList:(id)a3;
- (void)setSecondaryDisplayStringImages:(id)a3;
- (void)setSecondaryDisplayStrings:(id)a3;
- (void)setStringKeycapOverImage:(BOOL)a3;
- (void)setVariantDisplayContents:(id)a3;
@end

@implementation UIKBKeyDisplayContents

+ (id)displayContents
{
  v2 = objc_alloc_init(UIKBKeyDisplayContents);
  return v2;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(UIKBKeyDisplayContents *)self displayString];

  if (v4)
  {
    v5 = [(UIKBKeyDisplayContents *)self displayString];
    [v3 appendFormat:@"; displayString = %@", v5];
  }
  v6 = [(UIKBKeyDisplayContents *)self displayStringImage];

  if (v6)
  {
    v7 = [(UIKBKeyDisplayContents *)self displayStringImage];
    [v3 appendFormat:@"; displayStringImage = %@", v7];
  }
  v8 = [(UIKBKeyDisplayContents *)self secondaryDisplayStrings];

  if (v8)
  {
    v9 = [(UIKBKeyDisplayContents *)self secondaryDisplayStrings];
    [v3 appendFormat:@"; secondaryDisplayStrings = %@", v9];
  }
  v10 = [(UIKBKeyDisplayContents *)self secondaryDisplayStringImages];

  if (v10)
  {
    v11 = [(UIKBKeyDisplayContents *)self secondaryDisplayStringImages];
    [v3 appendFormat:@"; secondaryDisplayStrings = %@", v11];
  }
  v12 = [(UIKBKeyDisplayContents *)self variantDisplayContents];

  if (v12)
  {
    v13 = [(UIKBKeyDisplayContents *)self variantDisplayContents];
    [v3 appendFormat:@"; variantDisplayContents = %@", v13];
  }
  v14 = [(UIKBKeyDisplayContents *)self highlightedVariantsList];

  if (v14)
  {
    v15 = [(UIKBKeyDisplayContents *)self highlightedVariantsList];
    [v3 appendFormat:@"; highlightedVariantList = %@", v15];
  }
  if ([(UIKBKeyDisplayContents *)self displayPathType])
  {
    int64_t v16 = [(UIKBKeyDisplayContents *)self displayPathType];
    v17 = @"Delete";
    if (v16 == 1) {
      v17 = @"Shift";
    }
    [v3 appendFormat:@"; displayPathType = %@", v17];
    BOOL v18 = [(UIKBKeyDisplayContents *)self fillPath];
    v19 = "NO";
    if (v18) {
      v19 = "YES";
    }
    objc_msgSend(v3, "appendFormat:", @"; fillPath = %s", v19);
  }
  if ([(UIKBKeyDisplayContents *)self force1xImages]) {
    [v3 appendString:@"; force1xImages"];
  }
  v20 = [(UIKBKeyDisplayContents *)self fallbackContents];

  if (v20)
  {
    v21 = [(UIKBKeyDisplayContents *)self fallbackContents];
    [v3 appendFormat:@"; fallbackContents = %@", v21];
  }
  if ([(UIKBKeyDisplayContents *)self stringKeycapOverImage]) {
    [v3 appendFormat:@"; stringKeycapOverImage"];
  }
  if ([(UIKBKeyDisplayContents *)self flipImageHorizontally]) {
    [v3 appendFormat:@"; flipImageHorizontally"];
  }
  v22 = [(UIKBKeyDisplayContents *)self bundlePathOverride];

  if (v22)
  {
    v23 = [(UIKBKeyDisplayContents *)self bundlePathOverride];
    [v3 appendFormat:@"; bundlePathOverride = %@", v23];
  }
  [v3 appendString:@">"];
  return v3;
}

- (void)setDisplayStringImage:(id)a3
{
  self->_fillPath = 0;
}

- (void)setDisplayString:(id)a3
{
  self->_displayPathType = 0;
  self->_fillPath = 0;
}

- (void)setDisplayPathType:(int64_t)a3
{
  self->_displayPathType = a3;
  displayString = self->_displayString;
  self->_displayString = 0;

  secondaryDisplayStrings = self->_secondaryDisplayStrings;
  self->_secondaryDisplayStrings = 0;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)displayStringImage
{
  return self->_displayStringImage;
}

- (NSArray)secondaryDisplayStrings
{
  return self->_secondaryDisplayStrings;
}

- (void)setSecondaryDisplayStrings:(id)a3
{
}

- (NSArray)secondaryDisplayStringImages
{
  return self->_secondaryDisplayStringImages;
}

- (void)setSecondaryDisplayStringImages:(id)a3
{
}

- (NSArray)variantDisplayContents
{
  return self->_variantDisplayContents;
}

- (void)setVariantDisplayContents:(id)a3
{
}

- (NSArray)highlightedVariantsList
{
  return self->_highlightedVariantsList;
}

- (void)setHighlightedVariantsList:(id)a3
{
}

- (int64_t)displayPathType
{
  return self->_displayPathType;
}

- (BOOL)fillPath
{
  return self->_fillPath;
}

- (void)setFillPath:(BOOL)a3
{
  self->_fillPath = a3;
}

- (BOOL)force1xImages
{
  return self->_force1xImages;
}

- (void)setForce1xImages:(BOOL)a3
{
  self->_force1xImages = a3;
}

- (UIKBKeyDisplayContents)fallbackContents
{
  return self->_fallbackContents;
}

- (void)setFallbackContents:(id)a3
{
}

- (BOOL)stringKeycapOverImage
{
  return self->_stringKeycapOverImage;
}

- (void)setStringKeycapOverImage:(BOOL)a3
{
  self->_stringKeycapOverImage = a3;
}

- (BOOL)flipImageHorizontally
{
  return self->_flipImageHorizontally;
}

- (void)setFlipImageHorizontally:(BOOL)a3
{
  self->_flipImageHorizontally = a3;
}

- (NSString)bundlePathOverride
{
  return self->_bundlePathOverride;
}

- (void)setBundlePathOverride:(id)a3
{
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (void)setDisplayImage:(id)a3
{
}

- (BOOL)forceImageKeycap
{
  return self->_forceImageKeycap;
}

- (void)setForceImageKeycap:(BOOL)a3
{
  self->_forceImageKeycap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_bundlePathOverride, 0);
  objc_storeStrong((id *)&self->_fallbackContents, 0);
  objc_storeStrong((id *)&self->_highlightedVariantsList, 0);
  objc_storeStrong((id *)&self->_variantDisplayContents, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayStringImages, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayStrings, 0);
  objc_storeStrong((id *)&self->_displayStringImage, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end