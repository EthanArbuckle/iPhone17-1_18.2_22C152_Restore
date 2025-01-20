@interface UILabel
+ (CGRect)_insetRect:(CGRect)a3 forAttributedString:(id)a4 withDefaultFont:(id)a5 inView:(id)a6;
+ (Class)layerClass;
+ (double)_insetsForAttributedString:(void *)a3 withDefaultFont:(void *)a4 inView:;
+ (double)_insetsForString:(void *)a3 withFont:(void *)a4 inView:;
+ (id)_defaultAttributes;
+ (id)_defaultColor;
+ (id)_tooBigChars;
+ (id)defaultFont;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4;
- (BOOL)_drawingLightInertLayer;
- (BOOL)_drawingLightReactiveLayer;
- (BOOL)_drawsDebugBaselines;
- (BOOL)_drawsDebugGlyphPathBoundsClipping;
- (BOOL)_glyphPathBoundsClippingDetected;
- (BOOL)_hasBaseline;
- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3;
- (BOOL)_hasFontInfoForVerticalBaselineSpacing;
- (BOOL)_isExtremeSizingEnabled;
- (BOOL)_isMarqueeUpdatable;
- (BOOL)_multilineLabelRequiresCarefulMeasurement;
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_overallWritingDirectionFollowsLayoutDirection;
- (BOOL)_shouldCeilSizeToViewScale;
- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4;
- (BOOL)_textAlignmentFollowsWritingDirection;
- (BOOL)_textAlignmentMirrored;
- (BOOL)_textColorFollowsTintColor;
- (BOOL)_useShortcutIntrinsicContentSize;
- (BOOL)_usesSimpleTextEffects;
- (BOOL)_verticalTextEnabled;
- (BOOL)_wantsContentAwareTypesettingLanguage;
- (BOOL)_wantsUnderlineForAccessibilityButtonShapesEnabled;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)adjustsLetterSpacingToFitWidth;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)drawsUnderline;
- (BOOL)enablesMarqueeWhenAncestorFocused;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)marqueeEnabled;
- (BOOL)marqueeRunning;
- (BOOL)showsExpansionTextWhenTruncated;
- (CGFloat)minimumScaleFactor;
- (CGFloat)preferredMaxLayoutWidth;
- (CGRect)_drawTextInRect:(CGRect)a3;
- (CGRect)_drawTextInRect:(CGRect)a3 baselineCalculationOnly:(BOOL)a4;
- (CGRect)_drawTextInRect:(CGRect)a3 forceMultiline:(BOOL)a4;
- (CGRect)_drawingRectForBounds:(CGRect)a3;
- (CGRect)_textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4 includingShadow:(BOOL)a5;
- (CGRect)_tightBoundingRect;
- (CGRect)_tightBoundingRectOfFirstLine;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)rawSize;
- (CGSize)shadowOffset;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)textSize;
- (CGSize)textSizeForWidth:(double)a3;
- (Class)_intelligenceBaseClass;
- (NSAttributedString)_synthesizedAttributedText;
- (NSInteger)numberOfLines;
- (NSLineBreakMode)lineBreakMode;
- (NSLineBreakStrategy)lineBreakStrategy;
- (NSString)text;
- (NSTextAlignment)textAlignment;
- (UIBaselineAdjustment)baselineAdjustment;
- (UIColor)highlightedTextColor;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (UIEdgeInsets)_contentInsetsFromFonts;
- (UIEdgeInsets)alignmentRectInsets;
- (UIFont)_fontForShortcutBaselineCalculation;
- (UIFont)font;
- (UILabel)_associatedScalingLabel;
- (UILabel)initWithCoder:(id)a3;
- (UILabel)initWithFrame:(CGRect)a3;
- (UILabelVibrancy)preferredVibrancy;
- (_UIGlyphPathBoundsIntersectionViewData)_glyphPathBoundsIntersectionData;
- (_UIIntelligenceLightSourceDescriptor)_lightSourceDescriptor;
- (_UILabelConfiguration)_configuration;
- (_UILabelContent)_content;
- (_UILabelLegacyScaledMetrics)_scaledMetricsForText:(double)a3 inRect:(double)a4;
- (_UILabelMarqueeAnimationDelegate)_marqueeAnimationDelegate;
- (_UILabelVisualStyle)_visualStyle;
- (double)_actualScaleFactor;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6;
- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8;
- (double)_baselineOffsetFromBottom;
- (double)_boundingRectWithAttributedString:(uint64_t)a3 size:(void *)a4 options:(double)a5 context:(double)a6;
- (double)_boundingRectWithString:(uint64_t)a3 size:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7;
- (double)_capOffsetFromBoundsTop;
- (double)_drawTextInRect:(int)a3 baselineCalculationOnly:(unsigned __int8)a4 returningDeviceMetricsOfFirstLine:(int)a5 returningMultilineDeviceMetrics:(double)a6 forceMultiline:(double)a7;
- (double)_ensureBaselineMetricsReturningBounds;
- (double)_firstBaselineOffsetFromTop;
- (double)_firstLineBaseline;
- (double)_firstLineBaselineFrameOriginY;
- (double)_firstLineBaselineOffsetFromBoundsTop;
- (double)_firstLineCapFrameOriginY;
- (double)_lastLineBaseline;
- (double)_lastLineBaselineFrameOriginY;
- (double)_letterformAwareAllAlignmentInsets;
- (double)_maximumMarqueeTextWidth;
- (double)_minimumFontSize;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (double)_sizingRuleAdjustedBoundsForBounds:(void *)a1;
- (double)marqueeLoopPadding;
- (double)shadowBlur;
- (float)_hyphenationFactor;
- (id)__tightBoundingBoxLayoutGuide;
- (id)_contentAdjustingFontForAccessibilityTraits:(char)a3 forced:(unsigned char *)a4 didAdjustFont:;
- (id)_contentAdjustingFontForTypesettingLanguage:(unsigned char *)a3 didAdjustFont:;
- (id)_contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:(unsigned char *)a3 didAdjustFont:;
- (id)_cuiCatalog;
- (id)_cuiStyleEffectConfiguration;
- (id)_defaultAttributes;
- (id)_delegate;
- (id)_disabledFontColor;
- (id)_image;
- (id)_materializedAttributedString;
- (id)_nilBackgroundColor;
- (id)_shadow;
- (id)_siblingMarqueeLabels;
- (id)_stringDrawingContext;
- (id)_synthesizedAttributedTextForContent:(uint64_t)a1;
- (id)_textEncapsulation;
- (id)_tightBoundingBoxLayoutGuide;
- (id)_verticalTextLayoutManager;
- (id)currentTextColor;
- (id)largeContentTitle;
- (int64_t)_measuredNumberOfLines;
- (int64_t)_stringDrawingOptions;
- (int64_t)lineSpacing;
- (int64_t)sizingRule;
- (uint64_t)_updateScaledMetricsForRect:(double)a3;
- (unint64_t)defaultAccessibilityTraits;
- (unint64_t)marqueeRepeatCount;
- (void)_accessibilityButtonShapesParametersDidChange;
- (void)_addLightSourceView;
- (void)_addViewsForLabelViewTextAttachments:(id)a3 previousLabelViewTextAttachments:(id)a4;
- (void)_adjustFontForAccessibilityTraits:(unsigned char *)a1;
- (void)_adjustFontForTypesettingLanguage;
- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_commonInit;
- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_drawFullMarqueeTextInRect:(CGRect)a3;
- (void)_drawWithAttributedString:(uint64_t)a3 rect:(void *)a4 options:(double)a5 context:(double)a6;
- (void)_drawWithString:(uint64_t)a3 rect:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_invalidateAsNeededForNewSize:(double *)(a1 oldSize:;
- (void)_invalidateBaselineConstraints;
- (void)_invalidateLabelDisplay;
- (void)_invalidateLabelMetrics;
- (void)_invalidateLabelSize;
- (void)_markGlyphPathBoundsClippingDetected:(double)a3 glyphPathBounds:(double)a4 availableBounds:(double)a5;
- (void)_noteInstanceCustomizationForAttributedString:(void *)a3 attributes:;
- (void)_ola_willApplyMultilineTextWidthDisambiguationConstraint;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_removeLightSourceView;
- (void)_resetUsesExplicitPreferredMaxLayoutWidth;
- (void)_resolveMaterialColor:(uint64_t)a1;
- (void)_runMarqueeIfEnabledAndAncestorIsFocused;
- (void)_setAllowsDefaultTighteningForTruncation:(void *)a1;
- (void)_setAssociatedScalingLabel:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setContent:(id)a3;
- (void)_setContent:(int)a3 adjustingFontForAccessibilityTraits:(int)a4 adjustingFontForTypesettingLanguage:(int)a5 adjustingFontForTypesettingLanguageAwareLineHeightRatio:(char)a6 checkingForDifferences:;
- (void)_setCuiCatalog:(id)a3;
- (void)_setCuiStyleEffectConfiguration:(id)a3;
- (void)_setDefaultAttributes:(id)a3;
- (void)_setDelegate:(id)a3;
- (void)_setDrawingLightInertLayer:(BOOL)a3;
- (void)_setDrawingLightReactiveLayer:(BOOL)a3;
- (void)_setDrawsDebugBaselines:(BOOL)a3;
- (void)_setDrawsDebugGlyphPathBoundsClipping:(BOOL)a3;
- (void)_setExtremeSizingEnabled:(BOOL)a3;
- (void)_setFallbackTextColor:(id)a3 forUserInterfaceStyle:(int64_t)a4;
- (void)_setFirstLineBaselineFrameOriginY:(double)a3;
- (void)_setFirstLineCapFrameOriginY:(double)a3;
- (void)_setFont:(id)a3;
- (void)_setHyphenationFactor:(float)a3;
- (void)_setHyphenationFactorIgnoredIfURLsDetected:(void *)result;
- (void)_setLastLineBaselineFrameOriginY:(double)a3;
- (void)_setLightSourceDescriptor:(id)a3;
- (void)_setLineBreakMode:(int64_t)a3;
- (void)_setLineBreakStrategy:(unint64_t)a3;
- (void)_setMarqueeUpdatable:(BOOL)a3;
- (void)_setMaterialTextColorFollowsTintColor:(void *)result;
- (void)_setMinimumFontSize:(double)a3;
- (void)_setMultilineContextWidth:(double)a3;
- (void)_setMultilineLabelRequiresCarefulMeasurement:(BOOL)a3;
- (void)_setOverallWritingDirectionFollowsLayoutDirection:(BOOL)a3;
- (void)_setShadow:(void *)a1;
- (void)_setSupportMultiLineShrinkToFit:(uint64_t)a1;
- (void)_setText:(id)a3;
- (void)_setTextAlignment:(int64_t)a3;
- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3;
- (void)_setTextAlignmentMirrored:(BOOL)a3;
- (void)_setTextColor:(id)a3;
- (void)_setTextColorFollowsTintColor:(BOOL)a3;
- (void)_setTextEncapsulation:(id)a3;
- (void)_setUseShortcutIntrinsicContentSize:(BOOL)a3;
- (void)_setUsesSimpleTextEffects:(BOOL)a3;
- (void)_setVerticalTextEnabled:(BOOL)a3;
- (void)_setVisualStyle:(id)a3;
- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3;
- (void)_setWantsUnderlineForAccessibilityButtonShapesEnabled:(BOOL)a3;
- (void)_startMarqueeIfNecessary;
- (void)_stopMarqueeWithRedisplay:(BOOL)a3;
- (void)_synthesizedTextAttributes;
- (void)_updateSystemConstraints;
- (void)_updateTextColorWithFallbackColorIfNeeded;
- (void)_updateTightBoundingBoxLayoutGuideConstraintsIfNecessary;
- (void)_updateVariableLengthStringIfNeeded;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)rect;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layerWillDraw:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
- (void)setAdjustsLetterSpacingToFitWidth:(BOOL)adjustsLetterSpacingToFitWidth;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation;
- (void)setAttributedText:(NSAttributedString *)attributedText;
- (void)setBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment;
- (void)setBounds:(CGRect)a3;
- (void)setDrawsUnderline:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setEnablesMarqueeWhenAncestorFocused:(BOOL)enablesMarqueeWhenAncestorFocused;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor;
- (void)setLineSpacing:(int64_t)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMarqueeLoopPadding:(double)a3;
- (void)setMarqueeRepeatCount:(unint64_t)a3;
- (void)setMarqueeRunning:(BOOL)a3;
- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor;
- (void)setNeedsDisplay;
- (void)setNumberOfLines:(NSInteger)numberOfLines;
- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth;
- (void)setPreferredVibrancy:(UILabelVibrancy)preferredVibrancy;
- (void)setRawSize:(CGSize)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(UIColor *)shadowColor;
- (void)setShadowOffset:(CGSize)shadowOffset;
- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated;
- (void)setSizingRule:(int64_t)a3;
- (void)setTextColor:(UIColor *)textColor;
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled;
- (void)set_fontForShortcutBaselineCalculation:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UILabel

- (BOOL)_shouldInvalidateBaselineConstraintsForSize:(CGSize)a3 oldSize:(CGSize)a4
{
  return 0;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)UILabel;
  [(UIView *)&v43 _didMoveFromWindow:v6 toWindow:v7];
  if (v7)
  {
    if ((*((unsigned char *)&self->_textLabelFlags + 1) & 0x80) != 0)
    {
      -[UIView _removeGeometryChangeObserver:](self, self);
      -[UIView _addGeometryChangeObserver:](self, self);
      v44.receiver = self;
      v44.super_class = (Class)UILabel;
      [(UIView *)&v44 setNeedsDisplay];
    }
    -[UILabel _updateVariableLengthStringIfNeeded](self);
    if ((*((unsigned char *)&self->_textLabelFlags + 1) & 2) != 0)
    {
      v8 = [(UIView *)self viewWithTag:4032914800];
      if (v8)
      {
        id v32 = v7;
        id v33 = v6;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v9 = self->_marqueeAnimations;
        uint64_t v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v40 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * i);
              v15 = [v8 layer];
              v16 = [(NSMutableDictionary *)self->_marqueeAnimations objectForKeyedSubscript:v14];
              [v15 addAnimation:v16 forKey:v14];
            }
            uint64_t v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v39 objects:v46 count:16];
          }
          while (v11);
        }

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        marqueeMaskAnimations = self->_marqueeMaskAnimations;
        uint64_t v18 = [(NSMutableDictionary *)marqueeMaskAnimations countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v36;
          obuint64_t j = marqueeMaskAnimations;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * j);
              v23 = [v8 layer];
              v24 = [v23 mask];
              v25 = [(NSMutableDictionary *)self->_marqueeMaskAnimations objectForKeyedSubscript:v22];
              [v24 addAnimation:v25 forKey:v22];
            }
            marqueeMaskAnimations = obj;
            uint64_t v19 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v19);
        }
        id v7 = v32;
        id v6 = v33;
      }
      else
      {
        marqueeAnimations = self->_marqueeAnimations;
        self->_marqueeAnimations = 0;

        marqueeMaskAnimations = self->_marqueeMaskAnimations;
        self->_marqueeMaskAnimations = 0;
      }
    }
    if (dyld_program_sdk_at_least())
    {
      v27 = [v7 traitCollection];
      uint64_t v28 = [v27 userInterfaceIdiom];
      v29 = [v6 traitCollection];
      if (v28 == [v29 userInterfaceIdiom])
      {
      }
      else
      {
        v30 = [v7 traitCollection];
        uint64_t v31 = [v30 userInterfaceIdiom];

        if (v31 == 3) {
          -[UILabel _adjustFontForAccessibilityTraits:](self, 1);
        }
      }
    }
  }
  else
  {
    -[UIView _removeGeometryChangeObserver:](self, self);
    if ((*((unsigned char *)&self->_textLabelFlags + 1) & 0x80) != 0)
    {
      v44.receiver = self;
      v44.super_class = (Class)UILabel;
      [(UIView *)&v44 setNeedsDisplay];
    }
  }
}

- (void)_setMaterialTextColorFollowsTintColor:(void *)result
{
  if (result)
  {
    uint64_t v2 = result[92];
    if (a2 != v2 >> 31)
    {
      uint64_t v3 = 0x80000000;
      if (!a2) {
        uint64_t v3 = 0;
      }
      result[92] = v2 & 0xFFFFFFFF7FFFFFFFLL | v3;
      return -[UILabel _invalidateLabelDisplay](result);
    }
  }
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  -[UILabel _invalidateAsNeededForNewSize:oldSize:]((double (*)(id, double, double))self, width, height, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  -[UIView setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  -[UILabel _invalidateAsNeededForNewSize:oldSize:]((double (*)(id, double, double))self, width, height, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)_invalidateAsNeededForNewSize:(double *)(a1 oldSize:
{
  if (a1)
  {
    if (a4 != a2 || a5 != a3)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      aBlock[4] = a1;
      uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
      if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
      {
        v21[0] = (double (*)(id, double, double))MEMORY[0x1E4F143A8];
        v21[1] = (double (*)(id, double, double))3221225472;
        v21[2] = (double (*)(id, double, double))__49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_2;
        v21[3] = (double (*)(id, double, double))&unk_1E530C020;
        v21[4] = a1;
        if (_UITextLayoutSizeWillShrink(v21, a4, a5, a2, a3))
        {
          char v12 = 1;
        }
        else
        {
          v11[2](v11);
          char v12 = 0;
        }
        v13 = [a1 layer];
        uint64_t v14 = [v13 _labelLayerToClipDuringBoundsSizeAnimation];

        LOBYTE(v13) = [v14 masksToBounds];
        [v14 _setLabelMasksToBoundsForAnimation:1];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_3;
        v16[3] = &unk_1E530ED10;
        id v17 = v14;
        char v19 = (char)v13;
        char v20 = v12;
        uint64_t v18 = v11;
        id v15 = v14;
        +[UIViewAnimationState _addSystemPostAnimationAction:v16];
      }
      else
      {
        v11[2](v11);
      }
    }
  }
}

void __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke(uint64_t a1)
{
  -[UILabel _updateVariableLengthStringIfNeeded](*(void **)(a1 + 32));
  -[UILabel _invalidateLabelMetrics](*(void *)(a1 + 32));
  if (*(void *)(a1 + 32))
  {
    v2.receiver = *(id *)(a1 + 32);
    v2.super_class = (Class)UILabel;
    objc_msgSendSuper2(&v2, sel_setNeedsDisplay);
  }
}

- (void)_resolveMaterialColor:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v11 = v3;
    if (!v3)
    {
      objc_msgSend((id)a1, "mt_setContentEffects:", 0);
      goto LABEL_13;
    }
    id v4 = v3;
    if (([(id)a1 isEnabled] & 1) == 0)
    {
      uint64_t v5 = [(id)a1 _disabledFontColor];

      id v4 = (id)v5;
    }
    if ([v4 _isDynamic] && (*(unsigned char *)(a1 + 120) & 0x20) != 0)
    {
      id v6 = [(id)a1 traitCollection];
      id v7 = [v4 _resolvedMaterialWithTraitCollection:v6];

      if ([v7 isVibrant])
      {
        double v8 = [*(id *)(a1 + 552) string];
        int v9 = [v8 _containsEmoji];

        if (!v9) {
          goto LABEL_11;
        }
      }
    }
    id v7 = 0;
LABEL_11:
    objc_super v10 = [v7 contentEffects];
    objc_msgSend((id)a1, "mt_setContentEffects:", v10);

LABEL_13:
    id v3 = v11;
  }
}

- (BOOL)isEnabled
{
  return (*(unsigned char *)&self->_textLabelFlags >> 6) & 1;
}

- (void)setNeedsDisplay
{
  if (dyld_program_sdk_at_least())
  {
    -[UILabel _invalidateLabelDisplay](self);
  }
  else
  {
    *(void *)&self->_textLabelFlags &= ~0x1000000uLL;
    v3.receiver = self;
    v3.super_class = (Class)UILabel;
    [(UIView *)&v3 setNeedsDisplay];
  }
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(void *)&self->super._viewFlags & 0x20000000000000) != 0
      && self->_numberOfLines != 1
      && (*((unsigned char *)&self->_textLabelFlags + 1) & 0x20) == 0;
}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

+ (id)_defaultAttributes
{
  id v3 = (id)objc_opt_class();
  id v4 = +[_UITextAttributeDefaults _unspecifiedDefaults];
  uint64_t v5 = [v4 _label];
  id v6 = [v5 _attributes];
  id v7 = v6;
  if (v3 != a1)
  {
    uint64_t v8 = [v6 copy];

    id v7 = (void *)v8;
  }

  return v7;
}

+ (id)defaultFont
{
  objc_super v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 5) {
    +[_UITextAttributeDefaults _defaultsForUserInterfaceIdiom:5];
  }
  else {
  id v4 = +[_UITextAttributeDefaults _unspecifiedDefaults];
  }
  uint64_t v5 = [v4 _label];
  id v6 = [v5 _font];

  return v6;
}

+ (id)_defaultColor
{
  objc_super v2 = +[_UITextAttributeDefaults _unspecifiedDefaults];
  uint64_t v3 = [v2 _label];
  id v4 = [v3 _textColor];

  return v4;
}

- (NSTextAlignment)textAlignment
{
  objc_super v2 = [(UILabel *)self _content];
  uint64_t v3 = [v2 paragraphStyle];
  NSTextAlignment v4 = [v3 alignment];

  return v4;
}

- (void)_adjustFontForTypesettingLanguage
{
  if (a1)
  {
    id v3 = [a1 _content];
    objc_super v2 = -[UILabel _contentAdjustingFontForTypesettingLanguage:didAdjustFont:](a1, v3, 0);
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)a1, v2, 0, 0, 0, 1);
  }
}

- (float)_hyphenationFactor
{
  objc_super v2 = [(UILabel *)self _content];
  id v3 = [v2 paragraphStyle];
  [v3 hyphenationFactor];
  float v5 = v4;

  return v5;
}

- (id)_shadow
{
  if (a1)
  {
    v1 = [a1 _content];
    objc_super v2 = [v1 shadow];
  }
  else
  {
    objc_super v2 = 0;
  }
  return v2;
}

- (id)_contentAdjustingFontForTypesettingLanguage:(unsigned char *)a3 didAdjustFont:
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__235;
  uint64_t v31 = __Block_byref_object_dispose__235;
  id v5 = a2;
  id v32 = v5;
  id v6 = [v5 string];
  if ([a1 _wantsContentAwareTypesettingLanguage]
    && [v6 length]
    && (id v7 = (void *)CTFontCopyTallestTextStyleLanguageForString()) != 0)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  if (![v8 length])
  {
    int v9 = [a1 traitCollection];
    uint64_t v10 = [v9 typesettingLanguage];

    id v8 = (id)v10;
  }
  id v11 = [(id)v28[5] font];
  char v12 = -[UIFont _fontAdjustedForTypesettingLanguage:](v11, v8);

  if (v12)
  {
    if ([v5 isAttributed])
    {
      v13 = [v5 attributedString];
      uint64_t v14 = [(id)v28[5] length];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__UILabel__contentAdjustingFontForTypesettingLanguage_didAdjustFont___block_invoke;
      v23[3] = &unk_1E530ED78;
      id v24 = v8;
      v25 = &v27;
      v26 = a3;
      objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0x100000, v23);
    }
    id v15 = [(id)v28[5] font];
    id v16 = v12;
    id v17 = v16;
    if (v15 == v16)
    {

      goto LABEL_19;
    }
    if (v15)
    {
      char v18 = [v15 isEqual:v16];

      if (v18) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v19 = [(id)v28[5] contentByAddingAttribute:*(void *)off_1E52D2040 toDefaultAttributesWithValue:v17];
    char v20 = (void *)v28[5];
    v28[5] = v19;

    if (a3) {
      *a3 = 1;
    }
  }
LABEL_19:
  id v21 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (UIFont)font
{
  objc_super v2 = [(UILabel *)self _content];
  id v3 = [v2 font];

  return (UIFont *)v3;
}

- (NSString)text
{
  objc_super v2 = [(UILabel *)self _content];
  id v3 = [v2 string];

  return (NSString *)v3;
}

- (_UILabelContent)_content
{
  content = self->_content;
  if (!content)
  {
    float v4 = [_UILabelContent alloc];
    id v5 = [(id)objc_opt_class() _defaultAttributes];
    id v6 = [(_UILabelContent *)v4 initWithDefaultAttributes:v5];
    id v7 = self->_content;
    self->_content = v6;

    content = self->_content;
  }
  return content;
}

- (void)_updateVariableLengthStringIfNeeded
{
  if (a1)
  {
    id v3 = [a1 _content];
    objc_super v2 = [v3 widthVariantContentForView:a1];
    [a1 _setContent:v2];
  }
}

- (void)_setFont:(id)a3
{
  id v8 = a3;
  if (v8 || ([(id)objc_opt_class() defaultFont], (id v8 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    float v4 = [(UILabel *)self _content];
    id v5 = [v4 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D2040 value:v8];
    [(UILabel *)self _setContent:v5];
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    id v8 = [(UILabel *)self font];
    float v4 = [v8 fontName];
    id v5 = [(UILabel *)self font];
    [v5 pointSize];
    NSLog(&cfstr_NilPassedToUil.isa, v6, v4, v7);
  }
}

- (void)_setContent:(id)a3
{
  id v5 = a3;
  int v4 = dyld_program_sdk_at_least();
  -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)self, v5, 1, v4, v4, 1);
}

- (void)_setContent:(int)a3 adjustingFontForAccessibilityTraits:(int)a4 adjustingFontForTypesettingLanguage:(int)a5 adjustingFontForTypesettingLanguageAwareLineHeightRatio:(char)a6 checkingForDifferences:
{
  id v12 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  v13 = (id *)(a1 + 552);
  if ((a6 & 1) == 0)
  {
    objc_storeStrong(v13, a2);
    goto LABEL_41;
  }
  id v14 = *v13;
  id v15 = v12;
  id v12 = v15;
  if (v14 == v15)
  {

    goto LABEL_41;
  }
  if (v15 && v14)
  {
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v17 = [*(id *)(a1 + 552) differenceVersusContent:v12];
  uint64_t v18 = v17;
  if ((*(unsigned char *)(a1 + 739) & 0x20) == 0 || (v17 & 0x200) != 0)
  {
    BOOL v28 = 0;
    if (a3)
    {
LABEL_19:
      BOOL v21 = (v18 & 0x10000) == 0;
      goto LABEL_20;
    }
  }
  else
  {
    id v19 = v12;
    char v20 = [(id)a1 _defaultAttributes];
    id v12 = [v19 contentWithDefaultAttributes:v20];

    BOOL v28 = v12 != v19;
    if (a3) {
      goto LABEL_19;
    }
  }
  if ((a4 & 1) != 0 || a5) {
    goto LABEL_19;
  }
  BOOL v21 = 1;
LABEL_20:
  int v22 = 0;
  __int16 v30 = 0;
  unsigned __int8 v29 = 0;
  if (a4) {
    int v22 = [(id)a1 _wantsContentAwareTypesettingLanguage];
  }
  id v23 = v12;
  id v12 = v23;
  if (((a3 ^ 1 | v21) & 1) == 0)
  {
    -[UILabel _contentAdjustingFontForAccessibilityTraits:forced:didAdjustFont:]((unsigned char *)a1, v23, 0, (unsigned char *)&v30 + 1);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((a5 ^ 1 | v21 | v22))
  {
    BOOL v24 = 0;
  }
  else
  {
    uint64_t v25 = -[UILabel _contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:didAdjustFont:]((void *)a1, v12, &v30);

    BOOL v24 = (_BYTE)v30 != 0;
    id v12 = (id)v25;
  }
  if (((a4 ^ 1 | (v24 || v21)) ^ 1 | v22) == 1)
  {
    uint64_t v26 = -[UILabel _contentAdjustingFontForTypesettingLanguage:didAdjustFont:]((void *)a1, v12, &v29);

    id v12 = (id)v26;
  }
  if (v28 || HIBYTE(v30) | v30 | v29 && v23 != v12) {
    uint64_t v18 = [*(id *)(a1 + 552) differenceVersusContent:v12];
  }
  if (v18)
  {
    id v27 = *(id *)(a1 + 552);
    objc_storeStrong((id *)(a1 + 552), v12);
    if ((v18 & 0xFFFFFFFFFFFFFFF7) != 0)
    {
      [(id)a1 _contentDidChange:v18 fromContent:v27];
      -[UILabel _invalidateLabelDisplay]((void *)a1);
      if ((v18 & 0x4000) != 0)
      {
        [(id)a1 _invalidateLabelSize];
        if ((*(void *)(a1 + 96) & 0x400000000000000) != 0 && !*(void *)(a1 + 760)) {
          [(id)a1 _invalidateBaselineConstraints];
        }
      }
    }
  }
LABEL_41:
}

- (void)_invalidateLabelDisplay
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    result[92] &= ~0x1000000uLL;
    objc_super v2 = (void *)result[70];
    result[70] = 0;

    id v3 = *(void **)(v1 + 568);
    *(void *)(v1 + 568) = 0;

    int v4 = *(void **)(v1 + 608);
    *(void *)(v1 + 608) = 0;

    *(_OWORD *)(v1 + 616) = *MEMORY[0x1E4F1DB30];
    *(void *)(v1 + 736) &= ~0x10000uLL;
    if ((*(void *)(v1 + 96) & 0x1000) == 0) {
      -[UILabel _resolveMaterialColor:](v1, *(void **)(v1 + 696));
    }
    id v5 = *(void **)(v1 + 600);
    *(void *)(v1 + 600) = 0;

    v6.receiver = (id)v1;
    v6.super_class = (Class)UILabel;
    return objc_msgSendSuper2(&v6, sel_setNeedsDisplay);
  }
  return result;
}

- (BOOL)_wantsContentAwareTypesettingLanguage
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 4) & 1;
}

- (void)_contentDidChange:(int64_t)a3 fromContent:(id)a4
{
  id v5 = a4;
  id v8 = [(UILabel *)self _content];
  objc_super v6 = [v8 labelViewTextAttachments];
  uint64_t v7 = [v5 labelViewTextAttachments];

  [(UILabel *)self _addViewsForLabelViewTextAttachments:v6 previousLabelViewTextAttachments:v7];
}

- (void)_addViewsForLabelViewTextAttachments:(id)a3 previousLabelViewTextAttachments:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToArray:v7] & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v7;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) view];
          [v13 removeFromSuperview];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v6;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          char v20 = [v19 view];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __124__UILabel_UILabel_Internal_IntelligenceLightSupport___addViewsForLabelViewTextAttachments_previousLabelViewTextAttachments___block_invoke;
          v24[3] = &unk_1E530EE38;
          id v25 = v20;
          id v21 = v20;
          [v19 setLayoutInRect:v24];
          [(UIView *)self addSubview:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    id v7 = v22;
    id v6 = v23;
  }
}

- (CGSize)intrinsicContentSize
{
  if (!self)
  {
    double v17 = 0.0;
    double v7 = 0.0;
    goto LABEL_23;
  }
  BOOL v3 = [(UILabel *)self _useShortcutIntrinsicContentSize];
  if (!v3)
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      BOOL v6 = [(UILabel *)self numberOfLines] == 1;
      goto LABEL_15;
    }
    BOOL v5 = [(UILabel *)self _multilineLabelRequiresCarefulMeasurement];
    BOOL v6 = [(UILabel *)self numberOfLines] == 1;
    if (v5) {
      goto LABEL_15;
    }
LABEL_9:
    uint64_t viewFlags = (uint64_t)self->super._viewFlags;
    if ((viewFlags & 0x4000000000000) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    [(UILabel *)self _preferredMaxLayoutWidth];
    if (v11 <= 0.0) {
      double v11 = 3.40282347e38;
    }
    [(UILabel *)self _intrinsicSizeWithinSize:v11];
    double v10 = v13;
    double v14 = 65536.0;
    if (v6) {
      double v14 = v12;
    }
    if (v3) {
      double v7 = v14;
    }
    else {
      double v7 = v12;
    }
    goto LABEL_22;
  }
  if ([(UILabel *)self numberOfLines] != 1)
  {
    BOOL v6 = 0;
    goto LABEL_9;
  }
  uint64_t viewFlags = (uint64_t)self->super._viewFlags;
LABEL_10:
  if ((viewFlags & 0x4000000000000) != 0) {
    double v7 = 65536.0;
  }
  else {
    double v7 = -1.0;
  }
  id v8 = [(UILabel *)self font];
  [v8 lineHeight];
  UICeilToViewScale(self);
  double v10 = v9;

LABEL_22:
  double v15 = -[UILabel _letterformAwareAllAlignmentInsets](self);
  double v17 = v10 + v15 + 0.0 + v16 + 0.0;
LABEL_23:
  double v18 = v7;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (NSInteger)numberOfLines
{
  return self->_numberOfLines;
}

- (double)_ensureBaselineMetricsReturningBounds
{
  if (!a1) {
    return 0.0;
  }
  objc_super v2 = (double *)MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  [(id)a1 _preferredMaxLayoutWidth];
  if (v4 != 0.0 && *(void *)(a1 + 440) != 1) {
    double v3 = v4;
  }
  double v6 = *v2;
  double v5 = v2[1];
  double v7 = [(id)a1 text];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    objc_msgSend((id)a1, "_intrinsicSizeWithinSize:", v3, v2[3]);
    double v10 = v9;
    double v12 = v11;
    if (*(void *)(a1 + 440) == 1 && (*(_DWORD *)(a1 + 736) & 0x1000A) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    double v13 = [(id)a1 font];
    double v14 = v13;
    if (!v13)
    {
      double v14 = +[UILabel defaultFont];
    }
    objc_msgSend(@"X", "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, objc_msgSend((id)a1, "lineBreakMode"), 3.40282347e38);
    double v10 = v15;
    double v12 = v16;
    if (!v13) {
  }
    }
  objc_msgSend((id)a1, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v5, v10, v12);
LABEL_15:
  *(double *)(a1 + 504) = v6;
  *(double *)(a1 + 512) = v5;
  *(double *)(a1 + 520) = v10;
  *(double *)(a1 + 528) = v12;
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  double v9 = -[UILabel _letterformAwareAllAlignmentInsets](self);
  if ((*(void *)&textLabelFlags & 0x4000000000) == 0)
  {
    double v10 = 0.0;
    double v9 = v9 + 0.0;
    double v11 = v11 + 0.0;
    double v12 = 0.0;
  }
  double v13 = v7 + v9 + v11;
  double v14 = v5 + v10 + v12;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)_letterformAwareAllAlignmentInsets
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = a1[92];
  double v2 = 0.0;
  if ((v1 & 0x6000000000) != 0)
  {
    if ((v1 & 0x10000000) != 0)
    {
      double v4 = [a1 layer];
      double v3 = v4;
      if (v4 && ([v4 letterformAwareInsetsAreValid] & 1) == 0) {
        [v3 updateContentInsets];
      }
    }
    else
    {
      double v3 = 0;
    }
    if ([v3 letterformAwareInsetsAreValid])
    {
      [v3 letterformAwareInsets];
      double v2 = 0.0 - v5;
    }
  }
  return v2;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UIViewDebugSignposts, @"UIViewDebugSignposts");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__UILabel__intrinsicSizeWithinSize___block_invoke;
  v19[3] = &unk_1E530C048;
  v19[4] = self;
  if ((v6 & 1) != 0 || !byte_1EB256E34)
  {
    uint64_t v22 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
  }
  else
  {
    memset(v25, 0, sizeof(v25));
    __36__UILabel__intrinsicSizeWithinSize___block_invoke((uint64_t)v19, (uint64_t)v25);
    if (LODWORD(v25[0])) {
      kdebug_trace();
    }
    long long v20 = *(_OWORD *)((char *)&v25[2] + 8);
    long long v21 = *(_OWORD *)((char *)&v25[3] + 8);
    uint64_t v22 = *((void *)&v25[4] + 1);
  }
  double v7 = [(UIView *)self superview];
  kdebug_trace();

  intrinsicContentSizeCache = self->_intrinsicContentSizeCache;
  if (!intrinsicContentSizeCache)
  {
    double v9 = (_UITextSizeCache *)objc_opt_new();
    double v10 = self->_intrinsicContentSizeCache;
    self->_intrinsicContentSizeCache = v9;

    intrinsicContentSizeCache = self->_intrinsicContentSizeCache;
  }
  double v23 = 0.0;
  double v24 = 0.0;
  if (!-[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](intrinsicContentSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", &v23, &self->_intrinsicSizeBaselineInfo, self->_numberOfLines != 1, width, height))
  {
    if (width <= 0.0 || self->_numberOfLines == 1) {
      double v12 = 3.40282347e38;
    }
    else {
      double v12 = width;
    }
    -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0.0, 0.0, v12);
    double v23 = v13;
    double v24 = v14;
    -[_UITextSizeCache addSize:baselineInfo:forTargetSize:](self->_intrinsicContentSizeCache, "addSize:baselineInfo:forTargetSize:", &self->_intrinsicSizeBaselineInfo, v13, v14, width, height);
  }
  if (kdebug_is_enabled())
  {
    id v15 = [(UIView *)self description];
    [v15 UTF8String];
    kdebug_trace_string();

    double v16 = [(UIView *)self superview];
    kdebug_trace();
  }
  if (v20) {
    kdebug_trace();
  }
  double v17 = v23;
  double v18 = v24;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (double)_preferredMaxLayoutWidth
{
  if ((*((unsigned char *)&self->_textLabelFlags + 1) & 0x20) != 0) {
    return self->_preferredMaxLayoutWidth;
  }
  double result = 0.0;
  if ((*(void *)&self->super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
  -[UILabel _textRectForBounds:limitedToNumberOfLines:includingShadow:](self, "_textRectForBounds:limitedToNumberOfLines:includingShadow:", numberOfLines, 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4 includingShadow:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(UILabel *)self text];
  uint64_t v13 = [v12 length];

  if (!v13)
  {
    double v28 = 0.0;
    double v29 = x;
    double v30 = y;
    double v31 = 0.0;
    goto LABEL_77;
  }
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  p_measuredNumberOfLines = &self->_intrinsicSizeBaselineInfo.measuredNumberOfLines;
  double v16 = self;
  uint64_t v17 = (uint64_t)v16;
  if ((*(unsigned char *)&v16->_textLabelFlags & 4) != 0)
  {
    double v19 = _UIComputedSizeForLabel(v16, 0, 0, a4, p_measuredNumberOfLines, &v85, &v84, width, height);
    double v27 = v32;
  }
  else
  {
    double v18 = [(UILabel *)v16 _stringDrawingContext];
    [v18 setMaximumNumberOfLines:a4];
    [v18 setWrapsForTruncationMode:a4 != 1];
    [v18 setWantsNumberOfLineFragments:1];
    [v18 setWantsBaselineOffset:1];
    if (width < 0.0 || height < 0.0)
    {
      double v19 = *MEMORY[0x1E4F1DB30];
      double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      if (width == 0.0) {
        double v19 = 3.40282347e38;
      }
      else {
        double v19 = width;
      }
      if (height == 0.0) {
        double v20 = 3.40282347e38;
      }
      else {
        double v20 = height;
      }
      if (-[UILabel _updateScaledMetricsForRect:](v17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v19, v20))[v18 setLayout:0]; {
      long long v21 = [(id)v17 _content];
      }
      if ([v21 isAttributed])
      {
        uint64_t v22 = [(id)v17 _synthesizedAttributedText];
        if (v22)
        {
          double v23 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((unsigned char *)v17, v22, [(id)v17 _stringDrawingOptions], v18, v19, 3.40282347e38);
          double v25 = v24;
          double v27 = v26;
        }
        else
        {
          double v25 = *MEMORY[0x1E4F1DB30];
          double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        }
        long long v38 = objc_msgSend(v21, "paragraphStyle", v23);
        if (dyld_program_sdk_at_least())
        {
          [v38 firstLineHeadIndent];
          if (v39 > 0.0)
          {
            if ([v18 numberOfLineFragments] == 1) {
              goto LABEL_34;
            }
            v81 = [v22 string];
            v78 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            v82 = [v81 componentsSeparatedByCharactersInSet:v78];

            uint64_t v79 = [v82 count];
            if ([v82 count])
            {
              v77 = [v82 lastObject];
              BOOL v76 = [v77 length] == 0;

              unint64_t v40 = v79 - v76;
            }
            else
            {
              unint64_t v40 = v79;
            }
            unint64_t v41 = 0x7FFFFFFFLL;
            if (a4) {
              unint64_t v41 = a4;
            }
            if (v41 >= v40) {
              unint64_t v41 = v40;
            }
            unint64_t v80 = v41;
            uint64_t v42 = [v18 numberOfLineFragments];

            if (v80 == v42)
            {
LABEL_34:
              [v38 firstLineHeadIndent];
              double v44 = v25 + v43;
              if (v44 >= v19) {
                double v25 = v19;
              }
              else {
                double v25 = v44;
              }
            }
          }
        }
      }
      else if ([v21 isNil])
      {
        double v25 = *MEMORY[0x1E4F1DB30];
        double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      else
      {
        long long v33 = [v21 string];
        uint64_t v34 = [(id)v17 _stringDrawingOptions];
        long long v35 = -[UILabel _synthesizedTextAttributes]((void *)v17);
        [(UILabel *)(unsigned char *)v17 _boundingRectWithString:v34 size:v35 options:v18 attributes:v19 context:3.40282347e38];
        double v25 = v36;
        double v27 = v37;
      }
      double v45 = v25 - v19;
      if (v25 - v19 < 0.0001) {
        double v19 = v25;
      }
      uint64_t *p_measuredNumberOfLines = objc_msgSend(v18, "numberOfLineFragments", v45);
      [v18 baselineOffset];
      uint64_t v85 = v46;
      [v18 firstBaselineOffset];
      uint64_t v84 = v47;
      uint64_t v48 = [v18 layout];
      v49 = *(void **)(v17 + 600);
      *(void *)(v17 + 600) = v48;
    }
  }

  if (v5
    && ([(id)v17 shadowColor], v50 = objc_claimAutoreleasedReturnValue(), v50, v50)
    && v19 > 0.0
    && v27 > 0.0)
  {
    [(id)v17 shadowOffset];
    if (v51 < 0.0) {
      double v51 = -v51;
    }
    double v19 = v19 + v51;
    double v53 = -v52;
    if (v52 >= 0.0) {
      double v53 = v52;
    }
    double v54 = v27 + v53;
  }
  else
  {
    double v54 = v27;
  }
  int v55 = [(id)v17 _shouldCeilSizeToViewScale];
  if (width >= v19) {
    double v56 = v19;
  }
  else {
    double v56 = width;
  }
  if (height >= v54) {
    double v57 = v54;
  }
  else {
    double v57 = height;
  }
  if (v55)
  {
    UICeilToViewScale((void *)v17);
    double v59 = v58;
    UICeilToViewScale((void *)v17);
    double v31 = v60;
  }
  else
  {
    double v59 = ceil(v56);
    double v31 = ceil(v57);
  }
  v61 = [(id)v17 _content];
  BOOL v62 = +[UIView _enableRTL];
  if ([v61 isAttributed])
  {
    v63 = [(id)v17 _synthesizedAttributedText];
    uint64_t v64 = objc_msgSend(v63, "_ui_resolvedTextAlignment");
LABEL_68:

    goto LABEL_69;
  }
  if (v62) {
    uint64_t v64 = 4;
  }
  else {
    uint64_t v64 = 0;
  }
  if ((*(unsigned char *)(v17 + 736) & 0x80) != 0)
  {
    v63 = -[UILabel _synthesizedTextAttributes]((void *)v17);
    v65 = [v63 objectForKey:*(void *)off_1E52D21B8];
    uint64_t v64 = objc_msgSend(v65, "_ui_resolvedTextAlignment");

    goto LABEL_68;
  }
LABEL_69:
  double v83 = v59;
  if (v64 == 1)
  {
    v87.origin.double x = x;
    v87.origin.CGFloat y = y;
    v87.size.double width = width;
    v87.size.double height = height;
    CGRectGetMaxX(v87);
    UIRoundToViewScale((void *)v17);
    CGFloat v66 = height;
    goto LABEL_73;
  }
  CGFloat v66 = height;
  double v29 = x;
  if (v64 == 2)
  {
    v86.origin.double x = x;
    v86.origin.CGFloat y = y;
    v86.size.double width = width;
    v86.size.double height = v66;
    double v67 = CGRectGetMaxX(v86) - v83;
LABEL_73:
    double v29 = x + v67;
  }
  UIRoundToViewScale((void *)v17);
  double v30 = v68;
  UIRoundToViewScale((void *)v17);
  p_intrinsicSizeBaselineInfo->double lastBaseline = v69;
  UIRoundToViewScale((void *)v17);
  p_intrinsicSizeBaselineInfo->firstBaseline = v70;
  double lastBaseline = p_intrinsicSizeBaselineInfo->lastBaseline;
  v88.origin.double x = x;
  v88.origin.CGFloat y = y;
  v88.size.double width = width;
  v88.size.double height = v66;
  if (lastBaseline > CGRectGetMaxY(v88))
  {
    p_intrinsicSizeBaselineInfo->firstBaseline = 0.0;
    p_intrinsicSizeBaselineInfo->double lastBaseline = 0.0;
    p_intrinsicSizeBaselineInfo->measuredNumberOfLines = -1;
  }
  p_intrinsicSizeBaselineInfo->referenceBounds.origin.double x = x;
  p_intrinsicSizeBaselineInfo->referenceBounds.origin.CGFloat y = y;
  p_intrinsicSizeBaselineInfo->referenceBounds.size.double width = width;
  p_intrinsicSizeBaselineInfo->referenceBounds.size.double height = v66;
  p_intrinsicSizeBaselineInfo->bounds.origin.double x = v29;
  p_intrinsicSizeBaselineInfo->bounds.origin.CGFloat y = v30;
  double v28 = v83;
  p_intrinsicSizeBaselineInfo->bounds.size.double width = v83;
  p_intrinsicSizeBaselineInfo->bounds.size.double height = v31;

LABEL_77:
  double v72 = v29;
  double v73 = v30;
  double v74 = v28;
  double v75 = v31;
  result.size.double height = v75;
  result.size.double width = v74;
  result.origin.CGFloat y = v73;
  result.origin.double x = v72;
  return result;
}

- (UIColor)shadowColor
{
  double v2 = -[UILabel _shadow](self);
  double v3 = [v2 shadowColor];

  return (UIColor *)v3;
}

- (BOOL)_shouldCeilSizeToViewScale
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_multilineLabelRequiresCarefulMeasurement
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 2) >> 7;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 1) & 1;
}

- (UILabel)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UILabel;
  double v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UILabel *)v3 _commonInit];
  return v3;
}

- (void)_commonInit
{
  if (self)
  {
    if (qword_1EB25ADD8 != -1) {
      dispatch_once(&qword_1EB25ADD8, &__block_literal_global_640);
    }
    double v3 = (objc_class *)objc_opt_class();
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)(qword_1EB25ADD0 != (void)class_getMethodImplementation(v3, sel__defaultAttributes)) << 29));
    double v4 = self;
    objc_super v5 = +[_UILabelVisualStyle inferredVisualStyle];
    [(UILabel *)v4 _setVisualStyle:v5];

    double v6 = v4;
    double v7 = objc_alloc_init(_UILabelLegacyImpl);
    objc_storeStrong((id *)&v6->__impl, v7);

    if (dyld_program_sdk_at_least())
    {
      int v8 = _UIBarsUseDynamicType();
      uint64_t v9 = 0x8000000;
      if (!v8) {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFF7FFFFFFLL | v9);
    v6->_numberOfLines = 1;
    v6->_intrinsicSizeBaselineInfo.measuredNumberOfLines = -1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    uint64_t v13 = __22__UILabel__commonInit__block_invoke_2;
    double v14 = &unk_1E52D9F70;
    id v15 = v6;
    if (dyld_program_sdk_at_least()) {
      +[UIView _performSystemAppearanceModifications:v12];
    }
    else {
      v13((uint64_t)v12);
    }
    *(void *)&self->_textLabelFlags &= ~0x80000uLL;
    int v10 = dyld_program_sdk_at_least();
    uint64_t v11 = 64;
    if (v10) {
      uint64_t v11 = 68;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFF8BLL | v11);
    [(UIView *)v6 setContentsPosition:3];
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UIView *)v6 setClipsToBounds:1];
    }
    [(UILabel *)v6 setUserInteractionEnabled:0];
    if (dyld_program_sdk_at_least()) {
      [(UIView *)v6 setClipsToBounds:0];
    }
    UILabelCommonInit(v6);
  }
}

void __22__UILabel__commonInit__block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [(id)objc_opt_class() defaultFont];
  [v2 setFont:v3];

  double v4 = *(void **)(a1 + 32);
  objc_super v5 = [(id)objc_opt_class() _defaultColor];
  [v4 setTextColor:v5];

  id v6 = [*(id *)(a1 + 32) _nilBackgroundColor];
  [*(id *)(a1 + 32) setBackgroundColor:v6];
}

- (void)_setTextColor:(id)a3
{
  double v4 = (UIColor *)a3;
  if (!v4)
  {
    double v4 = [(id)objc_opt_class() _defaultColor];
    *(void *)&self->_textLabelFlags &= ~0x80000uLL;
  }
  objc_super v5 = [(UILabel *)self _content];
  uint64_t v6 = *(void *)off_1E52D2048;
  id v10 = v5;
  if (([v5 isAttribute:*(void *)off_1E52D2048 uniformlyEqualToValue:v4] & 1) == 0)
  {
    double v7 = [v10 contentByApplyingAttributeToEntireRange:v6 value:v4];
    [(UILabel *)self _setContent:v7];
  }
  lastSetColor = self->_lastSetColor;
  self->_lastSetColor = v4;
  uint64_t v9 = v4;

  -[UILabel _resolveMaterialColor:]((uint64_t)self, v9);
}

- (void)setTextColor:(UIColor *)textColor
{
  *(void *)&self->_textLabelFlags |= 0x80000uLL;
  [(UILabel *)self _setTextColor:textColor];
}

- (void)_setVisualStyle:(id)a3
{
}

- (id)_nilBackgroundColor
{
  if ([(UIView *)self isOpaque])
  {
    double v2 = +[UIColor clearColor];
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

+ (Class)layerClass
{
  dyld_program_sdk_at_least();
  double v2 = objc_opt_class();
  return (Class)v2;
}

- (_UILabelVisualStyle)_visualStyle
{
  return self->__visualStyle;
}

- (void)_setDrawsDebugGlyphPathBoundsClipping:(BOOL)a3
{
  if (((((*(void *)&self->_textLabelFlags & 0x8000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x8000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFF7FFFLL | v4);
    if (a3) {
      -[UIView _addGeometryChangeObserver:](self, self);
    }
    else {
      -[UIView _removeGeometryChangeObserver:](self, self);
    }
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setNeedsDisplay];
  }
}

- (NSLineBreakStrategy)lineBreakStrategy
{
  double v2 = [(UILabel *)self _content];
  double v3 = [v2 paragraphStyle];
  NSLineBreakStrategy v4 = [v3 lineBreakStrategy];

  return v4;
}

uint64_t __47__UILabel__resolveMaterialUsingAttributedText___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __47__UILabel__resolveMaterialUsingAttributedText___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)_setText:(id)a3
{
  id v4 = a3;
  id v7 = [(UILabel *)self _content];
  objc_super v5 = [v7 contentWithString:v4];

  uint64_t v6 = [v5 widthVariantContentForView:self];
  [(UILabel *)self _setContent:v6];
}

- (void)setAdjustsLetterSpacingToFitWidth:(BOOL)adjustsLetterSpacingToFitWidth
{
  if (((((*(void *)&self->_textLabelFlags & 8) == 0) ^ adjustsLetterSpacingToFitWidth) & 1) == 0)
  {
    uint64_t v4 = 8;
    if (!adjustsLetterSpacingToFitWidth) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFF7 | v4);
    [(UILabel *)self _invalidateLabelSize];
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setNeedsDisplay];
  }
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  BOOL v3 = userInteractionEnabled;
  if ([(UIView *)self isUserInteractionEnabled] != userInteractionEnabled)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setUserInteractionEnabled:v3];
    if (self)
    {
      v6.receiver = self;
      v6.super_class = (Class)UILabel;
      [(UIView *)&v6 setNeedsDisplay];
    }
  }
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  uint64_t v17 = attributedText;
  uint64_t v4 = self->_content;
  objc_super v5 = [(UILabel *)self _content];
  objc_super v6 = [v5 contentWithAttributedString:v17];
  [(UILabel *)self _setContent:v6];

  content = self->_content;
  int v8 = v17;
  if (v4 != content)
  {
    -[UILabel _noteInstanceCustomizationForAttributedString:attributes:](self, v17, 0);
    uint64_t v9 = v17;
    if ([(NSAttributedString *)v9 length])
    {
      uint64_t v24 = 0;
      double v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      uint64_t v10 = [(NSAttributedString *)v9 length];
      uint64_t v11 = *(void *)off_1E52D1F58;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__UILabel__resolveMaterialUsingAttributedText___block_invoke;
      v23[3] = &unk_1E52DE5D8;
      void v23[4] = &v24;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v9, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0x100000, v23);
      uint64_t v19 = 0;
      double v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      uint64_t v12 = [(NSAttributedString *)v9 length];
      uint64_t v13 = *(void *)off_1E52D1F40;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __47__UILabel__resolveMaterialUsingAttributedText___block_invoke_2;
      v18[3] = &unk_1E52DE5D8;
      v18[4] = &v19;
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v9, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v12, 0x100000, v18);
      uint64_t v14 = *(void *)off_1E52D2048;
      if ([(_UILabelContent *)self->_content isAttribute:*(void *)off_1E52D2048 uniformlyEqualToValue:0])
      {
        id v15 = [(UILabel *)self textColor];
        objc_storeStrong((id *)&self->_lastSetColor, v15);
        -[UILabel _resolveMaterialColor:]((uint64_t)self, v15);
      }
      else
      {
        id v15 = [(NSAttributedString *)v9 attribute:v14 atIndex:0 effectiveRange:0];
        if (v15
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && [(_UILabelContent *)self->_content isAttribute:v14 uniformlyEqualToValue:v15]&& !*((unsigned char *)v25 + 24)&& !*((unsigned char *)v20 + 24))
        {
          objc_storeStrong((id *)&self->_lastSetColor, v15);
          -[UILabel _resolveMaterialColor:]((uint64_t)self, v15);
        }
        else
        {
          lastSetColor = self->_lastSetColor;
          self->_lastSetColor = 0;

          [(UIView *)self mt_setContentEffects:0];
        }
      }

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v24, 8);
    }

    int v8 = v17;
  }
}

- (void)_noteInstanceCustomizationForAttributedString:(void *)a3 attributes:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    objc_super v6 = [a1 _visualStyle];
    int v7 = [v6 shouldDisableUpdateTextColorOnTraitCollectionChangeForAttributedString:v8 attributes:v5];

    if (v7) {
      a1[92] |= 0x80000uLL;
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x200000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x200000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFDFFFFFFFFLL | v4);
    -[UILabel _adjustFontForAccessibilityTraits:](self, 0);
  }
}

- (void)_adjustFontForAccessibilityTraits:(unsigned char *)a1
{
  if (a1)
  {
    id v5 = [a1 _content];
    uint64_t v4 = -[UILabel _contentAdjustingFontForAccessibilityTraits:forced:didAdjustFont:](a1, v5, a2, 0);
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)a1, v4, 0, 0, 0, 1);
  }
}

- (id)_contentAdjustingFontForAccessibilityTraits:(char)a3 forced:(unsigned char *)a4 didAdjustFont:
{
  id v7 = a2;
  id v8 = v7;
  if ((a1[740] & 2) == 0 && (a3 & 1) == 0)
  {
    id v9 = v7;
    goto LABEL_16;
  }
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__235;
  double v31 = __Block_byref_object_dispose__235;
  id v10 = v7;
  id v32 = v10;
  uint64_t v11 = [a1 traitCollection];
  uint64_t v12 = [(id)v28[5] font];
  uint64_t v13 = [v12 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v11];

  if (v13)
  {
    if ([v10 isAttributed])
    {
      uint64_t v14 = [v10 attributedString];
      uint64_t v15 = [(id)v28[5] length];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__UILabel__contentAdjustingFontForAccessibilityTraits_forced_didAdjustFont___block_invoke;
      v23[3] = &unk_1E530ED78;
      id v24 = v11;
      double v25 = &v27;
      uint64_t v26 = a4;
      objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0x100000, v23);
    }
    id v16 = [(id)v28[5] font];
    id v17 = v13;
    double v18 = v17;
    if (v16 != v17)
    {
      if (v16)
      {
        char v19 = [v16 isEqual:v17];

        if (v19) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      uint64_t v20 = [(id)v28[5] contentByAddingAttribute:*(void *)off_1E52D2040 toDefaultAttributesWithValue:v18];
      uint64_t v21 = (void *)v28[5];
      v28[5] = v20;

      if (a4) {
        *a4 = 1;
      }
      goto LABEL_15;
    }
  }
LABEL_15:
  id v9 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
LABEL_16:

  return v9;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
}

- (void)_setAllowsDefaultTighteningForTruncation:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 _content];
    id v5 = [v4 paragraphStyle];

    if ([v5 allowsDefaultTighteningForTruncation] != a2)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__UILabel__setAllowsDefaultTighteningForTruncation___block_invoke;
      v10[3] = &__block_descriptor_33_e33_v16__0__NSMutableParagraphStyle_8l;
      char v11 = a2;
      id v6 = a1;
      id v7 = (void *)[v5 mutableCopy];
      __52__UILabel__setAllowsDefaultTighteningForTruncation___block_invoke((uint64_t)v10, v7);
      id v8 = [v6 _content];
      id v9 = [v8 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v7];
      [v6 _setContent:v9];

      [v6 _invalidateLabelSize];
    }
  }
}

uint64_t __52__UILabel__setAllowsDefaultTighteningForTruncation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsDefaultTighteningForTruncation:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_invalidateLabelSize
{
  self->_size = (CGSize)*MEMORY[0x1E4F1DB30];
  -[UILabel _invalidateLabelMetrics]((uint64_t)self);
  if (dyld_program_sdk_at_least())
  {
    if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      BOOL v3 = [(UIView *)self layer];
      [v3 invalidateContentInsets];
    }
    [(UIView *)self setNeedsLayout];
  }
  if (![(UILabel *)self _useShortcutIntrinsicContentSize]
    || [(UILabel *)self numberOfLines] != 1)
  {
    [(UILabel *)self invalidateIntrinsicContentSize];
  }
  if ([(UIView *)self _wantsAutolayout])
  {
    if ([(UIView *)self translatesAutoresizingMaskIntoConstraints])
    {
      uint64_t v4 = -[UILabel __tightBoundingBoxLayoutGuide](self);

      if (v4)
      {
        if ((*((void *)&self->super._viewFlags + 1) & 4) == 0)
        {
          [(UIView *)self setNeedsUpdateConstraints];
        }
      }
    }
  }
}

- (void)_invalidateLabelMetrics
{
  if (a1)
  {
    *(void *)(a1 + 736) &= ~0x800uLL;
    double v2 = *(void **)(a1 + 600);
    *(void *)(a1 + 600) = 0;

    double v3 = *(double *)(a1 + 448);
    if (*(double *)(a1 + 456) != 0.0)
    {
      [(id)a1 bounds];
      *(double *)(a1 + 536) = v4 - *(double *)(a1 + 456);
    }
    double v5 = *(double *)(a1 + 448);
    *(void *)(a1 + 456) = 0;
    if (v5 != 0.0) {
      *(double *)(a1 + 544) = v5;
    }
    *(void *)(a1 + 448) = 0;
    *(void *)(a1 + 496) = -1;
    long long v6 = *MEMORY[0x1E4F1DB28];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(a1 + 464) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(a1 + 480) = v7;
    *(_OWORD *)(a1 + 504) = v6;
    *(_OWORD *)(a1 + 520) = v7;
    if (v3 != 0.0)
    {
      if ([(id)a1 _shouldNotifyGeometryObserversForBaselineChanges])
      {
        uint64_t v26 = 0;
        long long v25 = 0u;
        long long v24 = 0u;
        long long v23 = 0u;
        long long v22 = 0u;
        long long v21 = 0u;
        long long v20 = 0u;
        long long v19 = 0u;
        long long v18 = 0u;
        long long v17 = 0u;
        long long v16 = 0u;
        long long v15 = 0u;
        long long v14 = 0u;
        long long v13 = 0u;
        long long v12 = 0u;
        uint64_t v11 = 2048;
        -[UIView _notifyGeometryObserversWithChangeInfo:](a1, &v11);
      }
      if ((*(_DWORD *)(a1 + 112) & 2) != 0)
      {
        uint64_t v8 = [(id)a1 superview];
        id v9 = (void *)v8;
        if (v8)
        {
          if ((*(void *)(v8 + 96) & 0x8000000000000000) == 0)
          {
            id v10 = [(id)a1 superview];
            [v10 setNeedsLayout];
          }
        }
      }
    }
  }
}

- (BOOL)_useShortcutIntrinsicContentSize
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 6) & 1;
}

- (void)invalidateIntrinsicContentSize
{
  [(_UITextSizeCache *)self->_intrinsicContentSizeCache removeAllSizes];
  BOOL v3 = (*(void *)&self->super._viewFlags & 0x4000000000000) == 0;
  [(UIView *)self _invalidateIntrinsicContentSizeNeedingLayout:v3];
}

- (void)_updateSystemConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  [(UIView *)&v3 _updateSystemConstraints];
  -[UILabel _updateTightBoundingBoxLayoutGuideConstraintsIfNecessary](self);
}

- (void)_updateTightBoundingBoxLayoutGuideConstraintsIfNecessary
{
  if (a1)
  {
    double v2 = -[UILabel __tightBoundingBoxLayoutGuide](a1);
    if (v2)
    {
      id v28 = v2;
      [a1 bounds];
      double v4 = v3;
      double v6 = v5;
      [a1 intrinsicContentSize];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      v30.origin.CGFloat x = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)a1, 1, 1, 0, 0, v4, v6, v7, v9);
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      double MinY = CGRectGetMinY(v30);
      v31.origin.CGFloat x = v4;
      v31.origin.CGFloat y = v6;
      v31.size.CGFloat width = v8;
      v31.size.CGFloat height = v10;
      double v26 = CGRectGetMinY(v31);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v32);
      v33.origin.CGFloat x = v4;
      v33.origin.CGFloat y = v6;
      v33.size.CGFloat width = v8;
      v33.size.CGFloat height = v10;
      double v24 = CGRectGetMinX(v33);
      v34.origin.CGFloat x = v4;
      v34.origin.CGFloat y = v6;
      v34.size.CGFloat width = v8;
      v34.size.CGFloat height = v10;
      double MaxY = CGRectGetMaxY(v34);
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      double v22 = CGRectGetMaxY(v35);
      v36.origin.CGFloat x = v4;
      v36.origin.CGFloat y = v6;
      v36.size.CGFloat width = v8;
      v36.size.CGFloat height = v10;
      double MaxX = CGRectGetMaxX(v36);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      double v16 = MaxX - CGRectGetMaxX(v37);
      long long v17 = [v28 _systemConstraints];
      long long v18 = [v17 objectAtIndexedSubscript:0];
      [v18 setConstant:MinY - v26];

      long long v19 = [v17 objectAtIndexedSubscript:1];
      [v19 setConstant:MinX - v24];

      long long v20 = [v17 objectAtIndexedSubscript:2];
      [v20 setConstant:MaxY - v22];

      long long v21 = [v17 objectAtIndexedSubscript:3];
      [v21 setConstant:v16];

      double v2 = v28;
    }
  }
}

- (id)__tightBoundingBoxLayoutGuide
{
  if (a1)
  {
    a1 = objc_getAssociatedObject(a1, &kTightBoudingBoxLayoutGuideKey);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setShowsExpansionTextWhenTruncated:(BOOL)showsExpansionTextWhenTruncated
{
  uint64_t v3 = 0x100000000;
  if (!showsExpansionTextWhenTruncated) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)drawRect:(CGRect)a3
{
  [(UIView *)self bounds];
  double v5 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v4);
  [(UILabel *)self drawTextInRect:v5];
}

- (double)_sizingRuleAdjustedBoundsForBounds:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v3 = a1[92];
  if ((v3 & 0x6000000000) != 0)
  {
    -[UILabel _letterformAwareAllAlignmentInsets](a1);
    if ((v3 & 0x4000000000) == 0) {
      double v4 = 0.0;
    }
    return a2 + v4;
  }
  return a2;
}

- (void)drawTextInRect:(CGRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v9 = 0;
  }
  else {
    double v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if ((*(_WORD *)&textLabelFlags & 0x200) != 0)
  {
    [(UIView *)self bounds];
    double v14 = v13;
    [(UILabel *)self textSizeForWidth:3.40282347e38];
    double v12 = v15;
    double v16 = v15 + v14;
    [(UILabel *)self marqueeLoopPadding];
    double v55 = v17 + v16;
    if (v12 <= v14)
    {
      int v11 = 0;
    }
    else
    {
      long long v18 = [(UILabel *)self text];
      int v11 = [v18 _isNaturallyRTL];
    }
  }
  else
  {
    int v11 = 0;
    double v55 = 0.0;
    double v12 = 0.0;
  }
  long long v19 = -[UILabel _shadow](self);
  long long v20 = [v19 shadowColor];

  if (v20)
  {
    if (!v19)
    {
      char v29 = 1;
      if ((*(_WORD *)&textLabelFlags & 0x200) == 0) {
        goto LABEL_14;
      }
      goto LABEL_16;
    }
    CGContextSaveGState(v9);
    [v19 shadowOffset];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [v19 shadowBlurRadius];
    CGFloat v26 = v25;
    id v27 = [v19 shadowColor];
    id v28 = (CGColor *)[v27 CGColor];
    v57.double width = v22;
    v57.double height = v24;
    CGContextSetShadowWithColor(v9, v57, v26, v28);

    char v29 = 0;
  }
  else
  {
    char v29 = 1;
  }

  if ((*(_WORD *)&textLabelFlags & 0x200) == 0)
  {
LABEL_14:
    -[UILabel _drawTextInRect:](self, "_drawTextInRect:", x, y, width, height);
    goto LABEL_41;
  }
LABEL_16:
  $E628185296FB360B9F692E5749A23446 v30 = self->_textLabelFlags;
  $E628185296FB360B9F692E5749A23446 v31 = ($E628185296FB360B9F692E5749A23446)(*(void *)&v30 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(v12 > width) << 11));
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = v31;
  if ((*(_WORD *)&v30 & 0x1000) == 0 || v12 <= width)
  {
    CGRect v32 = [(UIView *)self viewWithTag:4032914800];
    CGRect v33 = v32;
    if (v32) {
      [v32 removeFromSuperview];
    }

    $E628185296FB360B9F692E5749A23446 v31 = self->_textLabelFlags;
  }
  if (width >= v12) {
    double v34 = width;
  }
  else {
    double v34 = v12;
  }
  if ((*(_WORD *)&v31 & 0x800) != 0) {
    double v35 = v34;
  }
  else {
    double v35 = width;
  }
  double v36 = 0.0;
  double v37 = 0.0;
  if ((*(_WORD *)&v31 & 0x1800) == 0x800)
  {
    [(UILabel *)self _contentInsetsFromFonts];
    double v36 = height - (v40 + v41);
    double v37 = y + v40;
    double v42 = 0.0;
    if (v11) {
      double v38 = v39;
    }
    else {
      double v42 = v38 + 0.0;
    }
    double v43 = width - v38;
    double v44 = v37;
    double v45 = v36;
    CGContextClipToRect(v9, *(CGRect *)&v42);
  }
  double v46 = x;
  if (v11)
  {
    [(UILabel *)self marqueeLoopPadding];
    double v46 = v55 - v12 - v47 - v12;
  }
  $E628185296FB360B9F692E5749A23446 v48 = self->_textLabelFlags;
  if ((~*(_DWORD *)&self->_textLabelFlags & 0x1800) != 0)
  {
    -[UILabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v46, y, v35, height);
    $E628185296FB360B9F692E5749A23446 v48 = self->_textLabelFlags;
  }
  if ((*(_WORD *)&v48 & 0x1800) == 0x800)
  {
    v49 = +[UIImage kitImageNamed:@"UILabelMarqueeRightFade.png"];
    [v49 size];
    double v51 = v50;
    if (v11)
    {
      id v52 = v49;
      uint64_t v53 = [v52 CGImage];
      [v52 scale];
      v49 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v53, 4);

      double v54 = 0.0;
    }
    else
    {
      double v54 = x + width - v50;
    }
    objc_msgSend(v49, "drawInRect:blendMode:alpha:", 22, v54, v37, v51, v36, 1.0);
  }
LABEL_41:
  if ((*((unsigned char *)&self->_textLabelFlags + 1) & 8) != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__UILabel_drawTextInRect___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ((v29 & 1) == 0) {
    CGContextRestoreGState(v9);
  }
}

- (CGRect)_drawTextInRect:(CGRect)a3 forceMultiline:(BOOL)a4
{
  double v4 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 0, 0, 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)_drawTextInRect:(CGRect)a3
{
  -[UILabel _drawTextInRect:forceMultiline:](self, "_drawTextInRect:forceMultiline:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)_hasFontInfoForVerticalBaselineSpacing
{
  return 1;
}

- (void)_setTextAlignment:(int64_t)a3
{
  *(void *)&self->_textLabelFlags |= 0x80uLL;
  double v5 = [(UILabel *)self _content];
  double v6 = [v5 paragraphStyle];

  if ([v6 alignment] != a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__UILabel__setTextAlignment___block_invoke;
    v11[3] = &__block_descriptor_40_e33_v16__0__NSMutableParagraphStyle_8l;
    v11[4] = a3;
    double v7 = self;
    CGFloat v8 = (void *)[v6 mutableCopy];
    __29__UILabel__setTextAlignment___block_invoke((uint64_t)v11, v8);
    double v9 = [(UILabel *)v7 _content];
    CGFloat v10 = [v9 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v8];
    [(UILabel *)v7 _setContent:v10];

    [(UILabel *)v7 _invalidateLabelSize];
  }
}

uint64_t __29__UILabel__setTextAlignment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlignment:*(void *)(a1 + 32)];
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  if ((*((unsigned char *)&self->_textLabelFlags + 4) & 0x40) != 0)
  {
    -[UILabel _letterformAwareAllAlignmentInsets](self);
    double v2 = v4 + 0.0;
    double v3 = v5 + 0.0;
  }
  double v6 = 0.0;
  double v7 = 0.0;
  result.right = v3;
  result.bottom = v7;
  result.left = v2;
  result.top = v6;
  return result;
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UILabel;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UILabel;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (BOOL)_hasBaseline
{
  return 1;
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (void)layerWillDraw:(id)a3
{
  *(void *)&self->_textLabelFlags &= ~0x1000000uLL;
  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  [(UIView *)&v3 layerWillDraw:a3];
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)UILabel;
  [(UIView *)&v9 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  double v7 = [(UIView *)self _screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  if (v8 != a3 && (a3 == 3 || v8 == 3)) {
    [(UILabel *)self _accessibilityButtonShapesParametersDidChange];
  }
}

- (CGRect)_drawTextInRect:(CGRect)a3 baselineCalculationOnly:(BOOL)a4
{
  if (self)
  {
    double v4 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, a4, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    double v7 = 0.0;
    double v6 = 0.0;
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)_stringDrawingContext
{
  id v3 = objc_alloc_init((Class)off_1E52D2E48);
  int64_t numberOfLines = self->_numberOfLines;
  [v3 setWrapsForTruncationMode:numberOfLines != 1];
  [v3 setMaximumNumberOfLines:numberOfLines];
  if ((*((unsigned char *)&self->_textLabelFlags + 1) & 0x40) != 0) {
    [v3 setDrawsDebugBaselines:1];
  }
  [v3 setCachesLayout:1];
  [v3 setLayout:self->_layout];
  if ((*((unsigned char *)&self->_textLabelFlags + 2) & 2) != 0) {
    [v3 setUsesSimpleTextEffects:1];
  }
  if (self->_cuiCatalog) {
    objc_msgSend(v3, "setCuiCatalog:");
  }
  if (self->_cuiStyleEffectConfiguration)
  {
    objc_msgSend(v3, "setCuiStyleEffects:");
    if (-[CUIStyleEffectConfiguration useSimplifiedEffect](self->_cuiStyleEffectConfiguration, "useSimplifiedEffect"))[v3 setUsesSimpleTextEffects:1]; {
  }
    }
  return v3;
}

- (double)_drawTextInRect:(int)a3 baselineCalculationOnly:(unsigned __int8)a4 returningDeviceMetricsOfFirstLine:(int)a5 returningMultilineDeviceMetrics:(double)a6 forceMultiline:(double)a7
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  double v14 = a7;
  double v15 = a6;
  *(double *)(a1 + 464) = a6;
  *(double *)(a1 + 472) = a7;
  *(double *)(a1 + 480) = a8;
  *(double *)(a1 + 488) = a9;
  double v17 = [(id)a1 _content];
  if (![v17 length] && (a2 & 1) == 0)
  {
    double v18 = *MEMORY[0x1E4F1DB20];
    goto LABEL_184;
  }
  *(void *)(a1 + 448) = 0;
  *(void *)(a1 + 456) = 0;
  *(void *)(a1 + 496) = -1;
  long long v19 = [(id)a1 _stringDrawingContext];
  v243 = -[UILabel _synthesizedTextAttributes]((void *)a1);
  unsigned __int8 v239 = a4;
  if (a2 && ![v17 length])
  {
    id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v28 = (void *)MEMORY[0x1E4F1C9E8];
    char v29 = [(id)a1 font];
    $E628185296FB360B9F692E5749A23446 v30 = v29;
    if (!v29)
    {
      $E628185296FB360B9F692E5749A23446 v30 = +[UILabel defaultFont];
    }
    $E628185296FB360B9F692E5749A23446 v31 = [v28 dictionaryWithObject:v30 forKey:*(void *)off_1E52D2040];
    uint64_t v32 = [v27 initWithString:@"X" attributes:v31];

    if (!v29) {
    int v20 = 1;
    }
    double v21 = (void *)v32;
  }
  else
  {
    int v20 = 0;
    double v21 = 0;
  }
  [v19 setWantsNumberOfLineFragments:1];
  if (a5) {
    [v19 setMaximumNumberOfLines:0];
  }
  -[UILabel _updateScaledMetricsForRect:](a1, v15, v14, a8, a9);
  if (*(void *)(a1 + 608)) {
    [v19 setLayout:0];
  }
  CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
  if (v21)
  {
LABEL_37:
    uint64_t v36 = *(void *)(a1 + 608);
    if (v36)
    {
      if (v20) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    goto LABEL_43;
  }
  if ([v17 isAttributed])
  {
    uint64_t v23 = *(void *)(a1 + 736);
    goto LABEL_15;
  }
  [(id)a1 _hyphenationFactor];
  if (v33 > 0.0)
  {
    uint64_t v23 = *(void *)(a1 + 736);
    if ((v23 & 0x4000000) != 0)
    {
LABEL_15:
      if ((v23 & 0x30000000000) != 0)
      {
        CGFloat v24 = [(id)a1 _content];
        double v25 = [v24 intelligenceLightAttributedStrings];

        if ((*(unsigned char *)(a1 + 741) & 1) != 0
          && ([v25 lightReactiveAttributedString],
              CGFloat v26 = objc_claimAutoreleasedReturnValue(),
              v26,
              v26))
        {
          double v21 = [v25 lightReactiveAttributedString];
        }
        else
        {
          double v21 = 0;
        }
        if ((*(unsigned char *)(a1 + 741) & 2) != 0)
        {
          double v34 = [v25 lightInertAttributedString];

          if (v34)
          {
            uint64_t v35 = [v25 lightInertAttributedString];

            double v21 = (void *)v35;
          }
        }
        if (v21)
        {
          [v19 setCachesLayout:0];

LABEL_36:
          int v20 = 1;
          goto LABEL_37;
        }
      }
      double v21 = [(id)a1 _synthesizedAttributedText];
      goto LABEL_36;
    }
  }
  double v21 = [v17 string];
  if (*(void *)(a1 + 608))
  {
LABEL_39:
    uint64_t v37 = [(id)a1 _synthesizedAttributedText];

    uint64_t v36 = *(void *)(a1 + 608);
    double v21 = (void *)v37;
LABEL_40:
    uint64_t v38 = *(void *)(a1 + 736);
    if ((v38 & 4) != 0)
    {
      double v39 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
      if (v36)
      {
        double v40 = *(double *)(v36 + 24);
        double rect2 = v40;
        goto LABEL_54;
      }
    }
    else
    {
      double v39 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
      if (v36)
      {
        double rect2 = *(double *)(v36 + 24);
        double v40 = *(double *)(v36 + 16);
LABEL_54:
        if (1.0 - *(double *)(v36 + 8) <= 0.00000011920929)
        {
          id v249 = 0;
          goto LABEL_59;
        }
        uint64_t v36 = *(void *)(v36 + 48);
LABEL_56:
        id v249 = (id)v36;
        uint64_t v36 = *(void *)(a1 + 608);
        if (!v36)
        {
          double v257 = 0.0;
LABEL_62:
          uint64_t v51 = a1 + v39[981];
          *(void *)(v51 + 48) = v36;
          uint64_t v52 = *(void *)(a1 + 440);
          if (v52 >= 1)
          {
            if (v36 >= v52) {
              uint64_t v36 = *(void *)(a1 + 440);
            }
            *(void *)(v51 + 48) = v36;
          }
          goto LABEL_66;
        }
        uint64_t v38 = *(void *)(a1 + 736);
LABEL_59:
        BOOL v49 = (v38 & 4) == 0;
        uint64_t v50 = 72;
        if (v49) {
          uint64_t v50 = 88;
        }
        double v257 = *(double *)(v36 + v50);
        uint64_t v36 = *(void *)(v36 + 40);
        goto LABEL_62;
      }
    }
    double v40 = 0.0;
    double rect2 = 0.0;
    goto LABEL_56;
  }
  int v20 = 0;
LABEL_43:
  double v41 = v14;
  uint64_t v42 = *(void *)(a1 + 736);
  if (*(void *)(a1 + 440) == 1)
  {
    if ((v42 & 0x8000000000) != 0) {
      double v43 = 3.40282347e38;
    }
    else {
      double v43 = a8;
    }
    if ((v42 & 0x8000000000) != 0) {
      double v44 = a8;
    }
    else {
      double v44 = 3.40282347e38;
    }
    [v19 setWantsBaselineOffset:1];
    uint64_t v45 = [(id)a1 _stringDrawingOptions];
    if (!v20)
    {
      v119 = [(id)a1 _defaultAttributes];
      [(UILabel *)(unsigned char *)a1 _boundingRectWithString:v45 size:v119 options:v19 attributes:v43 context:v44];
      double v257 = v120;

      [v19 baselineOffset];
      id v249 = 0;
      int v238 = 0;
      *(void *)(a1 + 496) = 1;
      double rect2 = 0.0;
      double v40 = v121;
      double v14 = v41;
      goto LABEL_78;
    }
    double v46 = [(UILabel *)(unsigned char *)a1 _boundingRectWithAttributedString:v45 size:v19 options:v43 context:v44];
    double v257 = v47;
    objc_msgSend(v19, "baselineOffset", v46);
    double v40 = v48;
    id v249 = 0;
    *(void *)(a1 + 496) = 1;
    double rect2 = 0.0;
    double v14 = v41;
  }
  else
  {
    if ((v42 & 0x8000000000) != 0) {
      double v74 = a8;
    }
    else {
      double v74 = a9;
    }
    if ((v42 & 0x8000000000) != 0) {
      double v75 = a9;
    }
    else {
      double v75 = a8;
    }
    [v19 setWantsBaselineOffset:1];
    uint64_t v76 = [(id)a1 _stringDrawingOptions];
    if (v20) {
      double v77 = [(UILabel *)(unsigned char *)a1 _boundingRectWithAttributedString:v76 size:v19 options:v75 context:v74];
    }
    else {
      double v77 = [(UILabel *)(unsigned char *)a1 _boundingRectWithString:v76 size:v243 options:v19 attributes:v75 context:v74];
    }
    double v257 = v78;
    objc_msgSend(v19, "baselineOffset", v77);
    double v40 = v122;
    [v19 firstBaselineOffset];
    id v249 = 0;
    double rect2 = 0.0;
    double v14 = v41;
    if (!v20)
    {
      int v238 = 0;
      goto LABEL_78;
    }
  }
LABEL_66:
  buf[0].origin = (CGPoint)xmmword_186B93450;
  int v53 = dyld_program_sdk_at_least();
  uint64_t v54 = *(void *)off_1E52D1F60;
  if (v53) {
    objc_msgSend(v21, "attribute:atIndex:longestEffectiveRange:inRange:", v54, 0, buf, 0, objc_msgSend(v21, "length"));
  }
  else {
  double v55 = [v21 attribute:*(void *)off_1E52D1F60 atIndex:0 effectiveRange:buf];
  }
  CGFloat y = buf[0].origin.y;
  if (*(void *)&y == [v21 length] || !v55)
  {
    if (v55)
    {
      [v55 floatValue];
      dyld_program_sdk_at_least();
    }
  }
  else
  {
    if (v249) {
      CGSize v57 = v249;
    }
    else {
      CGSize v57 = v21;
    }
    double v58 = (void *)[v57 mutableCopy];
    objc_msgSend(v58, "removeAttribute:range:", v54, 0, objc_msgSend(v58, "length"));
    [v19 setWantsBaselineOffset:1];
    uint64_t v59 = [v19 cachesLayout];
    [v19 setCachesLayout:0];
    double v60 = -[UILabel _boundingRectWithAttributedString:size:options:context:]((unsigned char *)a1, v58, [(id)a1 _stringDrawingOptions], v19, a8, 3.40282347e38);
    double v257 = v61;
    objc_msgSend(v19, "baselineOffset", v60);
    double v40 = v62;
    [v19 firstBaselineOffset];
    [v19 setCachesLayout:v59];
  }
  int v238 = 1;
LABEL_78:
  char v242 = a2;
  UIRoundToViewScale((void *)a1);
  UIRoundToViewScale((void *)a1);
  *(void *)(a1 + 456) = v63;
  UIRoundToViewScale((void *)a1);
  *(void *)(a1 + 448) = v64;
  if (*(void *)(a1 + 496) == -1) {
    *(void *)(a1 + 496) = [v19 numberOfLineFragments];
  }
  double v256 = *(double *)(a1 + 456) - v40;
  v248 = v21;
  double v250 = a8;
  if ([(id)a1 lineSpacing])
  {
    v65 = [(id)a1 _defaultAttributes];
    CGFloat v66 = [v65 objectForKey:*(void *)off_1E52D2040];

    if (v238)
    {
      double v67 = v249;
      if (!v249)
      {
        double v67 = [(id)a1 _synthesizedAttributedText];
      }
      v244 = v19;
      id v68 = v67;
      id v69 = v66;
      uint64_t v70 = [v68 length];
      v235 = v17;
      if (v69)
      {
        v71 = [(NSAttributedString *)v68 _ui_fontsInRange:v70 usingDefaultFont:v69];
      }
      else
      {
        uint64_t v79 = +[UILabel defaultFont];
        v71 = [(NSAttributedString *)v68 _ui_fontsInRange:v70 usingDefaultFont:v79];
      }
      long long v260 = 0u;
      long long v261 = 0u;
      long long v258 = 0u;
      long long v259 = 0u;
      id v80 = v71;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v258 objects:buf count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v259;
        double v84 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v82; ++i)
          {
            if (*(void *)v259 != v83) {
              objc_enumerationMutation(v80);
            }
            [*(id *)(*((void *)&v258 + 1) + 8 * i) lineHeight];
            if (v86 > v84) {
              double v84 = v86;
            }
          }
          uint64_t v82 = [v80 countByEnumeratingWithState:&v258 objects:buf count:16];
        }
        while (v82);
      }

      UICeilToViewScale((void *)a1);
      double v73 = v87;
      if (!v249) {

      }
      double v17 = v235;
      long long v19 = v244;
      double v21 = v248;
      CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
    }
    else
    {
      [v66 lineHeight];
      UICeilToViewScale((void *)a1);
      double v73 = v72;
    }
    double v256 = v256 - (v73 - (double)[(id)a1 lineSpacing]);
  }
  char v88 = v242;
  v89 = v249;
  if (v249)
  {
    uint64_t v90 = *(void *)(a1 + 736);
    if (*(void *)(a1 + 440) != 1 || (unsigned int v91 = (v90 >> 4) & 3, v91 == 1))
    {
      if ((v90 & 4) != 0)
      {
        v265.origin.double x = v15;
        v265.origin.CGFloat y = v14;
        v265.size.CGFloat width = a8;
        v265.size.CGFloat height = a9;
        CGRectGetMinY(v265);
        v266.origin.double x = v15;
        v266.origin.CGFloat y = v14;
        v266.size.CGFloat width = a8;
        v266.size.CGFloat height = a9;
        CGRectGetHeight(v266);
        UICeilToViewScale((void *)a1);
        double v256 = v95;
        UICeilToViewScale((void *)a1);
      }
      else
      {
        uint64_t v93 = *(void *)(a1 + 608);
        if (v93)
        {
          double v94 = *(double *)(v93 + 72);
          double v257 = v257 - v94;
        }
        else
        {
          double v94 = 0.0;
        }
        double v256 = v256 + v257 * 0.5;
      }
      double v257 = v94;
    }
    else
    {
      double v92 = v256;
      if (!v91) {
        double v92 = v40 - rect2 + v256;
      }
      double v256 = v92;
    }
  }
  [(id)a1 _currentScreenScale];
  *(double *)(a1 + 504) = UIRectRoundToScale(v15, v256, a8, v257, v96);
  *(void *)(a1 + 512) = v97;
  *(void *)(a1 + 520) = v98;
  *(void *)(a1 + 528) = v99;
  char v100 = a3 | v239;
  if (((a3 | v239) & 1) == 0
    && ![(id)a1 _drawsDebugGlyphPathBoundsClipping])
  {
    char v109 = 0;
    goto LABEL_167;
  }
  double v237 = v15;
  uint64_t v101 = [(id)a1 _stringDrawingOptions];
  uint64_t v102 = MEMORY[0x1E4F1DB28];
  double v104 = *MEMORY[0x1E4F1DB28];
  double v103 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v245 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double rect2a = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  if (v239)
  {
    if (a3) {
      goto LABEL_133;
    }
LABEL_128:
    [v19 setWantsMultilineDeviceMetrics:1];
    uint64_t v105 = v101 | 8;
    if (v249)
    {
      double v106 = v257;
      if (v257 <= 0.0)
      {
LABEL_152:
        objc_msgSend(v19, "multilineDeviceMetricsRect", v106);
        double v18 = v123;
        double v116 = v124;
        double v117 = v125;
        double v118 = v126;
        char v109 = 1;
        goto LABEL_153;
      }
      v107 = (unsigned char *)a1;
      v108 = v249;
    }
    else
    {
      if (*(void *)(a1 + 440) == 1) {
        [v19 setMinimumScaleFactor:0.0];
      }
      if (!v238)
      {
        -[UILabel _drawWithString:rect:options:attributes:context:]((unsigned char *)a1, v21, v105, v243, v19, v237, v256, a8, v257);
        goto LABEL_152;
      }
      v107 = (unsigned char *)a1;
      v108 = v21;
    }
    -[UILabel _drawWithAttributedString:rect:options:context:](v107, v108, v105, v19, v237, v256, a8, v257);
    goto LABEL_152;
  }
  if ([(id)a1 _drawsDebugGlyphPathBoundsClipping] && (a3 & 1) == 0) {
    goto LABEL_128;
  }
  if (!a3)
  {
    char v109 = 0;
    double v118 = v245;
    double v117 = rect2a;
    double v116 = v103;
    double v18 = v104;
    goto LABEL_153;
  }
LABEL_133:
  unint64_t v110 = v101 & 0xFFFFFFFFFFFFFFF6 | 8;
  if (v249)
  {
    v111 = v249;
  }
  else
  {
    if (*(void *)(a1 + 440) == 1) {
      [v19 setMinimumScaleFactor:0.0];
    }
    if (!v238)
    {
      objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", v110, v243, v19, a8, v257);
      goto LABEL_145;
    }
    v111 = v21;
  }
  objc_msgSend(v111, "boundingRectWithSize:options:context:", v110, v19, a8, v257);
LABEL_145:
  double v18 = v112;
  double v116 = v113;
  double v117 = v114;
  double v118 = v115;
  char v109 = 0;
LABEL_153:
  v267.origin.double x = v18;
  v267.origin.CGFloat y = v116;
  v267.size.CGFloat width = v117;
  v267.size.CGFloat height = v118;
  v291.origin.double x = v104;
  v291.origin.CGFloat y = v103;
  v291.size.CGFloat height = v245;
  v291.size.CGFloat width = rect2a;
  if (!CGRectEqualToRect(v267, v291)) {
    double v116 = *(double *)(a1 + 448) - v116 - v118;
  }
  v268.origin.double x = v18;
  v268.origin.CGFloat y = v116;
  v268.size.CGFloat width = v117;
  v268.size.CGFloat height = v118;
  v292.origin.double x = v104;
  v292.origin.CGFloat y = v103;
  v292.size.CGFloat height = v245;
  v292.size.CGFloat width = rect2a;
  if (CGRectEqualToRect(v268, v292) || ![(id)a1 _drawsDebugGlyphPathBoundsClipping]) {
    goto LABEL_166;
  }
  [(id)a1 bounds];
  if (CGRectGetHeight(v269) == 0.0
    || ([(id)a1 bounds], CGRectGetWidth(v270) == 0.0)
    || !-[UIView _isInVisibleHierarchy](a1)
    || ([(id)a1 isHiddenOrHasHiddenAncestor] & 1) != 0)
  {
    v127 = 0;
    goto LABEL_162;
  }
  v236 = v17;
  id v216 = *(id *)(a1 + 72);
  objc_msgSend((id)a1, "convertRect:toView:", v18, v116, v117, v118);
  double r2_24 = v140;
  double v230 = v139;
  double v240 = v141;
  double rect = v142;
  char v262 = 1;
  *(void *)&long long v258 = 0;
  v143 = (id)a1;
  char r2 = 0;
  v144 = 0;
  double x = v104;
  double v146 = v103;
  CGFloat r2_16 = rect2a;
  CGFloat rect1a = v245;
  v147 = v143;
  r2_8 = v143;
  do
  {
    v148 = [v147 _viewControllerForAncestor];
    if ([v148 _viewControllerIgnoresClippedGlyphPathFrame])
    {

      v144 = 0;
      goto LABEL_205;
    }
    if (v262)
    {
      CGSize v149 = *(CGSize *)(v102 + 16);
      buf[0].origin = *(CGPoint *)v102;
      buf[0].size = v149;
      if ((v143[739] & 0x10) != 0 && ([v147 clipsToBounds] & 1) == 0)
      {
        v150 = [v143 layer];
        if (objc_msgSend(v150, "_glyphPathBoundsExcedesLayers:drawableGlyphPathBounds:edgesClipped:", buf, &v258, v18, v116, v117, v118))
        {
          v151 = v143;

          v271.origin.double x = x;
          v271.origin.CGFloat y = v146;
          v271.size.CGFloat width = r2_16;
          v271.size.CGFloat height = rect1a;
          v293.origin.double x = v104;
          v293.origin.CGFloat y = v103;
          v293.size.CGFloat height = v245;
          v293.size.CGFloat width = rect2a;
          if (CGRectEqualToRect(v271, v293))
          {
            double v146 = buf[0].origin.y;
            CGFloat r2_16 = buf[0].size.width;
            char r2 = 1;
            CGFloat rect1a = buf[0].size.height;
            double x = buf[0].origin.x;
          }
          else
          {
            v294.origin.double x = x;
            v294.origin.CGFloat y = v146;
            v294.size.CGFloat width = r2_16;
            v294.size.CGFloat height = rect1a;
            CGRect v272 = CGRectIntersection(buf[0], v294);
            double x = v272.origin.x;
            double v146 = v272.origin.y;
            CGFloat r2_16 = v272.size.width;
            CGFloat rect1a = v272.size.height;
            char r2 = 1;
          }
        }
        else
        {
          v151 = v144;
        }

        v144 = v151;
        v143 = r2_8;
      }
      if (v262
        && [v147 clipsToBounds]
        && objc_msgSend(v147, "_clipsGlyphPathFrame:shouldContinueSuperviewTraversal:", &v262, v230, r2_24, v240, rect))
      {
        id v153 = v147;

        [v153 bounds];
        objc_msgSend(v143, "convertRect:fromView:", v153);
        CGFloat r2a = v155;
        CGFloat v210 = v157;
        CGFloat v213 = v156;
        CGFloat v206 = v158;
        v295.origin.double x = v104;
        v295.origin.CGFloat y = v103;
        v295.size.CGFloat height = v245;
        v295.size.CGFloat width = rect2a;
        BOOL v159 = CGRectEqualToRect(buf[0], v295);
        CGFloat v160 = v18;
        CGFloat v161 = v116;
        CGFloat width = v117;
        CGFloat height = v118;
        if (!v159)
        {
          CGFloat v160 = buf[0].origin.x;
          CGFloat v161 = buf[0].origin.y;
          CGFloat height = buf[0].size.height;
          CGFloat width = buf[0].size.width;
        }
        v273.origin.double x = r2a;
        v273.size.CGFloat width = v210;
        v273.origin.CGFloat y = v213;
        v273.size.CGFloat height = v206;
        CGRect v274 = CGRectIntersection(v273, *(CGRect *)&v160);
        CGFloat v205 = v274.origin.x;
        CGFloat v207 = v274.origin.y;
        double v209 = v274.size.width;
        double v212 = v274.size.height;
        v274.origin.double x = x;
        v274.origin.CGFloat y = v146;
        v274.size.CGFloat width = r2_16;
        v274.size.CGFloat height = rect1a;
        v296.origin.double x = v104;
        v296.origin.CGFloat y = v103;
        v296.size.CGFloat height = v245;
        v296.size.CGFloat width = rect2a;
        CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
        if (!CGRectEqualToRect(v274, v296))
        {
          v275.origin.double x = v205;
          v275.origin.CGFloat y = v207;
          v275.size.CGFloat width = v209;
          v275.size.CGFloat height = v212;
          v297.origin.double x = x;
          v297.origin.CGFloat y = v146;
          v297.size.CGFloat width = r2_16;
          v297.size.CGFloat height = rect1a;
          CGRect v276 = CGRectIntersection(v275, v297);
          CGFloat v205 = v276.origin.x;
          CGFloat v207 = v276.origin.y;
          double v209 = v276.size.width;
          double v212 = v276.size.height;
        }
        [v153 bounds];
        double v165 = v164;
        double v167 = v166;
        double rect1d = v168;
        double r2_16b = v169;
        v170 = [v153 window];
        objc_msgSend(v153, "convertRect:toView:", v170, v165, v167, rect1d, r2_16b);
        CGFloat v172 = v171;
        CGFloat v204 = v173;
        CGFloat rect1b = v174;
        CGFloat v176 = v175;

        v277.origin.CGFloat y = r2_24;
        v277.origin.double x = v230;
        v277.size.CGFloat width = v240;
        v277.size.CGFloat height = rect;
        double MinX = CGRectGetMinX(v277);
        v278.origin.double x = v172;
        v278.origin.CGFloat y = v204;
        v278.size.CGFloat width = rect1b;
        CGFloat r2b = v176;
        v278.size.CGFloat height = v176;
        if (MinX < CGRectGetMinX(v278)) {
          *(void *)&long long v258 = v258 | 2;
        }
        v279.origin.CGFloat y = r2_24;
        v279.origin.double x = v230;
        v279.size.CGFloat width = v240;
        v279.size.CGFloat height = rect;
        double MaxX = CGRectGetMaxX(v279);
        v280.origin.double x = v172;
        v280.origin.CGFloat y = v204;
        v280.size.CGFloat width = rect1b;
        v280.size.CGFloat height = r2b;
        v154 = v216;
        if (MaxX > CGRectGetMaxX(v280)) {
          *(void *)&long long v258 = v258 | 8;
        }
        v281.origin.CGFloat y = r2_24;
        v281.origin.double x = v230;
        v281.size.CGFloat width = v240;
        v281.size.CGFloat height = rect;
        double MaxY = CGRectGetMaxY(v281);
        v282.origin.double x = v172;
        v282.origin.CGFloat y = v204;
        v282.size.CGFloat width = rect1b;
        v282.size.CGFloat height = r2b;
        if (MaxY > CGRectGetMaxY(v282)) {
          *(void *)&long long v258 = v258 | 4;
        }
        v283.origin.CGFloat y = r2_24;
        v283.origin.double x = v230;
        v283.size.CGFloat width = v240;
        v283.size.CGFloat height = rect;
        double MinY = CGRectGetMinY(v283);
        v284.origin.double x = v172;
        v284.origin.CGFloat y = v204;
        v284.size.CGFloat width = rect1b;
        v284.size.CGFloat height = r2b;
        if (MinY < CGRectGetMinY(v284)) {
          *(void *)&long long v258 = v258 | 1;
        }

        v144 = v153;
        double x = v205;
        double v146 = v207;
        goto LABEL_219;
      }
    }

    uint64_t v152 = [v147 superview];

    v147 = (void *)v152;
  }
  while (v152);
  if ((r2 & 1) == 0)
  {
LABEL_205:
    v127 = 0;
    CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
    v154 = v216;
    goto LABEL_220;
  }
  id v153 = v144;
  double v209 = r2_16;
  double v212 = rect1a;
  CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
  v154 = v216;
LABEL_219:
  v180 = [_UITextClippingDebugInfo alloc];
  v127 = -[_UITextClippingDebugInfo initWithClippingView:visibleBounds:ignoresResult:edgesClipped:](v180, "initWithClippingView:visibleBounds:ignoresResult:edgesClipped:", v153, 0, (void)v258, x, v146, v209, v212);
LABEL_220:

  if (!v127)
  {
    double v17 = v236;
    goto LABEL_162;
  }
  if (![(_UITextClippingDebugInfo *)v127 hasClippedEdges])
  {
    double v17 = v236;
    if ([(_UITextClippingDebugInfo *)v127 ignoresResult]
      && [(_UITextClippingDebugInfo *)v127 hasClippedEdges])
    {
      goto LABEL_165;
    }
LABEL_162:
    v128 = objc_msgSend((id)a1, "_glyphPathBoundsIntersectionData", *(void *)&MinX);
    v129 = v128;
    if (v128)
    {
      [v128 setClippingView:0];
      -[NSObject setGlyphPathBounds:](v129, "setGlyphPathBounds:", v104, v103, rect2a, v245);
      -[NSObject setAvailableBounds:](v129, "setAvailableBounds:", v104, v103, rect2a, v245);
    }
    goto LABEL_164;
  }
  v181 = getenv("__ViewHierarchyCaptureInProgress");
  double v17 = v236;
  if (!v181 || *v181 != 49)
  {
    v182 = +[UIColor systemGreenColor];
    [v182 setStroke];

    v183 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v18, v116, v117, v118);
    [v183 strokeWithBlendMode:0 alpha:1.0];
    v184 = +[UIColor systemRedColor];
    [v184 setFill];

    CGFloat r2_16a = v104;
    CGFloat r2_24a = v103;
    CGFloat v231 = v245;
    CGFloat recta = rect2a;
    if ([(_UITextClippingDebugInfo *)v127 topEdgeClipped])
    {
      [(_UITextClippingDebugInfo *)v127 visibleBounds];
      CGFloat r2_24a = v185;
      CGFloat v231 = 2.5;
      CGFloat r2_16a = v186;
      CGFloat recta = v187;
      v188 = +[UIBezierPath bezierPathWithRect:v186];
      [v188 fillWithBlendMode:0 alpha:0.6];
    }
    double rect1c = v104;
    double v241 = v103;
    double v189 = rect2a;
    CGFloat r2c = v245;
    if ([(_UITextClippingDebugInfo *)v127 bottomEdgeClipped])
    {
      [(_UITextClippingDebugInfo *)v127 visibleBounds];
      CGFloat v190 = v285.origin.x;
      CGFloat v217 = v285.size.width;
      CGFloat r2d = v285.origin.x;
      CGFloat v211 = v285.size.height;
      CGFloat v214 = v285.origin.y;
      CGFloat v191 = v285.size.width;
      double rect1c = CGRectGetMinX(v285);
      v286.origin.double x = v190;
      v286.origin.CGFloat y = v214;
      v286.size.CGFloat width = v191;
      v286.size.CGFloat height = v211;
      double v241 = CGRectGetMaxY(v286) + -2.5;
      v287.size.CGFloat width = v217;
      v287.origin.double x = r2d;
      v287.origin.CGFloat y = v214;
      v287.size.CGFloat height = v211;
      double v189 = CGRectGetWidth(v287);
      CGFloat r2c = 2.5;
      v192 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", rect1c, v241, v189, 2.5);
      [v192 fillWithBlendMode:0 alpha:0.6];
    }
    if ([(_UITextClippingDebugInfo *)v127 leftEdgeClipped]
      || [(_UITextClippingDebugInfo *)v127 rightEdgeClipped])
    {
      [(_UITextClippingDebugInfo *)v127 visibleBounds];
      double v218 = v193;
      [(_UITextClippingDebugInfo *)v127 visibleBounds];
      double v215 = v194;
      v288.origin.double x = r2_16a;
      v288.origin.CGFloat y = r2_24a;
      v288.size.CGFloat height = v231;
      v288.size.CGFloat width = recta;
      v298.origin.double x = v104;
      CGFloat v208 = v103;
      v298.origin.CGFloat y = v103;
      v298.size.CGFloat width = rect2a;
      v298.size.CGFloat height = v245;
      BOOL v195 = CGRectEqualToRect(v288, v298);
      double v196 = v218 + 2.5;
      if (v195) {
        double v196 = v218;
      }
      double rectb = v196;
      if (v195) {
        double v197 = v215;
      }
      else {
        double v197 = v215 + -2.5;
      }
      v289.origin.double x = rect1c;
      v289.origin.CGFloat y = v241;
      v289.size.CGFloat width = v189;
      v289.size.CGFloat height = r2c;
      v299.origin.double x = v104;
      v299.origin.CGFloat y = v208;
      v299.size.CGFloat width = rect2a;
      v299.size.CGFloat height = v245;
      if (!CGRectEqualToRect(v289, v299)) {
        double v197 = v197 + -2.5;
      }
      if ([(_UITextClippingDebugInfo *)v127 leftEdgeClipped])
      {
        [(_UITextClippingDebugInfo *)v127 visibleBounds];
        v198 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
        [v198 fillWithBlendMode:0 alpha:0.6];
      }
      if ([(_UITextClippingDebugInfo *)v127 rightEdgeClipped])
      {
        [(_UITextClippingDebugInfo *)v127 visibleBounds];
        v199 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", CGRectGetMaxX(v290) + -2.5, rectb, 2.5, v197);
        [v199 fillWithBlendMode:0 alpha:0.6];
      }
    }

    CGFloat v22 = &OBJC_IVAR____UIFocusGroupMap__identifierToPrimaryItemMap;
    v143 = r2_8;
  }
  if ((objc_msgSend(v143, "_glyphPathBoundsClippingDetected", *(void *)&MinX) & 1) == 0)
  {
    v200 = [(_UITextClippingDebugInfo *)v127 clippingView];
    -[UILabel _markGlyphPathBoundsClippingDetected:glyphPathBounds:availableBounds:](v143, v200, v18, v116, v117, v118, v237, v256, v250, v257);

    v129 = _UIClippingFaultLog();
    if (os_log_type_enabled(v129, OS_LOG_TYPE_FAULT))
    {
      v201 = [v143 text];
      v202 = [(_UITextClippingDebugInfo *)v127 clippingView];
      LODWORD(buf[0].origin.x) = 138543874;
      *(void *)((char *)&buf[0].origin.x + 4) = r2_8;
      WORD2(buf[0].origin.y) = 2114;
      *(void *)((char *)&buf[0].origin.y + 6) = v201;
      HIWORD(buf[0].size.width) = 2114;
      *(void *)&buf[0].size.CGFloat height = v202;
      _os_log_fault_impl(&dword_1853B0000, v129, OS_LOG_TYPE_FAULT, "[Internal] Text Clipping Detected: %{public}@ '%{public}@'. Clipping View: %{public}@", (uint8_t *)buf, 0x20u);
    }
LABEL_164:
  }
LABEL_165:

  char v88 = v242;
  v89 = v249;
LABEL_166:
  double v15 = v237;
  if ((v100 & 1) == 0)
  {
LABEL_167:
    if ((v109 & 1) == 0 && (v88 & 1) == 0)
    {
      if ((*(unsigned char *)(a1 + v22[977] + 5) & 8) != 0)
      {
        v130 = [(id)a1 _delegate];
        [v130 _glyphPathsBoundingRectWillChange:a1];
      }
      uint64_t v131 = objc_msgSend((id)a1, "_stringDrawingOptions", *(void *)&MinX);
      if (v89)
      {
        double v132 = v257;
        if (v257 > 0.0)
        {
          v133 = (unsigned char *)a1;
          v134 = v89;
          goto LABEL_178;
        }
      }
      else
      {
        if (*(void *)(a1 + 440) == 1) {
          [v19 setMinimumScaleFactor:0.0];
        }
        if (v238)
        {
          v133 = (unsigned char *)a1;
          v134 = v248;
LABEL_178:
          -[UILabel _drawWithAttributedString:rect:options:context:](v133, v134, v131, v19, v15, v256, v250, v257);
        }
        else
        {
          -[UILabel _drawWithString:rect:options:attributes:context:]((unsigned char *)a1, v248, v131, v243, v19, v15, v256, v250, v257);
        }
      }
      uint64_t v135 = objc_msgSend(v19, "layout", v132);
      v136 = *(void **)(a1 + 600);
      *(void *)(a1 + 600) = v135;

      if ((*(unsigned char *)(a1 + v22[977] + 5) & 4) != 0)
      {
        v137 = [(id)a1 _delegate];
        [v137 _glyphPathsBoundingRectDidChange:a1];
      }
    }
    double v18 = v15;
  }

LABEL_184:
  return v18;
}

- (int64_t)_stringDrawingOptions
{
  if ([(UILabel *)self _textAlignmentFollowsWritingDirection]) {
    int64_t v3 = 1049089;
  }
  else {
    int64_t v3 = 1048577;
  }
  if ([(UILabel *)self _textAlignmentMirrored]) {
    return v3 | 0x400;
  }
  else {
    return v3;
  }
}

- (BOOL)_textAlignmentMirrored
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 5) & 1;
}

- (BOOL)_textAlignmentFollowsWritingDirection
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 4) & 1;
}

- (void)_synthesizedTextAttributes
{
  if (a1)
  {
    objc_super v2 = a1;
    int64_t v3 = (void *)a1[71];
    if (!v3)
    {
      if (![a1 isEnabled]
        || ([v2 isHighlighted] & 1) != 0
        || ([v2 _textColorFollowsTintColor] & 1) != 0
        || (*((unsigned char *)v2 + 739) & 0x80) != 0)
      {
        BOOL v5 = 0;
      }
      else
      {
        double v4 = [v2 _textEncapsulation];
        BOOL v5 = v4 == 0;
      }
      double v6 = [v2 _content];
      BOOL ShouldReverseNaturalAlignment = _UILabelShouldReverseNaturalAlignment(v6, [v2 semanticContentAttribute]);

      if (!v5 || ShouldReverseNaturalAlignment)
      {
        CGFloat v10 = (void *)MEMORY[0x1E4F1CA60];
        int v11 = [v2 _defaultAttributes];
        objc_super v9 = [v10 dictionaryWithDictionary:v11];

        if (!v5)
        {
          if (([v2 isEnabled] & 1) == 0)
          {
            id v12 = objc_alloc_init((Class)off_1E52D2E28);
            [v12 setShadowColor:0];
            [v9 setObject:v12 forKey:*(void *)off_1E52D2238];
          }
          double v13 = [v2 textColor];
          double v14 = [v2 currentTextColor];
          char v15 = [v13 isEqual:v14];

          if ((v15 & 1) == 0)
          {
            double v16 = [v2 currentTextColor];
            [v9 setObject:v16 forKey:*(void *)off_1E52D2048];
          }
          double v17 = [v2 _textEncapsulation];

          if (v17)
          {
            double v18 = [v2 _textEncapsulation];
            long long v19 = (void *)[v18 copy];
            [v9 setObject:v19 forKey:*MEMORY[0x1E4F24368]];
          }
        }
        if (ShouldReverseNaturalAlignment)
        {
          _UILabelReverseNaturalAlignment(v9);
          objc_claimAutoreleasedReturnValue();
        }
        uint64_t v20 = [v9 copy];
        double v21 = (void *)v2[71];
        v2[71] = v20;
      }
      else
      {
        uint64_t v8 = [v2 _defaultAttributes];
        objc_super v9 = (void *)v2[71];
        v2[71] = v8;
      }

      int64_t v3 = (void *)v2[71];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)_updateScaledMetricsForRect:(double)a3
{
  if (result)
  {
    uint64_t v9 = result;
    CGFloat v10 = *(double **)(result + 608);
    if (v10) {
      double v11 = v10[1];
    }
    else {
      double v11 = 0.0;
    }
    if (*(double *)(result + 616) != a4 || *(double *)(result + 624) != a5)
    {
      if (a4 < 3.40282347e38 || a5 < 3.40282347e38)
      {
        CGFloat v10 = [(id)result _synthesizedAttributedText];
        uint64_t v13 = -[UILabel _scaledMetricsForText:inRect:]((_UILabelLegacyScaledMetrics *)v9, v10, a2, a3, a4, a5);
        double v14 = *(void **)(v9 + 608);
        *(void *)(v9 + 608) = v13;
      }
      else
      {
        *(void *)(result + 608) = 0;
      }

      *(double *)(v9 + 616) = a4;
      *(double *)(v9 + 624) = a5;
      CGFloat v10 = *(double **)(v9 + 608);
    }
    if (v10) {
      double v15 = v10[1];
    }
    else {
      double v15 = 0.0;
    }
    if (v11 == v15)
    {
      return 0;
    }
    else
    {
      double v16 = *(void **)(v9 + 600);
      *(void *)(v9 + 600) = 0;

      return 1;
    }
  }
  return result;
}

- (NSAttributedString)_synthesizedAttributedText
{
  if (!self->_synthesizedAttributedText)
  {
    int64_t v3 = [(UILabel *)self _content];
    -[UILabel _synthesizedAttributedTextForContent:]((uint64_t)self, v3);
    double v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    synthesizedAttributedText = self->_synthesizedAttributedText;
    self->_synthesizedAttributedText = v4;

    NSUInteger v6 = [(NSAttributedString *)self->_synthesizedAttributedText length];
    if (v6)
    {
      double v7 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_synthesizedAttributedText, "attribute:atIndex:longestEffectiveRange:inRange:", *(void *)off_1E52D1F60, 0, 0, 0, v6);
      self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(v7 != 0) << 16));
    }
    else
    {
      *(void *)&self->_textLabelFlags &= ~0x10000uLL;
    }
  }
  uint64_t v8 = self->_synthesizedAttributedText;
  return v8;
}

- (BOOL)_textColorFollowsTintColor
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 3) >> 6) & 1;
}

- (int64_t)lineSpacing
{
  return self->_lineSpacing;
}

- (id)_defaultAttributes
{
  objc_super v2 = [(UILabel *)self _content];
  int64_t v3 = [v2 defaultAttributes];

  return v3;
}

- (_UILabelLegacyScaledMetrics)_scaledMetricsForText:(double)a3 inRect:(double)a4
{
  id v9 = a2;
  if (a1)
  {
    CGFloat v10 = [(_UILabelLegacyScaledMetrics *)a1 _associatedScalingLabel];
    double v11 = v10;
    if (!v10 || v10 == a1)
    {
      if ((LOBYTE(a1[7]._scaledSize.width) & 2) == 0
        || ([*(id *)&a1[8]._baselineOffset minimumScaleFactor], v34 >= 1.0))
      {
        a1 = 0;
        goto LABEL_37;
      }
      uint64_t v35 = [(_UILabelLegacyScaledMetrics *)a1 _stringDrawingContext];
      double v15 = (void *)[v35 copy];

      [*(id *)&a1[8]._baselineOffset minimumScaleFactor];
      if (v36 >= 1.0)
      {
        a1 = 0;
        goto LABEL_24;
      }
      if (v36 <= 0.0) {
        double v36 = 0.01;
      }
      [v15 setMinimumScaleFactor:v36];
      [v15 setLayout:0];
      [v15 setWantsBaselineOffset:1];
      [v15 setWantsScaledBaselineOffset:1];
      [v15 setWantsScaledLineHeight:1];
      [v15 setWantsNumberOfLineFragments:1];
      [v15 setMaximumNumberOfLines:*(void *)&a1[4]._scaledFirstBaselineOffset];
      objc_msgSend(v9, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v15, a5, a6);
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      [v15 scaledLineHeight];
      CGFloat v42 = v41;
      [v15 actualScaleFactor];
      a1 = 0;
      if (v43 <= 0.0) {
        goto LABEL_24;
      }
      double v44 = v43;
      if (v43 >= 1.0 || 1.0 - v43 <= 0.00000011920929) {
        goto LABEL_24;
      }
      uint64_t v45 = objc_alloc_init(_UILabelLegacyScaledMetrics);
      a1 = v45;
      if (v45)
      {
        v45->_scaledSize.CGFloat width = v38;
        v45->_scaledSize.CGFloat height = v42;
        v45->_unscaledAndPossiblyTooLargeSize.CGFloat width = v38;
        v45->_unscaledAndPossiblyTooLargeSize.CGFloat height = v40;
        [v15 baselineOffset];
        a1->_baselineOffset = v46;
        [v15 firstBaselineOffset];
        a1->_scaledFirstBaselineOffset = v47;
        [v15 scaledBaselineOffset];
        a1->_scaledBaselineOffset = v48;
        a1->_actualScaleFactor = v44;
        a1->_measuredNumberOfLines = [v15 numberOfLineFragments];
      }
      else
      {
        [v15 baselineOffset];
        [v15 firstBaselineOffset];
        [v15 scaledBaselineOffset];
        [v15 numberOfLineFragments];
      }
      uint64_t v49 = [v9 length];
      [v15 actualScaleFactor];
      double v17 = objc_msgSend(v9, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v49);
      uint64_t v32 = (uint64_t)a1;
      float v33 = v17;
LABEL_23:
      -[_UICollectionLayoutItemSolver setSolveResult:](v32, v33);

LABEL_24:
LABEL_37:

      goto LABEL_38;
    }
    if (!*(void *)&v10[6]._scaledLineHeight)
    {
      [(_UILabelLegacyScaledMetrics *)v10 bounds];
      -[UILabel _updateScaledMetricsForRect:](v11);
    }
    uint64_t v12 = [v9 length];
    double scaledLineHeight = v11[6]._scaledLineHeight;
    if (scaledLineHeight == 0.0) {
      double v14 = 0.0;
    }
    else {
      double v14 = *(double *)(*(void *)&scaledLineHeight + 8);
    }
    double v15 = objc_msgSend(v9, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v12, v14);
    double v16 = [(_UILabelLegacyScaledMetrics *)a1 _stringDrawingContext];
    double v17 = (void *)[v16 copy];

    [v17 setWantsNumberOfLineFragments:1];
    objc_msgSend(v17, "setMaximumNumberOfLines:", -[_UILabelLegacyScaledMetrics numberOfLines](a1, "numberOfLines"));
    [v17 setMinimumScaleFactor:1.0];
    [v17 setLayout:0];
    objc_msgSend(v9, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v17, a5, a6);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v17 setLayout:0];
    objc_msgSend(v15, "boundingRectWithSize:options:context:", -[_UILabelLegacyScaledMetrics _stringDrawingOptions](a1, "_stringDrawingOptions"), v17, a5, a6);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v26 = objc_alloc_init(_UILabelLegacyScaledMetrics);
    a1 = v26;
    if (v26)
    {
      v26->_scaledSize.CGFloat width = v23;
      v26->_scaledSize.CGFloat height = v25;
      v26->_unscaledAndPossiblyTooLargeSize.CGFloat width = v19;
      v26->_unscaledAndPossiblyTooLargeSize.CGFloat height = v21;
    }
    id v27 = *(double **)&v11[6]._scaledLineHeight;
    if (v27)
    {
      double v28 = v27[2];
      if (!v26) {
        goto LABEL_13;
      }
    }
    else
    {
      double v28 = 0.0;
      if (!v26)
      {
LABEL_13:
        if (v27)
        {
          double v29 = v27[7];
          if (!v26) {
            goto LABEL_16;
          }
        }
        else
        {
          double v29 = 0.0;
          if (!v26)
          {
LABEL_16:
            if (v27)
            {
              double v30 = v27[3];
              if (!v26) {
                goto LABEL_19;
              }
            }
            else
            {
              double v30 = 0.0;
              if (!v26)
              {
LABEL_19:
                if (v27)
                {
                  double v31 = v27[1];
                  if (v26)
                  {
LABEL_21:
                    v26->_actualScaleFactor = v31;
                    v26->_measuredNumberOfLines = [v17 numberOfLineFragments];
LABEL_22:
                    uint64_t v32 = (uint64_t)a1;
                    float v33 = v15;
                    goto LABEL_23;
                  }
                }
                else
                {
                  double v31 = 0.0;
                  if (v26) {
                    goto LABEL_21;
                  }
                }
                objc_msgSend(v17, "numberOfLineFragments", v31);
                goto LABEL_22;
              }
            }
            v26->_scaledBaselineOffset = v30;
            id v27 = *(double **)&v11[6]._scaledLineHeight;
            goto LABEL_19;
          }
        }
        v26->_scaledFirstBaselineOffset = v29;
        id v27 = *(double **)&v11[6]._scaledLineHeight;
        goto LABEL_16;
      }
    }
    v26->_baselineOffset = v28;
    id v27 = *(double **)&v11[6]._scaledLineHeight;
    goto LABEL_13;
  }
LABEL_38:

  return a1;
}

- (UILabel)_associatedScalingLabel
{
  return (UILabel *)objc_getAssociatedObject(self, &kAssociatedScalingLabelKey);
}

- (BOOL)_drawsDebugGlyphPathBoundsClipping
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 1) >> 7;
}

- (double)_boundingRectWithAttributedString:(uint64_t)a3 size:(void *)a4 options:(double)a5 context:(double)a6
{
  id v11 = a2;
  id v12 = a4;
  if (a1)
  {
    if ((a1[740] & 0x80) != 0)
    {
      double v15 = -[UILabel _verticalTextLayoutManager](a1);
      objc_msgSend(v15, "boundingRectWithAttributedString:size:options:context:", v11, a3, v12, a5, a6);
      double v14 = v16;
    }
    else
    {
      objc_msgSend(v11, "boundingRectWithSize:options:context:", a3, v12, a5, a6);
      double v14 = v13;
    }
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

- (double)_boundingRectWithString:(uint64_t)a3 size:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    if ((a1[740] & 0x80) != 0)
    {
      double v18 = -[UILabel _verticalTextLayoutManager](a1);
      objc_msgSend(v18, "boundingRectWithString:size:options:attributes:context:", v13, a3, v14, v15, a6, a7);
      double v17 = v19;
    }
    else
    {
      objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", a3, v14, v15, a6, a7);
      double v17 = v16;
    }
  }
  else
  {
    double v17 = 0.0;
  }

  return v17;
}

- (BOOL)isHighlighted
{
  return *(_DWORD *)&self->_textLabelFlags & 1;
}

- (id)_synthesizedAttributedTextForContent:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    BOOL v5 = [v3 attributedString];
    if (v5)
    {
      NSUInteger v6 = [v4 defaultAttributes];
      -[UILabel _synthesizedTextAttributes]((void *)a1);
      v65 = uint64_t v64 = v6;
      uint64_t v63 = v5;
      if (v6 == v65)
      {
        -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v5, 0, [v4 length], v6);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v7 = [v4 defaultAttributes];
        uint64_t v8 = (void *)[v5 mutableCopy];
        uint64_t v9 = *(void *)off_1E52D2048;
        CGFloat v10 = [v7 objectForKey:*(void *)off_1E52D2048];
        uint64_t v11 = [v4 length];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __48__UILabel__synthesizedAttributedTextForContent___block_invoke;
        v69[3] = &unk_1E530B108;
        id v12 = v10;
        id v70 = v12;
        id v13 = v8;
        id v71 = v13;
        objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v11, 0, v69);
        if (([(id)a1 isEnabled] & 1) == 0)
        {
          uint64_t v14 = *(void *)off_1E52D2238;
          id v15 = [v7 objectForKey:*(void *)off_1E52D2238];
          uint64_t v16 = [v4 length];
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __48__UILabel__synthesizedAttributedTextForContent___block_invoke_2;
          v66[3] = &unk_1E530B108;
          id v67 = v15;
          id v68 = v13;
          id v17 = v15;
          objc_msgSend(v68, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v16, 0, v66);
        }
        double v18 = -[NSAttributedString _ui_synthesizeAttributedSubstringFromRange:usingDefaultAttributes:](v13, 0, [v4 length], v65);
        id v19 = (id)[v18 copy];
      }
      if ([(id)a1 _overallWritingDirectionFollowsLayoutDirection])
      {
        id v20 = v19;
        if ([v20 length])
        {
          BOOL v21 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [(id)a1 semanticContentAttribute]) != UIUserInterfaceLayoutDirectionLeftToRight;
          uint64_t v94 = 0;
          double v95 = &v94;
          uint64_t v96 = 0x2020000000;
          uint64_t v97 = 0;
          uint64_t v90 = 0;
          unsigned int v91 = &v90;
          uint64_t v92 = 0x2020000000;
          __int16 v93 = 0;
          double v22 = [(id)a1 _content];
          CGFloat v23 = [v22 paragraphStyle];
          uint64_t v24 = [v20 length];
          uint64_t v25 = *(void *)off_1E52D21B8;
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke;
          v86[3] = &unk_1E530EC98;
          id v26 = v23;
          id v87 = v26;
          char v88 = &v90;
          v89 = &v94;
          objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v24, 0, v86);
          uint64_t v27 = v95[3];
          if (!v27)
          {
            double v56 = [MEMORY[0x1E4F28B00] currentHandler];
            [v56 handleFailureInMethod:sel__attributedStringIsolatingStringWritingDirection_ object:a1 file:@"UILabel.m" lineNumber:1065 description:@"should have at least one isolate range (beginning to end)"];

            uint64_t v27 = v95[3];
          }
          double v61 = v26;
          double v28 = malloc_type_malloc(16 * v27, 0x100004030AC6366uLL);
          double v60 = v4;
          uint64_t v82 = 0;
          uint64_t v83 = &v82;
          uint64_t v84 = 0x2020000000;
          uint64_t v85 = 0;
          *((_WORD *)v91 + 12) = 0;
          double v29 = (void *)[v20 mutableCopy];
          uint64_t v30 = [v20 length];
          uint64_t v72 = MEMORY[0x1E4F143A8];
          uint64_t v73 = 3221225472;
          double v74 = __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke_2;
          double v75 = &unk_1E530ECC0;
          id v31 = v22;
          id v76 = v31;
          double v78 = &v90;
          uint64_t v79 = &v82;
          id v80 = v28;
          BOOL v81 = v21;
          id v32 = v29;
          id v77 = v32;
          objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v30, 0, &v72);
          uint64_t v33 = v83[3];
          if (v33 != v95[3])
          {
            CGSize v57 = [MEMORY[0x1E4F28B00] currentHandler];
            [v57 handleFailureInMethod:sel__attributedStringIsolatingStringWritingDirection_ object:a1 file:@"UILabel.m" lineNumber:1094 description:@"Number of writing direction changes was inconsistent"];

            uint64_t v33 = v95[3];
          }
          id v58 = v31;
          double v62 = v28;
          if (v33)
          {
            uint64_t v34 = 0;
            unint64_t v35 = 0;
            uint64_t v36 = *(void *)off_1E52D1F50;
            double v37 = v62 + 1;
            do
            {
              uint64_t v38 = *((unsigned __int16 *)v37 - 4);
              uint64_t v39 = *v37 + v34;
              if (v35)
              {
                CGFloat v40 = objc_msgSend(NSString, "_stringWithUnichar:", 8297, v58);
                objc_msgSend(v32, "replaceCharactersInRange:withString:", v39, 0, v40);

                objc_msgSend(v32, "removeAttribute:range:", v36, v39++, 1);
                ++v34;
              }
              double v41 = objc_msgSend(NSString, "_stringWithUnichar:", v38, v58);
              objc_msgSend(v32, "replaceCharactersInRange:withString:", v39, 0, v41);

              objc_msgSend(v32, "removeAttribute:range:", v36, v39, 1);
              v37 += 2;
              ++v34;
              ++v35;
            }
            while (v35 < v95[3]);
          }
          uint64_t v42 = objc_msgSend(v32, "length", v58);
          double v43 = [NSString _stringWithUnichar:8297];
          objc_msgSend(v32, "replaceCharactersInRange:withString:", v42, 0, v43);

          objc_msgSend(v32, "removeAttribute:range:", *(void *)off_1E52D1F50, v42, 1);
          free(v62);
          double v44 = v77;
          id v19 = v32;

          _Block_object_dispose(&v82, 8);
          _Block_object_dispose(&v90, 8);
          _Block_object_dispose(&v94, 8);
          double v4 = v60;
          BOOL v5 = v63;
        }
        else
        {
          id v19 = v20;
        }
      }
      [(id)a1 _hyphenationFactor];
      if (v45 > 0.0 && (*(unsigned char *)(a1 + 739) & 4) != 0)
      {
        id v46 = v19;
        double v47 = [v46 string];
        uint64_t v48 = [v47 length];
        uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:0];
        uint64_t v50 = objc_msgSend(v49, "matchesInString:options:range:", v47, 0, 0, v48);
        id v51 = v46;
        id v19 = v51;
        if ([v50 count])
        {
          uint64_t v52 = (void *)[v51 mutableCopy];
          uint64_t v53 = *(void *)off_1E52D21B8;
          uint64_t v72 = MEMORY[0x1E4F143A8];
          uint64_t v73 = 3221225472;
          double v74 = __65__UILabel__attributedStringByDisablingHyphenationIfURLsDetected___block_invoke;
          double v75 = &unk_1E530ECE8;
          id v54 = v52;
          id v76 = v54;
          objc_msgSend(v51, "enumerateAttribute:inRange:options:usingBlock:", v53, 0, v48, 0, &v72);
          id v19 = v54;
        }
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_textEncapsulation
{
  return self->_textEncapsulation;
}

- (BOOL)_overallWritingDirectionFollowsLayoutDirection
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 3) >> 1) & 1;
}

- (id)currentTextColor
{
  if (self)
  {
    if ([(UILabel *)self _textColorFollowsTintColor]
      || (*((unsigned char *)&self->_textLabelFlags + 3) & 0x80) != 0)
    {
      BOOL v5 = [(UIView *)self tintColor];
      NSUInteger v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        id v7 = [(UILabel *)self textColor];
      }
      id v3 = v7;

      if (v3) {
        goto LABEL_17;
      }
LABEL_16:
      id v3 = [(id)objc_opt_class() _defaultColor];
      goto LABEL_17;
    }
    if (![(UILabel *)self isEnabled])
    {
      uint64_t v4 = [(UILabel *)self _disabledFontColor];
LABEL_15:
      id v3 = (void *)v4;
      if (v4) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (![(UILabel *)self isHighlighted]
      || (*((unsigned char *)&self->_textLabelFlags + 4) & 8) != 0
      || ([(UILabel *)self highlightedTextColor],
          (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v4 = [(UILabel *)self textColor];
      goto LABEL_15;
    }
  }
  else
  {
    id v3 = 0;
  }
LABEL_17:
  return v3;
}

- (id)_disabledFontColor
{
  return +[UIColor tertiaryLabelColor];
}

- (void)tintColorDidChange
{
  if (self
    && ([(UILabel *)self _textColorFollowsTintColor]
     || (*((unsigned char *)&self->_textLabelFlags + 3) & 0x80) != 0))
  {
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  if ([(UIView *)self semanticContentAttribute] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setSemanticContentAttribute:a3];
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)_drawWithString:(uint64_t)a3 rect:(void *)a4 options:(void *)a5 attributes:(double)a6 context:(double)a7
{
  id v20 = a2;
  id v17 = a4;
  id v18 = a5;
  if ((a1[740] & 0x80) != 0)
  {
    id v19 = -[UILabel _verticalTextLayoutManager](a1);
    objc_msgSend(v19, "drawWithString:rect:options:attributes:context:", v20, a3, v17, v18, a6, a7, a8, a9);
  }
  else
  {
    objc_msgSend(v20, "drawWithRect:options:attributes:context:", a3, v17, v18, a6, a7, a8, a9);
  }
}

- (id)_contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:(unsigned char *)a3 didAdjustFont:
{
  uint64_t v22 = 0;
  CGFloat v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__235;
  id v26 = __Block_byref_object_dispose__235;
  id v5 = a2;
  id v27 = v5;
  NSUInteger v6 = [a1 traitCollection];
  [v6 _typesettingLanguageAwareLineHeightRatio];
  double v8 = v7;

  uint64_t v9 = [(id)v23[5] font];
  CGFloat v10 = -[UIFont _fontAdjustedForTypesettingLanguageAwareLineHeightRatio:](v9, v8);

  if (v10)
  {
    if ([v5 isAttributed])
    {
      uint64_t v11 = [v5 attributedString];
      uint64_t v12 = [(id)v23[5] length];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __89__UILabel__contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio_didAdjustFont___block_invoke;
      v21[3] = &unk_1E530EDA0;
      *(double *)&v21[5] = v8;
      v21[4] = &v22;
      v21[6] = a3;
      objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0x100000, v21);
    }
    id v13 = [(id)v23[5] font];
    id v14 = v10;
    id v15 = v14;
    if (v13 == v14)
    {

      goto LABEL_12;
    }
    if (v13)
    {
      char v16 = [v13 isEqual:v14];

      if (v16) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v17 = [(id)v23[5] contentByAddingAttribute:*(void *)off_1E52D2040 toDefaultAttributesWithValue:v15];
    id v18 = (void *)v23[5];
    void v23[5] = v17;

    if (a3) {
      *a3 = 1;
    }
  }
LABEL_12:
  id v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v19;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v50 = a3;
  uint64_t v4 = [(UIView *)self traitCollection];
  [v50 displayScale];
  double v6 = v5;
  [v4 displayScale];
  double v8 = v7;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    if (v6 <= 0.0)
    {
      uint64_t v9 = +[UIScreen mainScreen];
      [v9 scale];
    }
    if (v8 <= 0.0)
    {
      CGFloat v10 = +[UIScreen mainScreen];
      [v10 scale];
    }
  }
  uint64_t v11 = [v4 typesettingLanguage];
  uint64_t v12 = [v50 typesettingLanguage];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0) {
    -[UILabel _adjustFontForTypesettingLanguage](self);
  }
  [v4 _typesettingLanguageAwareLineHeightRatio];
  double v15 = v14;
  [v50 _typesettingLanguageAwareLineHeightRatio];
  if (self && v15 != v16)
  {
    uint64_t v17 = [(UILabel *)self _content];
    id v18 = -[UILabel _contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio:didAdjustFont:](self, v17, 0);
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)self, v18, 0, 0, 1, 1);
  }
  id v19 = v50;
  if (v4 && (!v50 || v4[13] != v50[13] || v4[15] != v50[15]))
  {
    -[UILabel _adjustFontForAccessibilityTraits:](self, [v4 legibilityWeight] != objc_msgSend(v50, "legibilityWeight"));
    id v19 = v50;
  }
  uint64_t v20 = [v19 _backlightLuminance];
  if (v20 != [v4 _backlightLuminance])
  {
    if ([v4 _backlightLuminance] == 1)
    {
      if (self)
      {
        BOOL v21 = [(UIView *)self viewWithTag:4032914800];
        if (v21)
        {
          uint64_t v22 = [(UIView *)self viewWithTag:4032914800];
          if (!v22) {
            goto LABEL_27;
          }
          CGFloat v23 = v22;
          uint64_t v24 = [v22 layer];
          uint64_t v25 = [v24 animationForKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];

          double v26 = CACurrentMediaTime();
          [v25 beginTime];
          double v28 = v26 - (v27 + 0.0 + 1.5);

          if (v28 >= 0.0)
          {
            if ([(UILabel *)self marqueeRunning])
            {
              double v29 = [(UIView *)self traitCollection];
              uint64_t v30 = [v29 _backlightLuminance];

              if (v30 == 1)
              {
                [(UILabel *)self _stopMarqueeWithRedisplay:1];
                +[_UIBacklightEnvironment _defaultAnimationDuration];
                double v32 = v31;
                [(UIView *)self alpha];
                uint64_t v34 = v33;
                [(UIView *)self setAlpha:0.0];
                v51.receiver = (id)MEMORY[0x1E4F143A8];
                v51.super_class = (Class)3221225472;
                uint64_t v52 = __35__UILabel__applyBacklightLuminance__block_invoke;
                uint64_t v53 = &unk_1E52D9CD0;
                id v54 = self;
                uint64_t v55 = v34;
                +[UIView animateWithDuration:&v51 animations:v32];
              }
            }
          }
          else
          {
LABEL_27:
            [(UILabel *)self _stopMarqueeWithRedisplay:1];
          }
        }
      }
    }
    else if (self)
    {
      [(UILabel *)self _startMarqueeIfNecessary];
    }
  }
  uint64_t v35 = [v4 userInterfaceStyle];
  uint64_t v36 = [v50 userInterfaceStyle];
  if (self && v35 != v36 && self->_cuiStyleEffectConfiguration)
  {
    double v37 = [(UIView *)self traitCollection];
    uint64_t v38 = -[UITraitCollection _styleEffectAppearanceName](v37);

    uint64_t v39 = [(CUIStyleEffectConfiguration *)self->_cuiStyleEffectConfiguration appearanceName];
    id v40 = v38;
    id v41 = v39;
    if (v40 == v41)
    {
    }
    else
    {
      uint64_t v42 = v41;
      if (v40 && v41)
      {
        char v43 = [v40 isEqual:v41];

        if (v43) {
          goto LABEL_40;
        }
      }
      else
      {
      }
      double v44 = (void *)[(CUIStyleEffectConfiguration *)self->_cuiStyleEffectConfiguration copy];
      [v44 setAppearanceName:v40];
      cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
      self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v44;
      id v46 = v44;

      id layout = self->_layout;
      self->_id layout = 0;

      v51.receiver = self;
      v51.super_class = (Class)UILabel;
      [(UIView *)&v51 setNeedsDisplay];
    }
LABEL_40:
  }
  uint64_t v48 = [v4 _userInterfaceRenderingMode];
  if (v48 != [v50 _userInterfaceRenderingMode]
    || (uint64_t v49 = [v4 _vibrancy], v49 != objc_msgSend(v50, "_vibrancy")))
  {
    -[UILabel _resolveMaterialColor:]((uint64_t)self, self->_lastSetColor);
  }
}

- (void)_drawWithAttributedString:(uint64_t)a3 rect:(void *)a4 options:(double)a5 context:(double)a6
{
  id v17 = a2;
  id v15 = a4;
  if ((a1[740] & 0x80) != 0)
  {
    double v16 = -[UILabel _verticalTextLayoutManager](a1);
    objc_msgSend(v16, "drawWithAttributedString:rect:options:context:", v17, a3, v15, a5, a6, a7, a8);
  }
  else
  {
    objc_msgSend(v17, "drawWithRect:options:context:", a3, v15, a5, a6, a7, a8);
  }
}

- (void)set_fontForShortcutBaselineCalculation:(id)a3
{
  p_fontForShortcutBaselineCalculation = &self->_fontForShortcutBaselineCalculation;
  id v6 = a3;
  if (![v6 isEqual:*p_fontForShortcutBaselineCalculation]
    || !v6 && *p_fontForShortcutBaselineCalculation)
  {
    objc_storeStrong((id *)&self->_fontForShortcutBaselineCalculation, a3);
    [(UILabel *)self _invalidateBaselineConstraints];
  }
}

- (void)_invalidateBaselineConstraints
{
  if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
  {
    id v3 = [(UIView *)self _layoutEngine];
    if (v3)
    {
      [(UILabel *)self _baselineOffsetFromBottom];
      double v5 = v4;
      if (self->_previousFirstLineBaseline != self->_intrinsicSizeBaselineInfo.firstBaseline
        || self->_previousBaselineOffsetFromBottom != v4)
      {
        v6.receiver = self;
        v6.super_class = (Class)UILabel;
        [(UIView *)&v6 _invalidateBaselineConstraints];
        self->_previousFirstLineBaseline = self->_intrinsicSizeBaselineInfo.firstBaseline;
        self->_previousBaselineOffsetFromBottom = v5;
      }
    }
  }
}

- (double)_firstBaselineOffsetFromTop
{
  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation)
  {
    [(UIFont *)fontForShortcutBaselineCalculation lineHeight];
    [(UIFont *)self->_fontForShortcutBaselineCalculation descender];
    UIRoundToViewScale(self);
    double firstBaseline = v4;
  }
  else
  {
    -[UILabel _ensureBaselineMetricsReturningBounds]((uint64_t)self);
    double firstBaseline = self->_intrinsicSizeBaselineInfo.firstBaseline;
  }
  return firstBaseline + -[UILabel _letterformAwareAllAlignmentInsets](self) + 0.0;
}

- (double)_baselineOffsetFromBottom
{
  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation)
  {
    [(UIFont *)fontForShortcutBaselineCalculation lineHeight];
    UICeilToViewScale(self);
    double v5 = v4;
    [(UILabel *)self _firstBaselineOffsetFromTop];
    double v7 = v5 - v6;
  }
  else
  {
    -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", -[UILabel _ensureBaselineMetricsReturningBounds]((uint64_t)self));
    double v7 = CGRectGetMaxY(v10) - self->_intrinsicSizeBaselineInfo.lastBaseline;
  }
  -[UILabel _letterformAwareAllAlignmentInsets](self);
  return v7 + v8 + 0.0;
}

- (void)_setOverallWritingDirectionFollowsLayoutDirection:(BOOL)a3
{
  if (((((*(void *)&self->_textLabelFlags & 0x2000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 0x2000000;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFDFFFFFFLL | v3);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  if (self->_numberOfLines != numberOfLines)
  {
    int v5 = [(UILabel *)self _needsDoubleUpdateConstraintsPass];
    self->_int64_t numberOfLines = numberOfLines;
    [(UILabel *)self _invalidateLabelSize];
    v6.receiver = self;
    v6.super_class = (Class)UILabel;
    [(UIView *)&v6 setNeedsDisplay];
    -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
    [(UILabel *)self setMarqueeEnabled:(*(void *)&self->_textLabelFlags >> 8) & 1];
    -[UILabel _runMarqueeIfEnabledAndAncestorIsFocused](self);
  }
}

- (void)_setLineBreakMode:(int64_t)a3
{
  int v5 = [(UILabel *)self _content];
  objc_super v6 = [v5 paragraphStyle];

  if ([v6 lineBreakMode] != a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__UILabel__setLineBreakMode___block_invoke;
    v11[3] = &__block_descriptor_40_e33_v16__0__NSMutableParagraphStyle_8l;
    v11[4] = a3;
    double v7 = self;
    double v8 = (void *)[v6 mutableCopy];
    __29__UILabel__setLineBreakMode___block_invoke((uint64_t)v11, v8);
    uint64_t v9 = [(UILabel *)v7 _content];
    CGRect v10 = [v9 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v8];
    [(UILabel *)v7 _setContent:v10];

    [(UILabel *)v7 _invalidateLabelSize];
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  if (!a3)
  {
    $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
    if ((*(_WORD *)&textLabelFlags & 0x200) == 0) {
      return;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFFFFDFFLL);
    goto LABEL_7;
  }
  NSInteger v4 = [(UILabel *)self numberOfLines];
  if ((v4 == 1) != ((*(void *)&self->_textLabelFlags & 0x200) == 0)) {
    return;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v4 == 1) << 9));
  if (v4 != 1)
  {
LABEL_7:
    [(UILabel *)self setMarqueeRunning:0];
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  [(UILabel *)self setLineBreakMode:2];
  int v5 = [(UIView *)self layer];
  [v5 setOpaque:0];

  uint64_t v6 = 1;
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)UILabel;
  [(UIView *)&v8 setNeedsDisplay];
  [(UIView *)self _setTracksFocusedAncestors:v6];
}

- (void)_runMarqueeIfEnabledAndAncestorIsFocused
{
  if (a1)
  {
    objc_super v2 = [a1 _focusSystem];
    uint64_t v6 = [v2 _focusedView];

    int v3 = [a1 isDescendantOfView:v6];
    NSInteger v4 = (void *)v6;
    if (v3)
    {
      if (v6) {
        uint64_t v5 = [a1 _tracksFocusedAncestors];
      }
      else {
        uint64_t v5 = 0;
      }
      [a1 setMarqueeRunning:v5];
      NSInteger v4 = (void *)v6;
    }
  }
}

- (NSLineBreakMode)lineBreakMode
{
  objc_super v2 = [(UILabel *)self _content];
  int v3 = [v2 paragraphStyle];
  NSLineBreakMode v4 = [v3 lineBreakMode];

  return v4;
}

uint64_t __29__UILabel__setLineBreakMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLineBreakMode:*(void *)(a1 + 32)];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  [(UILabel *)self alignmentRectInsets];
  BOOL v10 = v9 == 0.0;
  if (v11 != 0.0) {
    BOOL v10 = 0;
  }
  if (v8 != 0.0) {
    BOOL v10 = 0;
  }
  if (v7 != 0.0) {
    BOOL v10 = 0;
  }
  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      uint64_t v22 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Text Field not expected to have alignmnetRectInsets.", buf, 2u);
      }
    }
  }
  else if (!v10)
  {
    CGFloat v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25ADF8) + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Text Field not expected to have alignmnetRectInsets.", buf, 2u);
    }
  }
  fontForShortcutBaselineCalculation = self->_fontForShortcutBaselineCalculation;
  if (fontForShortcutBaselineCalculation || [(_UILabelContent *)self->_content isAttributed])
  {
    char v13 = fontForShortcutBaselineCalculation;
  }
  else
  {
    char v13 = [(UILabel *)self font];
  }
  double v14 = v13;
  if (!v13)
  {
    -[UILabel sizeThatFits:](self, "sizeThatFits:", width, height);
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    *(_OWORD *)buf = 0u;
    v27[0] = 0;
    v27[1] = 0;
    BOOL v19 = -[_UITextSizeCache getSize:baselineInfo:forTargetSize:isMultiline:](self->_intrinsicContentSizeCache, "getSize:baselineInfo:forTargetSize:isMultiline:", v27, buf, [(UILabel *)self numberOfLines] != 1, width, height);
    if (os_variant_has_internal_diagnostics())
    {
      if (v19)
      {
LABEL_16:
        double v16 = *(double *)buf;
        double v18 = height - *(double *)&buf[8];
        goto LABEL_17;
      }
      uint64_t v24 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
LABEL_31:

        goto LABEL_16;
      }
      v39.double width = width;
      v39.double height = height;
      uint64_t v25 = NSStringFromSize(v39);
      *(_DWORD *)uint64_t v34 = 138412546;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      double v37 = v25;
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "UIKit bug. Failed baseline lookup for %@ at %@", v34, 0x16u);
    }
    else
    {
      if (v19) {
        goto LABEL_16;
      }
      double v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25AE00) + 8);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      uint64_t v24 = v26;
      v40.double width = width;
      v40.double height = height;
      uint64_t v25 = NSStringFromSize(v40);
      *(_DWORD *)uint64_t v34 = 138412546;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      double v37 = v25;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "UIKit bug. Failed baseline lookup for %@ at %@", v34, 0x16u);
    }

    goto LABEL_31;
  }
  [(UIFont *)v13 lineHeight];
  [(UIFont *)v14 descender];
  UIRoundToViewScale(self);
  double v16 = v15;
  [(UIFont *)v14 lineHeight];
  UICeilToViewScale(self);
  double v18 = v17 - v16;
LABEL_17:

  double v20 = v16;
  double v21 = v18;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)_setLineBreakStrategy:(unint64_t)a3
{
  uint64_t v5 = [(UILabel *)self _content];
  uint64_t v6 = [v5 paragraphStyle];

  if ([v6 lineBreakStrategy] != a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__UILabel__setLineBreakStrategy___block_invoke;
    v11[3] = &__block_descriptor_40_e33_v16__0__NSMutableParagraphStyle_8l;
    v11[4] = a3;
    double v7 = self;
    double v8 = (void *)[v6 mutableCopy];
    __33__UILabel__setLineBreakStrategy___block_invoke((uint64_t)v11, v8);
    double v9 = [(UILabel *)v7 _content];
    BOOL v10 = [v9 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v8];
    [(UILabel *)v7 _setContent:v10];

    [(UILabel *)v7 _invalidateLabelSize];
  }
}

uint64_t __33__UILabel__setLineBreakStrategy___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLineBreakStrategy:*(void *)(a1 + 32)];
}

- (void)_setDefaultAttributes:(id)a3
{
  id v11 = a3;
  NSLineBreakMode v4 = self->_content;
  uint64_t v5 = [(UILabel *)self _content];
  uint64_t v6 = [v5 contentWithDefaultAttributes:v11];
  [(UILabel *)self _setContent:v6];

  if (v4 != self->_content)
  {
    -[UILabel _noteInstanceCustomizationForAttributedString:attributes:](self, 0, v11);
    if ([(_UILabelContent *)self->_content isAttribute:*(void *)off_1E52D2048 uniformlyEqualToValue:0])
    {
      double v7 = [(UILabel *)self textColor];
      lastSetColor = self->_lastSetColor;
      self->_lastSetColor = v7;
      double v9 = v7;

      -[UILabel _resolveMaterialColor:]((uint64_t)self, v9);
    }
    else
    {
      BOOL v10 = self->_lastSetColor;
      self->_lastSetColor = 0;

      [(UIView *)self mt_setContentEffects:0];
      double v9 = 0;
    }
  }
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (UIColor)textColor
{
  objc_super v2 = [(UILabel *)self _content];
  double v3 = [v2 defaultValueForAttribute:*(void *)off_1E52D2048];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() _defaultColor];
  }
  double v6 = v5;

  return (UIColor *)v6;
}

- (CGSize)textSize
{
  double v3 = [(UILabel *)self _content];
  double v4 = v3;
  p_size = &self->_size;
  if (self->_size.width == 0.0 && self->_size.height == 0.0 && [v3 length] >= 1)
  {
    if ([v4 isAttributed])
    {
      double v6 = [(UILabel *)self _synthesizedAttributedText];
      uint64_t v7 = [(UILabel *)self _stringDrawingOptions];
      double v8 = [(UILabel *)self _stringDrawingContext];
      [(UILabel *)self _boundingRectWithAttributedString:v7 size:v8 options:3.40282347e38 context:3.40282347e38];
      p_size->CGFloat width = v9;
      self->_size.CGFloat height = v10;
    }
    else
    {
      double v6 = [v4 string];
      uint64_t v11 = [(UILabel *)self _stringDrawingOptions];
      double v8 = [(UILabel *)self _defaultAttributes];
      uint64_t v12 = [(UILabel *)self _stringDrawingContext];
      [(UILabel *)self _boundingRectWithString:v11 size:v8 options:v12 attributes:3.40282347e38 context:3.40282347e38];
      p_size->CGFloat width = v13;
      self->_size.CGFloat height = v14;
    }
  }
  CGFloat width = p_size->width;
  CGFloat height = self->_size.height;

  double v17 = width;
  double v18 = height;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  unint64_t v4 = 2;
  if (!adjustsFontSizeToFitWidth) {
    unint64_t v4 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFFFFFFDLL | v4);
  if ((v4 >> 1) != ((*(unint64_t *)&textLabelFlags >> 1) & 1))
  {
    if ((*(unsigned char *)&textLabelFlags & 2) == 0)
    {
      scaledMetrics = self->_scaledMetrics;
      self->_scaledMetrics = 0;

      self->_scaledMetricsTargetSize = (CGSize)*MEMORY[0x1E4F1DB30];
      id layout = self->_layout;
      self->_id layout = 0;

LABEL_10:
      [(UILabel *)self _invalidateLabelSize];
      v13.receiver = self;
      v13.super_class = (Class)UILabel;
      [(UIView *)&v13 setNeedsDisplay];
      return;
    }
    double v8 = [(UIView *)self window];
    if (v8)
    {
    }
    else if (!self->_scaledMetrics)
    {
      return;
    }
    [(UIView *)self bounds];
    if (-[UILabel _updateScaledMetricsForRect:]((uint64_t)self, v9, v10, v11, v12)) {
      goto LABEL_10;
    }
  }
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  if (self) {
    [(_UILabelImplProtocol *)self->__impl setMinimumScaleFactor:minimumScaleFactor];
  }
  self->_minimumFontSize = 0.0;
}

- (void)setBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((*(unint64_t *)&textLabelFlags >> 4) & 3) != baselineAdjustment)
  {
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFFFFFCFLL | (16 * (baselineAdjustment & 3)));
    v6.receiver = self;
    v6.super_class = (Class)UILabel;
    [(UIView *)&v6 setNeedsDisplay];
    id layout = self->_layout;
    self->_id layout = 0;

    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UILabel *)self _invalidateLabelSize];
    }
  }
}

- (UIEdgeInsets)_contentInsetsFromFonts
{
  double v3 = [(UILabel *)self _content];
  double v4 = 0.0;
  if ([v3 isNil])
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    double v8 = [v3 string];
    double v9 = +[UILabel _tooBigChars]();
    uint64_t v10 = [v8 rangeOfCharacterFromSet:v9];

    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v3 isAttributed])
      {
        double v11 = [v3 attributedString];
        double v12 = [v3 defaultAttributes];
        objc_super v13 = [v12 objectForKeyedSubscript:*(void *)off_1E52D2040];
        double v7 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v11, v13, self);
        double v6 = v14;
        double v5 = v15;
        double v4 = v16;
      }
      else
      {
        double v11 = [v3 string];
        double v12 = [(UILabel *)self font];
        double v7 = +[UILabel _insetsForString:withFont:inView:]((uint64_t)UILabel, v17, v12, self);
        double v6 = v18;
        double v5 = v19;
        double v4 = v20;
      }
    }
  }

  double v21 = v7;
  double v22 = v6;
  double v23 = v5;
  double v24 = v4;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

+ (id)_tooBigChars
{
  self;
  if (qword_1EB25ADF0 != -1) {
    dispatch_once(&qword_1EB25ADF0, &__block_literal_global_272_0);
  }
  v0 = (void *)qword_1EB25ADE8;
  return v0;
}

+ (double)_insetsForString:(void *)a3 withFont:(void *)a4 inView:
{
  id v5 = a4;
  id v6 = a3;
  self;
  CTFontGetLanguageAwareOutsets();

  UICeilToViewScale(v5);
  double v9 = -v7;
  UICeilToViewScale(v5);
  UICeilToViewScale(v5);
  UICeilToViewScale(v5);

  return v9;
}

+ (double)_insetsForAttributedString:(void *)a3 withDefaultFont:(void *)a4 inView:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = a2;
  self;
  double v9 = +[_NSAttributedStringIntentResolver attributedStringByResolvingString:v8];

  uint64_t v10 = -[NSAttributedString _ui_fontsInRange:usingDefaultFont:](v9, 0, [v9 length], v6);
  double v11 = v10;
  if (v6)
  {
    uint64_t v12 = [v10 setByAddingObject:v6];

    double v11 = (void *)v12;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    double v17 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        if (CTFontGetLanguageAwareOutsets())
        {
          double v20 = fmax(0.0, v20);
          double v18 = fmax(0.0, v18);
          double v19 = fmax(0.0, v19);
          double v17 = fmax(0.0, v17);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  UICeilToViewScale(v7);
  double v23 = v22;
  UICeilToViewScale(v7);
  UICeilToViewScale(v7);
  UICeilToViewScale(v7);

  return -v23;
}

- (id)_materializedAttributedString
{
  id v1 = a1;
  if (a1)
  {
    objc_super v2 = [a1 _content];
    id v3 = [v2 attributedStringContent];
    int v4 = dyld_program_sdk_at_least();
    -[UILabel _setContent:adjustingFontForAccessibilityTraits:adjustingFontForTypesettingLanguage:adjustingFontForTypesettingLanguageAwareLineHeightRatio:checkingForDifferences:]((uint64_t)v1, v3, 1, v4, v4, 0);

    id v5 = [v1 _content];
    id v1 = [v5 attributedString];
  }
  return v1;
}

- (void)_setCuiStyleEffectConfiguration:(id)a3
{
  if (self->_cuiStyleEffectConfiguration != a3)
  {
    id v4 = (id)[a3 copy];
    if (!v4)
    {
      if (dyld_program_sdk_at_least()) {
        id v4 = objc_alloc_init(MEMORY[0x1E4F5E088]);
      }
      else {
        id v4 = 0;
      }
    }
    id v5 = [v4 appearanceName];

    if (!v5)
    {
      id v6 = [(UIView *)self traitCollection];
      id v7 = -[UITraitCollection _styleEffectAppearanceName](v6);
      [v4 setAppearanceName:v7];
    }
    cuiStyleEffectConfiguration = self->_cuiStyleEffectConfiguration;
    self->_cuiStyleEffectConfiguration = (CUIStyleEffectConfiguration *)v4;

    id layout = self->_layout;
    self->_id layout = 0;

    v10.receiver = self;
    v10.super_class = (Class)UILabel;
    [(UIView *)&v10 setNeedsDisplay];
  }
}

- (void)_setCuiCatalog:(id)a3
{
  id v5 = (CUICatalog *)a3;
  if (self->_cuiCatalog != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_cuiCatalog, a3);
    id layout = self->_layout;
    self->_id layout = 0;

    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    [(UIView *)&v8 setNeedsDisplay];
    id v5 = v7;
  }
}

uint64_t __48__UILabel__synthesizedAttributedTextForContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    objc_super v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)off_1E52D2048;
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

- (void)dealloc
{
  if (self->_accessibilityButtonShapesChangedToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 _removeObserver:self->_accessibilityButtonShapesChangedToken];

    self->_accessibilityButtonShapesChangedToken = 0;
  }
  id v4 = [(UILabel *)self _visualStyle];
  [v4 actionsForDeallocationOfLabel:self];

  v5.receiver = self;
  v5.super_class = (Class)UILabel;
  [(UIView *)&v5 dealloc];
}

uint64_t __59__UILabel_UILabel_ModernUISupport___capOffsetFromBoundsTop__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 capHeight];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (void)_setFirstLineBaselineFrameOriginY:(double)a3
{
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self _firstLineBaselineOffsetFromBoundsTop];
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_firstLineBaselineFrameOriginY
{
  [(UIView *)self frame];
  double v4 = v3;
  [(UILabel *)self _firstLineBaselineOffsetFromBoundsTop];
  return v5 + v4;
}

- (double)_lastLineBaseline
{
  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  double v4 = fabs(self->_intrinsicSizeBaselineInfo.lastBaseline);
  [(UIView *)self bounds];
  double v6 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if ((*(_DWORD *)&textLabelFlags & 0x1000000) == 0
    && (self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(unint64_t *)&textLabelFlags | 0x1000000),
        [(UIView *)self needsDisplay])
    || v4 >= 2.22044605e-16
    || (v15.origin.double x = v6,
        v15.origin.CGFloat y = v8,
        v15.size.CGFloat width = v10,
        v15.size.CGFloat height = v12,
        !CGRectEqualToRect(p_intrinsicSizeBaselineInfo->referenceBounds, v15)))
  {
    -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v8, v10, v12);
  }
  return p_intrinsicSizeBaselineInfo->lastBaseline;
}

- (double)_firstLineBaselineOffsetFromBoundsTop
{
  if ([(UILabel *)self _measuredNumberOfLines] < 1) {
    [(UILabel *)self _lastLineBaseline];
  }
  else {
    [(UILabel *)self _firstLineBaseline];
  }
  UIRoundToViewScale(self);
  return result;
}

- (void)_setFirstLineCapFrameOriginY:(double)a3
{
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self _capOffsetFromBoundsTop];
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (double)_capOffsetFromBoundsTop
{
  double v3 = [(UILabel *)self _content];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v15 = 0;
  double v4 = [(UILabel *)self font];
  [v4 capHeight];
  uint64_t v6 = v5;

  uint64_t v15 = v6;
  if ([v3 isAttributed])
  {
    double v7 = [v3 attributedString];
    uint64_t v8 = [v3 length];
    uint64_t v9 = *(void *)off_1E52D2040;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__UILabel_UILabel_ModernUISupport___capOffsetFromBoundsTop__block_invoke;
    v13[3] = &unk_1E530EE60;
    v13[4] = v14;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0x100000, v13);
  }
  [(UILabel *)self _firstLineBaseline];
  UIRoundToViewScale(self);
  double v11 = v10;
  _Block_object_dispose(v14, 8);

  return v11;
}

- (double)_firstLineBaseline
{
  p_intrinsicSizeBaselineInfo = &self->_intrinsicSizeBaselineInfo;
  double v4 = fabs(self->_intrinsicSizeBaselineInfo.firstBaseline);
  [(UIView *)self bounds];
  double v6 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if ((*(_DWORD *)&textLabelFlags & 0x1000000) == 0
    && (self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(unint64_t *)&textLabelFlags | 0x1000000),
        [(UIView *)self needsDisplay])
    || v4 < 2.22044605e-16
    || (v15.origin.double x = v6,
        v15.origin.CGFloat y = v8,
        v15.size.CGFloat width = v10,
        v15.size.CGFloat height = v12,
        !CGRectEqualToRect(p_intrinsicSizeBaselineInfo->referenceBounds, v15)))
  {
    -[UILabel _drawTextInRect:baselineCalculationOnly:](self, "_drawTextInRect:baselineCalculationOnly:", 1, v6, v8, v10, v12);
  }
  return p_intrinsicSizeBaselineInfo->firstBaseline;
}

- (int64_t)_measuredNumberOfLines
{
  return self->_intrinsicSizeBaselineInfo.measuredNumberOfLines;
}

uint64_t __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_intrinsicSizeWithinSize:");
}

- (void)setShadowColor:(UIColor *)shadowColor
{
  double v8 = shadowColor;
  double v4 = -[UILabel _shadow](self);
  double v5 = (void *)[v4 copy];

  double v6 = [v5 shadowColor];
  if (v6 == v8)
  {
    char v7 = dyld_program_sdk_at_least();

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  [v5 setShadowColor:v8];
  -[UILabel _setShadow:](self, v5);
LABEL_5:
}

- (void)_setSupportMultiLineShrinkToFit:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = 4;
    if (!a2) {
      uint64_t v3 = 0;
    }
    *(void *)(a1 + 736) = *(void *)(a1 + 736) & 0xFFFFFFFFFFFFFFFBLL | v3;
    double v4 = *(void **)(a1 + 608);
    *(void *)(a1 + 608) = 0;

    *(_OWORD *)(a1 + 616) = *MEMORY[0x1E4F1DB30];
    -[UILabel _invalidateLabelMetrics](a1);
  }
}

- (void)_setWantsUnderlineForAccessibilityButtonShapesEnabled:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x40000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFFBFFFFLL | v4);
    [(UILabel *)self _accessibilityButtonShapesParametersDidChange];
  }
}

- (void)_accessibilityButtonShapesParametersDidChange
{
  uint64_t v3 = [(UILabel *)self _defaultAttributes];
  id v7 = (id)[v3 mutableCopy];

  uint64_t v4 = *(void *)off_1E52D23E8;
  double v5 = [v7 objectForKey:*(void *)off_1E52D23E8];

  if (!self
    || !_AXSButtonShapesEnabled()
    || objc_msgSend(-[UIView _screen](self, "_screen"), "_userInterfaceIdiom") == 3)
  {
    double v6 = v7;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  double v6 = v7;
  if ((v5 != 0) != (*((unsigned char *)&self->_textLabelFlags + 2) & 4) >> 2)
  {
    if (!v5)
    {
      [v7 setObject:&unk_1ED3F7350 forKey:v4];
      goto LABEL_6;
    }
LABEL_5:
    [v6 removeObjectForKey:v4];
LABEL_6:
    [(UILabel *)self _setDefaultAttributes:v7];
    double v6 = v7;
  }
LABEL_10:
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  double height = shadowOffset.height;
  double width = shadowOffset.width;
  double v6 = -[UILabel _shadow](self);
  id v10 = (id)[v6 copy];

  [v10 shadowOffset];
  BOOL v9 = v8 == width && v7 == height;
  if (!v9 || dyld_program_sdk_at_least())
  {
    objc_msgSend(v10, "setShadowOffset:", width, height);
    -[UILabel _setShadow:](self, v10);
  }
}

- (void)_setShadow:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v5 = [a1 _content];
    uint64_t v4 = [v5 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D2238 value:v3];

    [a1 _setContent:v4];
  }
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  if ([(UILabel *)self isEnabled] != enabled)
  {
    uint64_t v5 = 64;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFBFLL | v5);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)setHighlighted:(BOOL)highlighted
{
  if (((((*(void *)&self->_textLabelFlags & 1) == 0) ^ highlighted) & 1) == 0)
  {
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFFFELL | highlighted);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

uint64_t __49__UILabel__invalidateAsNeededForNewSize_oldSize___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setLabelMasksToBoundsForAnimation:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 49))
  {
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (CGFloat)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 inContainer:(id)a5 isGuide:(BOOL)a6
{
  if ((a3 - 5) > 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    [(UIView *)&v8 _autolayoutSpacingAtEdge:*(void *)&a3 forAttribute:a4 inContainer:a5 isGuide:a6];
  }
  else
  {
    _UIViewBaselineToEdgeSpacing([(UILabel *)self _fontInfoForBaselineSpacing], a3);
    UICeilToViewScale(self);
  }
  return result;
}

- (double)_autolayoutSpacingAtEdge:(int)a3 forAttribute:(int64_t)a4 nextToNeighbor:(id)a5 edge:(int)a6 attribute:(int64_t)a7 multiplier:(double)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v13 = *(void *)&a3;
  if ((a3 - 5) > 1) {
    goto LABEL_12;
  }
  unsigned int v15 = a4 - 11;
  if (os_variant_has_internal_diagnostics())
  {
    if (v15 < 2) {
      goto LABEL_4;
    }
    double v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
    }
LABEL_12:
    v19.receiver = self;
    v19.super_class = (Class)UILabel;
    [(UIView *)&v19 _autolayoutSpacingAtEdge:v13 forAttribute:a4 nextToNeighbor:a5 edge:v10 attribute:a7 multiplier:a8];
    return result;
  }
  if (v15 >= 2)
  {
    double v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_autolayoutSpacingAtEdge_forAttribute_nextToNeighbor_edge_attribute_multiplier____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "UIKit problem: invalid argument for internal layout spacing method", buf, 2u);
    }
    goto LABEL_12;
  }
LABEL_4:
  _UIViewBaselineSpacing(self, a5, v13);
  return result;
}

void __76__UILabel__contentAdjustingFontForAccessibilityTraits_forced_didAdjustFont___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = a2;
  double v7 = [v18 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  objc_super v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v18 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  uint64_t v10 = v9;

  uint64_t v11 = [v10 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:a1[4]];
  double v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v14 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(void *)off_1E52D2040, v12, a3, a4);
    uint64_t v15 = *(void *)(a1[5] + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    double v17 = (unsigned char *)a1[6];
    if (v17) {
      *double v17 = 1;
    }
  }
}

void __23__UILabel__tooBigChars__block_invoke()
{
  uint64_t v0 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  id v1 = (void *)qword_1EB25ADE8;
  qword_1EB25ADE8 = v0;
}

IMP __22__UILabel__commonInit__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v0, sel__defaultAttributes);
  qword_1EB25ADD0 = (uint64_t)result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
  objc_storeStrong((id *)&self->__impl, 0);
  objc_storeStrong((id *)&self->__visualStyle, 0);
  objc_storeStrong((id *)&self->_fontForShortcutBaselineCalculation, 0);
  objc_storeStrong((id *)&self->_lightContainerView, 0);
  objc_storeStrong((id *)&self->_lightSourceDescriptor, 0);
  objc_storeStrong((id *)&self->_lastSetColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_marqueeMaskAnimations, 0);
  objc_storeStrong((id *)&self->_marqueeAnimations, 0);
  objc_storeStrong((id *)&self->_cuiStyleEffectConfiguration, 0);
  objc_storeStrong((id *)&self->_textEncapsulation, 0);
  objc_storeStrong((id *)&self->_cuiCatalog, 0);
  objc_storeStrong((id *)&self->_intrinsicContentSizeCache, 0);
  objc_storeStrong((id *)&self->_scaledMetrics, 0);
  objc_storeStrong(&self->_layout, 0);
  objc_storeStrong((id *)&self->_fallbackColorsForUserInterfaceStyle, 0);
  objc_storeStrong((id *)&self->_cachedSynthesizedTextAttributes, 0);
  objc_storeStrong((id *)&self->_synthesizedAttributedText, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor
{
  uint64_t v5 = highlightedTextColor;
  double v6 = self->_highlightedColor;
  double v7 = v5;
  id v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  if (v7 && v6)
  {
    BOOL v8 = [(UIColor *)v6 isEqual:v7];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_highlightedColor, highlightedTextColor);
  if (*(unsigned char *)&self->_textLabelFlags) {
    -[UILabel _invalidateLabelDisplay](self);
  }
LABEL_10:
}

- (void)_setHyphenationFactor:(float)a3
{
  uint64_t v5 = [(UILabel *)self _content];
  double v6 = [v5 paragraphStyle];

  [v6 hyphenationFactor];
  if (v7 != a3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __33__UILabel__setHyphenationFactor___block_invoke;
    v12[3] = &__block_descriptor_36_e33_v16__0__NSMutableParagraphStyle_8l;
    float v13 = a3;
    BOOL v8 = self;
    id v9 = (void *)[v6 mutableCopy];
    ((void (*)(void *, void *))__33__UILabel__setHyphenationFactor___block_invoke)(v12, v9);
    uint64_t v10 = [(UILabel *)v8 _content];
    uint64_t v11 = [v10 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v9];
    [(UILabel *)v8 _setContent:v11];

    [(UILabel *)v8 _invalidateLabelSize];
  }
}

uint64_t __33__UILabel__setHyphenationFactor___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setHyphenationFactor:a3];
}

- (void)_setTextColorFollowsTintColor:(BOOL)a3
{
  if (((((*(void *)&self->_textLabelFlags & 0x40000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 0x40000000;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFBFFFFFFFLL | v3);
    -[UILabel _invalidateLabelDisplay](self);
  }
}

- (void)_setUseShortcutIntrinsicContentSize:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)_setTextAlignmentFollowsWritingDirection:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x100000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x100000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFEFFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setNeedsDisplay];
  }
}

- (void)_setTextEncapsulation:(id)a3
{
  objc_storeStrong((id *)&self->_textEncapsulation, a3);
  -[UILabel _invalidateLabelDisplay](self);
}

- (void)_setMinimumFontSize:(double)a3
{
  if (self->_minimumFontSize != a3)
  {
    objc_super v5 = [(UILabel *)self font];
    [v5 pointSize];
    if (v6 > 0.0) {
      [(UILabel *)self font];
    }
    else {
    float v7 = [(id)objc_opt_class() defaultFont];
    }
    [v7 pointSize];
    double v9 = v8;

    double v10 = a3 / v9;
    if (v9 == 0.0) {
      double v10 = 0.0;
    }
    [(_UILabelImplProtocol *)self->__impl setMinimumScaleFactor:v10];
    self->_minimumFontSize = a3;
    [(UILabel *)self _invalidateLabelSize];
    v11.receiver = self;
    v11.super_class = (Class)UILabel;
    [(UIView *)&v11 setNeedsDisplay];
  }
}

- (void)setLineSpacing:(int64_t)a3
{
  if (self->_lineSpacing != a3)
  {
    self->_lineSpacing = a3;
    uint64_t v4 = [(UILabel *)self _content];
    objc_super v5 = [v4 paragraphStyle];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __26__UILabel_setLineSpacing___block_invoke;
    v10[3] = &unk_1E530EDC8;
    void v10[4] = self;
    double v6 = self;
    float v7 = (void *)[v5 mutableCopy];
    __26__UILabel_setLineSpacing___block_invoke((uint64_t)v10, v7);
    double v8 = [(UILabel *)v6 _content];
    double v9 = [v8 contentByApplyingAttributeToEntireRange:*(void *)off_1E52D21B8 value:v7];
    [(UILabel *)v6 _setContent:v9];

    [(UILabel *)v6 _invalidateLabelSize];
  }
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  int v5 = [(UILabel *)self _needsDoubleUpdateConstraintsPass];
  if (dyld_program_sdk_at_least()) {
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(preferredMaxLayoutWidth != 0.0) << 13));
  }
  else {
    *(void *)&self->_textLabelFlags |= 0x2000uLL;
  }
  if (self->_preferredMaxLayoutWidth != preferredMaxLayoutWidth)
  {
    self->_preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    [(UILabel *)self invalidateIntrinsicContentSize];
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
}

- (UILabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UILabel;
  int v5 = [(UIView *)&v45 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    float v7 = v5;
    double v8 = objc_alloc_init(_UILabelLegacyImpl);
    objc_storeStrong(v7 + 98, v8);

    double v9 = v7;
    double v10 = +[_UILabelVisualStyle inferredVisualStyle];
    [v9 _setVisualStyle:v10];

    UILabelCommonInit(v9);
    uint64_t v11 = [v4 decodeObjectForKey:@"UIHighlightedColor"];
    id v12 = v9[54];
    v9[54] = (id)v11;

    float v13 = [v4 decodeObjectForKey:@"UIShadowColor"];
    [v9 setShadowColor:v13];

    [v4 decodeCGSizeForKey:@"UIShadowOffset"];
    objc_msgSend(v9, "setShadowOffset:");
    v9[55] = (id)1;
    if ([v4 containsValueForKey:@"UINumberOfLines"]) {
      v9[55] = (id)[v4 decodeIntegerForKey:@"UINumberOfLines"];
    }
    v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFFCFLL);
    if ([v4 containsValueForKey:@"UIBaselineAdjustment"]) {
      v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFFCFLL | (16
    }
                                                                     * ([v4 decodeIntegerForKey:@"UIBaselineAdjustment"] & 3)));
    int v14 = [v4 decodeBoolForKey:@"UIAdjustsFontSizeToFit"];
    uint64_t v15 = 2;
    if (!v14) {
      uint64_t v15 = 0;
    }
    v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFFFDLL | v15);
    int v16 = [v4 decodeBoolForKey:@"UIAdjustsLetterSpacingToFit"];
    uint64_t v17 = 128;
    if (v16) {
      uint64_t v17 = 136;
    }
    v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFFF7 | v17);
    if ([v4 containsValueForKey:@"UIEnablesMarqueeWhenAncestorFocused"])
    {
      uint64_t v18 = [v4 decodeBoolForKey:@"UIEnablesMarqueeWhenAncestorFocused"];
      uint64_t v19 = 256;
      if (!v18) {
        uint64_t v19 = 0;
      }
      v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFEFFLL | v19);
      [v9 setMarqueeEnabled:v18];
    }
    v9[92] = (id)((unint64_t)v9[92] | 0x40);
    if ([v4 containsValueForKey:@"UIEnabled"])
    {
      int v20 = [v4 decodeBoolForKey:@"UIEnabled"];
      uint64_t v21 = 64;
      if (!v20) {
        uint64_t v21 = 0;
      }
      v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFFFFFBFLL | v21);
    }
    if ([v4 containsValueForKey:@"UIPreferredMaxLayoutWidth"])
    {
      [v4 decodeFloatForKey:@"UIPreferredMaxLayoutWidth"];
      *((double *)v9 + 93) = v22;
      v9[92] = (id)((unint64_t)v9[92] | 0x2000);
    }
    if ([v4 containsValueForKey:@"UIAdjustsFontForContentSizeCategory"]) {
      objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", objc_msgSend(v4, "decodeBoolForKey:", @"UIAdjustsFontForContentSizeCategory"));
    }
    if ([v4 containsValueForKey:@"UIShowsExpansionTextWhenTruncated"]) {
      objc_msgSend(v9, "setShowsExpansionTextWhenTruncated:", objc_msgSend(v4, "decodeBoolForKey:", @"UIShowsExpansionTextWhenTruncated"));
    }
    double v44 = [v4 decodeObjectForKey:@"UIFont"];
    char v43 = [v4 decodeObjectForKey:@"UITextColor"];
    [v4 decodeFloatForKey:@"UIMinimumFontSize"];
    float v24 = v23;
    long long v25 = +[UILabel _defaultAttributes];
    long long v26 = [v25 objectForKeyedSubscript:*(void *)off_1E52D21B8];

    uint64_t v42 = v26;
    if (v26)
    {
      uint64_t v27 = [v26 lineBreakMode];
      uint64_t v28 = [v26 lineBreakStrategy];
    }
    else
    {
      uint64_t v28 = 0xFFFFLL;
      uint64_t v27 = 4;
    }
    uint64_t v29 = v27;
    if ([v4 containsValueForKey:@"UILineBreakMode"]) {
      uint64_t v29 = [v4 decodeIntegerForKey:@"UILineBreakMode"];
    }
    uint64_t v41 = v28;
    if ([v4 containsValueForKey:@"UILineBreakStrategy"]) {
      uint64_t v28 = [v4 decodeIntegerForKey:@"UILineBreakStrategy"];
    }
    if ([v4 containsValueForKey:@"UITextAlignment"]) {
      uint64_t v30 = [v4 decodeIntegerForKey:@"UITextAlignment"];
    }
    else {
      uint64_t v30 = 0;
    }
    int v31 = [v4 decodeBoolForKey:@"UIAllowsDefaultTighteningForTruncation"];
    long long v32 = [v4 decodeObjectForKey:@"UIAttributedText"];
    if (!v32)
    {
      NSSize v40 = v6;
      uint64_t v33 = [v4 decodeObjectForKey:@"UIText"];
      if (v33) {
        [v9 _setText:v33];
      }

      double v6 = v40;
    }
    if (v44) {
      objc_msgSend(v9, "_setFont:");
    }
    if (v43)
    {
      objc_msgSend(v9, "_setTextColor:");
      v9[92] = (id)((unint64_t)v9[92] | 0x80000);
    }
    if (v29 != v27) {
      [v9 _setLineBreakMode:v29];
    }
    if (v28 != v41) {
      [v9 _setLineBreakStrategy:v28];
    }
    [v9 _setTextAlignment:v30];
    if (v24 != 0.0) {
      [v9 _setMinimumFontSize:v24];
    }
    if (v31) {
      -[UILabel _setAllowsDefaultTighteningForTruncation:](v9, 1);
    }
    if (v32)
    {
      uint64_t v34 = [v9 _content];
      uint64_t v35 = [v34 contentWithAttributedString:v32];
      [v9 _setContent:v35];

      if ([v4 containsValueForKey:@"UIMinimumScaleFactor"])
      {
        [v4 decodeFloatForKey:@"UIMinimumScaleFactor"];
        [v9 setMinimumScaleFactor:v36];
      }
    }
    if ([v4 containsValueForKey:@"UIDisableUpdateTextColorOnTraitCollectionChange"])
    {
      int v37 = [v4 decodeBoolForKey:@"UIDisableUpdateTextColorOnTraitCollectionChange"];
      uint64_t v38 = 0x80000;
      if (!v37) {
        uint64_t v38 = 0;
      }
      v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFFFFFF7FFFFLL | v38);
    }
    if ([v4 containsValueForKey:@"UILetterformAwareSizingRule"]) {
      v9[92] = (id)((unint64_t)v9[92] & 0xFFFFFFBFFFFFFFFFLL | (([v4 decodeIntegerForKey:@"UILetterformAwareSizingRule"] & 1) << 38));
    }
  }
  return v6;
}

- (Class)_intelligenceBaseClass
{
  sub_1853B985C(0, &qword_1E8FB7C28);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  id v5 = a4;
  double v6 = self;
  _sSo7UILabelC5UIKitE27_intelligenceCollectContent2in9collectorySo6CGRectV_21UIIntelligenceSupport0I16ElementCollectorCtF_0((uint64_t)v5);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UILabel;
  return [&v3 defaultAccessibilityTraits] | 0x40;
}

- (id)_image
{
  [(UILabel *)self _contentInsetsFromFonts];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self bounds];
  double v12 = v11 - (v10 + v6);
  double v14 = v13 - (v4 + v8);
  [+[UIScreen mainScreen] scale];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __32__UILabel__UILegibility___image__block_invoke;
  v17[3] = &unk_1E52F1BA0;
  *(double *)&v17[5] = v4;
  *(double *)&v17[6] = v6;
  *(double *)&v17[7] = v8;
  *(double *)&v17[8] = v10;
  v17[4] = self;
  return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, 0, v17, v12, v14, v15);
}

uint64_t __32__UILabel__UILegibility___image__block_invoke(uint64_t a1)
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v3 = 0;
  }
  else {
    double v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextTranslateCTM(v3, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 40));
  double v4 = (void *)[*(id *)(a1 + 32) layer];
  double v5 = GetContextStack(0);
  if (*(int *)v5 < 1) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5[3 * (*(_DWORD *)v5 - 1) + 1];
  }
  return [v4 renderInContext:v6];
}

- (id)largeContentTitle
{
  double v3 = [(UIView *)self _largeContentStoredProperties];
  int v4 = [v3 didSetLargeContentTitle];

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)UILabel;
    double v5 = [(UIView *)&v8 largeContentTitle];
  }
  else
  {
    uint64_t v6 = [(UILabel *)self attributedText];
    double v5 = [v6 string];
  }
  return v5;
}

- (void)_ola_willApplyMultilineTextWidthDisambiguationConstraint
{
}

- (BOOL)_hasCustomAutolayoutNeighborSpacingForAttribute:(int64_t *)a3
{
  return (a3 - 11) < 2;
}

- (id)_cuiCatalog
{
  return self->_cuiCatalog;
}

- (id)_cuiStyleEffectConfiguration
{
  return self->_cuiStyleEffectConfiguration;
}

void __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke(void *a1, void *a2)
{
  if (!a2) {
    a2 = (void *)a1[4];
  }
  id v6 = a2;
  uint64_t v3 = [v6 baseWritingDirection];
  if (v3) {
    int v4 = 8296;
  }
  else {
    int v4 = 8294;
  }
  if (v3 == 1) {
    int v4 = 8295;
  }
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (v4 != *(unsigned __int16 *)(v5 + 24))
  {
    *(_WORD *)(v5 + 24) = v4;
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

void __60__UILabel__attributedStringIsolatingStringWritingDirection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7)
  {
    id v7 = [*(id *)(a1 + 32) paragraphStyle];
  }
  id v13 = v7;
  uint64_t v8 = [v7 baseWritingDirection];
  if (v8) {
    int v9 = 8296;
  }
  else {
    int v9 = 8294;
  }
  if (v8 == 1) {
    int v9 = 8295;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v9 != *(unsigned __int16 *)(v10 + 24))
  {
    *(_WORD *)(v10 + 24) = v9;
    uint64_t v11 = *(void *)(a1 + 64) + 16 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_WORD *)uint64_t v11 = v9;
    *(_DWORD *)(v11 + 2) = 0;
    *(_WORD *)(v11 + 6) = 0;
    *(void *)(v11 + 8) = a3;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  double v12 = (void *)[v13 mutableCopy];
  [v12 setBaseWritingDirection:*(void *)(a1 + 72)];
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D21B8, v12, a3, a4);
}

void __65__UILabel__attributedStringByDisablingHyphenationIfURLsDetected___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = (id)[a2 mutableCopy];
    [v7 setHyphenationFactor:0.0];
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D21B8, v7, a3, a4);
  }
}

uint64_t __48__UILabel__synthesizedAttributedTextForContent___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)off_1E52D2238;
    return objc_msgSend(v8, "removeAttribute:range:", v9, a3, a4);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)UILabel;
  [(UIView *)&v43 encodeWithCoder:v4];
  uint64_t v5 = [(UILabel *)self text];

  if (v5)
  {
    id v6 = [(UILabel *)self text];
    [v4 encodeObject:v6 forKey:@"UIText"];
  }
  if ([(UILabel *)self adjustsFontForContentSizeCategory]) {
    [v4 encodeBool:1 forKey:@"UIAdjustsFontForContentSizeCategory"];
  }
  if ([(UILabel *)self showsExpansionTextWhenTruncated]) {
    [v4 encodeBool:1 forKey:@"UIShowsExpansionTextWhenTruncated"];
  }
  id v7 = [(UILabel *)self font];

  if (v7)
  {
    uint64_t v8 = [(UILabel *)self font];
    [v4 encodeObject:v8 forKey:@"UIFont"];
  }
  uint64_t v9 = [(UILabel *)self color];

  if (v9)
  {
    uint64_t v10 = [(UILabel *)self color];
    [v4 encodeObject:v10 forKey:@"UITextColor"];
  }
  highlightedColor = self->_highlightedColor;
  if (highlightedColor) {
    [v4 encodeObject:highlightedColor forKey:@"UIHighlightedColor"];
  }
  double v12 = [(UILabel *)self shadowColor];

  if (v12)
  {
    id v13 = [(UILabel *)self shadowColor];
    [v4 encodeObject:v13 forKey:@"UIShadowColor"];
  }
  [(UILabel *)self shadowOffset];
  if (v15 != *MEMORY[0x1E4F1DB30] || v14 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    objc_msgSend(v4, "encodeCGSize:forKey:", @"UIShadowOffset");
  }
  int64_t numberOfLines = self->_numberOfLines;
  if (numberOfLines != 1) {
    [v4 encodeInteger:numberOfLines forKey:@"UINumberOfLines"];
  }
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  uint64_t v18 = (*(unint64_t *)&textLabelFlags >> 4) & 3;
  if (v18)
  {
    [v4 encodeInteger:v18 forKey:@"UIBaselineAdjustment"];
    $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  }
  if ((*(unsigned char *)&textLabelFlags & 2) != 0) {
    [v4 encodeBool:1 forKey:@"UIAdjustsFontSizeToFit"];
  }
  [(UILabel *)self _minimumFontSize];
  if (v19 != 0.0)
  {
    [(UILabel *)self _minimumFontSize];
    *(float *)&double v20 = v20;
    [v4 encodeFloat:@"UIMinimumFontSize" forKey:v20];
  }
  if ([(UILabel *)self allowsDefaultTighteningForTruncation]) {
    [v4 encodeBool:1 forKey:@"UIAllowsDefaultTighteningForTruncation"];
  }
  uint64_t v21 = +[UILabel _defaultAttributes];
  uint64_t v22 = *(void *)off_1E52D21B8;
  float v23 = [v21 objectForKeyedSubscript:*(void *)off_1E52D21B8];

  if (v23)
  {
    uint64_t v24 = [v23 lineBreakMode];
    uint64_t v25 = [v23 lineBreakStrategy];
  }
  else
  {
    uint64_t v25 = 0xFFFFLL;
    uint64_t v24 = 4;
  }
  if ([(UILabel *)self lineBreakMode] != v24) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel lineBreakMode](self, "lineBreakMode"), @"UILineBreakMode");
  }
  if ([(UILabel *)self lineBreakStrategy] != v25) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel lineBreakStrategy](self, "lineBreakStrategy"), @"UILineBreakStrategy");
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[UILabel textAlignment](self, "textAlignment"), @"UITextAlignment");
  $E628185296FB360B9F692E5749A23446 v26 = self->_textLabelFlags;
  if ((*(unsigned char *)&v26 & 0x40) == 0)
  {
    [v4 encodeBool:0 forKey:@"UIEnabled"];
    $E628185296FB360B9F692E5749A23446 v26 = self->_textLabelFlags;
  }
  if ((*(_WORD *)&v26 & 0x100) != 0) {
    [v4 encodeBool:1 forKey:@"UIEnablesMarqueeWhenAncestorFocused"];
  }
  uint64_t v27 = [(UILabel *)self _content];
  if ([v27 isAttributed])
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v29 = [(UILabel *)self font];
    [v28 setValue:v29 forKey:*(void *)off_1E52D2040];

    uint64_t v30 = [(UILabel *)self color];
    [v28 setValue:v30 forKey:*(void *)off_1E52D2048];

    id v31 = objc_alloc_init((Class)off_1E52D2E28);
    long long v32 = [(UILabel *)self shadowColor];
    [v31 setShadowColor:v32];

    [(UILabel *)self shadowOffset];
    objc_msgSend(v31, "setShadowOffset:");
    [v28 setValue:v31 forKey:*(void *)off_1E52D2238];
    id v33 = objc_alloc_init((Class)off_1E52D2D48);
    objc_msgSend(v33, "setLineBreakMode:", -[UILabel lineBreakMode](self, "lineBreakMode"));
    objc_msgSend(v33, "setLineBreakStrategy:", -[UILabel lineBreakStrategy](self, "lineBreakStrategy"));
    objc_msgSend(v33, "setAlignment:", -[UILabel textAlignment](self, "textAlignment"));
    [v28 setValue:v33 forKey:v22];
    id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v35 = [v27 string];
    float v36 = (void *)[v34 initWithString:v35 attributes:v28];

    LOBYTE(v35) = [v27 isEqualToAttributedString:v36];
    if (v35) {
      goto LABEL_43;
    }
    id v37 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v38 = -[UILabel _materializedAttributedString](self);
    uint64_t v27 = (void *)[v37 initWithAttributedString:v38];

    [v4 encodeObject:v27 forKey:@"UIAttributedText"];
  }

LABEL_43:
  [(UILabel *)self minimumScaleFactor];
  if (v39 != 0.0)
  {
    [(UILabel *)self minimumScaleFactor];
    *(float *)&double v40 = v40;
    [v4 encodeFloat:@"UIMinimumScaleFactor" forKey:v40];
  }
  if ([(UILabel *)self adjustsLetterSpacingToFitWidth]) {
    [v4 encodeBool:1 forKey:@"UIAdjustsLetterSpacingToFit"];
  }
  double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  if (preferredMaxLayoutWidth > 0.0)
  {
    *(float *)&double preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    [v4 encodeFloat:@"UIPreferredMaxLayoutWidth" forKey:preferredMaxLayoutWidth];
  }
  p_$E628185296FB360B9F692E5749A23446 textLabelFlags = &self->_textLabelFlags;
  [v4 encodeBool:(*(unint64_t *)p_textLabelFlags >> 19) & 1 forKey:@"UIDisableUpdateTextColorOnTraitCollectionChange"];
  if ((*((unsigned char *)p_textLabelFlags + 4) & 0x40) != 0) {
    [v4 encodeInteger:1 forKey:@"UILetterformAwareSizingRule"];
  }
}

- (id)_verticalTextLayoutManager
{
  id v1 = objc_getAssociatedObject(a1, &kTextLayoutManagerKey);
  return v1;
}

- (CGRect)_drawingRectForBounds:(CGRect)a3
{
  double v4 = -[UILabel _sizingRuleAdjustedBoundsForBounds:](self, a3.origin.x);
  [(UILabel *)self _drawTextInRect:1 baselineCalculationOnly:v4];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_tightBoundingRectOfFirstLine
{
  [(UIView *)self bounds];
  if (self)
  {
    double v7 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 1, 1, 0, 0, v3, v4, v5, v6);
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.CGFloat y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_tightBoundingRect
{
  [(UIView *)self bounds];
  if (self)
  {
    double v7 = -[UILabel _drawTextInRect:baselineCalculationOnly:returningDeviceMetricsOfFirstLine:returningMultilineDeviceMetrics:forceMultiline:]((uint64_t)self, 1, 0, 1u, 0, v3, v4, v5, v6);
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.CGFloat y = v8;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)_insetRect:(CGRect)a3 forAttributedString:(id)a4 withDefaultFont:(id)a5 inView:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [v13 string];
  uint64_t v17 = +[UILabel _tooBigChars]();
  uint64_t v18 = [v16 rangeOfCharacterFromSet:v17];

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v19 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)a1, v13, v14, v15);
    double x = x + v20;
    double width = width - (v21 + v20);
    double y = y + v19;
    double height = height - (v19 + v22);
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)_setFallbackTextColor:(id)a3 forUserInterfaceStyle:(int64_t)a4
{
  id v10 = a3;
  fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
  if (!fallbackColorsForUserInterfaceStyle)
  {
    double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v8 = self->_fallbackColorsForUserInterfaceStyle;
    self->_fallbackColorsForUserInterfaceStyle = v7;

    fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
  }
  double v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)fallbackColorsForUserInterfaceStyle setObject:v10 forKey:v9];

  [(UILabel *)self _updateTextColorWithFallbackColorIfNeeded];
}

- (void)setPreferredVibrancy:(UILabelVibrancy)preferredVibrancy
{
  if (self->_preferredVibrancy != preferredVibrancy)
  {
    self->_preferredVibrancdouble y = preferredVibrancy;
    if (preferredVibrancy == UILabelVibrancyNone)
    {
      uint64_t v3 = 1;
      goto LABEL_5;
    }
    if (preferredVibrancy == UILabelVibrancyAutomatic)
    {
      uint64_t v3 = 2;
LABEL_5:
      [(UIView *)self _setOverrideUserInterfaceRenderingMode:v3];
    }
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return (*(unsigned char *)&self->_textLabelFlags >> 1) & 1;
}

- (double)_actualScaleFactor
{
  [(UIView *)self bounds];
  -[UILabel _updateScaledMetricsForRect:]((uint64_t)self, v3, v4, v5, v6);
  scaledMetrics = self->_scaledMetrics;
  if (scaledMetrics) {
    return scaledMetrics->_actualScaleFactor;
  }
  else {
    return 1.0;
  }
}

- (void)_setAssociatedScalingLabel:(id)a3
{
  id value = a3;
  id v4 = [(UILabel *)self _associatedScalingLabel];

  double v5 = value;
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kAssociatedScalingLabelKey, value, (void *)1);
    [(UILabel *)self setNeedsDisplay];
    double v5 = value;
  }
}

- (double)_minimumFontSize
{
  double minimumFontSize = self->_minimumFontSize;
  if (minimumFontSize <= 0.0)
  {
    id v4 = [(UILabel *)self font];
    [v4 pointSize];
    double v6 = v5;
    [(_UILabelImplProtocol *)self->__impl minimumScaleFactor];
    double minimumFontSize = round(v6 * v7 * 4.0) * 0.25;
  }
  return minimumFontSize;
}

- (CGFloat)minimumScaleFactor
{
  if (!self) {
    return 0.0;
  }
  [(_UILabelImplProtocol *)self->__impl minimumScaleFactor];
  return result;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  objc_super v2 = [(UILabel *)self _content];
  double v3 = [v2 paragraphStyle];
  char v4 = [v3 allowsDefaultTighteningForTruncation];

  return v4;
}

- (BOOL)enablesMarqueeWhenAncestorFocused
{
  return *((unsigned char *)&self->_textLabelFlags + 1) & 1;
}

- (void)setEnablesMarqueeWhenAncestorFocused:(BOOL)enablesMarqueeWhenAncestorFocused
{
  if (((((*(void *)&self->_textLabelFlags & 0x100) == 0) ^ enablesMarqueeWhenAncestorFocused) & 1) == 0)
  {
    uint64_t v4 = 256;
    if (!enablesMarqueeWhenAncestorFocused) {
      uint64_t v4 = 0;
    }
    p_$E628185296FB360B9F692E5749A23446 textLabelFlags = &self->_textLabelFlags;
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFEFFLL | v4);
    -[UILabel setMarqueeEnabled:](self, "setMarqueeEnabled:");
    if ((*((unsigned char *)p_textLabelFlags + 3) & 0x10) != 0)
    {
      double v6 = [(UIView *)self layer];
      [v6 invalidateContentInsets];
    }
    double v7 = [(UIView *)self layer];
    [v7 setNeedsLayout];

    -[UILabel _runMarqueeIfEnabledAndAncestorIsFocused](self);
  }
}

- (BOOL)showsExpansionTextWhenTruncated
{
  return *((unsigned char *)&self->_textLabelFlags + 4) & 1;
}

- (void)_setExtremeSizingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UILabel *)self _isExtremeSizingEnabled] != a3)
  {
    uint64_t v5 = 0x2000000000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFDFFFFFFFFFLL | v5);
    [(UILabel *)self invalidateIntrinsicContentSize];
    if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      double v6 = [(UIView *)self layer];
      [v6 setOversizeEdgesIncludedInLabelLayer:5];

      if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
      {
        id v7 = [(UIView *)self layer];
        [v7 invalidateContentInsets];
      }
    }
  }
}

- (BOOL)_isExtremeSizingEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 4) >> 5) & 1;
}

- (void)setSizingRule:(int64_t)a3
{
  if ([(UILabel *)self sizingRule] != a3)
  {
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a3 == 1) << 38));
    [(UILabel *)self invalidateIntrinsicContentSize];
    if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      uint64_t v5 = [(UIView *)self layer];
      [v5 setOversizeEdgesIncludedInLabelLayer:15];

      if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
      {
        id v6 = [(UIView *)self layer];
        [v6 invalidateContentInsets];
      }
    }
  }
}

- (int64_t)sizingRule
{
  return (*(void *)&self->_textLabelFlags >> 38) & 1;
}

void __69__UILabel__contentAdjustingFontForTypesettingLanguage_didAdjustFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = a2;
  id v7 = [v18 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  double v8 = v7;
  if (v7)
  {
    double v9 = v7;
  }
  else
  {
    double v9 = [v18 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  id v10 = v9;

  uint64_t v11 = -[UIFont _fontAdjustedForTypesettingLanguage:](v10, *(void **)(a1 + 32));
  double v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([(__CTFont *)v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v14 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(void *)off_1E52D2040, v12, a3, a4);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    int v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = *(unsigned char **)(a1 + 48);
    if (v17) {
      *uint64_t v17 = 1;
    }
  }
}

void __89__UILabel__contentAdjustingFontForTypesettingLanguageAwareLineHeightRatio_didAdjustFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = a2;
  id v7 = [v18 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  double v8 = v7;
  if (v7)
  {
    double v9 = v7;
  }
  else
  {
    double v9 = [v18 objectForKeyedSubscript:*(void *)off_1E52D2040];
  }
  id v10 = v9;

  uint64_t v11 = -[UIFont _fontAdjustedForTypesettingLanguageAwareLineHeightRatio:](v10, *(double *)(a1 + 40));
  double v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && ([(__CTFont *)v10 isEqual:v11] & 1) == 0)
  {
    uint64_t v14 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "contentByApplyingAttribute:value:toRange:", *(void *)off_1E52D2040, v12, a3, a4);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    int v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = *(unsigned char **)(a1 + 48);
    if (v17) {
      *uint64_t v17 = 1;
    }
  }
}

- (CGSize)shadowOffset
{
  objc_super v2 = -[UILabel _shadow](self);
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setShadowBlur:(double)a3
{
  double v5 = -[UILabel _shadow](self);
  id v7 = (id)[v5 copy];

  [v7 shadowBlurRadius];
  if (v6 != a3 || dyld_program_sdk_at_least())
  {
    [v7 setShadowBlurRadius:a3];
    -[UILabel _setShadow:](self, v7);
  }
}

- (double)shadowBlur
{
  objc_super v2 = -[UILabel _shadow](self);
  [v2 shadowBlurRadius];
  double v4 = v3;

  return v4;
}

void __26__UILabel_setLineSpacing___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (double)*(uint64_t *)(*(void *)(a1 + 32) + 592);
  id v4 = a2;
  [v4 setMinimumLineHeight:v3];
  [v4 setMaximumLineHeight:(double)*(uint64_t *)(*(void *)(a1 + 32) + 592)];
}

- (void)_setHyphenationFactorIgnoredIfURLsDetected:(void *)result
{
  if (result)
  {
    objc_super v2 = result;
    if (((((result[92] & 0x4000000) == 0) ^ a2) & 1) == 0)
    {
      uint64_t v3 = 0x4000000;
      if (!a2) {
        uint64_t v3 = 0;
      }
      result[92] = result[92] & 0xFFFFFFFFFBFFFFFFLL | v3;
      -[UILabel _invalidateLabelDisplay](result);
      return (void *)[v2 _invalidateLabelSize];
    }
  }
  return result;
}

- (BOOL)adjustsLetterSpacingToFitWidth
{
  return (*(unsigned char *)&self->_textLabelFlags >> 3) & 1;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if (self)
  {
    v4.receiver = self;
    v4.super_class = (Class)UILabel;
    [(UIView *)&v4 setNeedsDisplay];
  }
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  if (((((*(void *)&self->_textLabelFlags & 0x4000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v3 = 0x4000;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFBFFFLL | v3);
    v4.receiver = self;
    v4.super_class = (Class)UILabel;
    [(UIView *)&v4 setNeedsDisplay];
  }
}

- (BOOL)_drawsDebugBaselines
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 6) & 1;
}

- (UIBaselineAdjustment)baselineAdjustment
{
  return (*(void *)&self->_textLabelFlags >> 4) & 3;
}

- (void)_updateTextColorWithFallbackColorIfNeeded
{
  id v8 = [(UILabel *)self _visualStyle];
  if ([v8 updatesTextColorOnUserInterfaceStyleChanges])
  {
    $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;

    if ((*(_DWORD *)&textLabelFlags & 0x80000) != 0) {
      return;
    }
    id v8 = [(UIView *)self traitCollection];
    uint64_t v4 = [v8 userInterfaceStyle];
    fallbackColorsForUserInterfaceStyle = self->_fallbackColorsForUserInterfaceStyle;
    double v6 = [NSNumber numberWithInteger:v4];
    id v7 = [(NSMutableDictionary *)fallbackColorsForUserInterfaceStyle objectForKey:v6];

    [(UILabel *)self _setTextColor:v7];
  }
}

void __36__UILabel__intrinsicSizeWithinSize___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  strncpy((char *)&v8, Name, 0x18uLL);
  *(_DWORD *)a2 = 93;
  double v6 = *(void **)(a1 + 32);
  *(void *)(a2 + 8) = v6;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v9;
  *(_DWORD *)(a2 + 40) = 94;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v6;
  id v7 = [v6 superview];
  *(void *)(a2 + 72) = v7;
}

- (void)_setMultilineLabelRequiresCarefulMeasurement:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

uint64_t __26__UILabel_drawTextInRect___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMarqueeIfNecessary];
}

- (id)_delegate
{
  return objc_getAssociatedObject(self, &kLabelDelegateKey);
}

- (void)_setDelegate:(id)a3
{
  id value = a3;
  id v4 = [(UILabel *)self _delegate];

  if (v4 != value)
  {
    objc_setAssociatedObject(self, &kLabelDelegateKey, value, (void *)1);
    char v5 = objc_opt_respondsToSelector();
    uint64_t v6 = 0x40000000000;
    if ((v5 & 1) == 0) {
      uint64_t v6 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFBFFFFFFFFFFLL | v6);
    char v7 = objc_opt_respondsToSelector();
    uint64_t v8 = 0x80000000000;
    if ((v7 & 1) == 0) {
      uint64_t v8 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFF7FFFFFFFFFFLL | v8);
  }
}

- (void)_markGlyphPathBoundsClippingDetected:(double)a3 glyphPathBounds:(double)a4 availableBounds:(double)a5
{
  id v19 = a2;
  double v20 = [a1 _glyphPathBoundsIntersectionData];
  if (!v20) {
    double v20 = objc_alloc_init(_UIGlyphPathBoundsIntersectionViewData);
  }
  id value = v20;
  -[_UIGlyphPathBoundsIntersectionViewData setGlyphPathBounds:](v20, "setGlyphPathBounds:", a3, a4, a5, a6);
  [(_UIGlyphPathBoundsIntersectionViewData *)value setClippingView:v19];

  -[_UIGlyphPathBoundsIntersectionViewData setAvailableBounds:](value, "setAvailableBounds:", a7, a8, a9, a10);
  objc_setAssociatedObject(a1, &_UIGylphPathBoundsClippingAssociationKey, value, (void *)1);
}

- (BOOL)_glyphPathBoundsClippingDetected
{
  objc_super v2 = [(UILabel *)self _glyphPathBoundsIntersectionData];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 clippingView];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (_UIGlyphPathBoundsIntersectionViewData)_glyphPathBoundsIntersectionData
{
  return (_UIGlyphPathBoundsIntersectionViewData *)objc_getAssociatedObject(self, &_UIGylphPathBoundsClippingAssociationKey);
}

- (BOOL)_clipsGlyphPathFrame:(CGRect)a3 shouldContinueSuperviewTraversal:(BOOL *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UILabel;
  BOOL v5 = -[UIView _clipsGlyphPathFrame:shouldContinueSuperviewTraversal:](&v7, sel__clipsGlyphPathFrame_shouldContinueSuperviewTraversal_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5) {
    *a4 = 0;
  }
  return v5;
}

- (void)setMarqueeRepeatCount:(unint64_t)a3
{
  self->_marqueeRepeatCount = a3;
}

- (void)setMarqueeLoopPadding:(double)a3
{
  self->_marqueeLoopPadding = a3;
}

- (void)_setMarqueeUpdatable:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (id)_siblingMarqueeLabels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [a1 superview];
  id v4 = [v3 subviews];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (~*(_DWORD *)(v10 + 736) & 0xA00) == 0) {
          objc_msgSend(v2, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v2;
}

- (double)_maximumMarqueeTextWidth
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = -[UILabel _siblingMarqueeLabels](a1);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    double v5 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "textSizeForWidth:", 3.40282347e38, (void)v9);
        if (v7 > v5) {
          double v5 = v7;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)_drawFullMarqueeTextInRect:(CGRect)a3
{
}

void __24__UILabel__startMarquee__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) backgroundColor];
  if (v8)
  {
    [v8 set];
    UIRectFillUsingOperation(1, 0.0, 0.0, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  }
  if (*(unsigned char *)(a1 + 136)) {
    double v2 = *(double *)(a1 + 40) - *(double *)(a1 + 56);
  }
  else {
    double v2 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_drawFullMarqueeTextInRect:", v2 - *(double *)(a1 + 72), -*(double *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 128));
  if (*(unsigned char *)(a1 + 136))
  {
    double v3 = *(double *)(a1 + 40) - *(double *)(a1 + 56);
    [*(id *)(a1 + 32) marqueeLoopPadding];
    double v5 = v3 - v4 - *(double *)(a1 + 56);
  }
  else
  {
    double v6 = *(double *)(a1 + 56);
    [*(id *)(a1 + 32) marqueeLoopPadding];
    double v5 = v6 + v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_drawFullMarqueeTextInRect:", v5 - *(double *)(a1 + 72), -*(double *)(a1 + 64), *(double *)(a1 + 96), *(double *)(a1 + 128));
}

- (_UILabelMarqueeAnimationDelegate)_marqueeAnimationDelegate
{
  objc_getAssociatedObject(a1, &__marqueeAnimationDelegateKey);
  double v2 = (_UILabelMarqueeAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    double v2 = [[_UILabelMarqueeAnimationDelegate alloc] initWithLabel:a1];
    objc_setAssociatedObject(a1, &__marqueeAnimationDelegateKey, v2, (void *)1);
  }
  return v2;
}

- (void)_startMarqueeIfNecessary
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 _backlightLuminance];

  if (v4 != 1 && (~*(_DWORD *)&self->_textLabelFlags & 0xE00) == 0)
  {
    double v5 = [(UILabel *)self text];
    int v6 = [v5 _isNaturallyRTL];

    [(UIView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v159 = v11;
    double v14 = v13;
    double v153 = v13;
    [(UILabel *)self _contentInsetsFromFonts];
    double v16 = v15;
    double v18 = v17;
    double v146 = v19;
    double v148 = v20;
    double v21 = v17 + v20;
    double v22 = v14 - (v15 + v19);
    double v23 = v12 - (v17 + v20);
    -[UILabel textSizeForWidth:](self, "textSizeForWidth:");
    double v144 = v24;
    double v25 = v24 - v21;
    double v26 = v24 - v21 + v23;
    [(UILabel *)self marqueeLoopPadding];
    double v28 = v27 + v26;
    os_variant_has_internal_diagnostics();
    uint64_t v29 = +[UITraitCollection _currentTraitCollectionIfExists]();
    uint64_t v30 = [(UIView *)self traitCollection];
    +[UITraitCollection setCurrentTraitCollection:v30];

    id v31 = (void *)_UISetCurrentFallbackEnvironment(self);
    long long v32 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v28, v22);
    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = __24__UILabel__startMarquee__block_invoke;
    v163[3] = &unk_1E530EE10;
    v163[4] = self;
    *(double *)&v163[5] = v28;
    *(double *)&v163[6] = v22;
    double v157 = v22;
    char v164 = v6;
    double v136 = v25;
    *(double *)&v163[7] = v25;
    *(double *)&v163[8] = v16;
    double v161 = v18;
    *(double *)&v163[9] = v18;
    *(double *)&v163[10] = v146;
    *(double *)&v163[11] = v148;
    *(double *)&v163[12] = v144;
    *(double *)&v163[13] = v8;
    *(double *)&v163[14] = v10;
    *(double *)&v163[15] = v159;
    *(double *)&v163[16] = v153;
    v145 = v32;
    uint64_t v33 = [(UIGraphicsImageRenderer *)v32 imageWithActions:v163];
    _UIRestorePreviousFallbackEnvironment(v31);
    v147 = (void *)v29;
    +[UITraitCollection setCurrentTraitCollection:v29];
    id v34 = [(UIView *)self viewWithTag:4032914800];
    if (v34)
    {
      uint64_t v35 = v34;
      [(UIView *)v34 setAlpha:1.0];
      [(UIImageView *)v35 setImage:v33];
    }
    else
    {
      uint64_t v35 = [[UIImageView alloc] initWithImage:v33];
      [(UIView *)v35 setTag:4032914800];
      [(UIView *)self addSubview:v35];
    }
    -[UIImageView setFrame:](v35, "setFrame:", v8 + v18, v10 + v16, v23, v22);
    double v150 = v28;
    double v36 = v23 / v28;
    id v37 = [(UIView *)v35 layer];
    objc_msgSend(v37, "setContentsRect:", 0.0, 0.0, v23 / v28, 1.0);

    uint64_t v38 = self;
    [(UILabel *)v38 textSizeForWidth:3.40282347e38];
    double v40 = v39;
    [(UILabel *)v38 marqueeLoopPadding];
    double v42 = (v40 + v41) / 30.0;
    double v43 = -[UILabel _maximumMarqueeTextWidth](v38);
    [(UILabel *)v38 marqueeLoopPadding];
    double v45 = v44;

    double v141 = (v43 + v45) / 30.0 - v42 + 0.0;
    double v46 = v42 + 1.5 + v141;
    unint64_t v47 = [(UILabel *)v38 marqueeRepeatCount];
    if (v47) {
      float v48 = (float)v47;
    }
    else {
      float v48 = 3.4028e38;
    }
    double v49 = CACurrentMediaTime();
    double v50 = v49 + 0.0;
    v143 = (void *)v33;
    if ((*((unsigned char *)&self->_textLabelFlags + 1) & 0x10) != 0)
    {
      uint64_t v53 = [(UIView *)v35 layer];
      id v54 = [v53 animationForKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];

      [v54 beginTime];
      double v52 = v55;
      double v56 = -[UILabel _marqueeAnimationDelegate](v38);
      [v56 setSuppressEnded:1];

      CGSize v57 = [(UIView *)v35 layer];
      [v57 removeAnimationForKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];

      [v54 duration];
      if (v58 >= v46) {
        double v46 = v58;
      }
      id v59 = [(UIView *)v35 layer];
      double v60 = [v59 mask];

      double v61 = [v60 animationForKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];

      [v61 beginTime];
      double v51 = v62;
      [v60 removeAnimationForKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];
      uint64_t v63 = [v60 animationForKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];
      [v61 beginTime];
      double v139 = v64;
      [v60 removeAnimationForKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];
    }
    else
    {
      double v139 = v49 + 0.0;
      double v51 = v49 + 0.0;
      double v52 = v49 + 0.0;
    }
    double v65 = v161;
    uint64_t v66 = objc_opt_new();
    marqueeAnimations = v38->_marqueeAnimations;
    v38->_marqueeAnimations = (NSMutableDictionary *)v66;

    uint64_t v68 = objc_opt_new();
    marqueeMaskAnimations = v38->_marqueeMaskAnimations;
    v38->_marqueeMaskAnimations = (NSMutableDictionary *)v68;

    id v70 = [(UIView *)v35 layer];
    id v71 = [v70 mask];

    uint64_t v72 = [(UIView *)v35 layer];
    uint64_t v73 = [v72 mask];

    if (!v73)
    {
      double v74 = +[UIImage kitImageNamed:@"UILabelMarqueeMask.png"];
      [v74 size];
      double v75 = v51;
      double v77 = 1.0 / v76;
      double v78 = [MEMORY[0x1E4F39BE8] layer];

      id v79 = v74;
      objc_msgSend(v78, "setContents:", objc_msgSend(v79, "CGImage"));
      double v80 = 0.5 - v77 * 0.5;
      double v81 = v77;
      double v51 = v75;
      double v65 = v161;
      objc_msgSend(v78, "setContentsCenter:", v80, 0.0, v81, 1.0);
      [v79 scale];
      objc_msgSend(v78, "setContentsScale:");
      objc_msgSend(v78, "setFrame:", -v161, 0.0, v159, v157);
      uint64_t v82 = [(UIView *)v35 layer];
      [v82 setMask:v78];

      id v71 = v78;
    }
    v154 = v35;
    if (v6)
    {
      double v83 = 1.0 - v36;
    }
    else
    {
      [(UILabel *)v38 marqueeLoopPadding];
      double v83 = (v136 + v84) / v150;
    }
    uint64_t v85 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"contentsRect.origin.x"];
    [v85 setBeginTime:v52];
    [v85 setDuration:v46];
    *(float *)&double v86 = v48;
    [v85 setRepeatCount:v86];
    uint64_t v152 = v85;
    obuint64_t j = (id)*MEMORY[0x1E4F39FA0];
    objc_msgSend(v85, "setFillMode:");
    v173[0] = &unk_1ED3F7338;
    v173[1] = &unk_1ED3F7338;
    id v87 = [NSNumber numberWithDouble:v83];
    v173[2] = v87;
    char v88 = [NSNumber numberWithDouble:v83];
    v173[3] = v88;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:4];

    p_isa = (id *)&v38->super.super.super.isa;
    v151 = v71;
    if (v6)
    {
      uint64_t v90 = [v89 reverseObjectEnumerator];
      uint64_t v91 = [v90 allObjects];

      double v137 = v65;
      v89 = (void *)v91;
      double v92 = v148;
    }
    else
    {
      double v137 = 8.0;
      double v92 = v65;
    }
    CGSize v149 = v89;
    [v152 setValues:v89];
    v172[0] = &unk_1ED3F28C8;
    __int16 v93 = [NSNumber numberWithDouble:1.5 / v46];
    v172[1] = v93;
    uint64_t v94 = [NSNumber numberWithDouble:1.0 - v141 / v46];
    v172[2] = v94;
    v172[3] = &unk_1ED3F28D8;
    double v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:4];
    [v152 setKeyTimes:v95];

    uint64_t v96 = v38;
    uint64_t v97 = -[UILabel _marqueeAnimationDelegate](v38);
    [v152 setDelegate:v97];

    [(NSMutableDictionary *)v38->_marqueeAnimations setObject:v152 forKeyedSubscript:@"UILabelMarqueeLayerContentOriginXAnimationKey"];
    uint64_t v98 = [(UIView *)v35 layer];
    [v98 addAnimation:v152 forKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];

    uint64_t v99 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
    [v99 setBeginTime:v51];
    [v99 setDuration:v46];
    *(float *)&double v100 = v48;
    [v99 setRepeatCount:v100];
    [v99 setFillMode:obj];
    uint64_t v101 = [NSNumber numberWithDouble:v159 - v92 + 8.0];
    uint64_t v102 = [NSNumber numberWithDouble:v159];
    v171[0] = v101;
    v171[1] = v101;
    v171[2] = v102;
    v171[3] = v102;
    v171[4] = v101;
    v171[5] = v101;
    double v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:6];
    [v99 setValues:v103];

    v170[0] = &unk_1ED3F28C8;
    double v104 = [NSNumber numberWithDouble:1.5 / v46];
    v170[1] = v104;
    uint64_t v105 = [NSNumber numberWithDouble:1.76666667 / v46];
    v170[2] = v105;
    double v106 = [NSNumber numberWithDouble:1.0 - (v141 + 0.266666667) / v46];
    v170[3] = v106;
    v107 = [NSNumber numberWithDouble:1.0 - v141 / v46];
    v170[4] = v107;
    v170[5] = &unk_1ED3F28D8;
    v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:6];
    [v99 setKeyTimes:v108];

    char v109 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
    [v109 setBeginTime:v139];
    [v109 setDuration:v46];
    [v109 setFillMode:obj];
    *(float *)&double v110 = v48;
    [v109 setRepeatCount:v110];
    v111 = NSNumber;
    double v140 = v101;
    [v101 floatValue];
    double v113 = [v111 numberWithDouble:v112 * 0.5 - v137];
    double v114 = NSNumber;
    v138 = v102;
    [v102 floatValue];
    uint64_t v116 = [v114 numberWithDouble:v115 * 0.5 - v161];
    v169[0] = v113;
    v169[1] = v113;
    v169[2] = v116;
    v169[3] = v116;
    uint64_t v135 = (void *)v116;
    v169[4] = v113;
    v169[5] = v113;
    double v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:6];
    [v109 setValues:v117];

    double v118 = [v99 keyTimes];
    [v109 setKeyTimes:v118];

    v119 = v151;
    [v151 addAnimation:v99 forKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];
    double v142 = v99;
    [p_isa[84] setObject:v99 forKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];
    [v151 addAnimation:v109 forKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];
    [p_isa[84] setObject:v109 forKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];
    $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
    if ((*(_DWORD *)&textLabelFlags & 0x10000000) != 0)
    {
      double v121 = [p_isa layer];
      [v121 _clearContents];

      $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
    }
    if ((*(_WORD *)&textLabelFlags & 0x1000) == 0)
    {
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      -[UILabel _siblingMarqueeLabels](p_isa);
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v162 = [obja countByEnumeratingWithState:&v165 objects:v174 count:16];
      if (v162)
      {
        uint64_t v160 = *(void *)v166;
        do
        {
          for (uint64_t i = 0; i != v162; ++i)
          {
            if (*(void *)v166 != v160) {
              objc_enumerationMutation(obja);
            }
            double v123 = *(UILabel **)(*((void *)&v165 + 1) + 8 * i);
            if (v123 != v96)
            {
              double v124 = [(UIView *)v123 viewWithTag:4032914800];
              double v125 = [v124 layer];
              double v126 = [v125 mask];

              v127 = [v124 layer];
              v128 = [v127 animationForKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];
              v129 = (void *)[v128 copy];

              v130 = [v126 animationForKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];
              uint64_t v131 = (void *)[v130 copy];

              double v132 = [v126 animationForKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];
              v133 = (void *)[v132 copy];

              [v129 setBeginTime:v50];
              [v131 setBeginTime:v50];
              [v133 setBeginTime:v50];
              v134 = [v124 layer];
              [v134 addAnimation:v129 forKey:@"UILabelMarqueeLayerContentOriginXAnimationKey"];

              [v126 addAnimation:v131 forKey:@"UILabelMarqueeMaskLayerWidthAnimationKey"];
              [v126 addAnimation:v133 forKey:@"UILabelMarqueeMaskLayerPositionXAnimationKey"];

              uint64_t v96 = (UILabel *)p_isa;
            }
          }
          uint64_t v162 = [obja countByEnumeratingWithState:&v165 objects:v174 count:16];
        }
        while (v162);
      }

      v119 = v151;
    }
  }
}

uint64_t __35__UILabel__applyBacklightLuminance__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)_stopMarqueeWithRedisplay:(BOOL)a3
{
  BOOL v3 = a3;
  marqueeAnimations = self->_marqueeAnimations;
  self->_marqueeAnimations = 0;

  marqueeMaskAnimations = self->_marqueeMaskAnimations;
  self->_marqueeMaskAnimations = 0;

  double v7 = [(UIView *)self viewWithTag:4032914800];
  double v8 = v7;
  if (v7)
  {
    [v7 removeFromSuperview];
    if (v3)
    {
      v9.receiver = self;
      v9.super_class = (Class)UILabel;
      [(UIView *)&v9 setNeedsDisplay];
    }
  }
}

- (BOOL)marqueeRunning
{
  double v2 = [(UIView *)self viewWithTag:4032914800];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)marqueeEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 1) & 1;
}

- (unint64_t)marqueeRepeatCount
{
  return self->_marqueeRepeatCount;
}

- (double)marqueeLoopPadding
{
  return self->_marqueeLoopPadding;
}

- (BOOL)_isMarqueeUpdatable
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 1) >> 4) & 1;
}

- (void)setMarqueeRunning:(BOOL)a3
{
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFFFFFFFFFBFFLL | v4);
  if (a3)
  {
    [(UILabel *)self _startMarqueeIfNecessary];
  }
  else if ([(UILabel *)self marqueeRunning])
  {
    [(UILabel *)self _stopMarqueeWithRedisplay:1];
  }
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 nextFocusedView];
  BOOL v9 = v8
    && [(UIView *)self isDescendantOfView:v8]
    && [(UIView *)self _tracksFocusedAncestors];
  [(UILabel *)self setMarqueeRunning:v9];
  v10.receiver = self;
  v10.super_class = (Class)UILabel;
  [(UIView *)&v10 _ancestorWillUpdateFocusInContext:v7 withAnimationCoordinator:v6];
}

- (void)setDrawsUnderline:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UILabel *)self _content];
  uint64_t v6 = *(void *)off_1E52D23E8;
  id v10 = v5;
  id v7 = [v5 defaultValueForAttribute:*(void *)off_1E52D23E8];
  if ((((([v7 integerValue] & 1) == 0) ^ v3) & 1) == 0)
  {
    double v8 = [NSNumber numberWithInteger:v3];
    BOOL v9 = [v10 contentByApplyingAttributeToEntireRange:v6 value:v8];
    [(UILabel *)self _setContent:v9];
  }
}

- (BOOL)drawsUnderline
{
  if (self)
  {
    double v2 = [(UILabel *)self _content];
    BOOL v3 = [v2 defaultValueForAttribute:*(void *)off_1E52D23E8];

    if (v3) {
      BOOL v4 = [v3 integerValue] & 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x20000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFFDFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setNeedsDisplay];
  }
}

- (BOOL)_usesSimpleTextEffects
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 1) & 1;
}

- (void)_setTextAlignmentMirrored:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x200000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x200000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFFFFFDFFFFFLL | v4);
    v5.receiver = self;
    v5.super_class = (Class)UILabel;
    [(UIView *)&v5 setNeedsDisplay];
  }
}

- (id)_tightBoundingBoxLayoutGuide
{
  v19[4] = *MEMORY[0x1E4F143B8];
  -[UILabel __tightBoundingBoxLayoutGuide](self);
  BOOL v3 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    BOOL v3 = objc_alloc_init(UILayoutGuide);
    [(UIView *)self addLayoutGuide:v3];
    [(UILayoutGuide *)v3 _setLockedToOwningView:1];
    [(UILayoutGuide *)v3 _setAllowsNegativeDimensions:1];
    [(UILayoutGuide *)v3 setIdentifier:@"UILabelTightBoundingBoxLayoutGuide"];
    uint64_t v4 = [(UIView *)self _frameLayoutItem];
    objc_super v5 = [(UILayoutGuide *)v3 topAnchor];
    uint64_t v6 = [v4 topAnchor];
    id v7 = [v5 constraintEqualToAnchor:v6 constant:0.0];

    double v8 = [(UILayoutGuide *)v3 leftAnchor];
    BOOL v9 = [v4 leftAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];

    double v11 = [v4 bottomAnchor];
    double v12 = [(UILayoutGuide *)v3 bottomAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];

    double v14 = [v4 rightAnchor];
    double v15 = [(UILayoutGuide *)v3 rightAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];

    [v7 setIdentifier:@"UILabelTightBoundingBoxLayoutGuide-top"];
    [v10 setIdentifier:@"UILabelTightBoundingBoxLayoutGuide-left"];
    [v13 setIdentifier:@"UILabelTightBoundingBoxLayoutGuide-bottom"];
    [v16 setIdentifier:@"UILabelTightBoundingBoxLayoutGuide-right"];
    v19[0] = v7;
    v19[1] = v10;
    v19[2] = v13;
    v19[3] = v16;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    [(UILayoutGuide *)v3 _setSystemConstraints:v17];
    -[UILabel _updateTightBoundingBoxLayoutGuideConstraintsIfNecessary](self);
    [MEMORY[0x1E4F5B268] activateConstraints:v17];
    if (self) {
      objc_setAssociatedObject(self, &kTightBoudingBoxLayoutGuideKey, v3, (void *)1);
    }
  }
  return v3;
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  id v3 = [(UIView *)self layer];
  [v3 setSpeed:0.0];
  [v3 setTimeOffset:CACurrentMediaTime()];
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = [(UIView *)self layer];
  LODWORD(v3) = 1.0;
  [v4 setSpeed:v3];
  [v4 setTimeOffset:0.0];
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedColor;
}

- (UIFont)_fontForShortcutBaselineCalculation
{
  return self->_fontForShortcutBaselineCalculation;
}

- (UILabelVibrancy)preferredVibrancy
{
  return self->_preferredVibrancy;
}

- (_UILabelConfiguration)_configuration
{
  return self->__configuration;
}

- (void)_setConfiguration:(id)a3
{
}

- (_UIIntelligenceLightSourceDescriptor)_lightSourceDescriptor
{
  return self->_lightSourceDescriptor;
}

- (void)_setLightSourceDescriptor:(id)a3
{
  objc_super v5 = (_UIIntelligenceLightSourceDescriptor *)a3;
  if (self->_lightSourceDescriptor != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_lightSourceDescriptor, a3);
    [(UILabel *)self _removeLightSourceView];
    objc_super v5 = v7;
    if (v7)
    {
      [(UILabel *)self _addLightSourceView];
      objc_super v5 = v7;
    }
    if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      uint64_t v6 = [(UIView *)self layer];
      [v6 reactToLightChanged];

      objc_super v5 = v7;
    }
  }
}

- (void)_addLightSourceView
{
  v35[8] = *MEMORY[0x1E4F143B8];
  if (self->_lightSourceDescriptor)
  {
    double v3 = (UIView *)objc_opt_new();
    lightContainerView = self->_lightContainerView;
    self->_lightContainerView = v3;

    [(UIView *)self->_lightContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self addSubview:self->_lightContainerView];
    lightSourceDescriptor = self->_lightSourceDescriptor;
    [(UIView *)self frame];
    uint64_t v6 = -[_UIIntelligenceLightSourceDescriptor _createLightSourceViewWithFrame:](lightSourceDescriptor, "_createLightSourceViewWithFrame:");
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_lightContainerView addSubview:v6];
    double v24 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v33 = [v6 topAnchor];
    long long v32 = [(UIView *)self->_lightContainerView topAnchor];
    id v31 = [v33 constraintEqualToAnchor:v32];
    v35[0] = v31;
    uint64_t v30 = [v6 leadingAnchor];
    uint64_t v29 = [(UIView *)self->_lightContainerView leadingAnchor];
    double v28 = [v30 constraintEqualToAnchor:v29];
    v35[1] = v28;
    double v27 = [v6 trailingAnchor];
    double v26 = [(UIView *)self->_lightContainerView trailingAnchor];
    double v25 = [v27 constraintEqualToAnchor:v26];
    v35[2] = v25;
    id v34 = v6;
    double v23 = [v6 bottomAnchor];
    double v22 = [(UIView *)self->_lightContainerView bottomAnchor];
    double v21 = [v23 constraintEqualToAnchor:v22];
    v35[3] = v21;
    double v20 = [(UIView *)self->_lightContainerView topAnchor];
    double v19 = [(UIView *)self topAnchor];
    double v18 = [v20 constraintEqualToAnchor:v19];
    v35[4] = v18;
    double v17 = [(UIView *)self->_lightContainerView leadingAnchor];
    double v16 = [(UIView *)self leadingAnchor];
    id v7 = [v17 constraintEqualToAnchor:v16];
    v35[5] = v7;
    double v8 = [(UIView *)self->_lightContainerView trailingAnchor];
    BOOL v9 = [(UIView *)self trailingAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    v35[6] = v10;
    double v11 = [(UIView *)self->_lightContainerView bottomAnchor];
    double v12 = [(UIView *)self bottomAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v35[7] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:8];
    [v24 activateConstraints:v14];

    if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
    {
      double v15 = [(UIView *)self layer];
      [v15 setLightContainerView:self->_lightContainerView];
    }
  }
}

- (void)_removeLightSourceView
{
  [(UIView *)self->_lightContainerView removeFromSuperview];
  lightContainerView = self->_lightContainerView;
  self->_lightContainerView = 0;

  if ((*((unsigned char *)&self->_textLabelFlags + 3) & 0x10) != 0)
  {
    id v4 = [(UIView *)self layer];
    [v4 setLightContainerView:0];
  }
}

uint64_t __124__UILabel_UILabel_Internal_IntelligenceLightSupport___addViewsForLabelViewTextAttachments_previousLabelViewTextAttachments___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

- (BOOL)_drawingLightReactiveLayer
{
  return *((unsigned char *)&self->_textLabelFlags + 5) & 1;
}

- (void)_setDrawingLightReactiveLayer:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)_drawingLightInertLayer
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 5) >> 1) & 1;
}

- (void)_setDrawingLightInertLayer:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&self->_textLabelFlags & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (double)_firstLineCapFrameOriginY
{
  [(UIView *)self frame];
  double v4 = v3;
  [(UILabel *)self _capOffsetFromBoundsTop];
  return v5 + v4;
}

- (double)_lastLineBaselineFrameOriginY
{
  [(UIView *)self frame];
  double v4 = v3;
  [(UILabel *)self _lastLineBaseline];
  return v5 + v4;
}

- (void)_setLastLineBaselineFrameOriginY:(double)a3
{
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self _lastLineBaseline];
  -[UILabel setFrame:](self, "setFrame:", v6, a3 - v11, v8, v10);
}

- (void)_setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x1000000000) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v4 = 0x1000000000;
    if (!a3) {
      uint64_t v4 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFFEFFFFFFFFFLL | v4);
    -[UILabel _adjustFontForTypesettingLanguage](self);
  }
}

- (void)_setVerticalTextEnabled:(BOOL)a3
{
  $E628185296FB360B9F692E5749A23446 textLabelFlags = self->_textLabelFlags;
  if (((((*(void *)&textLabelFlags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    double v5 = 0;
    uint64_t v6 = 0x8000000000;
    if (!a3) {
      uint64_t v6 = 0;
    }
    self->_$E628185296FB360B9F692E5749A23446 textLabelFlags = ($E628185296FB360B9F692E5749A23446)(*(void *)&textLabelFlags & 0xFFFFFF7FFFFFFFFFLL | v6);
    if (a3) {
      double v5 = [[_UILabelVerticalTextLayoutManager alloc] initWithConfiguration:self->_configuration];
    }
    double v7 = v5;
    objc_setAssociatedObject(self, &kTextLayoutManagerKey, v5, (void *)1);
    -[UILabel _invalidateLabelDisplay](self);
    [(UILabel *)self _invalidateLabelSize];
  }
}

- (BOOL)_verticalTextEnabled
{
  return *((unsigned __int8 *)&self->_textLabelFlags + 4) >> 7;
}

- (BOOL)_wantsUnderlineForAccessibilityButtonShapesEnabled
{
  return (*((unsigned __int8 *)&self->_textLabelFlags + 2) >> 2) & 1;
}

- (void)_resetUsesExplicitPreferredMaxLayoutWidth
{
  int v3 = [(UILabel *)self _needsDoubleUpdateConstraintsPass];
  *(void *)&self->_textLabelFlags &= ~0x2000uLL;
  self->_double preferredMaxLayoutWidth = 0.0;
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v3);
  [(UILabel *)self invalidateIntrinsicContentSize];
}

- (CGSize)textSizeForWidth:(double)a3
{
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, a3, 3.40282347e38);
  double v4 = v3;
  double v6 = v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)setRawSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)rawSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end