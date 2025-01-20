@interface UITraitCollection
+ (BOOL)_isPlaceholderTraitToken:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSArray)_systemTraitTokensAffectingImageLookup;
+ (NSArray)systemTraitsAffectingColorAppearance;
+ (NSArray)systemTraitsAffectingImageLookup;
+ (UITraitCollection)currentTraitCollection;
+ (UITraitCollection)traitCollectionWithAccessibilityContrast:(UIAccessibilityContrast)accessibilityContrast;
+ (UITraitCollection)traitCollectionWithActiveAppearance:(UIUserInterfaceActiveAppearance)userInterfaceActiveAppearance;
+ (UITraitCollection)traitCollectionWithArtworkSubtype:(unint64_t)a3;
+ (UITraitCollection)traitCollectionWithCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait;
+ (UITraitCollection)traitCollectionWithDisplayCornerRadius:(double)a3;
+ (UITraitCollection)traitCollectionWithDisplayGamut:(UIDisplayGamut)displayGamut;
+ (UITraitCollection)traitCollectionWithDisplayScale:(CGFloat)scale;
+ (UITraitCollection)traitCollectionWithForceTouchCapability:(UIForceTouchCapability)capability;
+ (UITraitCollection)traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass;
+ (UITraitCollection)traitCollectionWithImageDynamicRange:(UIImageDynamicRange)imageDynamicRange;
+ (UITraitCollection)traitCollectionWithInteractionModel:(unint64_t)a3;
+ (UITraitCollection)traitCollectionWithLayoutDirection:(UITraitEnvironmentLayoutDirection)layoutDirection;
+ (UITraitCollection)traitCollectionWithLegibilityWeight:(UILegibilityWeight)legibilityWeight;
+ (UITraitCollection)traitCollectionWithListEnvironment:(int64_t)a3;
+ (UITraitCollection)traitCollectionWithNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait;
+ (UITraitCollection)traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4;
+ (UITraitCollection)traitCollectionWithObject:(id)object forTrait:(UIObjectTrait)trait;
+ (UITraitCollection)traitCollectionWithPreferredContentSizeCategory:(UIContentSizeCategory)preferredContentSizeCategory;
+ (UITraitCollection)traitCollectionWithPrimaryInteractionModel:(unint64_t)a3;
+ (UITraitCollection)traitCollectionWithSceneCaptureState:(UISceneCaptureState)sceneCaptureState;
+ (UITraitCollection)traitCollectionWithToolbarItemPresentationSize:(UINSToolbarItemPresentationSize)toolbarItemPresentationSize;
+ (UITraitCollection)traitCollectionWithTouchLevel:(int64_t)a3;
+ (UITraitCollection)traitCollectionWithTraits:(UITraitMutations)mutations;
+ (UITraitCollection)traitCollectionWithTraitsFromCollections:(NSArray *)traitCollections;
+ (UITraitCollection)traitCollectionWithTypesettingLanguage:(NSString *)language;
+ (UITraitCollection)traitCollectionWithUserInterfaceIdiom:(UIUserInterfaceIdiom)idiom;
+ (UITraitCollection)traitCollectionWithUserInterfaceLevel:(UIUserInterfaceLevel)userInterfaceLevel;
+ (UITraitCollection)traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle;
+ (UITraitCollection)traitCollectionWithVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass;
+ (char)_currentTraitCollectionIfExists;
+ (char)_currentTraitCollectionWithFallback:(int)a3 markFallback:;
+ (char)_currentTraitCollectionWithUnmarkedFallback;
+ (const)_traitTokenForCGFloatTrait:(uint64_t)a1;
+ (const)_traitTokenForNSIntegerTrait:(uint64_t)a1;
+ (const)_traitTokenForNSUIntegerTrait:(uint64_t)a1;
+ (const)_traitTokenForObjectTrait:(uint64_t)a1;
+ (const)_traitTokenOrPlaceholderForTrait:(uint64_t)a1;
+ (id)_backgroundThreadFallbackTraitCollection;
+ (id)_currentTraitCollection;
+ (id)_defineCGFloatTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(double)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9;
+ (id)_defineNSIntegerTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(int64_t)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9;
+ (id)_defineObjectTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(id)a5 equalityHandler:(id)a6 affectsColorAppearance:(BOOL)a7 defaultValueRepresentsUnspecified:(BOOL)a8 isPrivate:(BOOL)a9 placeholderToken:(id)a10;
+ (id)_descriptionForChangeFromTraitCollection:(id)a3 toTraitCollection:(id)a4;
+ (id)_existingTraitTokenReservingPlaceholderIfNecessaryWithName:(id)a3 identifier:(id)a4;
+ (id)_fallbackTraitCollection;
+ (id)_identifierForTrait:(Class)a3;
+ (id)_nameForTrait:(Class)a3;
+ (id)_traitCollectionForSidebarAppearance;
+ (id)_traitCollectionWithBackgroundLevel:(int64_t)a3;
+ (id)_traitCollectionWithBacklightLuminance:(int64_t)a3;
+ (id)_traitCollectionWithCGFloatValue:(double)a3 forTraitToken:(id)a4;
+ (id)_traitCollectionWithContrast:(int64_t)a3;
+ (id)_traitCollectionWithEnvironmentWrapper:(id)a3;
+ (id)_traitCollectionWithFocusSystemState:(int64_t)a3;
+ (id)_traitCollectionWithHeadroomSuppressionLimit:(double)a3;
+ (id)_traitCollectionWithHeadroomUsage:(int64_t)a3;
+ (id)_traitCollectionWithInterfaceProtectionState:(int64_t)a3;
+ (id)_traitCollectionWithNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4;
+ (id)_traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4;
+ (id)_traitCollectionWithObject:(id)a3 forTraitToken:(id)a4;
+ (id)_traitCollectionWithPresentationSemanticContext:(int64_t)a3;
+ (id)_traitCollectionWithSplitViewControllerContext:(int64_t)a3;
+ (id)_traitCollectionWithTypesettingLanguageAwareLineHeightRatio:(double)a3;
+ (id)_traitCollectionWithUserInterfaceActiveAppearance:(int64_t)a3;
+ (id)_traitCollectionWithUserInterfaceRenderingMode:(int64_t)a3;
+ (id)_traitCollectionWithValue:(id)a3 forTraitNamed:(id)a4;
+ (id)_traitCollectionWithValue:(uint64_t)a3 forTraitWithMetadata:;
+ (id)_traitCollectionWithVibrancy:(int64_t)a3;
+ (id)_traitTokensIncludingPlaceholdersForTraits:(uint64_t)a1;
+ (uint64_t)_defaultTraitCollection;
+ (uint64_t)_emptyTraitCollection;
+ (uint64_t)_nameForTraitToken:(uint64_t)a1;
+ (uint64_t)_performWithCurrentTraitCollection:(uint64_t)a3 usingBlock:;
+ (uint64_t)_traitCollectionWithTintColor:(uint64_t)a1;
+ (void)_setBackgroundThreadFallbackTraitCollection:(uint64_t)a1;
+ (void)_systemTraitTokensAffectingImageLookupSet;
+ (void)initialize;
+ (void)setCurrentTraitCollection:(UITraitCollection *)currentTraitCollection;
- (BOOL)_containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1;
- (BOOL)_hasSplitViewControllerContextPrimaryColumn;
- (BOOL)_hasSplitViewControllerContextSidebarColumn;
- (BOOL)_isEqualToTraitCollectionForResolvingImage:(uint64_t)a1;
- (BOOL)_isLargeContentViewerEnabled;
- (BOOL)_isTraitSpecified:(Class)a3;
- (BOOL)_isTraitTokenSpecified:(id)a3;
- (BOOL)containsTraitsInCollection:(UITraitCollection *)trait;
- (BOOL)hasDifferentColorAppearanceComparedToTraitCollection:(UITraitCollection *)traitCollection;
- (BOOL)isEqual:(id)a3;
- (CGFloat)displayScale;
- (CGFloat)valueForCGFloatTrait:(UICGFloatTrait)trait;
- (NSArray)_specifiedTraitTokensArray;
- (NSInteger)valueForNSIntegerTrait:(UINSIntegerTrait)trait;
- (NSObject)_environmentWrapper;
- (NSSet)_specifiedTraits;
- (NSSet)changedTraitsFromTraitCollection:(UITraitCollection *)traitCollection;
- (NSString)description;
- (NSString)typesettingLanguage;
- (UIAccessibilityContrast)accessibilityContrast;
- (UIColor)_tintColor;
- (UIContentSizeCategory)preferredContentSizeCategory;
- (UIDisplayGamut)displayGamut;
- (UIForceTouchCapability)forceTouchCapability;
- (UIImageConfiguration)imageConfiguration;
- (UIImageDynamicRange)imageDynamicRange;
- (UILegibilityWeight)legibilityWeight;
- (UINSToolbarItemPresentationSize)toolbarItemPresentationSize;
- (UISceneCaptureState)sceneCaptureState;
- (UITraitCollection)init;
- (UITraitCollection)initWithCoder:(NSCoder *)coder;
- (UITraitCollection)traitCollectionByModifyingTraits:(UITraitMutations)mutations;
- (UITraitCollection)traitCollectionByReplacingCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait;
- (UITraitCollection)traitCollectionByReplacingNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait;
- (UITraitCollection)traitCollectionByReplacingObject:(id)object forTrait:(UIObjectTrait)trait;
- (UITraitEnvironmentLayoutDirection)layoutDirection;
- (UIUserInterfaceActiveAppearance)activeAppearance;
- (UIUserInterfaceIdiom)userInterfaceIdiom;
- (UIUserInterfaceLevel)userInterfaceLevel;
- (UIUserInterfaceSizeClass)horizontalSizeClass;
- (UIUserInterfaceSizeClass)verticalSizeClass;
- (UIUserInterfaceStyle)userInterfaceStyle;
- (__CFString)_appearanceName;
- (__CFString)_styleEffectAppearanceName;
- (__CFString)_valueForBuiltInTraitWithMetadata:(void *)a1;
- (__CFString)_valueForTraitWithMetadata:(unint64_t)a1;
- (char)_initWithBuiltinTraitStorage:(void *)a3 tintColor:(void *)a4 clientDefinedTraits:(void *)a5 environmentWrapper:;
- (char)_initWithTraitMutations:(char *)a1;
- (char)_traitCollectionByFilteringTraitTokenSet:(char *)result;
- (char)_traitCollectionByReplacingTintColor:(char *)result;
- (char)_traitCollectionRelevantForImageConfiguration;
- (double)_headroomSuppressionLimit;
- (double)_typesettingLanguageAwareLineHeightRatio;
- (double)_valueForCGFloatTraitToken:(id)a3;
- (double)displayCornerRadius;
- (id)_changedTraitTokensArrayFromTraitCollection:(id)a3;
- (id)_description;
- (id)_descriptionForChangeFromTraitCollection:(id)a3;
- (id)_descriptionForChangeToTraitCollection:(id)a3;
- (id)_namedImageDescription;
- (id)_objectForTraitToken:(id)a3;
- (id)_traitCollectionByFilteringTraitTokens:(id)a3;
- (id)_traitCollectionByModifyingTraitsCopyOnWrite:(void *)a1;
- (id)_traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:(id)result;
- (id)_traitCollectionByRemovingEnvironmentWrapper;
- (id)_traitCollectionByRemovingTrait:(Class)a3;
- (id)_traitCollectionByRemovingTraitToken:(id)a3;
- (id)_traitCollectionByReplacingCGFloatValue:(double)a3 forTraitToken:(id)a4;
- (id)_traitCollectionByReplacingNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4;
- (id)_traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4;
- (id)_traitCollectionByReplacingObject:(id)a3 forTraitToken:(id)a4;
- (id)_traitCollectionByReplacingValue:(long long *)a3 forTraitWithMetadata:;
- (id)_traitCollectionWithIncrementedBackgroundLevel;
- (id)_traitsDescription;
- (id)_traitsDescriptionMatching:(id)a3;
- (id)_valueForTraitNamed:(id)a3;
- (id)objectForTrait:(UIObjectTrait)trait;
- (id)traitCollectionByFilteringTraits:(id)a3;
- (id)traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4;
- (int64_t)_backlightLuminance;
- (int64_t)_compare:(id)a3;
- (int64_t)_focusSystemState;
- (int64_t)_headroomUsage;
- (int64_t)_interfaceProtectionState;
- (int64_t)_presentationSemanticContext;
- (int64_t)_splitViewControllerContext;
- (int64_t)_updateFidelity;
- (int64_t)_userInterfaceRenderingMode;
- (int64_t)_valueForNSIntegerTraitToken:(id)a3;
- (int64_t)_vibrancy;
- (int64_t)listEnvironment;
- (int64_t)touchLevel;
- (uint64_t)_createTraitTokenSetForChangesFromTraitCollection:(uint64_t)a3@<X8>;
- (uint64_t)_descriptionWithPrivateTraits:(uint64_t)result;
- (uint64_t)_matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1;
- (uint64_t)_specifiedTraitTokens;
- (uint64_t)_specifiedTraitTokensLocked;
- (uint64_t)_traitsDescriptionMatching:(BOOL)a3 includePrivateTraits:;
- (unint64_t)_selectionIsKey;
- (unint64_t)_semanticContext;
- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3;
- (unint64_t)artworkSubtype;
- (unint64_t)hash;
- (unint64_t)interactionModel;
- (unint64_t)primaryInteractionModel;
- (unint64_t)valueForNSUIntegerTrait:(Class)a3;
- (void)_computeSpecifiedTraitTokensAcquireLock:(uint64_t)a3@<X8>;
- (void)_enumerateThemeAppearanceNamesForLookup:(void *)result;
- (void)_enumerateThemeKeysForLookup:(void *)result;
- (void)_fallbackTraitCollection;
- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4;
- (void)_setEnvironmentWrapper:(id)a3;
- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4;
- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4;
- (void)_setObject:(id)a3 forTraitToken:(id)a4;
- (void)_setTintColor:(id)a3;
- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3;
- (void)_setValue:(uint64_t)a3 forTraitWithMetadata:(int8x16_t)a4;
- (void)_themeKey;
- (void)_traitCollectionByApplyingOverrides:(uint64_t)a3 defaultValueOverrides:;
- (void)_traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)performAsCurrentTraitCollection:(void *)actions;
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

@implementation UITraitCollection

- (CGFloat)displayScale
{
  return self->_builtinTraits.displayScale;
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2))
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v14);
    uint64_t v5 = *((void *)&v14 + 1);
    unint64_t v6 = *(void *)(a1 + 32);
    if (*((void *)&v14 + 1))
    {
      long long v10 = v14;
      long long v11 = v15;
      long long v12 = v16;
      uint64_t v13 = v17;
      v7 = -[UITraitCollection _valueForTraitWithMetadata:](v6, (uint64_t)&v10);
      unint64_t v8 = *(void *)(a1 + 40);
      long long v10 = v14;
      long long v11 = v15;
      long long v12 = v16;
      uint64_t v13 = v17;
      if (v7 == -[UITraitCollection _valueForTraitWithMetadata:](v8, (uint64_t)&v10)
        || v5 == 1 && (void)v16 && ((*(uint64_t (**)(void))(v16 + 16))() & 1) != 0)
      {
        return;
      }
    }
    else if (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 224), "objectForKey:", *((void *)&v15 + 1)), "isEqual:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 224), "objectForKey:", *((void *)&v15 + 1))))
    {
      return;
    }
  }
  v9 = *(uint64_t **)(a1 + 56);
  _UITraitTokenSetInsert(v9, a2, v4);
}

- (__CFString)_valueForTraitWithMetadata:(unint64_t)a1
{
  if (!a1) {
    return 0;
  }
  _UIRecordTraitUsage(a1, *(void *)a2);
  if (*(void *)a2 > 0x1AuLL)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    uint64_t v6 = *(void *)(a2 + 16);
    uint64_t v8 = *(void *)(a2 + 24);
    uint64_t v5 = *(void **)(a2 + 40);
    char v9 = *(unsigned char *)(a2 + 48);
    CFNumberRef v10 = (const __CFNumber *)[*(id *)(a1 + 224) objectForKey:v8];
    if (v10)
    {
      CFNumberRef v11 = v10;
      switch(v7)
      {
        case 1:
          if (v10 == (const __CFNumber *)[MEMORY[0x1E4F1CA98] null]) {
            return 0;
          }
          else {
            return (__CFString *)v11;
          }
        case 2:
          *(void *)&valuePtr[0] = 0;
          CFNumberType v12 = kCFNumberCGFloatType;
          goto LABEL_14;
        case 3:
        case 4:
          *(void *)&valuePtr[0] = 0;
          CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_14:
          CFNumberGetValue(v10, v12, valuePtr);
          uint64_t v5 = *(void **)&valuePtr[0];
          break;
        default:
          return 0;
      }
    }
    else if (v9)
    {
      switch(v7)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          uint64_t v5 = (void *)*v5;
          break;
        default:
          uint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v6 file lineNumber description];
          return 0;
      }
    }
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 16);
    valuePtr[0] = *(_OWORD *)a2;
    valuePtr[1] = v4;
    valuePtr[2] = *(_OWORD *)(a2 + 32);
    uint64_t v16 = *(void *)(a2 + 48);
    return -[UITraitCollection _valueForBuiltInTraitWithMetadata:]((void *)a1, valuePtr);
  }
  return (__CFString *)v5;
}

- (__CFString)_valueForBuiltInTraitWithMetadata:(void *)a1
{
  switch(*a2)
  {
    case 0:
      result = (__CFString *)a1[1];
      break;
    case 1:
      result = (__CFString *)a1[10];
      break;
    case 2:
      result = (__CFString *)a1[11];
      break;
    case 3:
      result = (__CFString *)a1[2];
      break;
    case 4:
      result = (__CFString *)a1[8];
      break;
    case 5:
      result = (__CFString *)a1[9];
      break;
    case 6:
      result = (__CFString *)a1[12];
      break;
    case 7:
      result = _NSStringFromUIContentSizeCategory(a1[13]);
      break;
    case 8:
      result = (__CFString *)a1[3];
      break;
    case 9:
      result = (__CFString *)a1[19];
      break;
    case 0xALL:
      result = (__CFString *)a1[20];
      break;
    case 0xBLL:
      result = (__CFString *)a1[15];
      break;
    case 0xCLL:
      result = (__CFString *)a1[23];
      break;
    case 0xDLL:
      result = (__CFString *)a1[27];
      break;
    case 0xELL:
      result = (__CFString *)a1[4];
      break;
    case 0xFLL:
      result = (__CFString *)a1[5];
      break;
    case 0x10:
      result = (__CFString *)a1[6];
      break;
    case 0x11:
      result = (__CFString *)a1[7];
      break;
    case 0x12:
      result = (__CFString *)a1[14];
      break;
    case 0x13:
      result = (__CFString *)a1[16];
      break;
    case 0x14:
      result = (__CFString *)a1[17];
      break;
    case 0x15:
      result = (__CFString *)a1[18];
      break;
    case 0x16:
      result = (__CFString *)a1[21];
      break;
    case 0x17:
      result = (__CFString *)a1[22];
      break;
    case 0x18:
      result = (__CFString *)a1[24];
      break;
    case 0x19:
      result = (__CFString *)a1[25];
      break;
    case 0x1ALL:
      result = (__CFString *)a1[26];
      break;
    default:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__valueForBuiltInTraitWithMetadata_, a1, @"UITraitCollection_NonARC.m", 789, @"Invalid built in trait value: %lu", *a2);
      result = 0;
      break;
  }
  return result;
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_3(uint64_t a1, unint64_t a2)
{
  if ((_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 32), a2) & 1) == 0)
  {
    uint64_t v5 = *(uint64_t **)(a1 + 40);
    _UITraitTokenSetInsert(v5, a2, v4);
  }
}

void __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  int8x16_t v13 = 0u;
  long long v11 = 0u;
  _UIGetTraitMetadata((CFNumberRef)[NSNumber numberWithUnsignedInteger:a2], 0, (uint64_t)&v11);
  if (*((void *)&v11 + 1) && (v14 & 2) != 0 && (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2) & 1) == 0)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    long long v7 = v11;
    long long v8 = v12;
    int8x16_t v9 = v13;
    uint64_t v10 = v14;
    uint64_t v5 = -[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)&v7);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    long long v7 = v11;
    long long v8 = v12;
    int8x16_t v9 = v13;
    uint64_t v10 = v14;
    [(UITraitCollection *)v6 _setValue:(uint64_t)&v7 forTraitWithMetadata:v13];
  }
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 48), a2))
  {
    uint64_t v12 = 0;
    long long v10 = 0u;
    int8x16_t v11 = 0u;
    long long v9 = 0u;
    _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v9);
    if (*((void *)&v9 + 1))
    {
      unint64_t v4 = *(void *)(a1 + 32);
      *(_OWORD *)buf = v9;
      long long v14 = v10;
      int8x16_t v15 = v11;
      uint64_t v16 = v12;
      uint64_t v5 = -[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)buf);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_OWORD *)buf = v9;
      long long v14 = v10;
      int8x16_t v15 = v11;
      uint64_t v16 = v12;
      [(UITraitCollection *)v6 _setValue:(uint64_t)buf forTraitWithMetadata:v11];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      long long v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v10;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Filtering placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
    else
    {
      long long v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_3) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Filtering placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
  }
}

- (void)_setValue:(uint64_t)a3 forTraitWithMetadata:(int8x16_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if ((*(unsigned char *)(a1 + 288) & 2) != 0)
  {
    unint64_t v9 = *(void *)a3;
    if (!v5 & v4)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setValue_forBuiltInTraitWithMetadata_, a1, @"UITraitCollection_NonARC.m", 902, @"Invalid built in trait value: %lu", v9);
      goto LABEL_32;
    }
    switch(v9)
    {
      case 0uLL:
        *(void *)(a1 + 8) = a2;
        goto LABEL_32;
      case 1uLL:
        *(void *)(a1 + 80) = a2;
        goto LABEL_32;
      case 2uLL:
        *(void *)(a1 + 88) = a2;
        goto LABEL_32;
      case 3uLL:
        *(void *)(a1 + 16) = a2;
        goto LABEL_32;
      case 4uLL:
        *(void *)(a1 + 64) = a2;
        goto LABEL_32;
      case 5uLL:
        *(void *)(a1 + 72) = a2;
        goto LABEL_32;
      case 6uLL:
        *(void *)(a1 + 96) = a2;
        goto LABEL_32;
      case 7uLL:
        buf[0] = 0;
        *(void *)(a1 + 104) = _UIContentSizeCategoryFromStringInternal(a2, buf);
        goto LABEL_32;
      case 8uLL:
        *(void *)(a1 + 24) = a2;
        goto LABEL_32;
      case 9uLL:
        *(void *)(a1 + 152) = a2;
        goto LABEL_32;
      case 0xAuLL:
        *(void *)(a1 + 160) = a2;
        goto LABEL_32;
      case 0xBuLL:
        *(void *)(a1 + 120) = a2;
        goto LABEL_32;
      case 0xCuLL:
        *(void *)(a1 + 184) = a2;
        goto LABEL_32;
      case 0xDuLL:
        *(void *)(a1 + 216) = a2;
        goto LABEL_32;
      case 0xEuLL:
        *(void *)(a1 + 32) = a2;
        goto LABEL_32;
      case 0xFuLL:
        *(void *)(a1 + 40) = a2;
        goto LABEL_32;
      case 0x10uLL:
        *(void *)(a1 + 48) = a2;
        goto LABEL_32;
      case 0x11uLL:
        *(void *)(a1 + 56) = a2;
        goto LABEL_32;
      case 0x12uLL:
        *(void *)(a1 + 112) = a2;
        goto LABEL_32;
      case 0x13uLL:
        *(void *)(a1 + 128) = a2;
        goto LABEL_32;
      case 0x14uLL:
        *(void *)(a1 + 136) = a2;
        goto LABEL_32;
      case 0x15uLL:
        *(void *)(a1 + 144) = a2;
        goto LABEL_32;
      case 0x16uLL:
        *(void *)(a1 + 168) = a2;
        goto LABEL_32;
      case 0x17uLL:
        *(void *)(a1 + 176) = a2;
        goto LABEL_32;
      case 0x18uLL:
        *(void *)(a1 + 192) = a2;
        goto LABEL_32;
      case 0x19uLL:
        *(void *)(a1 + 200) = a2;
        goto LABEL_32;
      case 0x1AuLL:
        *(void *)(a1 + 208) = a2;
        goto LABEL_32;
      default:
        uint64_t v10 = *(void *)(a3 + 8);
        uint64_t v11 = *(void *)(a3 + 16);
        uint64_t v12 = *(void *)(a3 + 24);
        uint64_t v13 = *(void *)(a3 + 32);
        long long v14 = *(void **)(a3 + 40);
        char v15 = *(unsigned char *)(a3 + 48);
        id v16 = *(id *)(a1 + 224);
        if (v16)
        {
          if ((*(unsigned char *)(a3 + 48) & 1) == 0)
          {
LABEL_14:
            if (v14 == a2)
            {
LABEL_15:
              [v16 removeObjectForKey:v12];
            }
            else
            {
              switch(v10)
              {
                case 1:
                  goto LABEL_19;
                case 2:
                  uint64_t v18 = [NSNumber numberWithDouble:*(double *)&a2];
                  goto LABEL_30;
                case 3:
                  uint64_t v18 = [NSNumber numberWithInteger:a2];
                  goto LABEL_30;
                case 4:
                  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a2];
                  goto LABEL_30;
                default:
                  goto LABEL_32;
              }
            }
            goto LABEL_32;
          }
        }
        else
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          *(void *)(a1 + 224) = v16;
          if ((v15 & 1) == 0) {
            goto LABEL_14;
          }
        }
        switch(v10)
        {
          case 1:
            long long v14 = (void *)*v14;
            if (v14 == a2) {
              goto LABEL_15;
            }
LABEL_19:
            if (v13)
            {
              if ((*(uint64_t (**)(uint64_t, void *, void *))(v13 + 16))(v13, a2, v14)) {
                goto LABEL_15;
              }
            }
            else if (a2 && v14)
            {
              int v19 = [a2 isEqual:v14];
              v20 = a2;
              if (v19) {
                goto LABEL_15;
              }
LABEL_31:
              [v16 setObject:v20 forKey:v12];
LABEL_32:
              uint64_t v21 = *(void *)(a3 + 8);
              uint64_t v23 = *(void *)(a3 + 32);
              v22 = *(void **)(a3 + 40);
              if (*(unsigned char *)(a3 + 48))
              {
                switch(v21)
                {
                  case 1:
                    v22 = (void *)*v22;
                    if (v22 != a2) {
                      goto LABEL_42;
                    }
                    goto LABEL_37;
                  case 2:
                  case 3:
                  case 4:
                    v22 = (void *)*v22;
                    break;
                  default:
                    uint64_t v24 = *(void *)(a3 + 16);
                    v25 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v22);
                    [v25 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v24 file lineNumber description];
                    v22 = 0;
                    break;
                }
              }
              if (v22 == a2)
              {
LABEL_37:
                unint64_t v26 = *(void *)a3;
                v27 = (uint16x8_t **)(a1 + 248);
LABEL_38:
                _UITraitTokenSetRemove(v27, v26, a4);
                return;
              }
              if (v21 == 1)
              {
LABEL_42:
                if (v23)
                {
                  char v28 = (*(uint64_t (**)(uint64_t, void *))(v23 + 16))(v23, a2);
                  goto LABEL_47;
                }
                if (a2 && v22)
                {
                  char v28 = objc_msgSend(a2, "isEqual:");
LABEL_47:
                  char v29 = v28;
                  unint64_t v26 = *(void *)a3;
                  v27 = (uint16x8_t **)(a1 + 248);
                  if (v29) {
                    goto LABEL_38;
                  }
LABEL_50:
                  _UITraitTokenSetInsert((uint64_t *)v27, v26, (__n128)a4);
                  return;
                }
              }
              unint64_t v26 = *(void *)a3;
              v27 = (uint16x8_t **)(a1 + 248);
              goto LABEL_50;
            }
            v20 = a2;
            if (!a2)
            {
              uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
LABEL_30:
              v20 = (void *)v18;
            }
            goto LABEL_31;
          case 2:
          case 3:
          case 4:
            long long v14 = (void *)*v14;
            goto LABEL_14;
          default:
            uint64_t v17 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
            [v17 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v11 file lineNumber description];
            long long v14 = 0;
            goto LABEL_14;
        }
    }
  }
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__setValue_forTraitWithMetadata_, a1, @"UITraitCollection_NonARC.m", 978, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(sel__setValue_forTraitWithMetadata_));
  }
  else
  {
    v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setValue_forTraitWithMetadata____s_category) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = NSStringFromSelector(sel__setValue_forTraitWithMetadata_);
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

void __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  int8x16_t v13 = 0u;
  long long v11 = 0u;
  _UIGetTraitMetadata((CFNumberRef)[NSNumber numberWithUnsignedInteger:a2], 0, (uint64_t)&v11);
  unint64_t v3 = a1[4];
  long long v7 = v11;
  long long v8 = v12;
  int8x16_t v9 = v13;
  uint64_t v10 = v14;
  char v4 = -[UITraitCollection _valueForTraitWithMetadata:](v3, (uint64_t)&v7);
  unint64_t v5 = a1[5];
  long long v7 = v11;
  long long v8 = v12;
  int8x16_t v9 = v13;
  uint64_t v10 = v14;
  if (v4 != -[UITraitCollection _valueForTraitWithMetadata:](v5, (uint64_t)&v7))
  {
    uint64_t v6 = (*(uint64_t (**)(void))(a1[6] + 16))();
    long long v7 = v11;
    long long v8 = v12;
    int8x16_t v9 = v13;
    uint64_t v10 = v14;
    [(UITraitCollection *)v6 _setValue:(uint64_t)&v7 forTraitWithMetadata:v13];
  }
}

+ (BOOL)_isPlaceholderTraitToken:(id)a3
{
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)v4);
  return *((void *)&v4[0] + 1) == 0;
}

uint64_t __54__UITraitCollection_changedTraitsFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

void __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_4(uint64_t a1, unint64_t a2)
{
  if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 40), a2))
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    int8x16_t v12 = 0u;
    long long v10 = 0u;
    _UIGetTraitMetadata((CFNumberRef)[NSNumber numberWithUnsignedInteger:a2], 0, (uint64_t)&v10);
    char v4 = (void *)v12.i64[1];
    if (v13)
    {
      switch(*((void *)&v10 + 1))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          char v4 = *(void **)v12.i64[1];
          break;
        default:
          uint64_t v5 = v11;
          uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v6 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v5 file lineNumber description];
          char v4 = 0;
          break;
      }
    }
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    v8[0] = v10;
    v8[1] = v11;
    v8[2] = v12;
    uint64_t v9 = v13;
    [(UITraitCollection *)v7 _setValue:(uint64_t)v8 forTraitWithMetadata:v12];
  }
}

void __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_4(void *a1, unint64_t a2)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  int8x16_t v19 = 0u;
  long long v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  if (*((void *)&v17 + 1))
  {
    if ((v20 & 2) != 0)
    {
      unint64_t v4 = a1[5];
      if ((void)v17 == 15)
      {
        long long v13 = v17;
        long long v14 = v18;
        int8x16_t v15 = v19;
        uint64_t v16 = v20;
        uint64_t v5 = -[UITraitCollection _valueForTraitWithMetadata:](v4, (uint64_t)&v13);
        unint64_t v6 = a1[4];
        long long v13 = v17;
        long long v14 = v18;
        int8x16_t v15 = v19;
        uint64_t v16 = v20;
        uint64_t v7 = -[UITraitCollection _valueForTraitWithMetadata:](v6, (uint64_t)&v13);
        uint64_t v8 = a1[5];
        uint64_t v9 = (__CFString *)((unint64_t)v7 | (unint64_t)v5);
        long long v13 = v17;
        long long v14 = v18;
        int8x16_t v10 = v19;
        int8x16_t v15 = v19;
        uint64_t v16 = v20;
        uint64_t v11 = v8;
LABEL_9:
        [(UITraitCollection *)v11 _setValue:(uint64_t)&v13 forTraitWithMetadata:v10];
        return;
      }
      if (_UITraitTokenSetContains((uint16x8_t **)(v4 + 248), a2)) {
        return;
      }
    }
    else if (a1[6])
    {
      return;
    }
    unint64_t v12 = a1[4];
    long long v13 = v17;
    long long v14 = v18;
    int8x16_t v15 = v19;
    uint64_t v16 = v20;
    uint64_t v9 = -[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13);
    uint64_t v11 = a1[5];
    long long v13 = v17;
    long long v14 = v18;
    int8x16_t v10 = v19;
    int8x16_t v15 = v19;
    uint64_t v16 = v20;
    goto LABEL_9;
  }
}

uint64_t __65__UITraitCollection__changedTraitTokensArrayFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

uint64_t __59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

void __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  uint64_t v6 = *((void *)&v17 + 1);
  if (*((void *)&v17 + 1) && (v20 & 2) != 0)
  {
    if ((void)v17 == 15)
    {
      unint64_t v7 = *(void *)(a1 + 32);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      uint64_t v8 = -[UITraitCollection _valueForTraitWithMetadata:](v7, (uint64_t)&v13);
      unint64_t v9 = *(void *)(a1 + 40);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      if (((unint64_t)v8 & ~(unint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v9, (uint64_t)&v13)) != 0)
      {
LABEL_5:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
    }
    else if (_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 56), a2))
    {
      unint64_t v10 = *(void *)(a1 + 32);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      uint64_t v11 = -[UITraitCollection _valueForTraitWithMetadata:](v10, (uint64_t)&v13);
      unint64_t v12 = *(void *)(a1 + 40);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      if (v11 != -[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13)
        && (v6 != 1 || !(void)v19 || ((*(uint64_t (**)(void))(v19 + 16))() & 1) == 0))
      {
        goto LABEL_5;
      }
    }
  }
}

void __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  _UIGetTraitMetadataWithTraitTokenValueAcquireLock(0, a2, 0, (uint64_t)&v17);
  uint64_t v6 = *((void *)&v17 + 1);
  if (*((void *)&v17 + 1) && (v20 & 2) != 0)
  {
    if ((void)v17 == 15)
    {
      unint64_t v7 = *(void *)(a1 + 32);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      uint64_t v8 = -[UITraitCollection _valueForTraitWithMetadata:](v7, (uint64_t)&v13);
      unint64_t v9 = *(void *)(a1 + 40);
      long long v13 = v17;
      long long v14 = v18;
      long long v15 = v19;
      uint64_t v16 = v20;
      if (((unint64_t)v8 & ~(unint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v9, (uint64_t)&v13)) == 0)return; {
LABEL_11:
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *a3 = 1;
      return;
    }
    if (!_UITraitTokenSetContains(*(uint16x8_t ***)(a1 + 56), a2)) {
      goto LABEL_11;
    }
    unint64_t v10 = *(void *)(a1 + 32);
    long long v13 = v17;
    long long v14 = v18;
    long long v15 = v19;
    uint64_t v16 = v20;
    uint64_t v11 = -[UITraitCollection _valueForTraitWithMetadata:](v10, (uint64_t)&v13);
    unint64_t v12 = *(void *)(a1 + 40);
    long long v13 = v17;
    long long v14 = v18;
    long long v15 = v19;
    uint64_t v16 = v20;
    if (v11 != -[UITraitCollection _valueForTraitWithMetadata:](v12, (uint64_t)&v13)
      && (v6 != 1 || !(void)v19 || ((*(uint64_t (**)(void))(v19 + 16))() & 1) == 0))
    {
      goto LABEL_11;
    }
  }
}

- (id)_traitCollectionByModifyingTraitsCopyOnWrite:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    if (!a2) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__traitCollectionByModifyingTraitsCopyOnWrite_, a1, @"UITraitCollection_NonARC.m", 1249, @"Invalid parameter not satisfying: %@", @"mutations != NULL");
    }
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000;
    long long v13 = __Block_byref_object_copy__117;
    long long v14 = __Block_byref_object_dispose__117;
    uint64_t v15 = 0;
    v8[5] = &v10;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke;
    v9[3] = &unk_1E52F27A8;
    v9[4] = v2;
    v9[5] = &v10;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke_2;
    _OWORD v8[3] = &unk_1E52F27A8;
    v8[4] = v2;
    (*(void (**)(uint64_t, void *, void *))(a2 + 16))(a2, v9, v8);
    unint64_t v4 = v11;
    uint64_t v5 = v11[5];
    if (v5)
    {
      *(unsigned char *)(v5 + 288) &= ~2u;
      id v6 = (id)v4[5];
    }
    else
    {
      id v6 = v2;
      v11[5] = (uint64_t)v6;
    }
    id v2 = v6;
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

- (UIColor)_tintColor
{
  id v2 = self->_tintColor;
  return v2;
}

void __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a1 + 32;
  unint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(__CFString **)(v7 + 8);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v13 = v8;
  int8x16_t v14 = *(int8x16_t *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 96);
  if (v6 != -[UITraitCollection _valueForTraitWithMetadata:](v5, (uint64_t)&v12))
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    uint64_t v10 = *(void **)(a1 + 40);
    long long v11 = *(_OWORD *)(a1 + 64);
    long long v12 = *(_OWORD *)(a1 + 48);
    long long v13 = v11;
    int8x16_t v14 = *(int8x16_t *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 96);
    [(UITraitCollection *)v9 _setValue:(uint64_t)&v12 forTraitWithMetadata:v14];
  }
}

+ (id)_fallbackTraitCollection
{
  self;
  if (pthread_main_np() == 1)
  {
    return (id)_UIGetCurrentFallbackTraitCollection();
  }
  else
  {
    return +[UITraitCollection _backgroundThreadFallbackTraitCollection]();
  }
}

uint64_t __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], *(void *)(a1 + 32) + 8, *(void **)(*(void *)(a1 + 32) + 240), 0, *(void **)(*(void *)(a1 + 32) + 232));
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      _UITraitCollectionWasCopied(*(void *)(a1 + 32), v3);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 224) = [*(id *)(*(void *)(a1 + 32)+ 224) mutableCopy];
      unint64_t v4 = *(void **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 248);
      if (v4) {

      }
      uint64_t v5 = -[UITraitCollection _specifiedTraitTokens](*(void *)(a1 + 32));
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(void *)(v6 + 248) = [*(id *)v5 mutableCopy];
      long long v7 = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(v6 + 256) = *(_OWORD *)(v5 + 8);
      *(_OWORD *)(v6 + 272) = v7;
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(unsigned char *)(v8 + 288) |= 1u;
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(unsigned char *)(v9 + 288) |= 2u;
      return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (char)_initWithBuiltinTraitStorage:(void *)a3 tintColor:(void *)a4 clientDefinedTraits:(void *)a5 environmentWrapper:
{
  if (!a1) {
    return 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)UITraitCollection;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v22, sel_init);
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)a2;
    *(_OWORD *)(v9 + 24) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v9 + 8) = v11;
    long long v12 = *(_OWORD *)(a2 + 32);
    long long v13 = *(_OWORD *)(a2 + 48);
    long long v14 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v9 + 88) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v9 + 72) = v14;
    *(_OWORD *)(v9 + 56) = v13;
    *(_OWORD *)(v9 + 40) = v12;
    long long v15 = *(_OWORD *)(a2 + 96);
    long long v16 = *(_OWORD *)(a2 + 112);
    long long v17 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(v9 + 152) = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(v9 + 136) = v17;
    *(_OWORD *)(v9 + 120) = v16;
    *(_OWORD *)(v9 + 104) = v15;
    long long v18 = *(_OWORD *)(a2 + 160);
    long long v19 = *(_OWORD *)(a2 + 176);
    long long v20 = *(_OWORD *)(a2 + 192);
    *((void *)v9 + 27) = *(void *)(a2 + 208);
    *(_OWORD *)(v9 + 200) = v20;
    *(_OWORD *)(v9 + 184) = v19;
    *(_OWORD *)(v9 + 168) = v18;
    *((void *)v9 + 30) = a3;
    if ([a4 count]) {
      *((void *)v10 + 28) = [a4 copy];
    }
    *((void *)v10 + 29) = a5;
    if ((long long *)a2 == &_UIBuiltinTraitStorageUnspecified && ![a4 count])
    {
      *(_OWORD *)(v10 + 248) = 0u;
      *((void *)v10 + 35) = 0;
      *(_OWORD *)(v10 + 264) = 0u;
      v10[288] |= 1u;
    }
  }
  return v10;
}

- (void)dealloc
{
  set = self->_specifiedTraitTokens.set;
  if (set) {

  }
  v4.receiver = self;
  v4.super_class = (Class)UITraitCollection;
  [(UITraitCollection *)&v4 dealloc];
}

uint64_t __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](*(void *)(a1 + 32));
  v24[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v24[1] = (void (*)(void, void, void))3221225472;
  v24[2] = (void (*)(void, void, void))__79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_3;
  v24[3] = (void (*)(void, void, void))&unk_1E52F2C50;
  long long v25 = *(_OWORD *)(a1 + 32);
  uint64_t v26 = a3;
  _UITraitTokenSetEnumerate(v5, v24);
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v6 = (void (*)(void, void, void))-[UITraitCollection _specifiedTraitTokens](*(void *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 48);
    v23[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v23[1] = (void (*)(void, void, void))3221225472;
    v23[2] = (void (*)(void, void, void))__79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_4;
    v23[3] = (void (*)(void, void, void))&unk_1E52F2C78;
    v23[4] = (void (*)(void, void, void))a3;
    v23[5] = v6;
    -[_UITraitTokenSet enumerateAllTraitTokenValues:](v7, v23);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8 && *(void *)(*(void *)(a1 + 40) + 232) != v8)
  {

    id v9 = *(id *)(a1 + 56);
    *(void *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 232) = v9;
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10 && *(void *)(*(void *)(a1 + 40) + 240) != v10)
  {

    id v11 = *(id *)(a1 + 64);
    *(void *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 240) = v11;
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
  if (result)
  {
    id v13 = (id)[*(id *)((*(uint64_t (**)(uint64_t))(a3 + 16))(a3) + 224) mutableCopy];
    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v14 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i)), *(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }

    uint64_t result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
    *(void *)(result + 224) = v13;
  }
  return result;
}

- (void)_fallbackTraitCollection
{
  id v2 = self;
  return v2;
}

uint64_t __54__UITraitCollection_traitCollectionByModifyingTraits___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (UIImageConfiguration)imageConfiguration
{
  id v2 = [[UIImageConfiguration alloc] _initWithTraitCollection:self];
  return (UIImageConfiguration *)v2;
}

- (char)_traitCollectionRelevantForImageConfiguration
{
  if (!object) {
    return 0;
  }
  if ((object[288] & 8) == 0)
  {
    +[UITraitCollection _systemTraitTokensAffectingImageLookupSet]();
    id v2 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:](object, qword_1EB261398);
    unint64_t v3 = v2;
    if (v2)
    {
      if (v2 != object)
      {
        objc_setAssociatedObject(object, &_MergedGlobals_1098, v2, (void *)1);
        object[288] |= 8u;
      }
      objc_setAssociatedObject(v3, &_MergedGlobals_1098, v3, 0);
      v3[288] |= 8u;
    }
    return v3;
  }
  return (char *)objc_getAssociatedObject(object, &_MergedGlobals_1098);
}

- (id)_traitCollectionByReplacingNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  uint64_t v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, a3, v7);
}

- (id)_traitCollectionByReplacingValue:(long long *)a3 forTraitWithMetadata:
{
  if (result)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke;
    _OWORD v4[3] = &unk_1E52F2CC8;
    v4[4] = result;
    v4[5] = a2;
    long long v3 = a3[1];
    long long v5 = *a3;
    long long v6 = v3;
    long long v7 = a3[2];
    uint64_t v8 = *((void *)a3 + 6);
    return -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](result, (uint64_t)v4);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0 || (*((unsigned char *)a3 + 288) & 1) == 0)
  {
LABEL_5:
    if (!memcmp(&self->_builtinTraits, (char *)a3 + 8, 0xD8uLL)) {
      goto LABEL_6;
    }
    return 0;
  }
  id v13 = _UITraitTokenSetCount((uint64_t)&self->_specifiedTraitTokens);
  if (v13 != _UITraitTokenSetCount((uint64_t)a3 + 248)) {
    return 0;
  }
  if (v13)
  {
    if (!_UITraitTokenSetIsEqualToSet((uint64_t)&self->_specifiedTraitTokens, (uint64_t)a3 + 248)) {
      return 0;
    }
    goto LABEL_5;
  }
LABEL_6:
  if (self->_clientDefinedTraits) {
    clientDefinedTraits = self->_clientDefinedTraits;
  }
  else {
    clientDefinedTraits = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  if (*((void *)a3 + 28)) {
    long long v6 = (void *)*((void *)a3 + 28);
  }
  else {
    long long v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v7 = [(NSDictionary *)clientDefinedTraits count];
  if (v7 != [v6 count]) {
    return 0;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  TraitCollectionTSD = GetTraitCollectionTSD();
  char v9 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__UITraitCollection_isEqual___block_invoke;
  v15[3] = &unk_1E52F27F8;
  v15[4] = clientDefinedTraits;
  v15[5] = v6;
  v15[7] = a3;
  v15[8] = &v16;
  v15[6] = self;
  _UIPerformWithTraitLock((uint64_t)v15);
  *((unsigned char *)GetTraitCollectionTSD() + 9) = v9;
  if (*((unsigned char *)v17 + 24))
  {
    environmentWrapper = self->_environmentWrapper;
    long long v11 = *((void *)a3 + 29);
    if (environmentWrapper == v11)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (environmentWrapper && v11) {
        char v12 = -[NSObject isEqual:](environmentWrapper, "isEqual:");
      }
    }
  }
  else
  {
    char v12 = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (UITraitEnvironmentLayoutDirection)layoutDirection
{
  return self->_builtinTraits.layoutDirection;
}

+ (char)_currentTraitCollectionWithUnmarkedFallback
{
  self;
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 0);
}

+ (UITraitCollection)traitCollectionWithDisplayScale:(CGFloat)scale
{
  if (scale == 1.0)
  {
    if (qword_1EB261118 != -1) {
      dispatch_once(&qword_1EB261118, &__block_literal_global_234_2);
    }
    return (UITraitCollection *)qword_1EB261110;
  }
  else if (scale == 2.0)
  {
    if (qword_1EB261128 != -1) {
      dispatch_once(&qword_1EB261128, &__block_literal_global_238_0);
    }
    return (UITraitCollection *)qword_1EB261120;
  }
  else if (scale == 3.0)
  {
    if (qword_1EB261138 != -1) {
      dispatch_once(&qword_1EB261138, &__block_literal_global_242_0);
    }
    return (UITraitCollection *)qword_1EB261130;
  }
  else if (scale == 0.0)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    long long v17 = xmmword_186B9B9B0;
    long long v18 = unk_186B9B9C0;
    long long v19 = xmmword_186B9B9D0;
    uint64_t v20 = -1;
    long long v13 = xmmword_186B9B970;
    long long v14 = unk_186B9B980;
    long long v15 = xmmword_186B9B990;
    long long v16 = unk_186B9B9A0;
    long long v9 = xmmword_186B9B930;
    long long v10 = unk_186B9B940;
    long long v11 = xmmword_186B9B950;
    long long v12 = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    long long v8 = unk_186B9B920;
    *(CGFloat *)&v7[1] = scale;
    objc_super v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    long long v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 3uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
}

- (id)_traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection:(id)result
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke;
    v2[3] = &unk_1E52F2C00;
    v2[4] = result;
    v2[5] = a2;
    return -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](result, (uint64_t)v2);
  }
  return result;
}

- (UIContentSizeCategory)preferredContentSizeCategory
{
  _UIRecordTraitUsage((unint64_t)self, 7uLL);
  int64_t preferredContentSizeCategory = self->_builtinTraits.preferredContentSizeCategory;
  return (UIContentSizeCategory)_NSStringFromUIContentSizeCategory(preferredContentSizeCategory);
}

- (UIUserInterfaceIdiom)userInterfaceIdiom
{
  return self->_builtinTraits.userInterfaceIdiom;
}

- (UIUserInterfaceActiveAppearance)activeAppearance
{
  return self->_builtinTraits.activeAppearance;
}

- (UIUserInterfaceSizeClass)verticalSizeClass
{
  return self->_builtinTraits.verticalSizeClass;
}

- (UIUserInterfaceSizeClass)horizontalSizeClass
{
  return self->_builtinTraits.horizontalSizeClass;
}

- (BOOL)hasDifferentColorAppearanceComparedToTraitCollection:(UITraitCollection *)traitCollection
{
  if (self == traitCollection)
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (!traitCollection) {
    goto LABEL_13;
  }
  LODWORD(v5) = dyld_program_sdk_at_least();
  if (!v5) {
    return (char)v5;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    long long v6 = [(UITraitCollection *)self _tintColor];
    long long v5 = [(UITraitCollection *)traitCollection _tintColor];
    if (v6 != v5)
    {
      uint64_t v7 = v5;
      LOBYTE(v5) = 1;
      if (!v6 || !v7) {
        return (char)v5;
      }
      if (!-[UIColor isEqual:](v6, "isEqual:"))
      {
LABEL_13:
        LOBYTE(v5) = 1;
        return (char)v5;
      }
    }
  }
  LOBYTE(v5) = _colorAppearanceTraitChanged((uint64_t)self, (uint64_t)traitCollection);
  return (char)v5;
}

+ (void)setCurrentTraitCollection:(UITraitCollection *)currentTraitCollection
{
  TraitCollectionTSD = (id *)GetTraitCollectionTSD();
  if (*TraitCollectionTSD != currentTraitCollection)
  {
    long long v5 = TraitCollectionTSD;

    if (!currentTraitCollection || (*(unsigned char *)&currentTraitCollection->_flags & 4) != 0) {
      long long v6 = 0;
    }
    else {
      long long v6 = currentTraitCollection;
    }
    *long long v5 = v6;
    *((unsigned char *)v5 + 8) = 0;
  }
}

+ (char)_currentTraitCollectionWithFallback:(int)a3 markFallback:
{
  self;
  TraitCollectionTSD = (char **)GetTraitCollectionTSD();
  long long v6 = *TraitCollectionTSD;
  if (*TraitCollectionTSD)
  {
    uint64_t v7 = TraitCollectionTSD;
    if (*((unsigned char *)TraitCollectionTSD + 8))
    {
LABEL_72:
      char v29 = v6;
      return v6;
    }
    long long v8 = *(_OWORD *)(v6 + 168);
    long long v9 = *(_OWORD *)(v6 + 184);
    long long v10 = *(_OWORD *)(v6 + 200);
    uint64_t v44 = *((void *)v6 + 27);
    long long v11 = *(_OWORD *)(v6 + 24);
    long long v31 = *(_OWORD *)(v6 + 8);
    long long v32 = v11;
    long long v12 = *(_OWORD *)(v6 + 40);
    long long v13 = *(_OWORD *)(v6 + 56);
    long long v14 = *(_OWORD *)(v6 + 88);
    long long v35 = *(_OWORD *)(v6 + 72);
    long long v36 = v14;
    long long v33 = v12;
    long long v34 = v13;
    long long v15 = *(_OWORD *)(v6 + 104);
    long long v16 = *(_OWORD *)(v6 + 120);
    long long v17 = *(_OWORD *)(v6 + 152);
    long long v39 = *(_OWORD *)(v6 + 136);
    long long v40 = v17;
    long long v37 = v15;
    long long v38 = v16;
    long long v42 = v9;
    long long v43 = v10;
    long long v41 = v8;
    if ((void)v31 == -1)
    {
      long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
      if (v18 && *((void *)v18 + 1) != -1)
      {
        *(double *)&long long v31 = v18[1];
        char v19 = 1;
LABEL_6:
        if (*((double *)&v31 + 1) == 0.0)
        {
          if (!v18)
          {
            long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
            if (!v18)
            {
              if ((void)v32 != -1)
              {
                long long v18 = 0;
                goto LABEL_29;
              }
              goto LABEL_13;
            }
          }
          if (v18[2] != 0.0)
          {
            *((double *)&v31 + 1) = v18[2];
            char v19 = 1;
          }
        }
        if ((void)v32 != -1) {
          goto LABEL_29;
        }
        if (v18)
        {
LABEL_14:
          if (*((void *)v18 + 3) != -1)
          {
            *(double *)&long long v32 = v18[3];
            char v19 = 1;
          }
LABEL_29:
          uint64_t v25 = *((void *)&v35 + 1);
          if (!*((void *)&v35 + 1))
          {
            if (!v18)
            {
              long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
              if (!v18)
              {
                uint64_t v25 = 0;
                if ((void)v36 != -1) {
                  goto LABEL_39;
                }
                goto LABEL_36;
              }
            }
            uint64_t v25 = *((void *)v18 + 10);
            if (v25)
            {
              *((double *)&v35 + 1) = v18[10];
              char v19 = 1;
            }
          }
          if ((void)v36 != -1) {
            goto LABEL_39;
          }
          if (v18)
          {
LABEL_37:
            if (*((void *)v18 + 11) != -1)
            {
              *(double *)&long long v36 = v18[11];
              char v19 = 1;
            }
LABEL_39:
            if (!(void)v37)
            {
              if (!v18)
              {
                long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
                if (!v18)
                {
                  if ((void)v38 != -1)
                  {
                    long long v18 = 0;
                    goto LABEL_49;
                  }
                  goto LABEL_46;
                }
              }
              if (*((void *)v18 + 13))
              {
                *(double *)&long long v37 = v18[13];
                char v19 = 1;
              }
            }
            if ((void)v38 != -1) {
              goto LABEL_49;
            }
            if (v18)
            {
LABEL_47:
              if (*((void *)v18 + 15) != -1)
              {
                *(double *)&long long v38 = v18[15];
                char v19 = 1;
              }
LABEL_49:
              if ((void)v40 == -1)
              {
                if (!v18)
                {
                  long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
                  if (!v18)
                  {
                    if (*((void *)&v40 + 1) != -1)
                    {
                      long long v18 = 0;
                      goto LABEL_59;
                    }
                    goto LABEL_56;
                  }
                }
                if (*((void *)v18 + 19) != -1)
                {
                  *(double *)&long long v40 = v18[19];
                  char v19 = 1;
                }
              }
              if (*((void *)&v40 + 1) != -1) {
                goto LABEL_59;
              }
              if (v18)
              {
LABEL_57:
                if (*((void *)v18 + 20) != -1)
                {
                  *((double *)&v40 + 1) = v18[20];
                  char v19 = 1;
                }
LABEL_59:
                if ((void)v41 == -1
                  && (v18 || (long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]()) != 0)
                  && *((void *)v18 + 21) != -1)
                {
                  *(double *)&long long v41 = v18[21];
                  char v19 = 1;
                }
                if (v25 == 1 || (dyld_program_sdk_at_least() & 1) != 0)
                {
                  if ((v19 & 1) == 0)
                  {
LABEL_71:
                    *((unsigned char *)v7 + 8) = 1;
                    goto LABEL_72;
                  }
                }
                else
                {
                  *((void *)&v35 + 1) = 1;
                }
                uint64_t v26 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v31, *((void **)v6 + 30), *((void **)v6 + 28), *((void **)v6 + 29));
                _UITraitCollectionWasCopied((unint64_t)v6, (unint64_t)v26);
                v27 = v26;
                if (v6 != v27)
                {
                  uint64_t v28 = v27;

                  UIColor *v7 = v28;
                  long long v6 = v28;
                }
                goto LABEL_71;
              }
LABEL_56:
              long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
              if (!v18) {
                goto LABEL_59;
              }
              goto LABEL_57;
            }
LABEL_46:
            long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
            if (!v18) {
              goto LABEL_49;
            }
            goto LABEL_47;
          }
LABEL_36:
          long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
          if (!v18) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }
LABEL_13:
        long long v18 = (double *)+[UITraitCollection _fallbackTraitCollection]();
        if (!v18) {
          goto LABEL_29;
        }
        goto LABEL_14;
      }
    }
    else
    {
      long long v18 = 0;
    }
    char v19 = 0;
    goto LABEL_6;
  }
  if (!a2) {
    goto LABEL_22;
  }
  uint64_t v20 = (void **)+[UITraitCollection _fallbackTraitCollection]();
  unint64_t v21 = (unint64_t)v20;
  if (!a3)
  {
    uint64_t v24 = v20;
    long long v6 = (char *)v21;
    return v6;
  }
  if (v20)
  {
    long long v6 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)(v20 + 1), v20[30], v20[28], v20[29]);
    _UITraitCollectionWasCopied(v21, (unint64_t)v6);
    long long v22 = (void *)*((void *)v6 + 31);
    if (v22) {

    }
    *((void *)v6 + 31) = [*(id *)(v21 + 248) mutableCopy];
    long long v23 = *(_OWORD *)(v21 + 272);
    *((_OWORD *)v6 + 16) = *(_OWORD *)(v21 + 256);
    *((_OWORD *)v6 + 17) = v23;
    v6[288] |= 5u;
  }
  else
  {
LABEL_22:
    long long v6 = 0;
  }
  return v6;
}

+ (char)_currentTraitCollectionIfExists
{
  self;
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 0, 0);
}

uint64_t __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1[4] || a1[5])
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v10 = -[UITraitCollection _specifiedTraitTokensLocked](a1[6]);
    BOOL v2 = _UITraitTokenSetCount(v10) != 0;
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v3 = *(void **)(a1[6] + 224);
  uint64_t result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if (![(id)_traitTokensByIdentifier objectForKey:v8])
        {
          *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
          long long v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
          if (v9) {
            [v9 addObject:v8];
          }
          else {
            *(void *)(*(void *)(a1[8] + 8) + 40) = [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke(uint64_t a1)
{
  BOOL v2 = *(uint64_t **)(a1 + 48);
  v7[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void, void))3221225472;
  void v7[2] = (void (*)(void, void, void))__71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_2;
  long long v7[3] = (void (*)(void, void, void))&unk_1E52F2738;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v9 = v3;
  _UITraitTokenSetEnumerate(v2, v7);
  v6[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v6[1] = (void (*)(void, void, void))3221225472;
  v6[2] = (void (*)(void, void, void))__71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke_3;
  v6[3] = (void (*)(void, void, void))&__block_descriptor_48_e12_v24__0Q8_B16l;
  objc_super v4 = *(uint64_t **)(a1 + 56);
  uint64_t v5 = *(void (**)(void, void, void))(a1 + 64);
  v6[4] = *(void (**)(void, void, void))(a1 + 48);
  v6[5] = v5;
  _UITraitTokenSetEnumerate(v4, v6);
}

uint64_t __64__UITraitCollection__traitTokensIncludingPlaceholdersForTraits___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", _UITraitTokenForTraitLocked(0, *(void **)(*((void *)&v7 + 1) + 8 * v6++)));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_2(uint64_t a1)
{
  v2[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v2[1] = (void (*)(void, void, void))3221225472;
  v2[2] = (void (*)(void, void, void))__62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_3;
  v2[3] = (void (*)(void, void, void))&unk_1E52F2698;
  v1 = *(uint64_t **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 32);
  _UITraitTokenSetEnumerate(v1, v2);
}

+ (id)_backgroundThreadFallbackTraitCollection
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
  id v0 = (id)_backgroundThreadFallbackTraitCollection;
  os_unfair_lock_unlock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
  if (v0)
  {
    return v0;
  }
  else
  {
    return (id)+[UITraitCollection _defaultTraitCollection]();
  }
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_3;
  _OWORD v4[3] = &unk_1E52F2B38;
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  long long v7 = *(_OWORD *)(a1 + 72);
  return [v1 enumerateObjectsWithOptions:2 usingBlock:v4];
}

uint64_t __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 224);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke_2;
  v3[3] = &unk_1E52F2898;
  char v4 = *(unsigned char *)(a1 + 48);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

- (UIAccessibilityContrast)accessibilityContrast
{
  return self->_builtinTraits.accessibilityContrast;
}

- (UITraitCollection)traitCollectionByReplacingNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[(UITraitCollection *)self _traitCollectionByReplacingNSIntegerValue:value forTraitToken:v7];
}

uint64_t __66__UITraitCollection__traitCollectionByModifyingTraitsCopyOnWrite___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!result) {
    return *(void *)(a1 + 32);
  }
  return result;
}

- (UIUserInterfaceStyle)userInterfaceStyle
{
  return self->_builtinTraits.userInterfaceStyle;
}

- (id)_objectForTraitToken:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 1uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  uint64_t v6 = v10;
  return -[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

- (int64_t)_valueForNSIntegerTraitToken:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 3uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  uint64_t v6 = v10;
  return (int64_t)-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

uint64_t __29__UITraitCollection_isEqual___block_invoke_2(uint64_t a1, uint64_t a2, __CFString *a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!result) {
    goto LABEL_11;
  }
  uint64_t v9 = result;
  CFNumberRef v10 = (const __CFNumber *)[(id)_traitTokensByIdentifier objectForKey:a2];
  if (!v10
    || (uint64_t v23 = 0,
        long long v21 = 0u,
        long long v22 = 0u,
        long long v20 = 0u,
        _UIGetTraitMetadataLocked(v10, 0, (uint64_t)&v20),
        !*((void *)&v20 + 1)))
  {
    long long v15 = a3;
    uint64_t v14 = v9;
    goto LABEL_10;
  }
  unint64_t v11 = *(void *)(a1 + 40);
  long long v16 = v20;
  long long v17 = v21;
  long long v18 = v22;
  uint64_t v19 = v23;
  uint64_t v12 = -[UITraitCollection _valueForTraitWithMetadata:](v11, (uint64_t)&v16);
  unint64_t v13 = *(void *)(a1 + 48);
  long long v16 = v20;
  long long v17 = v21;
  long long v18 = v22;
  uint64_t v19 = v23;
  uint64_t result = (uint64_t)-[UITraitCollection _valueForTraitWithMetadata:](v13, (uint64_t)&v16);
  if (v12 == (__CFString *)result) {
    goto LABEL_12;
  }
  if (*((void *)&v20 + 1) != 1) {
    goto LABEL_11;
  }
  uint64_t v14 = result;
  uint64_t result = v22;
  if (!(void)v22)
  {
    if (!v12 || !v14) {
      goto LABEL_11;
    }
    long long v15 = v12;
LABEL_10:
    uint64_t result = [(__CFString *)v15 isEqual:v14];
    if (result) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t result = (*(uint64_t (**)(void))(v22 + 16))();
  if ((result & 1) == 0) {
LABEL_11:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_12:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)objectForTrait:(UIObjectTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _objectForTraitToken:v5];
}

- (void)_setObject:(id)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  int8x16_t v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  [(UITraitCollection *)(uint64_t)self _setValue:(uint64_t)v6 forTraitWithMetadata:v10];
}

- (void)setObject:(id)a3 forTrait:(Class)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    CFNumberRef v7 = _UITraitTokenForTraitLocked(1, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    [(UITraitCollection *)self _setObject:a3 forTraitToken:v7];
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 640, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setObject_forTrait____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (UIDisplayGamut)displayGamut
{
  return self->_builtinTraits.displayGamut;
}

- (uint64_t)_createTraitTokenSetForChangesFromTraitCollection:(uint64_t)a3@<X8>
{
  if (!result || (uint64_t v5 = result, result == a2))
  {
    *(void *)(a3 + 32) = 0;
    long long v11 = 0uLL;
    *(_OWORD *)(a3 + 16) = 0u;
LABEL_10:
    *(_OWORD *)a3 = v11;
    return result;
  }
  uint64_t result = -[UITraitCollection _specifiedTraitTokens](result);
  uint64_t v6 = result;
  if (!a2)
  {
    if (*(void *)result) {
      uint64_t result = (uint64_t)*(id *)result;
    }
    long long v11 = *(_OWORD *)v6;
    long long v12 = *(_OWORD *)(v6 + 16);
    *(void *)(a3 + 32) = *(void *)(v6 + 32);
    *(_OWORD *)(a3 + 16) = v12;
    goto LABEL_10;
  }
  uint64_t v7 = -[UITraitCollection _specifiedTraitTokens](a2);
  long long v8 = _UITraitTokenSetCount(v6);
  uint64_t result = (uint64_t)_UITraitTokenSetCount(v7);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)(a3 + 32) = 0;
  if ((unint64_t)v8 | result)
  {
    TraitCollectionTSD = GetTraitCollectionTSD();
    char v10 = TraitCollectionTSD[9];
    TraitCollectionTSD[9] = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__UITraitCollection__createTraitTokenSetForChangesFromTraitCollection___block_invoke;
    v13[3] = &unk_1E52F2780;
    v13[6] = v6;
    v13[7] = v7;
    v13[8] = a3;
    v13[4] = v5;
    v13[5] = a2;
    _UIPerformWithTraitLock((uint64_t)v13);
    uint64_t result = (uint64_t)GetTraitCollectionTSD();
    *(unsigned char *)(result + 9) = v10;
  }
  return result;
}

void __96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke(uint64_t a1, uint64_t a2, void (*a3)(void, void, void))
{
  uint64_t v5 = (void (*)(void, void, void))-[UITraitCollection _specifiedTraitTokens](*(void *)(a1 + 32));
  uint64_t v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](*(void *)(a1 + 40));
  v7[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void, void))3221225472;
  void v7[2] = (void (*)(void, void, void))__96__UITraitCollection__traitCollectionByPopulatingUnspecifiedTraitsWithValuesFromTraitCollection___block_invoke_2;
  long long v7[3] = (void (*)(void, void, void))&unk_1E52F2BD8;
  v7[5] = a3;
  v7[6] = v5;
  v7[4] = *(void (**)(void, void, void))(a1 + 40);
  _UITraitTokenSetEnumerate(v6, v7);
}

- (uint64_t)_specifiedTraitTokens
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 288) & 1) == 0)
    {
      [(UITraitCollection *)(void *)result _computeSpecifiedTraitTokensAcquireLock:(uint64_t)v3];
      long long v2 = v3[1];
      *(_OWORD *)(v1 + 248) = v3[0];
      *(_OWORD *)(v1 + 264) = v2;
      *(void *)(v1 + 280) = v4;
      *(unsigned char *)(v1 + 288) |= 1u;
    }
    return v1 + 248;
  }
  return result;
}

- (void)_traitCollectionByApplyingOverrides:(uint64_t)a3 defaultValueOverrides:
{
  long long v3 = a1;
  if (a1)
  {
    if (a3) {
      BOOL v6 = _UITraitTokenSetCount(a3 + 16) != 0;
    }
    else {
      BOOL v6 = 0;
    }
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3052000000;
    v18[3] = __Block_byref_object_copy__117;
    v18[4] = __Block_byref_object_dispose__117;
    v18[5] = 0;
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    if (a2)
    {
      uint64_t v8 = *(void *)(a2 + 232);
      uint64_t v7 = *(void *)(a2 + 240);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke;
      v13[3] = &unk_1E52F2C28;
      v13[4] = v7;
      v13[5] = v8;
      v13[6] = a2;
      v13[7] = &v14;
      v13[8] = v18;
      _UIPerformWithTraitLock((uint64_t)v13);
      if (*((unsigned char *)v15 + 24) || v6) {
        goto LABEL_10;
      }
    }
    else if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
LABEL_10:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __79__UITraitCollection__traitCollectionByApplyingOverrides_defaultValueOverrides___block_invoke_2;
      v11[3] = &unk_1E52F2CA0;
      v11[4] = a2;
      v11[5] = v3;
      BOOL v12 = v6;
      v11[6] = a3;
      v11[7] = v8;
      v11[8] = v7;
      v11[9] = v18;
      id v9 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v3, (uint64_t)v11);
LABEL_12:
      long long v3 = v9;
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(v18, 8);
      return v3;
    }
    id v9 = v3;
    goto LABEL_12;
  }
  return v3;
}

- (BOOL)_isEqualToTraitCollectionForResolvingImage:(uint64_t)a1
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    if (a1 == a2) {
      return 1;
    }
    else {
      return *(double *)(a1 + 16) == *(double *)(a2 + 16)
    }
          && *(void *)(a1 + 8) == *(void *)(a2 + 8)
          && *(void *)(a1 + 80) == *(void *)(a2 + 80)
          && *(void *)(a1 + 24) == *(void *)(a2 + 24)
          && *(void *)(a1 + 64) == *(void *)(a2 + 64)
          && *(void *)(a1 + 72) == *(void *)(a2 + 72)
          && *(void *)(a1 + 88) == *(void *)(a2 + 88)
          && *(void *)(a1 + 120) == *(void *)(a2 + 120)
          && *(void *)(a1 + 56) == *(void *)(a2 + 56)
          && *(void *)(a1 + 152) == *(void *)(a2 + 152)
          && *(void *)(a1 + 104) == *(void *)(a2 + 104);
  }
  return v2;
}

- (int64_t)_userInterfaceRenderingMode
{
  return self->_builtinTraits.userInterfaceRenderingMode;
}

- (int64_t)_vibrancy
{
  return self->_builtinTraits.vibrancy;
}

- (UILegibilityWeight)legibilityWeight
{
  return self->_builtinTraits.legibilityWeight;
}

- (uint64_t)_descriptionWithPrivateTraits:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    return objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; %@>",
             v6,
             v3,
             -[UITraitCollection _traitsDescriptionMatching:includePrivateTraits:](v3, 0, a2));
  }
  return result;
}

- (uint64_t)_traitsDescriptionMatching:(BOOL)a3 includePrivateTraits:
{
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = result + 8;
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    v22[4] = v7;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___UIBuiltinTraitStorageDescription_block_invoke;
    v23[3] = &unk_1E52F25F8;
    v23[4] = v7;
    v21[4] = v7;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___UIBuiltinTraitStorageDescription_block_invoke_2;
    v22[3] = &unk_1E52F2620;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___UIBuiltinTraitStorageDescription_block_invoke_3;
    v21[3] = &unk_1E52F2648;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
    char v17 = &unk_1E52F2D98;
    long long v18 = v23;
    v24[4] = v21;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
    v25[3] = &unk_1E52F2DC0;
    v25[4] = v22;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
    v24[3] = &unk_1E52F2DE8;
    _UIBuiltinTraitStorageEnumeratePairWithBlock(v6, v6, a3, (uint64_t)&v14, (uint64_t)v25, (uint64_t)v24);
    if (v5[28])
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke;
      char v17 = &unk_1E52F28C0;
      BOOL v20 = a3;
      long long v18 = v5;
      uint64_t v19 = v7;
      _UIPerformWithTraitLock((uint64_t)&v14);
    }
    if (a3)
    {
      if (v5[30]) {
        [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"TintColor = %@", v5[30])];
      }
      a3 = v5[29] != 0;
    }
    if ([a2 length])
    {
      uint64_t v8 = [a2 lowercaseString];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __69__UITraitCollection__traitsDescriptionMatching_includePrivateTraits___block_invoke;
      v13[3] = &unk_1E52F28E8;
      v13[4] = v8;
      objc_msgSend(v7, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v13));
      if (a3)
      {
        char v9 = objc_msgSend((id)objc_msgSend(@"_environmentWrapper", "lowercaseString"), "containsString:", v8);
        char v10 = NSString;
        uint64_t v11 = [v7 componentsJoinedByString:@", "];
        if ((v9 & 1) == 0) {
          goto LABEL_15;
        }
LABEL_13:
        BOOL v12 = (__CFString *)[NSString stringWithFormat:@"; %@", v5[29]];
        return [v10 stringWithFormat:@"%@%@", v11, v12];
      }
      char v10 = NSString;
      uint64_t v11 = [v7 componentsJoinedByString:@", "];
    }
    else
    {
      char v10 = NSString;
      uint64_t v11 = [v7 componentsJoinedByString:@", "];
      if (a3) {
        goto LABEL_13;
      }
    }
LABEL_15:
    BOOL v12 = &stru_1ED0E84C0;
    return [v10 stringWithFormat:@"%@%@", v11, v12];
  }
  return result;
}

- (id)_traitsDescription
{
  return [(UITraitCollection *)self _traitsDescriptionMatching:0];
}

- (id)_traitsDescriptionMatching:(id)a3
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  return (id)-[UITraitCollection _traitsDescriptionMatching:includePrivateTraits:]((uint64_t)self, a3, has_internal_diagnostics);
}

- (unint64_t)hash
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = ___UIBuiltinTraitStorageHash_block_invoke;
  long long v7[3] = &unk_1E52F2580;
  v7[4] = &v8;
  v5[4] = &v8;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___UIBuiltinTraitStorageHash_block_invoke_2;
  _OWORD v6[3] = &unk_1E52F25A8;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___UIBuiltinTraitStorageHash_block_invoke_3;
  _OWORD v5[3] = &unk_1E52F25D0;
  v13[4] = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
  v14[3] = &unk_1E52F2D98;
  v14[4] = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
  v13[3] = &unk_1E52F2DC0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
  v12[3] = &unk_1E52F2DE8;
  v12[4] = v5;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)&self->_builtinTraits, 1, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12);
  uint64_t v3 = v9[3];
  _Block_object_dispose(&v8, 8);
  if ([(NSDictionary *)self->_clientDefinedTraits count]) {
    v3 ^= [(NSDictionary *)self->_clientDefinedTraits hash];
  }
  return [self->_environmentWrapper hash] ^ v3;
}

- (void)performAsCurrentTraitCollection:(void *)actions
{
}

- (__CFString)_styleEffectAppearanceName
{
  if (result)
  {
    if ([(__CFString *)result userInterfaceStyle] == 2) {
      return @"UIAppearanceDark";
    }
    else {
      return @"UIAppearanceLight";
    }
  }
  return result;
}

- (unint64_t)artworkSubtype
{
  return self->_builtinTraits.artworkSubtype;
}

- (void)_enumerateThemeAppearanceNamesForLookup:(void *)result
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v16 = [result userInterfaceStyle];
    v20[0] = v16;
    v20[1] = 0;
    uint64_t v4 = [v3 accessibilityContrast];
    uint64_t v5 = 0;
    v19[0] = v4 == 1;
    v19[1] = 0;
    char v17 = 1;
LABEL_3:
    uint64_t v6 = 0;
    uint64_t v7 = v20[v5];
    char v8 = 1;
    while (1)
    {
      BOOL v9 = v19[v6] == 0;
      uint64_t v10 = @"UIAppearanceHighContrastLight";
      if (v19[v6])
      {
        uint64_t v11 = @"UIAppearanceHighContrastDark";
      }
      else
      {
        uint64_t v10 = @"UIAppearanceLight";
        uint64_t v11 = @"UIAppearanceDark";
      }
      if (v9) {
        BOOL v12 = @"UIAppearanceAny";
      }
      else {
        BOOL v12 = @"UIAppearanceHighContrastAny";
      }
      if (v7 != 2) {
        uint64_t v11 = v12;
      }
      unint64_t v13 = v7 == 1 ? v10 : v11;
      char v18 = 0;
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, __CFString *, char *))(a2 + 16))(a2, v13, &v18);
      if (v18) {
        break;
      }
      char v14 = (v4 != 1) | ~v8;
      uint64_t v6 = 1;
      char v8 = 0;
      if (v14)
      {
        char v15 = (v16 != 0) & v17;
        uint64_t v5 = 1;
        char v17 = 0;
        if (v15) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (uint64_t)_matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 1;
  if (a2)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke;
    v9[3] = &unk_1E52F2A98;
    v9[4] = a1;
    v9[5] = a2;
    void v9[6] = &v10;
    _UIPerformWithTraitLock((uint64_t)v9);
    uint64_t v5 = v11;
    if (*((unsigned char *)v11 + 24))
    {
      uint64_t v6 = *(void **)(a1 + 232);
      if (v6)
      {
        uint64_t v7 = *(void **)(a2 + 232);
        if (v7)
        {
          if (v6 != v7)
          {
            uint64_t v3 = objc_msgSend(v6, "isEqual:");
            uint64_t v5 = v11;
          }
          *((unsigned char *)v5 + 24) = v3;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  return v3;
}

+ (id)_traitTokensIncludingPlaceholdersForTraits:(uint64_t)a1
{
  self;
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__UITraitCollection__traitTokensIncludingPlaceholdersForTraits___block_invoke;
  _OWORD v5[3] = &unk_1E52EBA80;
  v5[4] = a2;
  void v5[5] = v3;
  _UIPerformWithTraitLock((uint64_t)v5);
  return v3;
}

+ (const)_traitTokenForNSIntegerTrait:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v3 = _UITraitTokenForTraitLocked(3, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

- (BOOL)_isTraitTokenSpecified:(id)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v9 = _UIGetTraitTokenValue((const __CFNumber *)a3);
    return _UITraitTokenSetContains((uint16x8_t **)&self->_specifiedTraitTokens, v9);
  }
  else
  {
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)&v16);
    if (*((void *)&v16 + 1))
    {
      v14[0] = v16;
      v14[1] = v17;
      v14[2] = v18;
      uint64_t v15 = v19;
      uint64_t v4 = -[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v14);
      uint64_t v5 = v4;
      uint64_t v6 = *((void *)&v16 + 1);
      uint64_t v7 = (__CFString *)*((void *)&v18 + 1);
      uint64_t v8 = v18;
      if (v19)
      {
        switch(*((void *)&v16 + 1))
        {
          case 1:
            uint64_t v7 = (__CFString *)**((void **)&v18 + 1);
            if (v4 != **((__CFString ***)&v18 + 1)) {
              goto LABEL_14;
            }
            goto LABEL_12;
          case 2:
          case 3:
          case 4:
            uint64_t v7 = (__CFString *)**((void **)&v18 + 1);
            break;
          default:
            uint64_t v11 = v17;
            uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *((void *)&v18 + 1));
            [v12 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v11 file lineNumber description];
            uint64_t v7 = 0;
            break;
        }
      }
      if (v7 == v5)
      {
LABEL_12:
        char v13 = 1;
      }
      else if (v6 == 1)
      {
LABEL_14:
        if (v8)
        {
          char v13 = (*(uint64_t (**)(uint64_t, __CFString *))(v8 + 16))(v8, v5);
        }
        else
        {
          char v13 = 0;
          if (v5)
          {
            if (v7) {
              char v13 = -[__CFString isEqual:](v5, "isEqual:");
            }
          }
        }
      }
      else
      {
        char v13 = 0;
      }
      return v13 ^ 1;
    }
    else
    {
      return [(NSDictionary *)self->_clientDefinedTraits objectForKey:*((void *)&v17 + 1)] != 0;
    }
  }
}

+ (uint64_t)_emptyTraitCollection
{
  if (qword_1EB261340 != -1) {
    dispatch_once(&qword_1EB261340, &__block_literal_global_379_0);
  }
  return qword_1EB261338;
}

- (id)_traitCollectionByRemovingTraitToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 0, (uint64_t)&v12);
  if (*((void *)&v12 + 1))
  {
    uint64_t v4 = *((void *)&v14 + 1);
    if (v15)
    {
      switch(*((void *)&v12 + 1))
      {
        case 1:
        case 2:
        case 3:
        case 4:
          uint64_t v4 = **((void **)&v14 + 1);
          break;
        default:
          uint64_t v8 = v13;
          unint64_t v9 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v9 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v8 file lineNumber description];
          uint64_t v4 = 0;
          break;
      }
    }
    *(_OWORD *)buf = v12;
    long long v17 = v13;
    long long v18 = v14;
    uint64_t v19 = v15;
    return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, v4, (long long *)buf);
  }
  else
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v7 = [(NSDictionary *)self->_clientDefinedTraits objectForKey:*((void *)&v13 + 1)];
    if (has_internal_diagnostics)
    {
      if (v7)
      {
        uint64_t v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v13;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Removing placeholder trait (%@) is not supported", buf, 0xCu);
        }
      }
    }
    else if (v7)
    {
      uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_traitCollectionByRemovingTraitToken____s_category)
                         + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Removing placeholder trait (%@) is not supported", buf, 0xCu);
      }
    }
    return self;
  }
}

uint64_t __29__UITraitCollection_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__UITraitCollection_isEqual___block_invoke_2;
  _OWORD v4[3] = &unk_1E52F27D0;
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  return [v1 enumerateKeysAndObjectsUsingBlock:v4];
}

+ (UITraitCollection)traitCollectionWithTraits:(UITraitMutations)mutations
{
  if (!mutations) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UITraitCollection_NonARC.m", 413, @"Invalid parameter not satisfying: %@", @"mutations != NULL");
  }
  uint64_t v4 = -[UITraitCollection _initWithTraitMutations:]((char *)[UITraitCollection alloc], (uint64_t)mutations);
  return (UITraitCollection *)v4;
}

- (char)_traitCollectionByFilteringTraitTokenSet:(char *)result
{
  if (result)
  {
    CFNumberRef v3 = result;
    uint64_t v4 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens]((uint64_t)result);
    if (_UITraitTokenSetIsSubsetOfSet(v4, a2))
    {
      long long v5 = v3;
    }
    else
    {
      long long v6 = [UITraitCollection alloc];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke;
      long long v7[3] = &unk_1E52F26E8;
      void v7[5] = a2;
      v7[6] = v4;
      v7[4] = v3;
      long long v5 = -[UITraitCollection _initWithTraitMutations:]((char *)v6, (uint64_t)v7);
    }
    return v5;
  }
  return result;
}

- (char)_initWithTraitMutations:(char *)a1
{
  long long v2 = a1;
  if (a1)
  {
    if (!a2) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithTraitMutations_, a1, @"UITraitCollection_NonARC.m", 1294, @"Invalid parameter not satisfying: %@", @"mutations != NULL");
    }
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:](v2, (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, 0);
    long long v2 = v4;
    if (v4)
    {
      long long v6 = v4 + 248;
      long long v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v2 + 35) = 0;
      *long long v6 = 0u;
      *(_OWORD *)(v2 + 264) = 0u;
      v2[288] |= 3u;
      (*(void (**)(uint64_t, char *))(a2 + 16))(a2, v2);
      v2[288] &= ~2u;
    }
  }
  return v2;
}

void __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__UITraitCollection__traitCollectionByFilteringTraitTokenSet___block_invoke_2;
  v2[3] = &unk_1E52F26C0;
  long long v3 = *(_OWORD *)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  _UIPerformWithTraitLock((uint64_t)v2);
}

- (void)setAccessibilityContrast:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.accessibilityContrast = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 9uLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 9uLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2532, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setAccessibilityContrast____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  int8x16_t v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  [(UITraitCollection *)(uint64_t)self _setValue:(uint64_t)v6 forTraitWithMetadata:v10];
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceStyle = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
    {
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 1uLL, v3);
    }
    else
    {
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 1uLL, (int8x16_t)v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2489, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setUserInterfaceStyle____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setNSIntegerValue:(int64_t)a3 forTrait:(Class)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    CFNumberRef v7 = _UITraitTokenForTraitLocked(3, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    [(UITraitCollection *)self _setNSIntegerValue:a3 forTraitToken:v7];
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 539, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setNSIntegerValue_forTrait____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.horizontalSizeClass = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
    {
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 4uLL, v3);
    }
    else
    {
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 4uLL, (int8x16_t)v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2479, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    CFNumberRef v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setHorizontalSizeClass____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.verticalSizeClass = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
    {
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 5uLL, v3);
    }
    else
    {
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 5uLL, (int8x16_t)v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2484, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    CFNumberRef v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setVerticalSizeClass____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setSceneCaptureState:(int64_t)a3
{
  uint64_t v5 = self;
  [(UITraitCollection *)self setNSIntegerValue:a3 forTrait:v5];
}

- (void)setDisplayScale:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.displayScale = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == 0.0)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 3uLL, *(int8x16_t *)&a3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 3uLL, *(__n128 *)&a3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2466, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setDisplayScale____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v8 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void)setLayoutDirection:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.layoutDirection = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 2uLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 2uLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2494, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    CFNumberRef v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setLayoutDirection____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  int8x16_t v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  [(UITraitCollection *)(uint64_t)self _setValue:(uint64_t)v6 forTraitWithMetadata:v10];
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceIdiom = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2444, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setUserInterfaceIdiom____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setDisplayGamut:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.displayGamut = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 8uLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 8uLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2474, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setDisplayGamut____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  int8x16_t v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  [(UITraitCollection *)(uint64_t)self _setValue:(uint64_t)v6 forTraitWithMetadata:v10];
}

- (void)setUserInterfaceLevel:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.userInterfaceLevel = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xAuLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xAuLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2537, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setUserInterfaceLevel____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setActiveAppearance:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.activeAppearance = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xCuLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xCuLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2514, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setActiveAppearance____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setLegibilityWeight:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.legibilityWeight = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xBuLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xBuLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2506, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setLegibilityWeight____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)setForceTouchCapability:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.forceTouchCapability = a3;
    p_specifiedTraitTokens = (uint64_t *)&self->_specifiedTraitTokens;
    if (a3)
    {
      _UITraitTokenSetInsert(p_specifiedTraitTokens, 6uLL, v3);
    }
    else
    {
      _UITraitTokenSetRemove((uint16x8_t **)p_specifiedTraitTokens, 6uLL, (int8x16_t)v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2499, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setForceTouchCapability____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

void __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3052000000;
  long long v33 = __Block_byref_object_copy__117;
  long long v34 = __Block_byref_object_dispose__117;
  uint64_t v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__117;
  uint64_t v28 = __Block_byref_object_dispose__117;
  uint64_t v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  long long v21 = __Block_byref_object_copy__117;
  long long v22 = __Block_byref_object_dispose__117;
  uint64_t v23 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_2;
  v11[3] = &unk_1E52F2B60;
  uint64_t v4 = *(void *)(a1 + 48);
  long long v16 = &v18;
  uint64_t v17 = v4;
  long long v12 = *(_OWORD *)(a1 + 32);
  long long v13 = a2;
  long long v14 = &v30;
  uint64_t v15 = &v24;
  _UIPerformWithTraitLock((uint64_t)v11);
  uint64_t v5 = (void *)a2[30];
  if (v5 != (void *)v25[5])
  {

    a2[30] = (id)v25[5];
  }
  long long v6 = (void *)a2[29];
  if (v6 != (void *)v19[5])
  {

    a2[29] = (id)v19[5];
  }
  uint64_t v7 = v31[5];
  if (v7)
  {
    uint64_t v8 = a2[28];
    if (v8)
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 40), @"UITraitCollection_NonARC.m", 2256, @"UIKit internal inconsistency: mutable trait collection must have a mutable dictionary _clientDefinedTraits");
      }
      long long v9 = (void *)v31[5];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_6;
      v10[3] = &unk_1E52F2B88;
      v10[4] = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v10];
    }
    else
    {
      a2[28] = v7;
    }
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)setCGFloatValue:(double)a3 forTrait:(Class)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    CFNumberRef v7 = _UITraitTokenForTraitLocked(2, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    [(UITraitCollection *)self _setCGFloatValue:v7 forTraitToken:a3];
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 484, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setCGFloatValue_forTrait____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (UIForceTouchCapability)forceTouchCapability
{
  return self->_builtinTraits.forceTouchCapability;
}

- (NSObject)_environmentWrapper
{
  long long v2 = self->_environmentWrapper;
  return v2;
}

- (void)_enumerateThemeKeysForLookup:(void *)result
{
  v49[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    __n128 v3 = result;
    BOOL v4 = 0;
    uint64_t v31 = result[1];
    v49[0] = v31;
    v49[1] = -1;
    v48[0] = result[10];
    v48[1] = 0;
    uint64_t v36 = result[19];
    v44[0] = v36 == 1;
    v44[1] = 0;
    uint64_t v39 = result[3];
    v47[0] = v39;
    v47[1] = 0;
    uint64_t v33 = v48[0];
    if (v48[0] == 2) {
      BOOL v4 = result[20] == 1;
    }
    BOOL v42 = v4;
    v46[0] = v4;
    v46[1] = 0;
    uint64_t v5 = self;
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    CFNumberRef v6 = _UITraitTokenForTraitLocked(3, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    uint64_t v7 = [v3 _valueForNSIntegerTraitToken:v6];
    uint64_t v8 = 0;
    v45[0] = v7 == 1;
    v45[1] = 0;
    char v32 = 1;
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v10 = (4 * v49[v8] + 4) & 0x3C;
    char v35 = 1;
    uint64_t v34 = v10;
LABEL_6:
    uint64_t v11 = 0;
    uint64_t v12 = v48[v9];
    if (v12 == 1000) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v12;
    }
    uint64_t v14 = v13 & 3 | v10;
    char v38 = 1;
    uint64_t v37 = v14;
LABEL_10:
    uint64_t v15 = 0;
    unint64_t v16 = v14 | ((unint64_t)v44[v11] << 6);
    char v17 = 1;
    unint64_t v40 = v16;
LABEL_11:
    char v41 = v17;
    uint64_t v18 = 0;
    unint64_t v19 = v16 | ((unint64_t)(v47[v15] == 1) << 7);
    char v20 = 1;
LABEL_12:
    uint64_t v21 = 0;
    uint64_t v22 = (v46[v18] & 1) << 8;
    if (v13 != 2) {
      uint64_t v22 = 0;
    }
    unint64_t v23 = v19 | v22;
    char v24 = 1;
    while (1)
    {
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:v23 | ((unint64_t)(v45[v21] == 1) << 9)];
      char v43 = 0;
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, v25, &v43);
      if (v43) {
        break;
      }
      char v26 = (v7 != 1) | ~v24;
      uint64_t v21 = 1;
      char v24 = 0;
      if (v26)
      {
        BOOL v27 = v42 & v20;
        uint64_t v18 = 1;
        char v20 = 0;
        if (v27) {
          goto LABEL_12;
        }
        unint64_t v16 = v40;
        uint64_t v15 = 1;
        char v17 = 0;
        if (((v39 != 0) & v41) != 0) {
          goto LABEL_11;
        }
        uint64_t v14 = v37;
        char v28 = (v36 == 1) & v38;
        uint64_t v11 = 1;
        char v38 = 0;
        if (v28) {
          goto LABEL_10;
        }
        uint64_t v10 = v34;
        char v29 = (v33 != 0) & v35;
        uint64_t v9 = 1;
        char v35 = 0;
        if ((v29 & 1) == 0)
        {
          char v30 = (v31 != -1) & v32;
          uint64_t v8 = 1;
          char v32 = 0;
          if (v30) {
            goto LABEL_5;
          }
          return result;
        }
        goto LABEL_6;
      }
    }
  }
  return result;
}

- (id)_changedTraitTokensArrayFromTraitCollection:(id)a3
{
  memset(v8, 0, 40);
  [(UITraitCollection *)(uint64_t)self _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v8];
  __n128 v3 = (void *)MEMORY[0x1E4F1CA48];
  if (v8[0].i64[0]) {
    BOOL v4 = -[_UIFastIndexSet count]((int8x16_t *)v8[0].i64[0]);
  }
  else {
    BOOL v4 = (int8x16_t *)vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v8 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)&v8[1] + 8))))));
  }
  uint64_t v5 = (void (*)(void, void, void))[v3 arrayWithCapacity:v4];
  v7[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void, void))3221225472;
  void v7[2] = (void (*)(void, void, void))__65__UITraitCollection__changedTraitTokensArrayFromTraitCollection___block_invoke;
  long long v7[3] = (void (*)(void, void, void))&unk_1E52F2E58;
  v7[4] = v5;
  _UITraitTokenSetEnumerate(v8[0].i64, v7);
  if (v8[0].i64[0]) {

  }
  return v5;
}

- (BOOL)_hasSplitViewControllerContextSidebarColumn
{
  _UIRecordTraitUsage((unint64_t)self, 0x15uLL);
  if (self->_builtinTraits.splitViewControllerContext == 3) {
    return 1;
  }
  return [(UITraitCollection *)self _hasSplitViewControllerContextPrimaryColumn];
}

- (BOOL)_hasSplitViewControllerContextPrimaryColumn
{
  return (unint64_t)(self->_builtinTraits.splitViewControllerContext - 1) < 2;
}

+ (UITraitCollection)currentTraitCollection
{
  return (UITraitCollection *)+[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 1);
}

- (char)_traitCollectionByReplacingTintColor:(char *)result
{
  if (result)
  {
    unint64_t v3 = (unint64_t)result;
    BOOL v4 = (void *)*((void *)result + 30);
    if (v4 == a2 || a2 && v4 && [v4 isEqual:a2])
    {
      uint64_t v5 = (char *)(id)v3;
    }
    else
    {
      uint64_t v5 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], v3 + 8, a2, *(void **)(v3 + 224), *(void **)(v3 + 232));
      _UITraitCollectionWasCopied(v3, (unint64_t)v5);
      CFNumberRef v6 = (void *)*((void *)v5 + 31);
      if (v6) {

      }
      uint64_t v9 = *(void **)(v3 + 248);
      unint64_t v8 = v3 + 248;
      uint64_t v7 = v9;
      if (v9) {
        id v10 = v7;
      }
      long long v11 = *(_OWORD *)v8;
      long long v12 = *(_OWORD *)(v8 + 16);
      *((void *)v5 + 35) = *(void *)(v8 + 32);
      *(_OWORD *)(v5 + 248) = v11;
      *(_OWORD *)(v5 + 264) = v12;
      v5[288] |= 1u;
    }
    return v5;
  }
  return result;
}

- (id)_traitCollectionWithIncrementedBackgroundLevel
{
  if (result)
  {
    uint64_t v1 = result;
    if ((dyld_program_sdk_at_least() & 1) != 0
      && ((v2 = [v1 userInterfaceLevel], v2 != -1) ? (uint64_t v3 = v2) : (uint64_t v3 = 0), v3 <= 0))
    {
      return (id)[v1 _traitCollectionByReplacingNSIntegerValue:v3 + 1 forTraitToken:0x1ED3F5B20];
    }
    else
    {
      id v4 = v1;
      return v4;
    }
  }
  return result;
}

- (UIUserInterfaceLevel)userInterfaceLevel
{
  return self->_builtinTraits.userInterfaceLevel;
}

void __59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke()
{
  +[UITraitCollection _systemTraitTokensAffectingImageLookupSet]();
  id v0 = (void (*)(void, void, void))[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:_UITraitTokenSetCount((uint64_t)qword_1EB261398)];
  v1[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v1[1] = (void (*)(void, void, void))3221225472;
  v1[2] = (void (*)(void, void, void))__59__UITraitCollection__systemTraitTokensAffectingImageLookup__block_invoke_2;
  v1[3] = (void (*)(void, void, void))&unk_1E52F2E58;
  v1[4] = v0;
  _UITraitTokenSetEnumerate(qword_1EB261398, v1);
  qword_1EB261050 = (uint64_t)v0;
}

+ (void)_systemTraitTokensAffectingImageLookupSet
{
  self;
  if (_systemTraitTokensAffectingImageLookupSet_onceToken != -1)
  {
    dispatch_once(&_systemTraitTokensAffectingImageLookupSet_onceToken, &__block_literal_global_71_4);
  }
}

- (NSSet)changedTraitsFromTraitCollection:(UITraitCollection *)traitCollection
{
  memset(v8, 0, 40);
  [(UITraitCollection *)(uint64_t)self _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  if (v8[0].i64[0]) {
    id v4 = -[_UIFastIndexSet count]((int8x16_t *)v8[0].i64[0]);
  }
  else {
    id v4 = (int8x16_t *)vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v8 + 8))))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)&v8[1] + 8))))));
  }
  uint64_t v5 = (void (*)(void, void, void))[v3 arrayWithCapacity:v4];
  v7[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void, void))3221225472;
  void v7[2] = (void (*)(void, void, void))__54__UITraitCollection_changedTraitsFromTraitCollection___block_invoke;
  long long v7[3] = (void (*)(void, void, void))&unk_1E52F2E58;
  v7[4] = v5;
  _UITraitTokenSetEnumerate(v8[0].i64, v7);
  if (v8[0].i64[0]) {

  }
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:_UITraitsForTraitTokens(v5)];
}

+ (UITraitCollection)traitCollectionWithTraitsFromCollections:(NSArray *)traitCollections
{
  if ([(NSArray *)traitCollections count] == 1)
  {
    return (UITraitCollection *)[(NSArray *)traitCollections lastObject];
  }
  else
  {
    uint64_t v7 = [UITraitCollection alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke;
    int8x16_t v8[3] = &unk_1E52F2BB0;
    v8[5] = a1;
    void v8[6] = a2;
    v8[4] = traitCollections;
    return (UITraitCollection *)-[UITraitCollection _initWithTraitMutations:]((char *)v7, (uint64_t)v8);
  }
}

void __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke(uint64_t *a1)
{
  uint64_t v2 = -[UITraitCollection _specifiedTraitTokensLocked](a1[4]);
  uint64_t v3 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a1[5]);
  v8[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v8[1] = (void (*)(void, void, void))3221225472;
  v8[2] = (void (*)(void, void, void))__109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2;
  int8x16_t v8[3] = (void (*)(void, void, void))&unk_1E52F2A48;
  long long v9 = *((_OWORD *)a1 + 2);
  uint64_t v10 = a1[6];
  uint64_t v11 = v2;
  _UITraitTokenSetEnumerate(v3, v8);
  uint64_t v4 = a1[6];
  if (*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    uint64_t v5 = *(void **)(a1[4] + 224);
    if (v5)
    {
      uint64_t v6 = a1[5];
      if (*(void *)(v6 + 224))
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        void v7[2] = __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3;
        long long v7[3] = &unk_1E52F2A70;
        v7[4] = v6;
        void v7[5] = v4;
        [v5 enumerateKeysAndObjectsUsingBlock:v7];
      }
    }
  }
}

void __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke(uint64_t *a1)
{
  uint64_t v2 = -[UITraitCollection _specifiedTraitTokensLocked](a1[4]);
  uint64_t v3 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a1[5]);
  v7[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v7[1] = (void (*)(void, void, void))3221225472;
  void v7[2] = (void (*)(void, void, void))__97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_2;
  long long v7[3] = (void (*)(void, void, void))&unk_1E52F2A48;
  long long v8 = *((_OWORD *)a1 + 2);
  uint64_t v9 = a1[6];
  uint64_t v10 = v2;
  _UITraitTokenSetEnumerate(v3, v7);
  uint64_t v4 = a1[6];
  if (*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    uint64_t v5 = *(void **)(a1[5] + 224);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3;
      _OWORD v6[3] = &unk_1E52F2A70;
      v6[4] = a1[4];
      void v6[5] = v4;
      [v5 enumerateKeysAndObjectsUsingBlock:v6];
    }
  }
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_3(uint64_t a1, uint64_t a2, void (*a3)(void, void, void))
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 72));
    [v12 raise:v13, @"Arguments to %@ must all be of type %@", v14, NSStringFromClass(*(Class *)(a1 + 32)) format];
  }
  uint64_t v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokensLocked](a2);
  v16[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v16[1] = (void (*)(void, void, void))3221225472;
  v16[2] = (void (*)(void, void, void))__62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_4;
  v16[3] = (void (*)(void, void, void))&unk_1E52F2698;
  uint64_t v7 = *(void (**)(void, void, void))(a1 + 40);
  v16[4] = (void (*)(void, void, void))a2;
  v16[5] = v7;
  v16[6] = a3;
  _UITraitTokenSetEnumerate(v6, v16);
  long long v8 = *(void **)(a2 + 224);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_5;
  v15[3] = &unk_1E52F2B10;
  v15[4] = *(void *)(a1 + 48);
  uint64_t result = [v8 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v10 + 40)) {
    *(void *)(v10 + 40) = *(void *)(a2 + 240);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(void *)(v11 + 40)) {
    *(void *)(v11 + 40) = *(void *)(a2 + 232);
  }
  return result;
}

- (uint64_t)_specifiedTraitTokensLocked
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 288) & 1) == 0)
    {
      [(UITraitCollection *)(void *)result _computeSpecifiedTraitTokensAcquireLock:(uint64_t)v3];
      long long v2 = v3[1];
      *(_OWORD *)(v1 + 248) = v3[0];
      *(_OWORD *)(v1 + 264) = v2;
      *(void *)(v1 + 280) = v4;
      *(unsigned char *)(v1 + 288) |= 1u;
    }
    return v1 + 248;
  }
  return result;
}

- (void)_computeSpecifiedTraitTokensAcquireLock:(uint64_t)a3@<X8>
{
  *(void *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  TraitCollectionTSD = GetTraitCollectionTSD();
  unint64_t v6 = 0;
  char v18 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  uint64_t v7 = &dword_1E53010A9;
  do
  {
    uint64_t v8 = *(void *)((char *)v7 - 49);
    uint64_t v9 = *(void *)((char *)v7 - 41);
    uint64_t v10 = *(void *)((char *)v7 - 17);
    uint64_t v11 = *(__CFString **)((char *)v7 - 9);
    char v12 = *((unsigned char *)v7 - 1);
    *(_DWORD *)char v26 = *v7;
    *(_DWORD *)&v26[3] = *(int *)((char *)v7 + 3);
    v21[0] = v8;
    v21[1] = v9;
    long long v19 = *(_OWORD *)((char *)v7 - 33);
    long long v22 = v19;
    uint64_t v23 = v10;
    char v24 = v11;
    char v25 = v12;
    uint64_t v13 = -[UITraitCollection _valueForBuiltInTraitWithMetadata:](v3, v21);
    uint64_t v15 = v13;
    if (v12)
    {
      switch(v9)
      {
        case 1:
          uint64_t v11 = (__CFString *)v11->isa;
          if (v13 != v11) {
            goto LABEL_9;
          }
          break;
        case 2:
        case 3:
        case 4:
          uint64_t v11 = (__CFString *)v11->isa;
          goto LABEL_7;
        default:
          unint64_t v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", (void)v19 file lineNumber description];
          uint64_t v11 = 0;
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      if (v11 == v15) {
        goto LABEL_16;
      }
      if (v9 != 1)
      {
LABEL_15:
        _UITraitTokenSetInsert((uint64_t *)a3, v6, v14);
        goto LABEL_16;
      }
LABEL_9:
      if (v10)
      {
        if (((*(uint64_t (**)(uint64_t, __CFString *, __CFString *))(v10 + 16))(v10, v15, v11) & 1) == 0) {
          goto LABEL_15;
        }
      }
      else if (!v15 || !v11 || ([(__CFString *)v15 isEqual:v11] & 1) == 0)
      {
        goto LABEL_15;
      }
    }
LABEL_16:
    v7 += 14;
    ++v6;
  }
  while (v6 != 27);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke;
  void v20[3] = &unk_1E52F2710;
  v20[4] = v3;
  v20[5] = a3;
  if (a2) {
    _UIPerformWithTraitLock((uint64_t)v20);
  }
  else {
    __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke((uint64_t)v20);
  }
  uint64_t result = GetTraitCollectionTSD();
  *((unsigned char *)result + 9) = v18;
  return result;
}

uint64_t __61__UITraitCollection__computeSpecifiedTraitTokensAcquireLock___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v2 = *(void **)(*(void *)(a1 + 32) + 224);
  uint64_t result = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        CFNumberRef v7 = (const __CFNumber *)[(id)_traitTokensByIdentifier objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v6)];
        if (v7)
        {
          uint64_t v22 = 0;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v19 = 0u;
          _UIGetTraitMetadataLocked(v7, 0, (uint64_t)&v19);
          if (!*((void *)&v19 + 1)) {
            goto LABEL_22;
          }
          unint64_t v9 = *(void *)(a1 + 32);
          v17[0] = v19;
          v17[1] = v20;
          v17[2] = v21;
          uint64_t v18 = v22;
          uint64_t v10 = -[UITraitCollection _valueForTraitWithMetadata:](v9, (uint64_t)v17);
          uint64_t v11 = v10;
          uint64_t v12 = *((void *)&v19 + 1);
          uint64_t v13 = (__CFString *)*((void *)&v21 + 1);
          uint64_t v14 = v21;
          if (v22)
          {
            switch(*((void *)&v19 + 1))
            {
              case 1:
                uint64_t v13 = (__CFString *)**((void **)&v21 + 1);
                if (v10 != **((__CFString ***)&v21 + 1)) {
                  goto LABEL_16;
                }
                break;
              case 2:
              case 3:
              case 4:
                uint64_t v13 = (__CFString *)**((void **)&v21 + 1);
                goto LABEL_14;
              default:
                uint64_t v16 = v20;
                uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *((void *)&v21 + 1));
                [v15 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_UITraitWordValue _UITraitDefaultValue(const _UITraitMetadata)"), @"UITrait_Internal.h", 94, @"Data type is unknown for trait %@", v16 file lineNumber description];
                uint64_t v13 = 0;
                goto LABEL_14;
            }
          }
          else
          {
LABEL_14:
            if (v13 == v11) {
              goto LABEL_23;
            }
            if (v12 != 1)
            {
LABEL_22:
              _UITraitTokenSetInsert(*(uint64_t **)(a1 + 40), v19, v8);
              goto LABEL_23;
            }
LABEL_16:
            if (v14)
            {
              if (((*(uint64_t (**)(uint64_t, __CFString *))(v14 + 16))(v14, v11) & 1) == 0) {
                goto LABEL_22;
              }
            }
            else if (!v11 || !v13 || (-[__CFString isEqual:](v11, "isEqual:") & 1) == 0)
            {
              goto LABEL_22;
            }
          }
        }
LABEL_23:
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (UITraitCollection)traitCollectionByModifyingTraits:(UITraitMutations)mutations
{
  if (!mutations) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 418, @"Invalid parameter not satisfying: %@", @"mutations != NULL");
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__UITraitCollection_traitCollectionByModifyingTraits___block_invoke;
  _OWORD v6[3] = &unk_1E52F2670;
  v6[4] = mutations;
  return (UITraitCollection *)-[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](self, (uint64_t)v6);
}

+ (id)_defineCGFloatTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(double)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9
{
  char v15 = 0;
  int v14 = 0;
  v10[0] = a9;
  v10[1] = 2;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = 0;
  *(double *)&void v10[5] = a5;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a8;
  return _UIDefineNewTrait((uint64_t)v10);
}

+ (id)_existingTraitTokenReservingPlaceholderIfNecessaryWithName:(id)a3 identifier:(id)a4
{
  v5[0] = 0;
  v5[1] = 0;
  v5[2] = a3;
  _OWORD v5[3] = a4;
  memset(&v5[4], 0, 24);
  return _UIDefineNewTrait((uint64_t)v5);
}

+ (id)_defineNSIntegerTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(int64_t)a5 affectsColorAppearance:(BOOL)a6 defaultValueRepresentsUnspecified:(BOOL)a7 isPrivate:(BOOL)a8 placeholderToken:(id)a9
{
  char v15 = 0;
  int v14 = 0;
  v10[0] = a9;
  v10[1] = 3;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = 0;
  void v10[5] = a5;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a8;
  return _UIDefineNewTrait((uint64_t)v10);
}

+ (id)_defineObjectTraitWithName:(id)a3 identifier:(id)a4 defaultValue:(id)a5 equalityHandler:(id)a6 affectsColorAppearance:(BOOL)a7 defaultValueRepresentsUnspecified:(BOOL)a8 isPrivate:(BOOL)a9 placeholderToken:(id)a10
{
  char v16 = 0;
  int v15 = 0;
  v11[0] = a10;
  v11[1] = 1;
  v11[2] = a3;
  v11[3] = a4;
  void v11[4] = a6;
  v11[5] = a5;
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a9;
  return _UIDefineNewTrait((uint64_t)v11);
}

- (double)displayCornerRadius
{
  return self->_builtinTraits.displayCornerRadius;
}

- (void)_setEnvironmentWrapper:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    environmentWrapper = self->_environmentWrapper;
    if (environmentWrapper != a3)
    {

      self->_environmentWrapper = a3;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2799, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    CFNumberRef v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setEnvironmentWrapper____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (void)_setTintColor:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    tintColor = self->_tintColor;
    if (tintColor != a3)
    {

      self->_tintColor = (UIColor *)a3;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2762, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    CFNumberRef v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setTintColor____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

+ (const)_traitTokenOrPlaceholderForTrait:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v3 = _UITraitTokenForTraitLocked(0, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (const)_traitTokenForObjectTrait:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v3 = _UITraitTokenForTraitLocked(1, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

- (id)_traitCollectionByReplacingObject:(id)a3 forTraitToken:(id)a4
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  void v7[2] = v11;
  uint64_t v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, (uint64_t)a3, v7);
}

+ (const)_traitTokenForCGFloatTrait:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v3 = _UITraitTokenForTraitLocked(2, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

- (NSString)typesettingLanguage
{
  uint64_t v3 = self;
  return (NSString *)[(UITraitCollection *)self objectForTrait:v3];
}

- (double)_valueForCGFloatTraitToken:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 2uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  uint64_t v6 = v10;
  return COERCE_DOUBLE(-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5));
}

- (CGFloat)valueForCGFloatTrait:(UICGFloatTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  [(UITraitCollection *)self _valueForCGFloatTraitToken:v5];
  return result;
}

- (double)_typesettingLanguageAwareLineHeightRatio
{
  uint64_t v3 = self;
  [(UITraitCollection *)self valueForCGFloatTrait:v3];
  return result;
}

- (int64_t)_backlightLuminance
{
  return self->_builtinTraits.backlightLuminance;
}

- (id)_traitCollectionByReplacingCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  void v7[2] = v11;
  uint64_t v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, *(uint64_t *)&a3, v7);
}

- (void)_themeKey
{
  if (result)
  {
    uint64_t v1 = NSNumber;
    unint64_t v2 = _UIThemeKeyValueFromTraitCollection(result);
    return (void *)[v1 numberWithUnsignedInteger:v2];
  }
  return result;
}

- (int64_t)_focusSystemState
{
  return self->_builtinTraits.focusSystemState;
}

+ (id)_traitCollectionWithFocusSystemState:(int64_t)a3
{
  if (a3 == -1)
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    v7[10] = xmmword_186B9B9B0;
    uint64_t v8 = unk_186B9B9C0;
    long long v10 = xmmword_186B9B9D0;
    uint64_t v11 = -1;
    void v7[6] = xmmword_186B9B970;
    void v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    void v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    int64_t v9 = a3;
    uint64_t v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    CFNumberRef v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)CFNumberRef v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x18uLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
}

+ (id)_traitCollectionWithNSIntegerValue:(int64_t)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 3uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, a3, (uint64_t)v6);
}

+ (id)_traitCollectionWithValue:(uint64_t)a3 forTraitWithMetadata:
{
  self;
  CFNumberRef v5 = (void *)+[UITraitCollection _emptyTraitCollection]();
  long long v6 = *(_OWORD *)(a3 + 16);
  v8[0] = *(_OWORD *)a3;
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a3 + 32);
  uint64_t v9 = *(void *)(a3 + 48);
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](v5, a2, v8);
}

+ (UITraitCollection)traitCollectionWithNSIntegerValue:(NSInteger)value forTrait:(UINSIntegerTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[a1 _traitCollectionWithNSIntegerValue:value forTraitToken:v7];
}

+ (id)_traitCollectionWithInterfaceProtectionState:(int64_t)a3
{
  uint64_t v4 = objc_opt_class();
  return +[UITraitCollection traitCollectionWithNSIntegerValue:a3 forTrait:v4];
}

+ (id)_traitCollectionWithHeadroomUsage:(int64_t)a3
{
  uint64_t v4 = self;
  CFNumberRef v5 = +[UITraitCollection traitCollectionWithNSIntegerValue:a3 forTrait:v4];

  return v5;
}

+ (UITraitCollection)traitCollectionWithObject:(id)object forTrait:(UIObjectTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[a1 _traitCollectionWithObject:object forTraitToken:v7];
}

+ (id)_traitCollectionWithObject:(id)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 1uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, (uint64_t)a3, (uint64_t)v6);
}

- (int64_t)_updateFidelity
{
  uint64_t v3 = self;
  int64_t v4 = [(UITraitCollection *)self valueForNSIntegerTrait:v3];

  return v4;
}

- (NSInteger)valueForNSIntegerTrait:(UINSIntegerTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(3, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _valueForNSIntegerTraitToken:v5];
}

+ (UITraitCollection)traitCollectionWithPreferredContentSizeCategory:(UIContentSizeCategory)preferredContentSizeCategory
{
  LOBYTE(v8[0]) = 0;
  uint64_t v3 = _UIContentSizeCategoryFromStringInternal(preferredContentSizeCategory, v8);
  switch(v3)
  {
    case 0:
      double result = (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
      break;
    case 1:
      if (qword_1EB261278 != -1) {
        dispatch_once(&qword_1EB261278, &__block_literal_global_326);
      }
      double result = (UITraitCollection *)qword_1EB261270;
      break;
    case 2:
      if (qword_1EB261288 != -1) {
        dispatch_once(&qword_1EB261288, &__block_literal_global_330);
      }
      double result = (UITraitCollection *)qword_1EB261280;
      break;
    case 3:
      if (qword_1EB261298 != -1) {
        dispatch_once(&qword_1EB261298, &__block_literal_global_334);
      }
      double result = (UITraitCollection *)qword_1EB261290;
      break;
    case 4:
      if (qword_1EB2612A8 != -1) {
        dispatch_once(&qword_1EB2612A8, &__block_literal_global_338);
      }
      double result = (UITraitCollection *)qword_1EB2612A0;
      break;
    case 5:
      if (qword_1EB2612B8 != -1) {
        dispatch_once(&qword_1EB2612B8, &__block_literal_global_342);
      }
      double result = (UITraitCollection *)qword_1EB2612B0;
      break;
    case 6:
      if (qword_1EB2612C8 != -1) {
        dispatch_once(&qword_1EB2612C8, &__block_literal_global_346);
      }
      double result = (UITraitCollection *)qword_1EB2612C0;
      break;
    case 7:
      if (qword_1EB2612D8 != -1) {
        dispatch_once(&qword_1EB2612D8, &__block_literal_global_350);
      }
      double result = (UITraitCollection *)qword_1EB2612D0;
      break;
    default:
      switch(v3)
      {
        case 65536:
          if (qword_1EB2612E8 != -1) {
            dispatch_once(&qword_1EB2612E8, &__block_literal_global_354_0);
          }
          double result = (UITraitCollection *)qword_1EB2612E0;
          break;
        case 65537:
          if (qword_1EB2612F8 != -1) {
            dispatch_once(&qword_1EB2612F8, &__block_literal_global_358_0);
          }
          double result = (UITraitCollection *)qword_1EB2612F0;
          break;
        case 65538:
          if (qword_1EB261308 != -1) {
            dispatch_once(&qword_1EB261308, &__block_literal_global_362_0);
          }
          double result = (UITraitCollection *)qword_1EB261300;
          break;
        case 65539:
          if (qword_1EB261318 != -1) {
            dispatch_once(&qword_1EB261318, &__block_literal_global_366);
          }
          double result = (UITraitCollection *)qword_1EB261310;
          break;
        case 65540:
          if (qword_1EB261328 != -1) {
            dispatch_once(&qword_1EB261328, &__block_literal_global_370_0);
          }
          double result = (UITraitCollection *)qword_1EB261320;
          break;
        default:
          long long v14 = xmmword_186B9B9B0;
          long long v15 = unk_186B9B9C0;
          long long v16 = xmmword_186B9B9D0;
          uint64_t v17 = -1;
          unint64_t v10 = 0xBFF0000000000000;
          long long v11 = unk_186B9B980;
          long long v12 = xmmword_186B9B990;
          long long v13 = unk_186B9B9A0;
          memset(&v8[2], 0, 48);
          v8[5] = unk_186B9B960;
          v8[0] = _UIBuiltinTraitStorageUnspecified;
          v8[1] = unk_186B9B920;
          uint64_t v9 = v3;
          CFNumberRef v5 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v8, 0, 0, 0);
          uint64_t v7 = (uint64_t *)(v5 + 248);
          long long v6 = (void *)*((void *)v5 + 31);
          if (v6) {

          }
          *((void *)v5 + 35) = 0;
          *(_OWORD *)uint64_t v7 = 0u;
          *(_OWORD *)(v5 + 264) = 0u;
          _UITraitTokenSetInsert(v7, 7uLL, (__n128)0);
          v5[288] |= 1u;
          double result = v5;
          break;
      }
      break;
  }
  return result;
}

- (int64_t)listEnvironment
{
  uint64_t v3 = self;
  return [(UITraitCollection *)self valueForNSIntegerTrait:v3];
}

+ (uint64_t)_traitCollectionWithTintColor:(uint64_t)a1
{
  self;
  if (a2)
  {
    os_unfair_lock_lock(&stru_1EB26104C);
    uint64_t v3 = (void *)qword_1EB261330;
    if (!qword_1EB261330)
    {
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:2];
      qword_1EB261330 = (uint64_t)v3;
    }
    int64_t v4 = (char *)[v3 objectForKey:a2];
    if (!v4)
    {
      int64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, a2, 0, 0);
      [(id)qword_1EB261330 setObject:v4 forKey:a2];
      CFNumberRef v5 = v4;
    }
    os_unfair_lock_unlock(&stru_1EB26104C);
    return (uint64_t)v4;
  }
  else
  {
    return +[UITraitCollection _emptyTraitCollection]();
  }
}

+ (void)_setBackgroundThreadFallbackTraitCollection:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);

  _backgroundThreadFallbackTraitCollection = a2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_backgroundThreadFallbackTraitCollectionLock);
}

- (BOOL)_isLargeContentViewerEnabled
{
  BOOL v3 = +[UILargeContentViewerInteraction isEnabled];
  if (v3) {
    LOBYTE(v3) = (unint64_t)[(UITraitCollection *)self userInterfaceIdiom] < UIUserInterfaceIdiomTV;
  }
  return v3;
}

- (unint64_t)primaryInteractionModel
{
  return self->_builtinTraits.primaryInteractionModel;
}

- (id)_traitCollectionByRemovingEnvironmentWrapper
{
  if (self->_environmentWrapper)
  {
    BOOL v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&self->_builtinTraits, self->_tintColor, self->_clientDefinedTraits, 0);
    _UITraitCollectionWasCopied((unint64_t)self, (unint64_t)v3);
    int64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    set = self->_specifiedTraitTokens.set;
    p_specifiedTraitTokens = &self->_specifiedTraitTokens;
    CFNumberRef v5 = set;
    if (set) {
      long long v8 = v5;
    }
    long long v9 = *(_OWORD *)&p_specifiedTraitTokens->set;
    long long v10 = *(_OWORD *)&p_specifiedTraitTokens->bitSet[1];
    *((void *)v3 + 35) = p_specifiedTraitTokens->bitSet[3];
    *(_OWORD *)(v3 + 248) = v9;
    *(_OWORD *)(v3 + 264) = v10;
    v3[288] |= 1u;
  }
  else
  {
    BOOL v3 = self;
  }
  return v3;
}

- (int64_t)_splitViewControllerContext
{
  return self->_builtinTraits.splitViewControllerContext;
}

+ (NSArray)systemTraitsAffectingColorAppearance
{
  unint64_t v2 = (void *)[a1 _systemTraitTokensAffectingColorAppearance];
  return (NSArray *)_UITraitsForTraitTokens(v2);
}

+ (NSArray)systemTraitsAffectingImageLookup
{
  unint64_t v2 = (void *)[a1 _systemTraitTokensAffectingImageLookup];
  return (NSArray *)_UITraitsForTraitTokens(v2);
}

+ (NSArray)_systemTraitTokensAffectingImageLookup
{
  if (qword_1EB261058 != -1) {
    dispatch_once(&qword_1EB261058, &__block_literal_global_291);
  }
  return (NSArray *)qword_1EB261050;
}

- (BOOL)containsTraitsInCollection:(UITraitCollection *)trait
{
  return -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)self, (uint64_t)trait);
}

- (UITraitCollection)init
{
  unint64_t v2 = (void *)+[UITraitCollection _emptyTraitCollection]();
  return (UITraitCollection *)v2;
}

- (int64_t)_presentationSemanticContext
{
  return self->_builtinTraits.presentationSemanticContext;
}

+ (uint64_t)_performWithCurrentTraitCollection:(uint64_t)a3 usingBlock:
{
  CFNumberRef v5 = self;
  self;
  long long v6 = +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 0, 0);
  if (a2) {
    [v5 _setCurrentTraitCollection:a2];
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  if (a2) {
    return [v5 _setCurrentTraitCollection:v6];
  }
  return result;
}

+ (id)_currentTraitCollection
{
  return +[UITraitCollection _currentTraitCollectionWithFallback:markFallback:]((uint64_t)UITraitCollection, 1, 1);
}

+ (UITraitCollection)traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle
{
  if (userInterfaceStyle)
  {
    if (userInterfaceStyle == UIUserInterfaceStyleDark)
    {
      if (qword_1EB2611B8 != -1) {
        dispatch_once(&qword_1EB2611B8, &__block_literal_global_266);
      }
      return (UITraitCollection *)qword_1EB2611B0;
    }
    else if (userInterfaceStyle == UIUserInterfaceStyleLight)
    {
      if (qword_1EB2611A8 != -1) {
        dispatch_once(&qword_1EB2611A8, &__block_literal_global_262);
      }
      return (UITraitCollection *)qword_1EB2611A0;
    }
    else
    {
      long long v15 = xmmword_186B9B9B0;
      long long v16 = unk_186B9B9C0;
      long long v17 = xmmword_186B9B9D0;
      uint64_t v18 = -1;
      long long v11 = xmmword_186B9B970;
      long long v12 = unk_186B9B980;
      long long v13 = xmmword_186B9B990;
      long long v14 = unk_186B9B9A0;
      memset(&v7[2], 0, 32);
      uint64_t v8 = 0;
      long long v10 = unk_186B9B960;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186B9B920;
      UIUserInterfaceStyle v9 = userInterfaceStyle;
      int64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      long long v6 = (uint64_t *)(v4 + 248);
      CFNumberRef v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v4 + 35) = 0;
      *(_OWORD *)long long v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 1uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
    }
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

+ (UITraitCollection)traitCollectionWithHorizontalSizeClass:(UIUserInterfaceSizeClass)horizontalSizeClass
{
  if (horizontalSizeClass)
  {
    if (horizontalSizeClass == UIUserInterfaceSizeClassRegular)
    {
      if (qword_1EB261178 != -1) {
        dispatch_once(&qword_1EB261178, &__block_literal_global_254);
      }
      return (UITraitCollection *)qword_1EB261170;
    }
    else if (horizontalSizeClass == UIUserInterfaceSizeClassCompact)
    {
      if (qword_1EB261168 != -1) {
        dispatch_once(&qword_1EB261168, &__block_literal_global_250_0);
      }
      return (UITraitCollection *)qword_1EB261160;
    }
    else
    {
      long long v16 = xmmword_186B9B9B0;
      long long v17 = unk_186B9B9C0;
      long long v18 = xmmword_186B9B9D0;
      uint64_t v19 = -1;
      long long v12 = xmmword_186B9B970;
      long long v13 = unk_186B9B980;
      long long v14 = xmmword_186B9B990;
      long long v15 = unk_186B9B9A0;
      void v7[2] = xmmword_186B9B930;
      uint64_t v8 = unk_186B9B940;
      long long v10 = xmmword_186B9B950;
      long long v11 = unk_186B9B960;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186B9B920;
      UIUserInterfaceSizeClass v9 = horizontalSizeClass;
      int64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      long long v6 = (uint64_t *)(v4 + 248);
      CFNumberRef v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v4 + 35) = 0;
      *(_OWORD *)long long v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 4uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
    }
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (NSString)description
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  return (NSString *)-[UITraitCollection _descriptionWithPrivateTraits:]((uint64_t)self, has_internal_diagnostics);
}

char *__42__UITraitCollection__emptyTraitCollection__block_invoke()
{
  uint64_t result = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, 0);
  qword_1EB261338 = (uint64_t)result;
  return result;
}

+ (UITraitCollection)traitCollectionWithUserInterfaceIdiom:(UIUserInterfaceIdiom)idiom
{
  switch(idiom)
  {
    case -1:
      uint64_t result = (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
      break;
    case 0:
      if (qword_1EB261068 != -1) {
        dispatch_once(&qword_1EB261068, &__block_literal_global_192_0);
      }
      uint64_t result = (UITraitCollection *)qword_1EB261060;
      break;
    case 1:
      if (qword_1EB261078 != -1) {
        dispatch_once(&qword_1EB261078, &__block_literal_global_196);
      }
      uint64_t result = (UITraitCollection *)qword_1EB261070;
      break;
    case 2:
      if (qword_1EB261088 != -1) {
        dispatch_once(&qword_1EB261088, &__block_literal_global_200_1);
      }
      uint64_t result = (UITraitCollection *)qword_1EB261080;
      break;
    case 3:
      if (qword_1EB261098 != -1) {
        dispatch_once(&qword_1EB261098, &__block_literal_global_204_0);
      }
      uint64_t result = (UITraitCollection *)qword_1EB261090;
      break;
    case 4:
      if (qword_1EB2610A8 != -1) {
        dispatch_once(&qword_1EB2610A8, &__block_literal_global_208);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610A0;
      break;
    case 5:
      if (qword_1EB2610B8 != -1) {
        dispatch_once(&qword_1EB2610B8, &__block_literal_global_212_1);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610B0;
      break;
    case 6:
      if (qword_1EB2610C8 != -1) {
        dispatch_once(&qword_1EB2610C8, &__block_literal_global_216);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610C0;
      break;
    case 7:
      if (qword_1EB2610D8 != -1) {
        dispatch_once(&qword_1EB2610D8, &__block_literal_global_220_0);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610D0;
      break;
    case 8:
      if (qword_1EB2610E8 != -1) {
        dispatch_once(&qword_1EB2610E8, &__block_literal_global_224);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610E0;
      break;
    case 9:
      if (qword_1EB2610F8 != -1) {
        dispatch_once(&qword_1EB2610F8, &__block_literal_global_228);
      }
      uint64_t result = (UITraitCollection *)qword_1EB2610F0;
      break;
    case 10:
      if (qword_1EB261108 != -1) {
        dispatch_once(&qword_1EB261108, &__block_literal_global_232);
      }
      uint64_t result = (UITraitCollection *)qword_1EB261100;
      break;
    default:
      long long v17 = xmmword_186B9B9B0;
      long long v18 = unk_186B9B9C0;
      long long v19 = xmmword_186B9B9D0;
      uint64_t v20 = -1;
      long long v13 = xmmword_186B9B970;
      long long v14 = unk_186B9B980;
      long long v15 = xmmword_186B9B990;
      long long v16 = unk_186B9B9A0;
      long long v9 = xmmword_186B9B930;
      long long v10 = unk_186B9B940;
      long long v11 = xmmword_186B9B950;
      long long v12 = unk_186B9B960;
      v7[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
      long long v8 = unk_186B9B920;
      v7[0] = idiom;
      int64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      long long v6 = (uint64_t *)(v4 + 248);
      CFNumberRef v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v4 + 35) = 0;
      *(_OWORD *)long long v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 0, (__n128)0);
      v4[288] |= 1u;
      uint64_t result = v4;
      break;
  }
  return result;
}

uint64_t __62__UITraitCollection_traitCollectionWithTraitsFromCollections___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [(id)_traitTokensByIdentifier objectForKey:a2];
  if (!result)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v7)
    {
      uint64_t result = [v7 objectForKeyedSubscript:a2];
      if (!result)
      {
        long long v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        return [v8 setObject:a3 forKeyedSubscript:a2];
      }
    }
    else
    {
      uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a3, a2, 0);
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    }
  }
  return result;
}

+ (void)initialize
{
  if (self == a1)
  {
    _UIInitializeBuiltInTraits();
  }
}

- (id)_namedImageDescription
{
  uint64_t v9 = 0;
  double v10 = 0.0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = -1;
  +[_UIAssetManager _convertTraitCollection:toCUIScale:CUIIdiom:UIKitIdiom:UIKitUserInterfaceStyle:subtype:CUIDisplayGamut:UIKitLayoutDirection:CUILayoutDirection:]((uint64_t)_UIAssetManager, self, &v10, &v9, 0, 0, &v7, &v8, &v6, &v5);
  id v3 = objc_alloc_init(MEMORY[0x1E4F5E060]);
  [v3 setScale:v10];
  [v3 setDisplayGamut:v8];
  [v3 setIdiom:v9];
  [v3 setSubtype:v7];
  objc_msgSend(v3, "setSizeClassHorizontal:", -[UITraitCollection horizontalSizeClass](self, "horizontalSizeClass"));
  objc_msgSend(v3, "setSizeClassVertical:", -[UITraitCollection verticalSizeClass](self, "verticalSizeClass"));
  [v3 setLayoutDirection:v5];
  [v3 setAppearanceName:-[UITraitCollection _appearanceName]((__CFString *)self)];
  return v3;
}

- (__CFString)_appearanceName
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [(__CFString *)result userInterfaceStyle];
    uint64_t v3 = [(__CFString *)v1 accessibilityContrast];
    int64_t v4 = @"UIAppearanceLight";
    if (v3 == 1)
    {
      int64_t v4 = @"UIAppearanceHighContrastLight";
      uint64_t v5 = @"UIAppearanceHighContrastDark";
    }
    else
    {
      uint64_t v5 = @"UIAppearanceDark";
    }
    uint64_t v6 = @"UIAppearanceAny";
    if (v3 == 1) {
      uint64_t v6 = @"UIAppearanceHighContrastAny";
    }
    if (v2 != 2) {
      uint64_t v5 = v6;
    }
    if (v2 == 1) {
      return v4;
    }
    else {
      return v5;
    }
  }
  return result;
}

void __80__UITraitCollection__appendClientDefinedTraitsDescription_includePrivateTraits___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFNumberRef v6 = (const __CFNumber *)[(id)_traitTokensByIdentifier objectForKey:a2];
  if (v6)
  {
    uint64_t v12 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    _UIGetTraitMetadataLocked(v6, 0, (uint64_t)&v9);
    if (*(unsigned char *)(a1 + 40) || (v12 & 4) == 0) {
      [*(id *)(a1 + 32) addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ = %@", (void)v10, a3)];
    }
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [NSString stringWithFormat:@"%@ = %@", a2, a3];
    [v7 addObject:v8];
  }
}

void __62__UITraitCollection__systemTraitTokensAffectingImageLookupSet__block_invoke(__n128 a1)
{
  _UITraitTokenSetInsert(qword_1EB261398, 3uLL, a1);
  _UITraitTokenSetInsert(qword_1EB261398, 0, v1);
  _UITraitTokenSetInsert(qword_1EB261398, 1uLL, v2);
  _UITraitTokenSetInsert(qword_1EB261398, 8uLL, v3);
  _UITraitTokenSetInsert(qword_1EB261398, 4uLL, v4);
  _UITraitTokenSetInsert(qword_1EB261398, 5uLL, v5);
  _UITraitTokenSetInsert(qword_1EB261398, 2uLL, v6);
  _UITraitTokenSetInsert(qword_1EB261398, 0xBuLL, v7);
  _UITraitTokenSetInsert(qword_1EB261398, 0x11uLL, v8);
  _UITraitTokenSetInsert(qword_1EB261398, 7uLL, v9);
  _UITraitTokenSetInsert(qword_1EB261398, 9uLL, v10);
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceStyle___block_invoke_2()
{
  long long v11 = xmmword_186B9B9B0;
  long long v12 = unk_186B9B9C0;
  long long v13 = xmmword_186B9B9D0;
  uint64_t v14 = -1;
  long long v7 = xmmword_186B9B970;
  long long v8 = unk_186B9B980;
  long long v9 = xmmword_186B9B990;
  long long v10 = unk_186B9B9A0;
  memset(&v3[2], 0, 32);
  uint64_t v4 = 0;
  long long v6 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 2;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611B0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611B0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 1uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611B0 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke_3()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  long long v4 = unk_186B9B920;
  v3[1] = 0x4008000000000000;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261130 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261130;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261130 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  long long v4 = unk_186B9B920;
  v3[1] = 0x3FF0000000000000;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261110 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261110;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261110 + 288) |= 1u;
}

- (BOOL)_containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  BOOL v3 = 1;
  if (a2)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke;
    v10[3] = &unk_1E52F2A98;
    v10[4] = a1;
    void v10[5] = a2;
    void v10[6] = &v11;
    _UIPerformWithTraitLock((uint64_t)v10);
    long long v5 = v12;
    if (*((unsigned char *)v12 + 24))
    {
      long long v6 = *(void **)(a2 + 232);
      if (v6)
      {
        long long v7 = *(void **)(a1 + 232);
        if (v7 != v6)
        {
          if (v7 && (v8 = objc_msgSend(v7, "isEqual:"), long long v5 = v12, v8))
          {
            BOOL v3 = *((unsigned __int8 *)v12 + 24) != 0;
          }
          else
          {
            BOOL v3 = 0;
            *((unsigned char *)v5 + 24) = 0;
          }
        }
      }
    }
    else
    {
      BOOL v3 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  return v3;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_4()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 4;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612A0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612A0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612A0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 0;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261060 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261060;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB261060 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceStyle___block_invoke()
{
  long long v11 = xmmword_186B9B9B0;
  long long v12 = unk_186B9B9C0;
  long long v13 = xmmword_186B9B9D0;
  uint64_t v14 = -1;
  long long v7 = xmmword_186B9B970;
  long long v8 = unk_186B9B980;
  long long v9 = xmmword_186B9B990;
  long long v10 = unk_186B9B9A0;
  memset(&v3[2], 0, 32);
  uint64_t v4 = 0;
  long long v6 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611A0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611A0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 1uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611A0 + 288) |= 1u;
}

void __60__UITraitCollection_traitCollectionWithHorizontalSizeClass___block_invoke()
{
  long long v12 = xmmword_186B9B9B0;
  long long v13 = unk_186B9B9C0;
  long long v14 = xmmword_186B9B9D0;
  uint64_t v15 = -1;
  long long v8 = xmmword_186B9B970;
  long long v9 = unk_186B9B980;
  long long v10 = xmmword_186B9B990;
  long long v11 = unk_186B9B9A0;
  void v3[2] = xmmword_186B9B930;
  uint64_t v4 = unk_186B9B940;
  long long v6 = xmmword_186B9B950;
  long long v7 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261160 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261160;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 4uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261160 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayScale___block_invoke_2()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  long long v4 = unk_186B9B920;
  v3[1] = 0x4000000000000000;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261120 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261120;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 3uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261120 + 288) |= 1u;
}

+ (id)_traitCollectionWithValue:(id)a3 forTraitNamed:(id)a4
{
  id v4 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  v10[10] = xmmword_186B9B9B0;
  memset(&v10[11], 255, 32);
  uint64_t v11 = -1;
  void v10[6] = xmmword_186B9B970;
  void v10[7] = unk_186B9B980;
  v10[8] = xmmword_186B9B990;
  v10[9] = unk_186B9B9A0;
  memset(&v10[2], 0, 48);
  void v10[5] = unk_186B9B960;
  v10[0] = _UIBuiltinTraitStorageUnspecified;
  v10[1] = unk_186B9B920;
  if (@"_UITraitNameTintColor" == a4)
  {
    long long v7 = 0;
    id v6 = a3;
LABEL_9:
    id v4 = 0;
    return -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v10, v6, v7, v4);
  }
  if (@"_UITraitNameEnvironmentWrapper" == a4)
  {
    id v6 = 0;
    goto LABEL_7;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__UITraitCollection__traitCollectionWithValue_forTraitNamed___block_invoke;
  v9[3] = &unk_1E52F2CF0;
  v9[4] = a3;
  v9[5] = a2;
  if ((_UIBuiltinTraitStoragePerformActionWithValueForTraitNamed((uint64_t)v10, (__CFString *)a4, (uint64_t)v9) & 1) == 0)
  {
    id v12 = a4;
    v13[0] = v4;
    long long v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = 0;
  id v4 = 0;
LABEL_7:
  long long v7 = 0;
  return -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v10, v6, v7, v4);
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_9()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 65537;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612F0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612F0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612F0 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_8()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 0x10000;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612E0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612E0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612E0 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_7()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 7;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612D0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612D0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612D0 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_5()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 5;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612B0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612B0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612B0 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_3()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 3;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261290 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261290;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261290 + 288) |= 1u;
}

void __60__UITraitCollection_traitCollectionWithHorizontalSizeClass___block_invoke_2()
{
  long long v12 = xmmword_186B9B9B0;
  long long v13 = unk_186B9B9C0;
  long long v14 = xmmword_186B9B9D0;
  uint64_t v15 = -1;
  long long v8 = xmmword_186B9B970;
  long long v9 = unk_186B9B980;
  long long v10 = xmmword_186B9B990;
  long long v11 = unk_186B9B9A0;
  void v3[2] = xmmword_186B9B930;
  uint64_t v4 = unk_186B9B940;
  long long v6 = xmmword_186B9B950;
  long long v7 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 2;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261170 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261170;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 4uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261170 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_3()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 2;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261080 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261080;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB261080 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_10()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 65538;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261300 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261300;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  __n128 v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261300 + 288) |= 1u;
}

uint64_t __44__UITraitCollection__defaultTraitCollection__block_invoke_2(uint64_t a1, void *a2)
{
  if (dyld_program_sdk_at_least())
  {
    [*(id *)(a1 + 32) scale];
    objc_msgSend(a2, "setDisplayScale:");
  }
  uint64_t v4 = [*(id *)(a1 + 32) gamut];
  return [a2 setDisplayGamut:v4];
}

UITraitCollection *__44__UITraitCollection__defaultTraitCollection__block_invoke()
{
  id v0 = +[UIScreen mainScreen];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__UITraitCollection__defaultTraitCollection__block_invoke_2;
  v2[3] = &unk_1E52F2D18;
  v2[4] = v0;
  uint64_t result = +[UITraitCollection traitCollectionWithTraits:v2];
  qword_1EB261348 = (uint64_t)result;
  return result;
}

+ (uint64_t)_defaultTraitCollection
{
  if (qword_1EB261350 != -1) {
    dispatch_once(&qword_1EB261350, &__block_literal_global_381_0);
  }
  return qword_1EB261348;
}

- (double)_headroomSuppressionLimit
{
  BOOL v3 = self;
  [(UITraitCollection *)self valueForCGFloatTrait:v3];
  double v5 = v4;

  return v5;
}

+ (id)_traitCollectionWithHeadroomSuppressionLimit:(double)a3
{
  double v4 = self;
  double v5 = +[UITraitCollection traitCollectionWithCGFloatValue:v4 forTrait:a3];

  return v5;
}

+ (const)_traitTokenForNSUIntegerTrait:(uint64_t)a1
{
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v3 = _UITraitTokenForTraitLocked(4, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return v3;
}

+ (id)_nameForTrait:(Class)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v4 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  self;
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v6);
  return (id)v7;
}

+ (uint64_t)_nameForTraitToken:(uint64_t)a1
{
  self;
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  _UIGetTraitMetadata(a2, 0, (uint64_t)&v4);
  return v5;
}

+ (id)_identifierForTrait:(Class)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v4 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  self;
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v6);
  return (id)*((void *)&v7 + 1);
}

+ (UITraitCollection)traitCollectionWithCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[a1 _traitCollectionWithCGFloatValue:v7 forTraitToken:value];
}

+ (id)_traitCollectionWithCGFloatValue:(double)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 2uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, *(uint64_t *)&a3, (uint64_t)v6);
}

- (UITraitCollection)traitCollectionByReplacingCGFloatValue:(CGFloat)value forTrait:(UICGFloatTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(2, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[(UITraitCollection *)self _traitCollectionByReplacingCGFloatValue:v7 forTraitToken:value];
}

+ (UITraitCollection)traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(4, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[a1 _traitCollectionWithNSUIntegerValue:a3 forTraitToken:v7];
}

+ (id)_traitCollectionWithNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v8);
  v6[0] = v8;
  v6[1] = v9;
  v6[2] = v10;
  uint64_t v7 = v11;
  return +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, a3, (uint64_t)v6);
}

- (id)traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(4, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _traitCollectionByReplacingNSUIntegerValue:a3 forTraitToken:v7];
}

- (id)_traitCollectionByReplacingNSUIntegerValue:(unint64_t)a3 forTraitToken:(id)a4
{
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a4, 4uLL, (uint64_t)&v9);
  v7[0] = v9;
  v7[1] = v10;
  void v7[2] = v11;
  uint64_t v8 = v12;
  return -[UITraitCollection _traitCollectionByReplacingValue:forTraitWithMetadata:](self, a3, v7);
}

- (unint64_t)valueForNSUIntegerTrait:(Class)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(4, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _valueForNSUIntegerTraitToken:v5];
}

- (unint64_t)_valueForNSUIntegerTraitToken:(id)a3
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)a3, 4uLL, (uint64_t)&v7);
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  uint64_t v6 = v10;
  return (unint64_t)-[UITraitCollection _valueForTraitWithMetadata:]((unint64_t)self, (uint64_t)v5);
}

- (void)setNSUIntegerValue:(unint64_t)a3 forTrait:(Class)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
    CFNumberRef v7 = _UITraitTokenForTraitLocked(4, a4);
    os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
    [(UITraitCollection *)self _setNSUIntegerValue:a3 forTraitToken:v7];
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 582, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setNSUIntegerValue_forTrait____s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v11 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

- (UITraitCollection)traitCollectionByReplacingObject:(id)object forTrait:(UIObjectTrait)trait
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v7 = _UITraitTokenForTraitLocked(1, trait);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return (UITraitCollection *)[(UITraitCollection *)self _traitCollectionByReplacingObject:object forTraitToken:v7];
}

- (id)_traitCollectionByRemovingTrait:(Class)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _traitCollectionByRemovingTraitToken:v5];
}

- (id)traitCollectionByFilteringTraits:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
        CFNumberRef v10 = _UITraitTokenForTraitLocked(0, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
        unint64_t v11 = _UIGetTraitTokenValue(v10);
        _UITraitTokenSetInsert((uint64_t *)v19, v11, v12);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }
  long long v13 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:]((char *)self, (uint64_t *)v19);
  if (*(void *)&v19[0]) {

  }
  return v13;
}

- (id)_traitCollectionByFilteringTraitTokens:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        unint64_t v9 = _UIGetTraitTokenValue(*(const __CFNumber **)(*((void *)&v13 + 1) + 8 * v8));
        _UITraitTokenSetInsert((uint64_t *)v17, v9, v10);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }
  unint64_t v11 = -[UITraitCollection _traitCollectionByFilteringTraitTokenSet:]((char *)self, (uint64_t *)v17);
  if (*(void *)&v17[0]) {

  }
  return v11;
}

- (NSSet)_specifiedTraits
{
  __n128 v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = _UITraitsForTraitTokens([(UITraitCollection *)self _specifiedTraitTokensArray]);
  return (NSSet *)[v2 setWithArray:v3];
}

- (NSArray)_specifiedTraitTokensArray
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = -[UITraitCollection _specifiedTraitTokens]((uint64_t)self);
  uint64_t v5 = (void (*)(void, void, void))[v3 arrayWithCapacity:_UITraitTokenSetCount(v4)];
  uint64_t v6 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens]((uint64_t)self);
  v8[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
  v8[1] = (void (*)(void, void, void))3221225472;
  v8[2] = (void (*)(void, void, void))__47__UITraitCollection__specifiedTraitTokensArray__block_invoke;
  long long v8[3] = (void (*)(void, void, void))&unk_1E52F2E58;
  v8[4] = v5;
  _UITraitTokenSetEnumerate(v6, v8);
  return (NSArray *)v5;
}

uint64_t __47__UITraitCollection__specifiedTraitTokensArray__block_invoke(uint64_t a1, uint64_t a2)
{
  __n128 v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:a2];
  return [v2 addObject:v3];
}

- (BOOL)_isTraitSpecified:(Class)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_UITraitLock);
  CFNumberRef v5 = _UITraitTokenForTraitLocked(0, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_UITraitLock);
  return [(UITraitCollection *)self _isTraitTokenSpecified:v5];
}

- (int64_t)_compare:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 1436, @"Invalid parameter not satisfying: %@", @"[otherTraitCollection isKindOfClass:[UITraitCollection class]]");
  }
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14[4] = &v16;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__UITraitCollection__compare___block_invoke;
  v15[3] = &unk_1E52F2820;
  v15[4] = &v16;
  v13[4] = &v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__UITraitCollection__compare___block_invoke_2;
  _OWORD v14[3] = &unk_1E52F2848;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __30__UITraitCollection__compare___block_invoke_3;
  v13[3] = &unk_1E52F2870;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)a3 + 8, 1, (uint64_t)v15, (uint64_t)v14, (uint64_t)v13);
  NSUInteger v6 = [(NSDictionary *)self->_clientDefinedTraits count];
  uint64_t v7 = [*((id *)a3 + 28) count];
  uint64_t v8 = v17;
  NSUInteger v9 = v17[3] + v6 - v7;
  _OWORD v17[3] = v9;
  if (self->_environmentWrapper) {
    ++v9;
  }
  uint64_t v10 = v9 - (*((void *)a3 + 29) != 0);
  long long v8[3] = v10;
  if (v10 >= 1) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = v10 >> 63;
  }
  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __30__UITraitCollection__compare___block_invoke(uint64_t result, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a3;
  if (*a2 == a5)
  {
    if (v5 == a5) {
      return result;
    }
    uint64_t v6 = -1;
  }
  else
  {
    if (v5 != a5) {
      return result;
    }
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__UITraitCollection__compare___block_invoke_2(uint64_t result, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a3;
  if (*a2 == a5)
  {
    if (v5 == a5) {
      return result;
    }
    uint64_t v6 = -1;
  }
  else
  {
    if (v5 != a5) {
      return result;
    }
    uint64_t v6 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__UITraitCollection__compare___block_invoke_3(uint64_t result, double *a2, double *a3, double a4)
{
  if (*a2 != a4 && *a3 == a4)
  {
    uint64_t v4 = 1;
LABEL_7:
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v4;
    return result;
  }
  if (*a2 == a4 && *a3 != a4)
  {
    uint64_t v4 = -1;
    goto LABEL_7;
  }
  return result;
}

uint64_t __69__UITraitCollection__traitsDescriptionMatching_includePrivateTraits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 lowercaseString];
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 containsString:v4];
}

- (id)_description
{
  return (id)-[UITraitCollection _descriptionWithPrivateTraits:]((uint64_t)self, 1);
}

+ (id)_descriptionForChangeFromTraitCollection:(id)a3 toTraitCollection:(id)a4
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!a3)
  {
    a3 = (id)+[UITraitCollection _emptyTraitCollection]();
    if (a4) {
      goto LABEL_3;
    }
LABEL_13:
    a4 = (id)+[UITraitCollection _emptyTraitCollection]();
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke;
  v21[3] = &unk_1E52F2910;
  v21[4] = v7;
  v19[4] = v7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_2;
  void v20[3] = &unk_1E52F2938;
  v20[4] = v7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  _OWORD v19[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_3;
  v19[3] = &unk_1E52F2960;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)a3 + 8, (uint64_t)a4 + 8, has_internal_diagnostics, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19);
  if (has_internal_diagnostics)
  {
    uint64_t v8 = (void *)*((void *)a3 + 30);
    NSUInteger v9 = (void *)*((void *)a4 + 30);
    if (v8 != v9)
    {
      if (v8 && v9)
      {
        if (objc_msgSend(v8, "isEqual:")) {
          goto LABEL_17;
        }
        uint64_t v8 = (void *)*((void *)a3 + 30);
      }
      if (v8)
      {
        if (*((void *)a4 + 30)) {
          uint64_t v10 = [NSString stringWithFormat:@"_tintColor: %@ → %@", v8, *((void *)a4 + 30)];
        }
        else {
          uint64_t v10 = [NSString stringWithFormat:@"_tintColor: %@ → (unspecified)", v8, v16];
        }
      }
      else
      {
        uint64_t v10 = [NSString stringWithFormat:@"_tintColor: (unspecified) → %@", *((void *)a4 + 30), v16];
      }
      [v7 addObject:v10];
    }
  }
LABEL_17:
  uint64_t v11 = *((void *)a3 + 28);
  uint64_t v12 = *((void *)a4 + 28);
  if (v11 != v12)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    _OWORD v17[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_4;
    _OWORD v17[3] = &unk_1E52F29D0;
    char v18 = has_internal_diagnostics;
    v17[4] = v11;
    v17[5] = v12;
    v17[6] = v7;
    _UIPerformWithTraitLock((uint64_t)v17);
  }
  if (has_internal_diagnostics)
  {
    long long v13 = (void *)*((void *)a3 + 29);
    long long v14 = (void *)*((void *)a4 + 29);
    if (v13 != v14)
    {
      if (v13 && v14)
      {
        if (objc_msgSend(v13, "isEqual:")) {
          goto LABEL_26;
        }
        long long v13 = (void *)*((void *)a3 + 29);
        long long v14 = (void *)*((void *)a4 + 29);
      }
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"_environmentWrapper: %@ → %@", v13, v14)];
    }
  }
LABEL_26:
  if ([v7 count]) {
    return (id)[NSString stringWithFormat:@"{ %@ }", objc_msgSend(v7, "componentsJoinedByString:", @"; "];
  }
  else {
    return @"(no changes)";
  }
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke(uint64_t result, unint64_t *a2, unint64_t *a3, void *a4)
{
  if (*a2 != *a3)
  {
    uint64_t v7 = result;
    uint64_t v8 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@: ", _UIDescriptionForTraitName(a4)];
    NSUInteger v9 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(*a2, a4);
    if (v9) {
      [v8 appendFormat:@"%@", v9];
    }
    else {
      objc_msgSend(v8, "appendFormat:", @"%ld", *a2);
    }
    [v8 appendString:@" → "];
    uint64_t v10 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(*a3, a4);
    if (v10) {
      [v8 appendFormat:@"%@", v10];
    }
    else {
      objc_msgSend(v8, "appendFormat:", @"%ld", *a3);
    }
    uint64_t v11 = *(void **)(v7 + 32);
    return [v11 addObject:v8];
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_2(uint64_t result, void *a2, void *a3, void *a4)
{
  if (*a2 != *a3)
  {
    uint64_t v4 = *(void **)(result + 32);
    uint64_t v5 = [NSString stringWithFormat:@"%@: %ld → %ld", _UIDescriptionForTraitName(a4), *a2, *a3];
    return [v4 addObject:v5];
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_3(uint64_t result, void *a2, void *a3, void *a4)
{
  if (*(double *)a2 != *(double *)a3)
  {
    uint64_t v4 = *(void **)(result + 32);
    uint64_t v5 = [NSString stringWithFormat:@"%@: %g → %g", _UIDescriptionForTraitName(a4), *a2, *a3];
    return [v4 addObject:v5];
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_4(uint64_t a1)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_5;
  v11[3] = &__block_descriptor_33_e18_B16__0__NSString_8l;
  char v12 = *(unsigned char *)(a1 + 56);
  __n128 v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_7;
  long long v7[3] = &unk_1E52F29A8;
  long long v8 = *(_OWORD *)(a1 + 40);
  NSUInteger v9 = v11;
  uint64_t v10 = &__block_literal_global_140;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_8;
  _OWORD v6[3] = &unk_1E52F29A8;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = v4;
  void v6[6] = v11;
  v6[7] = &__block_literal_global_140;
  return [v3 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  CFNumberRef v3 = (const __CFNumber *)[(id)_traitTokensByIdentifier objectForKey:a2];
  if (!v3) {
    return 1;
  }
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadataLocked(v3, 0, (uint64_t)v4);
  return (v5 >> 2) & 1;
}

__CFString *__80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_6(uint64_t a1, uint64_t a2)
{
  CFNumberRef v2 = (const __CFNumber *)[(id)_traitTokensByIdentifier objectForKey:a2];
  if (!v2) {
    return @"(unspecified)";
  }
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  _UIGetTraitMetadataLocked(v2, 0, (uint64_t)v4);
  if ((v5 & 2) != 0) {
    return @"(unspecified)";
  }
  else {
    return @"(defaultValue)";
  }
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) objectForKey:a2];
    if (result)
    {
      uint64_t v7 = result;
      if ((void *)result == a3) {
        return result;
      }
      if (a3)
      {
        uint64_t result = [a3 isEqual:result];
        if (result) {
          return result;
        }
      }
      long long v8 = *(void **)(a1 + 40);
      uint64_t v9 = [NSString stringWithFormat:@"%@: %@ → %@", a2, a3, v7];
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v11 = *(void **)(a1 + 40);
      uint64_t v9 = [NSString stringWithFormat:@"%@: %@ → %@", a2, a3, (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))()];
      uint64_t v10 = v11;
    }
    return [v10 addObject:v9];
  }
  return result;
}

uint64_t __80__UITraitCollection__descriptionForChangeFromTraitCollection_toTraitCollection___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) objectForKey:a2];
    if (!result)
    {
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = [NSString stringWithFormat:@"%@: %@ → %@", a2, (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))(), a3];
      return [v7 addObject:v8];
    }
  }
  return result;
}

- (id)_descriptionForChangeFromTraitCollection:(id)a3
{
  return +[UITraitCollection _descriptionForChangeFromTraitCollection:a3 toTraitCollection:self];
}

- (id)_descriptionForChangeToTraitCollection:(id)a3
{
  return +[UITraitCollection _descriptionForChangeFromTraitCollection:self toTraitCollection:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v17[4] = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__UITraitCollection_encodeWithCoder___block_invoke;
  v18[3] = &unk_1E52F25F8;
  v18[4] = a3;
  v16[4] = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  _OWORD v17[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_2;
  _OWORD v17[3] = &unk_1E52F2620;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_3;
  v16[3] = &unk_1E52F2648;
  v20[4] = v17;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = (uint64_t)___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
  long long v24 = &unk_1E52F2D98;
  long long v25 = v18;
  v19[4] = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
  void v20[3] = &unk_1E52F2DC0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  _OWORD v19[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
  v19[3] = &unk_1E52F2DE8;
  _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)&self->_builtinTraits, (uint64_t)&self->_builtinTraits, 1, (uint64_t)&v21, (uint64_t)v20, (uint64_t)v19);
  tintColor = self->_tintColor;
  if (tintColor) {
    [a3 encodeObject:tintColor forKey:@"UITraitCollectionTintColor"];
  }
  if ([(NSDictionary *)self->_clientDefinedTraits count])
  {
    uint64_t v21 = 0;
    uint64_t v22 = (uint64_t)&v21;
    uint64_t v23 = 0x2020000000;
    LOBYTE(v24) = 0;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSDictionary count](self->_clientDefinedTraits, "count"));
    if (qword_1EB261360 != -1) {
      dispatch_once(&qword_1EB261360, &__block_literal_global_752);
    }
    uint64_t v7 = qword_1EB261358;
    char v8 = [a3 requiresSecureCoding];
    clientDefinedTraits = self->_clientDefinedTraits;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_4;
    _OWORD v14[3] = &unk_1E52F29F8;
    char v15 = v8;
    v14[4] = v7;
    void v14[5] = a3;
    v14[6] = v6;
    v14[7] = &v21;
    [(NSDictionary *)clientDefinedTraits enumerateKeysAndObjectsUsingBlock:v14];
    if ([v6 count]) {
      [a3 encodeObject:v6 forKey:@"UITraitEncodedKeys"];
    }
    uint64_t v10 = self->_clientDefinedTraits;
    if (*(unsigned char *)(v22 + 24))
    {
      uint64_t v10 = (NSDictionary *)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSDictionary count](self->_clientDefinedTraits, "count"));
      uint64_t v11 = self->_clientDefinedTraits;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __37__UITraitCollection_encodeWithCoder___block_invoke_5;
      v12[3] = &unk_1E52F2A20;
      char v13 = v8;
      v12[4] = v7;
      void v12[5] = v10;
      [(NSDictionary *)v11 enumerateKeysAndObjectsUsingBlock:v12];
    }
    [a3 encodeObject:v10 forKey:@"UITraitCollectionClientDefinedTraits"];
    _Block_object_dispose(&v21, 8);
  }
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  if (*a2 != a4)
  {
    uint64_t v5 = *(void **)(result + 32);
    uint64_t v6 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
    return [v5 encodeInteger:v4 forKey:v6];
  }
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_2(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a2;
  if (*a2 != a4)
  {
    uint64_t v5 = *(void **)(result + 32);
    uint64_t v6 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
    return [v5 encodeInteger:v4 forKey:v6];
  }
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_3(uint64_t result, double *a2, uint64_t a3, double a4)
{
  double v4 = *a2;
  if (*a2 != a4)
  {
    uint64_t v5 = *(void **)(result + 32);
    uint64_t v6 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
    return [v5 encodeDouble:v6 forKey:v4];
  }
  return result;
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void **)(a1 + 32);
    while (([v7 containsObject:v6] & 1) == 0)
    {
      uint64_t result = [v6 superclass];
      uint64_t v6 = (void *)result;
      if (!result)
      {
        if (*(unsigned char *)(a1 + 64)) {
          goto LABEL_10;
        }
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t result = objc_opt_respondsToSelector();
    if ((result & 1) == 0)
    {
LABEL_10:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      return result;
    }
  }
  uint64_t v9 = [NSString stringWithFormat:@"UITrait-%@", a2];
  [*(id *)(a1 + 40) encodeObject:a3 forKey:v9];
  uint64_t v10 = *(void **)(a1 + 48);
  return [v10 addObject:v9];
}

uint64_t __37__UITraitCollection_encodeWithCoder___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void **)(a1 + 32);
    while (([v7 containsObject:v6] & 1) == 0)
    {
      uint64_t result = [v6 superclass];
      uint64_t v6 = (void *)result;
      if (!result)
      {
        if (*(unsigned char *)(a1 + 48)) {
          return result;
        }
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t result = objc_opt_respondsToSelector();
    if ((result & 1) == 0) {
      return result;
    }
  }
  uint64_t v9 = *(void **)(a1 + 40);
  return [v9 setObject:a3 forKey:a2];
}

- (UITraitCollection)initWithCoder:(NSCoder *)coder
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)UITraitCollection;
  double v4 = [(UITraitCollection *)&v32 init];
  uint64_t v5 = (UITraitCollection *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 168) = xmmword_186B9B9B0;
    *(_OWORD *)(v4 + 184) = unk_186B9B9C0;
    *(_OWORD *)(v4 + 200) = xmmword_186B9B9D0;
    *(_OWORD *)(v4 + 104) = xmmword_186B9B970;
    *(_OWORD *)(v4 + 120) = unk_186B9B980;
    *(_OWORD *)(v4 + 136) = xmmword_186B9B990;
    *(_OWORD *)(v4 + 152) = unk_186B9B9A0;
    *(_OWORD *)(v4 + 40) = xmmword_186B9B930;
    *(_OWORD *)(v4 + 56) = unk_186B9B940;
    *(_OWORD *)(v4 + 72) = xmmword_186B9B950;
    *(_OWORD *)(v4 + 88) = unk_186B9B960;
    *(_OWORD *)(v4 + 8) = _UIBuiltinTraitStorageUnspecified;
    *((void *)v4 + 27) = -1;
    *(_OWORD *)(v4 + 24) = unk_186B9B920;
    v30[4] = coder;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __35__UITraitCollection_initWithCoder___block_invoke;
    v31[3] = &unk_1E52F25F8;
    v31[4] = coder;
    v29[4] = coder;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __35__UITraitCollection_initWithCoder___block_invoke_2;
    v30[3] = &unk_1E52F2620;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __35__UITraitCollection_initWithCoder___block_invoke_3;
    v29[3] = &unk_1E52F2648;
    v34[4] = v30;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke;
    v35[3] = &unk_1E52F2D98;
    v35[4] = v31;
    v33[4] = v29;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_2;
    v34[3] = &unk_1E52F2DC0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = ___UIBuiltinTraitStorageEnumerateWithBlock_block_invoke_3;
    v33[3] = &unk_1E52F2DE8;
    _UIBuiltinTraitStorageEnumeratePairWithBlock((uint64_t)(v4 + 8), (uint64_t)(v4 + 8), 1, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33);
    v5->_tintColor = (UIColor *)[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"UITraitCollectionTintColor"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0), @"UITraitEncodedKeys");
    if (v10)
    {
      uint64_t v11 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v12 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
        if (qword_1EB261360 != -1) {
          dispatch_once(&qword_1EB261360, &__block_literal_global_752);
        }
        uint64_t v24 = qword_1EB261358;
        BOOL v13 = [(NSCoder *)coder requiresSecureCoding];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v14 = [v11 countByEnumeratingWithState:&v25 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = coder;
          uint64_t v23 = v5;
          uint64_t v17 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v11);
              }
              uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v13) {
                  uint64_t v20 = [(NSCoder *)v16 decodeObjectOfClasses:v24 forKey:v19];
                }
                else {
                  uint64_t v20 = [(NSCoder *)v16 decodeObjectForKey:v19];
                }
                if (v20) {
                  -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v20, objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:options:range:", @"UITrait-", &stru_1ED0E84C0, 8, 0, objc_msgSend(v19, "length")));
                }
              }
            }
            uint64_t v15 = [v11 countByEnumeratingWithState:&v25 objects:v36 count:16];
          }
          while (v15);
          uint64_t v5 = v23;
        }
        goto LABEL_25;
      }
    }
    if (qword_1EB261360 != -1) {
      dispatch_once(&qword_1EB261360, &__block_literal_global_752);
    }
    id v21 = [(NSCoder *)coder decodeObjectOfClasses:qword_1EB261358 forKey:@"UITraitCollectionClientDefinedTraits"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 count])
    {
      char v12 = (NSDictionary *)[v21 copy];
LABEL_25:
      v5->_clientDefinedTraits = v12;
    }
  }
  return v5;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
  uint64_t result = [*(id *)(a1 + 32) containsValueForKey:v5];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) decodeIntegerForKey:v5];
    *a2 = result;
  }
  return result;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
  uint64_t result = [*(id *)(a1 + 32) containsValueForKey:v5];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) decodeIntegerForKey:v5];
    *a2 = result;
  }
  return result;
}

uint64_t __35__UITraitCollection_initWithCoder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [NSString stringWithFormat:@"UITraitCollectionBuiltinTrait-%@", a3];
  uint64_t result = [*(id *)(a1 + 32) containsValueForKey:v5];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) decodeDoubleForKey:v5];
    *a2 = v7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __97__UITraitCollection__containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [(id)_traitTokensByIdentifier objectForKey:a2];
  if (!result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 224) objectForKeyedSubscript:a2];
    if (!result || (uint64_t result = [(id)result isEqual:a3], (result & 1) == 0))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __109__UITraitCollection__matchesIntersectionWithTraitCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [(id)_traitTokensByIdentifier objectForKey:a2];
  if (!result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 224) objectForKeyedSubscript:a2];
    if (result)
    {
      uint64_t result = [a3 isEqual:result];
      if ((result & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)_traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified
{
  __n128 v1 = (void (*)(void, void, void))a1;
  if (a1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x3052000000;
    uint64_t v8 = __Block_byref_object_copy__117;
    uint64_t v9 = __Block_byref_object_dispose__117;
    uint64_t v10 = 0;
    CFNumberRef v2 = (uint64_t *)-[UITraitCollection _specifiedTraitTokens](a1);
    v4[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v4[1] = (void (*)(void, void, void))3221225472;
    v4[2] = (void (*)(void, void, void))__96__UITraitCollection__traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified__block_invoke;
    _OWORD v4[3] = (void (*)(void, void, void))&unk_1E52F2AC0;
    void v4[4] = v1;
    v4[5] = (void (*)(void, void, void))&v5;
    _UITraitTokenSetEnumerate(v2, v4);
    __n128 v1 = (void (*)(void, void, void))v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

void __96__UITraitCollection__traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  _UIGetTraitMetadata((CFNumberRef)[NSNumber numberWithUnsignedInteger:a2], 0, (uint64_t)&v7);
  if (*((void *)&v7 + 1) && (v10 & 2) == 0)
  {
    unint64_t v3 = *(void *)(a1 + 32);
    long long v11 = v7;
    long long v12 = v8;
    long long v13 = v9;
    *(void *)&long long v14 = v10;
    double v4 = -[UITraitCollection _valueForTraitWithMetadata:](v3, (uint64_t)&v11);
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      long long v14 = v7;
      long long v15 = v8;
      long long v16 = v9;
      uint64_t v17 = v10;
      *(void *)&long long v11 = MEMORY[0x1E4F143A8];
      *((void *)&v11 + 1) = 3221225472;
      *(void *)&long long v12 = __75__UITraitCollection__traitCollectionByReplacingValue_forTraitWithMetadata___block_invoke;
      *((void *)&v12 + 1) = &unk_1E52F2CC8;
      *(void *)&long long v13 = v5;
      *((void *)&v13 + 1) = v4;
      id v6 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v5, (uint64_t)&v11);
    }
    else
    {
      long long v11 = v7;
      long long v12 = v8;
      long long v13 = v9;
      *(void *)&long long v14 = v10;
      id v6 = +[UITraitCollection _traitCollectionWithValue:forTraitWithMetadata:]((uint64_t)UITraitCollection, (uint64_t)v4, (uint64_t)&v11);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v6;
  }
}

- (id)_valueForTraitNamed:(id)a3
{
  if (@"_UITraitNameTintColor" == a3) {
    return self->_tintColor;
  }
  if (@"_UITraitNameEnvironmentWrapper" == a3) {
    return self->_environmentWrapper;
  }
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__117;
  long long v12 = __Block_byref_object_dispose__117;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __41__UITraitCollection__valueForTraitNamed___block_invoke;
  long long v7[3] = &unk_1E52F2AE8;
  void v7[4] = &v8;
  if (_UIBuiltinTraitStoragePerformActionWithValueForTraitNamed((uint64_t)&self->_builtinTraits, (__CFString *)a3, (uint64_t)v7))id v5 = (id)v9[5]; {
  else
  }
    id v5 = [(NSDictionary *)self->_clientDefinedTraits objectForKeyedSubscript:a3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void *__41__UITraitCollection__valueForTraitNamed___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return a2;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_2()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261070 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261070;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB261070 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_4()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 3;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261090 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261090;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB261090 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_5()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 4;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610A0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610A0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610A0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_6()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 5;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610B0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610B0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610B0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_7()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 6;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610C0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610C0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610C0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_8()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 7;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610D0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610D0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610D0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_9()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 8;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610E0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610E0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610E0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_10()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 9;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2610F0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2610F0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB2610F0 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceIdiom___block_invoke_11()
{
  long long v13 = xmmword_186B9B9B0;
  long long v14 = unk_186B9B9C0;
  long long v15 = xmmword_186B9B9D0;
  uint64_t v16 = -1;
  long long v9 = xmmword_186B9B970;
  long long v10 = unk_186B9B980;
  long long v11 = xmmword_186B9B990;
  long long v12 = unk_186B9B9A0;
  long long v5 = xmmword_186B9B930;
  long long v6 = unk_186B9B940;
  long long v7 = xmmword_186B9B950;
  long long v8 = unk_186B9B960;
  v3[1] = *((void *)&_UIBuiltinTraitStorageUnspecified + 1);
  long long v4 = unk_186B9B920;
  v3[0] = 10;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261100 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261100;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0, (__n128)0);
  *(unsigned char *)(qword_1EB261100 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithDisplayGamut:(UIDisplayGamut)displayGamut
{
  if (displayGamut == UIDisplayGamutUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (displayGamut == UIDisplayGamutP3)
  {
    if (qword_1EB261158 != -1) {
      dispatch_once(&qword_1EB261158, &__block_literal_global_248);
    }
    return (UITraitCollection *)qword_1EB261150;
  }
  else if (displayGamut)
  {
    long long v18 = xmmword_186B9B9B0;
    long long v19 = unk_186B9B9C0;
    long long v20 = xmmword_186B9B9D0;
    uint64_t v21 = -1;
    long long v14 = xmmword_186B9B970;
    long long v15 = unk_186B9B980;
    long long v16 = xmmword_186B9B990;
    long long v17 = unk_186B9B9A0;
    long long v10 = xmmword_186B9B930;
    long long v11 = unk_186B9B940;
    long long v12 = xmmword_186B9B950;
    long long v13 = unk_186B9B960;
    long long v7 = _UIBuiltinTraitStorageUnspecified;
    uint64_t v9 = unk_186B9B928;
    UIDisplayGamut v8 = displayGamut;
    long long v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    long long v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 8uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1EB261148 != -1) {
      dispatch_once(&qword_1EB261148, &__block_literal_global_244);
    }
    return (UITraitCollection *)qword_1EB261140;
  }
}

void __53__UITraitCollection_traitCollectionWithDisplayGamut___block_invoke()
{
  long long v14 = xmmword_186B9B9B0;
  long long v15 = unk_186B9B9C0;
  long long v16 = xmmword_186B9B9D0;
  uint64_t v17 = -1;
  long long v10 = xmmword_186B9B970;
  long long v11 = unk_186B9B980;
  long long v12 = xmmword_186B9B990;
  long long v13 = unk_186B9B9A0;
  long long v6 = xmmword_186B9B930;
  long long v7 = unk_186B9B940;
  long long v8 = xmmword_186B9B950;
  long long v9 = unk_186B9B960;
  long long v3 = _UIBuiltinTraitStorageUnspecified;
  uint64_t v5 = unk_186B9B928;
  uint64_t v4 = 0;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v3, 0, 0, 0);
  qword_1EB261140 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261140;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 8uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261140 + 288) |= 1u;
}

void __53__UITraitCollection_traitCollectionWithDisplayGamut___block_invoke_2()
{
  long long v14 = xmmword_186B9B9B0;
  long long v15 = unk_186B9B9C0;
  long long v16 = xmmword_186B9B9D0;
  uint64_t v17 = -1;
  long long v10 = xmmword_186B9B970;
  long long v11 = unk_186B9B980;
  long long v12 = xmmword_186B9B990;
  long long v13 = unk_186B9B9A0;
  long long v6 = xmmword_186B9B930;
  long long v7 = unk_186B9B940;
  long long v8 = xmmword_186B9B950;
  long long v9 = unk_186B9B960;
  long long v3 = _UIBuiltinTraitStorageUnspecified;
  uint64_t v5 = unk_186B9B928;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v3, 0, 0, 0);
  qword_1EB261150 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261150;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 8uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261150 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithVerticalSizeClass:(UIUserInterfaceSizeClass)verticalSizeClass
{
  if (verticalSizeClass)
  {
    if (verticalSizeClass == UIUserInterfaceSizeClassRegular)
    {
      if (qword_1EB261198 != -1) {
        dispatch_once(&qword_1EB261198, &__block_literal_global_260);
      }
      return (UITraitCollection *)qword_1EB261190;
    }
    else if (verticalSizeClass == UIUserInterfaceSizeClassCompact)
    {
      if (qword_1EB261188 != -1) {
        dispatch_once(&qword_1EB261188, &__block_literal_global_256);
      }
      return (UITraitCollection *)qword_1EB261180;
    }
    else
    {
      v7[10] = xmmword_186B9B9B0;
      memset(&v7[11], 255, 32);
      uint64_t v8 = -1;
      void v7[6] = xmmword_186B9B970;
      void v7[7] = unk_186B9B980;
      v7[8] = xmmword_186B9B990;
      v7[9] = unk_186B9B9A0;
      memset(&v7[2], 0, 32);
      void v7[5] = unk_186B9B960;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186B9B920;
      void v7[4] = (unint64_t)verticalSizeClass;
      uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      long long v6 = (uint64_t *)(v4 + 248);
      uint64_t v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v4 + 35) = 0;
      *(_OWORD *)long long v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 5uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
    }
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

void __58__UITraitCollection_traitCollectionWithVerticalSizeClass___block_invoke()
{
  v3[10] = xmmword_186B9B9B0;
  memset(&v3[11], 255, 32);
  uint64_t v4 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  v3[9] = unk_186B9B9A0;
  memset(&v3[2], 0, 32);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  _OWORD v3[4] = 1uLL;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261180 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261180;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 5uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261180 + 288) |= 1u;
}

void __58__UITraitCollection_traitCollectionWithVerticalSizeClass___block_invoke_2()
{
  v3[10] = xmmword_186B9B9B0;
  memset(&v3[11], 255, 32);
  uint64_t v4 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  v3[9] = unk_186B9B9A0;
  memset(&v3[2], 0, 32);
  void v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  _OWORD v3[4] = 2uLL;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261190 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261190;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 5uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261190 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithLayoutDirection:(UITraitEnvironmentLayoutDirection)layoutDirection
{
  if (layoutDirection == UITraitEnvironmentLayoutDirectionUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (layoutDirection == UITraitEnvironmentLayoutDirectionRightToLeft)
  {
    if (qword_1EB2611D8 != -1) {
      dispatch_once(&qword_1EB2611D8, &__block_literal_global_272);
    }
    return (UITraitCollection *)qword_1EB2611D0;
  }
  else if (layoutDirection)
  {
    long long v14 = xmmword_186B9B9B0;
    long long v15 = unk_186B9B9C0;
    long long v16 = xmmword_186B9B9D0;
    uint64_t v17 = -1;
    long long v10 = xmmword_186B9B970;
    long long v11 = unk_186B9B980;
    long long v12 = xmmword_186B9B990;
    long long v13 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    uint64_t v9 = unk_186B9B968;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    UITraitEnvironmentLayoutDirection v8 = layoutDirection;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 2uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1EB2611C8 != -1) {
      dispatch_once(&qword_1EB2611C8, &__block_literal_global_268);
    }
    return (UITraitCollection *)qword_1EB2611C0;
  }
}

void __56__UITraitCollection_traitCollectionWithLayoutDirection___block_invoke()
{
  long long v10 = xmmword_186B9B9B0;
  long long v11 = unk_186B9B9C0;
  long long v12 = xmmword_186B9B9D0;
  uint64_t v13 = -1;
  long long v6 = xmmword_186B9B970;
  long long v7 = unk_186B9B980;
  long long v8 = xmmword_186B9B990;
  long long v9 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  uint64_t v5 = unk_186B9B968;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 0;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611C0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611C0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 2uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611C0 + 288) |= 1u;
}

void __56__UITraitCollection_traitCollectionWithLayoutDirection___block_invoke_2()
{
  long long v10 = xmmword_186B9B9B0;
  long long v11 = unk_186B9B9C0;
  long long v12 = xmmword_186B9B9D0;
  uint64_t v13 = -1;
  long long v6 = xmmword_186B9B970;
  long long v7 = unk_186B9B980;
  long long v8 = xmmword_186B9B990;
  long long v9 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  uint64_t v5 = unk_186B9B968;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611D0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611D0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 2uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611D0 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithForceTouchCapability:(UIForceTouchCapability)capability
{
  if (capability)
  {
    if (capability == UIForceTouchCapabilityAvailable)
    {
      if (qword_1EB2611F8 != -1) {
        dispatch_once(&qword_1EB2611F8, &__block_literal_global_278_0);
      }
      return (UITraitCollection *)qword_1EB2611F0;
    }
    else if (capability == UIForceTouchCapabilityUnavailable)
    {
      if (qword_1EB2611E8 != -1) {
        dispatch_once(&qword_1EB2611E8, &__block_literal_global_274);
      }
      return (UITraitCollection *)qword_1EB2611E0;
    }
    else
    {
      long long v14 = xmmword_186B9B9B0;
      long long v15 = unk_186B9B9C0;
      long long v16 = xmmword_186B9B9D0;
      uint64_t v17 = -1;
      long long v10 = xmmword_186B9B970;
      long long v11 = unk_186B9B980;
      long long v12 = xmmword_186B9B990;
      long long v13 = unk_186B9B9A0;
      memset(&v7[2], 0, 48);
      uint64_t v8 = unk_186B9B960;
      v7[0] = _UIBuiltinTraitStorageUnspecified;
      v7[1] = unk_186B9B920;
      UIForceTouchCapability v9 = capability;
      uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
      long long v6 = (uint64_t *)(v4 + 248);
      uint64_t v5 = (void *)*((void *)v4 + 31);
      if (v5) {

      }
      *((void *)v4 + 35) = 0;
      *(_OWORD *)long long v6 = 0u;
      *(_OWORD *)(v4 + 264) = 0u;
      _UITraitTokenSetInsert(v6, 6uLL, (__n128)0);
      v4[288] |= 1u;
      return (UITraitCollection *)v4;
    }
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

void __61__UITraitCollection_traitCollectionWithForceTouchCapability___block_invoke()
{
  long long v10 = xmmword_186B9B9B0;
  long long v11 = unk_186B9B9C0;
  long long v12 = xmmword_186B9B9D0;
  uint64_t v13 = -1;
  long long v6 = xmmword_186B9B970;
  long long v7 = unk_186B9B980;
  long long v8 = xmmword_186B9B990;
  long long v9 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  uint64_t v4 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611E0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611E0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 6uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611E0 + 288) |= 1u;
}

void __61__UITraitCollection_traitCollectionWithForceTouchCapability___block_invoke_2()
{
  long long v10 = xmmword_186B9B9B0;
  long long v11 = unk_186B9B9C0;
  long long v12 = xmmword_186B9B9D0;
  uint64_t v13 = -1;
  long long v6 = xmmword_186B9B970;
  long long v7 = unk_186B9B980;
  long long v8 = xmmword_186B9B990;
  long long v9 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  uint64_t v4 = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 2;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2611F0 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2611F0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 6uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2611F0 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithDisplayCornerRadius:(double)a3
{
  if (a3 == -1.0)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    long long v13 = xmmword_186B9B9B0;
    long long v14 = unk_186B9B9C0;
    long long v15 = xmmword_186B9B9D0;
    uint64_t v16 = -1;
    uint64_t v8 = 0;
    long long v10 = unk_186B9B980;
    long long v11 = xmmword_186B9B990;
    long long v12 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    double v9 = a3;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0x12uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
}

+ (UITraitCollection)traitCollectionWithLegibilityWeight:(UILegibilityWeight)legibilityWeight
{
  if (legibilityWeight == UILegibilityWeightUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (legibilityWeight == UILegibilityWeightBold)
  {
    if (qword_1EB261218 != -1) {
      dispatch_once(&qword_1EB261218, &__block_literal_global_286);
    }
    return (UITraitCollection *)qword_1EB261210;
  }
  else if (legibilityWeight)
  {
    long long v12 = xmmword_186B9B9B0;
    long long v13 = unk_186B9B9C0;
    long long v14 = xmmword_186B9B9D0;
    uint64_t v15 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    uint64_t v9 = unk_186B9B988;
    long long v10 = xmmword_186B9B990;
    long long v11 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    UILegibilityWeight v8 = legibilityWeight;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xBuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1EB261208 != -1) {
      dispatch_once(&qword_1EB261208, &__block_literal_global_282_2);
    }
    return (UITraitCollection *)qword_1EB261200;
  }
}

void __57__UITraitCollection_traitCollectionWithLegibilityWeight___block_invoke()
{
  long long v8 = xmmword_186B9B9B0;
  long long v9 = unk_186B9B9C0;
  long long v10 = xmmword_186B9B9D0;
  uint64_t v11 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  uint64_t v5 = unk_186B9B988;
  long long v6 = xmmword_186B9B990;
  long long v7 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 0;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261200 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261200;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xBuLL, (__n128)0);
  *(unsigned char *)(qword_1EB261200 + 288) |= 1u;
}

void __57__UITraitCollection_traitCollectionWithLegibilityWeight___block_invoke_2()
{
  long long v8 = xmmword_186B9B9B0;
  long long v9 = unk_186B9B9C0;
  long long v10 = xmmword_186B9B9D0;
  uint64_t v11 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  uint64_t v5 = unk_186B9B988;
  long long v6 = xmmword_186B9B990;
  long long v7 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261210 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261210;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xBuLL, (__n128)0);
  *(unsigned char *)(qword_1EB261210 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithActiveAppearance:(UIUserInterfaceActiveAppearance)userInterfaceActiveAppearance
{
  if (userInterfaceActiveAppearance == UIUserInterfaceActiveAppearanceUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (userInterfaceActiveAppearance == UIUserInterfaceActiveAppearanceActive)
  {
    if (qword_1EB261228 != -1) {
      dispatch_once(&qword_1EB261228, &__block_literal_global_288_0);
    }
    return (UITraitCollection *)qword_1EB261220;
  }
  else
  {
    v7[10] = xmmword_186B9B9B0;
    uint64_t v9 = unk_186B9B9C8;
    long long v10 = xmmword_186B9B9D0;
    uint64_t v11 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    UIUserInterfaceActiveAppearance v8 = userInterfaceActiveAppearance;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xCuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
}

void __57__UITraitCollection_traitCollectionWithActiveAppearance___block_invoke()
{
  v3[10] = xmmword_186B9B9B0;
  uint64_t v5 = unk_186B9B9C8;
  long long v6 = xmmword_186B9B9D0;
  uint64_t v7 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  _OWORD v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  v3[9] = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261220 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261220;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xCuLL, (__n128)0);
  *(unsigned char *)(qword_1EB261220 + 288) |= 1u;
}

+ (id)_traitCollectionWithUserInterfaceActiveAppearance:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithActiveAppearance:a3];
}

+ (UITraitCollection)traitCollectionWithAccessibilityContrast:(UIAccessibilityContrast)accessibilityContrast
{
  if (accessibilityContrast == UIAccessibilityContrastUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (accessibilityContrast == UIAccessibilityContrastHigh)
  {
    if (qword_1EB261248 != -1) {
      dispatch_once(&qword_1EB261248, &__block_literal_global_294);
    }
    return (UITraitCollection *)qword_1EB261240;
  }
  else if (accessibilityContrast)
  {
    long long v10 = xmmword_186B9B9B0;
    long long v11 = unk_186B9B9C0;
    long long v12 = xmmword_186B9B9D0;
    uint64_t v13 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    uint64_t v9 = unk_186B9B9A8;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    UIAccessibilityContrast v8 = accessibilityContrast;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 9uLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1EB261238 != -1) {
      dispatch_once(&qword_1EB261238, &__block_literal_global_290_0);
    }
    return (UITraitCollection *)qword_1EB261230;
  }
}

void __62__UITraitCollection_traitCollectionWithAccessibilityContrast___block_invoke()
{
  long long v6 = xmmword_186B9B9B0;
  long long v7 = unk_186B9B9C0;
  long long v8 = xmmword_186B9B9D0;
  uint64_t v9 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  _OWORD v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  uint64_t v5 = unk_186B9B9A8;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 0;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261230 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261230;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 9uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261230 + 288) |= 1u;
}

void __62__UITraitCollection_traitCollectionWithAccessibilityContrast___block_invoke_2()
{
  long long v6 = xmmword_186B9B9B0;
  long long v7 = unk_186B9B9C0;
  long long v8 = xmmword_186B9B9D0;
  uint64_t v9 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  _OWORD v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  uint64_t v5 = unk_186B9B9A8;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261240 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261240;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 9uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261240 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithUserInterfaceLevel:(UIUserInterfaceLevel)userInterfaceLevel
{
  if (userInterfaceLevel == UIUserInterfaceLevelUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else if (userInterfaceLevel == UIUserInterfaceLevelElevated)
  {
    if (qword_1EB261268 != -1) {
      dispatch_once(&qword_1EB261268, &__block_literal_global_300);
    }
    return (UITraitCollection *)qword_1EB261260;
  }
  else if (userInterfaceLevel)
  {
    long long v10 = xmmword_186B9B9B0;
    long long v11 = unk_186B9B9C0;
    long long v12 = xmmword_186B9B9D0;
    uint64_t v13 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    uint64_t v8 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = unk_186B9B920;
    UIUserInterfaceLevel v9 = userInterfaceLevel;
    uint64_t v4 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    long long v6 = (uint64_t *)(v4 + 248);
    uint64_t v5 = (void *)*((void *)v4 + 31);
    if (v5) {

    }
    *((void *)v4 + 35) = 0;
    *(_OWORD *)long long v6 = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    _UITraitTokenSetInsert(v6, 0xAuLL, (__n128)0);
    v4[288] |= 1u;
    return (UITraitCollection *)v4;
  }
  else
  {
    if (qword_1EB261258 != -1) {
      dispatch_once(&qword_1EB261258, &__block_literal_global_296);
    }
    return (UITraitCollection *)qword_1EB261250;
  }
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceLevel___block_invoke()
{
  v3[10] = xmmword_186B9B9B0;
  memset(&v3[11], 255, 32);
  uint64_t v4 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  _OWORD v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  _OWORD v3[9] = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261250 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261250;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xAuLL, (__n128)0);
  *(unsigned char *)(qword_1EB261250 + 288) |= 1u;
}

void __59__UITraitCollection_traitCollectionWithUserInterfaceLevel___block_invoke_2()
{
  long long v6 = xmmword_186B9B9B0;
  long long v7 = unk_186B9B9C0;
  long long v8 = xmmword_186B9B9D0;
  uint64_t v9 = -1;
  _OWORD v3[6] = xmmword_186B9B970;
  _OWORD v3[7] = unk_186B9B980;
  v3[8] = xmmword_186B9B990;
  uint64_t v4 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = unk_186B9B920;
  uint64_t v5 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261260 = (uint64_t)v0;
  __n128 v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261260;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 0xAuLL, (__n128)0);
  *(unsigned char *)(qword_1EB261260 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithTouchLevel:(int64_t)a3
{
  if (a3 == -1)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    long long v18 = xmmword_186B9B9B0;
    long long v19 = unk_186B9B9C0;
    long long v20 = xmmword_186B9B9D0;
    uint64_t v21 = -1;
    long long v14 = xmmword_186B9B970;
    long long v15 = unk_186B9B980;
    long long v16 = xmmword_186B9B990;
    long long v17 = unk_186B9B9A0;
    long long v10 = xmmword_186B9B930;
    long long v11 = unk_186B9B940;
    long long v12 = xmmword_186B9B950;
    long long v13 = unk_186B9B960;
    long long v7 = _UIBuiltinTraitStorageUnspecified;
    uint64_t v8 = -1;
    int64_t v9 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0xEuLL, (__n128)0);
    v3[288] |= 1u;
    return (UITraitCollection *)v3;
  }
}

- (int64_t)touchLevel
{
  return self->_builtinTraits.touchLevel;
}

+ (UITraitCollection)traitCollectionWithInteractionModel:(unint64_t)a3
{
  if (a3)
  {
    v7[10] = xmmword_186B9B9B0;
    memset(&v7[11], 255, 32);
    uint64_t v8 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    _OWORD v7[9] = unk_186B9B9A0;
    memset(&v7[3], 0, 32);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    void v7[2] = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0xFuLL, (__n128)0);
    v3[288] |= 1u;
    return (UITraitCollection *)v3;
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

- (unint64_t)interactionModel
{
  return self->_builtinTraits.interactionModel;
}

+ (UITraitCollection)traitCollectionWithPrimaryInteractionModel:(unint64_t)a3
{
  if (a3)
  {
    long long v17 = xmmword_186B9B9B0;
    long long v18 = unk_186B9B9C0;
    long long v19 = xmmword_186B9B9D0;
    uint64_t v20 = -1;
    long long v13 = xmmword_186B9B970;
    long long v14 = unk_186B9B980;
    long long v15 = xmmword_186B9B990;
    long long v16 = unk_186B9B9A0;
    uint64_t v8 = 0;
    long long v10 = unk_186B9B940;
    long long v11 = xmmword_186B9B950;
    long long v12 = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    unint64_t v9 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x10uLL, (__n128)0);
    v3[288] |= 1u;
    return (UITraitCollection *)v3;
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

+ (UITraitCollection)traitCollectionWithArtworkSubtype:(unint64_t)a3
{
  if (a3)
  {
    long long v16 = xmmword_186B9B9B0;
    long long v17 = unk_186B9B9C0;
    long long v18 = xmmword_186B9B9D0;
    uint64_t v19 = -1;
    long long v12 = xmmword_186B9B970;
    long long v13 = unk_186B9B980;
    long long v14 = xmmword_186B9B990;
    long long v15 = unk_186B9B9A0;
    _OWORD v7[2] = xmmword_186B9B930;
    uint64_t v9 = unk_186B9B948;
    long long v10 = xmmword_186B9B950;
    long long v11 = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    unint64_t v8 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x11uLL, (__n128)0);
    v3[288] |= 1u;
    return (UITraitCollection *)v3;
  }
  else
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
}

+ (id)_traitCollectionWithUserInterfaceRenderingMode:(int64_t)a3
{
  if (a3)
  {
    uint64_t v8 = -1;
    long long v10 = unk_186B9B9C0;
    long long v11 = xmmword_186B9B9D0;
    uint64_t v12 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    v7[8] = xmmword_186B9B990;
    _OWORD v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    int64_t v9 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x17uLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
  else
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
}

- (unint64_t)_semanticContext
{
  if (result)
  {
    unint64_t v1 = result;
    _UIRecordTraitUsage(result, 0x13uLL);
    return *(void *)(v1 + 128);
  }
  return result;
}

+ (id)_traitCollectionWithPresentationSemanticContext:(int64_t)a3
{
  if (a3)
  {
    long long v11 = xmmword_186B9B9B0;
    long long v12 = unk_186B9B9C0;
    long long v13 = xmmword_186B9B9D0;
    uint64_t v14 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    uint64_t v9 = -1;
    long long v10 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    int64_t v8 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x14uLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
  else
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
}

+ (id)_traitCollectionWithSplitViewControllerContext:(int64_t)a3
{
  if (a3 == -1)
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    long long v11 = xmmword_186B9B9B0;
    long long v12 = unk_186B9B9C0;
    long long v13 = xmmword_186B9B9D0;
    uint64_t v14 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    uint64_t v8 = 0;
    long long v10 = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    int64_t v9 = a3;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x15uLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
}

- (unint64_t)_selectionIsKey
{
  if (result)
  {
    unint64_t v1 = result;
    _UIRecordTraitUsage(result, 0x19uLL);
    return *(void *)(v1 + 200);
  }
  return result;
}

+ (id)_traitCollectionWithBacklightLuminance:(int64_t)a3
{
  if (a3 == -1)
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    _OWORD v7[10] = xmmword_186B9B9B0;
    _OWORD v7[11] = unk_186B9B9C0;
    uint64_t v8 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    _OWORD v7[8] = xmmword_186B9B990;
    _OWORD v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    int64_t v9 = a3;
    uint64_t v10 = -1;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x1AuLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
}

+ (UITraitCollection)traitCollectionWithToolbarItemPresentationSize:(UINSToolbarItemPresentationSize)toolbarItemPresentationSize
{
  if (toolbarItemPresentationSize == UINSToolbarItemPresentationSizeUnspecified)
  {
    return (UITraitCollection *)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    _OWORD v7[10] = xmmword_186B9B9B0;
    memset(&v7[11], 255, 32);
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    _OWORD v7[8] = xmmword_186B9B990;
    _OWORD v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    UINSToolbarItemPresentationSize v8 = toolbarItemPresentationSize;
    long long v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0xDuLL, (__n128)0);
    v3[288] |= 1u;
    return (UITraitCollection *)v3;
  }
}

- (UINSToolbarItemPresentationSize)toolbarItemPresentationSize
{
  return self->_builtinTraits.toolbarItemPresentationSize;
}

- (void)setToolbarItemPresentationSize:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    self->_builtinTraits.toolbarItemPresentationSize = a3;
    p_specifiedTraitTokens = (uint16x8_t **)&self->_specifiedTraitTokens;
    if (a3 == -1)
    {
      _UITraitTokenSetRemove(p_specifiedTraitTokens, 0xDuLL, (int8x16_t)v3);
    }
    else
    {
      _UITraitTokenSetInsert((uint64_t *)p_specifiedTraitTokens, 0xDuLL, v3);
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UITraitCollection_NonARC.m", 2598, @"-%@ can only be called from inside a UITraitMutations block", NSStringFromSelector(a2));
  }
  else
  {
    long long v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setToolbarItemPresentationSize____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v9 = NSStringFromSelector(a2);
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "-%@ can only be called from inside a UITraitMutations block", buf, 0xCu);
    }
  }
}

+ (id)_traitCollectionForSidebarAppearance
{
  self;
  long long v11 = xmmword_186B9B9B0;
  long long v12 = unk_186B9B9C0;
  long long v13 = xmmword_186B9B9D0;
  uint64_t v14 = -1;
  void v6[6] = xmmword_186B9B970;
  uint64_t v7 = unk_186B9B980;
  long long v9 = xmmword_186B9B990;
  long long v10 = unk_186B9B9A0;
  memset(&v6[2], 0, 48);
  void v6[5] = unk_186B9B960;
  v6[0] = _UIBuiltinTraitStorageUnspecified;
  v6[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v8 = 2;
  CFNumberRef v2 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v6, 0, 0, 0);
  uint64_t v4 = (uint64_t *)(v2 + 248);
  __n128 v3 = (void *)*((void *)v2 + 31);
  if (v3) {

  }
  *((void *)v2 + 35) = 0;
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  _UITraitTokenSetInsert(v4, 0x13uLL, (__n128)0);
  v2[288] |= 1u;
  return v2;
}

+ (id)_traitCollectionWithVibrancy:(int64_t)a3
{
  if (a3 == -1)
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
  else
  {
    memset(&v7[11], 255, 32);
    uint64_t v8 = -1;
    _OWORD v7[6] = xmmword_186B9B970;
    _OWORD v7[7] = unk_186B9B980;
    _OWORD v7[8] = xmmword_186B9B990;
    _OWORD v7[9] = unk_186B9B9A0;
    memset(&v7[2], 0, 48);
    _OWORD v7[5] = unk_186B9B960;
    v7[0] = _UIBuiltinTraitStorageUnspecified;
    v7[1] = *(_OWORD *)&qword_186B9B920;
    _OWORD v7[10] = (unint64_t)a3;
    __n128 v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v7, 0, 0, 0);
    uint64_t v5 = (uint64_t *)(v3 + 248);
    uint64_t v4 = (void *)*((void *)v3 + 31);
    if (v4) {

    }
    *((void *)v3 + 35) = 0;
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v3 + 264) = 0u;
    _UITraitTokenSetInsert(v5, 0x16uLL, (__n128)0);
    v3[288] |= 1u;
    return v3;
  }
}

+ (id)_traitCollectionWithContrast:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithAccessibilityContrast:a3];
}

+ (id)_traitCollectionWithBackgroundLevel:(int64_t)a3
{
  return +[UITraitCollection traitCollectionWithUserInterfaceLevel:a3];
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v4 = 1;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261270 = (uint64_t)v0;
  unint64_t v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261270;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261270 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_2()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v4 = 2;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261280 = (uint64_t)v0;
  unint64_t v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261280;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261280 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_6()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v4 = 6;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB2612C0 = (uint64_t)v0;
  unint64_t v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB2612C0;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB2612C0 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_11()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v4 = 65539;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261310 = (uint64_t)v0;
  unint64_t v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261310;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261310 + 288) |= 1u;
}

void __69__UITraitCollection_traitCollectionWithPreferredContentSizeCategory___block_invoke_12()
{
  long long v9 = xmmword_186B9B9B0;
  long long v10 = unk_186B9B9C0;
  long long v11 = xmmword_186B9B9D0;
  uint64_t v12 = -1;
  unint64_t v5 = 0xBFF0000000000000;
  long long v6 = unk_186B9B980;
  long long v7 = xmmword_186B9B990;
  long long v8 = unk_186B9B9A0;
  memset(&v3[2], 0, 48);
  _OWORD v3[5] = unk_186B9B960;
  v3[0] = _UIBuiltinTraitStorageUnspecified;
  v3[1] = *(_OWORD *)&qword_186B9B920;
  uint64_t v4 = 65540;
  id v0 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)v3, 0, 0, 0);
  qword_1EB261320 = (uint64_t)v0;
  unint64_t v1 = (void *)*((void *)v0 + 31);
  if (v1)
  {

    id v0 = (char *)qword_1EB261320;
  }
  *(_OWORD *)(v0 + 248) = 0u;
  CFNumberRef v2 = v0 + 248;
  *((void *)v2 + 4) = 0;
  *((_OWORD *)v2 + 1) = 0u;
  _UITraitTokenSetInsert((uint64_t *)v2, 7uLL, (__n128)0);
  *(unsigned char *)(qword_1EB261320 + 288) |= 1u;
}

+ (UITraitCollection)traitCollectionWithTypesettingLanguage:(NSString *)language
{
  uint64_t v4 = self;
  return +[UITraitCollection traitCollectionWithObject:language forTrait:v4];
}

- (void)setTypesettingLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  uint64_t v5 = self;
  [(UITraitCollection *)self setObject:v4 forTrait:v5];
}

+ (id)_traitCollectionWithTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  uint64_t v4 = self;
  return +[UITraitCollection traitCollectionWithCGFloatValue:v4 forTrait:a3];
}

- (void)_setTypesettingLanguageAwareLineHeightRatio:(double)a3
{
  uint64_t v5 = self;
  [(UITraitCollection *)self setCGFloatValue:v5 forTrait:a3];
}

+ (id)_traitCollectionWithEnvironmentWrapper:(id)a3
{
  if (a3)
  {
    __n128 v3 = -[UITraitCollection _initWithBuiltinTraitStorage:tintColor:clientDefinedTraits:environmentWrapper:]([UITraitCollection alloc], (uint64_t)&_UIBuiltinTraitStorageUnspecified, 0, 0, a3);
    return v3;
  }
  else
  {
    return (id)+[UITraitCollection _emptyTraitCollection]();
  }
}

uint64_t __61__UITraitCollection__traitCollectionWithValue_forTraitNamed___block_invoke(uint64_t a1)
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ invoked with non-NSNumber argument (%@) for built-in trait", NSStringFromSelector(*(SEL *)(a1 + 40)), *(void *)(a1 + 32) format];
  }
  return *(void *)(a1 + 32);
}

+ (UITraitCollection)traitCollectionWithImageDynamicRange:(UIImageDynamicRange)imageDynamicRange
{
  uint64_t v4 = self;
  return +[UITraitCollection traitCollectionWithNSIntegerValue:imageDynamicRange forTrait:v4];
}

- (UIImageDynamicRange)imageDynamicRange
{
  uint64_t v3 = self;
  return [(UITraitCollection *)self valueForNSIntegerTrait:v3];
}

- (void)setImageDynamicRange:(int64_t)a3
{
  uint64_t v5 = self;
  [(UITraitCollection *)self setNSIntegerValue:a3 forTrait:v5];
}

+ (UITraitCollection)traitCollectionWithSceneCaptureState:(UISceneCaptureState)sceneCaptureState
{
  uint64_t v4 = self;
  return +[UITraitCollection traitCollectionWithNSIntegerValue:sceneCaptureState forTrait:v4];
}

- (UISceneCaptureState)sceneCaptureState
{
  uint64_t v3 = self;
  return [(UITraitCollection *)self valueForNSIntegerTrait:v3];
}

+ (UITraitCollection)traitCollectionWithListEnvironment:(int64_t)a3
{
  uint64_t v4 = self;
  return +[UITraitCollection traitCollectionWithNSIntegerValue:a3 forTrait:v4];
}

- (void)setListEnvironment:(int64_t)a3
{
  uint64_t v5 = self;
  [(UITraitCollection *)self setNSIntegerValue:a3 forTrait:v5];
}

- (int64_t)_interfaceProtectionState
{
  uint64_t v3 = objc_opt_class();
  return [(UITraitCollection *)self valueForNSIntegerTrait:v3];
}

- (int64_t)_headroomUsage
{
  uint64_t v3 = self;
  int64_t v4 = [(UITraitCollection *)self valueForNSIntegerTrait:v3];

  return v4;
}

@end