@interface UIColor
+ (BOOL)supportsSecureCoding;
+ (NSArray)_apiColorNames;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (UIColor)allocWithZone:(_NSZone *)a3;
+ (UIColor)blackColor;
+ (UIColor)blueColor;
+ (UIColor)brownColor;
+ (UIColor)clearColor;
+ (UIColor)colorNamed:(NSString *)name;
+ (UIColor)colorNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (UIColor)colorWithCGColor:(CGColorRef)cgColor;
+ (UIColor)colorWithCIColor:(CIColor *)ciColor;
+ (UIColor)colorWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor)colorWithDynamicProvider:(void *)dynamicProvider;
+ (UIColor)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
+ (UIColor)colorWithPatternImage:(UIImage *)image;
+ (UIColor)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (UIColor)cyanColor;
+ (UIColor)darkGrayColor;
+ (UIColor)darkTextColor;
+ (UIColor)grayColor;
+ (UIColor)greenColor;
+ (UIColor)groupTableViewBackgroundColor;
+ (UIColor)labelColor;
+ (UIColor)lightGrayColor;
+ (UIColor)lightTextColor;
+ (UIColor)linkColor;
+ (UIColor)magentaColor;
+ (UIColor)opaqueSeparatorColor;
+ (UIColor)orangeColor;
+ (UIColor)placeholderTextColor;
+ (UIColor)purpleColor;
+ (UIColor)quaternaryLabelColor;
+ (UIColor)quaternarySystemFillColor;
+ (UIColor)redColor;
+ (UIColor)scrollViewTexturedBackgroundColor;
+ (UIColor)secondaryLabelColor;
+ (UIColor)secondarySystemBackgroundColor;
+ (UIColor)secondarySystemFillColor;
+ (UIColor)secondarySystemGroupedBackgroundColor;
+ (UIColor)separatorColor;
+ (UIColor)systemBackgroundColor;
+ (UIColor)systemBlueColor;
+ (UIColor)systemBrownColor;
+ (UIColor)systemCyanColor;
+ (UIColor)systemFillColor;
+ (UIColor)systemGray2Color;
+ (UIColor)systemGray3Color;
+ (UIColor)systemGray4Color;
+ (UIColor)systemGray5Color;
+ (UIColor)systemGray6Color;
+ (UIColor)systemGrayColor;
+ (UIColor)systemGreenColor;
+ (UIColor)systemGroupedBackgroundColor;
+ (UIColor)systemIndigoColor;
+ (UIColor)systemMintColor;
+ (UIColor)systemOrangeColor;
+ (UIColor)systemPinkColor;
+ (UIColor)systemPurpleColor;
+ (UIColor)systemRedColor;
+ (UIColor)systemTealColor;
+ (UIColor)systemYellowColor;
+ (UIColor)tertiaryLabelColor;
+ (UIColor)tertiarySystemBackgroundColor;
+ (UIColor)tertiarySystemFillColor;
+ (UIColor)tertiarySystemGroupedBackgroundColor;
+ (UIColor)tintColor;
+ (UIColor)underPageBackgroundColor;
+ (UIColor)viewFlipsideBackgroundColor;
+ (UIColor)whiteColor;
+ (UIColor)yellowColor;
+ (double)_luminanceWithRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (id)__halfTransparentBlackColor;
+ (id)__halfTransparentWhiteColor;
+ (id)_accessibilityButtonShapesBackgroundColorOnDark;
+ (id)_accessibilityButtonShapesBackgroundColorOnLight;
+ (id)_accessibilityButtonShapesDisabledBackgroundColorOnDark;
+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark;
+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight;
+ (id)_accessibilityDarkenedColorForColor:(id)a3;
+ (id)_accessibilityLightenedColorForColor:(id)a3;
+ (id)_alertControllerDimmingViewColor;
+ (id)_alternateSystemInteractionTintColor;
+ (id)_appKeyColor;
+ (id)_appKeyColorOrDefaultTint;
+ (id)_barHairlineShadowColor;
+ (id)_barStyleBlackHairlineShadowColor;
+ (id)_carSystemFocusColor;
+ (id)_carSystemFocusLabelColor;
+ (id)_carSystemFocusPrimaryColor;
+ (id)_carSystemFocusSecondaryColor;
+ (id)_carSystemPrimaryColor;
+ (id)_carSystemQuaternaryColor;
+ (id)_carSystemSecondaryColor;
+ (id)_carSystemTertiaryColor;
+ (id)_composedColorFromSourceColor:(void *)a3 destinationColor:(void *)a4 tintColor:(void *)a5 alpha:;
+ (id)_contentBackgroundColor;
+ (id)_controlForegroundColor;
+ (id)_controlHighlightColor;
+ (id)_controlShadowColor;
+ (id)_controlVibrantBottomBackgroundColor;
+ (id)_controlVibrantTopBackgroundColor;
+ (id)_convertColorPickerColor:(id)a3 fromUserInterfaceStyle:(int64_t)a4 to:(int64_t)a5;
+ (id)_dimmingViewColor;
+ (id)_disabledColorForColor:(uint64_t)a1;
+ (id)_disambiguated_due_to_CIImage_colorWithCGColor:(CGColor *)a3;
+ (id)_disambiguated_due_to_CIImage_colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)_dynamicCatalogColorForNibEncodingWithName:(id)a3 genericColor:(id)a4;
+ (id)_dynamicColorWithColorsByTraitCollection:(id)a3;
+ (id)_dynamicTestColor;
+ (id)_externalBarBackgroundColor;
+ (id)_externalSystemDarkGrayColor;
+ (id)_externalSystemExtraDarkGrayColor;
+ (id)_externalSystemGrayColor;
+ (id)_externalSystemMidGrayColor;
+ (id)_externalSystemSuperDarkGrayColor;
+ (id)_externalSystemWhiteColor;
+ (id)_fillColor;
+ (id)_focusedCarSystemColor:(id)a3;
+ (id)_grayColorForFontSize:(double)a3;
+ (id)_groupTableHeaderFooterTextColor;
+ (id)_labelColor;
+ (id)_linkColor;
+ (id)_markedTextBackgroundColor;
+ (id)_monochromeCellImageTintColor;
+ (id)_opaqueSeparatorColor;
+ (id)_pageControlIndicatorColor;
+ (id)_pageControlPlatterIndicatorColor;
+ (id)_placeholderTextColor;
+ (id)_plainTableHeaderFooterTextColor;
+ (id)_quaternaryFillColor;
+ (id)_quaternaryLabelColor;
+ (id)_searchBarBackgroundColor;
+ (id)_searchFieldDisabledBackgroundColor;
+ (id)_searchFieldPlaceholderTextClearButtonColor;
+ (id)_secondaryFillColor;
+ (id)_secondaryLabelColor;
+ (id)_secondarySystemBackgroundColor;
+ (id)_secondarySystemGroupedBackgroundColor;
+ (id)_separatorColor;
+ (id)_sidebarBackgroundColor;
+ (id)_splitViewBorderColor;
+ (id)_swiftColor;
+ (id)_swipedSidebarCellBackgroundColor;
+ (id)_switchOffColor;
+ (id)_switchOffImageColor;
+ (id)_systemBackgroundColor;
+ (id)_systemBackgroundSectionCellColor;
+ (id)_systemBackgroundSectionColor;
+ (id)_systemBlueColor2;
+ (id)_systemChromeShadowColor;
+ (id)_systemColorForColor:(void *)a3 withName:;
+ (id)_systemColorSelectorTable;
+ (id)_systemColorWithName:(id)a3;
+ (id)_systemColorWithUnvalidatedName:(id)a3;
+ (id)_systemDestructiveTintColor;
+ (id)_systemGray2Color;
+ (id)_systemGray3Color;
+ (id)_systemGray4Color;
+ (id)_systemGray5Color;
+ (id)_systemGray6Color;
+ (id)_systemGroupBackgroundCellColor;
+ (id)_systemGroupBackgroundColor;
+ (id)_systemGroupedBackgroundColor;
+ (id)_systemInteractionTintColor;
+ (id)_systemMidGrayTintColor;
+ (id)_systemSelectedColor;
+ (id)_tertiaryFillColor;
+ (id)_tertiaryLabelColor;
+ (id)_tertiarySystemBackgroundColor;
+ (id)_tertiarySystemGroupedBackgroundColor;
+ (id)_textFieldBackgroundColor;
+ (id)_textFieldBorderColor;
+ (id)_textFieldDisabledBackgroundColor;
+ (id)_textFieldDisabledBorderColor;
+ (id)_translucentPaperTextureColor;
+ (id)_tvAppKeyColorOrDefaultTint;
+ (id)_tvInterfaceStyleDarkContentColor;
+ (id)_tvInterfaceStyleLightContentColor;
+ (id)_tvLabelOpacityAColor;
+ (id)_tvLabelOpacityBColor;
+ (id)_tvLabelOpacityCColor;
+ (id)_unfocusedCarSystemColor:(id)a3;
+ (id)_vibrantDarkFillDodgeColor;
+ (id)_vibrantLightDividerBurnColor;
+ (id)_vibrantLightDividerDarkeningColor;
+ (id)_vibrantLightFillBurnColor;
+ (id)_vibrantLightFillDarkeningColor;
+ (id)_vibrantLightSectionDelimiterDividerBurnColor;
+ (id)_vibrantLightSectionDelimiterDividerDarkeningColor;
+ (id)_webContentBackgroundColor;
+ (id)_windowBackgroundColor;
+ (id)candidateRowBackgroundColor;
+ (id)candidateRowHighlightedColor;
+ (id)classFallbacksForKeyedArchiver;
+ (id)externalSystemGreenColor;
+ (id)externalSystemRedColor;
+ (id)externalSystemTealColor;
+ (id)infoTextOverPinStripeTextColor;
+ (id)insertionPointColor;
+ (id)keyboardFocusIndicatorColor;
+ (id)lineSeparatorColor;
+ (id)noContentDarkGradientBackgroundColor;
+ (id)noContentLightGradientBackgroundColor;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)pinStripeColor;
+ (id)sectionHeaderBackgroundColor;
+ (id)sectionHeaderBorderColor;
+ (id)sectionHeaderOpaqueBackgroundColor;
+ (id)sectionListBorderColor;
+ (id)selectionGrabberColor;
+ (id)selectionHighlightColor;
+ (id)systemBlackColor;
+ (id)systemDarkBlueColor;
+ (id)systemDarkExtraLightGrayColor;
+ (id)systemDarkExtraLightGrayTintColor;
+ (id)systemDarkGrayColor;
+ (id)systemDarkGrayTintColor;
+ (id)systemDarkGreenColor;
+ (id)systemDarkLightGrayColor;
+ (id)systemDarkLightGrayTintColor;
+ (id)systemDarkLightMidGrayColor;
+ (id)systemDarkLightMidGrayTintColor;
+ (id)systemDarkMidGrayColor;
+ (id)systemDarkMidGrayTintColor;
+ (id)systemDarkOrangeColor;
+ (id)systemDarkPinkColor;
+ (id)systemDarkPurpleColor;
+ (id)systemDarkRedColor;
+ (id)systemDarkTealColor;
+ (id)systemDarkYellowColor;
+ (id)systemExtraLightGrayColor;
+ (id)systemExtraLightGrayTintColor;
+ (id)systemGrayTintColor;
+ (id)systemLightGrayColor;
+ (id)systemLightGrayTintColor;
+ (id)systemLightMidGrayColor;
+ (id)systemLightMidGrayTintColor;
+ (id)systemMidGrayColor;
+ (id)systemMidGrayTintColor;
+ (id)systemWhiteColor;
+ (id)tableBackgroundColor;
+ (id)tableCellBackgroundColor;
+ (id)tableCellBlueTextColor;
+ (id)tableCellDefaultSelectionTintColor;
+ (id)tableCellDisabledBackgroundColor;
+ (id)tableCellFocusedBackgroundColor;
+ (id)tableCellGrayTextColor;
+ (id)tableCellGroupedBackgroundColor;
+ (id)tableCellGroupedBackgroundColorLegacyWhite;
+ (id)tableCellGroupedSelectedBackgroundColor;
+ (id)tableCellHighlightedBackgroundColor;
+ (id)tableCellPlainBackgroundColor;
+ (id)tableCellPlainSelectedBackgroundColor;
+ (id)tableCellValue1BlueColor;
+ (id)tableCellValue2BlueColor;
+ (id)tableCellbackgroundColorCarPlay;
+ (id)tableGroupedSeparatorLightColor;
+ (id)tableGroupedTopShadowColor;
+ (id)tablePlainHeaderFooterBackgroundColor;
+ (id)tablePlainHeaderFooterFloatingBackgroundColor;
+ (id)tableSelectionColor;
+ (id)tableSelectionGradientEndColor;
+ (id)tableSelectionGradientStartColor;
+ (id)tableSeparatorColor;
+ (id)tableSeparatorDarkColor;
+ (id)tableSeparatorLightColor;
+ (id)tableShadowColor;
+ (id)textFieldAtomBlueColor;
+ (id)textFieldAtomPurpleColor;
+ (id)textGrammarIndicatorColor;
+ (void)initialize;
- (BOOL)_isDeepColor;
- (BOOL)_isDynamic;
- (BOOL)_isDynamicTintColor;
- (BOOL)_isOpaque;
- (BOOL)_isSimilarToColor:(id)a3 withinPercentage:(double)a4;
- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha;
- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;
- (BOOL)getWhite:(CGFloat *)white alpha:(CGFloat *)alpha;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPatternColor;
- (CGColor)cgColor;
- (CGColorRef)CGColor;
- (CIColor)CIColor;
- (Class)classForCoder;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSString)_accessibilityNameWithLuma;
- (NSString)_systemColorName;
- (NSString)accessibilityName;
- (UIColor)colorWithAlphaComponent:(CGFloat)alpha;
- (UIColor)colorWithProminence:(int64_t)a3;
- (UIColor)initWithCGColor:(CGColorRef)cgColor;
- (UIColor)initWithCIColor:(CIColor *)ciColor;
- (UIColor)initWithCoder:(id)a3;
- (UIColor)initWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor)initWithDynamicProvider:(void *)dynamicProvider;
- (UIColor)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
- (UIColor)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (UIColor)initWithPatternImage:(UIImage *)image;
- (UIColor)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
- (UIColor)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha;
- (double)_colorDifferenceFromColor:(id)a3;
- (double)_distanceFrom:(id)a3;
- (double)_luminance;
- (double)_luminanceDifferenceFromColor:(id)a3;
- (double)alphaComponent;
- (id)_colorBlendedWithColor:(id)a3;
- (id)_colorBlendedWithColor:(id)a3 compositingFilter:(id)a4;
- (id)_colorBlendedWithColors:(id)a3;
- (id)_debugCatalogBundleIdentifier;
- (id)_debugName;
- (id)_inverseColor;
- (id)_resolvedBackgroundColorWithTraitCollection:(void *)a1;
- (id)_resolvedMaterialWithTraitCollection:(id)a3;
- (id)colorSpaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)styleString;
- (int64_t)prominence;
- (unint64_t)hash;
- (void)_setDebugCatalogBundleIdentifier:(id)a3;
- (void)_setDebugName:(id)a3;
- (void)_setSystemColorName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIColor

- (UIColor)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  id v10 = objc_allocWithZone((Class)UIDeviceRGBColor);
  return (UIColor *)[v10 initWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == a1)
  {
    UIColorPlaceholder();
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___UIColor;
    v6 = objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
  }
  v7 = v6;

  return v7;
}

- (BOOL)_isDynamicTintColor
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStyleString, 0);
  objc_storeStrong((id *)&self->_systemColorName, 0);
}

+ (id)_appKeyColorOrDefaultTint
{
  self;
  v0 = +[UIColor _appKeyColor]();
  v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    id v2 = +[UIColor systemBlueColor];
  }
  v3 = v2;

  return v3;
}

+ (id)_appKeyColor
{
  self;
  if (qword_1EB25DB20 != -1) {
    dispatch_once(&qword_1EB25DB20, &__block_literal_global_1347_0);
  }
  v0 = (void *)qword_1EB25DB18;
  return v0;
}

+ (UIColor)systemBlueColor
{
  if (qword_1EB25DF10 != -1) {
    dispatch_once(&qword_1EB25DF10, &__block_literal_global_1897);
  }
  id v2 = (void *)qword_1EB25DF08;
  return (UIColor *)v2;
}

- (NSString)_systemColorName
{
  return self->_systemColorName;
}

- (id)_resolvedBackgroundColorWithTraitCollection:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    if ([v3 accessibilityContrast] != 1 || objc_msgSend(v3, "userInterfaceStyle") != 2) {
      goto LABEL_9;
    }
    id v5 = +[UIColor systemGray2Color];

    v6 = +[UIColor systemGray3Color];
    id v7 = v6;
    if (v5 != v4)
    {

      v8 = +[UIColor systemGray4Color];
      id v9 = v8;
      if (v7 == v4) {
        goto LABEL_15;
      }

      id v10 = +[UIColor systemGray5Color];
      id v7 = v10;
      if (v9 != v4)
      {

        v11 = +[UIColor systemGray6Color];
        id v9 = v11;
        if (v7 != v4)
        {

          if (v9 == v4)
          {
            id v12 = +[UIColor systemBlackColor];
            goto LABEL_10;
          }
LABEL_9:
          id v12 = v4;
LABEL_10:
          id v7 = v12;
          goto LABEL_11;
        }
LABEL_15:
        id v7 = v9;
      }
    }
LABEL_11:

    v13 = self;
    v14 = [v3 traitCollectionByReplacingNSIntegerValue:1 forTrait:v13];

    a1 = [v7 resolvedColorWithTraitCollection:v14];
  }
  return a1;
}

- (BOOL)_isDynamic
{
  return 0;
}

+ (UIColor)clearColor
{
  if (qword_1EB25D8F8 != -1) {
    dispatch_once(&qword_1EB25D8F8, &__block_literal_global_1230);
  }
  id v2 = (void *)qword_1EB25D8F0;
  return (UIColor *)v2;
}

+ (id)_systemColorWithUnvalidatedName:(id)a3
{
  id v4 = _selectorForColorName(a3);
  if (v4)
  {
    id v4 = [a1 performSelector:v4];
  }
  return v4;
}

+ (UIColor)secondarySystemBackgroundColor
{
  if (qword_1EB25E070 != -1) {
    dispatch_once(&qword_1EB25E070, &__block_literal_global_1964);
  }
  id v2 = (void *)qword_1EB25E068;
  return (UIColor *)v2;
}

+ (UIColor)systemOrangeColor
{
  if (qword_1EB25DEB0 != -1) {
    dispatch_once(&qword_1EB25DEB0, &__block_literal_global_1879);
  }
  id v2 = (void *)qword_1EB25DEA8;
  return (UIColor *)v2;
}

+ (UIColor)colorWithCGColor:(CGColorRef)cgColor
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!cgColor) {
    goto LABEL_18;
  }
  CFTypeID v4 = CFGetTypeID(cgColor);
  if (v4 != CGColorGetTypeID())
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Passing argument that is not a CGColor to %s", "+[UIColor colorWithCGColor:]");
      goto LABEL_5;
    }
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Color", &qword_1EB25D880) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "+[UIColor colorWithCGColor:]";
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Passing argument that is not a CGColor to %s. This will cause an exception to be thrown in the future.", buf, 0xCu);
    }
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
LABEL_5:
  ColorSpace = CGColorGetColorSpace(cgColor);
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  if (ColorSpace != (CGColorSpace *)qword_1EB25E408
    || (v6 = (void *)[objc_allocWithZone((Class)UIDeviceRGBColor) initWithCGColor:cgColor]) == 0)
  {
    if (qword_1EB25E400 != -1) {
      dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
    }
    if ((ColorSpace != (CGColorSpace *)qword_1EB25E3F8
       || (v6 = (void *)[objc_allocWithZone((Class)UIDeviceWhiteColor) initWithCGColor:cgColor]) == 0)&& (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern|| (v6 = objc_msgSend(objc_allocWithZone((Class)UIPatternCGColor), "initWithCGColor:", cgColor)) == 0))
    {
      v6 = (void *)[objc_allocWithZone((Class)UICGColor) initWithCGColor:cgColor];
    }
  }
LABEL_19:
  return (UIColor *)v6;
}

+ (UIColor)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  v6 = (void *)[objc_allocWithZone((Class)UIDeviceRGBColor) initWithRed:red green:green blue:blue alpha:alpha];
  return (UIColor *)v6;
}

+ (UIColor)tintColor
{
  if (qword_1EB25DE60 != -1) {
    dispatch_once(&qword_1EB25DE60, &__block_literal_global_1507);
  }
  id v2 = (void *)qword_1EB25DE58;
  return (UIColor *)v2;
}

+ (UIColor)separatorColor
{
  if (qword_1EB25E040 != -1) {
    dispatch_once(&qword_1EB25E040, &__block_literal_global_1955);
  }
  id v2 = (void *)qword_1EB25E038;
  return (UIColor *)v2;
}

+ (id)_secondaryLabelColor
{
  return +[UIColor secondaryLabelColor];
}

+ (id)insertionPointColor
{
  if (qword_1EB25DAE0 != -1) {
    dispatch_once(&qword_1EB25DAE0, &__block_literal_global_1335_0);
  }
  id v2 = (void *)qword_1EB25DAD8;
  return v2;
}

+ (id)selectionHighlightColor
{
  if (qword_1EB25DAD0 != -1) {
    dispatch_once(&qword_1EB25DAD0, &__block_literal_global_1332);
  }
  id v2 = (void *)qword_1EB25DAC8;
  return v2;
}

+ (id)selectionGrabberColor
{
  if (qword_1EB25DAF0 != -1) {
    dispatch_once(&qword_1EB25DAF0, &__block_literal_global_1338);
  }
  id v2 = (void *)qword_1EB25DAE8;
  return v2;
}

- (id)_colorBlendedWithColor:(id)a3 compositingFilter:(id)a4
{
  id v6 = a4;
  if (!a3
    || (double v58 = 0.0,
        double v59 = 0.0,
        double v56 = 0.0,
        double v57 = 0.0,
        [a3 getRed:&v59 green:&v58 blue:&v57 alpha:&v56],
        fabs(v56) < 2.22044605e-16))
  {
    id v7 = self;
    goto LABEL_10;
  }
  double v54 = 0.0;
  double v55 = 0.0;
  double v52 = 0.0;
  double v53 = 0.0;
  [(UIColor *)self getRed:&v55 green:&v54 blue:&v53 alpha:&v52];
  id v7 = self;
  if (!v6
    || ([v6 isEqualToString:*MEMORY[0x1E4F3A2B8]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x1E4F3A320]])
  {
    double v8 = 1.0;
    double v9 = 1.0 - v56;
    double v10 = v56 + (1.0 - v56) * v52;
    double v11 = 1.0;
    double v12 = 1.0;
    if (fabs(v10) >= 2.22044605e-16)
    {
      double v12 = (v56 * v59 + v9 * (v52 * v55)) / v10;
      double v11 = (v56 * v58 + v9 * (v52 * v54)) / v10;
      double v8 = (v56 * v57 + v9 * (v52 * v53)) / v10;
    }
    goto LABEL_9;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A2A0]])
  {
    double v15 = v56;
    double v16 = 1.0 - v56;
    double v12 = v59 * v55 * v56 + v55 * (1.0 - v56);
    double v17 = v53;
    double v11 = (1.0 - v56) * v54 + v56 * (v58 * v54);
    double v18 = v57 * v53;
LABEL_15:
    double v19 = v15 * v18;
    double v20 = v16 * v17;
LABEL_27:
    double v8 = v20 + v19;
LABEL_9:
    uint64_t v13 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v12, v11, v8);

    id v7 = (UIColor *)v13;
    goto LABEL_10;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A2F8]])
  {
    double v21 = v56;
    double v22 = 1.0 - v56;
    double v12 = v55 * (1.0 - v56) + v56 * (1.0 - (1.0 - v59) * (1.0 - v55));
    double v11 = (1.0 - v56) * v54 + v56 * (1.0 - (1.0 - v58) * (1.0 - v54));
    double v23 = v53;
    double v24 = 1.0 - (1.0 - v57) * (1.0 - v53);
LABEL_18:
    double v19 = v21 * v24;
    double v20 = v22 * v23;
    goto LABEL_27;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A2C8]])
  {
    double v25 = (v59 + v59) * v55;
    if (v55 >= 0.5) {
      double v25 = 1.0 - (1.0 - v59) * (1.0 - v55 + 1.0 - v55);
    }
    double v26 = 1.0 - v56;
    double v12 = v25 * v56 + v55 * (1.0 - v56);
    double v27 = (v58 + v58) * v54;
    if (v54 >= 0.5) {
      double v27 = 1.0 - (1.0 - v58) * (1.0 - v54 + 1.0 - v54);
    }
    double v11 = v26 * v54 + v56 * v27;
    double v28 = 1.0 - (1.0 - v57) * (1.0 - v53 + 1.0 - v53);
    if (v53 < 0.5) {
      double v28 = (v57 + v57) * v53;
    }
    double v19 = v56 * v28;
    double v20 = v26 * v53;
    goto LABEL_27;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A070]])
  {
    double v29 = v59;
    double v15 = v56;
    if (v59 > v55) {
      double v29 = v55;
    }
    double v16 = 1.0 - v56;
    double v12 = v56 * v29 + v55 * (1.0 - v56);
    double v30 = v58;
    double v17 = v53;
    if (v58 > v54) {
      double v30 = v54;
    }
    double v11 = v16 * v54 + v56 * v30;
    double v18 = v57;
    if (v57 > v53) {
      double v18 = v53;
    }
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A220]])
  {
    double v31 = v59;
    double v15 = v56;
    if (v59 < v55) {
      double v31 = v55;
    }
    double v16 = 1.0 - v56;
    double v12 = v56 * v31 + v55 * (1.0 - v56);
    double v32 = v58;
    double v17 = v53;
    if (v58 < v54) {
      double v32 = v54;
    }
    double v11 = v16 * v54 + v56 * v32;
    double v18 = v57;
    if (v57 < v53) {
      double v18 = v53;
    }
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A018]])
  {
    double v33 = 1.0;
    double v34 = 1.0;
    if (fabs(v59) >= 2.22044605e-16) {
      double v34 = v55 / (1.0 - v59);
    }
    double v35 = v34 * v56;
    double v36 = 1.0 - v56;
    if (fabs(v58) >= 2.22044605e-16) {
      double v33 = v54 / (1.0 - v58);
    }
    double v12 = v35 + v55 * (1.0 - v56);
    double v11 = v36 * v54 + v56 * v33;
    double v37 = 1.0;
    if (fabs(v57) >= 2.22044605e-16) {
      double v37 = v53 / (1.0 - v57);
    }
    double v19 = v56 * v37;
    double v20 = v36 * v53;
    goto LABEL_27;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A008]])
  {
    double v38 = v55 * v52;
    double v39 = 0.0;
    double v40 = 0.0;
    if (fabs(v59) >= 2.22044605e-16) {
      double v40 = 1.0 - (1.0 - v38) / v59;
    }
    double v41 = v40 * v56;
    double v42 = 1.0 - v56;
    double v43 = v38 * (1.0 - v56);
    double v44 = v52 * v54;
    if (fabs(v58) >= 2.22044605e-16) {
      double v39 = 1.0 - (1.0 - v44) / v58;
    }
    double v12 = v41 + v43;
    double v11 = v42 * v44 + v56 * v39;
    double v45 = v52 * v53;
    double v46 = 0.0;
    if (fabs(v57) >= 2.22044605e-16) {
      double v46 = 1.0 - (1.0 - v45) / v57;
    }
    double v8 = v42 * v45 + v56 * v46;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A2E8]])
  {
    double v21 = v56;
    double v22 = 1.0 - v56;
    double v12 = v55 * (1.0 - v56) + v56 * fmin(v59 + v55, 1.0);
    double v23 = v53;
    double v11 = (1.0 - v56) * v54 + v56 * fmin(v58 + v54, 1.0);
    double v24 = fmin(v57 + v53, 1.0);
    goto LABEL_18;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F3A2E0]])
  {
    double v47 = v56;
    double v48 = v52;
    double v49 = fmin(fmax(v56 + v52, 0.0), 1.0);
    double v50 = UIColorBlendPlusDarker(v59, v55, v56, v52, v49);
    double v51 = UIColorBlendPlusDarker(v58, v54, v47, v48, v49);
    double v8 = UIColorBlendPlusDarker(v57, v53, v47, v48, v49);
    double v12 = v50;
    double v11 = v51;
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (id)_colorBlendedWithColor:(id)a3
{
  return [(UIColor *)self _colorBlendedWithColor:a3 compositingFilter:0];
}

void __50__UIColor__InProgressSPI__tertiarySystemFillColor__block_invoke()
{
  v30[12] = *MEMORY[0x1E4F143B8];
  double v28 = [UIDynamicSystemColor alloc];
  double v27 = [NSString stringWithUTF8String:"tertiarySystemFillColor"];
  double v26 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v29[0] = v26;
  double v25 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.12];
  v30[0] = v25;
  double v24 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v29[1] = v24;
  double v23 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.2];
  v30[1] = v23;
  double v22 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v29[2] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.24];
  v30[2] = v21;
  double v20 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v29[3] = v20;
  double v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.32];
  v30[3] = v19;
  double v18 = _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v29[4] = v18;
  double v17 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.12];
  v30[4] = v17;
  double v16 = _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v29[5] = v16;
  double v15 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.12];
  v30[5] = v15;
  v14 = _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v29[6] = v14;
  uint64_t v13 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.12];
  v30[6] = v13;
  double v12 = _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v29[7] = v12;
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.12];
  v30[7] = v0;
  v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v29[8] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
  v30[8] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v29[9] = v3;
  CFTypeID v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.16];
  v30[9] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v29[10] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v30[10] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v29[11] = v7;
  double v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.12];
  v30[11] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  double v11 = (void *)qword_1EB25E0F8;
  qword_1EB25E0F8 = (uint64_t)v10;
}

+ (UIColor)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha
{
  CFTypeID v4 = (void *)[objc_allocWithZone((Class)UIDeviceWhiteColor) initWithWhite:white alpha:alpha];
  return (UIColor *)v4;
}

+ (UIColor)whiteColor
{
  if (qword_1EB25D8D8 != -1) {
    dispatch_once(&qword_1EB25D8D8, &__block_literal_global_1224);
  }
  id v2 = (void *)qword_1EB25D8D0;
  return (UIColor *)v2;
}

+ (id)__halfTransparentBlackColor
{
  if (qword_1EB25DA98 != -1) {
    dispatch_once(&qword_1EB25DA98, &__block_literal_global_1309_0);
  }
  id v2 = (void *)qword_1EB25DA90;
  return v2;
}

+ (UIColor)systemGreenColor
{
  if (qword_1EB25DED0 != -1) {
    dispatch_once(&qword_1EB25DED0, &__block_literal_global_1885);
  }
  id v2 = (void *)qword_1EB25DEC8;
  return (UIColor *)v2;
}

+ (id)__halfTransparentWhiteColor
{
  if (qword_1EB25DAA8 != -1) {
    dispatch_once(&qword_1EB25DAA8, &__block_literal_global_1311);
  }
  id v2 = (void *)qword_1EB25DAA0;
  return v2;
}

+ (UIColor)blackColor
{
  if (qword_1EB25D8A8 != -1) {
    dispatch_once(&qword_1EB25D8A8, &__block_literal_global_1214);
  }
  id v2 = (void *)qword_1EB25D8A0;
  return (UIColor *)v2;
}

+ (UIColor)systemRedColor
{
  if (qword_1EB25DEA0 != -1) {
    dispatch_once(&qword_1EB25DEA0, &__block_literal_global_1875);
  }
  id v2 = (void *)qword_1EB25DE98;
  return (UIColor *)v2;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1) {
    id v4 = UIColorPlaceholder();
  }
}

void __36__UIColor__systemColorSelectorTable__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:0];
  v0 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:258];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyPointerFunctions:v3 valuePointerFunctions:v0 capacity:64];
  id v2 = (void *)qword_1EB25D888;
  qword_1EB25D888 = v1;

  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tintColor", sel_tintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"blackColor", sel_blackColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"darkGrayColor", sel_darkGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"lightGrayColor", sel_lightGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"whiteColor", sel_whiteColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"grayColor", sel_grayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"clearColor", sel_clearColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"redColor", sel_redColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"greenColor", sel_greenColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"blueColor", sel_blueColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"cyanColor", sel_cyanColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"yellowColor", sel_yellowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"magentaColor", sel_magentaColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"orangeColor", sel_orangeColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"purpleColor", sel_purpleColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"brownColor", sel_brownColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableBackgroundColor", sel_tableBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellPlainBackgroundColor", sel_tableCellPlainBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellGroupedBackgroundColorLegacyWhite", sel_tableCellGroupedBackgroundColorLegacyWhite);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellBackgroundColor", sel_tableCellBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellbackgroundColorCarPlay", sel_tableCellbackgroundColorCarPlay);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tablePlainHeaderFooterBackgroundColor", sel_tablePlainHeaderFooterBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tablePlainHeaderFooterFloatingBackgroundColor", sel_tablePlainHeaderFooterFloatingBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSelectionColor", sel_tableSelectionColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSelectionGradientStartColor", sel_tableSelectionGradientStartColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSelectionGradientEndColor", sel_tableSelectionGradientEndColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableShadowColor", sel_tableShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableGroupedTopShadowColor", sel_tableGroupedTopShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"sectionListBorderColor", sel_sectionListBorderColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"sectionHeaderBackgroundColor", sel_sectionHeaderBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"sectionHeaderOpaqueBackgroundColor", sel_sectionHeaderOpaqueBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"sectionHeaderBorderColor", sel_sectionHeaderBorderColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellValue1BlueColor", sel_tableCellValue1BlueColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellValue2BlueColor", sel_tableCellValue2BlueColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellGrayTextColor", sel_tableCellGrayTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"textFieldAtomPurpleColor", sel_textFieldAtomPurpleColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"infoTextOverPinStripeTextColor", sel_infoTextOverPinStripeTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellDefaultSelectionTintColor", sel_tableCellDefaultSelectionTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellPlainSelectedBackgroundColor", sel_tableCellPlainSelectedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellGroupedSelectedBackgroundColor", sel_tableCellGroupedSelectedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellHighlightedBackgroundColor", sel_tableCellHighlightedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellFocusedBackgroundColor", sel_tableCellFocusedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellDisabledBackgroundColor", sel_tableCellDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"__halfTransparentBlackColor", sel___halfTransparentBlackColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"__halfTransparentWhiteColor", sel___halfTransparentWhiteColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_windowBackgroundColor", sel__windowBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"pinStripeColor", sel_pinStripeColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"selectionHighlightColor", sel_selectionHighlightColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"insertionPointColor", sel_insertionPointColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"selectionGrabberColor", sel_selectionGrabberColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"lightTextColor", sel_lightTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"darkTextColor", sel_darkTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_markedTextBackgroundColor", sel__markedTextBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemRedColor", sel_systemRedColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGreenColor", sel_systemGreenColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemBlueColor", sel_systemBlueColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemOrangeColor", sel_systemOrangeColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemYellowColor", sel_systemYellowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemMintColor", sel_systemMintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemCyanColor", sel_systemCyanColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemTealColor", sel_systemTealColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemPinkColor", sel_systemPinkColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGrayColor", sel_systemGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemMidGrayColor", sel_systemMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemPurpleColor", sel_systemPurpleColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkRedColor", sel_systemDarkRedColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkGreenColor", sel_systemDarkGreenColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkBlueColor", sel_systemDarkBlueColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkOrangeColor", sel_systemDarkOrangeColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkYellowColor", sel_systemDarkYellowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkTealColor", sel_systemDarkTealColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkPinkColor", sel_systemDarkPinkColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkPurpleColor", sel_systemDarkPurpleColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemWhiteColor", sel_systemWhiteColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemExtraLightGrayColor", sel_systemExtraLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemLightGrayColor", sel_systemLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemLightMidGrayColor", sel_systemLightMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemBlackColor", sel_systemBlackColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkExtraLightGrayColor", sel_systemDarkExtraLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkLightGrayColor", sel_systemDarkLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkLightMidGrayColor", sel_systemDarkLightMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkMidGrayColor", sel_systemDarkMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkGrayColor", sel_systemDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemExtraLightGrayTintColor", sel_systemExtraLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemLightGrayTintColor", sel_systemLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemLightMidGrayTintColor", sel_systemLightMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemMidGrayTintColor", sel_systemMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGrayTintColor", sel_systemGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkExtraLightGrayTintColor", sel_systemDarkExtraLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkLightGrayTintColor", sel_systemDarkLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkLightMidGrayTintColor", sel_systemDarkLightMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkMidGrayTintColor", sel_systemDarkMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemDarkGrayTintColor", sel_systemDarkGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"textGrammarIndicatorColor", sel_textGrammarIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"externalSystemTealColor", sel_externalSystemTealColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"externalSystemRedColor", sel_externalSystemRedColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"externalSystemGreenColor", sel_externalSystemGreenColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_systemInteractionTintColor", sel__systemInteractionTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_systemDestructiveTintColor", sel__systemDestructiveTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_barHairlineShadowColor", sel__barHairlineShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_barStyleBlackHairlineShadowColor", sel__barStyleBlackHairlineShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_systemMidGrayTintColor", sel__systemMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemWhiteColor", sel__externalSystemWhiteColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemMidGrayColor", sel__externalSystemMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemGrayColor", sel__externalSystemGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemDarkGrayColor", sel__externalSystemDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemExtraDarkGrayColor", sel__externalSystemExtraDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_externalSystemSuperDarkGrayColor", sel__externalSystemSuperDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_accessibilityButtonShapesBackgroundColorOnLight", sel__accessibilityButtonShapesBackgroundColorOnLight);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_accessibilityButtonShapesBackgroundColorOnDark", sel__accessibilityButtonShapesBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_accessibilityButtonShapesDisabledBackgroundColorOnDark", sel__accessibilityButtonShapesDisabledBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight", sel__accessibilityButtonShapesNoBlendModeBackgroundColorOnLight);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark", sel__accessibilityButtonShapesNoBlendModeBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_controlForegroundColor", sel__controlForegroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_controlHighlightColor", sel__controlHighlightColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_controlShadowColor", sel__controlShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_controlVibrantTopBackgroundColor", sel__controlVibrantTopBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_controlVibrantBottomBackgroundColor", sel__controlVibrantBottomBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_swiftColor", sel__swiftColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_translucentPaperTextureColor", sel__translucentPaperTextureColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_webContentBackgroundColor", sel__webContentBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellBlueTextColor", sel_tableCellBlueTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableCellGroupedBackgroundColor", sel_tableCellGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableGroupedSeparatorLightColor", sel_tableGroupedSeparatorLightColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSeparatorDarkColor", sel_tableSeparatorDarkColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSeparatorLightColor", sel_tableSeparatorLightColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"groupTableViewBackgroundColor", sel_groupTableViewBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"viewFlipsideBackgroundColor", sel_viewFlipsideBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"underPageBackgroundColor", sel_underPageBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"scrollViewTexturedBackgroundColor", sel_scrollViewTexturedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"noContentLightGradientBackgroundColor", sel_noContentLightGradientBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"noContentDarkGradientBackgroundColor", sel_noContentDarkGradientBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemIndigoColor", sel_systemIndigoColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemBrownColor", sel_systemBrownColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"labelColor", sel_labelColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"secondaryLabelColor", sel_secondaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tertiaryLabelColor", sel_tertiaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"quaternaryLabelColor", sel_quaternaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"linkColor", sel_linkColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"placeholderTextColor", sel_placeholderTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"separatorColor", sel_separatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"opaqueSeparatorColor", sel_opaqueSeparatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemBackgroundColor", sel_systemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"secondarySystemBackgroundColor", sel_secondarySystemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tertiarySystemBackgroundColor", sel_tertiarySystemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGroupedBackgroundColor", sel_systemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"secondarySystemGroupedBackgroundColor", sel_secondarySystemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tertiarySystemGroupedBackgroundColor", sel_tertiarySystemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemFillColor", sel_systemFillColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"secondarySystemFillColor", sel_secondarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tertiarySystemFillColor", sel_tertiarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"quaternarySystemFillColor", sel_quaternarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGray2Color", sel_systemGray2Color);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGray3Color", sel_systemGray3Color);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGray4Color", sel_systemGray4Color);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGray5Color", sel_systemGray5Color);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"systemGray6Color", sel_systemGray6Color);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_dynamicTestColor", sel__dynamicTestColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_textFieldBackgroundColor", sel__textFieldBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_textFieldDisabledBackgroundColor", sel__textFieldDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_textFieldBorderColor", sel__textFieldBorderColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_textFieldDisabledBorderColor", sel__textFieldDisabledBorderColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"tableSeparatorColor", sel_tableSeparatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_plainTableHeaderFooterTextColor", sel__plainTableHeaderFooterTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_groupTableHeaderFooterTextColor", sel__groupTableHeaderFooterTextColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_swipedSidebarCellBackgroundColor", sel__swipedSidebarCellBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_switchOffColor", sel__switchOffColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_switchOffImageColor", sel__switchOffImageColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_searchFieldDisabledBackgroundColor", sel__searchFieldDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_pageControlIndicatorColor", sel__pageControlIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_pageControlPlatterIndicatorColor", sel__pageControlPlatterIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_searchFieldPlaceholderTextClearButtonColor", sel__searchFieldPlaceholderTextClearButtonColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_searchBarBackgroundColor", sel__searchBarBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_alertControllerDimmingViewColor", sel__alertControllerDimmingViewColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_systemChromeShadowColor", sel__systemChromeShadowColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_splitViewBorderColor", sel__splitViewBorderColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_systemBlueColor2", sel__systemBlueColor2);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_monochromeCellImageTintColor", sel__monochromeCellImageTintColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemPrimaryColor", sel__carSystemPrimaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemSecondaryColor", sel__carSystemSecondaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemTertiaryColor", sel__carSystemTertiaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemQuaternaryColor", sel__carSystemQuaternaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemFocusColor", sel__carSystemFocusColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemFocusLabelColor", sel__carSystemFocusLabelColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemFocusPrimaryColor", sel__carSystemFocusPrimaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_carSystemFocusSecondaryColor", sel__carSystemFocusSecondaryColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_tvLabelOpacityAColor", sel__tvLabelOpacityAColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_tvLabelOpacityBColor", sel__tvLabelOpacityBColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_tvLabelOpacityCColor", sel__tvLabelOpacityCColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_tvInterfaceStyleLightContentColor", sel__tvInterfaceStyleLightContentColor);
  NSMapInsert((NSMapTable *)qword_1EB25D888, @"_tvInterfaceStyleDarkContentColor", sel__tvInterfaceStyleDarkContentColor);
}

+ (id)_disabledColorForColor:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    id v3 = objc_getAssociatedObject(v2, &_MergedGlobals_19_5);
    if (v3)
    {
      id v4 = v3;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __34__UIColor__disabledColorForColor___block_invoke;
      v10[3] = &unk_1E52DA210;
      id v6 = v2;
      id v11 = v6;
      id v7 = +[UIColor colorWithDynamicProvider:v10];
      objc_setAssociatedObject(v6, &_MergedGlobals_19_5, v7, (void *)1);
      id v4 = v7;
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Caller passed nil color for deriving a disabled color.", buf, 2u);
      }
    }
    else
    {
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D898) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Caller passed nil color for deriving a disabled color.", buf, 2u);
      }
    }
    id v4 = 0;
  }

  return v4;
}

+ (UIColor)tertiaryLabelColor
{
  if (qword_1EB25DF90 != -1) {
    dispatch_once(&qword_1EB25DF90, &__block_literal_global_1921);
  }
  id v2 = (void *)qword_1EB25DF88;
  return (UIColor *)v2;
}

+ (UIColor)systemGrayColor
{
  if (qword_1EB25DF50 != -1) {
    dispatch_once(&qword_1EB25DF50, &__block_literal_global_1909);
  }
  id v2 = (void *)qword_1EB25DF48;
  return (UIColor *)v2;
}

+ (id)systemWhiteColor
{
  if (qword_1EB25DB60 != -1) {
    dispatch_once(&qword_1EB25DB60, &__block_literal_global_1356_0);
  }
  id v2 = (void *)qword_1EB25DB58;
  return v2;
}

+ (id)_pageControlIndicatorColor
{
  if (qword_1EB25E150 != -1) {
    dispatch_once(&qword_1EB25E150, &__block_literal_global_2004);
  }
  id v2 = (void *)qword_1EB25E148;
  return v2;
}

+ (id)tableCellPlainBackgroundColor
{
  if (qword_1EB25E260 != -1) {
    dispatch_once(&qword_1EB25E260, &__block_literal_global_2055);
  }
  id v2 = (void *)qword_1EB25E258;
  return v2;
}

+ (UIColor)systemGray4Color
{
  if (qword_1EB25E000 != -1) {
    dispatch_once(&qword_1EB25E000, &__block_literal_global_1943);
  }
  id v2 = (void *)qword_1EB25DFF8;
  return (UIColor *)v2;
}

+ (id)tableCellGroupedBackgroundColor
{
  if (qword_1EB25E280 != -1) {
    dispatch_once(&qword_1EB25E280, &__block_literal_global_2061);
  }
  id v2 = (void *)qword_1EB25E278;
  return v2;
}

+ (id)tableCellPlainSelectedBackgroundColor
{
  return +[UIColor systemGray4Color];
}

- (UIColor)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha
{
  id v6 = objc_allocWithZone((Class)UIDeviceWhiteColor);
  return (UIColor *)[v6 initWithWhite:white alpha:alpha];
}

+ (UIColor)lightGrayColor
{
  if (qword_1EB25D8C8 != -1) {
    dispatch_once(&qword_1EB25D8C8, &__block_literal_global_1221_0);
  }
  id v2 = (void *)qword_1EB25D8C0;
  return (UIColor *)v2;
}

+ (UIColor)colorNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v7 = name;
  double v8 = bundle;
  double v9 = traitCollection;
  if (!v8)
  {
    double v8 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  id v10 = +[_UIAssetManager assetManagerForBundle:v8];
  id v11 = [v10 colorNamed:v7 withTraitCollection:v9];

  return (UIColor *)v11;
}

+ (id)_labelColor
{
  return +[UIColor labelColor];
}

+ (UIColor)systemGroupedBackgroundColor
{
  if (qword_1EB25E090 != -1) {
    dispatch_once(&qword_1EB25E090, &__block_literal_global_1970);
  }
  id v2 = (void *)qword_1EB25E088;
  return (UIColor *)v2;
}

+ (id)tableBackgroundColor
{
  if (qword_1EB25E250 != -1) {
    dispatch_once(&qword_1EB25E250, &__block_literal_global_2052);
  }
  id v2 = (void *)qword_1EB25E248;
  return v2;
}

+ (UIColor)secondaryLabelColor
{
  if (qword_1EB25DF80 != -1) {
    dispatch_once(&qword_1EB25DF80, &__block_literal_global_1918);
  }
  id v2 = (void *)qword_1EB25DF78;
  return (UIColor *)v2;
}

+ (UIColor)labelColor
{
  if (qword_1EB25DF70 != -1) {
    dispatch_once(&qword_1EB25DF70, &__block_literal_global_1915);
  }
  id v2 = (void *)qword_1EB25DF68;
  return (UIColor *)v2;
}

+ (UIColor)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
  id v6 = (void *)[objc_allocWithZone((Class)UIDeviceRGBColor) initWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
  return (UIColor *)v6;
}

+ (id)_systemColorWithName:(id)a3
{
  id v5 = a3;
  id v6 = _selectorForColorName(v5);
  if (!v6)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"UIColor.m", 1901, @"Invalid system color name: %@", v5 object file lineNumber description];
  }
  id v7 = [a1 performSelector:v6];

  return v7;
}

+ (id)_systemColorSelectorTable
{
  if (qword_1EB25D890 != -1) {
    dispatch_once(&qword_1EB25D890, &__block_literal_global_277);
  }
  id v2 = (void *)qword_1EB25D888;
  return v2;
}

+ (id)systemBlackColor
{
  if (qword_1EB25DBA0 != -1) {
    dispatch_once(&qword_1EB25DBA0, &__block_literal_global_1368);
  }
  id v2 = (void *)qword_1EB25DB98;
  return v2;
}

+ (id)_systemChromeShadowColor
{
  if (qword_1EB25E200 != -1) {
    dispatch_once(&qword_1EB25E200, &__block_literal_global_2037);
  }
  id v2 = (void *)qword_1EB25E1F8;
  return v2;
}

+ (id)_barStyleBlackHairlineShadowColor
{
  if (qword_1EB25DD80 != -1) {
    dispatch_once(&qword_1EB25DD80, &__block_literal_global_1458);
  }
  id v2 = (void *)qword_1EB25DD78;
  return v2;
}

+ (id)_tertiaryLabelColor
{
  return +[UIColor tertiaryLabelColor];
}

+ (UIColor)colorWithDynamicProvider:(void *)dynamicProvider
{
  id v3 = dynamicProvider;
  id v4 = [[UIDynamicProviderColor alloc] initWithProvider:v3];

  return (UIColor *)v4;
}

- (UIColor)initWithDynamicProvider:(void *)dynamicProvider
{
  id v4 = dynamicProvider;
  id v5 = [[UIDynamicProviderColor alloc] initWithProvider:v4];

  return &v5->super.super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_systemGroupedBackgroundColor
{
  return +[UIColor systemGroupedBackgroundColor];
}

- (BOOL)_isSimilarToColor:(id)a3 withinPercentage:(double)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    goto LABEL_42;
  }
  if (a4 < 0.00000011920929)
  {
    LOBYTE(self) = [(UIColor *)self isEqual:v6];
    goto LABEL_43;
  }
  id v7 = [(UIColor *)self CGColor];
  self = (UIColor *)[v6 CGColor];
  ColorSpace = CGColorGetColorSpace(v7);
  if (ColorSpace != CGColorGetColorSpace((CGColorRef)self))
  {
    double v9 = 0.0;
    if (v7)
    {
      Components = CGColorGetComponents(v7);
      CGFloat Alpha = CGColorGetAlpha(v7);
      CGColorSpaceRef v12 = CGColorGetColorSpace(v7);
      if (Components)
      {
        CGColorSpaceRef v13 = v12;
        long long v32 = 0u;
        long long v33 = 0u;
        if (qword_1EB25E410 != -1) {
          dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
        }
        if ((CGColorSpaceRef)qword_1EB25E408 == v13) {
          goto LABEL_15;
        }
        if (qword_1EB25E450 != -1) {
          dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
        }
        if ((CGColorSpaceRef)qword_1EB25E448 == v13)
        {
LABEL_15:
          double v9 = *Components;
          double v14 = Components[1];
          int v15 = 1;
          double v17 = Components[2];
          double v16 = Components[3];
          if (!self) {
            goto LABEL_43;
          }
          goto LABEL_27;
        }
        UISCreateCachedColorTransform();
        if (CGColorTransformConvertColorComponents())
        {
          *((CGFloat *)&v33 + 1) = Alpha;
          CGColorTransformRelease();
          Components = (const CGFloat *)&v32;
          goto LABEL_15;
        }
        CGColorTransformRelease();
      }
    }
    int v15 = 0;
    double v14 = 0.0;
    double v17 = 0.0;
    double v16 = 0.0;
    if (!self) {
      goto LABEL_43;
    }
LABEL_27:
    double v24 = CGColorGetComponents((CGColorRef)self);
    CGFloat v25 = CGColorGetAlpha((CGColorRef)self);
    CGColorSpaceRef v26 = CGColorGetColorSpace((CGColorRef)self);
    if (v24)
    {
      CGColorSpaceRef v27 = v26;
      long long v32 = 0u;
      long long v33 = 0u;
      if (qword_1EB25E410 != -1) {
        dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
      }
      if ((CGColorSpaceRef)qword_1EB25E408 != v27)
      {
        if (qword_1EB25E450 != -1) {
          dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
        }
        if ((CGColorSpaceRef)qword_1EB25E448 != v27)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            goto LABEL_42;
          }
          *((CGFloat *)&v33 + 1) = v25;
          CGColorTransformRelease();
          double v24 = (const CGFloat *)&v32;
        }
      }
      if (v15 && vabdd_f64(v9, *v24) <= a4 && vabdd_f64(v14, v24[1]) <= a4 && vabdd_f64(v17, v24[2]) <= a4)
      {
        LOBYTE(self) = vabdd_f64(v16, v24[3]) <= a4;
        goto LABEL_43;
      }
    }
LABEL_42:
    LOBYTE(self) = 0;
    goto LABEL_43;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v7);
  size_t v20 = CGColorGetNumberOfComponents((CGColorRef)self);
  if (has_internal_diagnostics)
  {
    if (NumberOfComponents != v20)
    {
      double v29 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v32) = 0;
        _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "Colors in the same space should have the same number of components", (uint8_t *)&v32, 2u);
      }
    }
  }
  else if (NumberOfComponents != v20)
  {
    double v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25DAB0) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Colors in the same space should have the same number of components", (uint8_t *)&v32, 2u);
    }
  }
  double v21 = CGColorGetComponents(v7);
  double v22 = CGColorGetComponents((CGColorRef)self);
  if (CGColorGetNumberOfComponents(v7))
  {
    size_t v23 = 0;
    LOBYTE(self) = 1;
    do
    {
      LOBYTE(self) = self & (vabdd_f64(v21[v23], v22[v23]) <= a4);
      ++v23;
    }
    while (CGColorGetNumberOfComponents(v7) > v23);
  }
  else
  {
    LOBYTE(self) = 1;
  }
LABEL_43:

  return (char)self;
}

+ (UIColor)systemFillColor
{
  if (qword_1EB25E0E0 != -1) {
    dispatch_once(&qword_1EB25E0E0, &__block_literal_global_1983);
  }
  id v2 = (void *)qword_1EB25E0D8;
  return (UIColor *)v2;
}

+ (id)tableSeparatorLightColor
{
  if (qword_1EB25E2B0 != -1) {
    dispatch_once(&qword_1EB25E2B0, &__block_literal_global_2070);
  }
  id v2 = (void *)qword_1EB25E2A8;
  return v2;
}

+ (id)tableSeparatorDarkColor
{
  if (qword_1EB25E2A0 != -1) {
    dispatch_once(&qword_1EB25E2A0, &__block_literal_global_2067);
  }
  id v2 = (void *)qword_1EB25E298;
  return v2;
}

+ (id)tableCellDefaultSelectionTintColor
{
  return +[UIColor tableCellPlainSelectedBackgroundColor];
}

- (CGColor)cgColor
{
  id v2 = self;
  return [(UIColor *)v2 CGColor];
}

+ (id)_switchOffColor
{
  if (qword_1EB25E120 != -1) {
    dispatch_once(&qword_1EB25E120, &__block_literal_global_1995);
  }
  id v2 = (void *)qword_1EB25E118;
  return v2;
}

+ (id)_switchOffImageColor
{
  if (qword_1EB25E130 != -1) {
    dispatch_once(&qword_1EB25E130, &__block_literal_global_1998);
  }
  id v2 = (void *)qword_1EB25E128;
  return v2;
}

id __34__UIColor__disabledColorForColor___block_invoke(uint64_t a1, void *a2)
{
  double v9 = 0.0;
  double v10 = 0.0;
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 resolvedColorWithTraitCollection:v3];
  id v5 = v4;
  if (v4) {
    [v4 getWhite:&v10 alpha:&v9];
  }

  BOOL v6 = [v3 userInterfaceStyle] == 2;
  id v7 = +[UIColor colorWithWhite:v10 alpha:dbl_186B97280[v6] * v9];
  return v7;
}

+ (id)_quaternaryLabelColor
{
  return +[UIColor quaternaryLabelColor];
}

+ (id)_separatorColor
{
  return +[UIColor separatorColor];
}

+ (id)_secondarySystemGroupedBackgroundColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor];
}

+ (UIColor)quaternarySystemFillColor
{
  if (qword_1EB25E110 != -1) {
    dispatch_once(&qword_1EB25E110, &__block_literal_global_1992);
  }
  id v2 = (void *)qword_1EB25E108;
  return (UIColor *)v2;
}

+ (UIColor)quaternaryLabelColor
{
  if (qword_1EB25DFA0 != -1) {
    dispatch_once(&qword_1EB25DFA0, &__block_literal_global_1924);
  }
  id v2 = (void *)qword_1EB25DF98;
  return (UIColor *)v2;
}

+ (UIColor)secondarySystemFillColor
{
  if (qword_1EB25E0F0 != -1) {
    dispatch_once(&qword_1EB25E0F0, &__block_literal_global_1986);
  }
  id v2 = (void *)qword_1EB25E0E8;
  return (UIColor *)v2;
}

+ (UIColor)systemYellowColor
{
  if (qword_1EB25DEC0 != -1) {
    dispatch_once(&qword_1EB25DEC0, &__block_literal_global_1882);
  }
  id v2 = (void *)qword_1EB25DEB8;
  return (UIColor *)v2;
}

+ (UIColor)systemPinkColor
{
  if (qword_1EB25DF40 != -1) {
    dispatch_once(&qword_1EB25DF40, &__block_literal_global_1906);
  }
  id v2 = (void *)qword_1EB25DF38;
  return (UIColor *)v2;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)classFallbacksForKeyedArchiver
{
  return &unk_1ED3EFCF8;
}

+ (id)_disambiguated_due_to_CIImage_colorWithCGColor:(CGColor *)a3
{
  return +[UIColor colorWithCGColor:a3];
}

+ (UIColor)secondarySystemGroupedBackgroundColor
{
  if (qword_1EB25E0A0 != -1) {
    dispatch_once(&qword_1EB25E0A0, &__block_literal_global_1973);
  }
  id v2 = (void *)qword_1EB25E098;
  return (UIColor *)v2;
}

+ (id)_carSystemFocusColor
{
  if (qword_1EB25E3A0 != -1) {
    dispatch_once(&qword_1EB25E3A0, &__block_literal_global_2115);
  }
  id v2 = (void *)qword_1EB25E398;
  return v2;
}

+ (id)_alternateSystemInteractionTintColor
{
  return +[UIColor _carSystemFocusColor];
}

+ (id)_textFieldBorderColor
{
  if (qword_1EB25E230 != -1) {
    dispatch_once(&qword_1EB25E230, &__block_literal_global_2046);
  }
  id v2 = (void *)qword_1EB25E228;
  return v2;
}

+ (UIColor)tertiarySystemFillColor
{
  if (qword_1EB25E100 != -1) {
    dispatch_once(&qword_1EB25E100, &__block_literal_global_1989);
  }
  id v2 = (void *)qword_1EB25E0F8;
  return (UIColor *)v2;
}

+ (id)_textFieldBackgroundColor
{
  if (qword_1EB25E210 != -1) {
    dispatch_once(&qword_1EB25E210, &__block_literal_global_2040);
  }
  id v2 = (void *)qword_1EB25E208;
  return v2;
}

- (UIColor)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
  id v10 = objc_allocWithZone((Class)UIDeviceRGBColor);
  return (UIColor *)[v10 initWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor)systemBackgroundColor
{
  if (qword_1EB25E060 != -1) {
    dispatch_once(&qword_1EB25E060, &__block_literal_global_1961);
  }
  id v2 = (void *)qword_1EB25E058;
  return (UIColor *)v2;
}

- (UIColor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIDynamicModifiedBaseColor"];
  BOOL v6 = v5;
  if (!v5 || ![v5 _isDynamic])
  {
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIDynamicCatalogName"];
    if ([v11 length])
    {
      if ([v4 decodeBoolForKey:@"UIDynamicCatalogUseNibBundle"])
      {
        CGColorSpaceRef v12 = UIResourceBundleForNIBBeingDecodedWithCoder(v4);
      }
      else
      {
        CGColorSpaceRef v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIDynamicCatalogBundleIdentifier"];
        double v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIDynamicCatalogBundleLibraryName"];
        CGColorSpaceRef v12 = [MEMORY[0x1E4F28B50] _bundleWithIdentifier:v13 andLibraryName:v14];
      }
      int v15 = +[UIColor colorNamed:v11 inBundle:v12 compatibleWithTraitCollection:0];

      if (v15) {
        goto LABEL_31;
      }
    }
    if (!initWithCoder__allowedClasses)
    {
      double v16 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
      size_t v20 = (void *)initWithCoder__allowedClasses;
      initWithCoder__allowedClasses = v19;
    }
    double v21 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    if ([v21 count])
    {
      int v15 = (UIColor *)-[UIDynamicAppDefinedColor initWithColorsByTraitCollection:]((id *)[UIDynamicAppDefinedColor alloc], v21);
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    double v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UISystemColorName"];
    size_t v23 = v22;
    if (v22)
    {
      double v24 = _selectorForColorName(v22);
      if (v24)
      {
        CGFloat v25 = v24;
        if (objc_opt_respondsToSelector())
        {
          CGColorSpaceRef v26 = +[UIColor performSelector:v25];

LABEL_29:
          self = v26;

          int v15 = self;
          goto LABEL_30;
        }
      }
      else if (([v4 containsValueForKey:@"UIColorComponentCount"] & 1) == 0)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460], @"Unknown system color name: %@", v23 format];
      }
    }
    int v27 = [v4 decodeIntForKey:@"UIColorComponentCount"];
    if (v27 == 2)
    {
      double v32 = _UIColorDecodeComponentForKey(v4, @"UIWhite", @"UIWhite-Double");
      double v33 = _UIColorDecodeComponentForKey(v4, @"UIAlpha", @"UIAlpha-Double");
      uint64_t v34 = self;
      double v35 = v32;
    }
    else
    {
      if (v27 == 4)
      {
        double v28 = _UIColorDecodeComponentForKey(v4, @"UIRed", @"UIRed-Double");
        double v29 = _UIColorDecodeComponentForKey(v4, @"UIGreen", @"UIGreen-Double");
        double v30 = _UIColorDecodeComponentForKey(v4, @"UIBlue", @"UIBlue-Double");
        double v31 = [(UIColor *)self initWithRed:v28 green:v29 blue:v30 alpha:_UIColorDecodeComponentForKey(v4, @"UIAlpha", @"UIAlpha-Double")];
LABEL_28:
        CGColorSpaceRef v26 = v31;
        goto LABEL_29;
      }
      double v35 = 1.0;
      double v33 = 0.0;
      uint64_t v34 = self;
    }
    double v31 = [(UIColor *)v34 initWithWhite:v35 alpha:v33];
    goto LABEL_28;
  }
  [v4 decodeDoubleForKey:@"UIDynamicModifiedAlphaComponent"];
  double v8 = v7;
  double v9 = (void *)[v4 decodeIntegerForKey:@"UIDynamicModifiedContrast"];
  if ([v4 containsValueForKey:@"UIDynamicModifiedProminence"]) {
    uint64_t v10 = [v4 decodeIntegerForKey:@"UIDynamicModifiedProminence"];
  }
  else {
    uint64_t v10 = -1;
  }
  int v15 = (UIColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], v6, v9, (void *)v10, v8);
LABEL_32:

  return v15;
}

+ (UIColor)systemIndigoColor
{
  if (qword_1EB25DF20 != -1) {
    dispatch_once(&qword_1EB25DF20, &__block_literal_global_1900);
  }
  id v2 = (void *)qword_1EB25DF18;
  return (UIColor *)v2;
}

+ (UIColor)darkTextColor
{
  if (qword_1EB25DB10 != -1) {
    dispatch_once(&qword_1EB25DB10, &__block_literal_global_1344_0);
  }
  id v2 = (void *)qword_1EB25DB08;
  return (UIColor *)v2;
}

+ (UIColor)systemGray2Color
{
  if (qword_1EB25DFE0 != -1) {
    dispatch_once(&qword_1EB25DFE0, &__block_literal_global_1937);
  }
  id v2 = (void *)qword_1EB25DFD8;
  return (UIColor *)v2;
}

void __23__UIColor__appKeyColor__block_invoke()
{
  v0 = _UIKitAppKeyColorAssetName();
  if (v0)
  {
    id v3 = v0;
    uint64_t v1 = +[UIColor colorNamed:v0];
    id v2 = (void *)qword_1EB25DB18;
    qword_1EB25DB18 = v1;

    v0 = v3;
  }
}

+ (UIColor)colorNamed:(NSString *)name
{
  return (UIColor *)[a1 colorNamed:name inBundle:0 compatibleWithTraitCollection:0];
}

+ (UIColor)redColor
{
  if (qword_1EB25D908 != -1) {
    dispatch_once(&qword_1EB25D908, &__block_literal_global_1233);
  }
  id v2 = (void *)qword_1EB25D900;
  return (UIColor *)v2;
}

+ (id)_controlForegroundColor
{
  if (qword_1EB25E190 != -1) {
    dispatch_once(&qword_1EB25E190, &__block_literal_global_2016);
  }
  id v2 = (void *)qword_1EB25E188;
  return v2;
}

+ (id)_controlShadowColor
{
  if (qword_1EB25E1B0 != -1) {
    dispatch_once(&qword_1EB25E1B0, &__block_literal_global_2022);
  }
  id v2 = (void *)qword_1EB25E1A8;
  return v2;
}

+ (UIColor)grayColor
{
  if (qword_1EB25D8E8 != -1) {
    dispatch_once(&qword_1EB25D8E8, &__block_literal_global_1227);
  }
  id v2 = (void *)qword_1EB25D8E0;
  return (UIColor *)v2;
}

+ (id)_alertControllerDimmingViewColor
{
  if (qword_1EB25E1F0 != -1) {
    dispatch_once(&qword_1EB25E1F0, &__block_literal_global_2034);
  }
  id v2 = (void *)qword_1EB25E1E8;
  return v2;
}

+ (id)_dimmingViewColor
{
  return +[UIColor _alertControllerDimmingViewColor];
}

+ (id)tableCellBlueTextColor
{
  id v3 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
  if (!tableCellBlueTextColor_tableCellBlueTextColor)
  {
    id v4 = +[UIColor systemBlueColor];
    uint64_t v5 = +[UIColor _systemColorForColor:withName:]((uint64_t)a1, v4, @"tableCellBlueTextColor");
    BOOL v6 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
    tableCellBlueTextColor_tableCellBlueTextColor = v5;

    id v3 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
  }
  return v3;
}

+ (id)_systemColorForColor:(void *)a3 withName:
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = v5;
  uint64_t v8 = [v7 CGColor];

  double v9 = (void *)[v6 initWithCGColor:v8];
  [v9 _setSystemColorName:v4];

  return v9;
}

+ (UIColor)colorWithPatternImage:(UIImage *)image
{
  id v3 = image;
  id v4 = (void *)[objc_allocWithZone((Class)UIColor) initWithPatternImage:v3];

  return (UIColor *)v4;
}

- (UIColor)initWithPatternImage:(UIImage *)image
{
  id v4 = image;

  id v5 = [[UIDynamicPatternColor alloc] initWithPatternImage:v4];
  return &v5->super.super;
}

- (UIColor)initWithCGColor:(CGColorRef)cgColor
{
  if (!cgColor) {
    return 0;
  }
  ColorSpace = CGColorGetColorSpace(cgColor);
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  if (ColorSpace != (CGColorSpace *)qword_1EB25E408
    || (result = (UIColor *)[objc_allocWithZone((Class)UIDeviceRGBColor) initWithCGColor:cgColor]) == 0)
  {
    if (qword_1EB25E400 != -1) {
      dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
    }
    if ((ColorSpace != (CGColorSpace *)qword_1EB25E3F8
       || (result = (UIColor *)[objc_allocWithZone((Class)UIDeviceWhiteColor) initWithCGColor:cgColor]) == 0)&& (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern|| (result = (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIPatternCGColor), "initWithCGColor:", cgColor)) == 0))
    {
      id v6 = objc_allocWithZone((Class)UICGColor);
      return (UIColor *)[v6 initWithCGColor:cgColor];
    }
  }
  return result;
}

+ (UIColor)greenColor
{
  if (qword_1EB25D918 != -1) {
    dispatch_once(&qword_1EB25D918, &__block_literal_global_1237);
  }
  id v2 = (void *)qword_1EB25D910;
  return (UIColor *)v2;
}

void __46__UIColor__InProgressSPI___controlShadowColor__block_invoke()
{
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.12];
  uint64_t v1 = (void *)qword_1EB25E1A8;
  qword_1EB25E1A8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E1A8;
  id v3 = [NSString stringWithUTF8String:"_controlShadowColor"];
  [v2 _setSystemColorName:v3];
}

void __27__UIColor_systemBlackColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemBlackColor"];
  if (os_variant_has_internal_diagnostics())
  {
    v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB98;
          qword_1EB25DB98 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v0 = (void *)qword_1EB25DB98;
  qword_1EB25DB98 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB98 _setSystemColorName:v8];
}

void __25__UIColor_lightGrayColor__block_invoke()
{
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.666666667 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D8C0;
  qword_1EB25D8C0 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D8C0;
  id v3 = [NSString stringWithUTF8String:"lightGrayColor"];
  [v2 _setSystemColorName:v3];
}

void __47__UIColor__InProgressSPI___carSystemFocusColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemFocusColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.156862745 green:0.615686275 blue:0.819607843 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.392156863 green:0.823529412 blue:1.0 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  id v8 = (void *)qword_1EB25E398;
  qword_1EB25E398 = (uint64_t)v7;
}

void __45__UIColor__UIInterfaceAPI__systemOrangeColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemOrangeColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 1);
  id v2 = (void *)qword_1EB25DEA8;
  qword_1EB25DEA8 = (uint64_t)v1;
}

void __43__UIColor__UIInterfaceAPI__systemPinkColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemPinkColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 10);
  id v2 = (void *)qword_1EB25DF38;
  qword_1EB25DF38 = (uint64_t)v1;
}

void __44__UIColor__UIInterfaceAPI__systemGreenColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemGreenColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 3);
  id v2 = (void *)qword_1EB25DEC8;
  qword_1EB25DEC8 = (uint64_t)v1;
}

void __47__UIColor__InProgressSPI__tableBackgroundColor__block_invoke()
{
  v28[11] = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v26 = [UIDynamicSystemColor alloc];
  CGFloat v25 = [NSString stringWithUTF8String:"tableBackgroundColor"];
  double v24 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v27[0] = v24;
  size_t v23 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v28[0] = v23;
  double v22 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v27[1] = v22;
  double v21 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v28[1] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v27[2] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  v28[2] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v27[3] = v18;
  uint64_t v17 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.141176471 green:0.141176471 blue:0.149019608 alpha:1.0];
  v28[3] = v17;
  double v16 = _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v27[4] = v16;
  int v15 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
  v28[4] = v15;
  double v14 = _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v27[5] = v14;
  CGColorSpaceRef v13 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:1.0];
  v28[5] = v13;
  CGColorSpaceRef v12 = _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 1);
  v27[6] = v12;
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v28[6] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v27[7] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
  v28[7] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v27[8] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
  v28[8] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v27[9] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v28[9] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v27[10] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v28[10] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:11];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v26, v25, v9);
  id v11 = (void *)qword_1EB25E248;
  qword_1EB25E248 = (uint64_t)v10;
}

void __51__UIColor__InProgressSPI__secondarySystemFillColor__block_invoke()
{
  v30[12] = *MEMORY[0x1E4F143B8];
  double v28 = [UIDynamicSystemColor alloc];
  int v27 = [NSString stringWithUTF8String:"secondarySystemFillColor"];
  CGColorSpaceRef v26 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v29[0] = v26;
  CGFloat v25 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.16];
  v30[0] = v25;
  double v24 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v29[1] = v24;
  size_t v23 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.24];
  v30[1] = v23;
  double v22 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v29[2] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.32];
  v30[2] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v29[3] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.4];
  v30[3] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v29[4] = v18;
  uint64_t v17 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.16];
  v30[4] = v17;
  double v16 = _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v29[5] = v16;
  int v15 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.16];
  v30[5] = v15;
  double v14 = _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v29[6] = v14;
  CGColorSpaceRef v13 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.16];
  v30[6] = v13;
  CGColorSpaceRef v12 = _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v29[7] = v12;
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.16];
  v30[7] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v29[8] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.2];
  v30[8] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v29[9] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.22];
  v30[9] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v29[10] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.2];
  v30[10] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v29[11] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.24];
  v30[11] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  id v11 = (void *)qword_1EB25E0E8;
  qword_1EB25E0E8 = (uint64_t)v10;
}

void __44__UIColor__UIInterfaceAPI__systemGray4Color__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v12 = [UIDynamicSystemColor alloc];
  v0 = [NSString stringWithUTF8String:"systemGray4Color"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.819607843 green:0.819607843 blue:0.839215686 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.737254902 green:0.737254902 blue:0.752941176 alpha:1.0];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.22745098 green:0.22745098 blue:0.235294118 alpha:1.0];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  id v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.266666667 green:0.266666667 blue:0.274509804 alpha:1.0];
  v14[3] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  id v11 = (void *)qword_1EB25DFF8;
  qword_1EB25DFF8 = (uint64_t)v10;
}

void __48__UIColor__UIInterfaceAPI__quaternaryLabelColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"quaternaryLabelColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 18);
  id v2 = (void *)qword_1EB25DF98;
  qword_1EB25DF98 = (uint64_t)v1;
}

void __27__UIColor_systemWhiteColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemWhiteColor"];
  if (os_variant_has_internal_diagnostics())
  {
    v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB58;
          qword_1EB25DB58 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v0 = (void *)qword_1EB25DB58;
  qword_1EB25DB58 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB58 _setSystemColorName:v8];
}

void __58__UIColor__InProgressSPI__tableCellGroupedBackgroundColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tableCellGroupedBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeysecondarySystemGroupedBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E278;
  qword_1EB25E278 = (uint64_t)v2;
}

void __65__UIColor__UIInterfaceAPI__secondarySystemGroupedBackgroundColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"secondarySystemGroupedBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeysecondarySystemGroupedBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E098;
  qword_1EB25E098 = (uint64_t)v2;
}

void __48__UIColor__InProgressSPI___textFieldBorderColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_textFieldBorderColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.2];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.2];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  id v8 = (void *)qword_1EB25E228;
  qword_1EB25E228 = (uint64_t)v7;
}

void __56__UIColor__InProgressSPI__tableCellPlainBackgroundColor__block_invoke()
{
  v26[10] = *MEMORY[0x1E4F143B8];
  double v24 = [UIDynamicSystemColor alloc];
  size_t v23 = [NSString stringWithUTF8String:"tableCellPlainBackgroundColor"];
  double v22 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v25[0] = v22;
  double v21 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[0] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v25[1] = v20;
  uint64_t v19 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[1] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v25[2] = v18;
  uint64_t v17 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  v26[2] = v17;
  double v16 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v25[3] = v16;
  int v15 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.141176471 green:0.141176471 blue:0.149019608 alpha:1.0];
  v26[3] = v15;
  double v14 = _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v25[4] = v14;
  CGColorSpaceRef v13 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.07];
  v26[4] = v13;
  CGColorSpaceRef v12 = _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v25[5] = v12;
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.15];
  v26[5] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v25[6] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
  v26[6] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v25[7] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.14];
  v26[7] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v25[8] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v26[8] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v25[9] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v26[9] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  id v11 = (void *)qword_1EB25E258;
  qword_1EB25E258 = (uint64_t)v10;
}

void __58__UIColor__UIInterfaceAPI__secondarySystemBackgroundColor__block_invoke()
{
  v26[10] = *MEMORY[0x1E4F143B8];
  double v24 = [UIDynamicSystemColor alloc];
  size_t v23 = [NSString stringWithUTF8String:"secondarySystemBackgroundColor"];
  double v22 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v25[0] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.949019608 blue:0.968627451 alpha:1.0];
  v26[0] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v25[1] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.921568627 green:0.921568627 blue:0.941176471 alpha:1.0];
  v26[1] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v25[2] = v18;
  uint64_t v17 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  v26[2] = v17;
  double v16 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v25[3] = v16;
  int v15 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.141176471 green:0.141176471 blue:0.149019608 alpha:1.0];
  v26[3] = v15;
  double v14 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v25[4] = v14;
  CGColorSpaceRef v13 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
  v26[4] = v13;
  CGColorSpaceRef v12 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v25[5] = v12;
  v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.211764706 green:0.211764706 blue:0.219607843 alpha:1.0];
  v26[5] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v25[6] = v1;
  id v2 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[6] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v25[7] = v3;
  id v4 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[7] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v25[8] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[8] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v25[9] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[9] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  id v11 = (void *)qword_1EB25E068;
  qword_1EB25E068 = (uint64_t)v10;
}

void __43__UIColor__UIInterfaceAPI__systemGrayColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemGrayColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 13);
  id v2 = (void *)qword_1EB25DF48;
  qword_1EB25DF48 = (uint64_t)v1;
}

void __56__UIColor__InProgressSPI__groupTableViewBackgroundColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"groupTableViewBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeysystemGroupedBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E268;
  qword_1EB25E268 = (uint64_t)v2;
}

void __56__UIColor__UIInterfaceAPI__systemGroupedBackgroundColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"systemGroupedBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeysystemGroupedBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E088;
  qword_1EB25E088 = (uint64_t)v2;
}

void __19__UIColor_redColor__block_invoke()
{
  v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D900;
  qword_1EB25D900 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D900;
  id v3 = [NSString stringWithUTF8String:"redColor"];
  [v2 _setSystemColorName:v3];
}

void __42__UIColor__UIInterfaceAPI__systemRedColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemRedColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 0);
  id v2 = (void *)qword_1EB25DE98;
  qword_1EB25DE98 = (uint64_t)v1;
}

void __51__UIColor__InProgressSPI___systemChromeShadowColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_systemChromeShadowColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.3];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.15];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  id v8 = (void *)qword_1EB25E1F8;
  qword_1EB25E1F8 = (uint64_t)v7;
}

void __43__UIColor__UIInterfaceAPI__systemBlueColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemBlueColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 7);
  id v2 = (void *)qword_1EB25DF08;
  qword_1EB25DF08 = (uint64_t)v1;
}

void __47__UIColor__UIInterfaceAPI__secondaryLabelColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"secondaryLabelColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 16);
  id v2 = (void *)qword_1EB25DF78;
  qword_1EB25DF78 = (uint64_t)v1;
}

void __32__UIColor_selectionGrabberColor__block_invoke()
{
  v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.078 green:0.435 blue:0.882 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DAE8;
  qword_1EB25DAE8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DAE8;
  id v3 = [NSString stringWithUTF8String:"selectionGrabberColor"];
  [v2 _setSystemColorName:v3];
}

void __30__UIColor_insertionPointColor__block_invoke()
{
  v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.26 green:0.42 blue:0.95 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DAD8;
  qword_1EB25DAD8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DAD8;
  id v3 = [NSString stringWithUTF8String:"insertionPointColor"];
  [v2 _setSystemColorName:v3];
}

void __34__UIColor_selectionHighlightColor__block_invoke()
{
  v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.33 blue:0.65 alpha:0.2];
  uint64_t v1 = (void *)qword_1EB25DAC8;
  qword_1EB25DAC8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DAC8;
  id v3 = [NSString stringWithUTF8String:"selectionHighlightColor"];
  [v2 _setSystemColorName:v3];
}

void __38__UIColor__UIInterfaceAPI__labelColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"labelColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 15);
  id v2 = (void *)qword_1EB25DF68;
  qword_1EB25DF68 = (uint64_t)v1;
}

void __46__UIColor__UIInterfaceAPI__tertiaryLabelColor__block_invoke()
{
  v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"tertiaryLabelColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 17);
  id v2 = (void *)qword_1EB25DF88;
  qword_1EB25DF88 = (uint64_t)v1;
}

void __59__UIColor__InProgressSPI___alertControllerDimmingViewColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_alertControllerDimmingViewColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.2];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.48];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  id v8 = (void *)qword_1EB25E1E8;
  qword_1EB25E1E8 = (uint64_t)v7;
}

void __49__UIColor__UIInterfaceAPI__systemBackgroundColor__block_invoke()
{
  v16[5] = *MEMORY[0x1E4F143B8];
  double v14 = [UIDynamicSystemColor alloc];
  CGColorSpaceRef v13 = [NSString stringWithUTF8String:"systemBackgroundColor"];
  CGColorSpaceRef v12 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v15[0] = v12;
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v16[0] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v15[1] = v1;
  id v2 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v16[1] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v15[2] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  v16[2] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v15[3] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.141176471 green:0.141176471 blue:0.149019608 alpha:1.0];
  v16[3] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v15[4] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v16[4] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v14, v13, v9);
  id v11 = (void *)qword_1EB25E058;
  qword_1EB25E058 = (uint64_t)v10;
}

void __51__UIColor__InProgressSPI__tableSeparatorLightColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tableSeparatorLightColor"];
  uint64_t v1 = _colorsByThemeKeyseparatorColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E2A8;
  qword_1EB25E2A8 = (uint64_t)v2;
}

void __50__UIColor__InProgressSPI__tableSeparatorDarkColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tableSeparatorDarkColor"];
  uint64_t v1 = _colorsByThemeKeyseparatorColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E298;
  qword_1EB25E298 = (uint64_t)v2;
}

void __42__UIColor__UIInterfaceAPI__separatorColor__block_invoke()
{
  v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"separatorColor"];
  uint64_t v1 = _colorsByThemeKeyseparatorColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E038;
  qword_1EB25E038 = (uint64_t)v2;
}

void __21__UIColor_blackColor__block_invoke()
{
  v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D8A0;
  qword_1EB25D8A0 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D8A0;
  id v3 = [NSString stringWithUTF8String:"blackColor"];
  [v2 _setSystemColorName:v3];
}

void __20__UIColor_tintColor__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB25DE58;
  qword_1EB25DE58 = v0;
}

void __21__UIColor_clearColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.0];
  uint64_t v1 = (void *)qword_1EB25D8F0;
  qword_1EB25D8F0 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D8F0;
  id v3 = [NSString stringWithUTF8String:"clearColor"];
  [v2 _setSystemColorName:v3];
}

void __21__UIColor_whiteColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D8D0;
  qword_1EB25D8D0 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D8D0;
  id v3 = [NSString stringWithUTF8String:"whiteColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_dynamicColorWithColorsByTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = -[UIDynamicAppDefinedColor initWithColorsByTraitCollection:]((id *)[UIDynamicAppDefinedColor alloc], v3);

  return v4;
}

- (void)_setSystemColorName:(id)a3
{
  id v6 = (NSString *)a3;
  systemColorName = self->_systemColorName;
  if (systemColorName)
  {
    id v10 = v6;
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIColor.m", 2573, @"can only set the system color name of a color once, but attempting to change %@ from %@ to %@", self, self->_systemColorName, v10 object file lineNumber description];

    id v6 = v10;
    systemColorName = self->_systemColorName;
  }
  if (systemColorName != v6)
  {
    double v9 = v6;
    objc_storeStrong((id *)&self->_systemColorName, a3);
    id v6 = v9;
  }
}

+ (UIColor)tertiarySystemGroupedBackgroundColor
{
  if (qword_1EB25E0B0 != -1) {
    dispatch_once(&qword_1EB25E0B0, &__block_literal_global_1976);
  }
  id v2 = (void *)qword_1EB25E0A8;
  return (UIColor *)v2;
}

+ (UIColor)systemMintColor
{
  if (qword_1EB25DEF0 != -1) {
    dispatch_once(&qword_1EB25DEF0, &__block_literal_global_1891);
  }
  id v2 = (void *)qword_1EB25DEE8;
  return (UIColor *)v2;
}

+ (UIColor)tertiarySystemBackgroundColor
{
  if (qword_1EB25E080 != -1) {
    dispatch_once(&qword_1EB25E080, &__block_literal_global_1967);
  }
  id v2 = (void *)qword_1EB25E078;
  return (UIColor *)v2;
}

+ (UIColor)systemGray3Color
{
  if (qword_1EB25DFF0 != -1) {
    dispatch_once(&qword_1EB25DFF0, &__block_literal_global_1940);
  }
  id v2 = (void *)qword_1EB25DFE8;
  return (UIColor *)v2;
}

+ (id)_windowBackgroundColor
{
  if (qword_1EB25E350 != -1) {
    dispatch_once(&qword_1EB25E350, &__block_literal_global_2100);
  }
  id v2 = (void *)qword_1EB25E348;
  return v2;
}

+ (UIColor)systemCyanColor
{
  if (qword_1EB25DF00 != -1) {
    dispatch_once(&qword_1EB25DF00, &__block_literal_global_1894);
  }
  id v2 = (void *)qword_1EB25DEF8;
  return (UIColor *)v2;
}

+ (id)_barHairlineShadowColor
{
  if (qword_1EB25DD70 != -1) {
    dispatch_once(&qword_1EB25DD70, &__block_literal_global_1455);
  }
  id v2 = (void *)qword_1EB25DD68;
  return v2;
}

+ (UIColor)systemGray5Color
{
  if (qword_1EB25E010 != -1) {
    dispatch_once(&qword_1EB25E010, &__block_literal_global_1946);
  }
  id v2 = (void *)qword_1EB25E008;
  return (UIColor *)v2;
}

+ (UIColor)systemTealColor
{
  if (qword_1EB25DEE0 != -1) {
    dispatch_once(&qword_1EB25DEE0, &__block_literal_global_1888);
  }
  id v2 = (void *)qword_1EB25DED8;
  return (UIColor *)v2;
}

+ (UIColor)systemPurpleColor
{
  if (qword_1EB25DF30 != -1) {
    dispatch_once(&qword_1EB25DF30, &__block_literal_global_1903);
  }
  id v2 = (void *)qword_1EB25DF28;
  return (UIColor *)v2;
}

+ (UIColor)systemBrownColor
{
  if (qword_1EB25DF60 != -1) {
    dispatch_once(&qword_1EB25DF60, &__block_literal_global_1912);
  }
  id v2 = (void *)qword_1EB25DF58;
  return (UIColor *)v2;
}

+ (UIColor)placeholderTextColor
{
  if (qword_1EB25DFC0 != -1) {
    dispatch_once(&qword_1EB25DFC0, &__block_literal_global_1930);
  }
  id v2 = (void *)qword_1EB25DFB8;
  return (UIColor *)v2;
}

+ (UIColor)linkColor
{
  if (qword_1EB25E030 != -1) {
    dispatch_once(&qword_1EB25E030, &__block_literal_global_1952);
  }
  id v2 = (void *)qword_1EB25E028;
  return (UIColor *)v2;
}

+ (UIColor)blueColor
{
  if (qword_1EB25D928 != -1) {
    dispatch_once(&qword_1EB25D928, &__block_literal_global_1240_0);
  }
  id v2 = (void *)qword_1EB25D920;
  return (UIColor *)v2;
}

+ (UIColor)systemGray6Color
{
  if (qword_1EB25E020 != -1) {
    dispatch_once(&qword_1EB25E020, &__block_literal_global_1949);
  }
  id v2 = (void *)qword_1EB25E018;
  return (UIColor *)v2;
}

void __38__UIColor___halfTransparentWhiteColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.5];
  uint64_t v1 = (void *)qword_1EB25DAA0;
  qword_1EB25DAA0 = (uint64_t)v0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(UIColor *)self _systemColorName];
  if (v6) {
    [v5 encodeObject:v6 forKey:@"UISystemColorName"];
  }
  id v7 = [(UIColor *)self cgColor];
  size_t NumberOfComponents = CGColorGetNumberOfComponents(v7);
  [v5 encodeInt:NumberOfComponents forKey:@"UIColorComponentCount"];
  if (NumberOfComponents == 2)
  {
    double v17 = 0.0;
    if (v7)
    {
      Components = CGColorGetComponents(v7);
      CGFloat Alpha = CGColorGetAlpha(v7);
      CGColorSpaceRef ColorSpace = CGColorGetColorSpace(v7);
      double v21 = 0.0;
      if (Components)
      {
        CGColorSpaceRef v22 = ColorSpace;
        long long v33 = 0uLL;
        if (qword_1EB25E400 != -1) {
          dispatch_once(&qword_1EB25E400, &__block_literal_global_2182);
        }
        if ((CGColorSpaceRef)qword_1EB25E3F8 != v22)
        {
          if (qword_1EB25E430 != -1) {
            dispatch_once(&qword_1EB25E430, &__block_literal_global_2188);
          }
          if ((CGColorSpaceRef)qword_1EB25E428 != v22)
          {
            UISCreateCachedColorTransform();
            if (!CGColorTransformConvertColorComponents())
            {
              CGColorTransformRelease();
              goto LABEL_32;
            }
            *((CGFloat *)&v33 + 1) = Alpha;
            CGColorTransformRelease();
            Components = (const CGFloat *)&v33;
          }
        }
        double v17 = *Components;
        double v21 = Components[1];
      }
    }
    else
    {
      double v21 = 0.0;
    }
LABEL_32:
    _UIColorEncodeComponentForKey(v5, @"UIWhite", @"UIWhite-Double", v17);
    _UIColorEncodeComponentForKey(v5, @"UIAlpha", @"UIAlpha-Double", v21);
    id v26 = v5;
    if (v21 == 1.0) {
      objc_msgSend(NSString, "stringWithFormat:", @"%.3g", *(void *)&v17, v31);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"%.3g %.3g", *(void *)&v17, *(void *)&v21);
    }
    id v27 = objc_claimAutoreleasedReturnValue();
    double v30 = (const char *)[v27 UTF8String];
    [v26 encodeBytes:v30 length:strlen(v30) forKey:@"NSWhite"];
    uint64_t v29 = 4;
    goto LABEL_38;
  }
  if (NumberOfComponents == 4)
  {
    double v9 = 0.0;
    if (v7)
    {
      id v10 = CGColorGetComponents(v7);
      CGFloat v11 = CGColorGetAlpha(v7);
      CGColorSpaceRef v12 = CGColorGetColorSpace(v7);
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      if (v10)
      {
        CGColorSpaceRef v16 = v12;
        long long v33 = 0u;
        long long v34 = 0u;
        if (qword_1EB25E410 != -1) {
          dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
        }
        if ((CGColorSpaceRef)qword_1EB25E408 != v16)
        {
          if (qword_1EB25E450 != -1) {
            dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
          }
          if ((CGColorSpaceRef)qword_1EB25E448 != v16)
          {
            UISCreateCachedColorTransform();
            if (!CGColorTransformConvertColorComponents())
            {
              CGColorTransformRelease();
              goto LABEL_29;
            }
            *((CGFloat *)&v34 + 1) = v11;
            CGColorTransformRelease();
            id v10 = (const CGFloat *)&v33;
          }
        }
        double v9 = *v10;
        double v13 = v10[1];
        double v14 = v10[2];
        double v15 = v10[3];
      }
    }
    else
    {
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
    }
LABEL_29:
    _UIColorEncodeComponentForKey(v5, @"UIRed", @"UIRed-Double", v9);
    _UIColorEncodeComponentForKey(v5, @"UIGreen", @"UIGreen-Double", v13);
    _UIColorEncodeComponentForKey(v5, @"UIBlue", @"UIBlue-Double", v14);
    _UIColorEncodeComponentForKey(v5, @"UIAlpha", @"UIAlpha-Double", v15);
    id v25 = v5;
    if (v15 == 1.0) {
      objc_msgSend(NSString, "stringWithFormat:", @"%.3g %.3g %.3g", *(void *)&v9, *(void *)&v13, *(void *)&v14, v32, v33, v34);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"%.3g %.3g %.3g %.3g", *(void *)&v9, *(void *)&v13, *(void *)&v14, *(void *)&v15, v33, v34);
    }
    id v27 = objc_claimAutoreleasedReturnValue();
    double v28 = (const char *)[v27 UTF8String];
    [v25 encodeBytes:v28 length:strlen(v28) forKey:@"NSRGB"];
    uint64_t v29 = 2;
LABEL_38:
    [v5 encodeInteger:v29 forKey:@"NSColorSpace"];

    goto LABEL_39;
  }
  size_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"UIColor.m" lineNumber:2338 description:@"Only RGBA or White color spaces are supported in this situation."];

  id v24 = v5;
LABEL_39:
}

+ (id)systemLightMidGrayColor
{
  if (qword_1EB25DB90 != -1) {
    dispatch_once(&qword_1EB25DB90, &__block_literal_global_1365);
  }
  id v2 = (void *)qword_1EB25DB88;
  return v2;
}

+ (id)_tertiarySystemGroupedBackgroundColor
{
  return +[UIColor tertiarySystemGroupedBackgroundColor];
}

+ (id)_tertiarySystemBackgroundColor
{
  return +[UIColor tertiarySystemBackgroundColor];
}

+ (id)_systemBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

void __38__UIColor___halfTransparentBlackColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.5];
  uint64_t v1 = (void *)qword_1EB25DA90;
  qword_1EB25DA90 = (uint64_t)v0;
}

- (id)styleString
{
  cachedStyleString = self->_cachedStyleString;
  if (!cachedStyleString)
  {
    double v16 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    [(UIColor *)self getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
    double v4 = v13;
    id v5 = [NSString alloc];
    id v6 = &qword_186B94000;
    LODWORD(v6) = vcvtmd_s64_f64(v16 * 255.0);
    LODWORD(v7) = vcvtmd_s64_f64(v15 * 255.0);
    LODWORD(v8) = vcvtmd_s64_f64(v14 * 255.0);
    if (v4 == 1.0) {
      double v9 = (NSString *)objc_msgSend(v5, "initWithFormat:", @"rgb(%d,%d,%d)", v6, v7, v8, v12);
    }
    else {
      double v9 = (NSString *)objc_msgSend(v5, "initWithFormat:", @"rgba(%d,%d,%d,%f)", v6, v7, v8, *(void *)&v13);
    }
    id v10 = self->_cachedStyleString;
    self->_cachedStyleString = v9;

    cachedStyleString = self->_cachedStyleString;
  }
  return cachedStyleString;
}

+ (id)tableSeparatorColor
{
  if (qword_1EB25E290 != -1) {
    dispatch_once(&qword_1EB25E290, &__block_literal_global_2064);
  }
  id v2 = (void *)qword_1EB25E288;
  return v2;
}

void __45__UIColor__UIInterfaceAPI__systemYellowColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemYellowColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 2);
  id v2 = (void *)qword_1EB25DEB8;
  qword_1EB25DEB8 = (uint64_t)v1;
}

void __45__UIColor__UIInterfaceAPI__systemIndigoColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemIndigoColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 8);
  id v2 = (void *)qword_1EB25DF18;
  qword_1EB25DF18 = (uint64_t)v1;
}

+ (UIColor)opaqueSeparatorColor
{
  if (qword_1EB25E050 != -1) {
    dispatch_once(&qword_1EB25E050, &__block_literal_global_1958);
  }
  id v2 = (void *)qword_1EB25E048;
  return (UIColor *)v2;
}

void __48__UIColor__UIInterfaceAPI__placeholderTextColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"placeholderTextColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 17);
  id v2 = (void *)qword_1EB25DFB8;
  qword_1EB25DFB8 = (uint64_t)v1;
}

void __45__UIColor__UIInterfaceAPI__systemPurpleColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemPurpleColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 9);
  id v2 = (void *)qword_1EB25DF28;
  qword_1EB25DF28 = (uint64_t)v1;
}

void __44__UIColor__UIInterfaceAPI__systemBrownColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemBrownColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 14);
  id v2 = (void *)qword_1EB25DF58;
  qword_1EB25DF58 = (uint64_t)v1;
}

+ (id)systemMidGrayColor
{
  if (qword_1EB25DB50 != -1) {
    dispatch_once(&qword_1EB25DB50, &__block_literal_global_1353);
  }
  id v2 = (void *)qword_1EB25DB48;
  return v2;
}

void __43__UIColor__UIInterfaceAPI__systemTealColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemTealColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 4);
  id v2 = (void *)qword_1EB25DED8;
  qword_1EB25DED8 = (uint64_t)v1;
}

void __20__UIColor_grayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.5 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D8E0;
  qword_1EB25D8E0 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D8E0;
  id v3 = [NSString stringWithUTF8String:"grayColor"];
  [v2 _setSystemColorName:v3];
}

void __20__UIColor_blueColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D920;
  qword_1EB25D920 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D920;
  id v3 = [NSString stringWithUTF8String:"blueColor"];
  [v2 _setSystemColorName:v3];
}

void __44__UIColor__barStyleBlackHairlineShadowColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.15];
  uint64_t v1 = (void *)qword_1EB25DD78;
  qword_1EB25DD78 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DD78;
  id v3 = [NSString stringWithUTF8String:"_barStyleBlackHairlineShadowColor"];
  [v2 _setSystemColorName:v3];
}

void __43__UIColor__UIInterfaceAPI__systemMintColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemMintColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 5);
  id v2 = (void *)qword_1EB25DEE8;
  qword_1EB25DEE8 = (uint64_t)v1;
}

void __43__UIColor__UIInterfaceAPI__systemCyanColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"systemCyanColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 6);
  id v2 = (void *)qword_1EB25DEF8;
  qword_1EB25DEF8 = (uint64_t)v1;
}

void __37__UIColor__UIInterfaceAPI__linkColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"linkColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  v10[0] = v3;
  double v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0352941176 green:0.517647059 blue:1.0 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E028;
  qword_1EB25E028 = (uint64_t)v7;
}

void __46__UIColor__InProgressSPI__tableSeparatorColor__block_invoke()
{
  uint64_t v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tableSeparatorColor"];
  uint64_t v1 = _colorsByThemeKeyseparatorColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E288;
  qword_1EB25E288 = (uint64_t)v2;
}

void __34__UIColor__barHairlineShadowColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
  uint64_t v1 = (void *)qword_1EB25DD68;
  qword_1EB25DD68 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DD68;
  id v3 = [NSString stringWithUTF8String:"_barHairlineShadowColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)groupTableViewBackgroundColor
{
  if (qword_1EB25E270 != -1) {
    dispatch_once(&qword_1EB25E270, &__block_literal_global_2058);
  }
  id v2 = (void *)qword_1EB25E268;
  return (UIColor *)v2;
}

+ (id)systemMidGrayTintColor
{
  if (qword_1EB25DCE0 != -1) {
    dispatch_once(&qword_1EB25DCE0, &__block_literal_global_1428_0);
  }
  id v2 = (void *)qword_1EB25DCD8;
  return v2;
}

+ (id)systemLightMidGrayTintColor
{
  if (qword_1EB25DCD0 != -1) {
    dispatch_once(&qword_1EB25DCD0, &__block_literal_global_1425_0);
  }
  id v2 = (void *)qword_1EB25DCC8;
  return v2;
}

+ (id)systemLightGrayTintColor
{
  if (qword_1EB25DCC0 != -1) {
    dispatch_once(&qword_1EB25DCC0, &__block_literal_global_1422);
  }
  id v2 = (void *)qword_1EB25DCB8;
  return v2;
}

+ (id)systemLightGrayColor
{
  if (qword_1EB25DB80 != -1) {
    dispatch_once(&qword_1EB25DB80, &__block_literal_global_1362_1);
  }
  id v2 = (void *)qword_1EB25DB78;
  return v2;
}

+ (id)systemGrayTintColor
{
  if (qword_1EB25DCF0 != -1) {
    dispatch_once(&qword_1EB25DCF0, &__block_literal_global_1431);
  }
  id v2 = (void *)qword_1EB25DCE8;
  return v2;
}

+ (id)systemExtraLightGrayTintColor
{
  if (qword_1EB25DCB0 != -1) {
    dispatch_once(&qword_1EB25DCB0, &__block_literal_global_1419_0);
  }
  id v2 = (void *)qword_1EB25DCA8;
  return v2;
}

+ (id)systemExtraLightGrayColor
{
  if (qword_1EB25DB70 != -1) {
    dispatch_once(&qword_1EB25DB70, &__block_literal_global_1359);
  }
  id v2 = (void *)qword_1EB25DB68;
  return v2;
}

+ (id)systemDarkYellowColor
{
  if (qword_1EB25DBF0 != -1) {
    dispatch_once(&qword_1EB25DBF0, &__block_literal_global_1383);
  }
  id v2 = (void *)qword_1EB25DBE8;
  return v2;
}

+ (id)systemDarkTealColor
{
  if (qword_1EB25DC00 != -1) {
    dispatch_once(&qword_1EB25DC00, &__block_literal_global_1386_0);
  }
  id v2 = (void *)qword_1EB25DBF8;
  return v2;
}

+ (id)systemDarkRedColor
{
  if (qword_1EB25DBB0 != -1) {
    dispatch_once(&qword_1EB25DBB0, &__block_literal_global_1371);
  }
  id v2 = (void *)qword_1EB25DBA8;
  return v2;
}

+ (id)systemDarkPurpleColor
{
  if (qword_1EB25DC20 != -1) {
    dispatch_once(&qword_1EB25DC20, &__block_literal_global_1392);
  }
  id v2 = (void *)qword_1EB25DC18;
  return v2;
}

+ (id)systemDarkPinkColor
{
  if (qword_1EB25DC10 != -1) {
    dispatch_once(&qword_1EB25DC10, &__block_literal_global_1389_0);
  }
  id v2 = (void *)qword_1EB25DC08;
  return v2;
}

+ (id)systemDarkOrangeColor
{
  if (qword_1EB25DBE0 != -1) {
    dispatch_once(&qword_1EB25DBE0, &__block_literal_global_1380_0);
  }
  id v2 = (void *)qword_1EB25DBD8;
  return v2;
}

+ (id)systemDarkMidGrayTintColor
{
  if (qword_1EB25DD30 != -1) {
    dispatch_once(&qword_1EB25DD30, &__block_literal_global_1443);
  }
  id v2 = (void *)qword_1EB25DD28;
  return v2;
}

+ (id)systemDarkMidGrayColor
{
  if (qword_1EB25DC60 != -1) {
    dispatch_once(&qword_1EB25DC60, &__block_literal_global_1404_0);
  }
  id v2 = (void *)qword_1EB25DC58;
  return v2;
}

+ (id)systemDarkLightMidGrayTintColor
{
  if (qword_1EB25DD20 != -1) {
    dispatch_once(&qword_1EB25DD20, &__block_literal_global_1440);
  }
  id v2 = (void *)qword_1EB25DD18;
  return v2;
}

+ (id)systemDarkLightMidGrayColor
{
  if (qword_1EB25DC50 != -1) {
    dispatch_once(&qword_1EB25DC50, &__block_literal_global_1401_0);
  }
  id v2 = (void *)qword_1EB25DC48;
  return v2;
}

+ (id)systemDarkLightGrayTintColor
{
  if (qword_1EB25DD10 != -1) {
    dispatch_once(&qword_1EB25DD10, &__block_literal_global_1437);
  }
  id v2 = (void *)qword_1EB25DD08;
  return v2;
}

+ (id)systemDarkLightGrayColor
{
  if (qword_1EB25DC40 != -1) {
    dispatch_once(&qword_1EB25DC40, &__block_literal_global_1398);
  }
  id v2 = (void *)qword_1EB25DC38;
  return v2;
}

+ (id)systemDarkGreenColor
{
  if (qword_1EB25DBC0 != -1) {
    dispatch_once(&qword_1EB25DBC0, &__block_literal_global_1374);
  }
  id v2 = (void *)qword_1EB25DBB8;
  return v2;
}

+ (id)systemDarkGrayTintColor
{
  if (qword_1EB25DD40 != -1) {
    dispatch_once(&qword_1EB25DD40, &__block_literal_global_1446);
  }
  id v2 = (void *)qword_1EB25DD38;
  return v2;
}

+ (id)systemDarkGrayColor
{
  if (qword_1EB25DC70 != -1) {
    dispatch_once(&qword_1EB25DC70, &__block_literal_global_1407_0);
  }
  id v2 = (void *)qword_1EB25DC68;
  return v2;
}

+ (id)systemDarkExtraLightGrayTintColor
{
  if (qword_1EB25DD00 != -1) {
    dispatch_once(&qword_1EB25DD00, &__block_literal_global_1434_0);
  }
  id v2 = (void *)qword_1EB25DCF8;
  return v2;
}

+ (id)systemDarkExtraLightGrayColor
{
  if (qword_1EB25DC30 != -1) {
    dispatch_once(&qword_1EB25DC30, &__block_literal_global_1395_1);
  }
  id v2 = (void *)qword_1EB25DC28;
  return v2;
}

+ (id)systemDarkBlueColor
{
  if (qword_1EB25DBD0 != -1) {
    dispatch_once(&qword_1EB25DBD0, &__block_literal_global_1377);
  }
  id v2 = (void *)qword_1EB25DBC8;
  return v2;
}

+ (id)externalSystemTealColor
{
  if (qword_1EB25DC80 != -1) {
    dispatch_once(&qword_1EB25DC80, &__block_literal_global_1410);
  }
  id v2 = (void *)qword_1EB25DC78;
  return v2;
}

+ (id)externalSystemRedColor
{
  if (qword_1EB25DC90 != -1) {
    dispatch_once(&qword_1EB25DC90, &__block_literal_global_1413);
  }
  id v2 = (void *)qword_1EB25DC88;
  return v2;
}

+ (id)externalSystemGreenColor
{
  if (qword_1EB25DCA0 != -1) {
    dispatch_once(&qword_1EB25DCA0, &__block_literal_global_1416);
  }
  id v2 = (void *)qword_1EB25DC98;
  return v2;
}

void __44__UIColor__UIInterfaceAPI__systemGray3Color__block_invoke()
{
  uint64_t v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"systemGray3Color"];
  uint64_t v1 = _colorsByThemeKeysystemGray3Color();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25DFE8;
  qword_1EB25DFE8 = (uint64_t)v2;
}

void __49__UIColor__InProgressSPI___windowBackgroundColor__block_invoke()
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_windowBackgroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v11[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v12[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v11[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
  v12[1] = v5;
  id v6 = _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v11[2] = v6;
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:1.0];
  v12[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v8);
  id v10 = (void *)qword_1EB25E348;
  qword_1EB25E348 = (uint64_t)v9;
}

void __44__UIColor__UIInterfaceAPI__systemGray5Color__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"systemGray5Color"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.898039216 green:0.898039216 blue:0.917647059 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.847058824 green:0.847058824 blue:0.862745098 alpha:1.0];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  uint64_t v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.211764706 green:0.211764706 blue:0.219607843 alpha:1.0];
  v14[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGFloat v11 = (void *)qword_1EB25E008;
  qword_1EB25E008 = (uint64_t)v10;
}

void __47__UIColor__InProgressSPI___switchOffImageColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_switchOffImageColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.7 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E128;
  qword_1EB25E128 = (uint64_t)v7;
}

void __48__UIColor__UIInterfaceAPI__opaqueSeparatorColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"opaqueSeparatorColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.776470588 green:0.776470588 blue:0.784313725 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.219607843 green:0.219607843 blue:0.22745098 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E048;
  qword_1EB25E048 = (uint64_t)v7;
}

void __24__UIColor_darkTextColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DB08;
  qword_1EB25DB08 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25DB08;
  id v3 = [NSString stringWithUTF8String:"darkTextColor"];
  [v2 _setSystemColorName:v3];
}

void __21__UIColor_greenColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D910;
  qword_1EB25D910 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D910;
  id v3 = [NSString stringWithUTF8String:"greenColor"];
  [v2 _setSystemColorName:v3];
}

void __34__UIColor_systemLightMidGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemLightMidGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB88;
          qword_1EB25DB88 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.819607843 green:0.819607843 blue:0.839215686 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DB88;
  qword_1EB25DB88 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB88 _setSystemColorName:v8];
}

void __29__UIColor_systemMidGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemMidGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB48;
          qword_1EB25DB48 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DB48;
  qword_1EB25DB48 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB48 _setSystemColorName:v8];
}

void __53__UIColor__InProgressSPI___pageControlIndicatorColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_pageControlIndicatorColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.45];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.55];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  id v8 = (void *)qword_1EB25E148;
  qword_1EB25E148 = (uint64_t)v7;
}

void __42__UIColor__InProgressSPI__systemFillColor__block_invoke()
{
  v30[12] = *MEMORY[0x1E4F143B8];
  double v28 = [UIDynamicSystemColor alloc];
  id v27 = [NSString stringWithUTF8String:"systemFillColor"];
  id v26 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v29[0] = v26;
  id v25 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.2];
  v30[0] = v25;
  id v24 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v29[1] = v24;
  size_t v23 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.28];
  v30[1] = v23;
  CGColorSpaceRef v22 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v29[2] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.36];
  v30[2] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v29[3] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.44];
  v30[3] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v29[4] = v18;
  double v17 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.2];
  v30[4] = v17;
  double v16 = _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v29[5] = v16;
  double v15 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.2];
  v30[5] = v15;
  double v14 = _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v29[6] = v14;
  double v13 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.2];
  v30[6] = v13;
  uint64_t v12 = _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v29[7] = v12;
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.2];
  v30[7] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v29[8] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.56];
  v30[8] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v29[9] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.58];
  v30[9] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v29[10] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.56];
  v30[10] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v29[11] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.58];
  v30[11] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  CGFloat v11 = (void *)qword_1EB25E0D8;
  qword_1EB25E0D8 = (uint64_t)v10;
}

void __44__UIColor__UIInterfaceAPI__systemGray6Color__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"systemGray6Color"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.949019608 blue:0.968627451 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.921568627 green:0.921568627 blue:0.941176471 alpha:1.0];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  id v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.141176471 green:0.141176471 blue:0.149019608 alpha:1.0];
  v14[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGFloat v11 = (void *)qword_1EB25E018;
  qword_1EB25E018 = (uint64_t)v10;
}

void __44__UIColor__UIInterfaceAPI__systemGray2Color__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"systemGray2Color"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.682352941 green:0.682352941 blue:0.698039216 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.388235294 green:0.388235294 blue:0.4 alpha:1.0];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  id v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.48627451 green:0.48627451 blue:0.501960784 alpha:1.0];
  v14[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGFloat v11 = (void *)qword_1EB25DFD8;
  qword_1EB25DFD8 = (uint64_t)v10;
}

void __42__UIColor__InProgressSPI___switchOffColor__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"_switchOffColor"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.16];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.78];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.32];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  id v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.9];
  v14[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGFloat v11 = (void *)qword_1EB25E118;
  qword_1EB25E118 = (uint64_t)v10;
}

void __57__UIColor__UIInterfaceAPI__tertiarySystemBackgroundColor__block_invoke()
{
  v26[10] = *MEMORY[0x1E4F143B8];
  id v24 = [UIDynamicSystemColor alloc];
  size_t v23 = [NSString stringWithUTF8String:"tertiarySystemBackgroundColor"];
  CGColorSpaceRef v22 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v25[0] = v22;
  double v21 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[0] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v25[1] = v20;
  uint64_t v19 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[1] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v25[2] = v18;
  double v17 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
  v26[2] = v17;
  double v16 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v25[3] = v16;
  double v15 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.211764706 green:0.211764706 blue:0.219607843 alpha:1.0];
  v26[3] = v15;
  double v14 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v25[4] = v14;
  double v13 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.22745098 green:0.22745098 blue:0.235294118 alpha:1.0];
  v26[4] = v13;
  uint64_t v12 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v25[5] = v12;
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.266666667 green:0.266666667 blue:0.274509804 alpha:1.0];
  v26[5] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v25[6] = v1;
  id v2 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[6] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v25[7] = v3;
  id v4 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[7] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v25[8] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[8] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v25[9] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[9] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  CGFloat v11 = (void *)qword_1EB25E078;
  qword_1EB25E078 = (uint64_t)v10;
}

void __52__UIColor__InProgressSPI__quaternarySystemFillColor__block_invoke()
{
  v30[12] = *MEMORY[0x1E4F143B8];
  double v28 = [UIDynamicSystemColor alloc];
  id v27 = [NSString stringWithUTF8String:"quaternarySystemFillColor"];
  id v26 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v29[0] = v26;
  id v25 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.454901961 green:0.454901961 blue:0.501960784 alpha:0.08];
  v30[0] = v25;
  id v24 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v29[1] = v24;
  size_t v23 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.454901961 green:0.454901961 blue:0.501960784 alpha:0.16];
  v30[1] = v23;
  CGColorSpaceRef v22 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v29[2] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.18];
  v30[2] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v29[3] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.26];
  v30[3] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v29[4] = v18;
  double v17 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.08];
  v30[4] = v17;
  double v16 = _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v29[5] = v16;
  double v15 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.08];
  v30[5] = v15;
  double v14 = _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v29[6] = v14;
  double v13 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.08];
  v30[6] = v13;
  uint64_t v12 = _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v29[7] = v12;
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.08];
  v30[7] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v29[8] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.1];
  v30[8] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v29[9] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.956862745 blue:0.988235294 alpha:0.12];
  v30[9] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v29[10] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.05];
  v30[10] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v29[11] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.08];
  v30[11] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  CGFloat v11 = (void *)qword_1EB25E108;
  qword_1EB25E108 = (uint64_t)v10;
}

void __64__UIColor__UIInterfaceAPI__tertiarySystemGroupedBackgroundColor__block_invoke()
{
  v26[10] = *MEMORY[0x1E4F143B8];
  id v24 = [UIDynamicSystemColor alloc];
  size_t v23 = [NSString stringWithUTF8String:"tertiarySystemGroupedBackgroundColor"];
  CGColorSpaceRef v22 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v25[0] = v22;
  double v21 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.949019608 green:0.949019608 blue:0.968627451 alpha:1.0];
  v26[0] = v21;
  size_t v20 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v25[1] = v20;
  uint64_t v19 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.921568627 green:0.921568627 blue:0.941176471 alpha:1.0];
  v26[1] = v19;
  uint64_t v18 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v25[2] = v18;
  double v17 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
  v26[2] = v17;
  double v16 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v25[3] = v16;
  double v15 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.211764706 green:0.211764706 blue:0.219607843 alpha:1.0];
  v26[3] = v15;
  double v14 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v25[4] = v14;
  double v13 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.22745098 green:0.22745098 blue:0.235294118 alpha:1.0];
  v26[4] = v13;
  uint64_t v12 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v25[5] = v12;
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.266666667 green:0.266666667 blue:0.274509804 alpha:1.0];
  v26[5] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v25[6] = v1;
  id v2 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[6] = v2;
  id v3 = _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v25[7] = v3;
  id v4 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v26[7] = v4;
  id v5 = _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v25[8] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[8] = v6;
  id v7 = _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v25[9] = v7;
  id v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v26[9] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  CGFloat v11 = (void *)qword_1EB25E0A8;
  qword_1EB25E0A8 = (uint64_t)v10;
}

void __40__UIColor_systemDarkExtraLightGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkExtraLightGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC28;
          qword_1EB25DC28 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.835294118 green:0.835294118 blue:0.858823529 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC28;
  qword_1EB25DC28 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC28 _setSystemColorName:v8];
}

void __38__UIColor_systemDarkLightMidGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkLightMidGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC48;
          qword_1EB25DC48 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.639215686 green:0.639215686 blue:0.658823529 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC48;
  qword_1EB25DC48 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC48 _setSystemColorName:v8];
}

void __37__UIColor_systemDarkMidGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkMidGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DD28;
          qword_1EB25DD28 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0980392157 alpha:0.46];
  uint64_t v0 = (void *)qword_1EB25DD28;
  qword_1EB25DD28 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DD28 _setSystemColorName:v8];
}

void __36__UIColor_systemExtraLightGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemExtraLightGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB68;
          qword_1EB25DB68 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.937254902 green:0.937254902 blue:0.956862745 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DB68;
  qword_1EB25DB68 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB68 _setSystemColorName:v8];
}

void __35__UIColor_systemDarkLightGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkLightGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC38;
          qword_1EB25DC38 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.737254902 green:0.737254902 blue:0.760784314 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC38;
  qword_1EB25DC38 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC38 _setSystemColorName:v8];
}

void __33__UIColor_systemMidGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemMidGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCD8;
          qword_1EB25DCD8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0980392157 alpha:0.22];
  uint64_t v0 = (void *)qword_1EB25DCD8;
  qword_1EB25DCD8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCD8 _setSystemColorName:v8];
}

void __33__UIColor_systemDarkMidGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkMidGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC58;
          qword_1EB25DC58 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.545098039 green:0.545098039 blue:0.560784314 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC58;
  qword_1EB25DC58 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC58 _setSystemColorName:v8];
}

void __33__UIColor_externalSystemRedColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"externalSystemRedColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC88;
          qword_1EB25DC88 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC88;
  qword_1EB25DC88 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC88 _setSystemColorName:v8];
}

void __31__UIColor_systemLightGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemLightGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DB78;
          qword_1EB25DB78 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.898039216 green:0.898039216 blue:0.917647059 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DB78;
  qword_1EB25DB78 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DB78 _setSystemColorName:v8];
}

void __31__UIColor_systemDarkGreenColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkGreenColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBB8;
          qword_1EB25DBB8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.490196078 blue:0.105882353 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBB8;
  qword_1EB25DBB8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBB8 _setSystemColorName:v8];
}

void __30__UIColor_systemDarkGrayColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkGrayColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC68;
          qword_1EB25DC68 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.388235294 green:0.388235294 blue:0.4 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC68;
  qword_1EB25DC68 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC68 _setSystemColorName:v8];
}

void __30__UIColor_systemDarkBlueColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkBlueColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBC8;
          qword_1EB25DBC8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.250980392 blue:0.866666667 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBC8;
  qword_1EB25DBC8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBC8 _setSystemColorName:v8];
}

void __44__UIColor_systemDarkExtraLightGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkExtraLightGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCF8;
          qword_1EB25DCF8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.00784313725 green:0.00784313725 blue:0.121568627 alpha:0.17];
  uint64_t v0 = (void *)qword_1EB25DCF8;
  qword_1EB25DCF8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCF8 _setSystemColorName:v8];
}

void __42__UIColor_systemDarkLightMidGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkLightMidGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DD18;
          qword_1EB25DD18 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0392156863 green:0.0392156863 blue:0.160784314 alpha:0.38];
  uint64_t v0 = (void *)qword_1EB25DD18;
  qword_1EB25DD18 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DD18 _setSystemColorName:v8];
}

void __40__UIColor_systemExtraLightGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemExtraLightGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCA8;
          qword_1EB25DCA8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0392156863 green:0.0392156863 blue:0.470588235 alpha:0.05];
  uint64_t v0 = (void *)qword_1EB25DCA8;
  qword_1EB25DCA8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCA8 _setSystemColorName:v8];
}

void __39__UIColor_systemDarkLightGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkLightGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DD08;
          qword_1EB25DD08 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0352941176 green:0.0352941176 blue:0.129411765 alpha:0.27];
  uint64_t v0 = (void *)qword_1EB25DD08;
  qword_1EB25DD08 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DD08 _setSystemColorName:v8];
}

void __38__UIColor_systemLightMidGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemLightMidGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCC8;
          qword_1EB25DCC8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0980392157 green:0.0980392157 blue:0.392156863 alpha:0.18];
  uint64_t v0 = (void *)qword_1EB25DCC8;
  qword_1EB25DCC8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCC8 _setSystemColorName:v8];
}

void __35__UIColor_systemLightGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemLightGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCB8;
          qword_1EB25DCB8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0980392157 green:0.0980392157 blue:0.392156863 alpha:0.07];
  uint64_t v0 = (void *)qword_1EB25DCB8;
  qword_1EB25DCB8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCB8 _setSystemColorName:v8];
}

void __35__UIColor_externalSystemGreenColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"externalSystemGreenColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC98;
          qword_1EB25DC98 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC98;
  qword_1EB25DC98 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC98 _setSystemColorName:v8];
}

void __34__UIColor_systemDarkGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DD38;
          qword_1EB25DD38 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.62];
  uint64_t v0 = (void *)qword_1EB25DD38;
  qword_1EB25DD38 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DD38 _setSystemColorName:v8];
}

void __34__UIColor_externalSystemTealColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"externalSystemTealColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC78;
          qword_1EB25DC78 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.352941176 green:0.784313725 blue:0.980392157 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC78;
  qword_1EB25DC78 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC78 _setSystemColorName:v8];
}

void __32__UIColor_systemDarkYellowColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkYellowColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBE8;
          qword_1EB25DBE8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.576470588 green:0.415686275 blue:0.211764706 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBE8;
  qword_1EB25DBE8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBE8 _setSystemColorName:v8];
}

void __32__UIColor_systemDarkPurpleColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkPurpleColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC18;
          qword_1EB25DC18 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.274509804 green:0.266666667 blue:0.670588235 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC18;
  qword_1EB25DC18 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC18 _setSystemColorName:v8];
}

void __32__UIColor_systemDarkOrangeColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkOrangeColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBD8;
          qword_1EB25DBD8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.937254902 green:0.337254902 blue:0.00784313725 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBD8;
  qword_1EB25DBD8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBD8 _setSystemColorName:v8];
}

void __30__UIColor_systemGrayTintColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemGrayTintColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DCE8;
          qword_1EB25DCE8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.45];
  uint64_t v0 = (void *)qword_1EB25DCE8;
  qword_1EB25DCE8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DCE8 _setSystemColorName:v8];
}

void __30__UIColor_systemDarkTealColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkTealColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBF8;
          qword_1EB25DBF8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.00392156863 green:0.568627451 blue:0.823529412 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBF8;
  qword_1EB25DBF8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBF8 _setSystemColorName:v8];
}

void __30__UIColor_systemDarkPinkColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkPinkColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DC08;
          qword_1EB25DC08 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.854901961 green:0.0588235294 blue:0.278431373 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DC08;
  qword_1EB25DC08 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DC08 _setSystemColorName:v8];
}

void __29__UIColor_systemDarkRedColor__block_invoke()
{
  id v8 = [NSString stringWithUTF8String:"systemDarkRedColor"];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v0 = _UIKitUserDefaults();
    uint64_t v1 = [v0 stringForKey:v8];
    id v2 = v1;
    if (v1)
    {
      if ([v1 length])
      {
        id v3 = __colorValuesFromString(v2);
        if (v3)
        {
          id v4 = (double *)v3;
          id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:*v4 green:v4[1] blue:v4[2] alpha:1.0];
          id v6 = (void *)qword_1EB25DBA8;
          qword_1EB25DBA8 = (uint64_t)v5;

          free(v4);
          goto LABEL_8;
        }
      }
    }
  }
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.878431373 green:0.0235294118 blue:0.105882353 alpha:1.0];
  uint64_t v0 = (void *)qword_1EB25DBA8;
  qword_1EB25DBA8 = (uint64_t)v7;
LABEL_8:

  [(id)qword_1EB25DBA8 _setSystemColorName:v8];
}

void __50__UIColor__InProgressSPI___controlForegroundColor__block_invoke()
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_controlForegroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v11[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v12[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v11[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.3];
  v12[1] = v5;
  id v6 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v11[2] = v6;
  id v7 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.38];
  v12[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v8);
  id v10 = (void *)qword_1EB25E188;
  qword_1EB25E188 = (uint64_t)v9;
}

- (NSString)accessibilityName
{
  id v2 = [(UIColor *)self CGColor];
  return AXNameFromColor(v2);
}

- (NSString)_accessibilityNameWithLuma
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v3 = (uint64_t (*)(UIColor *, uint64_t))off_1EB25ED08;
  id v10 = off_1EB25ED08;
  if (!off_1EB25ED08)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getAXColorStringForColorSymbolLoc_block_invoke;
    v6[3] = &unk_1E52D9900;
    v6[4] = &v7;
    __getAXColorStringForColorSymbolLoc_block_invoke(v6);
    id v3 = (uint64_t (*)(UIColor *, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3) {
    return (NSString *)v3(self, 1);
  }
  id v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  result = (NSString *)objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_AXColorStringForColor(UIColor *, NSUInteger)"), @"UIAccessibility.m", 63, @"%s", dlerror());
  __break(1u);
  return result;
}

- (id)_inverseColor
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  BOOL v2 = [(UIColor *)self getRed:&v7 green:&v6 blue:&v5 alpha:0];
  id v3 = 0;
  if (v2)
  {
    id v3 = +[UIColor colorWithRed:1.0 - v7 green:1.0 - v6 blue:1.0 - v5 alpha:1.0];
  }
  return v3;
}

- (double)_distanceFrom:(id)a3
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  id v4 = a3;
  BOOL v5 = [(UIColor *)self getRed:&v13 green:&v12 blue:&v11 alpha:0];
  int v6 = [v4 getRed:&v10 green:&v9 blue:&v8 alpha:0];

  double result = 1.79769313e308;
  if (v5)
  {
    if (v6) {
      return sqrt((v10 - v13) * (v10 - v13) + (v9 - v12) * (v9 - v12) + (v8 - v11) * (v8 - v11));
    }
  }
  return result;
}

+ (id)_disambiguated_due_to_CIImage_colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[UIColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
}

+ (UIColor)colorWithCIColor:(CIColor *)ciColor
{
  id v3 = ciColor;
  id v4 = (void *)[objc_allocWithZone((Class)UIColor) initWithCIColor:v3];

  return (UIColor *)v4;
}

+ (UIColor)colorWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  int v6 = (void *)[objc_allocWithZone((Class)UIColor) initWithDisplayP3Red:displayP3Red green:green blue:blue alpha:alpha];
  return (UIColor *)v6;
}

+ (id)_composedColorFromSourceColor:(void *)a3 destinationColor:(void *)a4 tintColor:(void *)a5 alpha:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  self;
  if (!v9)
  {
    id v9 = +[UIColor whiteColor];
  }
  double v26 = 0.0;
  double v27 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v22 = 0.0;
  double v23 = 0.0;
  double v20 = 0.0;
  double v21 = 0.0;
  [v8 getRed:&v27 green:&v26 blue:&v25 alpha:&v24];
  [v9 getRed:&v23 green:&v22 blue:&v21 alpha:&v20];
  double v11 = v27 * v20 + v23 * (1.0 - v24);
  double v12 = v20 * v26 + (1.0 - v24) * v22;
  double v13 = v20 * v25 + (1.0 - v24) * v21;
  if (v10)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    [v10 getRed:&v19 green:&v18 blue:&v17 alpha:&v16];
    double v11 = v19 + v11 * (1.0 - v16);
    double v12 = v18 + v12 * (1.0 - v16);
    double v13 = v17 + v13 * (1.0 - v16);
  }
  double v14 = +[UIColor colorWithRed:v11 green:v12 blue:v13 alpha:a1];

  return v14;
}

+ (id)_accessibilityDarkenedColorForColor:(id)a3
{
  id v3 = a3;
  if ([v3 _isDynamic])
  {
    id v4 = [v3 _highContrastDynamicColor];
    goto LABEL_16;
  }
  id v5 = v3;
  self;
  int v6 = [v5 _systemColorName];

  if (v6
    && (unint64_t)[v6 length] >= 8
    && [v6 hasPrefix:@"system"])
  {
    double v7 = [v6 substringFromIndex:6];
    id v8 = [@"systemDark" stringByAppendingString:v7];

    id v9 = _selectorForColorName(v8);
    if (v9)
    {
      id v10 = +[UIColor performSelector:v9];
    }
    else
    {
      id v10 = 0;
    }

    if (v10)
    {
      id v14 = v10;
      id v4 = v14;
      goto LABEL_15;
    }
  }
  else
  {
  }
  double v21 = 0.0;
  double v22 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  [v5 getRed:&v22 green:&v21 blue:&v20 alpha:&v19];
  if (fabs(v22 + -1.0) <= 0.001)
  {
    double v11 = v20;
    if (fabs(v21 + -1.0) <= 0.001 && fabs(v20 + -1.0) <= 0.001)
    {
      double v13 = (UIColor *)v5;
      goto LABEL_14;
    }
  }
  else
  {
    double v11 = v20;
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double v16 = 0.0;
  _NXRGBToHSB(&v18, &v17, &v16, v22, v21, v11);
  double v12 = [UIColor alloc];
  double v13 = [(UIColor *)v12 initWithHue:v18 saturation:v17 brightness:v16 * 0.8 alpha:v19];
LABEL_14:
  id v4 = v13;
  id v14 = 0;
LABEL_15:

LABEL_16:
  return v4;
}

+ (id)_accessibilityLightenedColorForColor:(id)a3
{
  id v3 = a3;
  if ([v3 _isDynamic])
  {
    id v4 = [v3 _highContrastDynamicColor];
  }
  else
  {
    double v16 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    [v3 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];

    double v11 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    _NXRGBToHSB(&v12, &v11, &v10, v16, v15, v14);
    if (v10 == 0.0)
    {
      double v5 = 1.25;
    }
    else
    {
      double v5 = fmax(1.0 / v10, 1.0);
      if (v5 > 1.25) {
        double v5 = 1.25;
      }
    }
    double v6 = v10 * v5;
    double v7 = v11 * (v5 + -1.25 + 1.0);
    id v8 = [UIColor alloc];
    id v4 = [(UIColor *)v8 initWithHue:v12 saturation:v7 brightness:v6 alpha:v13];
  }
  return v4;
}

+ (id)_dynamicCatalogColorForNibEncodingWithName:(id)a3 genericColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [UIDynamicCatalogColor alloc];
  id v9 = v7;
  id v10 = v6;
  double v11 = v10;
  if (!v8) {
    goto LABEL_6;
  }
  if (v9)
  {
    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:sel__initForNibEncodingWithName_genericColor_, v8, @"UIColor.m", 4784, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
  }
  double v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:sel__initForNibEncodingWithName_genericColor_, v8, @"UIColor.m", 4785, @"Invalid parameter not satisfying: %@", @"genericColor != nil" object file lineNumber description];

LABEL_4:
  v16.receiver = v8;
  v16.super_class = (Class)UIDynamicCatalogColor;
  double v12 = objc_msgSendSuper2(&v16, sel_init);
  id v8 = (UIDynamicCatalogColor *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 3, a3);
    objc_storeStrong((id *)&v8->_genericColor, a4);
  }
LABEL_6:

  return v8;
}

- (UIColor)initWithCIColor:(CIColor *)ciColor
{
  id v4 = ciColor;

  double v5 = (UIColor *)[objc_allocWithZone((Class)UICIColor) initWithCIColor:v4];
  return v5;
}

- (UIColor)initWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  id v10 = objc_allocWithZone((Class)UIDisplayP3Color);
  return (UIColor *)[v10 initWithDisplayP3Red:displayP3Red green:green blue:blue alpha:alpha];
}

+ (UIColor)darkGrayColor
{
  if (qword_1EB25D8B8 != -1) {
    dispatch_once(&qword_1EB25D8B8, &__block_literal_global_1218);
  }
  BOOL v2 = (void *)qword_1EB25D8B0;
  return (UIColor *)v2;
}

void __24__UIColor_darkGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.333333333 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D8B0;
  qword_1EB25D8B0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D8B0;
  id v3 = [NSString stringWithUTF8String:"darkGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)cyanColor
{
  if (qword_1EB25D938 != -1) {
    dispatch_once(&qword_1EB25D938, &__block_literal_global_1243);
  }
  BOOL v2 = (void *)qword_1EB25D930;
  return (UIColor *)v2;
}

void __20__UIColor_cyanColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D930;
  qword_1EB25D930 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D930;
  id v3 = [NSString stringWithUTF8String:"cyanColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)yellowColor
{
  if (qword_1EB25D948 != -1) {
    dispatch_once(&qword_1EB25D948, &__block_literal_global_1246);
  }
  BOOL v2 = (void *)qword_1EB25D940;
  return (UIColor *)v2;
}

void __22__UIColor_yellowColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D940;
  qword_1EB25D940 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D940;
  id v3 = [NSString stringWithUTF8String:"yellowColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)magentaColor
{
  if (qword_1EB25D958 != -1) {
    dispatch_once(&qword_1EB25D958, &__block_literal_global_1249_0);
  }
  BOOL v2 = (void *)qword_1EB25D950;
  return (UIColor *)v2;
}

void __23__UIColor_magentaColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D950;
  qword_1EB25D950 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D950;
  id v3 = [NSString stringWithUTF8String:"magentaColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)orangeColor
{
  if (qword_1EB25D968 != -1) {
    dispatch_once(&qword_1EB25D968, &__block_literal_global_1252);
  }
  BOOL v2 = (void *)qword_1EB25D960;
  return (UIColor *)v2;
}

void __22__UIColor_orangeColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D960;
  qword_1EB25D960 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D960;
  id v3 = [NSString stringWithUTF8String:"orangeColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)purpleColor
{
  if (qword_1EB25D978 != -1) {
    dispatch_once(&qword_1EB25D978, &__block_literal_global_1255);
  }
  BOOL v2 = (void *)qword_1EB25D970;
  return (UIColor *)v2;
}

void __22__UIColor_purpleColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D970;
  qword_1EB25D970 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D970;
  id v3 = [NSString stringWithUTF8String:"purpleColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)brownColor
{
  if (qword_1EB25D988 != -1) {
    dispatch_once(&qword_1EB25D988, &__block_literal_global_1258);
  }
  BOOL v2 = (void *)qword_1EB25D980;
  return (UIColor *)v2;
}

void __21__UIColor_brownColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D980;
  qword_1EB25D980 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D980;
  id v3 = [NSString stringWithUTF8String:"brownColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellGroupedBackgroundColorLegacyWhite
{
  if (qword_1EB25D998 != -1) {
    dispatch_once(&qword_1EB25D998, &__block_literal_global_1261);
  }
  BOOL v2 = (void *)qword_1EB25D990;
  return v2;
}

void __53__UIColor_tableCellGroupedBackgroundColorLegacyWhite__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D990;
  qword_1EB25D990 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D990;
  id v3 = [NSString stringWithUTF8String:"tableCellGroupedBackgroundColorLegacyWhite"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellBackgroundColor
{
  if (qword_1EB25D9A8 != -1) {
    dispatch_once(&qword_1EB25D9A8, &__block_literal_global_1264);
  }
  BOOL v2 = (void *)qword_1EB25D9A0;
  return v2;
}

void __35__UIColor_tableCellBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D9A0;
  qword_1EB25D9A0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9A0;
  id v3 = [NSString stringWithUTF8String:"tableCellBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellbackgroundColorCarPlay
{
  if (qword_1EB25D9B8 != -1) {
    dispatch_once(&qword_1EB25D9B8, &__block_literal_global_1267);
  }
  BOOL v2 = (void *)qword_1EB25D9B0;
  return v2;
}

void __42__UIColor_tableCellbackgroundColorCarPlay__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D9B0;
  qword_1EB25D9B0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9B0;
  id v3 = [NSString stringWithUTF8String:"tableCellbackgroundColorCarPlay"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableSelectionGradientStartColor
{
  if (qword_1EB25D9C8 != -1) {
    dispatch_once(&qword_1EB25D9C8, &__block_literal_global_1270);
  }
  BOOL v2 = (void *)qword_1EB25D9C0;
  return v2;
}

void __43__UIColor_tableSelectionGradientStartColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.02 green:0.55 blue:0.96 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D9C0;
  qword_1EB25D9C0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9C0;
  id v3 = [NSString stringWithUTF8String:"tableSelectionGradientStartColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableSelectionGradientEndColor
{
  if (qword_1EB25D9D8 != -1) {
    dispatch_once(&qword_1EB25D9D8, &__block_literal_global_1273_0);
  }
  BOOL v2 = (void *)qword_1EB25D9D0;
  return v2;
}

void __41__UIColor_tableSelectionGradientEndColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.04 green:0.37 blue:0.91 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25D9D0;
  qword_1EB25D9D0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9D0;
  id v3 = [NSString stringWithUTF8String:"tableSelectionGradientEndColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableShadowColor
{
  if (qword_1EB25D9E8 != -1) {
    dispatch_once(&qword_1EB25D9E8, &__block_literal_global_1276);
  }
  BOOL v2 = (void *)qword_1EB25D9E0;
  return v2;
}

void __27__UIColor_tableShadowColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.91];
  uint64_t v1 = (void *)qword_1EB25D9E0;
  qword_1EB25D9E0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9E0;
  id v3 = [NSString stringWithUTF8String:"tableShadowColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableGroupedTopShadowColor
{
  if (qword_1EB25D9F8 != -1) {
    dispatch_once(&qword_1EB25D9F8, &__block_literal_global_1279_0);
  }
  BOOL v2 = (void *)qword_1EB25D9F0;
  return v2;
}

void __37__UIColor_tableGroupedTopShadowColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.08];
  uint64_t v1 = (void *)qword_1EB25D9F0;
  qword_1EB25D9F0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25D9F0;
  id v3 = [NSString stringWithUTF8String:"tableGroupedTopShadowColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)sectionListBorderColor
{
  if (qword_1EB25DA08 != -1) {
    dispatch_once(&qword_1EB25DA08, &__block_literal_global_1282);
  }
  BOOL v2 = (void *)qword_1EB25DA00;
  return v2;
}

void __33__UIColor_sectionListBorderColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.52 green:0.56 blue:0.58 alpha:0.8];
  uint64_t v1 = (void *)qword_1EB25DA00;
  qword_1EB25DA00 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA00;
  id v3 = [NSString stringWithUTF8String:"sectionListBorderColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)sectionHeaderBackgroundColor
{
  if (qword_1EB25DA18 != -1) {
    dispatch_once(&qword_1EB25DA18, &__block_literal_global_1285);
  }
  BOOL v2 = (void *)qword_1EB25DA10;
  return v2;
}

void __39__UIColor_sectionHeaderBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.9 green:0.93 blue:0.99 alpha:0.8];
  uint64_t v1 = (void *)qword_1EB25DA10;
  qword_1EB25DA10 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA10;
  id v3 = [NSString stringWithUTF8String:"sectionHeaderBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)sectionHeaderOpaqueBackgroundColor
{
  if (qword_1EB25DA28 != -1) {
    dispatch_once(&qword_1EB25DA28, &__block_literal_global_1288);
  }
  BOOL v2 = (void *)qword_1EB25DA20;
  return v2;
}

void __45__UIColor_sectionHeaderOpaqueBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.92 green:0.94 blue:0.99 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA20;
  qword_1EB25DA20 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA20;
  id v3 = [NSString stringWithUTF8String:"sectionHeaderOpaqueBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)sectionHeaderBorderColor
{
  if (qword_1EB25DA38 != -1) {
    dispatch_once(&qword_1EB25DA38, &__block_literal_global_1291_0);
  }
  BOOL v2 = (void *)qword_1EB25DA30;
  return v2;
}

void __35__UIColor_sectionHeaderBorderColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.85 green:0.87 blue:0.91 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA30;
  qword_1EB25DA30 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA30;
  id v3 = [NSString stringWithUTF8String:"sectionHeaderBorderColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellValue1BlueColor
{
  if (qword_1EB25DA48 != -1) {
    dispatch_once(&qword_1EB25DA48, &__block_literal_global_1294);
  }
  BOOL v2 = (void *)qword_1EB25DA40;
  return v2;
}

void __35__UIColor_tableCellValue1BlueColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.22 green:0.33 blue:0.53 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA40;
  qword_1EB25DA40 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA40;
  id v3 = [NSString stringWithUTF8String:"tableCellValue1BlueColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellValue2BlueColor
{
  if (qword_1EB25DA58 != -1) {
    dispatch_once(&qword_1EB25DA58, &__block_literal_global_1297_0);
  }
  BOOL v2 = (void *)qword_1EB25DA50;
  return v2;
}

void __35__UIColor_tableCellValue2BlueColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.32 green:0.4 blue:0.57 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA50;
  qword_1EB25DA50 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA50;
  id v3 = [NSString stringWithUTF8String:"tableCellValue2BlueColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellGrayTextColor
{
  if (qword_1EB25DA68 != -1) {
    dispatch_once(&qword_1EB25DA68, &__block_literal_global_1300);
  }
  BOOL v2 = (void *)qword_1EB25DA60;
  return v2;
}

void __33__UIColor_tableCellGrayTextColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA60;
  qword_1EB25DA60 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA60;
  id v3 = [NSString stringWithUTF8String:"tableCellGrayTextColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)textFieldAtomPurpleColor
{
  if (qword_1EB25DA78 != -1) {
    dispatch_once(&qword_1EB25DA78, &__block_literal_global_1303_0);
  }
  BOOL v2 = (void *)qword_1EB25DA70;
  return v2;
}

void __35__UIColor_textFieldAtomPurpleColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.41 green:0.0 blue:0.74 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA70;
  qword_1EB25DA70 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA70;
  id v3 = [NSString stringWithUTF8String:"textFieldAtomPurpleColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)infoTextOverPinStripeTextColor
{
  if (qword_1EB25DA88 != -1) {
    dispatch_once(&qword_1EB25DA88, &__block_literal_global_1306);
  }
  BOOL v2 = (void *)qword_1EB25DA80;
  return v2;
}

void __41__UIColor_infoTextOverPinStripeTextColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.3 green:0.34 blue:0.42 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DA80;
  qword_1EB25DA80 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DA80;
  id v3 = [NSString stringWithUTF8String:"infoTextOverPinStripeTextColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)textFieldAtomBlueColor
{
  return +[UIColor systemBlueColor];
}

- (UIColor)colorWithAlphaComponent:(CGFloat)alpha
{
  return 0;
}

- (CGColorRef)CGColor
{
  return 0;
}

- (CIColor)CIColor
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)getWhite:(CGFloat *)white alpha:(CGFloat *)alpha
{
  return 0;
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha
{
  return 0;
}

- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
  return 0;
}

- (id)colorSpaceName
{
  return @"UIUnknownColorSpace";
}

- (double)alphaComponent
{
  return 0.0;
}

- (BOOL)isPatternColor
{
  return 0;
}

- (BOOL)_isDeepColor
{
  return 0;
}

- (BOOL)_isOpaque
{
  double v3 = 0.0;
  [(UIColor *)self getRed:0 green:0 blue:0 alpha:&v3];
  return v3 == 1.0;
}

- (id)_debugName
{
  double v3 = [(UIColor *)self _systemColorName];
  if (!v3)
  {
    double v3 = objc_getAssociatedObject(self, &_debugName_key);
  }
  return v3;
}

- (void)_setDebugName:(id)a3
{
}

- (id)_debugCatalogBundleIdentifier
{
  return objc_getAssociatedObject(self, &_debugCatalogBundleIdentifier_key);
}

- (void)_setDebugCatalogBundleIdentifier:(id)a3
{
}

- (double)_colorDifferenceFromColor:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UIColor *)self CGColor];
  double v6 = 0.0;
  if (!v5) {
    goto LABEL_13;
  }
  id v7 = v5;
  Components = CGColorGetComponents(v5);
  CGFloat Alpha = CGColorGetAlpha(v7);
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(v7);
  if (!Components) {
    goto LABEL_13;
  }
  CGColorSpaceRef v11 = ColorSpace;
  long long v25 = 0u;
  long long v26 = 0u;
  if (qword_1EB25E410 != -1) {
    dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
  }
  if ((CGColorSpaceRef)qword_1EB25E408 == v11) {
    goto LABEL_11;
  }
  if (qword_1EB25E450 != -1) {
    dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
  }
  if ((CGColorSpaceRef)qword_1EB25E448 == v11) {
    goto LABEL_11;
  }
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
LABEL_13:
    int v14 = 0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    goto LABEL_14;
  }
  *((CGFloat *)&v26 + 1) = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v25;
LABEL_11:
  double v12 = *Components;
  double v13 = Components[1];
  int v14 = 1;
  double v15 = Components[2];
  double v16 = Components[3];
LABEL_14:
  id v17 = v4;
  double v18 = (CGColor *)[v17 CGColor];
  if (v18)
  {
    double v19 = v18;
    double v20 = CGColorGetComponents(v18);
    CGFloat v21 = CGColorGetAlpha(v19);
    CGColorSpaceRef v22 = CGColorGetColorSpace(v19);
    if (v20)
    {
      CGColorSpaceRef v23 = v22;
      long long v25 = 0u;
      long long v26 = 0u;
      if (qword_1EB25E410 != -1) {
        dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
      }
      if ((CGColorSpaceRef)qword_1EB25E408 != v23)
      {
        if (qword_1EB25E450 != -1) {
          dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
        }
        if ((CGColorSpaceRef)qword_1EB25E448 != v23)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            goto LABEL_27;
          }
          *((CGFloat *)&v26 + 1) = v21;
          CGColorTransformRelease();
          double v20 = (const CGFloat *)&v25;
        }
      }
      if (v14) {
        double v6 = vabdd_f64(v15 * v16, v20[2] * v20[3])
      }
           + vabdd_f64(v12 * v16, *v20 * v20[3])
           + vabdd_f64(v13 * v16, v20[1] * v20[3]);
    }
  }
LABEL_27:

  return v6;
}

- (double)_luminance
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(UIColor *)self CGColor];
  double v3 = 0.0;
  if (v2)
  {
    id v4 = v2;
    Components = CGColorGetComponents(v2);
    CGFloat Alpha = CGColorGetAlpha(v4);
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace(v4);
    if (Components)
    {
      CGColorSpaceRef v8 = ColorSpace;
      long long v12 = 0u;
      long long v13 = 0u;
      if (qword_1EB25E410 != -1) {
        dispatch_once(&qword_1EB25E410, &__block_literal_global_2184);
      }
      if ((CGColorSpaceRef)qword_1EB25E408 != v8)
      {
        if (qword_1EB25E450 != -1) {
          dispatch_once(&qword_1EB25E450, &__block_literal_global_2192);
        }
        if ((CGColorSpaceRef)qword_1EB25E448 != v8)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            return v3;
          }
          *((CGFloat *)&v13 + 1) = Alpha;
          CGColorTransformRelease();
          Components = (const CGFloat *)&v12;
        }
      }
      double v9 = Components[3];
      +[UIColor _luminanceWithRed:green:blue:](UIColor, "_luminanceWithRed:green:blue:", *Components, Components[1], Components[2], v12, v13);
      return v9 * v10;
    }
  }
  return v3;
}

- (double)_luminanceDifferenceFromColor:(id)a3
{
  id v4 = a3;
  [(UIColor *)self _luminance];
  double v6 = v5;
  [v4 _luminance];
  double v8 = v7;

  return vabdd_f64(v6, v8);
}

+ (double)_luminanceWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  return a3 * 0.2126 + a4 * 0.7152 + a5 * 0.0722;
}

- (id)_colorBlendedWithColors:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      double v10 = v5;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        double v5 = [(UIColor *)v10 _colorBlendedWithColor:*(void *)(*((void *)&v12 + 1) + 8 * v9)];

        ++v9;
        double v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)pinStripeColor
{
  if (qword_1EB25DAC0 != -1) {
    dispatch_once(&qword_1EB25DAC0, &__block_literal_global_1325);
  }
  BOOL v2 = (void *)qword_1EB25DAB8;
  return v2;
}

void __25__UIColor_pinStripeColor__block_invoke()
{
  _UIImageWithName(@"UIPinstripe.png");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [(UIColor *)[UICachedPatternCGColor alloc] initWithPatternImage:v4];
  uint64_t v1 = (void *)qword_1EB25DAB8;
  qword_1EB25DAB8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DAB8;
  double v3 = [NSString stringWithUTF8String:"pinStripeColor"];
  [v2 _setSystemColorName:v3];
}

+ (UIColor)lightTextColor
{
  if (qword_1EB25DB00 != -1) {
    dispatch_once(&qword_1EB25DB00, &__block_literal_global_1341);
  }
  BOOL v2 = (void *)qword_1EB25DAF8;
  return (UIColor *)v2;
}

void __25__UIColor_lightTextColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.6];
  uint64_t v1 = (void *)qword_1EB25DAF8;
  qword_1EB25DAF8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DAF8;
  id v3 = [NSString stringWithUTF8String:"lightTextColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)keyboardFocusIndicatorColor
{
  self;
  return +[UIColor _appKeyColorOrDefaultTint]();
}

+ (id)tableGroupedSeparatorLightColor
{
  id v3 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
  if (!tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor)
  {
    id v4 = +[UIColor colorWithRed:0.783921569 green:0.780392157 blue:0.8 alpha:1.0];
    uint64_t v5 = +[UIColor _systemColorForColor:withName:]((uint64_t)a1, v4, @"tableGroupedSeparatorLightColor");
    uint64_t v6 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
    tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor = v5;

    id v3 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
  }
  return v3;
}

+ (UIColor)viewFlipsideBackgroundColor
{
  if (qword_1EB25DB30 != -1) {
    dispatch_once(&qword_1EB25DB30, &__block_literal_global_1349_0);
  }
  BOOL v2 = (void *)qword_1EB25DB28;
  return (UIColor *)v2;
}

void __38__UIColor_viewFlipsideBackgroundColor__block_invoke()
{
  if (!qword_1EB25DB28)
  {
    uint64_t v0 = +[UIColor colorWithRed:0.121568627 green:0.129411765 blue:0.141176471 alpha:1.0];
    uint64_t v1 = (void *)qword_1EB25DB28;
    qword_1EB25DB28 = v0;

    BOOL v2 = (void *)qword_1EB25DB28;
    [v2 _setSystemColorName:@"viewFlipsideBackgroundColor"];
  }
}

+ (UIColor)underPageBackgroundColor
{
  if (qword_1EB25DB40 != -1) {
    dispatch_once(&qword_1EB25DB40, &__block_literal_global_1351_0);
  }
  BOOL v2 = (void *)qword_1EB25DB38;
  return (UIColor *)v2;
}

void __35__UIColor_underPageBackgroundColor__block_invoke()
{
  if (!qword_1EB25DB38)
  {
    uint64_t v0 = +[UIColor colorWithRed:0.709803922 green:0.717647059 blue:0.741176471 alpha:1.0];
    uint64_t v1 = (void *)qword_1EB25DB38;
    qword_1EB25DB38 = v0;

    BOOL v2 = (void *)qword_1EB25DB38;
    [v2 _setSystemColorName:@"underPageBackgroundColor"];
  }
}

+ (UIColor)scrollViewTexturedBackgroundColor
{
  BOOL v2 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
  if (!scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor)
  {
    uint64_t v3 = +[UIColor colorWithRed:0.435294118 green:0.443137255 blue:0.474509804 alpha:1.0];
    id v4 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
    scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor = v3;

    [(id)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor _setSystemColorName:@"scrollViewTexturedBackgroundColor"];
    BOOL v2 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
  }
  return (UIColor *)v2;
}

+ (id)_systemInteractionTintColor
{
  if (qword_1EB25DD50 != -1) {
    dispatch_once(&qword_1EB25DD50, &__block_literal_global_1449);
  }
  BOOL v2 = (void *)qword_1EB25DD48;
  return v2;
}

void __38__UIColor__systemInteractionTintColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DD48;
  qword_1EB25DD48 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DD48;
  id v3 = [NSString stringWithUTF8String:"_systemInteractionTintColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_systemDestructiveTintColor
{
  if (qword_1EB25DD60 != -1) {
    dispatch_once(&qword_1EB25DD60, &__block_literal_global_1452);
  }
  BOOL v2 = (void *)qword_1EB25DD58;
  return v2;
}

void __38__UIColor__systemDestructiveTintColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DD58;
  qword_1EB25DD58 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DD58;
  id v3 = [NSString stringWithUTF8String:"_systemDestructiveTintColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_systemMidGrayTintColor
{
  if (qword_1EB25DD90 != -1) {
    dispatch_once(&qword_1EB25DD90, &__block_literal_global_1461);
  }
  BOOL v2 = (void *)qword_1EB25DD88;
  return v2;
}

void __34__UIColor__systemMidGrayTintColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0 blue:0.0980392157 alpha:0.22];
  uint64_t v1 = (void *)qword_1EB25DD88;
  qword_1EB25DD88 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DD88;
  id v3 = [NSString stringWithUTF8String:"_systemMidGrayTintColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemWhiteColor
{
  if (qword_1EB25DDA0 != -1) {
    dispatch_once(&qword_1EB25DDA0, &__block_literal_global_1464_0);
  }
  BOOL v2 = (void *)qword_1EB25DD98;
  return v2;
}

void __36__UIColor__externalSystemWhiteColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DD98;
  qword_1EB25DD98 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DD98;
  id v3 = [NSString stringWithUTF8String:"_externalSystemWhiteColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemMidGrayColor
{
  if (qword_1EB25DDB0 != -1) {
    dispatch_once(&qword_1EB25DDB0, &__block_literal_global_1467);
  }
  BOOL v2 = (void *)qword_1EB25DDA8;
  return v2;
}

void __38__UIColor__externalSystemMidGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.780392157 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DDA8;
  qword_1EB25DDA8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDA8;
  id v3 = [NSString stringWithUTF8String:"_externalSystemMidGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemGrayColor
{
  if (qword_1EB25DDC0 != -1) {
    dispatch_once(&qword_1EB25DDC0, &__block_literal_global_1470_0);
  }
  BOOL v2 = (void *)qword_1EB25DDB8;
  return v2;
}

void __35__UIColor__externalSystemGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.4 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DDB8;
  qword_1EB25DDB8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDB8;
  id v3 = [NSString stringWithUTF8String:"_externalSystemGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemDarkGrayColor
{
  if (qword_1EB25DDD0 != -1) {
    dispatch_once(&qword_1EB25DDD0, &__block_literal_global_1473);
  }
  BOOL v2 = (void *)qword_1EB25DDC8;
  return v2;
}

void __39__UIColor__externalSystemDarkGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.250980392 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DDC8;
  qword_1EB25DDC8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDC8;
  id v3 = [NSString stringWithUTF8String:"_externalSystemDarkGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemExtraDarkGrayColor
{
  if (qword_1EB25DDE0 != -1) {
    dispatch_once(&qword_1EB25DDE0, &__block_literal_global_1476_0);
  }
  BOOL v2 = (void *)qword_1EB25DDD8;
  return v2;
}

void __44__UIColor__externalSystemExtraDarkGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.2 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DDD8;
  qword_1EB25DDD8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDD8;
  id v3 = [NSString stringWithUTF8String:"_externalSystemExtraDarkGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_externalSystemSuperDarkGrayColor
{
  if (qword_1EB25DDF0 != -1) {
    dispatch_once(&qword_1EB25DDF0, &__block_literal_global_1479);
  }
  BOOL v2 = (void *)qword_1EB25DDE8;
  return v2;
}

void __44__UIColor__externalSystemSuperDarkGrayColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.137254902 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DDE8;
  qword_1EB25DDE8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDE8;
  id v3 = [NSString stringWithUTF8String:"_externalSystemSuperDarkGrayColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_accessibilityButtonShapesBackgroundColorOnLight
{
  if (qword_1EB25DE00 != -1) {
    dispatch_once(&qword_1EB25DE00, &__block_literal_global_1482_0);
  }
  BOOL v2 = (void *)qword_1EB25DDF8;
  return v2;
}

void __59__UIColor__accessibilityButtonShapesBackgroundColorOnLight__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.2 alpha:0.95];
  uint64_t v1 = (void *)qword_1EB25DDF8;
  qword_1EB25DDF8 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DDF8;
  id v3 = [NSString stringWithUTF8String:"_accessibilityButtonShapesBackgroundColorOnLight"];
  [v2 _setSystemColorName:v3];
}

+ (id)_accessibilityButtonShapesBackgroundColorOnDark
{
  if (qword_1EB25DE10 != -1) {
    dispatch_once(&qword_1EB25DE10, &__block_literal_global_1485);
  }
  BOOL v2 = (void *)qword_1EB25DE08;
  return v2;
}

void __58__UIColor__accessibilityButtonShapesBackgroundColorOnDark__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.6 alpha:0.95];
  uint64_t v1 = (void *)qword_1EB25DE08;
  qword_1EB25DE08 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE08;
  id v3 = [NSString stringWithUTF8String:"_accessibilityButtonShapesBackgroundColorOnDark"];
  [v2 _setSystemColorName:v3];
}

+ (id)_accessibilityButtonShapesDisabledBackgroundColorOnDark
{
  if (qword_1EB25DE20 != -1) {
    dispatch_once(&qword_1EB25DE20, &__block_literal_global_1488_0);
  }
  BOOL v2 = (void *)qword_1EB25DE18;
  return v2;
}

void __66__UIColor__accessibilityButtonShapesDisabledBackgroundColorOnDark__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.5 alpha:0.95];
  uint64_t v1 = (void *)qword_1EB25DE18;
  qword_1EB25DE18 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE18;
  id v3 = [NSString stringWithUTF8String:"_accessibilityButtonShapesDisabledBackgroundColorOnDark"];
  [v2 _setSystemColorName:v3];
}

+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight
{
  if (qword_1EB25DE30 != -1) {
    dispatch_once(&qword_1EB25DE30, &__block_literal_global_1491);
  }
  BOOL v2 = (void *)qword_1EB25DE28;
  return v2;
}

void __70__UIColor__accessibilityButtonShapesNoBlendModeBackgroundColorOnLight__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.1];
  uint64_t v1 = (void *)qword_1EB25DE28;
  qword_1EB25DE28 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE28;
  id v3 = [NSString stringWithUTF8String:"_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight"];
  [v2 _setSystemColorName:v3];
}

+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark
{
  if (qword_1EB25DE40 != -1) {
    dispatch_once(&qword_1EB25DE40, &__block_literal_global_1494);
  }
  BOOL v2 = (void *)qword_1EB25DE38;
  return v2;
}

void __69__UIColor__accessibilityButtonShapesNoBlendModeBackgroundColorOnDark__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.25];
  uint64_t v1 = (void *)qword_1EB25DE38;
  qword_1EB25DE38 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE38;
  id v3 = [NSString stringWithUTF8String:"_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark"];
  [v2 _setSystemColorName:v3];
}

+ (id)noContentLightGradientBackgroundColor
{
  BOOL v2 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
  if (!noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor)
  {
    id v3 = _UIImageWithName(@"UIStockImageNoContentLightGradientBackgroundColor.png");
    uint64_t v4 = +[UIColor colorWithPatternImage:v3];
    uint64_t v5 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
    noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor = v4;

    [(id)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor _setSystemColorName:@"noContentLightGradientBackgroundColor"];
    BOOL v2 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
  }
  return v2;
}

+ (id)noContentDarkGradientBackgroundColor
{
  BOOL v2 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
  if (!noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor)
  {
    id v3 = +[UIScreen mainScreen];
    [v3 scale];
    double v5 = v4;
    id v6 = [[UIGradient alloc] initVerticalWithValues:&__kNoContentDarkBackgroundGradientValues];
    _UIGraphicsBeginImageContextWithOptions(1, 0, 20.0, 1024.0, v5);
    objc_msgSend(v6, "fillRect:", 0.0, 0.0, 20.0, 1024.0);
    uint64_t v7 = _UIGraphicsGetImageFromCurrentImageContext(0);

    uint64_t v8 = +[UIColor colorWithPatternImage:v7];
    uint64_t v9 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
    noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor = v8;

    [(id)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor _setSystemColorName:@"noContentDarkGradientBackgroundColor"];
    BOOL v2 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
  }
  return v2;
}

+ (id)_translucentPaperTextureColor
{
  if (qword_1EB25DE50 != -1) {
    dispatch_once(&qword_1EB25DE50, &__block_literal_global_1501);
  }
  BOOL v2 = (void *)qword_1EB25DE48;
  return v2;
}

void __40__UIColor__translucentPaperTextureColor__block_invoke()
{
  _UIImageWithName(@"UIStockImagePaperTexture.png");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [(UIColor *)[UICachedPatternCGColor alloc] initWithPatternImage:v4];
  uint64_t v1 = (void *)qword_1EB25DE48;
  qword_1EB25DE48 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE48;
  id v3 = [NSString stringWithUTF8String:"_translucentPaperTextureColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_grayColorForFontSize:(double)a3
{
  id v3 = +[UIColor colorWithWhite:1.0 alpha:dbl_186B97290[a3 < 40.0]];
  return v3;
}

+ (id)_externalBarBackgroundColor
{
  return +[UIColor tableBackgroundColor];
}

+ (id)_systemSelectedColor
{
  return +[UIColor systemGreenColor];
}

+ (id)_vibrantLightDividerBurnColor
{
  return +[UIColor colorWithWhite:0.250980392 alpha:1.0];
}

+ (id)_vibrantLightDividerDarkeningColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.31372549 alpha:0.05];
}

+ (id)_vibrantLightFillBurnColor
{
  return +[UIColor colorWithWhite:0.6 alpha:1.0];
}

+ (id)_vibrantLightFillDarkeningColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.04];
}

+ (id)_vibrantDarkFillDodgeColor
{
  return +[UIColor colorWithWhite:0.639215686 alpha:1.0];
}

+ (id)_vibrantLightSectionDelimiterDividerBurnColor
{
  return +[UIColor _vibrantLightDividerBurnColor];
}

+ (id)_vibrantLightSectionDelimiterDividerDarkeningColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.235294118 alpha:0.15];
}

+ (id)_webContentBackgroundColor
{
  if (qword_1EB25DE70 != -1) {
    dispatch_once(&qword_1EB25DE70, &__block_literal_global_1510);
  }
  BOOL v2 = (void *)qword_1EB25DE68;
  return v2;
}

void __37__UIColor__webContentBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.741176471 green:0.741176471 blue:0.760784314 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25DE68;
  qword_1EB25DE68 = (uint64_t)v0;

  BOOL v2 = (void *)qword_1EB25DE68;
  id v3 = [NSString stringWithUTF8String:"_webContentBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (NSArray)_apiColorNames
{
  return (NSArray *)&unk_1ED3EFD10;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  return 0;
}

+ (id)_monochromeCellImageTintColor
{
  if (qword_1EB25DFB0 != -1) {
    dispatch_once(&qword_1EB25DFB0, &__block_literal_global_1927);
  }
  BOOL v2 = (void *)qword_1EB25DFA8;
  return v2;
}

void __57__UIColor__UIInterfaceAPI___monochromeCellImageTintColor__block_invoke()
{
  uint64_t v0 = [UIDynamicCatalogSystemColor alloc];
  id v3 = [NSString stringWithUTF8String:"_monochromeCellImageTintColor"];
  uint64_t v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 16);
  BOOL v2 = (void *)qword_1EB25DFA8;
  qword_1EB25DFA8 = (uint64_t)v1;
}

+ (id)_systemBlueColor2
{
  if (qword_1EB25DFD0 != -1) {
    dispatch_once(&qword_1EB25DFD0, &__block_literal_global_1933);
  }
  BOOL v2 = (void *)qword_1EB25DFC8;
  return v2;
}

void __45__UIColor__UIInterfaceAPI___systemBlueColor2__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  long long v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"_systemBlueColor2"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  BOOL v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.250980392 blue:0.866666667 alpha:1.0];
  v14[1] = v4;
  double v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.274509804 green:0.576470588 blue:1.0 alpha:1.0];
  v14[2] = v6;
  uint64_t v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  uint64_t v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.274509804 green:0.576470588 blue:1.0 alpha:1.0];
  v14[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGColorSpaceRef v11 = (void *)qword_1EB25DFC8;
  qword_1EB25DFC8 = (uint64_t)v10;
}

+ (id)textGrammarIndicatorColor
{
  if (qword_1EB25E0C0 != -1) {
    dispatch_once(&qword_1EB25E0C0, &__block_literal_global_1979);
  }
  BOOL v2 = (void *)qword_1EB25E0B8;
  return v2;
}

void __53__UIColor__UIInterfaceAPI__textGrammarIndicatorColor__block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"textGrammarIndicatorColor"];
  BOOL v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  uint64_t v7 = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.694117647 blue:0.674509804 alpha:1.0];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v4);
  id v6 = (void *)qword_1EB25E0B8;
  qword_1EB25E0B8 = (uint64_t)v5;
}

+ (id)_dynamicTestColor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UIColor__InProgressSPI___dynamicTestColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (qword_1EB25E0D0 != -1) {
    dispatch_once(&qword_1EB25E0D0, block);
  }
  BOOL v2 = (void *)qword_1EB25E0C8;
  return v2;
}

void __44__UIColor__InProgressSPI___dynamicTestColor__block_invoke(uint64_t a1)
{
  v44[18] = *MEMORY[0x1E4F143B8];
  double v41 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v43[0] = v41;
  double v40 = +[UIColor blueColor];
  v44[0] = v40;
  double v39 = _UIThemeKeyFromTraitValues(-1, 1, 0, 0, 0, 0);
  v43[1] = v39;
  double v38 = +[UIColor greenColor];
  v44[1] = v38;
  double v37 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v43[2] = v37;
  double v36 = +[UIColor cyanColor];
  v44[2] = v36;
  uint64_t v35 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v43[3] = v35;
  long long v34 = +[UIColor redColor];
  v44[3] = v34;
  long long v33 = _UIThemeKeyFromTraitValues(-1, 1, 1, 0, 0, 0);
  v43[4] = v33;
  uint64_t v32 = +[UIColor magentaColor];
  v44[4] = v32;
  uint64_t v31 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v43[5] = v31;
  double v30 = +[UIColor yellowColor];
  v44[5] = v30;
  uint64_t v29 = _UIThemeKeyFromTraitValues(-1, 0, 0, 1, 0, 0);
  v43[6] = v29;
  double v28 = +[UIColor colorWithDisplayP3Red:0.0 green:0.0 blue:1.0 alpha:1.0];
  v44[6] = v28;
  uint64_t v27 = _UIThemeKeyFromTraitValues(-1, 1, 0, 1, 0, 0);
  v43[7] = v27;
  long long v26 = +[UIColor colorWithDisplayP3Red:0.0 green:1.0 blue:0.0 alpha:1.0];
  v44[7] = v26;
  long long v25 = _UIThemeKeyFromTraitValues(-1, 2, 0, 1, 0, 0);
  v43[8] = v25;
  double v24 = +[UIColor colorWithDisplayP3Red:0.0 green:1.0 blue:1.0 alpha:1.0];
  v44[8] = v24;
  CGColorSpaceRef v23 = _UIThemeKeyFromTraitValues(-1, 0, 1, 1, 0, 0);
  v43[9] = v23;
  CGColorSpaceRef v22 = +[UIColor colorWithDisplayP3Red:1.0 green:0.0 blue:0.0 alpha:1.0];
  v44[9] = v22;
  CGFloat v21 = _UIThemeKeyFromTraitValues(-1, 1, 1, 1, 0, 0);
  v43[10] = v21;
  double v20 = +[UIColor colorWithDisplayP3Red:1.0 green:0.0 blue:1.0 alpha:1.0];
  v44[10] = v20;
  double v19 = _UIThemeKeyFromTraitValues(-1, 2, 1, 1, 0, 0);
  v43[11] = v19;
  double v18 = +[UIColor colorWithDisplayP3Red:1.0 green:1.0 blue:0.0 alpha:1.0];
  v44[11] = v18;
  uint64_t v17 = _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v43[12] = v17;
  double v16 = +[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0];
  v44[12] = v16;
  uint64_t v1 = _UIThemeKeyFromTraitValues(3, 1, 0, 0, 0, 0);
  v43[13] = v1;
  BOOL v2 = +[UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:1.0];
  v44[13] = v2;
  id v3 = _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v43[14] = v3;
  id v4 = +[UIColor colorWithRed:0.5 green:0.9 blue:0.9 alpha:1.0];
  v44[14] = v4;
  id v5 = _UIThemeKeyFromTraitValues(3, 0, 1, 0, 0, 0);
  v43[15] = v5;
  id v6 = +[UIColor colorWithRed:0.9 green:0.5 blue:0.5 alpha:1.0];
  v44[15] = v6;
  uint64_t v7 = _UIThemeKeyFromTraitValues(3, 1, 1, 0, 0, 0);
  v43[16] = v7;
  uint64_t v8 = +[UIColor colorWithRed:0.9 green:0.5 blue:0.9 alpha:1.0];
  v44[16] = v8;
  uint64_t v9 = _UIThemeKeyFromTraitValues(3, 2, 1, 0, 0, 0);
  v43[17] = v9;
  id v10 = +[UIColor colorWithRed:0.9 green:0.9 blue:0.5 alpha:1.0];
  v44[17] = v10;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:18];

  CGColorSpaceRef v11 = [UIDynamicSystemColor alloc];
  long long v12 = NSStringFromSelector(*(SEL *)(a1 + 32));
  id v13 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v11, v12, v15);
  long long v14 = (void *)qword_1EB25E0C8;
  qword_1EB25E0C8 = (uint64_t)v13;
}

+ (id)_searchFieldDisabledBackgroundColor
{
  if (qword_1EB25E140 != -1) {
    dispatch_once(&qword_1EB25E140, &__block_literal_global_2001);
  }
  BOOL v2 = (void *)qword_1EB25E138;
  return v2;
}

void __62__UIColor__InProgressSPI___searchFieldDisabledBackgroundColor__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  long long v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"_searchFieldDisabledBackgroundColor"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  BOOL v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.06];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.14];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.12];
  v14[2] = v6;
  uint64_t v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  uint64_t v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.462745098 green:0.462745098 blue:0.501960784 alpha:0.2];
  v14[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGColorSpaceRef v11 = (void *)qword_1EB25E138;
  qword_1EB25E138 = (uint64_t)v10;
}

+ (id)_pageControlPlatterIndicatorColor
{
  if (qword_1EB25E160 != -1) {
    dispatch_once(&qword_1EB25E160, &__block_literal_global_2007);
  }
  BOOL v2 = (void *)qword_1EB25E158;
  return v2;
}

void __60__UIColor__InProgressSPI___pageControlPlatterIndicatorColor__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  long long v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"_pageControlPlatterIndicatorColor"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  BOOL v2 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.25];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.45];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.25];
  v14[2] = v6;
  uint64_t v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  uint64_t v8 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.45];
  v14[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGColorSpaceRef v11 = (void *)qword_1EB25E158;
  qword_1EB25E158 = (uint64_t)v10;
}

+ (id)_searchFieldPlaceholderTextClearButtonColor
{
  if (qword_1EB25E170 != -1) {
    dispatch_once(&qword_1EB25E170, &__block_literal_global_2010);
  }
  BOOL v2 = (void *)qword_1EB25E168;
  return v2;
}

void __70__UIColor__InProgressSPI___searchFieldPlaceholderTextClearButtonColor__block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_searchFieldPlaceholderTextClearButtonColor"];
  BOOL v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  uint64_t v7 = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.47 alpha:1.0];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v4);
  id v6 = (void *)qword_1EB25E168;
  qword_1EB25E168 = (uint64_t)v5;
}

+ (id)_searchBarBackgroundColor
{
  if (qword_1EB25E180 != -1) {
    dispatch_once(&qword_1EB25E180, &__block_literal_global_2013);
  }
  BOOL v2 = (void *)qword_1EB25E178;
  return v2;
}

void __52__UIColor__InProgressSPI___searchBarBackgroundColor__block_invoke()
{
  uint64_t v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"_searchBarBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeysystemGray3Color();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E178;
  qword_1EB25E178 = (uint64_t)v2;
}

+ (id)_controlHighlightColor
{
  if (qword_1EB25E1A0 != -1) {
    dispatch_once(&qword_1EB25E1A0, &__block_literal_global_2019);
  }
  id v2 = (void *)qword_1EB25E198;
  return v2;
}

void __49__UIColor__InProgressSPI___controlHighlightColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_controlHighlightColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.266666667 green:0.266666667 blue:0.274509804 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E198;
  qword_1EB25E198 = (uint64_t)v7;
}

+ (id)_controlVibrantTopBackgroundColor
{
  if (qword_1EB25E1C0 != -1) {
    dispatch_once(&qword_1EB25E1C0, &__block_literal_global_2025);
  }
  id v2 = (void *)qword_1EB25E1B8;
  return v2;
}

void __60__UIColor__InProgressSPI___controlVibrantTopBackgroundColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_controlVibrantTopBackgroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0274509804 blue:0.0980392157 alpha:0.05];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.980392157 green:0.97254902 blue:1.0 alpha:0.15];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E1B8;
  qword_1EB25E1B8 = (uint64_t)v7;
}

+ (id)_controlVibrantBottomBackgroundColor
{
  if (qword_1EB25E1D0 != -1) {
    dispatch_once(&qword_1EB25E1D0, &__block_literal_global_2028);
  }
  id v2 = (void *)qword_1EB25E1C8;
  return v2;
}

void __63__UIColor__InProgressSPI___controlVibrantBottomBackgroundColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_controlVibrantBottomBackgroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.0 green:0.0274509804 blue:0.0980392157 alpha:0.72];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.980392157 green:0.97254902 blue:1.0 alpha:0.05];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E1C8;
  qword_1EB25E1C8 = (uint64_t)v7;
}

+ (id)_swiftColor
{
  if (qword_1EB25E1E0 != -1) {
    dispatch_once(&qword_1EB25E1E0, &__block_literal_global_2031);
  }
  id v2 = (void *)qword_1EB25E1D8;
  return v2;
}

void __38__UIColor__InProgressSPI___swiftColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_swiftColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.992156863 green:0.407843137 blue:0.133333333 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:1.0 green:0.458823529 blue:0.203921569 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E1D8;
  qword_1EB25E1D8 = (uint64_t)v7;
}

+ (id)_fillColor
{
  return +[UIColor systemFillColor];
}

+ (id)_secondaryFillColor
{
  return +[UIColor secondarySystemFillColor];
}

+ (id)_tertiaryFillColor
{
  return +[UIColor tertiarySystemFillColor];
}

+ (id)_quaternaryFillColor
{
  return +[UIColor quaternarySystemFillColor];
}

+ (id)_systemGray2Color
{
  return +[UIColor systemGray2Color];
}

+ (id)_systemGray3Color
{
  return +[UIColor systemGray3Color];
}

+ (id)_systemGray4Color
{
  return +[UIColor systemGray4Color];
}

+ (id)_systemGray5Color
{
  return +[UIColor systemGray5Color];
}

+ (id)_systemGray6Color
{
  return +[UIColor systemGray6Color];
}

+ (id)_linkColor
{
  return +[UIColor linkColor];
}

+ (id)_placeholderTextColor
{
  return +[UIColor placeholderTextColor];
}

+ (id)_opaqueSeparatorColor
{
  return +[UIColor opaqueSeparatorColor];
}

+ (id)_secondarySystemBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)_contentBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

+ (id)_systemBackgroundSectionColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)_systemBackgroundSectionCellColor
{
  return +[UIColor tertiarySystemBackgroundColor];
}

+ (id)_systemGroupBackgroundColor
{
  return +[UIColor systemGroupedBackgroundColor];
}

+ (id)_systemGroupBackgroundCellColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor];
}

void __52__UIColor__InProgressSPI___textFieldBackgroundColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_textFieldBackgroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E208;
  qword_1EB25E208 = (uint64_t)v7;
}

+ (id)_textFieldDisabledBackgroundColor
{
  if (qword_1EB25E220 != -1) {
    dispatch_once(&qword_1EB25E220, &__block_literal_global_2043);
  }
  id v2 = (void *)qword_1EB25E218;
  return v2;
}

void __60__UIColor__InProgressSPI___textFieldDisabledBackgroundColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_textFieldDisabledBackgroundColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.980392157 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0196078431 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E218;
  qword_1EB25E218 = (uint64_t)v7;
}

+ (id)_textFieldDisabledBorderColor
{
  if (qword_1EB25E240 != -1) {
    dispatch_once(&qword_1EB25E240, &__block_literal_global_2049);
  }
  id v2 = (void *)qword_1EB25E238;
  return v2;
}

void __56__UIColor__InProgressSPI___textFieldDisabledBorderColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_textFieldDisabledBorderColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.17];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.17];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E238;
  qword_1EB25E238 = (uint64_t)v7;
}

+ (id)_splitViewBorderColor
{
  return +[UIColor opaqueSeparatorColor];
}

+ (id)_markedTextBackgroundColor
{
  return +[UIColor _secondaryFillColor];
}

+ (id)tableSelectionColor
{
  if (qword_1EB25E2C0 != -1) {
    dispatch_once(&qword_1EB25E2C0, &__block_literal_global_2073);
  }
  id v2 = (void *)qword_1EB25E2B8;
  return v2;
}

void __46__UIColor__InProgressSPI__tableSelectionColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.16 green:0.43 blue:0.83 alpha:1.0];
  uint64_t v1 = (void *)qword_1EB25E2B8;
  qword_1EB25E2B8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E2B8;
  id v3 = [NSString stringWithUTF8String:"tableSelectionColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellGroupedSelectedBackgroundColor
{
  return +[UIColor tableCellPlainSelectedBackgroundColor];
}

+ (id)tableCellHighlightedBackgroundColor
{
  if (qword_1EB25E2D0 != -1) {
    dispatch_once(&qword_1EB25E2D0, &__block_literal_global_2076);
  }
  id v2 = (void *)qword_1EB25E2C8;
  return v2;
}

void __62__UIColor__InProgressSPI__tableCellHighlightedBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.8];
  uint64_t v1 = (void *)qword_1EB25E2C8;
  qword_1EB25E2C8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E2C8;
  id v3 = [NSString stringWithUTF8String:"tableCellHighlightedBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellFocusedBackgroundColor
{
  if (qword_1EB25E2E0 != -1) {
    dispatch_once(&qword_1EB25E2E0, &__block_literal_global_2079);
  }
  id v2 = (void *)qword_1EB25E2D8;
  return v2;
}

void __58__UIColor__InProgressSPI__tableCellFocusedBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.9];
  uint64_t v1 = (void *)qword_1EB25E2D8;
  qword_1EB25E2D8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E2D8;
  id v3 = [NSString stringWithUTF8String:"tableCellFocusedBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tableCellDisabledBackgroundColor
{
  if (qword_1EB25E2F0 != -1) {
    dispatch_once(&qword_1EB25E2F0, &__block_literal_global_2082);
  }
  id v2 = (void *)qword_1EB25E2E8;
  return v2;
}

void __59__UIColor__InProgressSPI__tableCellDisabledBackgroundColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.5];
  uint64_t v1 = (void *)qword_1EB25E2E8;
  qword_1EB25E2E8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E2E8;
  id v3 = [NSString stringWithUTF8String:"tableCellDisabledBackgroundColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)tablePlainHeaderFooterBackgroundColor
{
  if (qword_1EB25E300 != -1) {
    dispatch_once(&qword_1EB25E300, &__block_literal_global_2085);
  }
  id v2 = (void *)qword_1EB25E2F8;
  return v2;
}

void __64__UIColor__InProgressSPI__tablePlainHeaderFooterBackgroundColor__block_invoke()
{
  uint64_t v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tablePlainHeaderFooterBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeytablePlainHeaderFooterBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E2F8;
  qword_1EB25E2F8 = (uint64_t)v2;
}

+ (id)tablePlainHeaderFooterFloatingBackgroundColor
{
  if (qword_1EB25E310 != -1) {
    dispatch_once(&qword_1EB25E310, &__block_literal_global_2088);
  }
  id v2 = (void *)qword_1EB25E308;
  return v2;
}

void __72__UIColor__InProgressSPI__tablePlainHeaderFooterFloatingBackgroundColor__block_invoke()
{
  uint64_t v0 = [UIDynamicSystemColor alloc];
  id v4 = [NSString stringWithUTF8String:"tablePlainHeaderFooterFloatingBackgroundColor"];
  uint64_t v1 = _colorsByThemeKeytablePlainHeaderFooterBackgroundColor();
  id v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  id v3 = (void *)qword_1EB25E308;
  qword_1EB25E308 = (uint64_t)v2;
}

+ (id)_plainTableHeaderFooterTextColor
{
  if (qword_1EB25E320 != -1) {
    dispatch_once(&qword_1EB25E320, &__block_literal_global_2091);
  }
  id v2 = (void *)qword_1EB25E318;
  return v2;
}

void __59__UIColor__InProgressSPI___plainTableHeaderFooterTextColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_plainTableHeaderFooterTextColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.137254902 green:0.137254902 blue:0.137254902 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.862745098 green:0.862745098 blue:0.862745098 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E318;
  qword_1EB25E318 = (uint64_t)v7;
}

+ (id)_groupTableHeaderFooterTextColor
{
  if (qword_1EB25E330 != -1) {
    dispatch_once(&qword_1EB25E330, &__block_literal_global_2094);
  }
  id v2 = (void *)qword_1EB25E328;
  return v2;
}

void __59__UIColor__InProgressSPI___groupTableHeaderFooterTextColor__block_invoke()
{
  v14[4] = *MEMORY[0x1E4F143B8];
  long long v12 = [UIDynamicSystemColor alloc];
  uint64_t v0 = [NSString stringWithUTF8String:"_groupTableHeaderFooterTextColor"];
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v13[0] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.42745098 green:0.42745098 blue:0.447058824 alpha:1.0];
  v14[0] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v13[1] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  v14[1] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v13[2] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.290196078 green:0.290196078 blue:0.301960784 alpha:1.0];
  v14[2] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v13[3] = v7;
  uint64_t v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.694117647 green:0.694117647 blue:0.721568627 alpha:1.0];
  v14[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  CGColorSpaceRef v11 = (void *)qword_1EB25E328;
  qword_1EB25E328 = (uint64_t)v10;
}

+ (id)_sidebarBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor];
}

+ (id)_swipedSidebarCellBackgroundColor
{
  if (qword_1EB25E340 != -1) {
    dispatch_once(&qword_1EB25E340, &__block_literal_global_2097);
  }
  id v2 = (void *)qword_1EB25E338;
  return v2;
}

void __60__UIColor__InProgressSPI___swipedSidebarCellBackgroundColor__block_invoke()
{
  v18[6] = *MEMORY[0x1E4F143B8];
  double v16 = [UIDynamicSystemColor alloc];
  long long v15 = [NSString stringWithUTF8String:"_swipedSidebarCellBackgroundColor"];
  long long v14 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v17[0] = v14;
  id v13 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.898039216 green:0.898039216 blue:0.917647059 alpha:1.0];
  v18[0] = v13;
  long long v12 = _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v17[1] = v12;
  uint64_t v0 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.847058824 green:0.847058824 blue:0.862745098 alpha:1.0];
  v18[1] = v0;
  uint64_t v1 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v17[2] = v1;
  id v2 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
  v18[2] = v2;
  id v3 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v17[3] = v3;
  id v4 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.211764706 green:0.211764706 blue:0.219607843 alpha:1.0];
  v18[3] = v4;
  id v5 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v17[4] = v5;
  id v6 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.22745098 green:0.22745098 blue:0.235294118 alpha:1.0];
  v18[4] = v6;
  id v7 = _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v17[5] = v7;
  uint64_t v8 = [(UIDeviceRGBColor *)[UICachedDeviceRGBColor alloc] initWithRed:0.266666667 green:0.266666667 blue:0.274509804 alpha:1.0];
  v18[5] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  id v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v16, v15, v9);
  CGColorSpaceRef v11 = (void *)qword_1EB25E338;
  qword_1EB25E338 = (uint64_t)v10;
}

+ (id)_carSystemPrimaryColor
{
  if (qword_1EB25E360 != -1) {
    dispatch_once(&qword_1EB25E360, &__block_literal_global_2103);
  }
  id v2 = (void *)qword_1EB25E358;
  return v2;
}

void __49__UIColor__InProgressSPI___carSystemPrimaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemPrimaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.75];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.75];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E358;
  qword_1EB25E358 = (uint64_t)v7;
}

+ (id)_carSystemSecondaryColor
{
  if (qword_1EB25E370 != -1) {
    dispatch_once(&qword_1EB25E370, &__block_literal_global_2106);
  }
  id v2 = (void *)qword_1EB25E368;
  return v2;
}

void __51__UIColor__InProgressSPI___carSystemSecondaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemSecondaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.55];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.55];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E368;
  qword_1EB25E368 = (uint64_t)v7;
}

+ (id)_carSystemTertiaryColor
{
  if (qword_1EB25E380 != -1) {
    dispatch_once(&qword_1EB25E380, &__block_literal_global_2109);
  }
  id v2 = (void *)qword_1EB25E378;
  return v2;
}

void __50__UIColor__InProgressSPI___carSystemTertiaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemTertiaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.3];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.3];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E378;
  qword_1EB25E378 = (uint64_t)v7;
}

+ (id)_carSystemQuaternaryColor
{
  if (qword_1EB25E390 != -1) {
    dispatch_once(&qword_1EB25E390, &__block_literal_global_2112);
  }
  id v2 = (void *)qword_1EB25E388;
  return v2;
}

void __52__UIColor__InProgressSPI___carSystemQuaternaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemQuaternaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.07];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.15];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E388;
  qword_1EB25E388 = (uint64_t)v7;
}

+ (id)_carSystemFocusLabelColor
{
  if (qword_1EB25E3B0 != -1) {
    dispatch_once(&qword_1EB25E3B0, &__block_literal_global_2118);
  }
  id v2 = (void *)qword_1EB25E3A8;
  return v2;
}

void __52__UIColor__InProgressSPI___carSystemFocusLabelColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemFocusLabelColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:1.0];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:1.0];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E3A8;
  qword_1EB25E3A8 = (uint64_t)v7;
}

+ (id)_carSystemFocusPrimaryColor
{
  if (qword_1EB25E3C0 != -1) {
    dispatch_once(&qword_1EB25E3C0, &__block_literal_global_2121);
  }
  id v2 = (void *)qword_1EB25E3B8;
  return v2;
}

void __54__UIColor__InProgressSPI___carSystemFocusPrimaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemFocusPrimaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.75];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.75];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E3B8;
  qword_1EB25E3B8 = (uint64_t)v7;
}

+ (id)_carSystemFocusSecondaryColor
{
  if (qword_1EB25E3D0 != -1) {
    dispatch_once(&qword_1EB25E3D0, &__block_literal_global_2124);
  }
  id v2 = (void *)qword_1EB25E3C8;
  return v2;
}

void __56__UIColor__InProgressSPI___carSystemFocusSecondaryColor__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [UIDynamicSystemColor alloc];
  uint64_t v1 = [NSString stringWithUTF8String:"_carSystemFocusSecondaryColor"];
  id v2 = _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v9[0] = v2;
  id v3 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.55];
  v10[0] = v3;
  id v4 = _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v9[1] = v4;
  id v5 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.55];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  uint64_t v8 = (void *)qword_1EB25E3C8;
  qword_1EB25E3C8 = (uint64_t)v7;
}

+ (id)_focusedCarSystemColor:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor _labelColor];

  if (v4 == v3)
  {
    id v7 = +[UIColor _carSystemFocusLabelColor];
  }
  else
  {
    id v5 = +[UIColor _carSystemPrimaryColor];

    if (v5 == v3)
    {
      id v7 = +[UIColor _carSystemFocusPrimaryColor];
    }
    else
    {
      id v6 = +[UIColor _carSystemSecondaryColor];

      if (v6 == v3)
      {
        id v7 = +[UIColor _carSystemFocusSecondaryColor];
      }
      else
      {
        id v7 = v3;
      }
    }
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)_unfocusedCarSystemColor:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor _carSystemFocusLabelColor];

  if (v4 == v3)
  {
    id v7 = +[UIColor _labelColor];
  }
  else
  {
    id v5 = +[UIColor _carSystemFocusPrimaryColor];

    if (v5 == v3)
    {
      id v7 = +[UIColor _carSystemPrimaryColor];
    }
    else
    {
      id v6 = +[UIColor _carSystemFocusSecondaryColor];

      if (v6 == v3)
      {
        id v7 = +[UIColor _carSystemSecondaryColor];
      }
      else
      {
        id v7 = v3;
      }
    }
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)_tvLabelOpacityAColor
{
  return +[UIColor labelColor];
}

+ (id)_tvLabelOpacityBColor
{
  return +[UIColor secondaryLabelColor];
}

+ (id)_tvLabelOpacityCColor
{
  return +[UIColor tertiaryLabelColor];
}

+ (id)_tvInterfaceStyleLightContentColor
{
  if (qword_1EB25E3E0 != -1) {
    dispatch_once(&qword_1EB25E3E0, &__block_literal_global_2127);
  }
  id v2 = (void *)qword_1EB25E3D8;
  return v2;
}

void __61__UIColor__InProgressSPI___tvInterfaceStyleLightContentColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:0.0 alpha:0.4];
  uint64_t v1 = (void *)qword_1EB25E3D8;
  qword_1EB25E3D8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E3D8;
  id v3 = [NSString stringWithUTF8String:"_tvInterfaceStyleLightContentColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_tvInterfaceStyleDarkContentColor
{
  if (qword_1EB25E3F0 != -1) {
    dispatch_once(&qword_1EB25E3F0, &__block_literal_global_2130);
  }
  id v2 = (void *)qword_1EB25E3E8;
  return v2;
}

void __60__UIColor__InProgressSPI___tvInterfaceStyleDarkContentColor__block_invoke()
{
  uint64_t v0 = [(UIDeviceWhiteColor *)[UICachedDeviceWhiteColor alloc] initWithWhite:1.0 alpha:0.3];
  uint64_t v1 = (void *)qword_1EB25E3E8;
  qword_1EB25E3E8 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25E3E8;
  id v3 = [NSString stringWithUTF8String:"_tvInterfaceStyleDarkContentColor"];
  [v2 _setSystemColorName:v3];
}

+ (id)_tvAppKeyColorOrDefaultTint
{
  if (dyld_program_sdk_at_least())
  {
    id v2 = +[UIColor _appKeyColor]();
    id v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = +[UIColor whiteColor];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = +[UIColor whiteColor];
  }
  return v5;
}

- (UIColor)colorWithProminence:(int64_t)a3
{
  if ([(UIColor *)self prominence] == a3)
  {
    id v5 = self;
  }
  else
  {
    id v6 = [UIDynamicProviderColor alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __50__UIColor_ProminenceSupport__colorWithProminence___block_invoke;
    v9[3] = &unk_1E52DA210;
    v9[4] = self;
    id v7 = [(UIDynamicProviderColor *)v6 initWithProvider:v9];
    id v5 = (UIColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], v7, (void *)0xFFFFFFFFFFFFFFFFLL, (void *)a3, 1.79769313e308);
  }
  return v5;
}

id __50__UIColor_ProminenceSupport__colorWithProminence___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)prominence
{
  return 0;
}

+ (id)candidateRowBackgroundColor
{
  return +[UIColor colorWithWhite:0.99 alpha:1.0];
}

+ (id)candidateRowHighlightedColor
{
  return +[UIColor colorWithWhite:0.991 alpha:1.0];
}

+ (id)lineSeparatorColor
{
  return +[UIColor colorWithWhite:0.9 alpha:1.0];
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.uikit.color";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v7 allowUndeclared:1];
  uint64_t v9 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.color" allowUndeclared:1];
  if ([v8 conformsToType:v9])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:0];
    CGColorSpaceRef v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v10 finishDecoding];
  }
  else
  {
    CGColorSpaceRef v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (UIColor)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UIColor *)self init];
  CGColorSpaceRef v11 = [(id)objc_opt_class() objectWithItemProviderData:v9 typeIdentifier:v8 error:a5];

  id v12 = v11;
  return v12;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.uikit.color";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  return +[UIColor writableTypeIdentifiersForItemProvider];
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  if ([a3 isEqualToString:@"com.apple.uikit.color"])
  {
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    v6[2](v6, v7, 0);
  }
  else
  {
    v6[2](v6, 0, 0);
  }

  return 0;
}

+ (id)_convertColorPickerColor:(id)a3 fromUserInterfaceStyle:(int64_t)a4 to:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (a5 && a4 && a4 != a5)
  {
    v17[0] = xmmword_186B9D4D0;
    v17[1] = unk_186B9D4E0;
    ConvertedToCGColorRef SRGB = DKUCGColorCreateConvertedToSRGB([v7 CGColor]);
    DKUColorGetRGBAComponents(ConvertedToSRGB, v17);
    long long v15 = xmmword_186B9D4D0;
    long long v16 = unk_186B9D4E0;
    long long v18 = xmmword_186B9D4D0;
    *(_OWORD *)double v19 = unk_186B9D4E0;
    DKUConvertsRGBToHSL((uint64_t)v17, (uint64_t)&v18);
    v19[0] = 1.0 - v19[0];
    DKUConvertHSLToSRGB((uint64_t)&v18, (uint64_t)&v15);
    CGColorRef SRGB = CGColorCreateSRGB(*(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
    CFAutorelease(SRGB);
    CGColorRelease(ConvertedToSRGB);
    Components = CGColorGetComponents(SRGB);
    id v12 = +[UIColor colorWithRed:*Components green:Components[1] blue:Components[2] alpha:Components[3]];
  }
  else
  {
    id v12 = v7;
  }
  id v13 = v12;

  return v13;
}

@end