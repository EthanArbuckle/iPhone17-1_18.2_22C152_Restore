@interface UIKBTree
+ (BOOL)shouldSkipCacheString:(id)a3;
+ (BOOL)typeIsPersistent:(int)a3;
+ (id)key;
+ (id)keyboard;
+ (id)mergeStringForKeyName:(id)a3;
+ (id)shapesForControlKeyShapes:(id)a3 options:(int)a4;
+ (id)stringForType:(int)a3;
+ (id)treeOfType:(int)a3;
+ (id)uniqueName;
- ($5C396DA91E87D63640AC871340DC94CC)stylingFromVisualStyle;
- ($5C396DA91E87D63640AC871340DC94CC)visualStyling;
- ($5C396DA91E87D63640AC871340DC94CC)visualStylingForScreenTraits:(id)a3;
- (BOOL)BOOLForProperty:(id)a3;
- (BOOL)_needsScaling;
- (BOOL)_renderAsStringKey;
- (BOOL)addMessagesWriteboardKeyOrRomanSwitch:(BOOL)a3;
- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:(BOOL)a3;
- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:(BOOL)a3;
- (BOOL)allowRetestAfterCommittingDownActions;
- (BOOL)allowsDelayedTapForContinuousPathDisambiguation;
- (BOOL)allowsStartingContinuousPath;
- (BOOL)avoidAutoDeactivation;
- (BOOL)avoidsLanguageIndicator;
- (BOOL)behavesAsShiftKey;
- (BOOL)containsDividerVariant;
- (BOOL)containsKeyThatIgnoresHandBias;
- (BOOL)diacriticForwardCompose;
- (BOOL)disabled;
- (BOOL)disablesEdgeSwipe;
- (BOOL)dynamicDisplayTypeHint;
- (BOOL)dynamicLayout;
- (BOOL)forceMultitap;
- (BOOL)ghost;
- (BOOL)hasLayoutTag:(id)a3;
- (BOOL)hasSemiStickyVariant;
- (BOOL)isAlphabeticPlane;
- (BOOL)isDuplicateOfTree:(id)a3;
- (BOOL)isEqualToTree:(id)a3;
- (BOOL)isExemptFromInputManagerHitTesting;
- (BOOL)isExemptFromInputManagerLayout;
- (BOOL)isFloating;
- (BOOL)isGenerated;
- (BOOL)isHashed;
- (BOOL)isKanaPlane;
- (BOOL)isLeafType;
- (BOOL)isLetters;
- (BOOL)isRightToLeftSensitive;
- (BOOL)isSameAsTree:(id)a3;
- (BOOL)isShiftKeyPlaneChooser;
- (BOOL)isShiftKeyplane;
- (BOOL)isSplit;
- (BOOL)looksExactlyLikeShiftAlternate;
- (BOOL)looksLike:(id)a3;
- (BOOL)looksLikeShiftAlternate;
- (BOOL)mergeAsMoreKey;
- (BOOL)modifiesKeyplane;
- (BOOL)noLanguageIndicator;
- (BOOL)notUseCandidateSelection;
- (BOOL)preventPaddle;
- (BOOL)renderKeyInKeyplane:(id)a3;
- (BOOL)setObject:(id)a3 forProperty:(id)a4;
- (BOOL)shouldCacheKey;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)shouldSkipCandidateSelectionForVariants;
- (BOOL)shouldSuppressDragRetest;
- (BOOL)subtreesAreOrdered;
- (BOOL)supportsContinuousPath;
- (BOOL)supportsMultitap;
- (BOOL)supportsSupplementalDisplayString;
- (BOOL)supportsType:(int64_t)a3;
- (BOOL)usesAdaptiveKeys;
- (BOOL)usesAutoShift;
- (BOOL)usesControlKeyAppearance;
- (BOOL)usesKeyCharging;
- (BOOL)visible;
- (CGPoint)navigationPointOfKey;
- (CGRect)_keyplaneFrame;
- (CGRect)_originalKeyplaneFrame;
- (CGRect)frame;
- (CGRect)frameForKeylayoutName:(id)a3;
- (CGRect)keyUnionFrame;
- (CGRect)keyUnionFramePadded:(BOOL)a3;
- (CGRect)keyUnionPaddedFrame;
- (CGRect)originalFrame;
- (CGRect)paddedFrame;
- (NSMutableArray)subtrees;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)properties;
- (NSString)effectiveLayoutTag;
- (NSString)layoutTag;
- (NSString)name;
- (UIKBTree)initWithType:(int)a3;
- (UIKBTree)initWithType:(int)a3 withName:(id)a4 withProperties:(id)a5 withSubtrees:(id)a6 withCache:(id)a7;
- (double)primaryKeylayoutWidthRatio;
- (double)resizingOffset;
- (id)_cacheRootNameForKey:(id)a3;
- (id)_horizontallyCoincidentKeysWithKey:(id)a3;
- (id)_keysForDynamicRow;
- (id)_keysForDynamicRows:(id)a3;
- (id)activeGeometriesList;
- (id)activeShapesFromOutputShapes:(id)a3 inputShapes:(id)a4 inRTL:(BOOL)a5;
- (id)alternateKeyplaneName;
- (id)attributeSet:(BOOL)a3;
- (id)autolocalizedKeyCacheIterator;
- (id)cacheDisplayString;
- (id)cacheSecondaryDisplayString;
- (id)cachedGestureLayout;
- (id)cachedKeysByKeyName:(id)a3;
- (id)componentName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayImage;
- (id)displayString;
- (id)findLeftMoreKey;
- (id)firstCachedKeyWithName:(id)a3;
- (id)firstKeyplaneSwitchKey;
- (id)fullRepresentedString;
- (id)geometries;
- (id)geometriesList;
- (id)geometriesOrderedByPosition;
- (id)geometry;
- (id)geometrySet:(BOOL)a3;
- (id)gestureKey;
- (id)gestureKeyplaneName;
- (id)highlightedVariantsList;
- (id)keyAttributes;
- (id)keyByKeyName:(id)a3;
- (id)keyForString:(id)a3;
- (id)keySet;
- (id)keyplaneForKey:(id)a3;
- (id)keyplaneSwitchKeys;
- (id)keyplaneSwitchKeysWithoutCurrentKeyplane:(id)a3;
- (id)keys;
- (id)keysByKeyName:(id)a3;
- (id)keysExcludingEmptyKeys;
- (id)keysForDisplayRowAtIndex:(unint64_t)a3;
- (id)keysForMergeConditions;
- (id)keysOrderedByPositionRTL;
- (id)keysOrderedByPositionWithoutZip;
- (id)keysWithInteractionTypes:(id)a3;
- (id)keysWithRepresentedString:(id)a3;
- (id)keysWithString:(id)a3;
- (id)keysetCanContainWriteboardKey;
- (id)layoutName;
- (id)listShapes;
- (id)localizationKey;
- (id)mergeKeyNames:(id)a3 inRightToLeft:(BOOL)a4;
- (id)nameFromAttributes;
- (id)objectForProperty:(id)a3;
- (id)orderedRowsForType:(int64_t)a3;
- (id)overrideDisplayString;
- (id)parentKey;
- (id)recursiveDescription;
- (id)representedString;
- (id)rightSpaceKey;
- (id)rowSet;
- (id)rowSetOfType:(int64_t)a3;
- (id)scriptSwitchKey;
- (id)secondaryDisplayStrings;
- (id)secondaryRepresentedStrings;
- (id)selectedVariantIndices;
- (id)shape;
- (id)shapeFromFrame:(CGRect)a3 leftPadding:(double)a4 rightPadding:(double)a5;
- (id)shapesForKeys:(id)a3;
- (id)shiftAlternateKeyplaneName;
- (id)subtreeWithName:(id)a3;
- (id)subtreeWithName:(id)a3 rows:(id)a4;
- (id)subtreeWithType:(int)a3;
- (id)subtreesWithProperty:(id)a3 value:(id)a4;
- (id)supplementaryKeyList;
- (id)toggleKeysForKeyName:(id)a3;
- (id)unhashedName;
- (id)variantDisplayString;
- (id)variantPopupBias;
- (int)_variantType;
- (int)displayRowHint;
- (int)displayType;
- (int)displayTypeHint;
- (int)dragThreshold;
- (int)indexOfSubtree:(id)a3;
- (int)interactionType;
- (int)rendering;
- (int)splitMode;
- (int)state;
- (int)type;
- (int)variantType;
- (int)visualStyle;
- (int64_t)_keyCountOnNamedRow:(id)a3;
- (int64_t)currentKeyboardType;
- (int64_t)flickDirection;
- (int64_t)intForProperty:(id)a3;
- (int64_t)nativeIdiom;
- (int64_t)popupDirection;
- (int64_t)rowSetType;
- (int64_t)selectedVariantIndex;
- (int64_t)textAlignment;
- (unint64_t)clipCorners;
- (unint64_t)dynamicDisplayCorner;
- (unint64_t)groupNeighbor;
- (unint64_t)numberOfRows;
- (void)_addKeylayoutKeys:(id)a3;
- (void)_mutateKeys:(id)a3 scale:(double)a4 withShapeOperation:(id)a5;
- (void)addRomanSwitchToCachedKeyListWithShape:(id)a3 rendering:(int)a4;
- (void)addWriteboardKeyToCachedKeyListWithShape:(id)a3 rendering:(int)a4;
- (void)addkeyToCachedKeyList:(id)a3;
- (void)applyDynamicAttributes;
- (void)cacheKey:(id)a3;
- (void)cacheNativeIdiomIfNecessaryForScreenTraits:(id)a3;
- (void)centerHorizontallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5;
- (void)centerKeyplaneInRect:(CGRect)a3 scale:(double)a4;
- (void)centerKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5;
- (void)centerVerticallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5;
- (void)centerWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5;
- (void)clearManualAddedKey;
- (void)clearTransientCaches;
- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4;
- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4 origin:(CGPoint)a5;
- (void)insertKey:(id)a3 withFrame:(CGRect)a4 andShiftKeys:(id)a5 scale:(double)a6;
- (void)insetKeys:(id)a3 withInsets:(UIEdgeInsets)a4 scale:(double)a5;
- (void)mergeReturnKey:(id)a3 withReturnKey:(id)a4;
- (void)orderVariantKeys:(BOOL)a3;
- (void)precacheLayoutName:(id)a3;
- (void)removeKey:(id)a3;
- (void)removeKey:(id)a3 andShiftKeys:(id)a4 scale:(double)a5;
- (void)removeKeyFromAllCachedLists:(id)a3;
- (void)removeKeyFromCachedKeyList:(id)a3;
- (void)replaceKey:(id)a3 withKey:(id)a4;
- (void)repositionKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5;
- (void)resizeKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5;
- (void)scaleKeys:(id)a3 withFactor:(CGSize)a4 scale:(double)a5;
- (void)setActiveGeometriesList:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCache:(id)a3;
- (void)setCachedGestureLayout:(id)a3;
- (void)setClipCorners:(unint64_t)a3;
- (void)setCurrentKeyboardType:(int64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayImage:(id)a3;
- (void)setDisplayRowHint:(int)a3;
- (void)setDisplayString:(id)a3;
- (void)setDisplayType:(int)a3;
- (void)setDisplayTypeHint:(int)a3;
- (void)setDynamicDisplayCorner:(unint64_t)a3;
- (void)setDynamicLayout:(BOOL)a3;
- (void)setEffectiveLayoutTag:(id)a3;
- (void)setFlickDirection:(int64_t)a3;
- (void)setForceMultitap:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeometriesList:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setGestureKey:(id)a3;
- (void)setGhost:(BOOL)a3;
- (void)setGroupNeighbor:(unint64_t)a3;
- (void)setHighlightedVariantsList:(id)a3;
- (void)setInteractionType:(int)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setIsGenerated:(BOOL)a3;
- (void)setLayoutTag:(id)a3;
- (void)setLayoutTag:(id)a3 passingKeyTest:(id)a4;
- (void)setLocalizationKey:(id)a3;
- (void)setMergeAsMoreKey:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOverrideDisplayString:(id)a3;
- (void)setPaddedFrame:(CGRect)a3;
- (void)setParentKey:(id)a3;
- (void)setPopupDirection:(int64_t)a3;
- (void)setPreventPaddle:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setRendering:(int)a3;
- (void)setRepresentedString:(id)a3;
- (void)setResizingOffset:(double)a3;
- (void)setSecondaryDisplayStrings:(id)a3;
- (void)setSecondaryRepresentedStrings:(id)a3;
- (void)setSelectedVariantIndex:(int64_t)a3;
- (void)setSelectedVariantIndices:(id)a3;
- (void)setShape:(id)a3;
- (void)setSplitMode:(int)a3;
- (void)setState:(int)a3;
- (void)setSubtrees:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setToggleKeys:(id)a3 forKeyName:(id)a4;
- (void)setType:(int)a3;
- (void)setVariantPopupBias:(id)a3;
- (void)setVariantType:(int)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisualStyle:(int)a3;
- (void)setVisualStyling:(id)a3;
- (void)shiftRowAndResizeLeadingControlKey:(id)a3 toSize:(CGSize)a4 scale:(double)a5;
- (void)subsumeDisappearingKeyName:(id)a3 intoKeyName:(id)a4 factors:(id)a5 inRightToLeft:(BOOL)a6;
- (void)swapToggleKeys:(id)a3;
- (void)updateDictationKeyOnNumberPads:(BOOL)a3;
- (void)updateFlickKeycapOnKeys;
- (void)updateKeysForType:(int64_t)a3;
- (void)updateMoreAndInternationalKeysWithOptions:(int)a3;
- (void)updateVariantTypeForActions:(unsigned int)a3;
- (void)zipAttributes;
- (void)zipGeometries:(BOOL)a3 attributes:(BOOL)a4;
- (void)zipGeometrySet;
- (void)zipOnlyGeometrySet;
@end

@implementation UIKBTree

+ (BOOL)typeIsPersistent:(int)a3
{
  return a3 != 14;
}

+ (id)uniqueName
{
  uniqueName_cntr += 3;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", uniqueName_cntr);
}

- (id)nameFromAttributes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(UIKBTree *)self properties];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    v6 = &stru_1ED0E84C0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v8 isEqualToString:@"KBabstract"] & 1) == 0)
        {
          if ((unint64_t)[v8 length] > 5) {
            int v9 = 6;
          }
          else {
            int v9 = [v8 length];
          }
          v10 = NSString;
          v11 = [v8 substringToIndex:v9];
          v12 = [(UIKBTree *)self properties];
          v13 = [v12 objectForKey:v8];
          uint64_t v14 = [v10 stringWithFormat:@"%@_%@%@", v6, v11, v13];

          v6 = (__CFString *)v14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1ED0E84C0;
  }

  return v6;
}

- (id)unhashedName
{
  v2 = [(UIKBTree *)self name];
  uint64_t v3 = nameByRemovingHash(v2);

  return v3;
}

- (id)componentName
{
  v2 = [(UIKBTree *)self name];
  uint64_t v3 = tailComponentOfName(v2);

  return v3;
}

- (BOOL)isHashed
{
  uint64_t v3 = [(UIKBTree *)self name];
  unsigned int v4 = [v3 length];

  uint64_t v5 = v4;
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    v7 = [(UIKBTree *)self name];
    unsigned int v8 = [v7 characterAtIndex:v6] - 48;

    if (v8 > 9) {
      break;
    }
    if (v5 == ++v6) {
      return 0;
    }
  }
  v10 = [(UIKBTree *)self name];
  BOOL v9 = [v10 characterAtIndex:v6] == 95;

  return v9;
}

- (UIKBTree)initWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBTree;
  unsigned int v4 = [(UIKBTree *)&v9 init];
  [(UIKBTree *)v4 setType:v3];
  [(UIKBTree *)v4 setName:0];
  BOOL v5 = [(UIKBTree *)v4 isLeafType];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [(UIKBTree *)v4 setProperties:v6];

  if (v5)
  {
    [(UIKBTree *)v4 setSubtrees:0];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(UIKBTree *)v4 setSubtrees:v7];
  }
  [(UIKBTree *)v4 setCache:0];
  if (v3 == 12) {
    [(UIKBTree *)v4 setLayoutTag:@"Default"];
  }
  return v4;
}

+ (id)treeOfType:(int)a3
{
  uint64_t v3 = [[UIKBTree alloc] initWithType:*(void *)&a3];
  return v3;
}

- (UIKBTree)initWithType:(int)a3 withName:(id)a4 withProperties:(id)a5 withSubtrees:(id)a6 withCache:(id)a7
{
  v12 = (NSString *)a4;
  v13 = (NSMutableDictionary *)a5;
  uint64_t v14 = (NSMutableArray *)a6;
  v15 = (NSMutableDictionary *)a7;
  v25.receiver = self;
  v25.super_class = (Class)UIKBTree;
  v16 = [(UIKBTree *)&v25 init];
  v16->type = a3;
  name = v16->name;
  v16->name = v12;
  long long v18 = v12;

  properties = v16->properties;
  v16->properties = v13;
  long long v20 = v13;

  subtrees = v16->subtrees;
  v16->subtrees = v14;
  uint64_t v22 = v14;

  cache = v16->cache;
  v16->cache = v15;

  if (a3 == 12) {
    [(UIKBTree *)v16 setLayoutTag:@"Default"];
  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = [[UIKBTree alloc] initWithType:[(UIKBTree *)self type]];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(UIKBTree *)self properties];
  v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  [(UIKBTree *)v4 setProperties:v7];

  unsigned int v8 = [(UIKBTree *)self properties];
  objc_super v9 = (void *)[v8 copy];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __25__UIKBTree_copyWithZone___block_invoke;
  v22[3] = &unk_1E52F5318;
  v10 = v4;
  v23 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v22];
  uint64_t v11 = [(UIKBTree *)self subtrees];
  if (v11)
  {
    v12 = (void *)v11;
    BOOL v13 = [(UIKBTree *)self isLeafType];

    if (!v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
      v15 = [(UIKBTree *)self subtrees];
      v16 = [v14 arrayWithArray:v15];
      [(UIKBTree *)v10 setSubtrees:v16];
    }
  }
  long long v17 = NSString;
  long long v18 = +[UIKBTree uniqueName];
  long long v19 = [(UIKBTree *)self name];
  long long v20 = [v17 stringWithFormat:@"%@_%@", v18, v19];
  [(UIKBTree *)v10 setName:v20];

  return v10;
}

void __25__UIKBTree_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = [*(id *)(a1 + 32) properties];
  unsigned int v8 = v7;
  if (isKindOfClass)
  {
    [v7 setObject:v10 forKey:v5];
  }
  else
  {
    uint64_t v9 = [v10 copy];
    [v8 setObject:v9 forKey:v5];

    id v5 = (id)v9;
  }
}

- (BOOL)isSameAsTree:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] != self->type) {
    goto LABEL_37;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->properties count];
  uint64_t v6 = [v4 properties];
  uint64_t v7 = [v6 count];

  if (v5 != v7) {
    goto LABEL_37;
  }
  BOOL v8 = self->subtrees != 0;
  uint64_t v9 = [v4 subtrees];
  char v10 = v8 ^ (v9 != 0);

  if (v10) {
    goto LABEL_37;
  }
  subtrees = self->subtrees;
  if (!subtrees
    || (uint64_t v12 = [(NSMutableArray *)subtrees count],
        [v4 subtrees],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v12 == v14))
  {
    if ([(UIKBTree *)self type] != 7
      || ([(UIKBTree *)self componentName],
          v15 = objc_claimAutoreleasedReturnValue(),
          [v4 componentName],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v15 isEqualToString:v16],
          v16,
          v15,
          v17))
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      obj = self->properties;
      uint64_t v18 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if (([v22 isEqualToString:@"KBabstract"] & 1) == 0)
            {
              v23 = [(NSMutableDictionary *)self->properties objectForKey:v22];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              objc_super v25 = [(NSMutableDictionary *)self->properties objectForKey:v22];
              v26 = [v4 properties];
              v27 = [v26 objectForKey:v22];
              if (isKindOfClass)
              {
                char v28 = [v25 isEqualToString:v27];

                if ((v28 & 1) == 0) {
                  goto LABEL_39;
                }
              }
              else
              {
                int v29 = [v25 isEqual:v27];

                if (!v29) {
                  goto LABEL_39;
                }
              }
            }
          }
          uint64_t v19 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v19);
      }

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      obj = self->subtrees;
      uint64_t v30 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
LABEL_22:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * v33);
          v35 = [v4 subtrees];
          int v17 = [v35 containsObject:v34];

          if (!v17) {
            break;
          }
          if (v31 == ++v33)
          {
            uint64_t v31 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v46 objects:v55 count:16];
            if (v31) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }
        }
      }
      else
      {
LABEL_28:

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        obj = [v4 subtrees];
        uint64_t v36 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v43;
LABEL_30:
          uint64_t v39 = 0;
          while (1)
          {
            if (*(void *)v43 != v38) {
              objc_enumerationMutation(obj);
            }
            if (![(NSMutableArray *)self->subtrees containsObject:*(void *)(*((void *)&v42 + 1) + 8 * v39)])break; {
            if (v37 == ++v39)
            }
            {
              uint64_t v37 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v42 objects:v54 count:16];
              LOBYTE(v17) = 1;
              if (v37) {
                goto LABEL_30;
              }
              goto LABEL_40;
            }
          }
LABEL_39:
          LOBYTE(v17) = 0;
        }
        else
        {
          LOBYTE(v17) = 1;
        }
      }
LABEL_40:
    }
  }
  else
  {
LABEL_37:
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)isEqualToTree:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKBTree *)self isSameAsTree:v4];
  uint64_t v6 = [(UIKBTree *)self name];
  uint64_t v7 = [v4 name];

  LOBYTE(v4) = v5 & [v6 isEqualToString:v7];
  return (char)v4;
}

- (BOOL)isDuplicateOfTree:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKBTree *)self isSameAsTree:v4];
  uint64_t v6 = [(UIKBTree *)self name];
  uint64_t v7 = [v4 name];

  LOBYTE(v4) = v5 & ([v6 isEqualToString:v7] ^ 1);
  return (char)v4;
}

- (NSString)name
{
  if (self->effectiveLayoutTag && self->type == 12)
  {
    v2 = -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
    uint64_t v3 = [v2 name];
  }
  else
  {
    uint64_t v3 = self->name;
  }
  return v3;
}

- (int)type
{
  if (self->effectiveLayoutTag) {
    BOOL v2 = self->type == 12;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2) {
    return self->type;
  }
  id v4 = -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
  int v5 = [v4 type];

  return v5;
}

- (NSMutableDictionary)properties
{
  if (self->effectiveLayoutTag && self->type == 12)
  {
    BOOL v2 = -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
    uint64_t v3 = [v2 properties];
  }
  else
  {
    uint64_t v3 = self->properties;
  }
  return v3;
}

- (BOOL)setObject:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIKBTree.m" lineNumber:267 description:@"property passed in is nil"];
  }
  uint64_t v9 = [(UIKBTree *)self properties];
  char v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:v8];
  }
  else {
    [v9 removeObjectForKey:v8];
  }

  return 1;
}

- (id)objectForProperty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(UIKBTree *)self cache];
    uint64_t v6 = [v5 objectForKey:v4];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [(UIKBTree *)self properties];
      id v8 = [v9 objectForKey:v4];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)intForProperty:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = -[UIKBTree numberForProperty:](self, "numberForProperty:");
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLForProperty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(UIKBTree *)self properties];
    uint64_t v6 = [v5 objectForKey:v4];
    if ([v6 intValue] == 32)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [(UIKBTree *)self cache];
      uint64_t v9 = [v8 objectForKey:v4];
      BOOL v7 = [v9 intValue] == 32;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBTree;
  uint64_t v3 = [(UIKBTree *)&v11 description];
  id v4 = +[UIKBTree stringForType:[(UIKBTree *)self type]];
  int64_t v5 = [(UIKBTree *)self name];
  uint64_t v6 = [(UIKBTree *)self properties];
  uint64_t v7 = [v6 count];
  id v8 = [(UIKBTree *)self subtrees];
  uint64_t v9 = [v3 stringByAppendingFormat:@" - %@/%@: %ld properties + %ld subtrees", v5, v4, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (id)recursiveDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIKBTree *)self description];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) recursiveDescription];
        uint64_t v3 = [NSString stringWithFormat:@"%@: \n\t%@", v9, v10];

        ++v8;
        uint64_t v9 = v3;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)stringForType:(int)a3
{
  if ((a3 - 1) > 0xE) {
    return 0;
  }
  else {
    return off_1E52F5538[a3 - 1];
  }
}

- (id)subtreeWithType:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 type] != a3)
        {
          int v10 = [v9 type];
          if (a3 != 8 || v10 != 12) {
            continue;
          }
        }
        id v11 = v9;
        goto LABEL_14;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v11 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)subtreeWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 lowercaseString];
    uint64_t v7 = tailComponentOfName(v6);

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [(UIKBTree *)self subtrees];
    id v5 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v8);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = [v11 name];
          long long v13 = [v12 lowercaseString];
          long long v14 = tailComponentOfName(v13);

          if ([v14 isEqualToString:v7])
          {
            id v5 = v11;

            goto LABEL_12;
          }
        }
        id v5 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (id)subtreeWithName:(id)a3 rows:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    int v10 = [v6 substringFromIndex:3];
    int v11 = [v10 intValue];

    unsigned int v12 = v11 - 1;
    if (v11 >= 2)
    {
      long long v13 = [v8 objectForKey:@"Row0"];

      uint64_t v14 = 0;
      if (v13) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 - 1;
      }
      do
      {
        long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"Row%ld", ++v14);
        long long v16 = [v8 objectForKey:v15];
        int v17 = v16 == 0;

        v12 -= v17;
      }
      while (v11 - 1 != v14);
    }
    if ((v12 & 0x80000000) == 0)
    {
      long long v18 = [(UIKBTree *)self subtrees];
      unint64_t v19 = [v18 count];

      if (v19 > v12)
      {
        uint64_t v20 = [(UIKBTree *)self subtrees];
        uint64_t v21 = v20;
        uint64_t v22 = v12;
LABEL_13:
        uint64_t v9 = [v20 objectAtIndex:v22];

        goto LABEL_15;
      }
    }
    v23 = [(UIKBTree *)self subtrees];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      uint64_t v20 = [(UIKBTree *)self subtrees];
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      goto LABEL_13;
    }
    uint64_t v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)subtreesWithProperty:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  id v19 = 0;
  if (v6 && v7)
  {
    id v19 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [(UIKBTree *)self subtrees];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v15 = [v14 properties];
          long long v16 = [v15 objectForKey:v6];
          int v17 = [v16 isEqual:v8];

          if (v17) {
            [v19 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }
  }
  return v19;
}

- (int)indexOfSubtree:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(UIKBTree *)self subtrees], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [(UIKBTree *)self subtrees];
    int v7 = [v6 indexOfObject:v4];
  }
  else
  {
    int v7 = -1;
  }

  return v7;
}

- (BOOL)_needsScaling
{
  BOOL v3 = [(UIKBTree *)self isSplit];
  if (v3)
  {
    if ([(UIKBTree *)self isGenerated]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(UIKBTree *)self BOOLForProperty:@"isScaled"];
    }
  }
  return v3;
}

- (void)mergeReturnKey:(id)a3 withReturnKey:(id)a4
{
  id v70 = a3;
  id v5 = a4;
  if ([v70 visible] && objc_msgSend(v5, "visible"))
  {
    [v70 frame];
    double MaxY = CGRectGetMaxY(v72);
    [v5 frame];
    double v7 = CGRectGetMaxY(v73);
    if (MaxY <= v7) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = v70;
    }
    if (MaxY <= v7) {
      uint64_t v9 = v70;
    }
    else {
      uint64_t v9 = v5;
    }
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = +[UIKBShape shape];
    [v10 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [v11 frame];
    v78.origin.x = v21;
    v78.origin.y = v22;
    v78.size.width = v23;
    v78.size.height = v24;
    v74.origin.x = v14;
    v74.origin.y = v16;
    v74.size.width = v18;
    v74.size.height = v20;
    CGRect v75 = CGRectUnion(v74, v78);
    objc_msgSend(v12, "setFrame:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height);
    [v10 paddedFrame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [v11 paddedFrame];
    v79.origin.x = v33;
    v79.origin.y = v34;
    v79.size.width = v35;
    v79.size.height = v36;
    v76.origin.x = v26;
    v76.origin.y = v28;
    v76.size.width = v30;
    v76.size.height = v32;
    CGRect v77 = CGRectUnion(v76, v79);
    objc_msgSend(v12, "setPaddedFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
    [v10 paddedFrame];
    double v38 = v37;
    [v11 paddedFrame];
    double v40 = v38 - v39;
    [v11 paddedFrame];
    double v42 = v41;
    [v10 paddedFrame];
    double v44 = v43;
    [v11 paddedFrame];
    double v46 = v45;
    [v10 paddedFrame];
    if (v42 <= v44)
    {
      if (v46 >= v47)
      {
        [v11 paddedFrame];
        double v55 = v53 + v54;
        [v10 paddedFrame];
        double v58 = v56 + v57;
        [v11 paddedFrame];
        double v61 = v59 + v60;
        [v10 paddedFrame];
        double v64 = v62 + v63;
        if (v55 <= v58)
        {
          if (v61 >= v64)
          {
            uint64_t v49 = 0;
            double v48 = *MEMORY[0x1E4F1DB30];
            double v40 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          }
          else
          {
            [v10 paddedFrame];
            double v67 = v65 + v66;
            [v11 paddedFrame];
            double v48 = v67 - (v68 + v69);
            uint64_t v49 = 2;
          }
        }
        else
        {
          double v48 = v61 - v64;
          uint64_t v49 = 8;
        }
      }
      else
      {
        [v10 paddedFrame];
        double v51 = v50;
        [v11 paddedFrame];
        double v48 = v51 - v52;
        uint64_t v49 = 4;
      }
    }
    else
    {
      double v48 = v46 - v47;
      uint64_t v49 = 1;
    }
    [v12 setConcaveCorner:v49];
    objc_msgSend(v12, "setConcaveCornerOffset:", v48, v40);
    [v11 setShape:v12];
    [v10 setShape:v12];
    [v11 setVisible:0];
  }
}

- (void)updateFlickKeycapOnKeys
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  if ([(UIKBTree *)self isShiftKeyplane])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    if ([v3 isAutoShifted])
    {
      int v4 = 0;
    }
    else
    {
      id v5 = +[UIKeyboardImpl activeInstance];
      int v4 = [v5 isShiftLocked] ^ 1;
    }
  }
  else
  {
    int v4 = 0;
  }
  id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v7 = [v6 preferencesActions];
  if ([v7 BOOLForPreferenceKey:@"GesturesEnabled"]
    && ![(UIKBTree *)self isSplit])
  {
    int v94 = ![(UIKBTree *)self isFloating];
  }
  else
  {
    int v94 = 0;
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = [(UIKBTree *)self subtrees];
  uint64_t v79 = [obj countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v79)
  {
    uint64_t v78 = *(void *)v98;
    if (v4) {
      int v8 = 0;
    }
    else {
      int v8 = 10;
    }
    unsigned int v83 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v98 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = v9;
        id v10 = *(void **)(*((void *)&v97 + 1) + 8 * v9);
        id v11 = [v10 rowSet];
        uint64_t v12 = [v11 subtrees];

        double v13 = [v10 geometrySet:0];
        CGFloat v14 = [v13 subtrees];

        double v15 = [v10 cachedGestureLayout];
        CGFloat v16 = [v15 keySet];
        double v17 = [v16 subtrees];

        CGFloat v18 = [v10 cachedGestureLayout];
        double v19 = [v18 geometrySet:0];
        CGFloat v20 = [v19 subtrees];

        CGFloat v21 = v12;
        CGFloat v22 = [v10 cachedGestureLayout];
        CGFloat v23 = [v22 attributeSet:0];
        CGFloat v24 = [v23 subtrees];

        if ([v12 count])
        {
          unint64_t v25 = 0;
          uint64_t v26 = 0;
          int v91 = 0;
          v86 = v17;
          v87 = v24;
          v88 = v20;
          v82 = v21;
          v85 = v14;
          while (1)
          {
            if (v17 && [v17 count] <= v25) {
              goto LABEL_96;
            }
            double v27 = [v21 objectAtIndex:v26];
            if ([v27 dynamicLayout]) {
              [v27 _keysForDynamicRow];
            }
            else {
              [v27 subtrees];
            }
            CGFloat v28 = v84 = v27;
            if ([v28 count]) {
              break;
            }
LABEL_95:

            ++v25;
            CGFloat v21 = v82;
            uint64_t v26 = ++v91;
            if ([v82 count] <= (unint64_t)v91) {
              goto LABEL_96;
            }
          }
          unint64_t v29 = 0;
          int v30 = 0;
          unint64_t v89 = v25;
          v95 = v28;
          while (2)
          {
            double v31 = [v28 objectAtIndex:v29];
            CGFloat v32 = v31;
            if (!v94) {
              goto LABEL_90;
            }
            if ([v31 displayType] != 7
              || ([v32 supportsSupplementalDisplayString] & 1) != 0)
            {
              if (v17)
              {
                if ([v14 count] <= (unint64_t)v91)
                {
                  CGFloat v33 = 0;
                }
                else
                {
                  CGFloat v33 = [v14 objectAtIndex:v91];
                }
                if ([v17 count] <= v25)
                {
                  v90 = 0;
                }
                else
                {
                  v90 = [v17 objectAtIndex:v25];
                }
                if ([v20 count] <= v25)
                {
                  double v41 = 0;
                }
                else
                {
                  double v41 = [v20 objectAtIndex:v25];
                }
                if ([v24 count] <= v25)
                {
                  v92 = 0;
                }
                else
                {
                  v92 = [v24 objectAtIndex:v25];
                }
                double v42 = [v41 subtrees];
                v93 = v33;
                if ([v42 count] <= (unint64_t)v30)
                {
                  double v44 = 0;
                }
                else
                {
                  double v43 = [v41 subtrees];
                  double v44 = [v43 objectAtIndex:v30];

                  CGFloat v33 = v93;
                }

                double v45 = [v33 subtrees];
                if ([v45 count] <= v29)
                {
                  v96 = 0;
                }
                else
                {
                  double v46 = [v33 subtrees];
                  v96 = [v46 objectAtIndex:v29];

                  CGFloat v33 = v93;
                }

                if (v44)
                {
                  [v44 frame];
                  double MinY = CGRectGetMinY(v107);
                  [v96 frame];
                  if (MinY < CGRectGetMinY(v108))
                  {
                    --v91;
                    int v48 = 7;
                    goto LABEL_86;
                  }
                  uint64_t v49 = (uint64_t)v30 << 32;
                  unint64_t v50 = v30 + 1;
                  int v51 = v30;
                  while (1)
                  {
                    int v30 = v51;
                    [v44 frame];
                    double MinX = CGRectGetMinX(v109);
                    [v96 frame];
                    if (MinX >= CGRectGetMinX(v110)) {
                      break;
                    }
                    double v53 = [v41 subtrees];
                    if ([v53 count] <= v50)
                    {

LABEL_68:
                      double v44 = 0;
                      double v57 = 0;
                      ++v30;
                      goto LABEL_73;
                    }
                    double v54 = [v41 subtrees];
                    uint64_t v55 = [v54 objectAtIndex:v50];

                    v49 += 0x100000000;
                    int v51 = v30 + 1;
                    ++v50;
                    double v44 = (void *)v55;
                    if (!v55) {
                      goto LABEL_68;
                    }
                  }
                  [v44 frame];
                  double v56 = CGRectGetMinX(v111);
                  [v32 frame];
                  if (v56 > CGRectGetMaxX(v112))
                  {

                    double v44 = 0;
                    goto LABEL_66;
                  }
                  double v58 = [v90 subtrees];
                  if ([v58 count] <= (unint64_t)(v49 >> 32))
                  {
                    double v57 = 0;
                  }
                  else
                  {
                    double v59 = [v90 subtrees];
                    double v57 = [v59 objectAtIndex:v49 >> 32];
                  }
                }
                else
                {
LABEL_66:
                  double v57 = 0;
                }
LABEL_73:
                double v60 = [v57 displayString];
                if (v60
                  && ([v32 displayString],
                      double v61 = objc_claimAutoreleasedReturnValue(),
                      char v62 = [v60 isEqualToString:v61],
                      v61,
                      (v62 & 1) == 0))
                {
                  v104 = v60;
                  id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
                  [v32 setSecondaryDisplayStrings:v70];

                  v71 = [v57 representedString];
                  v103 = v71;
                  CGRect v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
                  [v32 setSecondaryRepresentedStrings:v72];

                  [v32 setDisplayTypeHint:10];
                  [v32 setGestureKey:v57];
                  CGRect v73 = [v92 subtrees];
                  if ([v73 count] <= (unint64_t)v30)
                  {
                    [v57 setCache:0];
                  }
                  else
                  {
                    CGRect v74 = [v92 subtrees];
                    CGRect v75 = [v74 objectAtIndex:v30];
                    [v57 setCache:v75];
                  }
                  double v17 = v86;

                  int v48 = 9;
                }
                else
                {
                  double v63 = [v32 displayString];
                  if ([v60 isEqualToString:v63])
                  {
                    int v64 = [v57 displayType];

                    if (v64 == 7)
                    {
                      double v65 = [v57 secondaryDisplayStrings];
                      double v66 = [v65 firstObject];
                      v102 = v66;
                      double v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
                      [v32 setSecondaryDisplayStrings:v67];

                      v81 = [v57 secondaryRepresentedStrings];
                      double v68 = [v81 firstObject];
                      v101 = v68;
                      double v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
                      [v32 setSecondaryRepresentedStrings:v69];

                      [v32 setDisplayTypeHint:10];
                      int v48 = 9;
                      goto LABEL_80;
                    }
                  }
                  else
                  {
                  }
                  int v48 = 0;
LABEL_80:
                  double v17 = v86;
                }
                ++v30;

                CGFloat v33 = v93;
LABEL_86:

                CGFloat v24 = v87;
                if (v48)
                {

                  BOOL v76 = v48 == 9;
                  CGFloat v14 = v85;
                  CGFloat v20 = v88;
                  unint64_t v25 = v89;
                  CGFloat v28 = v95;
                  if (!v76) {
                    goto LABEL_95;
                  }
LABEL_94:
                  if ([v28 count] <= ++v29) {
                    goto LABEL_95;
                  }
                  continue;
                }
                CGFloat v14 = v85;
                CGFloat v20 = v88;
                unint64_t v25 = v89;
              }
LABEL_90:
              if ([v32 displayTypeHint] == 10)
              {
                [v32 setDisplayTypeHint:0];
                if ([v32 displayType] != 7)
                {
                  [v32 setSecondaryDisplayStrings:0];
                  [v32 setSecondaryRepresentedStrings:0];
                  [v32 setGestureKey:0];
                }
              }
LABEL_93:

              CGFloat v28 = v95;
              goto LABEL_94;
            }
            break;
          }
          CGFloat v34 = [v32 secondaryRepresentedStrings];
          if ([v34 count] == 1)
          {
            CGFloat v35 = [v32 representedString];
            CGFloat v36 = [v32 secondaryRepresentedStrings];
            double v37 = [v36 firstObject];
            int v38 = [v35 isEqualToString:v37];

            CGFloat v24 = v87;
            CGFloat v20 = v88;

            if (v38)
            {
              double v39 = v32;
              uint64_t v40 = 0;
LABEL_63:
              [v39 setDisplayTypeHint:v40];
              double v17 = v86;
              unint64_t v25 = v89;
              goto LABEL_93;
            }
          }
          else
          {
          }
          double v39 = v32;
          uint64_t v40 = v83;
          goto LABEL_63;
        }
LABEL_96:

        uint64_t v9 = v80 + 1;
      }
      while (v80 + 1 != v79);
      uint64_t v79 = [obj countByEnumeratingWithState:&v97 objects:v105 count:16];
    }
    while (v79);
  }
}

- (void)zipGeometries:(BOOL)a3 attributes:(BOOL)a4
{
  BOOL v64 = a4;
  BOOL v4 = a3;
  id v5 = self;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C108260](self, a2);
  if ([(UIKBTree *)v5 type] == 2)
  {
    BOOL v63 = [(UIKBTree *)v5 _needsScaling];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v6 = [(UIKBTree *)v5 subtrees];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v13 = *(void *)v66;
      double v54 = v6;
      uint64_t v55 = v5;
      uint64_t v53 = *(void *)v66;
      do
      {
        uint64_t v14 = 0;
        uint64_t v56 = v8;
        do
        {
          if (*(void *)v66 != v13) {
            objc_enumerationMutation(v6);
          }
          double v15 = *(void **)(*((void *)&v65 + 1) + 8 * v14);
          if ([v15 type] == 3)
          {
            uint64_t v57 = v14;
            CGFloat v16 = [v15 rowSet];
            double v17 = [v16 subtrees];

            CGFloat v18 = [v15 geometrySet:0];
            double v61 = [v18 subtrees];

            double v19 = [v15 attributeSet:0];
            CGFloat v20 = [v19 subtrees];

            CGFloat v21 = [v15 shape];
            CGFloat v22 = [v21 originalShape];

            if (v22)
            {
              CGFloat v23 = [v21 originalShape];
              [v15 setShape:v23];
            }
            uint64_t v24 = [v17 count];
            if (v24 == [v61 count])
            {
              [v15 frame];
              v73.origin.CGFloat x = x;
              v73.origin.CGFloat y = y;
              v73.size.double width = width;
              v73.size.CGFloat height = height;
              CGRect v72 = CGRectUnion(v71, v73);
              CGFloat x = v72.origin.x;
              CGFloat y = v72.origin.y;
              double width = v72.size.width;
              CGFloat height = v72.size.height;
              if (v63)
              {
                unint64_t v25 = [v15 shape];
                [v15 frame];
                if (v26 <= width * 0.5) {
                  double v27 = 0.0;
                }
                else {
                  double v27 = width;
                }
                objc_msgSend(v25, "scaleIfNeeded:onlyYAxis:", objc_msgSend(v17, "count") != 0, v27);
              }
              if ([v17 count])
              {
                unint64_t v28 = 0;
                double v59 = v20;
                double v60 = v17;
                double v58 = v21;
                do
                {
                  unint64_t v29 = [v61 objectAtIndex:v28];
                  int v30 = [v17 objectAtIndex:v28];
                  if ([v20 count] <= v28)
                  {
                    double v31 = 0;
                  }
                  else
                  {
                    double v31 = [v20 objectAtIndex:v28];
                  }
                  char v62 = v29;
                  if (v4)
                  {
                    CGFloat v32 = [v29 properties];
                    [v30 setProperties:v32];

                    unint64_t v29 = v62;
                  }
                  CGFloat v33 = [v29 subtrees];
                  CGFloat v34 = [v30 subtrees];
                  if ([v34 count])
                  {
                    unint64_t v35 = 0;
                    while (1)
                    {
                      unint64_t v36 = [v33 count];

                      if (v36 <= v35) {
                        break;
                      }
                      double v37 = [v30 subtrees];
                      int v38 = [v37 objectAtIndex:v35];

                      [v38 setState:0];
                      [v38 setVisible:1];
                      [v38 setClipCorners:0];
                      if (v4)
                      {
                        double v39 = [v33 objectAtIndex:v35];
                        uint64_t v40 = v39;
                        if (v63)
                        {
                          [v39 frame];
                          if (v41 <= width * 0.5) {
                            double v42 = 0.0;
                          }
                          else {
                            double v42 = width;
                          }
                          [v40 scaleIfNeeded:0 onlyYAxis:v42];
                        }
                        double v43 = [v33 objectAtIndex:v35];
                        double v44 = (void *)[v43 copy];
                        [v38 setShape:v44];
                      }
                      if (v64)
                      {
                        double v45 = [v31 subtrees];
                        if ([v45 count] <= v35)
                        {
                          [v38 setCache:0];
                        }
                        else
                        {
                          double v46 = [v31 subtrees];
                          double v47 = [v46 objectAtIndex:v35];
                          [v38 setCache:v47];
                        }
                      }

                      ++v35;
                      CGFloat v34 = [v30 subtrees];
                      if ([v34 count] <= v35) {
                        goto LABEL_39;
                      }
                    }
                  }
                  else
                  {
LABEL_39:
                  }
                  ++v28;
                  double v17 = v60;
                  CGFloat v21 = v58;
                  CGFloat v20 = v59;
                }
                while ([v60 count] > v28);
                id v6 = v54;
                id v5 = v55;
                uint64_t v8 = v56;
                uint64_t v13 = v53;
              }
            }
            uint64_t v14 = v57;
          }
          ++v14;
        }
        while (v14 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v8);
    }

    [(UIKBTree *)v5 setObject:0 forProperty:@"KBunionFrame"];
    [(UIKBTree *)v5 setObject:0 forProperty:@"KBunionPaddedFrame"];
    [(UIKBTree *)v5 setResizingOffset:0.0];
    if (v4)
    {
      if (([(UIKBTree *)v5 visualStyling] & 0x3F) == 0x17
        || (+[UIKeyboardImpl activeInstance],
            int v48 = objc_claimAutoreleasedReturnValue(),
            [v48 textInputTraits],
            uint64_t v49 = objc_claimAutoreleasedReturnValue(),
            uint64_t v50 = [v49 keyboardType],
            v49,
            v48,
            v50 != 12))
      {
        [(UIKBTree *)v5 updateFlickKeycapOnKeys];
      }
    }
    if (v63)
    {
      int v51 = [(UIKBTree *)v5 cache];
      [v51 setObject:&unk_1ED3F4818 forKey:@"isScaled"];
    }
  }
}

- (void)zipGeometrySet
{
}

- (void)zipOnlyGeometrySet
{
}

- (void)zipAttributes
{
}

- (int64_t)_keyCountOnNamedRow:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) keySet];
        uint64_t v12 = [v11 subtreeWithName:v4];

        uint64_t v13 = [v12 subtrees];
        v8 += [v13 count];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4
{
}

- (void)elaborateLayoutWithSize:(CGSize)a3 scale:(double)a4 origin:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a3.height;
  double width = a3.width;
  id v10 = self;
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C108260](self, a2);
  if ([(UIKBTree *)v10 type] == 2)
  {
    BOOL v11 = width != 1.0;
    if (height != 1.0) {
      BOOL v11 = 1;
    }
    BOOL v121 = v11;
    BOOL v12 = x != *MEMORY[0x1E4F1DAD8];
    if (y != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
      BOOL v12 = 1;
    }
    BOOL v122 = v12;
    v127 = v10;
    double v119 = x;
    double v120 = y;
    double v117 = height;
    if (![(UIKBTree *)v10 isSplit]) {
      goto LABEL_10;
    }
    if ([(UIKBTree *)v10 isGenerated]) {
      goto LABEL_10;
    }
    uint64_t v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v14 = [v13 preferencesActions];
    [v14 rivenSizeFactor:1.0];
    double v16 = v15;

    if (v16 <= 1.0)
    {
LABEL_10:
      int v132 = 0;
      double v113 = height;
      double v114 = width;
    }
    else
    {
      long long v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
      long long v18 = [v17 preferencesActions];
      [v18 rivenSizeFactor:1.0];
      double v114 = v19;
      uint64_t v20 = +[UIKeyboardPreferencesController sharedPreferencesController];
      CGFloat v21 = [v20 preferencesActions];
      [v21 rivenSizeFactor:1.0];
      double v113 = v22;

      id v10 = v127;
      int v132 = 1;
    }
    [(UIKBTree *)v10 originalFrame];
    double v24 = v23;
    unint64_t v25 = +[UIKBShapeOperator operatorWithScale:a4];
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    double v26 = [(UIKBTree *)v10 subtrees];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v133 objects:v139 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      double v29 = (width - v114) * v24;
      CGFloat v30 = *MEMORY[0x1E4F1DB28];
      CGFloat v31 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v32 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v115 = *(void *)v134;
      int v116 = v121 | v132;
      v131 = v25;
      CGRect v108 = v26;
      do
      {
        uint64_t v34 = 0;
        uint64_t v109 = v28;
        do
        {
          if (*(void *)v134 != v115) {
            objc_enumerationMutation(v26);
          }
          uint64_t v118 = v34;
          unint64_t v35 = *(void **)(*((void *)&v133 + 1) + 8 * v34);
          if ([v35 type] != 3)
          {
            uint64_t v58 = v118;
            goto LABEL_73;
          }
          unint64_t v36 = [v35 keySet];
          double v37 = [v36 subtrees];

          int v38 = [v35 geometrySet:0];
          double v39 = [v38 subtrees];

          uint64_t v40 = [v35 attributeSet:0];
          double v41 = [v40 subtrees];

          uint64_t v42 = [v37 count];
          v126 = v39;
          if (v42 == [v39 count])
          {
            double v43 = [v35 shape];
            double v44 = [v43 originalShape];

            if (v44)
            {
              uint64_t v45 = [v43 originalShape];

              double v43 = (void *)v45;
            }
            [v35 originalFrame];
            v143.origin.double x = v30;
            v143.origin.double y = v31;
            v143.size.double width = v33;
            v143.size.double height = v32;
            CGRect v142 = CGRectUnion(v141, v143);
            CGFloat v46 = v142.origin.x;
            CGFloat v47 = v142.origin.y;
            double v33 = v142.size.width;
            CGFloat v48 = v142.size.height;
            uint64_t v49 = [v35 geometrySet:0];
            uint64_t v50 = [v49 listShapes];

            double v111 = v47;
            double v112 = v46;
            if (!v116) {
              goto LABEL_39;
            }
            int v51 = objc_msgSend(v25, "shapeByScalingShape:factor:", v43, v114, v113);

            double v52 = objc_msgSend(v25, "shapesByScalingShapes:factor:", v50, v114, v113);

            if (v132)
            {
              [v35 frame];
              if (v53 <= v33 * 0.5) {
                double v54 = 0.0;
              }
              else {
                double v54 = v33;
              }
              char v55 = v54 > 0.0 || v122;
              if (v54 <= 0.0) {
                double v56 = v119;
              }
              else {
                double v56 = v29;
              }
              if (v54 <= 0.0) {
                double v57 = v120;
              }
              else {
                double v57 = 0.0;
              }
              if ((v55 & 1) == 0)
              {
LABEL_35:
                double v43 = v51;
                uint64_t v50 = v52;
LABEL_39:
                CGRect v110 = v43;
                [v35 setShape:v43];
                if ([v37 count])
                {
                  unint64_t v62 = 0;
                  v124 = v41;
                  v125 = v37;
                  v123 = v50;
                  do
                  {
                    BOOL v63 = [v126 objectAtIndex:v62];
                    uint64_t v64 = [v50 objectAtIndex:v62];
                    long long v65 = [v37 objectAtIndex:v62];
                    unint64_t v129 = v62;
                    if ([v41 count] <= v62)
                    {
                      long long v66 = 0;
                    }
                    else
                    {
                      long long v66 = [v41 objectAtIndex:v62];
                    }
                    long long v67 = [v63 geometriesList];

                    v130 = v65;
                    if (v67)
                    {
                      long long v68 = [v65 componentName];
                      uint64_t v69 = [(UIKBTree *)v10 _keyCountOnNamedRow:v68];

                      uint64_t v70 = [v63 geometriesList];
                      CGRect v71 = [v70 subtrees];

                      if (v121)
                      {
                        uint64_t v72 = objc_msgSend(v25, "shapesByScalingShapes:factor:", v71, width, v117);

                        CGRect v71 = (void *)v72;
                      }
                      CGRect v73 = [v25 shapesByElaboratingShapes:v71 insideShape:v64 count:v69];
                      CGRect v74 = [v63 activeShapesFromOutputShapes:v73 inputShapes:v71 inRTL:0];

                      long long v65 = v130;
                    }
                    else
                    {
                      CGRect v75 = [v63 subtrees];
                      if (v75 && (v75, v116))
                      {
                        BOOL v76 = [v63 subtrees];
                        CGRect v74 = objc_msgSend(v25, "shapesByScalingShapes:factor:", v76, v114, v113);
                      }
                      else
                      {
                        CGRect v74 = [v63 subtrees];
                      }
                    }
                    v128 = (void *)v64;
                    if (v122)
                    {
                      uint64_t v77 = objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v74, v119, v120);

                      CGRect v74 = (void *)v77;
                    }
                    uint64_t v78 = [v63 properties];
                    [v65 setProperties:v78];

                    uint64_t v79 = [v65 subtrees];
                    if ([v79 count])
                    {
                      unint64_t v80 = 0;
                      do
                      {
                        if ([v74 count] <= v80) {
                          break;
                        }
                        v81 = [v79 objectAtIndex:v80];
                        [v81 setState:0];
                        [v81 setVisible:1];
                        [v81 setClipCorners:0];
                        v82 = [v66 subtrees];
                        if ([v82 count] <= v80)
                        {
                          [v81 setCache:0];
                        }
                        else
                        {
                          unsigned int v83 = [v66 subtrees];
                          v84 = [v83 objectAtIndex:v80];
                          [v81 setCache:v84];
                        }
                        uint64_t v85 = [v63 subtrees];
                        if (v85
                          && (v86 = (void *)v85,
                              int v87 = [v81 BOOLForProperty:@"ignore-hand-bias"],
                              v86,
                              v87))
                        {
                          v88 = [v63 subtrees];
                          unint64_t v89 = [v88 objectAtIndex:v80];

                          [v89 frame];
                          double v91 = v90;
                          double v93 = v92;
                          double v95 = v94;
                          [(UIKBTree *)v10 frame];
                          double v97 = v96;
                          objc_msgSend(v89, "setFrame:", v91, v93);
                          objc_msgSend(v89, "setPaddedFrame:", v91, v93, v97, v95);
                        }
                        else
                        {
                          long long v98 = [v74 objectAtIndex:v80];
                          unint64_t v89 = v98;
                          if (v132)
                          {
                            [v98 frame];
                            double v100 = v99 <= v33 * 0.5 ? 0.0 : v33;
                            if (v100 > 0.0)
                            {
                              v137 = v89;
                              v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];
                              v102 = objc_msgSend(v131, "shapesByRepositioningShapes:withOffset:", v101, v29, 0.0);
                              uint64_t v103 = [v102 firstObject];

                              unint64_t v89 = (void *)v103;
                              id v10 = v127;
                            }
                          }
                        }
                        [v81 setShape:v89];

                        ++v80;
                      }
                      while ([v79 count] > v80);
                    }

                    unint64_t v62 = v129 + 1;
                    double v37 = v125;
                    unint64_t v25 = v131;
                    uint64_t v50 = v123;
                    double v41 = v124;
                  }
                  while ([v125 count] > v129 + 1);
                }

                double v26 = v108;
                uint64_t v28 = v109;
                CGFloat v31 = v111;
                CGFloat v30 = v112;
                CGFloat v32 = v48;
                goto LABEL_72;
              }
            }
            else
            {
              double v56 = v119;
              double v57 = v120;
              if (!v122) {
                goto LABEL_35;
              }
            }
            v138 = v51;
            double v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
            double v60 = objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v59, v56, v57);
            uint64_t v61 = [v60 firstObject];

            double v43 = (void *)v61;
            id v10 = v127;
            uint64_t v50 = objc_msgSend(v25, "shapesByRepositioningShapes:withOffset:", v52, v56, v57);

            goto LABEL_39;
          }
LABEL_72:
          uint64_t v58 = v118;

LABEL_73:
          uint64_t v34 = v58 + 1;
        }
        while (v34 != v28);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v133 objects:v139 count:16];
      }
      while (v28);
    }

    if (((v121 || v122) | v132) == 1)
    {
      [(UIKBTree *)v10 setObject:0 forProperty:@"KBunionFrame"];
      [(UIKBTree *)v10 setObject:0 forProperty:@"KBunionPaddedFrame"];
      [(UIKBTree *)v10 setResizingOffset:0.0];
    }
    if (([(UIKBTree *)v10 visualStyling] & 0x3F) == 0x17
      || (+[UIKeyboardImpl activeInstance],
          v104 = objc_claimAutoreleasedReturnValue(),
          [v104 textInputTraits],
          v105 = objc_claimAutoreleasedReturnValue(),
          uint64_t v106 = [v105 keyboardType],
          v105,
          v104,
          v106 != 12))
    {
      [(UIKBTree *)v10 updateFlickKeycapOnKeys];
    }
  }
}

- (id)rowSet
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKBTree *)self dynamicLayout];
  int v4 = [(UIKBTree *)self type];
  if (!v3)
  {
    if (v4 == 3)
    {
      BOOL v12 = [(UIKBTree *)self keySet];
LABEL_18:
      id v5 = v12;
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  if (v4 != 3)
  {
    int v13 = [(UIKBTree *)self type];
    if (v13 == 15)
    {
      BOOL v12 = self;
      goto LABEL_18;
    }
LABEL_19:
    id v5 = 0;
    goto LABEL_22;
  }
  id v5 = [(UIKBTree *)self subtreeWithType:15];
  if ([v5 rowSetType])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(UIKBTree *)self subtrees];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v11 rowSetType])
          {
            id v14 = v11;

            id v5 = v14;
            goto LABEL_21;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
LABEL_22:
  return v5;
}

- (id)rowSetOfType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 rowSetType] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateKeysForType:(int64_t)a3
{
  id v10 = [(UIKBTree *)self subtreeWithType:3];
  [v10 setCurrentKeyboardType:a3];
  uint64_t v5 = [v10 orderedRowsForType:a3];
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [(UIKBTree *)self cache];
    [v7 removeObjectForKey:@"keys"];

    uint64_t v8 = [(UIKBTree *)self _keysForDynamicRows:v6];
    uint64_t v9 = [(UIKBTree *)self cache];
    [v9 setObject:v8 forKey:@"keys"];
  }
}

- (id)orderedRowsForType:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIKBTree *)self rowSet];
  uint64_t v6 = v5;
  if (a3)
  {
    uint64_t v7 = 0;
    if ([(UIKBTree *)self type] == 3 && v6)
    {
      uint64_t v8 = [v6 subtrees];
      uint64_t v7 = (void *)[v8 mutableCopy];

      uint64_t v9 = [(UIKBTree *)self rowSetOfType:a3];
      if (v9)
      {
        id v10 = [v6 subtrees];
        uint64_t v11 = [v10 count];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v12 = objc_msgSend(v9, "subtrees", 0);
        long long v13 = [v12 reverseObjectEnumerator];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              [v7 replaceObjectAtIndex:--v11 withObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v15);
        }
      }
    }
  }
  else
  {
    uint64_t v7 = [v5 subtrees];
  }

  return v7;
}

- (id)_keysForDynamicRows:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v5;
        uint64_t v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        uint64_t v7 = [v6 subtrees];
        unint64_t v8 = [v7 count];

        uint64_t v9 = [v6 subtrees];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          unint64_t v11 = 0;
          CGFloat v32 = v6;
          unint64_t v33 = v8 >> 1;
          do
          {
            long long v12 = [v6 subtrees];
            long long v13 = [v12 objectAtIndex:v11];

            if ([v13 type] == 8)
            {
              [v13 setDynamicLayout:1];
              if (v11 >= v33) {
                uint64_t v14 = 8;
              }
              else {
                uint64_t v14 = 4;
              }
              [v13 setDynamicDisplayCorner:v14];
              [v4 addObject:v13];
            }
            else if ([v13 type] == 4 || objc_msgSend(v13, "type") == 7)
            {
              unint64_t v34 = v11;
              uint64_t v15 = [v13 subtrees];
              unint64_t v16 = [v15 count];

              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              uint64_t v17 = [v13 subtrees];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                unint64_t v20 = v16 >> 1;
                uint64_t v21 = *(void *)v36;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v36 != v21) {
                      objc_enumerationMutation(v17);
                    }
                    double v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                    [v23 setDynamicLayout:1];
                    if (v20 <= (int)[v13 indexOfSubtree:v23]) {
                      uint64_t v24 = 8;
                    }
                    else {
                      uint64_t v24 = 4;
                    }
                    [v23 setDynamicDisplayCorner:v24];
                    [v4 addObject:v23];
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
                }
                while (v19);
              }

              uint64_t v6 = v32;
              unint64_t v11 = v34;
            }

            ++v11;
            unint64_t v25 = [v6 subtrees];
            unint64_t v26 = [v25 count];
          }
          while (v11 < v26);
        }
        uint64_t v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v30);
  }

  return v4;
}

- (id)_keysForDynamicRow
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(UIKBTree *)self dynamicLayout])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(UIKBTree *)self subtrees];
    uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          unint64_t v8 = [v7 subtrees];
          uint64_t v9 = [v8 count];

          if (v9)
          {
            unint64_t v10 = 0;
            do
            {
              unint64_t v11 = [v7 subtrees];
              long long v12 = [v11 objectAtIndex:v10];

              if ([v12 type] == 8)
              {
                [v3 addObject:v12];
              }
              else if ([v12 type] == 4 || objc_msgSend(v12, "type") == 7)
              {
                long long v25 = 0u;
                long long v26 = 0u;
                long long v23 = 0u;
                long long v24 = 0u;
                long long v13 = [v12 subtrees];
                uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v14)
                {
                  uint64_t v15 = v14;
                  uint64_t v16 = *(void *)v24;
                  do
                  {
                    for (uint64_t j = 0; j != v15; ++j)
                    {
                      if (*(void *)v24 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      [v3 addObject:*(void *)(*((void *)&v23 + 1) + 8 * j)];
                    }
                    uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                  }
                  while (v15);
                }
              }
              ++v10;
              uint64_t v18 = [v7 subtrees];
              unint64_t v19 = [v18 count];
            }
            while (v10 < v19);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

- (int64_t)rowSetType
{
  BOOL v2 = [(UIKBTree *)self numberForProperty:@"KBRowSetVariantType"];
  id v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)swapToggleKeys:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[UIKBTree type](self, "type") == 3 && (unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = [(UIKBTree *)self orderedRowsForType:[(UIKBTree *)self currentKeyboardType]];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      uint64_t v27 = *(void *)v30;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
          unint64_t v11 = objc_msgSend(v4, "firstObject", v27);
          long long v12 = [v10 toggleKeysForKeyName:v11];

          if (v12)
          {
            long long v13 = [v12 firstObject];
            uint64_t v14 = [v10 subtreeWithName:v13];

            uint64_t v15 = [v12 lastObject];
            uint64_t v16 = [v10 subtreeWithName:v15];

            if (v14) {
              BOOL v17 = v16 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17)
            {
              unsigned int v18 = [v10 indexOfSubtree:v14];
              unsigned int v19 = [v10 indexOfSubtree:v16];
              if (v18 < v19)
              {
                unint64_t v20 = v5;
                id v21 = v4;
                uint64_t v22 = (int)v19;
                uint64_t v28 = (int)v18;
                [v10 subtrees];
                long long v24 = v23 = v7;
                uint64_t v25 = v22;
                id v4 = v21;
                uint64_t v5 = v20;
                uint64_t v8 = v27;
                [v24 replaceObjectAtIndex:v25 withObject:v14];

                uint64_t v7 = v23;
                long long v26 = [v10 subtrees];
                [v26 replaceObjectAtIndex:v28 withObject:v16];
              }
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v7);
    }
  }
}

- (void)applyDynamicAttributes
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if ([(UIKBTree *)self isShiftKeyplane])
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    if ([v3 isAutoShifted])
    {
      char v4 = 0;
    }
    else
    {
      uint64_t v5 = +[UIKeyboardImpl activeInstance];
      char v4 = [v5 isShiftLocked] ^ 1;
    }
  }
  else
  {
    char v4 = 0;
  }
  uint64_t v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v7 = [v6 preferencesActions];
  if ([v7 BOOLForPreferenceKey:@"GesturesEnabled"]
    && ![(UIKBTree *)self isSplit])
  {
    char v8 = ![(UIKBTree *)self isFloating];
  }
  else
  {
    char v8 = 0;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__UIKBTree_applyDynamicAttributes__block_invoke;
  aBlock[3] = &__block_descriptor_34_e33_v32__0__UIKBTree_8__NSArray_16q24l;
  char v62 = v8;
  char v63 = v4;
  uint64_t v9 = (void (**)(void *, void *, void, uint64_t))_Block_copy(aBlock);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [(UIKBTree *)self subtrees];
  uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v58;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v58 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = v10;
        long long v12 = *(void **)(*((void *)&v57 + 1) + 8 * v10);
        if ([v12 type] == 3)
        {
          uint64_t v48 = v11;
          long long v13 = [v12 rowSet];
          uint64_t v14 = [v13 subtrees];

          uint64_t v15 = [v12 attributeSet:0];
          uint64_t v16 = [v15 subtrees];

          if (![v16 count])
          {

            goto LABEL_55;
          }
          if ([v16 count] == 1)
          {
            BOOL v17 = [v16 firstObject];
            unsigned int v18 = [v17 subtrees];
            uint64_t v19 = [v18 count];

            if (v19)
            {
              uint64_t v20 = [v17 subtrees];

              uint64_t v16 = (void *)v20;
            }
          }
          if ([v14 count])
          {
            unint64_t v21 = 0;
            int v51 = v16;
            double v52 = v14;
            do
            {
              uint64_t v22 = [v14 objectAtIndex:v21];
              unint64_t v54 = v21;
              if ([v16 count] <= v21)
              {
                uint64_t v23 = 0;
              }
              else
              {
                uint64_t v23 = [v16 objectAtIndex:v21];
              }
              double v53 = v22;
              long long v24 = [v22 subtrees];
              if ([v24 count])
              {
                unint64_t v25 = 0;
                char v55 = v23;
                double v56 = v24;
                do
                {
                  long long v26 = [v24 objectAtIndex:v25];
                  if ([v26 type] == 8)
                  {
                    uint64_t v27 = [v23 subtrees];
                    unint64_t v28 = [v27 count];

                    if (v28 <= v25)
                    {
                      v9[2](v9, v26, 0, 0x7FFFFFFFFFFFFFFFLL);
                    }
                    else
                    {
                      long long v29 = [v23 subtrees];
                      ((void (**)(void *, void *, void *, uint64_t))v9)[2](v9, v26, v29, v25);
                    }
                  }
                  else
                  {
                    long long v30 = [v26 subtrees];
                    uint64_t v31 = [v30 count];

                    if (v31)
                    {
                      long long v32 = [v23 subtrees];
                      unint64_t v33 = [v32 count];

                      if (v33 <= v25)
                      {
                        long long v42 = [v26 subtrees];
                        if ([v42 count])
                        {
                          unint64_t v43 = 0;
                          do
                          {
                            double v44 = [v42 objectAtIndex:v43];
                            uint64_t v45 = [v44 cache];
                            uint64_t v46 = [v45 count];

                            if (v46) {
                              v9[2](v9, v44, 0, 0x7FFFFFFFFFFFFFFFLL);
                            }

                            ++v43;
                          }
                          while ([v42 count] > v43);
                        }

                        long long v24 = v56;
                      }
                      else
                      {
                        uint64_t v34 = [v23 subtrees];
                        long long v35 = [v34 objectAtIndex:v25];

                        long long v36 = [v26 subtrees];
                        if ([v36 count])
                        {
                          unint64_t v37 = 0;
                          do
                          {
                            long long v38 = [v36 objectAtIndex:v37];
                            long long v39 = [v35 subtrees];
                            unint64_t v40 = [v39 count];

                            if (v40 <= v37)
                            {
                              v9[2](v9, v38, 0, 0x7FFFFFFFFFFFFFFFLL);
                            }
                            else
                            {
                              long long v41 = [v35 subtrees];
                              ((void (**)(void *, void *, void *, uint64_t))v9)[2](v9, v38, v41, v37);
                            }
                            ++v37;
                          }
                          while ([v36 count] > v37);
                        }

                        uint64_t v23 = v55;
                        long long v24 = v56;
                      }
                    }
                  }

                  ++v25;
                }
                while ([v24 count] > v25);
              }

              unint64_t v21 = v54 + 1;
              uint64_t v14 = v52;
              uint64_t v16 = v51;
            }
            while ([v52 count] > v54 + 1);
          }

          uint64_t v11 = v48;
        }
        uint64_t v10 = v11 + 1;
      }
      while (v11 + 1 != v50);
      uint64_t v50 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (v50) {
        continue;
      }
      break;
    }
  }
LABEL_55:
}

void __34__UIKBTree_applyDynamicAttributes__block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v16 = a2;
  id v7 = a3;
  [v16 setState:0];
  [v16 setVisible:1];
  [v16 setClipCorners:0];
  if ([v7 count] > a4)
  {
    char v8 = [v7 objectAtIndex:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 objectAtIndex:a4];
    }
    else {
    uint64_t v9 = [v8 properties];
    }
    [v16 setCache:v9];
  }
  else
  {
    [v16 setCache:0];
  }
  if (*(unsigned char *)(a1 + 32) && [v16 displayType] == 7)
  {
    uint64_t v10 = [v16 secondaryRepresentedStrings];
    if ([v10 count] == 1)
    {
      uint64_t v11 = [v16 representedString];
      long long v12 = [v16 secondaryRepresentedStrings];
      long long v13 = [v12 firstObject];
      char v14 = [v11 isEqualToString:v13];

      if (v14)
      {
        uint64_t v15 = 0;
LABEL_16:
        [v16 setDisplayTypeHint:v15];
        goto LABEL_17;
      }
    }
    else
    {
    }
    if (*(unsigned char *)(a1 + 33)) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 10;
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)isLeafType
{
  return (self->type < 0xEu) & (0x3700u >> self->type);
}

- (BOOL)subtreesAreOrdered
{
  return [(UIKBTree *)self type] == 7;
}

- (id)shape
{
  return (id)[(NSMutableDictionary *)self->properties objectForKey:@"KBshape"];
}

- (void)setShape:(id)a3
{
}

- (id)geometry
{
  BOOL v2 = [(UIKBTree *)self shape];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 geometry];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setGeometry:(id)a3
{
  id v5 = a3;
  char v4 = [(UIKBTree *)self shape];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setGeometry:v5];
  }
}

- (CGRect)_keyplaneFrame
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [(UIKBTree *)self subtrees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        BOOL IsNull = CGRectIsNull(v31);
        [v11 frame];
        if (IsNull)
        {
          CGFloat height = v16;
          CGFloat width = v15;
          CGFloat y = v14;
          CGFloat x = v13;
        }
        else if (!CGRectIsEmpty(*(CGRect *)&v13))
        {
          [v11 frame];
          v35.origin.CGFloat x = v17;
          v35.origin.CGFloat y = v18;
          v35.size.CGFloat width = v19;
          v35.size.CGFloat height = v20;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)_originalKeyplaneFrame
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [(UIKBTree *)self subtrees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        BOOL IsNull = CGRectIsNull(v31);
        [v11 originalFrame];
        if (IsNull)
        {
          CGFloat height = v16;
          CGFloat width = v15;
          CGFloat y = v14;
          CGFloat x = v13;
        }
        else if (!CGRectIsEmpty(*(CGRect *)&v13))
        {
          [v11 originalFrame];
          v35.origin.CGFloat x = v17;
          v35.origin.CGFloat y = v18;
          v35.size.CGFloat width = v19;
          v35.size.CGFloat height = v20;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)frame
{
  if ([(UIKBTree *)self type] == 2)
  {
    [(UIKBTree *)self _keyplaneFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    uint64_t v11 = [(UIKBTree *)self shape];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 frame];
      double v4 = v12;
      double v6 = v13;
      double v8 = v14;
      double v10 = v15;
    }
    else
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)originalFrame
{
  if ([(UIKBTree *)self type] == 2)
  {
    [(UIKBTree *)self _originalKeyplaneFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    uint64_t v11 = [(UIKBTree *)self shape];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [v11 originalShape];

      if (v12)
      {
        uint64_t v13 = [v11 originalShape];

        uint64_t v11 = (void *)v13;
      }
      [v11 frame];
      double v4 = v14;
      double v6 = v15;
      double v8 = v16;
      double v10 = v17;
    }
    else
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(UIKBTree *)self shape];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "setFrame:", x, y, width, height);
  }
}

- (CGRect)paddedFrame
{
  BOOL v2 = [(UIKBTree *)self shape];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 paddedFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setPaddedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(UIKBTree *)self shape];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "setPaddedFrame:", x, y, width, height);
  }
}

- (CGPoint)navigationPointOfKey
{
  int64_t v3 = [(UIKBTree *)self selectedVariantIndex];
  double v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 count];

  [(UIKBTree *)self frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  if (v5 >= 1 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = [(UIKBTree *)self subtrees];
    double v15 = [v14 objectAtIndex:v3];
    [v15 frame];
    CGFloat v7 = v16;
    CGFloat v9 = v17;
    CGFloat v11 = v18;
    CGFloat v13 = v19;
  }
  v24.origin.double x = v7;
  v24.origin.double y = v9;
  v24.size.double width = v11;
  v24.size.double height = v13;
  CGFloat MidX = CGRectGetMidX(v24);
  v25.origin.double x = v7;
  v25.origin.double y = v9;
  v25.size.double width = v11;
  v25.size.double height = v13;
  double MidY = CGRectGetMidY(v25);
  double v22 = MidX;
  result.double y = MidY;
  result.double x = v22;
  return result;
}

- (CGRect)keyUnionFramePadded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = UIKBTreePropertyKeyUnionFrame;
  if (a3) {
    uint64_t v5 = UIKBTreePropertyKeyUnionPaddedFrame;
  }
  double v6 = *v5;
  CGFloat v7 = [(UIKBTree *)self objectForProperty:v6];
  if (v7)
  {
    double v8 = v7;
    [v7 CGRectValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v17 = [(UIKBTree *)self keys];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (([v22 BOOLForProperty:@"ignore-hand-bias"] & 1) == 0)
          {
            v41.origin.double x = v10;
            v41.origin.double y = v12;
            v41.size.double width = v14;
            v41.size.double height = v16;
            if (CGRectIsNull(v41))
            {
              if (v3) {
                [v22 paddedFrame];
              }
              else {
                [v22 frame];
              }
            }
            else
            {
              if (v3) {
                [v22 paddedFrame];
              }
              else {
                [v22 frame];
              }
              v44.origin.double x = v27;
              v44.origin.double y = v28;
              v44.size.double width = v29;
              v44.size.double height = v30;
              v42.origin.double x = v10;
              v42.origin.double y = v12;
              v42.size.double width = v14;
              v42.size.double height = v16;
              *(CGRect *)&double v23 = CGRectUnion(v42, v44);
            }
            double v10 = v23;
            double v12 = v24;
            double v14 = v25;
            double v16 = v26;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v19);
    }

    double v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v10, v12, v14, v16);
    [(UIKBTree *)self setObject:v8 forProperty:v6];
  }

  double v31 = v10;
  double v32 = v12;
  double v33 = v14;
  double v34 = v16;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (CGRect)keyUnionFrame
{
  [(UIKBTree *)self keyUnionFramePadded:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)keyUnionPaddedFrame
{
  [(UIKBTree *)self keyUnionFramePadded:1];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (int)visualStyle
{
  return [(UIKBTree *)self intForProperty:@"KBvisualStyle"];
}

- (void)setVisualStyle:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBvisualStyle"];
}

- ($5C396DA91E87D63640AC871340DC94CC)stylingFromVisualStyle
{
  return ($5C396DA91E87D63640AC871340DC94CC)[(UIKBTree *)self visualStylingForScreenTraits:0];
}

- ($5C396DA91E87D63640AC871340DC94CC)visualStylingForScreenTraits:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBTree *)self name];
  int v6 = ([v5 rangeOfString:@"Portrait"] == 0x7FFFFFFFFFFFFFFFLL) << 6;

  CGFloat v7 = [(UIKBTree *)self name];
  int v8 = [v7 hasSuffix:@"-split"];

  if (v8) {
    int v9 = 128;
  }
  else {
    int v9 = v6;
  }
  if ([(UIKBTree *)self visualStyle] - 1 < 5
    || ([(UIKBTree *)self name],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 hasPrefix:@"iPhone"],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = 0;
  }
  else if ([(UIKBTree *)self visualStyle] == 301)
  {
    uint64_t v12 = 3;
  }
  else if ([(UIKBTree *)self visualStyle] == 201)
  {
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v12 = 1;
  }
  if (!v4)
  {
    double v13 = +[UIKeyboardImpl keyboardScreen];
    double v14 = +[UIKeyboard activeKeyboard];
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v13, [v14 interfaceOrientation]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v15 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, v12, v8);
  int64_t v16 = [(UIKBTree *)self nativeIdiom];
  if (v16 != -1) {
    char v15 = v16;
  }
  int v17 = v15 & 0x3F | v9;
  int v18 = [(UIKBTree *)self visualStyle];
  switch(v18)
  {
    case 'e':
      int v17 = (v17 | 0x260200) - 1769472;
      break;
    case 'f':
    case 'h':
    case 'j':
LABEL_15:
      v17 |= 0x200u;
      break;
    case 'g':
LABEL_19:
      v17 |= 0x270200u;
      break;
    case 'i':
      if ((v15 & 0x3F) != 0) {
        int v19 = 256;
      }
      else {
        int v19 = 512;
      }
      goto LABEL_26;
    case 'k':
      break;
    case 'l':
    case 'm':
LABEL_18:
      int v19 = 2490880;
LABEL_26:
      v17 |= v19;
      break;
    default:
      switch(v18)
      {
        case 1:
          goto LABEL_15;
        case 2:
          goto LABEL_19;
        case 3:
        case 5:
          v17 |= 0x100u;
          break;
        case 4:
          goto LABEL_18;
        default:
          goto LABEL_27;
      }
      break;
  }
LABEL_27:
  uint64_t v20 = [(UIKBTree *)self name];
  if ([v20 hasPrefix:@"Dynamic"])
  {
    int v21 = [(UIKBTree *)self rendering];

    if (v21)
    {
      int v17 = (unsigned __int16)v17 | ([(UIKBTree *)self rendering] << 16);
      LOBYTE(v21) = 1;
    }
  }
  else
  {

    LOBYTE(v21) = 0;
  }
  double v22 = [(UIKBTree *)self keys];
  double v23 = [v22 lastObject];

  if ([v23 rendering])
  {
    int v17 = (unsigned __int16)v17 | ([v23 rendering] << 16);
  }
  else if ((v21 & 1) == 0 && [v23 displayType] == 20)
  {
    int v17 = (unsigned __int16)v17 | 0x1B0000;
  }

  return ($5C396DA91E87D63640AC871340DC94CC)v17;
}

- ($5C396DA91E87D63640AC871340DC94CC)visualStyling
{
  double v3 = [(NSMutableDictionary *)self->properties objectForKey:@"KBvisualStyling"];
  id v4 = v3;
  if (v3) {
    $5C396DA91E87D63640AC871340DC94CC v5 = ($5C396DA91E87D63640AC871340DC94CC)[v3 intValue];
  }
  else {
    $5C396DA91E87D63640AC871340DC94CC v5 = ($5C396DA91E87D63640AC871340DC94CC)[(UIKBTree *)self stylingFromVisualStyle];
  }

  return v5;
}

- (void)setVisualStyling:(id)a3
{
  properties = self->properties;
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(NSMutableDictionary *)properties setObject:v4 forKey:@"KBvisualStyling"];
}

- (id)cachedKeysByKeyName:(id)a3
{
  id v4 = a3;
  $5C396DA91E87D63640AC871340DC94CC v5 = [(UIKBTree *)self cache];
  int v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)firstCachedKeyWithName:(id)a3
{
  id v4 = a3;
  $5C396DA91E87D63640AC871340DC94CC v5 = [(UIKBTree *)self cache];
  int v6 = [v5 objectForKey:v4];

  CGFloat v7 = [v6 objectAtIndex:0];

  return v7;
}

- (id)firstKeyplaneSwitchKey
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__122;
  double v10 = __Block_byref_object_dispose__122;
  id v11 = 0;
  double v2 = [(UIKBTree *)self cache];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__UIKBTree_firstKeyplaneSwitchKey__block_invoke;
  v5[3] = &unk_1E52F5360;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__UIKBTree_firstKeyplaneSwitchKey__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if (([v11 hasSuffix:@"Keyplane-Switch-Key"] & 1) != 0
    || [v11 hasSuffix:@"Keyplane-Switch-Collapsed-Key"])
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (id)keyplaneSwitchKeys
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(UIKBTree *)self subtrees];
  $5C396DA91E87D63640AC871340DC94CC v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(UIKBTree *)self subtrees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) firstKeyplaneSwitchKey];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)keyplaneSwitchKeysWithoutCurrentKeyplane:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v27 = [MEMORY[0x1E4F1CA48] array];
    $5C396DA91E87D63640AC871340DC94CC v5 = [v4 firstKeyplaneSwitchKey];
    uint64_t v6 = [v4 name];
    uint64_t v7 = [v5 representedString];
    if ([v6 containsString:v7])
    {
LABEL_18:
    }
    else
    {
      double v26 = self;
      while (1)
      {
        unint64_t v8 = objc_msgSend(v27, "count", v26);
        uint64_t v9 = [(UIKBTree *)self subtrees];
        unint64_t v10 = [v9 count];

        if (v8 >= v10) {
          break;
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = [(UIKBTree *)self subtrees];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v28 + 1) + 8 * i);
              if (v16 != v4)
              {
                int v17 = [*(id *)(*((void *)&v28 + 1) + 8 * i) name];
                uint64_t v18 = [v5 representedString];
                int v19 = [v17 containsString:v18];

                if (v19)
                {
                  uint64_t v20 = [v4 name];
                  int v21 = [v5 representedString];
                  char v22 = [v20 containsString:v21];

                  if ((v22 & 1) == 0)
                  {
                    double v23 = (void *)[v5 copy];
                    [v27 addObject:v23];
                  }
                  uint64_t v24 = [v16 firstKeyplaneSwitchKey];

                  $5C396DA91E87D63640AC871340DC94CC v5 = (void *)v24;
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v13);
        }

        uint64_t v6 = [v4 name];
        uint64_t v7 = [v5 representedString];
        self = v26;
        if ([v6 containsString:v7]) {
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)scriptSwitchKey
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBTree *)self firstCachedKeyWithName:@"Roman-to-Non-Roman-Switch-Key"];
  if (!v3)
  {
    id v3 = [(UIKBTree *)self firstCachedKeyWithName:@"Non-Roman-to-Roman-Switch-Key"];
    if (!v3)
    {
      [(UIKBTree *)self cachedKeysByKeyName:@"More-Key"];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            unint64_t v10 = objc_msgSend(v9, "name", (void)v13);
            int v11 = [v10 hasSuffix:@"Roman-Switch-Key"];

            if (v11)
            {
              id v3 = v9;
              goto LABEL_13;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      id v3 = 0;
LABEL_13:
    }
  }
  return v3;
}

- (unint64_t)numberOfRows
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(UIKBTree *)self subtrees];
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        unint64_t v8 = [v7 geometrySet:0];
        uint64_t v9 = [v8 subtrees];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [*(id *)(*((void *)&v18 + 1) + 8 * j) numberForProperty:@"KBdisplayRowHint"];
              long long v15 = v14;
              if (v14 && [v14 unsignedIntegerValue] > v4) {
                unint64_t v4 = [v15 unsignedIntegerValue];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v3);
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_cacheRootNameForKey:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 type] == 12
    || ([v3 layoutTag], unint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    uint64_t v5 = @"Adaptive-Key";
    goto LABEL_4;
  }
  uint64_t v7 = [v3 cache];
  unint64_t v8 = [v7 objectForKey:@"merge-as-more-key"];
  char v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v5 = @"More-Key";
    goto LABEL_4;
  }
  uint64_t v10 = [v3 cache];
  uint64_t v11 = [v10 objectForKey:@"modify-for-writeboard-key"];
  char v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v5 = @"Modify-For-Writeboard-Key";
    goto LABEL_4;
  }
  if ([v3 interactionType] == 15)
  {
    uint64_t v5 = @"Space-Key";
    goto LABEL_4;
  }
  if ([v3 displayType] == 7)
  {
    long long v13 = [v3 name];
    uint64_t v14 = [v13 rangeOfString:@"Alternate-Currency-Sign-"];
    uint64_t v16 = v15;

    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v19 = [v3 name];
      objc_msgSend(v19, "substringWithRange:", v14, v16 + 1);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    int v17 = [v3 representedString];
    char v18 = [v17 _containsSubstring:@"¤"];

    if (v18)
    {
      uint64_t v5 = @"Primary-Currency-Sign";
      goto LABEL_4;
    }
    long long v20 = [v3 representedString];
    char v21 = [v20 _containsSubstring:@"⁒"];

    if (v21)
    {
      uint64_t v5 = @"Localized-Percent-Sign";
      goto LABEL_4;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v22 = objc_msgSend(v3, "secondaryRepresentedStrings", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v29;
      uint64_t v5 = @"Primary-Currency-Sign";
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v27 _containsSubstring:@"¤"]) {
            goto LABEL_32;
          }
          if ([v27 _containsSubstring:@"⁒"])
          {
            uint64_t v5 = @"Localized-Percent-Sign";
LABEL_32:

            goto LABEL_4;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v5 = [v3 unhashedName];
LABEL_4:

  return v5;
}

- (void)cacheKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIKBTree *)self cache];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [(UIKBTree *)self setCache:v6];
  }
  uint64_t v7 = [(UIKBTree *)self _cacheRootNameForKey:v4];
  unint64_t v8 = [(UIKBTree *)self cache];
  id v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [(UIKBTree *)self cache];
    [v10 setObject:v9 forKey:v7];
  }
  [v9 addObject:v4];
  if ([v4 type] == 12
    || ([v4 layoutTag], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    char v12 = objc_msgSend(v4, "properties", 0);
    long long v13 = [v12 objectEnumerator];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          char v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 shouldCacheKey]) {
            [(UIKBTree *)self cacheKey:v18];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (id)layoutName
{
  id v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"layoutName"];

  if (!v4)
  {
    uint64_t v5 = UIKeyboardGetCurrentInputMode();
    id v4 = KBStarLayoutString(v5);

    uint64_t v6 = [(UIKBTree *)self cache];
    [v6 setObject:v4 forKey:@"layoutName"];
  }
  return v4;
}

- (void)precacheLayoutName:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBTree *)self cache];
  [v5 setObject:v4 forKey:@"layoutName"];
}

- (id)keyForString:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        unint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = [v8 keys];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = [v14 representedString];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v14;

                goto LABEL_18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v19;
      }
      uint64_t v20 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  NSLog(&cfstr_DidNotFindKeyF.isa, v4);
  id v17 = 0;
LABEL_18:

  return v17;
}

- (id)keyplaneForKey:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (!v20)
  {

LABEL_22:
    id v17 = [v4 representedString];
    NSLog(&cfstr_DidNotFindKeyp.isa, v17);

    id v6 = 0;
    goto LABEL_23;
  }
  id v6 = 0;
  uint64_t v7 = *(void *)v27;
  long long v21 = v5;
  uint64_t v19 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v10 = [v9 keys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        while (2)
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            if (*(id *)(*((void *)&v22 + 1) + 8 * j) == v4)
            {
              int v15 = [v9 isShiftKeyplane];
              id v16 = v9;
              if (!v15)
              {

                goto LABEL_24;
              }

              id v6 = v16;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v5 = v21;
      uint64_t v7 = v19;
    }
    uint64_t v20 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
  }
  while (v20);

  if (!v6) {
    goto LABEL_22;
  }
LABEL_23:
  id v6 = v6;
  id v16 = v6;
LABEL_24:

  return v16;
}

- (void)setAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 type] == 10)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v10 = [(UIKBTree *)self subtrees];
  [v10 removeObject:v6];

  if (v4)
  {
    uint64_t v11 = [(UIKBTree *)self subtrees];
    [v11 addObject:v4];
  }
}

- (void)_addKeylayoutKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(UIKBTree *)self type] == 3)
  {
    if ([(UIKBTree *)self dynamicLayout])
    {
      id v5 = [(UIKBTree *)self rowSet];
      id v6 = [v5 subtrees];

      if ([(UIKBTree *)self currentKeyboardType])
      {
        uint64_t v7 = [(UIKBTree *)self orderedRowsForType:[(UIKBTree *)self currentKeyboardType]];

        id v6 = (void *)v7;
      }
      unint64_t v8 = [(UIKBTree *)self _keysForDynamicRows:v6];
      [v4 addObjectsFromArray:v8];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = [(UIKBTree *)self keySet];
      uint64_t v10 = [v9 subtrees];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) subtrees];
            [v4 addObjectsFromArray:v15];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
}

- (id)keys
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"keys"];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [(UIKBTree *)self _addKeylayoutKeys:v4];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(UIKBTree *)self subtrees];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _addKeylayoutKeys:v4];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v10 = [(UIKBTree *)self cache];
    [v10 setObject:v4 forKey:@"keys"];
  }
  id v11 = v4;

  return v11;
}

- (void)addkeyToCachedKeyList:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIKBTree *)self cache];
    uint64_t v6 = [v5 objectForKey:@"keys"];
    uint64_t v7 = (void *)[v6 mutableCopy];

    [v7 addObject:v4];
    if (v7)
    {
      uint64_t v8 = [(UIKBTree *)self cache];
      [v8 setObject:v7 forKey:@"keys"];
    }
    id v9 = [(UIKBTree *)self _cacheRootNameForKey:v4];
    uint64_t v10 = [(UIKBTree *)self cache];
    id v11 = [v10 objectForKeyedSubscript:v9];

    if ([v11 count])
    {
      if ([v11 containsObject:v4])
      {
LABEL_9:
        long long v14 = [(UIKBTree *)self cache];
        [v14 setObject:v11 forKey:v9];

        goto LABEL_10;
      }
      uint64_t v12 = [v11 arrayByAddingObject:v4];
    }
    else
    {
      v15[0] = v4;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    long long v13 = (void *)v12;

    id v11 = v13;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)removeKeyFromCachedKeyList:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIKBTree *)self cache];
    uint64_t v6 = [v5 objectForKey:@"keys"];
    uint64_t v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v4];
    uint64_t v8 = [(UIKBTree *)self cache];
    [v8 setObject:v7 forKey:@"keys"];

    id v9 = [(UIKBTree *)self _cacheRootNameForKey:v4];
    uint64_t v10 = [(UIKBTree *)self cache];
    id v11 = [v10 objectForKeyedSubscript:v9];

    if ([v11 count])
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __39__UIKBTree_removeKeyFromCachedKeyList___block_invoke;
      v18[3] = &unk_1E52F5388;
      id v19 = v4;
      long long v13 = [v12 predicateWithBlock:v18];
      uint64_t v14 = [v11 filteredArrayUsingPredicate:v13];

      id v11 = (void *)v14;
    }
    uint64_t v15 = [v11 count];
    long long v16 = [(UIKBTree *)self cache];
    long long v17 = v16;
    if (v15) {
      [v16 setObject:v11 forKey:v9];
    }
    else {
      [v16 removeObjectForKey:v9];
    }
  }
}

uint64_t __39__UIKBTree_removeKeyFromCachedKeyList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqual:v4] ^ 1;

  return v5;
}

- (void)removeKeyFromAllCachedLists:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [(UIKBTree *)self cache];
    uint64_t v6 = [v5 allKeys];

    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      uint64_t v21 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        uint64_t v22 = v8;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
          uint64_t v12 = [(UIKBTree *)self cache];
          long long v13 = [v12 objectForKey:v11];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = (void *)[v13 mutableCopy];
            id v15 = v4;
            [v14 removeObject:v4];
            uint64_t v16 = [v14 count];
            long long v17 = [(UIKBTree *)self cache];
            uint64_t v18 = v17;
            if (v16) {
              [v17 setObject:v14 forKey:v11];
            }
            else {
              [v17 removeObjectForKey:v11];
            }

            id v4 = v15;
            uint64_t v9 = v21;
            uint64_t v8 = v22;
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    id v19 = [(UIKBTree *)self cache];
    uint64_t v20 = [v4 name];
    [v19 removeObjectForKey:v20];
  }
}

- (id)geometries
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"geometries"];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v21 = self;
    uint64_t v5 = [(UIKBTree *)self subtrees];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = [v10 geometrySet:0];
          uint64_t v12 = [v11 subtrees];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = [*(id *)(*((void *)&v22 + 1) + 8 * j) subtrees];
                [v4 addObjectsFromArray:v17];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v14);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    uint64_t v18 = [(UIKBTree *)v21 cache];
    [v18 setObject:v4 forKey:@"geometries"];
  }
  id v19 = v4;

  return v19;
}

- (id)keyAttributes
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"keyAttributes"];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v21 = self;
    uint64_t v5 = [(UIKBTree *)self subtrees];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v11 = [v10 attributeSet:0];
          uint64_t v12 = [v11 subtrees];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = [*(id *)(*((void *)&v22 + 1) + 8 * j) subtrees];
                [v4 addObjectsFromArray:v17];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v14);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    uint64_t v18 = [(UIKBTree *)v21 cache];
    [v18 setObject:v4 forKey:@"keyAttributes"];
  }
  id v19 = v4;

  return v19;
}

+ (BOOL)shouldSkipCacheString:(id)a3
{
  return a3 == @"keys"
      || a3 == @"geometries"
      || a3 == @"keyAttributes"
      || a3 == @"layoutName"
      || a3 == @"isLetters"
      || a3 == @"isScaled"
      || a3 == @"isGenerated"
      || a3 == @"resizingOffset"
      || a3 == @"isKanaPlane";
}

- (void)clearTransientCaches
{
  id v3 = [(UIKBTree *)self cache];
  [v3 removeObjectForKey:@"keys"];

  id v4 = [(UIKBTree *)self cache];
  [v4 removeObjectForKey:@"geometries"];

  uint64_t v5 = [(UIKBTree *)self cache];
  [v5 removeObjectForKey:@"keyAttributes"];

  uint64_t v6 = [(UIKBTree *)self cache];
  [v6 removeObjectForKey:@"layoutName"];

  uint64_t v7 = [(UIKBTree *)self cache];
  [v7 removeObjectForKey:@"isLetters"];

  uint64_t v8 = [(UIKBTree *)self cache];
  [v8 removeObjectForKey:@"isScaled"];

  uint64_t v9 = [(UIKBTree *)self cache];
  [v9 removeObjectForKey:@"isGenerated"];

  uint64_t v10 = [(UIKBTree *)self cache];
  [v10 removeObjectForKey:@"resizingOffset"];

  id v11 = [(UIKBTree *)self cache];
  [v11 removeObjectForKey:@"isKanaPlane"];
}

- (id)keysOrderedByPositionWithoutZip
{
  uint64_t v2 = [(UIKBTree *)self keys];
  id v3 = [v2 sortedArrayUsingFunction:keyPositionSort context:MEMORY[0x1E4F1CC28]];

  return v3;
}

- (id)keysOrderedByPositionRTL
{
  uint64_t v2 = [(UIKBTree *)self keys];
  id v3 = [v2 sortedArrayUsingFunction:keyPositionSort context:MEMORY[0x1E4F1CC38]];

  return v3;
}

- (id)geometriesOrderedByPosition
{
  uint64_t v2 = [(UIKBTree *)self geometries];
  id v3 = [v2 sortedArrayUsingFunction:keyPositionSort context:0];

  return v3;
}

- (id)keyByKeyName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = nameByRemovingHash(a3);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(UIKBTree *)self keys];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 unhashedName];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)keysByKeyName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = nameByRemovingHash(a3);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(UIKBTree *)self keys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 unhashedName];
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)keysWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(UIKBTree *)self keys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 name];
          uint64_t v13 = [v12 rangeOfString:v4];

          if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)keysWithRepresentedString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(UIKBTree *)self keys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v11 fullRepresentedString];
          int v13 = [v12 isEqualToString:v4];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)keysWithInteractionTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(UIKBTree *)self keys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "interactionType"));
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)keysExcludingEmptyKeys
{
  id v3 = [(UIKBTree *)self keysWithString:@"Empty-Key"];
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v5 = [(UIKBTree *)self keys];
    id v6 = [v4 arrayWithArray:v5];

    [v6 removeObjectsInArray:v3];
  }
  else
  {
    id v6 = [(UIKBTree *)self keys];
  }

  return v6;
}

- (BOOL)usesAutoShift
{
  return [(UIKBTree *)self BOOLForProperty:@"autoshift"];
}

- (id)alternateKeyplaneName
{
  if (!+[UIKeyboardLayout _showSmallDisplayKeyplane]
    || ([(UIKBTree *)self stringForProperty:@"more-alternate-small-display"],
        (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = [(UIKBTree *)self stringForProperty:@"more-alternate"];
    if (!v3)
    {
      id v3 = [(UIKBTree *)self name];
    }
  }
  return v3;
}

- (id)gestureKeyplaneName
{
  return [(UIKBTree *)self stringForProperty:@"gesture-keyplane"];
}

- (id)shiftAlternateKeyplaneName
{
  if (!+[UIKeyboardLayout _showSmallDisplayKeyplane]
    || ([(UIKBTree *)self stringForProperty:@"shift-alternate-small-display"],
        (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = [(UIKBTree *)self stringForProperty:@"shift-alternate"];
    if (!v3)
    {
      id v3 = [(UIKBTree *)self name];
    }
  }
  return v3;
}

- (BOOL)isShiftKeyplane
{
  return [(UIKBTree *)self BOOLForProperty:@"shift"];
}

- (BOOL)isAlphabeticPlane
{
  return [(UIKBTree *)self BOOLForProperty:@"is-alphabetic-plane"];
}

- (BOOL)isKanaPlane
{
  id v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"isKanaPlane"];

  if (!v4)
  {
    if ([(UIKBTree *)self type] == 2)
    {
      uint64_t v5 = [(UIKBTree *)self name];
      uint64_t v6 = [v5 containsString:@"Kana-Plane"];
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v7 = [(UIKBTree *)self cache];
    uint64_t v8 = [NSNumber numberWithBool:v6];
    [v7 setObject:v8 forKey:@"isKanaPlane"];
  }
  uint64_t v9 = [(UIKBTree *)self cache];
  uint64_t v10 = [v9 objectForKey:@"isKanaPlane"];
  char v11 = [v10 BOOLValue];

  return v11;
}

- (BOOL)diacriticForwardCompose
{
  return [(UIKBTree *)self BOOLForProperty:@"diacritic-forward-compose"];
}

- (BOOL)shouldSkipCandidateSelection
{
  return [(UIKBTree *)self BOOLForProperty:@"shouldskipcandidateselection"];
}

- (BOOL)shouldSkipCandidateSelectionForVariants
{
  return [(UIKBTree *)self BOOLForProperty:@"shouldskipcandidateselectionforvariants"];
}

- (BOOL)shouldSuppressDragRetest
{
  return [(UIKBTree *)self BOOLForProperty:@"shouldsuppressdragretest"];
}

- (BOOL)notUseCandidateSelection
{
  return [(UIKBTree *)self BOOLForProperty:@"notusecandidateselection"];
}

- (BOOL)noLanguageIndicator
{
  return [(UIKBTree *)self BOOLForProperty:@"no-language-indicator"];
}

- (BOOL)isShiftKeyPlaneChooser
{
  return [(UIKBTree *)self BOOLForProperty:@"shift-is-plane-chooser"];
}

- (BOOL)usesAdaptiveKeys
{
  return [(UIKBTree *)self BOOLForProperty:@"adaptive-keys"];
}

- (BOOL)usesKeyCharging
{
  return [(UIKBTree *)self BOOLForProperty:@"keycharging"];
}

- (BOOL)looksLikeShiftAlternate
{
  uint64_t v2 = [(UIKBTree *)self objectForProperty:@"looks-like-shift-alternate"];
  id v3 = v2;
  BOOL v4 = v2 && [v2 integerValue] != 47 && objc_msgSend(v3, "integerValue") != 25;

  return v4;
}

- (BOOL)looksExactlyLikeShiftAlternate
{
  return [(UIKBTree *)self intForProperty:@"looks-like-shift-alternate"] == 46;
}

- (BOOL)isLetters
{
  id v3 = [(UIKBTree *)self cache];
  BOOL v4 = [v3 objectForKey:@"isLetters"];

  if (!v4)
  {
    uint64_t v5 = [(UIKBTree *)self name];
    BOOL v6 = [v5 rangeOfString:@"Letters"] != 0x7FFFFFFFFFFFFFFFLL;

    uint64_t v7 = [(UIKBTree *)self cache];
    uint64_t v8 = [NSNumber numberWithBool:v6];
    [v7 setObject:v8 forKey:@"isLetters"];
  }
  uint64_t v9 = [(UIKBTree *)self cache];
  uint64_t v10 = [v9 objectForKey:@"isLetters"];
  char v11 = [v10 BOOLValue];

  return v11;
}

- (BOOL)isGenerated
{
  return [(UIKBTree *)self BOOLForProperty:@"isGenerated"];
}

- (void)setIsGenerated:(BOOL)a3
{
  BOOL v4 = [(UIKBTree *)self cache];
  id v5 = v4;
  if (a3) {
    [v4 setObject:&unk_1ED3F4818 forKey:@"isGenerated"];
  }
  else {
    [v4 removeObjectForKey:@"isGenerated"];
  }
}

- (double)resizingOffset
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"resizingOffset"];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (void)setResizingOffset:(double)a3
{
  id v5 = [(UIKBTree *)self cache];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forKey:@"resizingOffset"];
}

- (int64_t)nativeIdiom
{
  uint64_t v2 = [(UIKBTree *)self objectForProperty:@"nativeIdiom"];
  float v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)cacheNativeIdiomIfNecessaryForScreenTraits:(id)a3
{
  id v10 = a3;
  int64_t v4 = [(UIKBTree *)self objectForProperty:@"nativeIdiom"];
  if (!v4)
  {
    id v5 = [(UIKBTree *)self objectForProperty:@"KBvisualStyle"];

    if (v5)
    {
      uint64_t v6 = [(UIKBTree *)self visualStylingForScreenTraits:v10] << 58 >> 58;
      uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)self->properties mutableCopy];
      properties = self->properties;
      self->properties = v7;

      uint64_t v9 = [NSNumber numberWithInteger:v6];
      [(UIKBTree *)self setObject:v9 forProperty:@"nativeIdiom"];
    }
  }
}

- (BOOL)isSplit
{
  uint64_t v2 = [(UIKBTree *)self name];
  char v3 = [v2 hasSuffix:@"-split"];

  return v3;
}

- (double)primaryKeylayoutWidthRatio
{
  [(UIKBTree *)self keyUnionFrame];
  double v4 = v3;
  [(UIKBTree *)self frame];
  return v4 / v5;
}

- (int)dragThreshold
{
  return [(UIKBTree *)self intForProperty:@"drag-threshold"];
}

- (id)autolocalizedKeyCacheIterator
{
  double v3 = [UIKBTreeLocalizedKeylistEnumerator alloc];
  double v4 = [(UIKBTree *)self cache];
  double v5 = [(UIKBTreeLocalizedKeylistEnumerator *)v3 initWithKeyplaneCache:v4];

  return v5;
}

- (BOOL)supportsContinuousPath
{
  return [(UIKBTree *)self BOOLForProperty:@"supports-continuous-path"];
}

- (BOOL)supportsMultitap
{
  return [(UIKBTree *)self BOOLForProperty:@"supports-multitap"];
}

- (BOOL)supportsSupplementalDisplayString
{
  uint64_t v2 = [(UIKBTree *)self stringForProperty:@"KBhint"];
  char v3 = [v2 isEqualToString:0x1ED14B820];

  return v3;
}

- (BOOL)usesControlKeyAppearance
{
  uint64_t v2 = [(UIKBTree *)self stringForProperty:@"KBhint"];
  char v3 = [v2 isEqualToString:@"ControlLike"];

  return v3;
}

- (BOOL)supportsType:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      if ([v9 type] == 11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v9;

    if (!v11) {
      return 1;
    }
    if (a3 > 119)
    {
      switch(a3)
      {
        case 'x':
LABEL_19:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeWebSearchStr;
          break;
        case '\x7F':
LABEL_20:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeNumberPadStr;
          break;
        case '{':
LABEL_18:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeNumbersAndPunctuationStr;
          break;
        default:
LABEL_27:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeDefaultStr;
          break;
      }
    }
    else
    {
      uint64_t v12 = UIKBAttributeValueKeyboardTypeASCIICapableStr;
      switch(a3)
      {
        case 1:
          break;
        case 2:
          goto LABEL_18;
        case 3:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeURLStr;
          break;
        case 4:
          goto LABEL_20;
        case 5:
          uint64_t v12 = UIKBAttributeValueKeyboardTypePhonePadStr;
          break;
        case 6:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeNamePhonePadStr;
          break;
        case 7:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeEmailAddressStr;
          break;
        case 8:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeDecimalPadStr;
          break;
        case 9:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeTwitterStr;
          break;
        case 10:
          goto LABEL_19;
        case 11:
          uint64_t v12 = UIKBAttributeValueKeyboardTypeASCIICapableNumberPadStr;
          break;
        default:
          goto LABEL_27;
      }
    }
    int v13 = *v12;
    long long v14 = [v11 properties];
    long long v15 = [v14 objectForKey:v13];
    BOOL v10 = v15 != 0;
  }
  else
  {
LABEL_9:
    BOOL v10 = 1;
    id v11 = v4;
  }

  return v10;
}

- (BOOL)looksLike:(id)a3
{
  double v4 = [a3 componentName];
  uint64_t v5 = [v4 lowercaseString];
  uint64_t v6 = [(UIKBTree *)self shiftAlternateKeyplaneName];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    return 0;
  }
  return [(UIKBTree *)self looksExactlyLikeShiftAlternate];
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  char v3 = [(UIKBTree *)self subtreeWithName:a3];
  double v4 = v3;
  if (v3)
  {
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (id)findLeftMoreKey
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(UIKBTree *)self cache];
  char v3 = [v2 objectForKey:@"More-Key"];

  double v4 = [v3 objectAtIndex:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "frame", (void)v16);
        double v12 = v11;
        [v10 frame];
        if (v12 > v13)
        {
          id v14 = v10;

          double v4 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updateDictationKeyOnNumberPads:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v4 = [(UIKBTree *)self keys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v4);
      }
      double v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      [v10 setVisible:1];
      if (v7) {
        break;
      }
      if ([v10 interactionType] == 5) {
        id v7 = v10;
      }
      else {
        id v7 = 0;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
    id v11 = v10;

    if (!v11) {
      goto LABEL_26;
    }
    double v12 = [v11 name];
    int v13 = [v12 isEqualToString:@"NumberPad-Dot"];

    if (v13)
    {
      if (!v3)
      {
        id v14 = [v11 shape];
        double v15 = [v7 shape];
        long long v16 = +[UIKBShape shapeByCombining:v14 withShape:v15];
        [v11 setShape:v16];
      }
      long long v17 = v7;
      BOOL v18 = v3;
    }
    else
    {
      if (v3)
      {
        long long v19 = [v7 shape];
        long long v20 = [v11 shape];
        uint64_t v21 = +[UIKBShape shapeByCombining:v19 withShape:v20];
        uint64_t v22 = v7;
      }
      else
      {
        long long v19 = [v11 shape];
        long long v20 = [v7 shape];
        uint64_t v21 = +[UIKBShape shapeByCombining:v19 withShape:v20];
        uint64_t v22 = v11;
      }
      [v22 setShape:v21];

      [v7 setVisible:v3];
      BOOL v18 = v3 ^ 1;
      long long v17 = v11;
    }
    [v17 setVisible:v18];
  }
  else
  {
    id v7 = 0;
LABEL_19:
    id v11 = v4;
  }

LABEL_26:
}

- (id)keysForMergeConditions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKBTree *)self subtreeWithType:13];
  if (v3)
  {
    double v4 = [MEMORY[0x1E4F1CA80] set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v19 = v3;
    uint64_t v5 = [v3 properties];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __34__UIKBTree_keysForMergeConditions__block_invoke;
          v24[3] = &unk_1E52E0B30;
          id v25 = v4;
          [v10 enumerateObjectsUsingBlock:v24];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    id v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [(UIKBTree *)self firstCachedKeyWithName:*(void *)(*((void *)&v20 + 1) + 8 * j)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v14);
    }

    BOOL v3 = v19;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __34__UIKBTree_keysForMergeConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)subsumeDisappearingKeyName:(id)a3 intoKeyName:(id)a4 factors:(id)a5 inRightToLeft:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  id v16 = [(UIKBTree *)self firstCachedKeyWithName:a4];
  id v12 = [(UIKBTree *)self firstCachedKeyWithName:v11];

  uint64_t v13 = [v16 shape];
  uint64_t v14 = (void *)[v13 copy];

  uint64_t v15 = [v12 shape];
  [v14 addRectFrom:v15 mergeActionFactors:v10 inRightToLeft:v6];

  [v16 setShape:v14];
}

- (id)mergeKeyNames:(id)a3 inRightToLeft:(BOOL)a4
{
  BOOL v41 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  uint64_t v40 = self;
  double v34 = [(UIKBTree *)self subtreeWithType:13];
  uint64_t v5 = v34;
  if (v34)
  {
    id v38 = (id)[v39 mutableCopy];
    BOOL v6 = [v34 properties];
    uint64_t v7 = [v6 objectForKey:v39];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v61 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v12 = [v11 orderedKeyList];

          if (!v12)
          {
            uint64_t v13 = [v11 disappearingKeyName];
            uint64_t v14 = [v11 remainingKeyName];
            uint64_t v15 = [v11 factors];
            [(UIKBTree *)v40 subsumeDisappearingKeyName:v13 intoKeyName:v14 factors:v15 inRightToLeft:v41];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v8);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v32 = [v34 properties];
    uint64_t v35 = [v32 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v57;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v57 != v33)
          {
            uint64_t v17 = v16;
            objc_enumerationMutation(v32);
            uint64_t v16 = v17;
          }
          uint64_t v36 = v16;
          BOOL v18 = *(void **)(*((void *)&v56 + 1) + 8 * v16);
          long long v19 = [v34 properties];
          long long v20 = [v19 objectForKey:v39];

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v53 != v23) {
                  objc_enumerationMutation(v21);
                }
                id v25 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                long long v26 = [v25 orderedKeyList];
                BOOL v27 = v26 == 0;

                if (!v27)
                {
                  long long v28 = [v25 orderedKeyList];
                  long long v29 = [v18 arrayByAddingObjectsFromArray:v28];

                  v51[0] = 0;
                  v51[1] = v51;
                  v51[2] = 0x2020000000;
                  v51[3] = 0;
                  v42[0] = MEMORY[0x1E4F143A8];
                  v42[1] = 3221225472;
                  v42[2] = __40__UIKBTree_mergeKeyNames_inRightToLeft___block_invoke;
                  v42[3] = &unk_1E52F53B0;
                  id v43 = v39;
                  CGRect v44 = v40;
                  id v30 = v29;
                  id v45 = v30;
                  uint64_t v46 = v25;
                  BOOL v50 = v41;
                  uint64_t v49 = v51;
                  CGFloat v47 = v18;
                  id v48 = v38;
                  [v30 enumerateObjectsUsingBlock:v42];

                  _Block_object_dispose(v51, 8);
                }
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v64 count:16];
            }
            while (v22);
          }

          uint64_t v16 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [v32 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v35);
    }

    uint64_t v5 = v34;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

void __40__UIKBTree_mergeKeyNames_inRightToLeft___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 48) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    uint64_t v9 = [*(id *)(a1 + 48) objectAtIndex:a3];
    id v10 = [*(id *)(a1 + 56) factors];
    [v7 subsumeDisappearingKeyName:v8 intoKeyName:v9 factors:v10 inRightToLeft:*(unsigned __int8 *)(a1 + 88)];

    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  }
  unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v11 >= [*(id *)(a1 + 64) count])
  {
    *a4 = 1;
    id v12 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 48), "subarrayWithRange:", a3 + 1, objc_msgSend(*(id *)(a1 + 48), "count") - (a3 + 1));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v12 addObjectsFromArray:v13];
  }
}

- (id)rightSpaceKey
{
  uint64_t v2 = [(UIKBTree *)self cachedKeysByKeyName:@"Space-Key"];
  unint64_t v3 = [v2 count];
  double v4 = [v2 objectAtIndex:0];
  if (v3 >= 2)
  {
    uint64_t v5 = [v2 objectAtIndex:1];
    [v4 frame];
    double MinX = CGRectGetMinX(v11);
    [v5 frame];
    if (MinX >= CGRectGetMinX(v12)) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = v5;
    }
    id v8 = v7;

    double v4 = v8;
  }

  return v4;
}

- (void)clearManualAddedKey
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(UIKBTree *)self firstCachedKeyWithName:@"Writeboard-Key"];
  [(UIKBTree *)self removeKeyFromCachedKeyList:v3];
  double v4 = [(UIKBTree *)self firstCachedKeyWithName:@"Dynamic-Non-Roman-to-Roman-Switch-Key"];

  [(UIKBTree *)self removeKeyFromCachedKeyList:v4];
  uint64_t v5 = [(UIKBTree *)self keysetCanContainWriteboardKey];
  BOOL v6 = v5;
  if (v5 && [v5 count])
  {
    long long v19 = v4;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v18 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "name", v18);
          char v15 = [v14 isEqualToString:@"Writeboard-Key"];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v13 name];
            int v17 = [v16 isEqualToString:@"Dynamic-Non-Roman-to-Roman-Switch-Key"];

            if (!v17) {
              continue;
            }
          }
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [v8 removeObjectsInArray:v7];
    BOOL v6 = v18;
    double v4 = v19;
  }
}

- (id)keysetCanContainWriteboardKey
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  double v4 = [(UIKBTree *)self subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (!v5)
  {
    id v30 = 0;
    goto LABEL_53;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v45;
  double v34 = v4;
  uint64_t v32 = *(void *)v45;
  do
  {
    uint64_t v8 = 0;
    uint64_t v33 = v6;
    do
    {
      if (*(void *)v45 != v7)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(v4);
        uint64_t v8 = v9;
      }
      uint64_t v35 = v8;
      uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
      uint64_t v11 = objc_msgSend(v10, "name", v32);
      long long v37 = v10;
      if ([v11 containsString:@"Control"])
      {
      }
      else
      {
        CGRect v12 = [v10 name];
        int v13 = [v12 containsString:@"split-right"];

        uint64_t v10 = v37;
        if (!v13) {
          goto LABEL_47;
        }
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v14 = [v10 keySet];
      char v15 = [v14 subtrees];

      id obj = v15;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (!v16) {
        goto LABEL_46;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      uint64_t v36 = *(void *)v41;
      while (2)
      {
        uint64_t v19 = 0;
        uint64_t v38 = v17;
        do
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
          if ([v20 displayRowHint] == 4
            || [v20 displayRowHint] == 5)
          {
            goto LABEL_52;
          }
          if ((([(UIKBTree *)self visualStyling] & 0x3F) == 1
             || ([(UIKBTree *)self visualStyling] & 0x3F) == 0x18
             || ([(UIKBTree *)self visualStyling] & 0x3F) == 0x19
             || ([(UIKBTree *)self visualStyling] & 0x3F) == 0x1A
             || ([(UIKBTree *)self visualStyling] & 0x3F) == 0x17)
            && [v20 displayRowHint] == 2)
          {
            uint64_t v2 = [v10 name];
            if ([v2 containsString:@"Handwriting"])
            {

LABEL_52:
              id v30 = [v20 subtrees];

              double v4 = v34;
              goto LABEL_53;
            }
            if (![(UIKBTree *)self isSplit]) {
              goto LABEL_39;
            }
            char v21 = 1;
          }
          else
          {
            if (![(UIKBTree *)self isSplit]) {
              goto LABEL_44;
            }
            char v21 = 0;
          }
          long long v22 = [v20 subtrees];
          if (![v22 count])
          {

            uint64_t v18 = v36;
            uint64_t v17 = v38;
            if ((v21 & 1) == 0) {
              goto LABEL_44;
            }
LABEL_39:

            goto LABEL_44;
          }
          id v23 = [v20 subtrees];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v49;
            while (2)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v49 != v27) {
                  objc_enumerationMutation(v24);
                }
                if ([*(id *)(*((void *)&v48 + 1) + 8 * i) interactionType] == 6)
                {
                  char v29 = 1;
                  goto LABEL_41;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v54 count:16];
              if (v26) {
                continue;
              }
              break;
            }
            char v29 = 0;
          }
          else
          {
            char v29 = 0;
          }
LABEL_41:

          uint64_t v10 = v37;
          if (v21) {

          }
          uint64_t v18 = v36;
          uint64_t v17 = v38;
          if (v29) {
            goto LABEL_52;
          }
LABEL_44:
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
        double v4 = v34;
        uint64_t v7 = v32;
        if (v17) {
          continue;
        }
        break;
      }
LABEL_46:

      uint64_t v6 = v33;
LABEL_47:
      uint64_t v8 = v35 + 1;
    }
    while (v35 + 1 != v6);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
    id v30 = 0;
  }
  while (v6);
LABEL_53:

  return v30;
}

- (id)shapeFromFrame:(CGRect)a3 leftPadding:(double)a4 rightPadding:(double)a5
{
  uint64_t v5 = -[UIKBShape initWithGeometry:frame:paddedFrame:]([UIKBShape alloc], "initWithGeometry:frame:paddedFrame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x + a4, a3.origin.y + 0.0, a3.size.width - (a4 + a5), a3.size.height);
  return v5;
}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIKBTree *)self firstCachedKeyWithName:@"Dismiss-Key"];
  uint64_t v6 = [(UIKBTree *)self rightSpaceKey];
  long long v135 = [(UIKBTree *)self firstCachedKeyWithName:@"Return-Key"];
  uint64_t v7 = [(UIKBTree *)self cachedKeysByKeyName:@"More-Key"];
  uint64_t v8 = [(UIKBTree *)self firstCachedKeyWithName:@"Handwriting-Input"];

  uint64_t v9 = [(UIKBTree *)self firstKeyplaneSwitchKey];

  BOOL v129 = v3;
  if (v9)
  {
    id v138 = [(UIKBTree *)self firstKeyplaneSwitchKey];
    v137 = [v7 objectAtIndex:0];
    goto LABEL_8;
  }
  if ([v7 count] == 2)
  {
    uint64_t v10 = [v7 objectAtIndex:0];
    [v10 paddedFrame];
    double MinX = CGRectGetMinX(v155);
    CGRect v12 = [v7 objectAtIndex:1];
    [v12 paddedFrame];
    id v138 = [v7 objectAtIndex:MinX < CGRectGetMinX(v156)];

    int v13 = [v7 objectAtIndex:0];
    [v13 paddedFrame];
    double v14 = CGRectGetMinX(v157);
    char v15 = [v7 objectAtIndex:1];
    [v15 paddedFrame];
    v137 = [v7 objectAtIndex:v14 >= CGRectGetMinX(v158)];

    goto LABEL_8;
  }
  BOOL v16 = 0;
  if ([v7 count] == 1 && v8)
  {
    v137 = [v7 firstObject];
    id v138 = v135;
LABEL_8:
    uint64_t v17 = [(UIKBTree *)self firstCachedKeyWithName:@"Dictation-Key"];
    uint64_t v18 = [(UIKBTree *)self firstCachedKeyWithName:@"International-Key"];
    uint64_t v19 = [(UIKBTree *)self cachedKeysByKeyName:@"Modify-For-Writeboard-Key"];
    id v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_243_0];

    char v21 = [v20 firstObject];
    LODWORD(v19) = [v21 displayRowHint];
    long long v136 = v18;
    if (v19 != [v18 displayRowHint])
    {

      char v21 = 0;
      id v20 = 0;
    }
    BOOL v16 = 0;
    if (!v6 || !v138 || !v5) {
      goto LABEL_60;
    }
    if ([(UIKBTree *)self isSplit])
    {
      [v6 frame];
      double MidX = CGRectGetMidX(v159);
      [(UIKBTree *)self frame];
      if (MidX < CGRectGetMidX(v160))
      {
        [v21 frame];
        double Width = CGRectGetWidth(v161);
        [v17 frame];
        if (Width <= CGRectGetWidth(v162))
        {
          BOOL v16 = 0;
LABEL_60:
          uint64_t v64 = v135;

          goto LABEL_61;
        }
        id v24 = v21;

        char v21 = 0;
        id v20 = 0;
        uint64_t v6 = v24;
      }
    }
    [v17 frame];
    CGFloat v123 = CGRectGetMinX(v163);
    [v17 paddedFrame];
    CGFloat v25 = CGRectGetMinX(v164);
    [v17 frame];
    CGFloat MaxX = CGRectGetMaxX(v165);
    [v17 paddedFrame];
    CGFloat v27 = CGRectGetMaxX(v166);
    double v28 = 0.0;
    if ([(UIKBTree *)self isSplit])
    {
      char v29 = v137;
      [v137 frame];
      double v30 = CGRectGetMaxX(v167);
      [v18 frame];
      double v31 = CGRectGetMaxX(v168);
      if (v30 <= v31) {
        uint64_t v32 = v137;
      }
      else {
        uint64_t v32 = v18;
      }
      if (v30 <= v31) {
        char v29 = v18;
      }
      [v32 frame];
      double v33 = CGRectGetMaxX(v169);
      [v29 frame];
      CGFloat v34 = CGRectGetMaxX(v170);
      if (![v17 visible] || objc_msgSend(v18, "visible")) {
        double v33 = v34;
      }
      [v17 frame];
      double v28 = CGRectGetMinX(v171) - v33;
    }
    CGFloat v112 = v27;
    CGFloat v114 = MaxX;
    CGFloat v120 = v25;
    v125 = v17;
    [v6 frame];
    double v131 = v36;
    double v132 = v35;
    double v110 = v37;
    double v130 = v38;
    id v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    [v138 frame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [v137 frame];
    double MinY = CGRectGetMinY(v172);
    [v137 frame];
    double Height = CGRectGetHeight(v173);
    [v5 frame];
    CGFloat v49 = v48;
    double v133 = v50;
    double v134 = v51;
    CGFloat v53 = v52;
    double v54 = v41;
    double v55 = v43;
    double v56 = v45;
    double v57 = v47;
    if (v21) {
      objc_msgSend(v21, "frame", v41, v43, v45, v47);
    }
    v191.origin.double x = v49;
    v191.origin.double y = v133;
    v191.size.double height = v134;
    v191.size.double width = v53;
    CGRect v174 = CGRectUnion(*(CGRect *)&v54, v191);
    CGFloat v108 = CGRectGetWidth(v174);
    if ([(UIKBTree *)self isSplit])
    {
      if (v21)
      {
        [v137 frame];
        double v58 = CGRectGetWidth(v175);
        [v17 frame];
        double v59 = (v58 + CGRectGetWidth(v176)) * 0.5;
      }
      else
      {
        v179.origin.double x = v41;
        v179.origin.double y = v43;
        v179.size.double width = v45;
        v179.size.double height = v47;
        double v65 = CGRectGetWidth(v179);
        [v137 frame];
        BOOL v66 = v65 <= CGRectGetWidth(v180);
        double v59 = v45;
        if (!v66)
        {
          [v137 frame];
          double v59 = CGRectGetWidth(v181);
        }
      }
      uint64_t v67 = v17;
    }
    else
    {
      [v17 frame];
      double v59 = CGRectGetWidth(v177);
      if (v8)
      {
        v178.origin.double x = v41;
        v178.origin.double y = v43;
        v178.size.double width = v45;
        v178.size.double height = v47;
        double v60 = (v59 + CGRectGetWidth(v178)) * 0.5;
        double v61 = v41;
        double v62 = v43;
        double v63 = v47;
        double v59 = v60;
LABEL_40:
        CGRect v107 = v7;
        BOOL v122 = v5;
        CGFloat v68 = CGRectGetWidth(*(CGRect *)&v61);
        [v18 frame];
        CGFloat v69 = CGRectGetWidth(v182);
        v183.origin.double x = v41;
        v183.origin.double y = v43;
        double v117 = v59;
        v183.size.double width = v59;
        v183.size.double height = v47;
        double v70 = v28 + CGRectGetWidth(v183);
        v184.origin.double x = 0.0;
        v184.size.double height = Height;
        v184.origin.double y = MinY;
        double rect = v68;
        v184.size.double width = v68;
        double v71 = v28 + v70 + CGRectGetWidth(v184);
        v185.origin.double x = v49;
        v185.origin.double y = v133;
        v185.size.double height = v134;
        double v116 = v69;
        v185.size.double width = v69;
        double v72 = CGRectGetWidth(v185) + v71;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        id v73 = v20;
        uint64_t v74 = [v73 countByEnumeratingWithState:&v148 objects:v153 count:16];
        double v118 = v43;
        double v119 = v47;
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v149;
          double v77 = v123;
          double v78 = v120;
          double v79 = v108;
          double v80 = v110;
          double v82 = v112;
          double v81 = v114;
          do
          {
            for (uint64_t i = 0; i != v75; ++i)
            {
              if (*(void *)v149 != v76) {
                objc_enumerationMutation(v73);
              }
              objc_msgSend(*(id *)(*((void *)&v148 + 1) + 8 * i), "frame", v107);
              double v72 = v72 + v28 + CGRectGetWidth(v186);
            }
            uint64_t v75 = [v73 countByEnumeratingWithState:&v148 objects:v153 count:16];
          }
          while (v75);
        }
        else
        {
          double v77 = v123;
          double v78 = v120;
          double v79 = v108;
          double v80 = v110;
          double v82 = v112;
          double v81 = v114;
        }
        BOOL v121 = v6;
        double v113 = vabdd_f64(v81, v82);
        double v115 = vabdd_f64(v77, v78);

        double v84 = v80 - ceil(v72 - v79);
        long long v146 = 0u;
        long long v147 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        id v20 = v73;
        uint64_t v85 = [v20 countByEnumeratingWithState:&v144 objects:v152 count:16];
        CGFloat v87 = v131;
        double v86 = v132;
        double v124 = v84;
        CGFloat v88 = v130;
        if (v85)
        {
          uint64_t v89 = v85;
          uint64_t v90 = *(void *)v145;
          CGFloat v87 = v131;
          double v86 = v132;
          CGFloat v88 = v130;
          do
          {
            uint64_t v91 = 0;
            CGFloat v92 = v87;
            CGFloat v93 = v84;
            CGFloat v94 = v88;
            do
            {
              if (*(void *)v145 != v90) {
                objc_enumerationMutation(v20);
              }
              objc_msgSend(*(id *)(*((void *)&v144 + 1) + 8 * v91), "frame", v107);
              CGFloat v87 = v95;
              double v84 = v96;
              CGFloat v88 = v97;
              v187.origin.double x = v86;
              v187.origin.double y = v92;
              v187.size.double width = v93;
              v187.size.double height = v94;
              double v86 = v28 + CGRectGetMaxX(v187);
              v143[0] = v86;
              v143[1] = v87;
              v143[2] = v84;
              v143[3] = v88;
              long long v98 = [MEMORY[0x1E4F29238] valueWithBytes:v143 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
              [v39 addObject:v98];

              ++v91;
              CGFloat v92 = v87;
              CGFloat v93 = v84;
              CGFloat v94 = v88;
            }
            while (v89 != v91);
            uint64_t v89 = [v20 countByEnumeratingWithState:&v144 objects:v152 count:16];
          }
          while (v89);
        }

        v188.origin.double x = v86;
        v188.origin.double y = v87;
        v188.size.double width = v84;
        v188.size.double height = v88;
        CGFloat v99 = v28 + CGRectGetMaxX(v188);
        v189.origin.double x = v99;
        v189.origin.double y = v118;
        v189.size.double width = v117;
        v189.size.double height = v119;
        v190.origin.double x = v28 + CGRectGetMaxX(v189);
        double x = v190.origin.x;
        v190.origin.double y = MinY;
        v190.size.double width = rect;
        v190.size.double height = Height;
        double v109 = v28 + CGRectGetMaxX(v190);
        double v100 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v132, v131, v124, v130, v115, v113);
        uint64_t v6 = v121;
        [v121 setShape:v100];

        v139[0] = MEMORY[0x1E4F143A8];
        v139[1] = 3221225472;
        v139[2] = __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke_2;
        v139[3] = &unk_1E52F53F8;
        v139[4] = self;
        id v140 = v39;
        double v141 = v115;
        double v142 = v113;
        id v101 = v39;
        [v20 enumerateObjectsUsingBlock:v139];
        v102 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v99, v118, v117, v119, v115, v113);
        [v138 setShape:v102];

        uint64_t v103 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v109, v133, v116, v134, v115, v113);
        uint64_t v5 = v122;
        [v122 setShape:v103];

        v104 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", x, MinY, rect, Height, v115, v113);
        uint64_t v105 = [v122 rendering];
        if (v129) {
          [(UIKBTree *)self addWriteboardKeyToCachedKeyListWithShape:v104 rendering:v105];
        }
        else {
          [(UIKBTree *)self addRomanSwitchToCachedKeyListWithShape:v104 rendering:v105];
        }
        uint64_t v7 = v107;
        uint64_t v17 = v125;

        BOOL v16 = 1;
        goto LABEL_60;
      }
      uint64_t v67 = v137;
    }
    [v67 frame];
    goto LABEL_40;
  }
  uint64_t v64 = v135;
LABEL_61:

  return v16;
}

uint64_t __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSNumber;
  id v5 = a3;
  [a2 frame];
  uint64_t v6 = [v4 numberWithDouble:CGRectGetMinX(v19)];
  uint64_t v7 = NSNumber;
  [v5 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  BOOL v16 = [v7 numberWithDouble:CGRectGetMinX(v20)];
  uint64_t v17 = [v6 compare:v16];

  return v17;
}

void __62__UIKBTree_addMessagesWriteboardKeyOrRomanSwitchIfDismissKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  [v8 CGRectValue];
  uint64_t v7 = objc_msgSend(v4, "shapeFromFrame:leftPadding:rightPadding:");
  [v6 setShape:v7];
}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIKBTree *)self firstCachedKeyWithName:@"Return-Key"];
  id v6 = [(UIKBTree *)self firstCachedKeyWithName:@"Dictation-Key"];
  uint64_t v7 = [v5 rendering];
  [v5 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v6 frame];
  CGFloat v46 = v17;
  CGFloat v47 = v16;
  double v49 = v19;
  double v50 = v18;
  [v5 frame];
  double MinX = CGRectGetMinX(v51);
  [v5 paddedFrame];
  double v21 = CGRectGetMinX(v52);
  [v5 frame];
  double MaxX = CGRectGetMaxX(v53);
  [v5 paddedFrame];
  double v23 = CGRectGetMaxX(v54);
  if (v5 && (double v24 = v23, [v5 visible]))
  {
    double v25 = vabdd_f64(MinX, v21);
    double v26 = vabdd_f64(MaxX, v24);
    if (v7 <= 0x22 && ((1 << v7) & 0x600000002) != 0
      || v7 == 9 && ![v6 visible]
      || ([(UIKBTree *)self visualStyling] & 0xFF0000) == 0xB0000)
    {
      v55.origin.double x = v9;
      v55.origin.double y = v11;
      v55.size.double width = v13;
      v55.size.double height = v15;
      double Height = CGRectGetHeight(v55);
      double v15 = ceil(Height * 0.5);
      v56.origin.double x = v9;
      v56.origin.double y = v11;
      v56.size.double width = v13;
      v56.size.double height = v15;
      double v28 = ceil(Height - CGRectGetHeight(v56));
      if (v7 == 9 || ([(UIKBTree *)self visualStyling] & 0xFF0000) == 0xB0000)
      {
        v57.origin.double x = v9;
        v57.origin.double y = v11;
        v57.size.double width = v13;
        v57.size.double height = v28;
        CGFloat MaxY = CGRectGetMaxY(v57);
        double v30 = v11;
        double v11 = MaxY;
      }
      else
      {
        v65.origin.double x = v9;
        v65.origin.double y = v11;
        v65.size.double width = v13;
        v65.size.double height = v15;
        double v30 = CGRectGetMaxY(v65);
      }
      double v38 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v30, v13, v28, v25, v26);
      [v5 setShape:v38];
    }
    else
    {
      if (!v6) {
        goto LABEL_29;
      }
      if (![v6 visible]) {
        goto LABEL_29;
      }
      v58.size.double width = v46;
      v58.origin.double x = v47;
      v58.size.double height = v49;
      v58.origin.double y = v50;
      double v32 = CGRectGetMaxX(v58);
      v59.origin.double x = v9;
      v59.origin.double y = v11;
      v59.size.double width = v13;
      v59.size.double height = v15;
      if (v32 > CGRectGetMaxX(v59))
      {
        v60.origin.double x = v9;
        v60.origin.double y = v11;
        v60.size.double width = v13;
        v60.size.double height = v15;
        v72.size.double width = v46;
        v72.origin.double x = v47;
        v72.size.double height = v49;
        v72.origin.double y = v50;
        CGRect v61 = CGRectUnion(v60, v72);
        double width = v61.size.width;
        double v13 = ceil(v61.size.width / 3.0);
        v61.origin.double x = v9;
        v61.origin.double y = v11;
        v61.size.double width = v13;
        v61.size.double height = v15;
        CGFloat v34 = CGRectGetMaxX(v61);
        v62.origin.double x = v9;
        v62.origin.double y = v11;
        v62.size.double width = v13;
        v62.size.double height = v15;
        double v35 = width - CGRectGetWidth(v62);
        v63.origin.double x = v34;
        v63.origin.double y = v11;
        v63.size.double width = v13;
        v63.size.double height = v15;
        double v48 = ceil(v35 - CGRectGetWidth(v63));
        v64.origin.double x = v34;
        v64.origin.double y = v11;
        v64.size.double width = v13;
        v64.size.double height = v15;
        double v36 = CGRectGetMaxX(v64);
        uint64_t v7 = [v6 rendering];
        double v37 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v13, v15, v25, v26);
        [v5 setShape:v37];

        double v38 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v36, v50, v48, v49, v25, v26);
        [v6 setShape:v38];
        double v9 = v34;
      }
      else
      {
LABEL_29:
        if (v7 == 9 && [v6 visible])
        {
          v66.size.double width = v46;
          double v9 = v47;
          v66.origin.double x = v47;
          v66.origin.double y = v50;
          v66.size.double height = v49;
          double v41 = CGRectGetWidth(v66);
          double v13 = ceil(v41 * 0.5);
          v67.origin.double x = v47;
          v67.origin.double y = v50;
          v67.size.double width = v13;
          v67.size.double height = v49;
          double v42 = ceil(v41 - CGRectGetWidth(v67));
          v68.origin.double x = v47;
          v68.origin.double y = v50;
          v68.size.double width = v13;
          v68.size.double height = v49;
          double v38 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", CGRectGetMaxX(v68), v50, v42, v49, v25, v26);
          [v6 setShape:v38];
          uint64_t v7 = 9;
          double v11 = v50;
          double v15 = v49;
        }
        else
        {
          v69.origin.double x = v9;
          v69.origin.double y = v11;
          v69.size.double width = v13;
          v69.size.double height = v15;
          double v43 = CGRectGetWidth(v69);
          CGFloat v44 = ceil(v43 * 0.5);
          v70.origin.double x = v9;
          v70.origin.double y = v11;
          v70.size.double width = v44;
          v70.size.double height = v15;
          double v13 = ceil(v43 - CGRectGetWidth(v70));
          v71.origin.double x = v9;
          v71.origin.double y = v11;
          v71.size.double width = v44;
          v71.size.double height = v15;
          CGFloat v45 = CGRectGetMaxX(v71);
          double v38 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v44, v15, v25, v26);
          [v5 setShape:v38];
          double v9 = v45;
        }
      }
    }

    id v39 = -[UIKBTree shapeFromFrame:leftPadding:rightPadding:](self, "shapeFromFrame:leftPadding:rightPadding:", v9, v11, v13, v15, v25, v26);
    if (v3) {
      [(UIKBTree *)self addWriteboardKeyToCachedKeyListWithShape:v39 rendering:v7];
    }
    else {
      [(UIKBTree *)self addRomanSwitchToCachedKeyListWithShape:v39 rendering:v7];
    }

    BOOL v31 = 1;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (void)addWriteboardKeyToCachedKeyListWithShape:(id)a3 rendering:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  id v6 = [(UIKBTree *)self keysetCanContainWriteboardKey];
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    double v8 = +[UIKBTree treeOfType:8];
    [v8 setName:@"Writeboard-Key"];
    [v8 setDisplayString:@"Writeboard"];
    [v8 setRepresentedString:&stru_1ED0E84C0];
    [v8 setDisplayType:53];
    [v8 setInteractionType:40];
    [v8 setShape:v10];
    [v8 setVisible:1];
    [v8 setDisplayRowHint:4];
    [v8 setDisplayTypeHint:3];
    [v8 setState:2];
    [v8 setRendering:v4];
    double v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_250_1];
    [v7 filterUsingPredicate:v9];

    [v7 addObject:v8];
    [(UIKBTree *)self removeKeyFromAllCachedLists:v8];
    [(UIKBTree *)self addkeyToCachedKeyList:v8];
  }
}

uint64_t __63__UIKBTree_addWriteboardKeyToCachedKeyListWithShape_rendering___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [@"Writeboard-Key" isEqualToString:v2] ^ 1;

  return v3;
}

- (void)addRomanSwitchToCachedKeyListWithShape:(id)a3 rendering:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v10 = a3;
  id v6 = [(UIKBTree *)self keysetCanContainWriteboardKey];
  uint64_t v7 = v6;
  if (v6 && [v6 count])
  {
    double v8 = +[UIKBTree treeOfType:8];
    [v8 setName:@"Dynamic-Non-Roman-to-Roman-Switch-Key"];
    [v8 setDisplayString:@"abc"];
    [v8 setRepresentedString:@"ASCIICapable"];
    [v8 setLocalizationKey:@"UI-abc"];
    [v8 setDisplayType:0];
    [v8 setInteractionType:9];
    [v8 setShape:v10];
    [v8 setVisible:1];
    [v8 setDisplayRowHint:4];
    [v8 setDisplayTypeHint:3];
    [v8 setState:2];
    [v8 setRendering:v4];
    double v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_261];
    [v7 filterUsingPredicate:v9];

    [v7 addObject:v8];
    [(UIKBTree *)self removeKeyFromAllCachedLists:v8];
    [(UIKBTree *)self addkeyToCachedKeyList:v8];
  }
}

uint64_t __61__UIKBTree_addRomanSwitchToCachedKeyListWithShape_rendering___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [@"Dynamic-Non-Roman-to-Roman-Switch-Key" isEqualToString:v2] ^ 1;

  return v3;
}

- (BOOL)addMessagesWriteboardKeyOrRomanSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIKBTree *)self firstCachedKeyWithName:@"Dismiss-Key"];
  int v6 = [(UIKBTree *)self visualStyle];
  if (!v5 || v6 == 101) {
    BOOL v7 = [(UIKBTree *)self addMessagesWriteboardKeyOrRomanSwitchIfNoDismissKey:v3];
  }
  else {
    BOOL v7 = [(UIKBTree *)self addMessagesWriteboardKeyOrRomanSwitchIfDismissKey:v3];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)_mutateKeys:(id)a3 scale:(double)a4 withShapeOperation:(id)a5
{
  id v7 = a3;
  BOOL v8 = (void (**)(id, void *, id))a5;
  double v9 = [MEMORY[0x1E4F1CA48] array];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke;
  v18[3] = &unk_1E52F5440;
  id v10 = v9;
  id v19 = v10;
  [v7 enumerateObjectsUsingBlock:v18];
  double v11 = +[UIKBShapeOperator operatorWithScale:a4];
  double v12 = v8[2](v8, v11, v10);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke_2;
  v14[3] = &unk_1E52F5468;
  id v13 = v12;
  id v15 = v13;
  double v16 = v17;
  [v7 enumerateObjectsUsingBlock:v14];

  _Block_object_dispose(v17, 8);
}

void __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 visible])
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v5 shape];
    [v3 addObject:v4];
  }
}

void __49__UIKBTree__mutateKeys_scale_withShapeOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 visible])
  {
    BOOL v3 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    [v4 setShape:v3];

    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)_horizontallyCoincidentKeysWithKey:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 paddedFrame];
    double v7 = v6;
    double v9 = v8;
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v11 = [(UIKBTree *)self keys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (v16 != v5)
          {
            [*(id *)(*((void *)&v20 + 1) + 8 * i) paddedFrame];
            if (v17 > v7)
            {
              [v16 paddedFrame];
              if (vabdd_f64(v18, v9) < 0.00000011920929) {
                [v10 addObject:v16];
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)centerKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__UIKBTree_centerKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGRect v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __36__UIKBTree_centerKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByCenteringShapes:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__UIKBTree_centerWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGRect v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __61__UIKBTree_centerWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerHorizontallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__UIKBTree_centerHorizontallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGRect v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __73__UIKBTree_centerHorizontallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByHorizontallyCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)centerVerticallyWhilePreservingLayoutWithKeys:(id)a3 inRect:(CGRect)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__UIKBTree_centerVerticallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGRect v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __71__UIKBTree_centerVerticallyWhilePreservingLayoutWithKeys_inRect_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByVerticallyCenteringShapesPreservingLayout:insideRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)repositionKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__UIKBTree_repositionKeys_withOffset_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGPoint v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __44__UIKBTree_repositionKeys_withOffset_scale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shapesByRepositioningShapes:*(double *)(a1 + 32) withOffset:*(double *)(a1 + 40)];
}

- (void)resizeKeys:(id)a3 withOffset:(CGPoint)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__UIKBTree_resizeKeys_withOffset_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGPoint v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __40__UIKBTree_resizeKeys_withOffset_scale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shapesByResizingShapes:*(double *)(a1 + 32) withOffset:*(double *)(a1 + 40)];
}

- (void)insetKeys:(id)a3 withInsets:(UIEdgeInsets)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__UIKBTree_insetKeys_withInsets_scale___block_invoke;
  v5[3] = &__block_descriptor_64_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  UIEdgeInsets v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __39__UIKBTree_insetKeys_withInsets_scale___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "shapesByInsettingShapes:withInsets:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)scaleKeys:(id)a3 withFactor:(CGSize)a4 scale:(double)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__UIKBTree_scaleKeys_withFactor_scale___block_invoke;
  v5[3] = &__block_descriptor_48_e48___NSArray_24__0__UIKBShapeOperator_8__NSArray_16l;
  CGSize v6 = a4;
  [(UIKBTree *)self _mutateKeys:a3 scale:v5 withShapeOperation:a5];
}

uint64_t __39__UIKBTree_scaleKeys_withFactor_scale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shapesByScalingShapes:*(double *)(a1 + 32) factor:*(double *)(a1 + 40)];
}

- (void)removeKey:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(UIKBTree *)self removeKeyFromAllCachedLists:v4];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [(UIKBTree *)self subtrees];
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        uint64_t v21 = v6;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
          if ([v9 type] == 3)
          {
            uint64_t v23 = v8;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v10 = [v9 keySet];
            double v11 = [v10 subtrees];

            uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v25;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v25 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                  double v17 = [v16 subtrees];
                  int v18 = [v17 containsObject:v4];

                  if (v18)
                  {
                    id v19 = [v16 subtrees];
                    [v19 removeObject:v4];

                    [(UIKBTree *)self setObject:0 forProperty:@"KBunionFrame"];
                    [(UIKBTree *)self setObject:0 forProperty:@"KBunionPaddedFrame"];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v13);
            }

            uint64_t v7 = v20;
            uint64_t v6 = v21;
            uint64_t v8 = v23;
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }
  }
}

- (void)insertKey:(id)a3 withFrame:(CGRect)a4 andShiftKeys:(id)a5 scale:(double)a6
{
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  uint64_t v14 = [(UIKBTree *)self cache];
  id v15 = [v14 allValues];
  char v16 = [v15 containsObject:v12];

  if ((v16 & 1) == 0)
  {
    if (v12)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v17 = v13;
      id v18 = (id)[v17 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v47;
        double v20 = *MEMORY[0x1E4F1DB30];
        double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        do
        {
          for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            objc_msgSend(v23, "frame", (void)v46);
            if (v25 != v20 || v24 != v21)
            {
              id v18 = v23;
              goto LABEL_15;
            }
          }
          id v18 = (id)[v17 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v18);
      }
LABEL_15:

      [v12 setState:2];
      [v12 setVisible:1];
      objc_msgSend(v12, "setDisplayRowHint:", objc_msgSend(v18, "displayRowHint"));
      long long v27 = +[UIKBShapeOperator operatorWithScale:a6];
      if (v18) {
        long long v28 = v18;
      }
      else {
        long long v28 = v12;
      }
      long long v29 = objc_msgSend(v28, "shape", (void)v46);
      [v29 frame];
      if (width == -1.0)
      {
        double v32 = v30;
      }
      else
      {
        [v29 frame];
        double v32 = v31 - width;
      }
      double v34 = 0.0;
      double v35 = +[UIKBShape shapeByResizingShape:byAmount:](UIKBShape, "shapeByResizingShape:byAmount:", v29, v32, 0.0);
      [v12 setShape:v35];

      double v33 = 0.0;
      if (x != -1.0)
      {
        [v12 frame];
        double v33 = x - v36;
      }
      if (y != -1.0)
      {
        [v12 frame];
        double v34 = y - v37;
      }
      double v38 = [v12 shape];
      double v50 = v38;
      id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      uint64_t v40 = objc_msgSend(v27, "shapesByRepositioningShapes:withOffset:", v39, v33, v34);
      double v41 = [(id)v40 firstObject];
      [v12 setShape:v41];

      [(UIKBTree *)self addkeyToCachedKeyList:v12];
      double v42 = [(UIKBTree *)self supplementaryKeyList];
      double v43 = [v42 subtrees];
      LOBYTE(v40) = [v43 containsObject:v12];

      if ((v40 & 1) == 0)
      {
        CGFloat v44 = [(UIKBTree *)self supplementaryKeyList];
        CGFloat v45 = [v44 subtrees];
        [v45 addObject:v12];
      }
    }
    else
    {
      double v33 = *MEMORY[0x1E4F1DAD8];
    }
    -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v13, width + v33, 0.0, a6);
  }
}

- (void)removeKey:(id)a3 andShiftKeys:(id)a4 scale:(double)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    [v8 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    [(UIKBTree *)self removeKey:v8];
    id v18 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(id *)(*((void *)&v26 + 1) + 8 * v23);
          if (v24 != v8)
          {
            objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v23), "frame", (void)v26);
            double MinX = CGRectGetMinX(v32);
            v33.origin.double x = v11;
            v33.origin.double y = v13;
            v33.size.double width = v15;
            v33.size.double height = v17;
            if (MinX >= CGRectGetMaxX(v33)) {
              [v18 addObject:v24];
            }
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v21);
    }

    -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v18, -v15, 0.0, a5);
  }
}

- (void)replaceKey:(id)a3 withKey:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && v6 && v7 != v6)
  {
    id v9 = [v6 shape];
    double v10 = (void *)[v9 copy];
    [v8 setShape:v10];

    [v8 setVisible:1];
    objc_msgSend(v8, "setDisplayRowHint:", objc_msgSend(v6, "displayRowHint"));
    [(UIKBTree *)self removeKeyFromCachedKeyList:v6];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v27 = self;
    id obj = [(UIKBTree *)self subtrees];
    uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      uint64_t v28 = *(void *)v36;
      do
      {
        uint64_t v14 = 0;
        uint64_t v29 = v12;
        do
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          double v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
          if ([v15 type] == 3)
          {
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            double v16 = [v15 keySet];
            CGFloat v17 = [v16 subtrees];

            uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v32 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                  uint64_t v23 = [v22 subtrees];
                  int v24 = [v23 containsObject:v6];

                  if (v24)
                  {
                    double v25 = [v22 subtrees];
                    long long v26 = [v22 subtrees];
                    objc_msgSend(v25, "replaceObjectAtIndex:withObject:", objc_msgSend(v26, "indexOfObject:", v6), v8);
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v19);
            }

            uint64_t v13 = v28;
            uint64_t v12 = v29;
          }
          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v12);
    }

    self = v27;
  }
  if (v8) {
    [(UIKBTree *)self addkeyToCachedKeyList:v8];
  }
}

- (void)shiftRowAndResizeLeadingControlKey:(id)a3 toSize:(CGSize)a4 scale:(double)a5
{
  double width = a4.width;
  id v8 = a3;
  id v13 = v8;
  if (v8)
  {
    [v8 frame];
    double width = v9 - width;
    double v10 = [v13 shape];
    uint64_t v11 = +[UIKBShape shapeByResizingShape:byAmount:](UIKBShape, "shapeByResizingShape:byAmount:", v10, width, 0.0);
    [v13 setShape:v11];
  }
  uint64_t v12 = [(UIKBTree *)self _horizontallyCoincidentKeysWithKey:v13];
  -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v12, -width, 0.0, a5);
}

+ (id)mergeStringForKeyName:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"Space-Key"])
  {
    id v4 = @"Space";
  }
  else if ([v3 hasSuffix:@"Dictation-Key"])
  {
    id v4 = @"Dict";
  }
  else if ([v3 hasSuffix:@"International-Key"])
  {
    id v4 = @"Intl";
  }
  else if ([v3 hasSuffix:@"Return-Key"])
  {
    id v4 = @"Return";
  }
  else
  {
    id v4 = @"More";
  }

  return v4;
}

+ (id)shapesForControlKeyShapes:(id)a3 options:(int)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"Dict"];

  if ((unint64_t)[v5 count] <= 1)
  {
    id v7 = v5;
    goto LABEL_18;
  }
  BOOL v8 = (a4 & 2) == 0;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v5 copyItems:1];
  id v7 = v9;
  if ((a4 & 0x40) != 0)
  {
    if ((a4 & 2) == 0 && v6)
    {
      uint64_t v19 = [v9 objectForKey:@"Return"];
      uint64_t v20 = [v7 objectForKey:@"Dict"];
      [v19 addRectFrom:v20];
    }
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  if ((a4 & 0x10) == 0)
  {
    if (!v6) {
      goto LABEL_49;
    }
    int v10 = a4 & 0xC;
    if ((a4 & 2) != 0)
    {
      if (v10 != 12) {
        goto LABEL_49;
      }
      double v30 = [v9 objectForKey:@"More"];
      long long v31 = [v7 objectForKey:@"Dict"];
      [v30 addRectFrom:v31 widthFraction:-0.3061 heightFraction:0.0 adjustOriginXFactor:0.0 adjustOriginYFactor:0.0];

      long long v32 = [v7 objectForKey:@"Space"];
      long long v33 = [v7 objectForKey:@"Dict"];
      [v32 addRectFrom:v33 widthFraction:0.5918 heightFraction:0.0 adjustOriginXFactor:-1.0 adjustOriginYFactor:0.0];

      long long v34 = [v7 objectForKey:@"Intl"];
      long long v35 = [v7 objectForKey:@"Dict"];
      [v34 addRectFrom:v35 widthFraction:-0.1837 heightFraction:0.0 adjustOriginXFactor:1.44 adjustOriginYFactor:0.0];

      id v13 = [v7 objectForKey:@"Dict"];
      uint64_t v14 = [v7 objectForKey:@"Dict"];
      double v16 = 2.33;
      CGFloat v17 = v13;
      uint64_t v18 = v14;
      double v15 = -0.1837;
    }
    else
    {
      if (v10 != 4)
      {
        id v13 = [v9 objectForKey:@"Space"];
        uint64_t v14 = [v7 objectForKey:@"Dict"];
        [v13 addRectFrom:v14];
        goto LABEL_48;
      }
      uint64_t v11 = [v9 objectForKey:@"More"];
      uint64_t v12 = [v7 objectForKey:@"Dict"];
      [v11 addRectFrom:v12 widthFraction:0.5 heightFraction:0.0 adjustOriginXFactor:0.0 adjustOriginYFactor:0.0];

      id v13 = [v7 objectForKey:@"Intl"];
      uint64_t v14 = [v7 objectForKey:@"Dict"];
      double v15 = 0.5;
      double v16 = 1.0;
      CGFloat v17 = v13;
      uint64_t v18 = v14;
    }
    [v17 addRectFrom:v18 widthFraction:v15 heightFraction:0.0 adjustOriginXFactor:v16 adjustOriginYFactor:0.0];
LABEL_48:

LABEL_49:
    if ((a4 & 1) == 0)
    {
      if ((a4 & 0xC) != 4 && (a4 & 2) != 0 && v6)
      {
        long long v38 = [v7 objectForKey:@"Space"];
        id v39 = [v7 objectForKey:@"Dict"];
        [v38 addRectFrom:v39];

        uint64_t v22 = [v7 objectForKey:@"Intl"];
        [v7 setObject:v22 forKey:@"Dict"];
        goto LABEL_17;
      }
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  unsigned int v25 = (a4 >> 1) & 1;
  if (!v6) {
    LOBYTE(v25) = 1;
  }
  if ((a4 & 0x28) == 0x20)
  {
    if ((v25 & 1) == 0)
    {
      long long v26 = [v9 objectForKey:@"More"];
      long long v27 = [v7 objectForKey:@"Dict"];
      [v26 addRectFrom:v27];
    }
    if ((a4 & 1) == 0)
    {
      uint64_t v22 = [v7 objectForKey:@"More"];
      if ((a4 & 2) != 0 && v6)
      {
        uint64_t v28 = [v7 objectForKey:@"Dict"];
        [v22 addRectFrom:v28];

        uint64_t v22 = [v7 objectForKey:@"Dict"];
        uint64_t v23 = [v7 objectForKey:@"Intl"];
        [v22 makeLikeOther:v23];
        goto LABEL_16;
      }
LABEL_15:
      uint64_t v23 = [v7 objectForKey:@"Intl"];
      [v22 addRectFrom:v23];
LABEL_16:

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    BOOL v29 = (a4 & 2) == 0 || v6 == 0;
    BOOL v8 = v29;
    if (!v29 && (a4 & 1) == 0)
    {
      uint64_t v21 = @"Dict";
      goto LABEL_14;
    }
  }
  else
  {
    long long v36 = [v9 objectForKey:@"Intl"];
    long long v37 = [v7 objectForKey:@"Dict"];
    [v36 addRectFrom:v37];
  }
  if ((a4 & 1) == 0 && v8)
  {
LABEL_13:
    uint64_t v21 = @"More";
LABEL_14:
    uint64_t v22 = [v7 objectForKey:v21];
    goto LABEL_15;
  }
LABEL_18:

  return v7;
}

- (void)updateMoreAndInternationalKeysWithOptions:(int)a3
{
  if ([(UIKBTree *)self type] == 2)
  {
    id v30 = [(UIKBTree *)self firstCachedKeyWithName:@"International-Key"];
    id v5 = [(UIKBTree *)self findLeftMoreKey];
    BOOL v6 = [v5 interactionType] == 10 || objc_msgSend(v5, "displayType") == 14;
    if (v5 && v30)
    {
      id v7 = [(UIKBTree *)self firstCachedKeyWithName:@"Dictation-Key"];
      BOOL v8 = [(UIKBTree *)self firstCachedKeyWithName:@"Space-Key"];
      double v9 = [(UIKBTree *)self firstCachedKeyWithName:@"Return-Key"];
      int v10 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v11 = [v5 shape];
      uint64_t v12 = [v30 shape];
      id v13 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"More", v12, @"Intl", 0);

      if (v7)
      {
        uint64_t v14 = [v7 shape];
        [v13 setObject:v14 forKey:@"Dict"];
      }
      if (v8)
      {
        double v15 = [v8 shape];
        [v13 setObject:v15 forKey:@"Space"];
      }
      if (v9)
      {
        double v16 = [v9 shape];
        [v13 setObject:v16 forKey:@"Return"];
      }
      CGFloat v17 = [(UIKBTree *)self firstCachedKeyWithName:@"Handwriting-Input"];
      BOOL v29 = v8;
      if (v17 && ([(UIKBTree *)self visualStyling] & 0x3F) == 0) {
        int v18 = [(UIKBTree *)self visualStyling] & 0x40;
      }
      else {
        int v18 = 0;
      }
      BOOL v19 = v6;
      if ([(UIKBTree *)self isSplit]) {
        int v20 = 8;
      }
      else {
        int v20 = 0;
      }
      if (v17) {
        int v21 = 1;
      }
      else {
        int v21 = v19;
      }
      if (v21) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
      uint64_t v23 = +[UIKBTree shapesForControlKeyShapes:v13 options:v22 | v18 | v20 | (32 * ([(UIKBTree *)self visualStyle] == 101)) | a3];
      int v24 = [v23 objectForKey:@"More"];
      [v5 setShape:v24];

      unsigned int v25 = [v23 objectForKey:@"Intl"];
      [v30 setShape:v25];

      if (v7)
      {
        long long v26 = [v23 objectForKey:@"Dict"];
        [v7 setShape:v26];
      }
      if (v29)
      {
        long long v27 = [v23 objectForKey:@"Space"];
        [v29 setShape:v27];
      }
      if (v9)
      {
        uint64_t v28 = [v23 objectForKey:@"Return"];
        [v9 setShape:v28];
      }
      [v30 setVisible:a3 & 1];
      [v7 setVisible:(a3 >> 1) & 1];
    }
    else
    {
      [(UIKBTree *)self updateDictationKeyOnNumberPads:(a3 >> 1) & 1];
    }
  }
}

- (id)keySet
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [(UIKBTree *)self subtrees];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 type] == 4)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)geometrySet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 type] == 5)
        {
          long long v11 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v3)
  {
    long long v11 = [[UIKBTree alloc] initWithType:5];
    uint64_t v12 = NSString;
    uint64_t v13 = [(UIKBTree *)self name];
    uint64_t v14 = [v12 stringWithFormat:@"%@-GeometrySet", v13];
    [(UIKBTree *)v11 setName:v14];

    id v5 = [(UIKBTree *)self subtrees];
    [v5 addObject:v11];
LABEL_12:
  }
  else
  {
    long long v11 = 0;
  }
  return v11;
}

- (id)attributeSet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(UIKBTree *)self subtrees];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 type] == 6)
        {
          long long v11 = v10;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (v3)
  {
    long long v11 = [[UIKBTree alloc] initWithType:6];
    uint64_t v12 = NSString;
    uint64_t v13 = [(UIKBTree *)self name];
    uint64_t v14 = [v12 stringWithFormat:@"%@-AttributeSet", v13];
    [(UIKBTree *)v11 setName:v14];

    id v5 = [(UIKBTree *)self subtrees];
    [v5 addObject:v11];
LABEL_12:
  }
  else
  {
    long long v11 = 0;
  }
  return v11;
}

- (id)supplementaryKeyList
{
  BOOL v3 = [(UIKBTree *)self subtreeWithName:@"SupplementaryKeylayout"];
  if (!v3)
  {
    BOOL v3 = [[UIKBTree alloc] initWithType:3];
    [(UIKBTree *)v3 setName:@"SupplementaryKeylayout"];
    uint64_t v4 = [(UIKBTree *)self subtrees];
    [v4 addObject:v3];
  }
  id v5 = [(UIKBTree *)v3 keySet];
  if (!v5)
  {
    id v5 = [[UIKBTree alloc] initWithType:4];
    [(UIKBTree *)v5 setName:@"Supplementary-KeySet"];
    uint64_t v6 = [(UIKBTree *)v3 subtrees];
    [v6 addObject:v5];
  }
  uint64_t v7 = [(UIKBTree *)v5 subtrees];
  uint64_t v8 = [v7 firstObject];

  if (!v8)
  {
    uint64_t v8 = [[UIKBTree alloc] initWithType:7];
    [(UIKBTree *)v8 setName:@"Supplementary-KeySet_List"];
    long long v9 = [(UIKBTree *)v5 subtrees];
    [v9 addObject:v8];
  }
  return v8;
}

- (void)centerKeyplaneInRect:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v49[1] = *MEMORY[0x1E4F143B8];
  long long v10 = [(UIKBTree *)self firstCachedKeyWithName:@"Candidate-Selection"];
  long long v11 = v10;
  if (v10)
  {
    [v10 frame];
    double v13 = v12;
    [v11 frame];
    double v15 = v14;
    v49[0] = v11;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    -[UIKBTree centerKeys:inRect:scale:](self, "centerKeys:inRect:scale:", v16, x, v13, width, v15, a4);
  }
  long long v17 = [(UIKBTree *)self keys];
  long long v18 = (void *)[v17 mutableCopy];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __39__UIKBTree_centerKeyplaneInRect_scale___block_invoke;
  v46[3] = &unk_1E52F54F0;
  id v19 = v11;
  id v47 = v19;
  uint64_t v41 = [v18 indexesOfObjectsPassingTest:v46];
  objc_msgSend(v18, "removeObjectsAtIndexes:");
  uint64_t v20 = [(UIKBTree *)self shapesForKeys:v18];
  uint64_t v21 = [(UIKBTree *)self keys];
  int v22 = (void *)[v21 mutableCopy];

  [v22 removeObject:v19];
  uint64_t v23 = [(UIKBTree *)self shapesForKeys:v22];
  int v24 = +[UIKBShapeOperator operatorWithScale:a4];
  uint64_t v40 = (void *)v20;
  objc_msgSend(v24, "offsetForCenteringShapes:insideRect:", v20, x, y, width, height);
  double v26 = v25;
  double v28 = v27;
  objc_msgSend(v24, "shapesByRepositioningShapes:withOffset:", v23);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v43;
    id v39 = v19;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v34 frame];
        double MinX = CGRectGetMinX(v50);
        v51.origin.double x = x;
        v51.origin.double y = y;
        v51.size.double width = width;
        v51.size.double height = height;
        if (MinX >= CGRectGetMinX(v51))
        {
          v52.origin.double x = x;
          v52.origin.double y = y;
          v52.size.double width = width;
          v52.size.double height = height;
          double MaxX = CGRectGetMaxX(v52);
          [v34 frame];
          if (MaxX >= CGRectGetMaxX(v53)) {
            continue;
          }
        }

        objc_msgSend(v24, "offsetForCenteringShapes:insideRect:", v23, x, y, width, height);
        double v26 = v37;
        double v28 = v38;
        id v19 = v39;
        goto LABEL_14;
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v48 count:16];
      id v19 = v39;
      if (v31) {
        continue;
      }
      break;
    }
  }

LABEL_14:
  -[UIKBTree repositionKeys:withOffset:scale:](self, "repositionKeys:withOffset:scale:", v22, v26, v28, a4);
}

uint64_t __39__UIKBTree_centerKeyplaneInRect_scale___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  uint64_t v2 = [a2 name];
  BOOL v3 = [v2 rangeOfString:@"Monolith"] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)listShapes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(UIKBTree *)self subtrees];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(UIKBTree *)self subtrees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) shape];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)shapesForKeys:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__UIKBTree_shapesForKeys___block_invoke;
  v8[3] = &unk_1E52F5440;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __26__UIKBTree_shapesForKeys___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 visible])
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [v5 shape];
    [v3 addObject:v4];
  }
}

- (id)geometriesList
{
  uint64_t v2 = [(UIKBTree *)self properties];
  BOOL v3 = [v2 objectForKey:@"KBgeometriesList"];

  return v3;
}

- (void)setGeometriesList:(id)a3
{
}

- (id)activeGeometriesList
{
  uint64_t v2 = [(UIKBTree *)self properties];
  BOOL v3 = [v2 objectForKey:@"KBactiveGeometriesList"];

  return v3;
}

- (void)setActiveGeometriesList:(id)a3
{
}

- (id)activeShapesFromOutputShapes:(id)a3 inputShapes:(id)a4 inRTL:(BOOL)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(UIKBTree *)self activeGeometriesList];
  if (v9)
  {
    long long v36 = v7;
    long long v10 = [(UIKBTree *)self geometriesList];
    long long v11 = [v10 cache];

    double v12 = [(UIKBTree *)self geometriesList];
    uint64_t v13 = [v12 subtrees];

    id v35 = v8;
    long long v33 = (void *)v13;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v13];
    long long v15 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v34 = v9;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [v11 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          int v22 = [v14 objectForKey:v21];

          uint64_t v23 = [v22 geometry];
          [v15 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v18);
    }

    id v37 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v24 = v36;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v39 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          uint64_t v30 = [v29 geometry];
          int v31 = [v15 containsObject:v30];

          if (v31) {
            [v37 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v26);
    }

    id v8 = v35;
    id v7 = v36;
    id v9 = v34;
  }
  else
  {
    id v37 = v7;
  }

  return v37;
}

- (int)state
{
  return [(UIKBTree *)self intForProperty:@"state"];
}

- (void)setState:(int)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(UIKBTree *)self setObject:v4 forProperty:@"state"];
}

- (int)_variantType
{
  return [(UIKBTree *)self intForProperty:@"variant-type"];
}

- (void)updateVariantTypeForActions:(unsigned int)a3
{
  if (![(UIKBTree *)self _variantType])
  {
    if ((a3 & 0x80000) != 0) {
      int v5 = 8;
    }
    else {
      int v5 = 1;
    }
    if ((a3 & 0x10000) != 0) {
      int v6 = 7;
    }
    else {
      int v6 = v5;
    }
    if ((a3 & 0x40000) != 0) {
      unsigned int v7 = 3;
    }
    else {
      unsigned int v7 = v6;
    }
    if ((a3 & 0x20000) != 0) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = v7;
    }
    [(UIKBTree *)self setVariantType:v8];
  }
}

- (id)representedString
{
  BOOL v3 = [(UIKBTree *)self stringForProperty:@"KBoverrideDisplayString"];
  if (v3 && [(UIKBTree *)self _variantType] == 5)
  {
    if ((unint64_t)[v3 length] < 2)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 substringToIndex:1];
    }
    unsigned int v7 = v4;
  }
  else
  {
    int v5 = [(UIKBTree *)self fullRepresentedString];
    if (-[UIKBTree interactionType](self, "interactionType") == 16 && [v5 length])
    {
      id v6 = [v5 _firstGrapheme];
    }
    else
    {
      id v6 = v5;
    }
    unsigned int v7 = v6;
  }
  return v7;
}

- (void)setRepresentedString:(id)a3
{
}

- (id)fullRepresentedString
{
  uint64_t v2 = [(UIKBTree *)self properties];
  BOOL v3 = [v2 objectForKey:@"KBrepresentedString"];

  return v3;
}

- (id)displayString
{
  return [(UIKBTree *)self stringForProperty:@"KBdisplayString"];
}

- (void)setDisplayString:(id)a3
{
}

- (id)gestureKey
{
  return [(UIKBTree *)self objectForProperty:@"KBgestureKey"];
}

- (void)setGestureKey:(id)a3
{
}

- (id)cachedGestureLayout
{
  return [(UIKBTree *)self objectForProperty:@"KBcachedGestureLayout"];
}

- (void)setCachedGestureLayout:(id)a3
{
}

- (id)secondaryDisplayStrings
{
  return [(UIKBTree *)self objectForProperty:@"KBsecondaryDisplayStrings"];
}

- (void)setSecondaryDisplayStrings:(id)a3
{
}

- (id)secondaryRepresentedStrings
{
  return [(UIKBTree *)self objectForProperty:@"KBsecondaryRepresentedStrings"];
}

- (void)setSecondaryRepresentedStrings:(id)a3
{
}

- (id)highlightedVariantsList
{
  return [(UIKBTree *)self objectForProperty:@"KBhighlightedVariantsList"];
}

- (void)setHighlightedVariantsList:(id)a3
{
}

- (id)selectedVariantIndices
{
  return [(UIKBTree *)self objectForProperty:@"KBselectedVariantIndices"];
}

- (void)setSelectedVariantIndices:(id)a3
{
}

- (id)localizationKey
{
  return [(UIKBTree *)self stringForProperty:@"KBlocalizationKey"];
}

- (void)setLocalizationKey:(id)a3
{
}

- (int)displayType
{
  return [(UIKBTree *)self intForProperty:@"KBdisplayType"];
}

- (void)setDisplayType:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBdisplayType"];
}

- (int)interactionType
{
  return [(UIKBTree *)self intForProperty:@"KBinteractionType"];
}

- (void)setInteractionType:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBinteractionType"];
}

- (int)variantType
{
  BOOL v3 = [(UIKBTree *)self overrideDisplayString];
  if (v3) {
    int v4 = 0;
  }
  else {
    int v4 = [(UIKBTree *)self _variantType];
  }

  return v4;
}

- (void)setVariantType:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"variant-type"];
}

- (int)displayTypeHint
{
  return [(UIKBTree *)self intForProperty:@"KBdisplayTypeHint"];
}

- (void)setDisplayTypeHint:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBdisplayTypeHint"];
}

- (int64_t)selectedVariantIndex
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"KBselectedVariantIndex"];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (void)setSelectedVariantIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:");
  }
  id v5 = (id)v4;
  [(UIKBTree *)self setObject:v4 forProperty:@"KBselectedVariantIndex"];
}

- (int64_t)textAlignment
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"text-alignment"];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"text-alignment"];
}

- (int)displayRowHint
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"KBdisplayRowHint"];
  BOOL v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (void)setDisplayRowHint:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBdisplayRowHint"];
}

- (int)rendering
{
  return [(UIKBTree *)self intForProperty:@"rendering"];
}

- (void)setRendering:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"rendering"];
}

- (id)overrideDisplayString
{
  BOOL v3 = [(UIKBTree *)self stringForProperty:@"KBoverrideDisplayString"];
  if ((unint64_t)[v3 length] >= 2 && -[UIKBTree _variantType](self, "_variantType") == 5)
  {
    id v4 = [v3 substringFromIndex:1];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)setOverrideDisplayString:(id)a3
{
}

- (BOOL)visible
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"visible"];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setVisible:(BOOL)a3
{
  if (a3)
  {
    [(UIKBTree *)self setObject:0 forProperty:@"visible"];
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithBool:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIKBTree *)self setObject:v4 forProperty:@"visible"];
  }
}

- (BOOL)ghost
{
  BOOL v3 = [(UIKBTree *)self cache];
  id v4 = [v3 objectForKey:@"KBghost"];
  if ([v4 BOOLValue])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(UIKBTree *)self properties];
    unsigned int v7 = [v6 objectForKey:@"KBghost"];
    char v5 = [v7 BOOLValue];
  }
  return v5;
}

- (void)setGhost:(BOOL)a3
{
  if (a3)
  {
    id v4 = [NSNumber numberWithBool:1];
    [(UIKBTree *)self setObject:v4 forProperty:@"KBghost"];
  }
  else
  {
    [(UIKBTree *)self setObject:0 forProperty:@"KBghost"];
  }
}

- (void)setVariantPopupBias:(id)a3
{
}

- (id)variantPopupBias
{
  return [(UIKBTree *)self stringForProperty:@"variant-popup-bias"];
}

- (int64_t)flickDirection
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"KBflickDirection"];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = -3;
  }

  return v4;
}

- (void)setFlickDirection:(int64_t)a3
{
  if (a3 == -3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:");
  }
  id v5 = (id)v4;
  [(UIKBTree *)self setObject:v4 forProperty:@"KBflickDirection"];
}

- (int64_t)popupDirection
{
  uint64_t v2 = [(UIKBTree *)self numberForProperty:@"KBpopupDirection"];
  BOOL v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)setPopupDirection:(int64_t)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(UIKBTree *)self setObject:v4 forProperty:@"KBpopupDirection"];
}

- (BOOL)disabled
{
  return [(UIKBTree *)self state] == 1;
}

- (void)setDisabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(UIKBTree *)self setState:v3];
}

- (int)splitMode
{
  return [(UIKBTree *)self intForProperty:@"KBsplitMode"];
}

- (void)setSplitMode:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBsplitMode"];
}

- (unint64_t)clipCorners
{
  return [(UIKBTree *)self intForProperty:@"KBclipCorners"];
}

- (void)setClipCorners:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(UIKBTree *)self setObject:v4 forProperty:@"KBclipCorners"];
}

- (BOOL)forceMultitap
{
  return [(UIKBTree *)self BOOLForProperty:@"KBforceMultitap"];
}

- (void)setForceMultitap:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 32;
  }
  else {
    uint64_t v4 = 25;
  }
  id v5 = [NSNumber numberWithInt:v4];
  [(UIKBTree *)self setObject:v5 forProperty:@"KBforceMultitap"];
}

- (BOOL)mergeAsMoreKey
{
  uint64_t v2 = [(UIKBTree *)self cache];
  uint64_t v3 = [v2 objectForKey:@"merge-as-more-key"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setMergeAsMoreKey:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(UIKBTree *)self cache];
  id v5 = v4;
  if (v3) {
    [v4 setObject:&unk_1ED3F4818 forKey:@"merge-as-more-key"];
  }
  else {
    [v4 removeObjectForKey:@"merge-as-more-key"];
  }
}

- (id)parentKey
{
  return [(UIKBTree *)self objectForProperty:@"KBparentKey"];
}

- (void)setParentKey:(id)a3
{
}

- (BOOL)isExemptFromInputManagerLayout
{
  if ([(UIKBTree *)self displayType] == 49) {
    return 1;
  }
  unsigned int v4 = [(UIKBTree *)self interactionType];
  if (v4 <= 0x11) {
    return (0x7A9u >> v4) & 1;
  }
  else {
    return 1;
  }
}

- (BOOL)isExemptFromInputManagerHitTesting
{
  if ([(UIKBTree *)self displayType] == 49
    || [(UIKBTree *)self variantType] == 10
    || [(UIKBTree *)self variantType] == 12
    || [(UIKBTree *)self variantType] == 11
    || [(UIKBTree *)self variantType] == 13
    || [(UIKBTree *)self hasSemiStickyVariant])
  {
    return 1;
  }
  unsigned int v4 = [(UIKBTree *)self interactionType];
  if (v4 <= 0x10) {
    return (0x5FE9u >> v4) & 1;
  }
  else {
    return 1;
  }
}

- (BOOL)allowsStartingContinuousPath
{
  unsigned int v2 = [(UIKBTree *)self interactionType];
  return (v2 > 0x2C) | (0xF9FFFFF918FuLL >> v2) & 1;
}

- (BOOL)allowsDelayedTapForContinuousPathDisambiguation
{
  int v2 = [(UIKBTree *)self interactionType];
  return v2 == 14 || v2 == 4;
}

- (BOOL)allowRetestAfterCommittingDownActions
{
  return [(UIKBTree *)self interactionType] != 4;
}

- (BOOL)avoidsLanguageIndicator
{
  if (![(UIKBTree *)self visible]) {
    return 1;
  }
  int v4 = [(UIKBTree *)self displayType];
  if (v4 == 4)
  {
    int v2 = [(UIKBTree *)self layoutTag];
    if (!v2)
    {
      BOOL v5 = 1;
LABEL_15:

      return v5;
    }
  }
  BOOL v5 = [(UIKBTree *)self displayType] == 13
    || [(UIKBTree *)self displayType] == 18
    || [(UIKBTree *)self displayType] == 21
    || [(UIKBTree *)self displayType] == 3
    || [(UIKBTree *)self displayType] == 5
    || [(UIKBTree *)self displayType] == 53
    || [(UIKBTree *)self interactionType] == 17;
  if (v4 == 4) {
    goto LABEL_15;
  }
  return v5;
}

- (BOOL)modifiesKeyplane
{
  return [(UIKBTree *)self interactionType] != 1
      && [(UIKBTree *)self interactionType] != 15
      && [(UIKBTree *)self interactionType] != 2
      && [(UIKBTree *)self interactionType] != 16;
}

- (BOOL)dynamicDisplayTypeHint
{
  return self->type == 12
      || [(UIKBTree *)self interactionType] == 13
      || [(UIKBTree *)self interactionType] == 15;
}

- (BOOL)avoidAutoDeactivation
{
  unsigned int v2 = [(UIKBTree *)self displayType];
  return (v2 < 0x37) & (0x40006000004012uLL >> v2);
}

- (BOOL)behavesAsShiftKey
{
  if ([(UIKBTree *)self interactionType] != 14) {
    return 0;
  }
  if ([(UIKBTree *)self displayTypeHint]) {
    return [(UIKBTree *)self displayTypeHint] == 5;
  }
  return 1;
}

- (BOOL)disablesEdgeSwipe
{
  return [(UIKBTree *)self interactionType] == 11
      || [(UIKBTree *)self interactionType] == 9
      || [(UIKBTree *)self interactionType] == 4;
}

- (BOOL)isRightToLeftSensitive
{
  int v3 = [(UIKBTree *)self displayType];
  if (v3 == 20)
  {
    int v4 = [(UIKBTree *)self localizationKey];
    BOOL v5 = v4 != 0;
  }
  else
  {
    int v6 = v3;
    int v7 = [(UIKBTree *)self interactionType];
    return v6 == 3 || v7 == 4 || v7 == 37 || v6 == 26 || v7 == 13 || v6 == 21;
  }
  return v5;
}

- (BOOL)hasSemiStickyVariant
{
  return 0;
}

- (BOOL)containsDividerVariant
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = [(UIKBTree *)self subtrees];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) displayType] == 50)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)groupNeighbor
{
  unsigned int v2 = [(UIKBTree *)self numberForProperty:@"group-neighbor"];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = (int)[v2 intValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setGroupNeighbor:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIKBTree *)self setObject:v4 forProperty:@"group-neighbor"];
  }
  else
  {
    -[UIKBTree setObject:forProperty:](self, "setObject:forProperty:");
  }
}

- (BOOL)preventPaddle
{
  unsigned int v2 = [(UIKBTree *)self numberForProperty:@"KBpreventPaddle"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPreventPaddle:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBpreventPaddle"];
}

- (BOOL)dynamicLayout
{
  unsigned int v2 = [(UIKBTree *)self numberForProperty:@"KBdynamic"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDynamicLayout:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBdynamic"];
}

- (unint64_t)dynamicDisplayCorner
{
  unsigned int v2 = [(UIKBTree *)self numberForProperty:@"display-corner"];
  char v3 = v2;
  if (v2) {
    unint64_t v4 = (int)[v2 intValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (void)setDynamicDisplayCorner:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"display-corner"];
}

- (id)displayImage
{
  return [(UIKBTree *)self objectForProperty:@"DisplayImage"];
}

- (void)setDisplayImage:(id)a3
{
}

- (int64_t)currentKeyboardType
{
  unsigned int v2 = [(UIKBTree *)self numberForProperty:@"KBCachedKeyboardType"];
  char v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setCurrentKeyboardType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(UIKBTree *)self setObject:v4 forProperty:@"KBCachedKeyboardType"];
}

- (id)toggleKeysForKeyName:(id)a3
{
  id v4 = [NSString stringWithFormat:@"KBToggleKeys_%@", a3];
  BOOL v5 = [(UIKBTree *)self properties];
  int v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setToggleKeys:(id)a3 forKeyName:(id)a4
{
  int v6 = NSString;
  id v7 = a3;
  id v9 = [v6 stringWithFormat:@"KBToggleKeys_%@", a4];
  long long v8 = [(UIKBTree *)self properties];
  [v8 setObject:v7 forKey:v9];
}

- (void)orderVariantKeys:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA48];
  int v6 = [(UIKBTree *)self subtrees];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v8 = [(UIKBTree *)self subtrees];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * v12) shape];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  objc_msgSend(v7, "sortUsingFunction:context:", variantOrderSort, objc_msgSend(NSNumber, "numberWithBool:", v3));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v14 = [(UIKBTree *)self subtrees];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = 0;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      uint64_t v20 = v17;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * v19);
        int v22 = [v7 objectAtIndex:v20 + v19];
        [v21 setShape:v22];

        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      int v17 = v20 + v19;
    }
    while (v16);
  }
}

- (id)variantDisplayString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKBTree *)self subtrees];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28E78] string];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = [(UIKBTree *)self subtrees];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v5 length]) {
            [v5 appendString:@";"];
          }
          uint64_t v12 = [v11 displayString];
          [v5 appendString:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    BOOL v5 = [(UIKBTree *)self displayString];
  }
  return v5;
}

- (BOOL)hasLayoutTag:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v3 = -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:");
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsKeyThatIgnoresHandBias
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v2 = [(UIKBTree *)self keys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) BOOLForProperty:@"ignore-hand-bias"])
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (void)setLayoutTag:(id)a3 passingKeyTest:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (NSString *)a3;
  uint64_t v8 = (unsigned int (**)(id, uint64_t))a4;
  if (self->layoutTag != v7) {
    objc_storeStrong((id *)&self->layoutTag, a3);
  }
  long long v9 = [(NSMutableDictionary *)self->properties objectForKey:v7];
  if (v8 && (((uint64_t (*)(id, void *))v8[2])(v8, v9) & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v10 = self->properties;
    uint64_t v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v15 isEqualToString:v7] & 1) == 0)
          {
            uint64_t v16 = [(NSMutableDictionary *)self->properties objectForKey:v15];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v8[2](v8, v16))
            {
              long long v17 = v15;

              BOOL v7 = v17;
              goto LABEL_18;
            }
            long long v9 = (void *)v16;
          }
        }
        uint64_t v12 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    uint64_t v16 = (uint64_t)v9;
LABEL_18:

    long long v9 = (void *)v16;
  }
  [(UIKBTree *)self setEffectiveLayoutTag:v7];
}

- (void)setLayoutTag:(id)a3
{
}

- (BOOL)shouldCacheKey
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->type == 12) {
    return 1;
  }
  unsigned int v3 = [(UIKBTree *)self displayType];
  unsigned int v4 = [(UIKBTree *)self interactionType];
  v5.i32[0] = v3 & 0xFFFFFFEF;
  v5.i32[1] = v3;
  v5.i32[2] = v3;
  v5.i32[3] = v3;
  int32x4_t v6 = vdupq_n_s32(v4);
  v6.i32[3] = v3;
  BOOL result = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v5, (int32x4_t)xmmword_186B99520), (int16x8_t)vceqq_s32(v6, (int32x4_t)xmmword_186B99530)))) & 1) == 0&& v4 != 5&& v3 != 23)
  {
    uint64_t v8 = [(UIKBTree *)self name];
    if (![v8 isEqualToString:@"Latin-Accents"])
    {
      long long v9 = [(UIKBTree *)self cache];
      long long v10 = [v9 objectForKey:@"modify-for-writeboard-key"];
      if (v10) {
        goto LABEL_24;
      }
      v11.i64[0] = __PAIR64__(v4, v3);
      v11.i32[2] = v4;
      v11.i32[3] = v4;
      int32x4_t v12 = vdupq_n_s32(v4);
      *(int8x8_t *)v12.i8 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(v12, (int32x4_t)xmmword_186B99550), (int16x8_t)vceqq_s32(v12, (int32x4_t)xmmword_186B99540))), (int8x8_t)0x8040201008040201);
      v12.i8[0] = vaddv_s8(*(int8x8_t *)v12.i8);
      *(int8x8_t *)v11.i8 = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(vdupq_n_s32(v3), (int32x4_t)xmmword_186B99560), (int16x8_t)vceqq_s32(v11, (int32x4_t)xmmword_186B99570))), (int8x8_t)0x8040201008040201);
      v11.i8[0] = vaddv_s8(*(int8x8_t *)v11.i8);
      if (v11.i16[0] | (unsigned __int16)(v12.i16[0] << 8) || v4 == 42)
      {
LABEL_24:
      }
      else
      {
        uint64_t v13 = [(UIKBTree *)self localizationKey];

        if (v13) {
          return 1;
        }
        if (v3 != 7) {
          return 0;
        }
        uint64_t v8 = [(UIKBTree *)self representedString];
        if (![v8 _containsSubstring:@"¤"])
        {
          uint64_t v14 = [(UIKBTree *)self representedString];
          char v15 = [v14 _containsSubstring:@"⁒"];

          if ((v15 & 1) == 0)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v8 = [(UIKBTree *)self secondaryRepresentedStrings];
            uint64_t v16 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v23;
LABEL_15:
              uint64_t v19 = 0;
              while (1)
              {
                if (*(void *)v23 != v18) {
                  objc_enumerationMutation(v8);
                }
                if ([*(id *)(*((void *)&v22 + 1) + 8 * v19) _containsSubstring:@"¤"]) {
                  goto LABEL_25;
                }
                long long v20 = [(UIKBTree *)self representedString];
                char v21 = [v20 _containsSubstring:@"⁒"];

                if (v21) {
                  goto LABEL_25;
                }
                if (v17 == ++v19)
                {
                  uint64_t v17 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
                  if (v17) {
                    goto LABEL_15;
                  }
                  break;
                }
              }
            }

            return 0;
          }
          return 1;
        }
      }
    }
LABEL_25:

    return 1;
  }
  return result;
}

- (id)cacheDisplayString
{
  unsigned int v3 = [(UIKBTree *)self overrideDisplayString];
  unsigned int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int32x4_t v6 = [(UIKBTree *)self displayString];
    BOOL v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(UIKBTree *)self representedString];
    }
    id v5 = v8;
  }
  return v5;
}

- (id)cacheSecondaryDisplayString
{
  if ([(UIKBTree *)self displayType] == 25)
  {
    unsigned int v3 = [(UIKBTree *)self secondaryDisplayStrings];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      id v5 = [(UIKBTree *)self secondaryDisplayStrings];
      id v6 = [v5 firstObject];
LABEL_11:

      goto LABEL_12;
    }
  }
  if ([(UIKBTree *)self displayType] == 7
    || [(UIKBTree *)self displayType] == 20
    || [(UIKBTree *)self displayTypeHint] == 10)
  {
    id v5 = [(UIKBTree *)self secondaryDisplayStrings];
    BOOL v7 = [v5 objectAtIndex:0];
    id v8 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      long long v9 = [(UIKBTree *)self secondaryRepresentedStrings];
      id v6 = [v9 objectAtIndex:0];
    }
    goto LABEL_11;
  }
  id v6 = 0;
LABEL_12:
  return v6;
}

- (BOOL)_renderAsStringKey
{
  unsigned int v3 = [(UIKBTree *)self localizationKey];
  if (v3)
  {

    return 0;
  }
  if (self->type == 12) {
    return 0;
  }
  if ([(UIKBTree *)self supportsSupplementalDisplayString]) {
    return 1;
  }
  unsigned int v5 = [(UIKBTree *)self displayType];
  if (v5 <= 0x23) {
    return (0xC604B8001uLL >> v5) & 1;
  }
  else {
    return 0;
  }
}

- (BOOL)renderKeyInKeyplane:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UIKBTree *)self _renderAsStringKey])
  {
    [(UIKBTree *)self frame];
    if (CGRectIsEmpty(v37))
    {
      BOOL v5 = 1;
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = [v4 subtrees];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v31;
        long long v25 = v6;
        uint64_t v23 = *(void *)v31;
LABEL_7:
        uint64_t v10 = 0;
        uint64_t v24 = v8;
        while (1)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          int32x4_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          if ([v11 type] == 3)
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            int32x4_t v12 = [v11 keySet];
            uint64_t v13 = [v12 subtrees];

            uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) subtrees];
                  char v19 = [v18 containsObject:self];

                  if (v19)
                  {

                    BOOL v5 = 1;
                    id v6 = v25;
                    goto LABEL_25;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            long long v20 = [v11 name];
            int v21 = [v20 hasPrefix:@"split-"];

            uint64_t v8 = v24;
            id v6 = v25;
            uint64_t v9 = v23;
            if (!v21) {
              break;
            }
          }
          if (++v10 == v8)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
            BOOL v5 = 0;
            if (v8) {
              goto LABEL_7;
            }
            goto LABEL_25;
          }
        }
      }
      BOOL v5 = 0;
LABEL_25:
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)key
{
  unsigned int v2 = [[UIKBTree alloc] initWithType:8];
  unsigned int v3 = +[UIKBTree uniqueName];
  [(UIKBTree *)v2 setName:v3];

  return v2;
}

+ (id)keyboard
{
  unsigned int v2 = [[UIKBTree alloc] initWithType:1];
  unsigned int v3 = +[UIKBTree uniqueName];
  [(UIKBTree *)v2 setName:v3];

  return v2;
}

- (id)keysForDisplayRowAtIndex:(unint64_t)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(UIKBTree *)self subtrees];
  uint64_t v27 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v48;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v48 != v25)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v28 = v6;
        uint64_t v8 = *(void **)(*((void *)&v47 + 1) + 8 * v6);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v9 = [v8 keySet];
        id v29 = [v9 subtrees];

        uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v31)
        {
          uint64_t v30 = *(void *)v44;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v44 != v30)
              {
                uint64_t v11 = v10;
                objc_enumerationMutation(v29);
                uint64_t v10 = v11;
              }
              uint64_t v32 = v10;
              int32x4_t v12 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
              uint64_t v13 = [v12 numberForProperty:@"KBdisplayRowHint"];
              id v33 = v13;
              if (v13)
              {
                BOOL v14 = [v13 unsignedIntegerValue] == a3;
                uint64_t v13 = v33;
                if (v14)
                {
                  long long v41 = 0u;
                  long long v42 = 0u;
                  long long v39 = 0u;
                  long long v40 = 0u;
                  uint64_t v15 = [v12 subtrees];
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v51 count:16];
                  if (v16)
                  {
                    uint64_t v17 = *(void *)v40;
                    do
                    {
                      for (uint64_t i = 0; i != v16; ++i)
                      {
                        if (*(void *)v40 != v17) {
                          objc_enumerationMutation(v15);
                        }
                        char v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                        if ((int)[v19 displayRowHint] == a3)
                        {
                          if ([v5 count])
                          {
                            [v19 frame];
                            uint64_t v35 = 0;
                            uint64_t v36 = &v35;
                            uint64_t v37 = 0x2020000000;
                            uint64_t v38 = 0;
                            v34[0] = MEMORY[0x1E4F143A8];
                            v34[1] = 3221225472;
                            v34[2] = __37__UIKBTree_keysForDisplayRowAtIndex___block_invoke;
                            v34[3] = &unk_1E52F5518;
                            v34[5] = v20;
                            v34[6] = v21;
                            v34[7] = v22;
                            v34[8] = v23;
                            v34[4] = &v35;
                            [v5 enumerateObjectsUsingBlock:v34];
                            [v5 insertObject:v19 atIndex:v36[3]];
                            _Block_object_dispose(&v35, 8);
                          }
                          else
                          {
                            [v5 addObject:v19];
                          }
                        }
                      }
                      uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v51 count:16];
                    }
                    while (v16);
                  }

                  uint64_t v13 = v33;
                }
              }

              uint64_t v10 = v32 + 1;
            }
            while (v32 + 1 != v31);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
          }
          while (v31);
        }

        uint64_t v6 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v27);
  }

  return v5;
}

uint64_t __37__UIKBTree_keysForDisplayRowAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 frame];
  if (*(double *)(a1 + 40) > v6) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3 + 1;
  }
  return result;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (void)setName:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)subtrees
{
  return self->subtrees;
}

- (void)setSubtrees:(id)a3
{
}

- (NSMutableDictionary)cache
{
  return self->cache;
}

- (void)setCache:(id)a3
{
}

- (NSString)layoutTag
{
  return self->layoutTag;
}

- (NSString)effectiveLayoutTag
{
  return self->effectiveLayoutTag;
}

- (void)setEffectiveLayoutTag:(id)a3
{
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->effectiveLayoutTag, 0);
  objc_storeStrong((id *)&self->layoutTag, 0);
  objc_storeStrong((id *)&self->cache, 0);
  objc_storeStrong((id *)&self->subtrees, 0);
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end