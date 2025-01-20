@interface NSLayoutManager
+ (BOOL)_ignoresViewTransformations;
+ (BOOL)_inBackgroundLayout;
+ (BOOL)_showsControlCharacters;
+ (BOOL)_showsInvisibleCharacters;
+ (BOOL)_usesScreenFonts;
+ (BOOL)supportsSecureCoding;
+ (id)_defaultLinkAttributes;
+ (id)_defaultLinkAttributesForLabel;
+ (void)_doSomeBackgroundLayout;
+ (void)initialize;
- (BOOL)_alwaysDrawsActive;
- (BOOL)_canDoLayout;
- (BOOL)_doOptimizedLayoutStartingAtGlyphIndex:(unint64_t)a3 forCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 lineLimit:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7;
- (BOOL)_drawsDebugBaselines;
- (BOOL)_drawsUnderlinesLikeWebKit;
- (BOOL)_forcesTrackingFloor;
- (BOOL)_hasSeenRightToLeft;
- (BOOL)_mirrorsTextAlignment;
- (BOOL)_needToFlushGlyph;
- (BOOL)allowsNonContiguousLayout;
- (BOOL)allowsOriginalFontMetricsOverride;
- (BOOL)backgroundColorProvidesOpaqueSurface;
- (BOOL)backgroundLayoutEnabled;
- (BOOL)drawsOutsideLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex;
- (BOOL)flipsIfNeeded;
- (BOOL)hasNonContiguousLayout;
- (BOOL)ignoresAntialiasThreshold;
- (BOOL)ignoresViewTransformations;
- (BOOL)isScrolling;
- (BOOL)isValidGlyphIndex:(NSUInteger)glyphIndex;
- (BOOL)limitsLayoutForSuspiciousContents;
- (BOOL)notShownAttributeForGlyphAtIndex:(NSUInteger)glyphIndex;
- (BOOL)showsControlCharacters;
- (BOOL)showsInvisibleCharacters;
- (BOOL)synchronizesAlignmentToDirection;
- (BOOL)usesDefaultHyphenation;
- (BOOL)usesFontLeading;
- (BOOL)usesScreenFonts;
- (CGFloat)defaultBaselineOffsetForFont:(NSFont *)theFont;
- (CGFloat)defaultLineHeightForFont:(NSFont *)theFont;
- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container;
- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex;
- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex isValidIndex:(BOOL *)isValidIndex;
- (CGPoint)locationForGlyphAtIndex:(NSUInteger)glyphIndex;
- (CGRect)_boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4 fast:(BOOL)a5 fullLineRectsOnly:(BOOL)a6;
- (CGRect)_currentAttachmentRect;
- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11;
- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11 rectArray:(CGRect *)a12 rectArrayCapacity:(unint64_t)a13;
- (CGRect)boundingRectForGlyphRange:(NSRange)glyphRange inTextContainer:(NSTextContainer *)container;
- (CGRect)extraLineFragmentRect;
- (CGRect)extraLineFragmentUsedRect;
- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag;
- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag;
- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 allowLayout:(BOOL)a5;
- (CGRect)prepareLayoutForBoundingRect:(CGRect)a3 textContainer:(id)a4;
- (CGRect)usedRectForTextContainer:(NSTextContainer *)container;
- (CGSize)attachmentSizeForGlyphAtIndex:(NSUInteger)glyphIndex;
- (CUIStyleEffectConfiguration)styleEffectConfiguration;
- (NSArray)textContainers;
- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveCharRange;
- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (NSFont)substituteFontForFont:(NSFont *)originalFont;
- (NSGlyphGenerator)glyphGenerator;
- (NSGlyphProperty)propertyForGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSInteger)intAttribute:(NSInteger)attributeTag forGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSLayoutManager)init;
- (NSLayoutManager)initWithCoder:(NSCoder *)coder;
- (NSParagraphArbitrator)paragraphArbitrator;
- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange;
- (NSRange)glyphRangeForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container;
- (NSRange)glyphRangeForBoundingRectWithoutAdditionalLayout:(CGRect)bounds inTextContainer:(NSTextContainer *)container;
- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange;
- (NSRange)glyphRangeForTextContainer:(NSTextContainer *)container;
- (NSRange)rangeOfNominallySpacedGlyphsContainingIndex:(NSUInteger)glyphIndex;
- (NSRange)truncatedGlyphRangeInLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange;
- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange;
- (NSRectArray)rectArrayForCharacterRange:(NSRange)charRange withinSelectedCharacterRange:(NSRange)selCharRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount;
- (NSRectArray)rectArrayForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selGlyphRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount;
- (NSTextContainer)extraLineFragmentTextContainer;
- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange;
- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag;
- (NSTextStorage)textStorage;
- (NSTypesetter)typesetter;
- (NSTypesetterBehavior)typesetterBehavior;
- (NSUInteger)characterIndexForGlyphAtIndex:(NSUInteger)glyphIndex;
- (NSUInteger)characterIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceBetweenInsertionPoints:(CGFloat *)partialFraction;
- (NSUInteger)firstUnlaidCharacterIndex;
- (NSUInteger)firstUnlaidGlyphIndex;
- (NSUInteger)getGlyphs:(NSGlyph *)glyphArray range:(NSRange)glyphRange;
- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(CGGlyph *)glyphBuffer properties:(NSGlyphProperty *)props characterIndexes:(NSUInteger *)charIndexBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer;
- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer;
- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer;
- (NSUInteger)getLineFragmentInsertionPointsForCharacterAtIndex:(NSUInteger)charIndex alternatePositions:(BOOL)aFlag inDisplayOrder:(BOOL)dFlag positions:(CGFloat *)positions characterIndexes:(NSUInteger *)charIndexes;
- (NSUInteger)glyphIndexForCharacterAtIndex:(NSUInteger)charIndex;
- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container;
- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceThroughGlyph:(CGFloat *)partialFraction;
- (NSUInteger)numberOfGlyphs;
- (_NSRange)_characterRangeCurrentlyInAndAfterContainer:(id)a3;
- (_NSRange)_exactGlyphRangeForCharacterRange:(_NSRange)a3;
- (_NSRange)_extendedCharRangeForInvalidation:(_NSRange)a3 editedCharRange:(_NSRange)a4;
- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 hintGlyphRange:(_NSRange)a5 okToFillHoles:(BOOL)a6;
- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 okToFillHoles:(BOOL)a5;
- (_NSRange)_glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 fast:(BOOL)a5 okToFillHoles:(BOOL)a6;
- (_NSRange)_glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4 okToFillHoles:(BOOL)a5;
- (_NSRange)_primitiveCharacterRangeForGlyphRange:(_NSRange)a3;
- (_NSRange)_primitiveGlyphRangeForCharacterRange:(_NSRange)a3;
- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4;
- (_NSStoredContainerUsage)_validatedStoredUsageForTextContainerAtIndex:(unint64_t)a3;
- (char)_packedGlyphs:(unint64_t)a3 range:(_NSRange)a4 length:(unint64_t *)a5;
- (double)_hyphenationFactor;
- (double)baselineOffsetForGlyphAtIndex:(unint64_t)a3;
- (id)_attachmentSizesRun;
- (id)_containerDescription;
- (id)_glyphDescription;
- (id)_glyphDescriptionForGlyphRange:(_NSRange)a3;
- (id)_glyphHoleDescription;
- (id)_glyphLocationDescription;
- (id)_insertionPointHelperForGlyphAtIndex:(unint64_t)a3;
- (id)_layoutHoleDescription;
- (id)_lineFragmentDescription;
- (id)_lineFragmentDescription:(BOOL)a3;
- (id)_lineFragmentDescriptionForGlyphRange:(_NSRange)a3 includeGlyphLocations:(BOOL)a4;
- (id)_rowArrayCache;
- (id)_selectedRanges;
- (id)_selectionRangesForInsertionPointRange:(_NSRange)a3;
- (id)_stringForLoggingLineFragmentForGlyphAtIndex:(int64_t)a3;
- (id)attributedString;
- (id)delegate;
- (id)description;
- (id)destinationTextContainerForRange:(_NSRange)a3 inTextContainer:(id)a4;
- (id)didCompleteLayoutObserverBlock;
- (id)layoutFragmentsForReplacingCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4 rect:(CGRect)a5 textContainer:(id)a6;
- (id)linkAttributesForAttributes:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4;
- (id)renderingColorForDocumentColor:(id)a3;
- (id)selectedTextAttributesForCharacterAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (id)underlineColorForSpelling;
- (id)underlineColorForTextAlternatives;
- (id)viewProviderForTextAttachment:(id)a3 characterIndex:(unint64_t)a4;
- (int64_t)applicationFrameworkContext;
- (int64_t)getLineFragmentInsertionPointArraysForCharacterAtIndex:(unint64_t)a3 inDisplayOrder:(BOOL)a4 positions:(double *)a5 characterIndexes:(unint64_t *)a6 count:(unint64_t *)a7 alternatePositions:(double *)a8 characterIndexes:(unint64_t *)a9 count:(unint64_t *)a10;
- (unint64_t)_currentAttachmentIndex;
- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5;
- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6;
- (unint64_t)_indexOfFirstGlyphInTextContainer:(id)a3 okToFillHoles:(BOOL)a4;
- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5;
- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6;
- (unint64_t)layoutOptions;
- (unsigned)_glyphAtIndex:(unint64_t)a3 characterIndex:(unint64_t *)a4 glyphInscription:(unint64_t *)a5 isValidIndex:(BOOL *)a6;
- (void)_clearCurrentAttachmentSettings;
- (void)_clearTemporaryAttributes;
- (void)_clearTemporaryAttributesForCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4;
- (void)_commonInit;
- (void)_doLayoutWithFullContainerStartingAtGlyphIndex:(unint64_t)a3 nextGlyphIndex:(unint64_t *)a4;
- (void)_drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)_drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10;
- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10 flipped:(BOOL)a11;
- (void)_drawLineForGlyphRange:(_NSRange)a3 type:(int64_t)a4 baselineOffset:(double)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8 isStrikethrough:(BOOL)a9;
- (void)_fillGlyphHoleAtIndex:(unint64_t)a3 desiredNumberOfCharacters:(unint64_t)a4;
- (void)_fillGlyphHoleForCharacterRange:(_NSRange)a3 startGlyphIndex:(unint64_t)a4 desiredNumberOfCharacters:(unint64_t)a5;
- (void)_fillLayoutHoleAtIndex:(unint64_t)a3 desiredNumberOfLines:(unint64_t)a4;
- (void)_fillLayoutHoleForCharacterRange:(_NSRange)a3 desiredNumberOfLines:(unint64_t)a4 isSoft:(BOOL)a5;
- (void)_firstTextViewChanged;
- (void)_forceDisplayToBeCorrectForViewsWithUnlaidGlyphs;
- (void)_growCachedRectArrayToSize:(unint64_t)a3;
- (void)_insertGlyphs:(unsigned int *)a3 elasticAttributes:(BOOL *)a4 count:(unint64_t)a5 atGlyphIndex:(unint64_t)a6 characterIndex:(unint64_t)a7;
- (void)_invalidateDisplayIfNeeded;
- (void)_invalidateGlyphsForCharacterRange:(_NSRange)a3 editedCharacterRange:(_NSRange)a4 changeInLength:(int64_t)a5 actualCharacterRange:(_NSRange *)a6;
- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4;
- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4 includeBlocks:(BOOL)a5;
- (void)_invalidateInsertionPoint;
- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4;
- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4 invalidateUsage:(BOOL)a5;
- (void)_invalidateUsageForTextContainersInRange:(_NSRange)a3;
- (void)_lineGlyphRange:(_NSRange)a3 type:(int64_t)a4 lineFragmentRect:(CGRect)a5 lineFragmentGlyphRange:(_NSRange)a6 containerOrigin:(CGPoint)a7 isStrikethrough:(BOOL)a8;
- (void)_markSelfAsDirtyForBackgroundLayout:(id)a3;
- (void)_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:(unint64_t)a3;
- (void)_primitiveInvalidateDisplayForGlyphRange:(_NSRange)a3;
- (void)_recalculateUsageForTextContainerAtIndex:(unint64_t)a3;
- (void)_resetCachedTextContainer;
- (void)_resizeTextViewForTextContainer:(id)a3;
- (void)_setAlwaysDrawsActive:(BOOL)a3;
- (void)_setCachedTextContainer:(id)a3 isVertical:(BOOL)a4;
- (void)_setCurrentAttachmentRect:(CGRect)a3 index:(unint64_t)a4;
- (void)_setDrawsDebugBaselines:(BOOL)a3;
- (void)_setDrawsUnderlinesLikeWebKit:(BOOL)a3;
- (void)_setExtraLineFragmentRect:(CGRect)a3 usedRect:(CGRect)a4 textContainer:(id)a5;
- (void)_setForcesTrackingFloor:(BOOL)a3;
- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 integerOffsetPerLineEstimate:(unint64_t)a4;
- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 offsetPerLineEstimate:(double)a4;
- (void)_setHasSeenRightToLeft:(BOOL)a3;
- (void)_setHyphenationFactor:(double)a3;
- (void)_setMirrorsTextAlignment:(BOOL)a3;
- (void)_setNeedToFlushGlyph:(BOOL)a3;
- (void)_setRowArrayCache:(id)a3;
- (void)_setTextContainer:(id)a3 forGlyphRange:(_NSRange)a4;
- (void)_showAttachmentCell:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5;
- (void)_showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9;
- (void)_simpleDeleteGlyphsInRange:(_NSRange)a3;
- (void)_simpleInsertGlyph:(unsigned int)a3 atGlyphIndex:(unint64_t)a4 characterIndex:(unint64_t)a5 elastic:(BOOL)a6;
- (void)_updateUsageForTextContainer:(id)a3 addingUsedRect:(CGRect)a4;
- (void)addTemporaryAttribute:(NSAttributedStringKey)attrName value:(id)value forCharacterRange:(NSRange)charRange;
- (void)addTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange;
- (void)addTextContainer:(NSTextContainer *)container;
- (void)beginScrollingForView:(id)a3 textContainer:(id)a4;
- (void)coordinateAccess:(id)a3;
- (void)dealloc;
- (void)deleteGlyphsInRange:(NSRange)glyphRange;
- (void)drawSpellingUnderlineForGlyphRange:(_NSRange)a3 spellingState:(int64_t)a4 inGlyphRange:(_NSRange)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8;
- (void)drawStrikethroughForGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin;
- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin;
- (void)encodeWithCoder:(id)a3;
- (void)endScrollingForView:(id)a3 textContainer:(id)a4;
- (void)ensureGlyphsForCharacterRange:(NSRange)charRange;
- (void)ensureGlyphsForGlyphRange:(NSRange)glyphRange;
- (void)ensureLayoutForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container;
- (void)ensureLayoutForCharacterRange:(NSRange)charRange;
- (void)ensureLayoutForGlyphRange:(NSRange)glyphRange;
- (void)ensureLayoutForTextContainer:(NSTextContainer *)container;
- (void)enumerateEnclosingRectsForCharacterRange:(_NSRange)a3 withinSelectedCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 usingBlock:(id)a6;
- (void)enumerateEnclosingRectsForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selectedRange inTextContainer:(NSTextContainer *)textContainer usingBlock:(void *)block;
- (void)enumerateLineFragmentsForGlyphRange:(NSRange)glyphRange usingBlock:(void *)block;
- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color;
- (void)fillMarkedBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6;
- (void)finalize;
- (void)getFirstUnlaidCharacterIndex:(NSUInteger *)charIndex glyphIndex:(NSUInteger *)glyphIndex;
- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex;
- (void)insertGlyphs:(const NSGlyph *)glyphs length:(NSUInteger)length forStartingGlyphAtIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex;
- (void)insertTextContainer:(NSTextContainer *)container atIndex:(NSUInteger)index;
- (void)invalidateDisplayForCharacterRange:(NSRange)charRange;
- (void)invalidateDisplayForGlyphRange:(NSRange)glyphRange;
- (void)invalidateGlyphsForCharacterRange:(NSRange)charRange changeInLength:(NSInteger)delta actualCharacterRange:(NSRangePointer)actualCharRange;
- (void)invalidateGlyphsOnLayoutInvalidationForGlyphRange:(NSRange)glyphRange;
- (void)invalidateLayoutForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange;
- (void)invalidateLayoutForCharacterRange:(NSRange)charRange isSoft:(BOOL)flag actualCharacterRange:(NSRangePointer)actualCharRange;
- (void)processEditingForTextStorage:(NSTextStorage *)textStorage edited:(NSTextStorageEditActions)editMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange;
- (void)removeTemporaryAttribute:(NSAttributedStringKey)attrName forCharacterRange:(NSRange)charRange;
- (void)removeTextContainerAtIndex:(NSUInteger)index;
- (void)replaceGlyphAtIndex:(NSUInteger)glyphIndex withGlyph:(NSGlyph)newGlyph;
- (void)replaceTextStorage:(NSTextStorage *)newTextStorage;
- (void)setAllowsNonContiguousLayout:(BOOL)allowsNonContiguousLayout;
- (void)setAllowsOriginalFontMetricsOverride:(BOOL)a3;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setAttachmentSize:(CGSize)attachmentSize forGlyphRange:(NSRange)glyphRange;
- (void)setBackgroundLayoutEnabled:(BOOL)backgroundLayoutEnabled;
- (void)setBaselineOffset:(double)a3 forGlyphAtIndex:(unint64_t)a4;
- (void)setBoundsRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange;
- (void)setCharacterIndex:(NSUInteger)charIndex forGlyphAtIndex:(NSUInteger)glyphIndex;
- (void)setDelegate:(id)delegate;
- (void)setDidCompleteLayoutObserverBlock:(id)a3;
- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex;
- (void)setEllipsisGlyphAttribute:(BOOL)a3 forGlyphAtIndex:(unint64_t)a4;
- (void)setFlipsIfNeeded:(BOOL)a3;
- (void)setGlyphGenerator:(NSGlyphGenerator *)glyphGenerator;
- (void)setGlyphs:(const CGGlyph *)glyphs properties:(const NSGlyphProperty *)props characterIndexes:(const NSUInteger *)charIndexes font:(UIFont *)aFont forGlyphRange:(NSRange)glyphRange;
- (void)setIgnoresViewTransformations:(BOOL)a3;
- (void)setIntAttribute:(NSInteger)attributeTag value:(NSInteger)val forGlyphAtIndex:(NSUInteger)glyphIndex;
- (void)setLayoutRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange;
- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents;
- (void)setLineFragmentRect:(CGRect)a3 forGlyphRange:(_NSRange)a4 usedRect:(CGRect)a5 baselineOffset:(double)a6;
- (void)setLineFragmentRect:(CGRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(CGRect)usedRect;
- (void)setLocation:(CGPoint)a3 forStartOfGlyphRange:(_NSRange)a4 coalesceRuns:(BOOL)a5;
- (void)setLocation:(CGPoint)location forStartOfGlyphRange:(NSRange)glyphRange;
- (void)setLocations:(NSPointArray)locations startingGlyphIndexes:(NSUInteger *)glyphIndexes count:(NSUInteger)count forGlyphRange:(NSRange)glyphRange;
- (void)setNotShownAttribute:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex;
- (void)setParagraphArbitrator:(id)a3;
- (void)setShowsControlCharacters:(BOOL)showsControlCharacters;
- (void)setShowsInvisibleCharacters:(BOOL)showsInvisibleCharacters;
- (void)setStyleEffectConfiguration:(id)a3;
- (void)setSynchronizesAlignmentToDirection:(BOOL)a3;
- (void)setTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange;
- (void)setTextStorage:(NSTextStorage *)textStorage;
- (void)setTypesetter:(NSTypesetter *)typesetter;
- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior;
- (void)setUnderlineColorForSpelling:(id)a3;
- (void)setUnderlineColorForTextAlternatives:(id)a3;
- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation;
- (void)setUsesFontLeading:(BOOL)usesFontLeading;
- (void)setUsesScreenFonts:(BOOL)usesScreenFonts;
- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 characterIndex:(unint64_t)a5;
- (void)showAttachment:(id)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterIndex:(unint64_t)a6;
- (void)showAttachmentCell:(NSCell *)cell inRect:(NSRect)rect characterIndex:(NSUInteger)attachmentIndex;
- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSInteger)glyphCount font:(UIFont *)font textMatrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)CGContext;
- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSUInteger)glyphCount font:(UIFont *)font matrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)graphicsContext;
- (void)strikethroughGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin;
- (void)textContainerChangedGeometry:(NSTextContainer *)container;
- (void)textContainerChangedTextView:(NSTextContainer *)container;
- (void)textContainerChangedTextView:(id)a3 fromTextView:(id)a4;
- (void)textStorage:(NSTextStorage *)str edited:(NSTextStorageEditedOptions)editedMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange;
- (void)underlineGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin;
@end

@implementation NSLayoutManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    [a1 setVersion:1];
    if ([v3 objectForKey:@"NSUsesScreenFonts"]) {
      __NSUsesScreenFonts = [v3 BOOLForKey:@"NSUsesScreenFonts"];
    }
    if ([v3 objectForKey:@"NSIgnoresViewTransformations"]) {
      char v4 = [v3 BOOLForKey:@"NSIgnoresViewTransformations"];
    }
    else {
      char v4 = 1;
    }
    __NSIgnoresViewTransformations = v4;
    if ([v3 objectForKey:@"NSTextShowsInvisibleCharacters"]) {
      __NSShowsInvisibleCharacters = [v3 BOOLForKey:@"NSTextShowsInvisibleCharacters"];
    }
    if ([v3 objectForKey:@"NSTextShowsControlCharacters"]) {
      __NSShowsControlCharacters = [v3 BOOLForKey:@"NSTextShowsControlCharacters"];
    }
    if ([v3 objectForKey:@"NSTextAllowsNonContiguousLayout"]) {
      __NSAllowsNonContiguousLayout = [v3 BOOLForKey:@"NSTextAllowsNonContiguousLayout"];
    }
    if ([v3 objectForKey:@"NSTextBackgroundLayoutEnabled"]) {
      __NSBackgroundLayoutEnabled = [v3 BOOLForKey:@"NSTextBackgroundLayoutEnabled"];
    }
    __NSFillBackgroundRectArray = [a1 instanceMethodForSelector:sel_fillBackgroundRectArray_count_forCharacterRange_color_];
    __NSShowCGGlyphsIMP = [a1 instanceMethodForSelector:sel_showCGGlyphs_positions_count_font_matrix_attributes_inContext_];
    __NSForcesOldShowGlyphs = [v3 BOOLForKey:@"NSLayoutManagerForcesShowPackedGlyphs"];
  }
}

- (void)_showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  uint64_t v9 = ((uint64_t (*)(NSLayoutManager *, SEL, const unsigned __int16 *, const CGPoint *, int64_t, id, CGAffineTransform *, id))MEMORY[0x1F4188790])(self, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a9) {
    return;
  }
  v16 = v15;
  uint64_t v17 = v13;
  uint64_t v18 = v12;
  v19 = v11;
  v20 = (id *)v9;
  uint64_t v40 = v10;
  double v21 = *MEMORY[0x1E4F1DAD8];
  double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  memset(&v41, 0, sizeof(v41));
  long long v23 = v14[1];
  *(_OWORD *)&v42.a = *v14;
  *(_OWORD *)&v42.c = v23;
  *(_OWORD *)&v42.tx = v14[2];
  CGAffineTransformInvert(&v41, &v42);
  v24 = (void *)[v20 textStorage];
  uint64_t v25 = [v24 cuiCatalog];
  uint64_t v39 = [v20 styleEffectConfiguration];
  if (v18 >= 257)
  {
    v26 = (CGAffineTransform *)NSZoneMalloc(0, 16 * v18);
    v26->a = v21;
    v26->b = v22;
    goto LABEL_5;
  }
  v42.a = v21;
  v42.b = v22;
  v26 = &v42;
  if ((unint64_t)v18 >= 2)
  {
LABEL_5:
    uint64_t v27 = 0;
    uint64_t v28 = v18 - 1;
    do
    {
      CGFloat v29 = v19[v27 + 2] - v19[v27];
      CGFloat v30 = v19[v27 + 3] - v19[v27 + 1];
      double v21 = v21 + v30 * v41.c + v41.a * v29;
      double v22 = v22 + v30 * v41.d + v41.b * v29;
      v31 = (double *)((char *)&v26->a + v27 * 8);
      v31[2] = v21;
      v31[3] = v22;
      v27 += 2;
      --v28;
    }
    while (v28);
  }
  CGContextSetTextPosition(a9, *v19, v19[1]);
  uint64_t v32 = [v16 objectForKey:@"NSTextEffect"];
  if (!v25
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (uint64_t v25 = [v20[13] layoutManager:v20 effectiveCUICatalogForTextEffect:v32]) == 0))
  {
    [v20 delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = objc_msgSend((id)objc_msgSend(v20, "delegate"), "layoutManager:effectiveCUICatalogForTextEffect:", v20, v32);
    }
    else {
      uint64_t v25 = 0;
    }
  }
  v33 = [__NSTextAppearanceEffectContext alloc];
  uint64_t v34 = [v16 objectForKeyedSubscript:@"NSColor"];
  uint64_t v35 = [v20 applicationFrameworkContext];
  LOBYTE(v38) = [v24 _usesSimpleTextEffects];
  v36 = [(__NSTextAppearanceEffectContext *)v33 initWithTextEffectName:v32 catalog:v25 styleEffectConfiguration:v39 font:v17 color:v34 applicationFrameworkContext:v35 useSimplifiedEffect:v38];
  v37 = v36;
  if (v36) {
    [(__NSTextAppearanceEffectContext *)v36 drawGlyphs:v40 positions:v26 count:v18 context:a9];
  }
  else {
    CTFontDrawGlyphsAtPositions();
  }

  if (v26 != &v42) {
    NSZoneFree(0, v26);
  }
}

- (void)_showAttachmentCell:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double v9 = a4.origin.y - a4.size.height;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:layoutManager:", 0, a5, self, x, v9, width, height);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_10:
    objc_msgSend(a3, "drawWithFrame:inView:", 0, x, v9, width, height);
  }
  else
  {
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:", 0, a5, x, v9, width, height);
  }
}

- (void)drawSpellingUnderlineForGlyphRange:(_NSRange)a3 spellingState:(int64_t)a4 inGlyphRange:(_NSRange)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = a3.length;
  double y = a8.y;
  double x = a8.x;
  double height = a6.size.height;
  double v15 = a6.origin.y;
  double v16 = a6.origin.x;
  NSUInteger v17 = a3.location;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  v19 = (void *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:[(NSLayoutManager *)self applicationFrameworkContext]];
  v20 = (CGContext *)[v19 CGContext];
  [(NSTypesetter *)[(NSLayoutManager *)self typesetter] baselineOffsetInLayoutManager:self glyphIndex:v17];
  double v22 = v21;
  v115 = [(NSLayoutManager *)self textContainerForGlyphAtIndex:v17 effectiveRange:0];
  if (v19) {
    BOOL v23 = (*(_DWORD *)&self->_lmFlags & 0x10000000) == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23) {
    int phase = 1;
  }
  else {
    int phase = [v19 isFlipped];
  }
  BOOL v24 = [(NSLayoutManager *)self applicationFrameworkContext] == 2;
  int64_t v25 = [(NSLayoutManager *)self applicationFrameworkContext];
  char v26 = 1;
  if (a4 == 3) {
    char v26 = 2;
  }
  if (a4 == 1) {
    char v26 = 0x80;
  }
  if (v25 == 1) {
    LOBYTE(a4) = v26;
  }
  if (v20)
  {
    if ((a4 & 0x83) != 0)
    {
      NSUInteger v27 = location + length;
      if (v17 + v11 >= location + length)
      {
        CGContextGetCTM(&v123, v20);
        CGFloat a = v123.a;
        CGFloat b = v123.b;
        CGFloat c = v123.c;
        CGFloat d = v123.d;
        tdouble x = v123.tx;
        tdouble y = v123.ty;
        double v34 = fabs(v123.a);
        double v35 = floor(v34);
        double v110 = v123.a;
        double v111 = v123.b;
        double v108 = v123.ty;
        double v109 = v123.d;
        double v107 = v123.tx;
        memset(&v123, 0, sizeof(v123));
        if (v35 <= 1.0)
        {
          v123.CGFloat a = a;
          v123.CGFloat b = b;
          double v36 = d;
          v123.CGFloat c = c;
        }
        else
        {
          v122.CGFloat a = a;
          v122.CGFloat b = b;
          v122.CGFloat c = c;
          v122.CGFloat d = d;
          v122.tdouble x = tx;
          v122.tdouble y = ty;
          CGAffineTransformScale(&v123, &v122, 1.0 / v35, -1.0 / v35);
          double v36 = v123.d;
          double v34 = fabs(v123.a);
        }
        BOOL v37 = v34 - fabs(v36) > 0.001 || fabs(v123.b) - fabs(v123.c) > 0.001 || ceil(v123.c) - v123.c > 0.001;
        BOOL v113 = v37;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __151__NSLayoutManager_OtherSupport__drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin___block_invoke;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        BOOL v121 = v24;
        if (drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__colorOncePredicate == -1)
        {
          if ((a4 & 1) == 0)
          {
LABEL_25:
            uint64_t v38 = &drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__correctionPatternColor;
            if ((a4 & 0x80) == 0) {
              uint64_t v38 = &drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__grammarPatternColor;
            }
            uint64_t v39 = *v38;
            goto LABEL_30;
          }
        }
        else
        {
          dispatch_once(&drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__colorOncePredicate, block);
          if ((a4 & 1) == 0) {
            goto LABEL_25;
          }
        }
        uint64_t v39 = drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__spellingPatternColor;
LABEL_30:
        [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:v17 effectiveRange:0];
        double v112 = v40;
        double v42 = v41 + v40;
        CGFloat v114 = c;
        if (v41 + v40 > v15 && v42 < v15 + height)
        {
          double v22 = v22 - (v15 + height - v42);
          double height = v42 - v15;
        }
        -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", location, v42);
        double v44 = v43;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 2) != 0
          && ([(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v17] & 1) != 0)
        {
          v123.CGFloat a = 0.0;
          v54 = -[NSLayoutManager rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:](self, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v17, v11, 0x7FFFFFFFFFFFFFFFLL, 0, v115, &v123);
          CGFloat v55 = v123.a;
          double v49 = 0.0;
          if (*(void *)&v123.a)
          {
            p_double width = &v54->size.width;
            double v46 = 0.0;
            do
            {
              double v57 = *(p_width - 2);
              double v58 = *p_width;
              p_width += 4;
              double v59 = v58;
              double v60 = v57 - v16;
              double v61 = v46 + v44 - v60;
              if (v60 < v44) {
                double v44 = v60;
              }
              else {
                double v61 = v46;
              }
              double v62 = v60 + v59;
              if (v62 <= v44 + v61) {
                double v46 = v61;
              }
              else {
                double v46 = v62 - v44;
              }
              --*(void *)&v55;
            }
            while (v55 != 0.0);
          }
          else
          {
            double v46 = 0.0;
          }
          char v47 = 0;
        }
        else if (v27 >= a7.location + a7.length)
        {
          [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:a7.location effectiveRange:0];
          double v52 = v50 + v51;
          [(NSTextContainer *)v115 lineFragmentPadding];
          char v47 = 0;
          double v46 = v52 - v53 - (v16 + v44);
          double v49 = 0.0;
        }
        else
        {
          if ((*((unsigned char *)&self->_lmFlags + 3) & 2) != 0
            && ([(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v27] & 1) != 0)
          {
            NSUInteger v72 = [(NSLayoutManager *)self characterIndexForGlyphAtIndex:v27 - 1];
            [(NSLayoutManager *)self locationForGlyphAtIndex:v27 - 1];
            double v74 = v73;
            v75 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"NSFont" atIndex:v72 effectiveRange:0];
            v76 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:v72 effectiveRange:0];
            if (!v75) {
              v75 = NSDefaultFont();
            }
            if (([v76 BOOLValue] & 1) != 0
              || !v76 && [(NSTextContainer *)v115 layoutOrientation])
            {
              v75 = (void *)[v75 verticalFont];
            }
            double v46 = v74 - v44;
            if (v75)
            {
              objc_msgSend(v75, "advancementForGlyph:", -[NSLayoutManager glyphAtIndex:](self, "glyphAtIndex:", v27 - 1));
              char v47 = 0;
              double v46 = v46 + v105;
            }
            else
            {
              char v47 = 0;
            }
          }
          else
          {
            [(NSLayoutManager *)self locationForGlyphAtIndex:v27];
            double v46 = v45 - v44;
            char v47 = 1;
          }
          if (v27 + 1 >= a7.location + a7.length)
          {
            [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:a7.location effectiveRange:0];
            double v106 = v22;
            double v63 = height;
            double v64 = v15;
            double v65 = y;
            double v66 = x;
            double v69 = v67 + v68;
            [(NSTextContainer *)v115 lineFragmentPadding];
            double v71 = v69 - v70;
            double x = v66;
            double y = v65;
            double v15 = v64;
            double height = v63;
            double v22 = v106;
            double v49 = v71 - (v16 + v44);
          }
          else
          {
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:");
            double v49 = v48 - v44;
          }
        }
        double v77 = v16 + x + v44;
        double v78 = y - (v15 + height - v22);
        if (phase) {
          double v78 = y + v15 + height - v22;
        }
        if (v47)
        {
          double v79 = v77 + v49;
          double v80 = v46 + v77;
          double v81 = v114;
          BOOL v82 = v79 - (v46 + v77) < 5.0;
        }
        else
        {
          BOOL v82 = 0;
          double v80 = v46 + v77;
          double v81 = v114;
        }
        int v83 = v81 == 0.0 || v113;
        if (v83) {
          double v84 = 3.0;
        }
        else {
          double v84 = 4.0;
        }
        if (v83) {
          double v85 = 4.0;
        }
        else {
          double v85 = 3.0;
        }
        if (!v83) {
          double v78 = v78 + -1.0;
        }
        double v86 = ceil(v77);
        double v87 = floor(v80) - v86;
        uint64_t v88 = (uint64_t)v87 % (uint64_t)vcvtmd_s64_f64(v85);
        double v89 = v85 + v87 - (double)v88;
        if (!v82 || v88 != 0) {
          double v85 = 0.0;
        }
        double v90 = v89 - v85;
        if (v89 - v85 - v87 <= 2.0) {
          double v91 = v86;
        }
        else {
          double v91 = v86 + -1.0;
        }
        double v92 = ceil(v78);
        double v93 = floor(v22 + v78) - v92;
        if (v112 <= 19.0) {
          double v94 = 3.0;
        }
        else {
          double v94 = 4.0;
        }
        double v95 = floor(v112 / 100.0) + 5.0;
        if (v112 > 25.0) {
          double v96 = v95;
        }
        else {
          double v96 = v94;
        }
        double v97 = v93 - v96;
        BOOL v98 = v93 <= v96;
        double v99 = -0.0;
        if (!v98) {
          double v99 = v97;
        }
        double v100 = v92 + v99;
        CGContextSaveGState(v20);
        if (v39) {
          int v101 = v113;
        }
        else {
          int v101 = 1;
        }
        if (v101 == 1)
        {
          uint64_t v102 = __NSGetColorForSpellingState(a4);
          if (v102)
          {
            uint64_t v103 = v102;
            *(_OWORD *)&v123.CGFloat a = xmmword_18E5F7300;
            CGContextSetLineDash(v20, 0.0, &v123.a, 2uLL);
            CGFloat v104 = v84 + v100;
            CGContextMoveToPoint(v20, v91, v104);
            CGContextAddLineToPoint(v20, v90 + v91, v104);
            CGContextSetLineWidth(v20, 2.0);
            objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", v103), "set");
            CGContextStrokePath(v20);
          }
        }
        else
        {
          CGContextGetBaseCTM();
          CGAffineTransformInvert(&v119, &v118);
          phaseCGFloat a = (CGSize)vaddq_f64(*(float64x2_t *)&v119.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v119.c, v108 + v109 * v100 + v111 * v91), *(float64x2_t *)&v119.a, v107 + v81 * v100 + v110 * v91));
          objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", v39), "set");
          CGContextSetPatternPhase(v20, phasea);
          if (CGContextGetCompositeOperation() == 2)
          {
            v125.origin.double x = v91;
            v125.origin.double y = v100;
            v125.size.double width = v90;
            v125.size.double height = v84;
            CGContextFillRect(v20, v125);
          }
          else
          {
            CGContextSetCompositeOperation();
            v126.origin.double x = v91;
            v126.origin.double y = v100;
            v126.size.double width = v90;
            v126.size.double height = v84;
            CGContextFillRect(v20, v126);
            CGContextSetCompositeOperation();
          }
        }
        CGContextRestoreGState(v20);
      }
    }
  }
}

id __151__NSLayoutManager_OtherSupport__drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin___block_invoke()
{
  uint64_t v0 = __NSGetColorForSpellingState(1);
  uint64_t v1 = __NSGetCircledImage(v0, 3.0, 3.0);
  uint64_t v2 = __NSGetColorForSpellingState(2);
  uint64_t v3 = __NSGetCircledImage(v2, 3.0, 3.0);
  uint64_t v4 = __NSGetColorForSpellingState(128);
  uint64_t v5 = __NSGetCircledImage(v4, 3.0, 3.0);
  if (v1) {
    v6 = (void *)[(Class)getNSColorClass[0]() colorWithPatternImage:v1];
  }
  else {
    v6 = 0;
  }
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__spellingPatternColor = v6;
  if (v3) {
    v7 = (void *)[(Class)getNSColorClass[0]() colorWithPatternImage:v3];
  }
  else {
    v7 = 0;
  }
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__grammarPatternColor = v7;
  if (v5) {
    v8 = (void *)[(Class)getNSColorClass[0]() colorWithPatternImage:v5];
  }
  else {
    v8 = 0;
  }
  id result = v8;
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__correctionPatternColor = (uint64_t)result;
  return result;
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10 flipped:(BOOL)a11
{
  double v11 = a8;
  double v13 = a6;
  double v14 = a5;
  double v15 = a4;
  if (a10)
  {
    BOOL v17 = a11;
    double y = a9.y;
    CGFloat x = a9.x;
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    CGContextMoveToPoint(a4, a5, a7);
    uint64_t v22 = [(NSTextStorage *)self->_textStorage string];
    long long v63 = xmmword_18E5F72A0;
    double v23 = a7 - y;
    if (!v17) {
      double v23 = y - a7;
    }
    double v62 = v11;
    CGFloat c = v15;
    double v58 = v13;
    if (location < location + length)
    {
      BOOL v24 = (void *)v22;
      double v57 = x;
      int64_t v25 = 0;
      double v60 = v23 + v11 * -0.5;
      double v59 = v60 + v11;
      double v26 = 0.0;
      double v27 = 0.0;
      double v28 = 0.0;
      do
      {
        unint64_t v29 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        if (v29 < (unint64_t)v63 || v29 - (unint64_t)v63 >= *((void *)&v63 + 1))
        {
          v31 = (void *)[(NSTextStorage *)self->_textStorage attributesAtIndex:v29 effectiveRange:&v63];
          uint64_t v32 = (void *)[v31 objectForKey:@"NSFont"];
          int64_t v25 = (CGFont *)[v32 _backingCGSFont];
          [v32 pointSize];
          double v28 = v33;
          double v34 = (void *)[v31 objectForKey:@"NSExpansion"];
          double v26 = 0.0;
          double v27 = 0.0;
          if (v34)
          {
            [v34 doubleValue];
            double v27 = v35;
          }
          double v36 = objc_msgSend(v31, "objectForKey:", @"NSObliqueness", *(void *)&v57);
          if (v36)
          {
            [v36 doubleValue];
            double v26 = v37;
          }
        }
        int v38 = -[NSLayoutManager glyphAtIndex:](self, "glyphAtIndex:", location, *(void *)&v57);
        [(NSLayoutManager *)self locationForGlyphAtIndex:location];
        double v40 = v39;
        double v42 = v41;
        __int16 v43 = [v24 characterAtIndex:v29];
        if (v25)
        {
          if (v28 > 0.0 && v27 == 0.0 && v26 == 0.0 && (unsigned __int16)((unsigned __int16)(v43 + 1280) >> 7) <= 0x66u)
          {
            if (v38)
            {
              if (![(NSLayoutManager *)self notShownAttributeForGlyphAtIndex:location])
              {
                int UnitsPerEm = CGFontGetUnitsPerEm(v25);
                info[0] = *MEMORY[0x1E4F1DAD8];
                info[1] = info[0];
                double v45 = (double)UnitsPerEm;
                double v65 = (v42 - v60) * (double)UnitsPerEm / v28;
                double v66 = (v42 - v59) * (double)UnitsPerEm / v28;
                long long v67 = xmmword_18E5F72F0;
                GlyphPath = (const CGPath *)CGFontCreateGlyphPath();
                if (GlyphPath)
                {
                  char v47 = GlyphPath;
                  CGPathApply(GlyphPath, info, (CGPathApplierFunction)lmProcessPathElement);
                  long long v48 = v67;
                  if (*(double *)&v67 >= *((double *)&v67 + 1) || UnitsPerEm <= 0)
                  {
                    CGPathRelease(v47);
                  }
                  else
                  {
                    double v49 = v28 * *(double *)&v67 / v45;
                    CGPathRelease(v47);
                    double v50 = v57 + v40;
                    double v51 = v50 + v49 - v62;
                    if (v51 > v14 + v62 * 0.75)
                    {
                      CGContextAddLineToPoint(c, v51, a7);
                      CGContextStrokePath(c);
                      double v14 = v51;
                    }
                    if (v50 + v28 * *((double *)&v48 + 1) / v45 + v62 > v14) {
                      double v14 = v50 + v28 * *((double *)&v48 + 1) / v45 + v62;
                    }
                    CGContextMoveToPoint(c, v14, a7);
                  }
                }
              }
            }
          }
        }
        ++location;
        --length;
      }
      while (length);
    }
    double v11 = v62;
    double v15 = c;
    double v13 = v58;
    goto LABEL_38;
  }
  if (![(NSLayoutManager *)self _drawsUnderlinesLikeWebKit])
  {
    CGContextMoveToPoint(v15, v14, a7);
LABEL_38:
    if (vabdd_f64(v13, v14) > v11 * 0.75)
    {
      CGContextAddLineToPoint(v15, v13, a7);
      CGContextStrokePath(v15);
    }
    return;
  }
  StrokeColorAsColor = (CGColor *)CGContextGetStrokeColorAsColor();
  CGContextSetFillColorWithColor(v15, StrokeColorAsColor);
  double v54 = v14;
  double v55 = a7;
  double v56 = v11;

  double v53 = v13 - v14;
  CGContextFillRect(v15, *(CGRect *)&v54);
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10
{
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 type:(int64_t)a4 baselineOffset:(double)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8 isStrikethrough:(BOOL)a9
{
  BOOL v9 = a9;
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  NSUInteger v12 = a3.length;
  double y = a8.y;
  double x = a8.x;
  double height = a6.size.height;
  double v15 = a6.origin.y;
  double v210 = a6.origin.x;
  NSUInteger v17 = a3.location;
  uint64_t v239 = *MEMORY[0x1E4F143B8];
  v19 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", a3.location, 0, a5, a6.origin.x, a6.origin.y, a6.size.width);
  __asm { FMOV            V0.2D, #3.0 }
  *(_OWORD *)lengths = _Q0;
  long long v237 = _Q0;
  long long v238 = _Q0;
  unint64_t v23 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17, v12, 0);
  uint64_t v212 = v24;
  NSUInteger v213 = length;
  NSUInteger v225 = location;
  unint64_t v216 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
  uint64_t v217 = v25;
  double v26 = @"NSStrikethrough";
  BOOL v218 = v9;
  if (!v9) {
    double v26 = @"NSUnderline";
  }
  v206 = v26;
  if (v9) {
    double v27 = &NSStrikethroughColorAttributeName;
  }
  else {
    double v27 = &NSUnderlineColorAttributeName;
  }
  double v28 = (void *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:[(NSLayoutManager *)self applicationFrameworkContext]];
  unint64_t v29 = (CGContext *)[v28 CGContext];
  unint64_t v235 = 0;
  BOOL v30 = [(NSLayoutManager *)self _drawsUnderlinesLikeWebKit];
  v215 = v19;
  uint64_t v220 = [(NSTextContainer *)v19 layoutOrientation];
  CGContextGetCTM(&v234, v29);
  double a = v234.a;
  double b = v234.b;
  double c = v234.c;
  double d = v234.d;
  int v35 = [v28 isDrawingToScreen];
  uint64_t v36 = 1;
  if (v28 && (*(_DWORD *)&self->_lmFlags & 0x10000000) != 0) {
    uint64_t v36 = [v28 isFlipped];
  }
  if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__onceToken != -1) {
    dispatch_once(&_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__onceToken, &__block_literal_global_0);
  }
  BOOL v219 = v30;
  int v37 = !v30;
  if (!_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__breakForDescendersDefault) {
    int v37 = 0;
  }
  int v209 = v37;
  if (!_NSUnderlineWhiteSet)
  {
    _NSUnderlineWhiteSet = (uint64_t)(id)[MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    _NSUnderlineNonWhiteSet = (uint64_t)(id)[(id)_NSUnderlineWhiteSet invertedSet];
  }
  if ((a4 & 7) != 0)
  {
    int64_t v211 = a4 & 7;
    NSAttributedStringKey v38 = *v27;
    if (!v35
      || (id v39 = [(NSLayoutManager *)self temporaryAttribute:v38 atCharacterIndex:v23 effectiveRange:0]) == 0)
    {
      id v39 = (id)[(NSTextStorage *)self->_textStorage attribute:v38 atIndex:v23 effectiveRange:0];
    }
    v208 = v39;
    unint64_t i = a4 & 7;
    double v207 = (double)(unint64_t)v211;
    double v41 = -v15;
    if (v36) {
      double v41 = v15;
    }
    double v42 = y + v41;
    [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:v17 effectiveRange:0];
    double v45 = v43 + v44;
    _NF = v43 + v44 < v15 + height;
    double v47 = a5 - (v15 + height - (v43 + v44));
    double v48 = v45 - v15;
    if (v45 >= v15 + height) {
      double v47 = a5;
    }
    if (!_NF) {
      double v48 = height;
    }
    if (v45 > v15)
    {
      double v49 = v48;
    }
    else
    {
      double v47 = a5;
      double v49 = height;
    }
    double v50 = -(b * c);
    double v51 = v47;
    double v52 = fabs(v50 + a * d);
    double v53 = sqrt(v52);
    if (v52 <= 0.001) {
      double v54 = 1.0;
    }
    else {
      double v54 = v53;
    }
    if (v51 * 5.3636991 <= v49) {
      double v55 = v51 * 5.3636991;
    }
    else {
      double v55 = v49;
    }
    double v56 = v49 - v51;
    double v221 = v49;
    double v57 = v51 - v49;
    if (v36) {
      double v57 = v49 - v51;
    }
    double v227 = v42;
    double v58 = v42 + v57;
    double v205 = v55;
    if (v218)
    {
      long long v233 = 0uLL;
      kedouble y = 0;
      v232 = 0;
      uint64_t v59 = v23;
      if (!v217)
      {
LABEL_94:
        double v84 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"NSFont" atIndex:v59 effectiveRange:0];
        double v85 = 0.0;
        if (v84)
        {
          double v86 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:v59 effectiveRange:0];
          int v87 = [v86 BOOLValue];
          if (v86) {
            BOOL v88 = 1;
          }
          else {
            BOOL v88 = v220 == 0;
          }
          char v89 = v88;
          if (v87 || (v89 & 1) == 0)
          {
            double v90 = v58;
            double v84 = (void *)[v84 verticalFont];
          }
          else
          {
            double v90 = v58;
          }
          [(NSLayoutManager *)self defaultLineHeightForFont:v84];
          if (v93 <= v221) {
            double v94 = v93;
          }
          else {
            double v94 = v221;
          }
          char v95 = [v84 isVertical];
          double v96 = 0.0;
          int64_t v65 = a4 & 0x3000;
          if ((v95 & 1) == 0) {
            objc_msgSend(v84, "xHeight", 0.0);
          }
          double v92 = v96 * 0.5;
          double v91 = v94 * 0.0440277313;
          double v58 = v90;
        }
        else
        {
          double v91 = -1.0;
          double v92 = 0.0;
          int64_t v65 = a4 & 0x3000;
        }
        [(NSTextStorage *)self->_textStorage attributesAtIndex:v23 effectiveRange:&v233];
        v240.NSUInteger location = [(NSLayoutManager *)self glyphRangeForCharacterRange:v233 actualCharacterRange:0];
        v241.NSUInteger location = v17;
        v241.NSUInteger length = v12;
        NSRange v97 = NSIntersectionRange(v240, v241);
        kedouble y = (void *)v97.location;
        if (v97.location < v97.location + v97.length)
        {
          BOOL v98 = (char *)v97.location;
          do
          {
            _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, (unint64_t)v98, &key);
            if (v99 > v85) {
              double v85 = v99;
            }
            BOOL v98 = &v232[(void)key];
            kedouble y = v98;
          }
          while ((unint64_t)v98 < v97.location + v97.length);
        }
        if (v30)
        {
          [(NSLayoutManager *)self defaultBaselineOffsetForFont:v84];
          double v101 = v227 + (double)(2 * (int)v100 / 3);
          memset(&v234, 0, sizeof(v234));
          CGContextGetUserSpaceToDeviceSpaceTransform(&v234, v29);
          double v102 = 1.0;
          if (v54 < 0.400000006) {
            double v102 = 0.0;
          }
          CGFloat v103 = v234.ty + v101 * v234.d + v234.b * 0.0;
          float v104 = v234.tx + v101 * v234.c + v234.a * 0.0;
          double v105 = roundf(v104);
          *(float *)&CGFloat v103 = v103;
          double v106 = v102 + ceilf(*(float *)&v103);
          CGAffineTransform v229 = v234;
          CGAffineTransformInvert(&v230, &v229);
          double v107 = v230.ty + v106 * v230.d + v230.b * v105;
          float v108 = v54;
          double v109 = fmaxf(roundf(v108), 1.0);
          double v110 = (double)(unint64_t)v211;
        }
        else
        {
          double v111 = v221 - v85 - v51;
          if (!v36) {
            double v111 = -v111;
          }
          double v107 = v58 - v111;
          double v112 = v54 * v92;
          double v110 = (double)(unint64_t)v211;
          double v109 = v54 * v207 * v91;
          if (v54 * v92 > 1.0 && v109 > 0.35)
          {
            char v113 = vcvtpd_s64_f64(v109);
            double v109 = ceil(v109);
            double v114 = -v54;
            if (!v36) {
              double v114 = v54;
            }
            double v115 = v114 * v107 - floor(v114 * v107);
            double v116 = floor(v112 + 0.5);
            double v117 = floor(v112) + 0.5;
            if ((v113 & 1) == 0) {
              double v117 = v116;
            }
            double v112 = v117 - v115;
          }
          double v92 = v112 / v54;
        }
        goto LABEL_232;
      }
      double v60 = (void *)[(NSTextStorage *)self->_textStorage string];
      uint64_t v61 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"), "invertedSet");
      v222 = v60;
      if (v212)
      {
        uint64_t v62 = [v60 rangeOfCharacterFromSet:v61 options:0 range:v23];
        BOOL v64 = v63 != 0;
        if (v63) {
          uint64_t v59 = v62;
        }
        else {
          uint64_t v59 = v23;
        }
        if (v63) {
          goto LABEL_89;
        }
      }
      else
      {
        BOOL v64 = 0;
        uint64_t v59 = v23;
      }
      if (v23 > v216)
      {
        uint64_t v80 = objc_msgSend(v222, "rangeOfCharacterFromSet:options:range:", v61, 4, v216, v23 - v216);
        if (v81)
        {
          uint64_t v59 = v81 + v80 - 1;
LABEL_93:
          BOOL v30 = v219;
          goto LABEL_94;
        }
      }
LABEL_89:
      if (!v64 && v216 + v217 > v23 + v212)
      {
        uint64_t v82 = objc_msgSend(v222, "rangeOfCharacterFromSet:options:range:", v61, 0, v23 + v212, v216 + v217 - (v23 + v212));
        if (v83) {
          uint64_t v59 = v82;
        }
      }
      goto LABEL_93;
    }
    long long v233 = 0uLL;
    extraDatdouble a = (char *)self->_extraData;
    if ((a4 & 0x3000) != 0) {
      int64_t v65 = a4 & 0x3000;
    }
    else {
      int64_t v65 = 4096;
    }
    if ((a4 & 0x3000) == 0 && v220)
    {
      if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline < 0)
      {
        CGAffineTransform v118 = (void *)[MEMORY[0x1E4F1CA20] preferredLanguages];
        _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline = 1;
        if ([v118 count])
        {
          if (objc_msgSend((id)objc_msgSend(v118, "objectAtIndex:", 0), "hasPrefix:", @"zh")) {
            _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline = 0;
          }
        }
      }
      if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline) {
        int64_t v65 = 0x2000;
      }
      else {
        int64_t v65 = 12288;
      }
    }
    unint64_t v66 = *((void *)extraData + 21);
    _CF = v23 >= v66;
    unint64_t v67 = v23 - v66;
    double v204 = v56;
    if (_CF && v67 < *((void *)extraData + 22))
    {
      double v68 = v58;
      double v69 = *((double *)extraData + 18);
      double v70 = *((double *)extraData + 19);
      double v71 = *((double *)extraData + 20);
      goto LABEL_176;
    }
    int64_t v214 = v65;
    v234.double a = 0.0;
    v234.double b = 0.0;
    v229.double a = 0.0;
    v229.double b = 0.0;
    NSUInteger v72 = (void *)[(NSTextStorage *)self->_textStorage string];
    kedouble y = 0;
    v232 = 0;
    id firstTextView = self->_firstTextView;
    BOOL v74 = firstTextView
       && objc_msgSend((id)objc_msgSend(firstTextView, "linkTextAttributes"), "objectForKey:", @"NSUnderline")
       || objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultLinkAttributes"), "objectForKey:", @"NSUnderline") != 0;
    if ([(NSTextStorage *)self->_textStorage attribute:@"NSUnderline", v23, &v233, v216, v217 atIndex longestEffectiveRange inRange])
    {
      _ZF = *((void *)&v233 + 1) == 0;
    }
    else
    {
      _ZF = 1;
    }
    char v76 = !_ZF;
    if (_ZF && v74)
    {
      if ([(NSTextStorage *)self->_textStorage attribute:@"NSLink", v23, &v233, v216, v217 atIndex longestEffectiveRange inRange]&& *((void *)&v233 + 1))
      {
        goto LABEL_77;
      }
    }
    else if (v76)
    {
      goto LABEL_77;
    }
    if (![(NSLayoutManager *)self temporaryAttribute:@"NSUnderline", v23, &v233, v216, v217 atCharacterIndex longestEffectiveRange inRange]|| !*((void *)&v233 + 1))
    {
      *(void *)&long long v233 = v23;
      *((void *)&v233 + 1) = v212;
    }
LABEL_77:
    *(_OWORD *)(extraData + 168) = v233;
    unint64_t v77 = *((void *)&v233 + 1) + v233;
    *(void *)&long long v233 = v77;
    if (v23 + v212 >= v77) {
      goto LABEL_139;
    }
    int v78 = [v72 characterAtIndex:v77 - 1];
    unint64_t v77 = v233;
    if (v78 > 132)
    {
      if ((v78 - 8232) >= 2 && v78 != 133) {
        goto LABEL_139;
      }
    }
    else if (v78 != 10 && v78 != 12)
    {
      if (v78 == 13)
      {
        if (v77 >= [v72 length])
        {
          unint64_t v77 = v233;
        }
        else
        {
          int v79 = [v72 characterAtIndex:v77];
          unint64_t v77 = v233;
          if (v79 == 10) {
            goto LABEL_139;
          }
        }
        goto LABEL_138;
      }
LABEL_139:
      double v202 = v58;
      v234.double a = *((CGFloat *)extraData + 21);
      v234.double b = 0.0;
      double v203 = v54;
      if (*(void *)&v234.a >= v77)
      {
        double v69 = -1.0;
        double v70 = 0.0;
      }
      else
      {
        double v70 = 0.0;
        double v69 = -1.0;
        do
        {
          uint64_t v119 = -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSFont", *(void *)&v202);
          if (v119)
          {
            v120 = (void *)v119;
            BOOL v121 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:*(void *)&v234.a effectiveRange:0];
            int v122 = [v121 BOOLValue];
            if (v121) {
              BOOL v123 = 1;
            }
            else {
              BOOL v123 = v220 == 0;
            }
            char v124 = v123;
            if (v122 || (v124 & 1) == 0) {
              v120 = (void *)[v120 verticalFont];
            }
            [v120 descender];
            double v126 = v125;
            [v120 _leading];
            double v128 = ceil(v126 - v127) * 5.3636991;
            [v120 underlineThickness];
            if (v129 <= 0.0) {
              double v129 = v128 * -0.0440277313;
            }
            if (v69 < v129) {
              double v69 = v129;
            }
            double v130 = v128 * 0.0880554625;
            if ([v120 isVertical])
            {
              [v120 ascender];
              double v132 = v131;
              [v120 descender];
              if (v132 == -v133) {
                double v130 = v128 - v69;
              }
            }
            if (v70 > v130) {
              double v70 = v130;
            }
          }
          *(void *)&v234.a += *(void *)&v234.b;
        }
        while (*(void *)&v234.a < (unint64_t)v233);
      }
      *((double *)extraData + 18) = v69;
      *((double *)extraData + 19) = v70;
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
      v234.double a = *((CGFloat *)extraData + 21);
      v234.double b = 0.0;
      double v68 = v202;
      int64_t v65 = v214;
      double v55 = v205;
      for (unint64_t i = a4 & 7; *(void *)&v234.a < (unint64_t)v233; *(void *)&v234.a += *(void *)&v234.b)
      {
        -[NSTextStorage attributesAtIndex:effectiveRange:](self->_textStorage, "attributesAtIndex:effectiveRange:", *(void *)&v202);
        v135.NSUInteger location = *(void *)&v234.a;
        v135.NSUInteger length = *(void *)&v234.b;
        if (*(void *)&v234.b + *(void *)&v234.a > (unint64_t)v233)
        {
          v135.NSUInteger length = v233 - *(void *)&v234.a;
          *(void *)&v234.double b = v233 - *(void *)&v234.a;
        }
        NSRange v136 = NSIntersectionRange(v135, *(NSRange *)(extraData + 168));
        *(void *)&v234.double a = v136.location;
        *(void *)&v234.double b = v136.length;
        CGFloat v137 = COERCE_DOUBLE(-[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v136.location, v136.length, 0));
        unint64_t v139 = *(void *)&v137 + v138;
        v229.double a = v137;
        double v140 = 0.0;
        if (*(void *)&v137 < (unint64_t)(*(void *)&v137 + v138))
        {
          CGFloat v141 = v137;
          do
          {
            _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, *(unint64_t *)&v141, &v229);
            if (v142 > v140) {
              double v140 = v142;
            }
            *(void *)&CGFloat v141 = *(void *)&v229.a + *(void *)&v229.b;
            v229.double a = v141;
          }
          while (*(void *)&v141 < v139);
        }
        kedouble y = (void *)vcvtmd_s64_f64(v221 - v140 - v51 + 0.5);
        Value = (char *)CFDictionaryGetValue(Mutable, key);
        v232 = &Value[*(void *)&v234.b];
        CFDictionarySetValue(Mutable, key, &Value[*(void *)&v234.b]);
      }
      kedouble y = 0;
      v232 = 0;
      CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_maxApplierFunction, &key);
      if (v232) {
        double v71 = (double)(uint64_t)key;
      }
      else {
        double v71 = 0.0;
      }
      CFRelease(Mutable);
      *((double *)extraData + 20) = v71;
      double v54 = v203;
LABEL_176:
      if (v65 == 0x2000)
      {
        double v110 = (double)(unint64_t)v211;
        double v92 = v204;
      }
      else
      {
        if (v65 == 4096)
        {
          if (v70 >= 0.0) {
            double v70 = v55 * -0.0880554625;
          }
          double v144 = -v71;
          if (v36) {
            double v144 = v71;
          }
          double v107 = v68 - v144;
          if (v30)
          {
            memset(&v234, 0, sizeof(v234));
            CGContextGetUserSpaceToDeviceSpaceTransform(&v234, v29);
            double v145 = 1.0;
            if (v54 < 0.400000006) {
              double v145 = 0.0;
            }
            float v146 = v234.tx + v107 * v234.c + v234.a * 0.0;
            double v92 = v70;
            double v147 = roundf(v146);
            float v148 = v234.ty + v107 * v234.d + v234.b * 0.0;
            double v149 = v145 + ceilf(v148);
            CGAffineTransform v229 = v234;
            CGAffineTransformInvert(&v228, &v229);
            double v107 = v228.ty + v149 * v228.d + v228.b * v147;
            float v150 = v54;
            double v69 = fmaxf(roundf(v150), 1.0) / v54;
            double v110 = (double)(unint64_t)v211;
LABEL_233:
            unint64_t v170 = ((unint64_t)a4 >> 8) & 7;
            if (!v30)
            {
              if (v69 <= 0.0) {
                double v69 = v205 * v110 * 0.0440277313;
              }
              BOOL v171 = v65 == 0x2000 && v69 < 1.0;
              double v172 = v92 + -1.0;
              if (!v171) {
                double v172 = v92;
              }
              if (!v36) {
                double v172 = -v172;
              }
              double v107 = v107 - v172;
            }
            if (v170 - 1 > 3)
            {
              size_t v174 = 1;
            }
            else
            {
              uint64_t v173 = 2;
              if (v170 == 3) {
                uint64_t v173 = 4;
              }
              if (v170 == 4) {
                size_t v174 = 6;
              }
              else {
                size_t v174 = v173;
              }
              if (v170 >= 2)
              {
                lengths[0] = 10.0;
                if (v170 == 2) {
                  lengths[1] = 5.0;
                }
              }
              double v175 = ceil(v69 / v110);
              v176 = (float64x2_t *)lengths;
              size_t v177 = v174;
              do
              {
                float64x2_t *v176 = vmulq_n_f64(*v176, v175);
                ++v176;
                v177 -= 2;
              }
              while (v177);
            }
            NSUInteger v178 = v17 + v12;
            if ((*((unsigned char *)&self->_lmFlags + 3) & 2) == 0
              || !v12
              || ([(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v178 - 1] & 1) == 0)
            {
              if (v178 >= v225 + v213)
              {
                v185 = v215;
                BOOL v184 = (*((unsigned char *)&self->_lmFlags + 3) & 2) == 0
                    || ([(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v225] & 1) == 0;
                goto LABEL_275;
              }
              uint64_t v179 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17 + v12, 1, 0);
              uint64_t v181 = v180;
              id v182 = self->_firstTextView;
              if (v182
                && objc_msgSend((id)objc_msgSend(v182, "linkTextAttributes"), "objectForKey:", @"NSUnderline"))
              {
                BOOL v183 = 1;
                if (!v181)
                {
LABEL_264:
                  BOOL v184 = 1;
LABEL_273:
                  v185 = v215;
LABEL_275:
                  v186 = -[NSLayoutManager rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:](self, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v17, v12, 0x7FFFFFFFFFFFFFFFLL, 0, v185, &v235, *(void *)&v202);
                  if (v219)
                  {
                    if (v54 < 1.0 && v208)
                    {
                      float v187 = fmax(v54, 0.400000006);
                      v234.double a = 0.0;
                      v229.double a = 0.0;
                      *(void *)&long long v233 = 0;
                      kedouble y = 0;
                      [v208 getRed:&v234 green:&v229 blue:&v233 alpha:&key];
                      objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", objc_msgSend((Class)getNSColorClass[0](), "colorWithRed:green:blue:alpha:", v234.a, v229.a, *(double *)&v233, v187)), "set");
                    }
                    CGContextSetShouldAntialias(v29, 0);
                  }
                  else if (v208)
                  {
                    objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:"), "set");
                  }
                  CGContextSetLineWidth(v29, v69);
                  unint64_t v188 = v235;
                  if (v235)
                  {
                    unint64_t v189 = 0;
                    double v190 = v210 + x;
                    uint64_t v191 = v209 & !v218;
                    p_double width = &v186->size.width;
                    do
                    {
                      double v193 = *(p_width - 2);
                      double v194 = x + v193;
                      double v195 = x + v193 + *p_width;
                      ++v189;
                      double v196 = v195 + -1.0;
                      if (v189 < v188) {
                        double v196 = v195;
                      }
                      if (v184) {
                        double v197 = v196;
                      }
                      else {
                        double v197 = v195;
                      }
                      [(NSLayoutManager *)self locationForGlyphAtIndex:v225];
                      if (v174 >= 2) {
                        CGContextSetLineDash(v29, v194 - v198, lengths, v174);
                      }
                      double v199 = v107;
                      if ((a4 & 8) != 0)
                      {
                        -[NSLayoutManager _drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:](self, "_drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:", v17, v12, v29, v191, v36, v194, v197, v107 - v69, v69, v190, v227);
                        double v199 = v69 + v107;
                      }
                      -[NSLayoutManager _drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:](self, "_drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:", v17, v12, v29, v191, v36, v194, v197, v199, v69, v190, v227);
                      unint64_t v188 = v235;
                      p_width += 4;
                    }
                    while (v189 < v235);
                  }
                  return;
                }
              }
              else
              {
                BOOL v183 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultLinkAttributes"), "objectForKey:", @"NSUnderline") != 0;
                if (!v181) {
                  goto LABEL_264;
                }
              }
              if (!objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", v206, v179, 0, *(void *)&v202), "integerValue")&& (!v183|| !-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSLink", v179, 0))&& !objc_msgSend(-[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:",
                        v206,
                        v179,
                        0),
                      "integerValue"))
              {
                v200 = (void *)[(NSTextStorage *)self->_textStorage string];
                objc_msgSend(v200, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v179, v216 + v217 - v179);
                BOOL v184 = v201 != 0;
                goto LABEL_273;
              }
            }
            BOOL v184 = 0;
            goto LABEL_273;
          }
          double v151 = -(v54 * v70);
          double v152 = v54 * v51;
          double v153 = 0.0;
          if (i > 1) {
            double v153 = v54 * v69;
          }
          double v110 = (double)(unint64_t)v211;
          double v109 = v54 * v69 * v207;
          if ((a4 & 8) != 0)
          {
            if (v152 < 4.0 || (double v160 = v109 * 0.75, v160 <= 0.35))
            {
              double v109 = v152 * 0.25;
              double v151 = v152 * 0.25 * 2.5;
            }
            else
            {
              double v161 = v160 * 0.5 - v54 * v70;
              double v162 = v160 + -0.5;
              double v109 = ceil(v160 + -0.5);
              char v163 = vcvtpd_s64_f64(v162);
              if (v36) {
                double v164 = -v54;
              }
              else {
                double v164 = v54;
              }
              double v165 = v164 * v107 - floor(v164 * v107);
              double v166 = floor(v161 + 0.5);
              double v167 = floor(v161) + 0.5;
              if ((v163 & 1) == 0) {
                double v167 = v166;
              }
              double v151 = v165 + v167;
              if (v151 <= 1.5 || v109 >= 2.0 && (v151 < 3.0 || (v151 <= 3.0 ? (BOOL v168 = v152 < 7.0) : (BOOL v168 = 1), !v168))) {
                double v151 = v151 + 1.0;
              }
            }
            double v159 = 1.5;
          }
          else
          {
            if (v152 >= 2.0 && v109 > 0.35)
            {
              double v109 = ceil(v109);
              if (v109 >= v152 || v152 <= 4.0 && v109 >= 3.0 || v152 <= 2.5 && v109 >= 2.0) {
                double v109 = v109 + -1.0;
              }
              if (v36) {
                double v154 = -v54;
              }
              else {
                double v154 = v54;
              }
              double v155 = v154 * v107 - floor(v154 * v107);
              double v156 = floor(0.5 - v54 * v70);
              double v157 = floor(v151) + 0.5;
              if (((int)v109 & 1) == 0) {
                double v157 = v156;
              }
              double v151 = v155 + v157;
              if (v151 < 1.5 || (v151 <= 1.5 ? (BOOL v158 = v152 <= 4.0) : (BOOL v158 = 1), !v158)) {
                double v151 = v151 + 1.0;
              }
            }
            double v159 = 0.5;
          }
          double v169 = floor(v153 + v109 * v159);
          if (v151 >= v169) {
            double v169 = v151;
          }
          double v92 = v169 / -v54;
LABEL_232:
          double v69 = v109 / v54;
          goto LABEL_233;
        }
        double v92 = -v51;
        double v110 = (double)(unint64_t)v211;
      }
      double v107 = v68;
      goto LABEL_233;
    }
LABEL_138:
    *(void *)&long long v233 = --v77;
    goto LABEL_139;
  }
}

uint64_t __148__NSLayoutManager_OtherSupport___drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough___block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t result = [v0 objectForKey:@"NSUnderlinesBreakForDescenders"];
  if (result)
  {
    uint64_t result = [v0 BOOLForKey:@"NSUnderlinesBreakForDescenders"];
    _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__breakForDescendersDefault = result;
  }
  return result;
}

- (void)_lineGlyphRange:(_NSRange)a3 type:(int64_t)a4 lineFragmentRect:(CGRect)a5 lineFragmentGlyphRange:(_NSRange)a6 containerOrigin:(CGPoint)a7 isStrikethrough:(BOOL)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v10 = a3.length;
  double y = a7.y;
  double x = a7.x;
  double height = a5.size.height;
  double width = a5.size.width;
  double v15 = a5.origin.y;
  double v16 = a5.origin.x;
  NSUInteger v17 = a3.location;
  double v70 = (void *)[(NSTextStorage *)self->_textStorage string];
  if (!_NSUnderlineWhiteSet)
  {
    _NSUnderlineWhiteSet = (uint64_t)(id)[MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    _NSUnderlineNonWhiteSet = (uint64_t)(id)[(id)_NSUnderlineWhiteSet invertedSet];
  }
  [(NSTypesetter *)[(NSLayoutManager *)self typesetter] baselineOffsetInLayoutManager:self glyphIndex:v17];
  double v20 = v19;
  uint64_t v21 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17, v10, 0);
  NSUInteger v66 = location;
  NSUInteger v22 = location;
  unint64_t v24 = v23;
  uint64_t v63 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v22, length, 0);
  if (v24)
  {
    uint64_t v62 = v63 + v25;
    NSUInteger v26 = v21;
    unint64_t v27 = v24;
    NSUInteger v68 = length;
    while (1)
    {
      unint64_t v28 = objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineWhiteSet, 0, v26, v27);
      unint64_t v29 = v28;
      unint64_t v69 = v21;
      if (v30 && (v31 = v21 + v24, BOOL v32 = v21 + v24 >= v28, v33 = v21 + v24 - v28, v33 != 0 && v32))
      {
        NSUInteger v34 = length;
        unint64_t v35 = v24;
        unint64_t v36 = 0;
        unint64_t v37 = v28 - v31;
        while (1)
        {
          uint64_t v38 = [v70 characterAtIndex:v29 + v36];
          if (v38 == 160 || ![(id)_NSUnderlineWhiteSet characterIsMember:v38]) {
            break;
          }
          ++v36;
          if (!(v37 + v36))
          {
            unint64_t v36 = v33;
            break;
          }
        }
        unint64_t v24 = v35;
        NSUInteger length = v34;
      }
      else
      {
        unint64_t v36 = 0;
      }
      if ((*((unsigned char *)&self->_lmFlags + 3) & 2) != 0)
      {
        uint64_t v40 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v26, v27, 0);
        if (v41)
        {
          uint64_t v42 = v40;
          uint64_t v43 = v41;
          unint64_t v64 = v24;
          int v44 = [(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v40];
          unint64_t v45 = v42 + v43;
          unint64_t v46 = v42 + 1;
          if (v46 >= v45)
          {
LABEL_24:
            unint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            int v47 = v44;
            uint64_t v48 = v43 - 1;
            while (1)
            {
              if (((v47
                   - [(NSLayoutManager *)self intAttribute:2 forGlyphAtIndex:v46]) & 1) != 0)
              {
                NSUInteger v49 = [(NSLayoutManager *)self characterIndexForGlyphAtIndex:v46];
                if (v49 > v26) {
                  break;
                }
              }
              ++v46;
              if (!--v48) {
                goto LABEL_24;
              }
            }
            unint64_t v39 = v49;
          }
          NSUInteger length = v68;
          unint64_t v24 = v64;
          if (!v36) {
            goto LABEL_30;
          }
        }
        else
        {
          unint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
          NSUInteger length = v68;
          if (!v36) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        unint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v36) {
          goto LABEL_30;
        }
      }
      if (v39 == 0x7FFFFFFFFFFFFFFFLL || v29 < v39)
      {
        unint64_t v55 = v24;
        unint64_t v39 = v36 + v29;
        objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v63, v36 + v29 - v63);
        uint64_t v57 = v56;
        objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v29, v62 - v29);
        if (v57)
        {
          uint64_t v21 = v69;
          if ((a4 & 0x8000) == 0 && v58)
          {
            unint64_t v24 = v55;
            goto LABEL_43;
          }
          if (v29 > v69)
          {
            uint64_t v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v29 - v69, 0);
            uint64_t v52 = v59;
            unint64_t v24 = v69 + v55 - v39;
            unint64_t v27 = v26 + v27 - v39;
            NSUInteger v54 = v66;
            NSUInteger length = v68;
            if (!a8)
            {
LABEL_47:
              -[NSLayoutManager drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v50, v52, a4, v54, length, v20, v16, v15, width, height, x, y);
              goto LABEL_48;
            }
LABEL_36:
            -[NSLayoutManager drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v50, v52, a4, v54, length, v20, v16, v15, width, height, x, y);
LABEL_48:
            uint64_t v21 = v39;
            goto LABEL_49;
          }
          unint64_t v24 = v69 + v55 - v39;
          unint64_t v27 = v26 + v27 - v39;
          uint64_t v21 = v36 + v29;
        }
        else
        {
          unint64_t v24 = v69 + v55 - v39;
          uint64_t v21 = v36 + v29;
LABEL_43:
          unint64_t v27 = v26 + v27 - v39;
        }
        NSUInteger length = v68;
        goto LABEL_49;
      }
LABEL_30:
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!v24) {
          return;
        }
        uint64_t v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v24, 0);
        uint64_t v52 = v51;
        unint64_t v27 = 0;
        unint64_t v39 = v69 + v24;
        unint64_t v24 = 0;
LABEL_35:
        NSUInteger v54 = v66;
        if (!a8) {
          goto LABEL_47;
        }
        goto LABEL_36;
      }
      if (v39 > v69)
      {
        uint64_t v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v39 - v69, 0);
        uint64_t v52 = v53;
        unint64_t v24 = v69 + v24 - v39;
        unint64_t v27 = v24;
        goto LABEL_35;
      }
      unint64_t v24 = v69 + v24 - v39;
      uint64_t v21 = v39;
      unint64_t v27 = v24;
LABEL_49:
      NSUInteger v26 = v39;
      if (!v27)
      {
        if (v24)
        {
          uint64_t v61 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21, v24, 0);
          if (a8)
          {
            -[NSLayoutManager drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v61, v60, a4, v66, length, v20, v16, v15, width, height, x, y);
          }
          else
          {
            -[NSLayoutManager drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v61, v60, a4, v66, length, v20, v16, v15, width, height, x, y);
          }
        }
        return;
      }
    }
  }
}

+ (id)_defaultLinkAttributesForLabel
{
  if (_defaultLinkAttributesForLabel_onceToken != -1) {
    dispatch_once(&_defaultLinkAttributesForLabel_onceToken, &__block_literal_global_2);
  }
  return (id)_defaultLinkAttributesForLabel_defaultLinkAttributes;
}

uint64_t __60__NSLayoutManager_NSPrivate___defaultLinkAttributesForLabel__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", objc_msgSend((Class)getNSColorClass_0[0](), "linkColor"), @"NSColor", 0);
  _defaultLinkAttributesForLabel_defaultLinkAttributes = result;
  return result;
}

+ (id)_defaultLinkAttributes
{
  if (_defaultLinkAttributes_onceToken != -1) {
    dispatch_once(&_defaultLinkAttributes_onceToken, &__block_literal_global_2);
  }
  return (id)_defaultLinkAttributes_defaultLinkAttributes;
}

uint64_t __52__NSLayoutManager_NSPrivate___defaultLinkAttributes__block_invoke()
{
  uint64_t v0 = [(Class)getNSColorClass_0[0]() linkColor];
  id v1 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t result = objc_msgSend(v1, "initWithObjectsAndKeys:", v0, @"NSColor", objc_msgSend(NSNumber, "numberWithInteger:", 1), @"NSUnderline", 0);
  _defaultLinkAttributes_defaultLinkAttributes = result;
  return result;
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v7 = [(NSLayoutManager *)self delegate];
  if (((objc_opt_respondsToSelector() & 1) == 0
     || (id result = (id)[v7 layoutManager:self linkAttributesForLink:a3 forCharacterAtIndex:a4]) == 0)
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (id result = (id)[self->_firstTextView linkAttributesForLink:a3 forCharacterAtIndex:a4]) == 0))
  {
    id result = (id)[self->_firstTextView linkTextAttributes];
    if (!result)
    {
      BOOL v9 = [(NSAttributedString *)[(NSLayoutManager *)self textStorage] _isStringDrawingTextStorage];
      NSUInteger v10 = objc_opt_class();
      if (v9)
      {
        return (id)[v10 _defaultLinkAttributesForLabel];
      }
      else
      {
        return (id)[v10 _defaultLinkAttributes];
      }
    }
  }
  return result;
}

- (id)linkAttributesForAttributes:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v7 = [(NSLayoutManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[v7 layoutManager:self linkAttributesForAttributes:a3 forCharacterAtIndex:a4]) == 0)
  {
    uint64_t v9 = [a3 objectForKeyedSubscript:@"NSLink"];
    return [(NSLayoutManager *)self linkAttributesForLink:v9 forCharacterAtIndex:a4];
  }
  return result;
}

- (id)_rowArrayCache
{
  return (id)*((void *)self->_extraData + 52);
}

- (void)_setRowArrayCache:(id)a3
{
  id v3 = (id)*((void *)self->_extraData + 52);
  if (v3 != a3)
  {

    *((void *)self->_extraData + 52) = a3;
  }
}

- (_NSRange)_extendedCharRangeForInvalidation:(_NSRange)a3 editedCharRange:(_NSRange)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v7 = -[NSLayoutManager _blockRowRangeForCharRange:](self, "_blockRowRangeForCharRange:", a4.location, a4.length);
  v107.NSUInteger length = v8;
  v104.NSUInteger location = location;
  v104.NSUInteger length = length;
  v107.NSUInteger location = v7;
  NSUInteger v90 = v107.length;
  NSRange v9 = NSUnionRange(v104, v107);
  NSUInteger v10 = v9.location;
  NSUInteger v11 = v9.length;
  NSUInteger v12 = (void *)[(NSTextStorage *)self->_textStorage string];
  uint64_t v13 = [v12 length];
  __lmFlags lmFlags = self->_lmFlags;
  uint64_t v15 = 16;
  if ((*(_DWORD *)&lmFlags & 0x2000000) == 0) {
    uint64_t v15 = 56;
  }
  uint64_t v95 = v15;
  if (!v13) {
    goto LABEL_140;
  }
  unint64_t v16 = v13;
  typesetter = self->_typesetter;
  v103[0] = 0;
  v103[1] = 0;
  char v102 = 0;
  long long v98 = 0u;
  long long v99 = 0u;
  memset(v100, 0, sizeof(v100));
  long long v101 = 0u;
  firstUnlaidGlyphIndedouble x = 0;
  NSUInteger v97 = 0;
  if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
  {
    extraDatdouble a = self->_extraData;
    NSUInteger v97 = v13;
    firstUnlaidGlyphIndedouble x = *(void *)(extraData[26] + 8);
  }
  else
  {
    firstUnlaidCharIndedouble x = self->_firstUnlaidCharIndex;
    if (firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:&v97 glyphIndex:&firstUnlaidGlyphIndex];
    }
    else
    {
      firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex;
      NSUInteger v97 = firstUnlaidCharIndex;
    }
  }
  uint64_t v20 = [(NSTypesetter *)typesetter attributedString];
  textStorage = self->_textStorage;
  *((void *)&v99 + 1) = v16;
  *(void *)&v100[0] = v9.location;
  if ((NSTextStorage *)v20 != textStorage) {
    typesetter = 0;
  }
  *(void *)&long long v99 = v12;
  if (v16 <= v9.location)
  {
    *(void *)&long long v98 = 0;
    __int16 v23 = -1;
  }
  else
  {
    if (v16 - v9.location >= 0x20) {
      uint64_t v22 = 32;
    }
    else {
      uint64_t v22 = v16 - v9.location;
    }
    *(void *)&long long v98 = v22;
    objc_msgSend(v12, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v9.location, v22);
    __int16 v23 = WORD4(v100[0]);
  }
  WORD4(v101) = v23;
  *((void *)&v98 + 1) = 1;
  NSUInteger v89 = v7;
  if (!v9.location) {
    goto LABEL_88;
  }
  unint64_t v91 = v16;
  if (v9.location == [v12 length])
  {
    unint64_t v24 = *((void *)&v98 + 1);
    if (*((void *)&v98 + 1) < 2uLL)
    {
      if (*(void *)&v100[0])
      {
        if (*(void *)&v100[0] >= 0x20uLL) {
          uint64_t v25 = 32;
        }
        else {
          uint64_t v25 = *(void *)&v100[0];
        }
        *(void *)&long long v98 = v25;
        *((void *)&v98 + 1) = v25;
        *(void *)&v100[0] -= v25;
        uint64_t v26 = *(void *)&v100[0];
        unint64_t v27 = v12;
        unint64_t v28 = (void *)v99;
        Uidouble d = sel_getUid("getCharacters:range:");
        uint64_t v30 = v28;
        NSUInteger v12 = v27;
        objc_msgSend(v30, Uid, (char *)v100 + 8, v26, v25);
        unint64_t v31 = (char *)v100 + 2 * *((void *)&v98 + 1) + 8;
LABEL_45:
        __int16 v33 = *((_WORD *)v31 - 1);
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    goto LABEL_39;
  }
  if (WORD4(v101) > 0x84u)
  {
    if (WORD4(v101) - 8232 >= 2 && WORD4(v101) != 133) {
      goto LABEL_48;
    }
  }
  else if (WORD4(v101) != 10 && WORD4(v101) != 12)
  {
    if (WORD4(v101) != 13) {
      goto LABEL_48;
    }
    unint64_t v32 = *((void *)&v98 + 1) + *(void *)&v100[0];
    if (v32 < [v12 length] && objc_msgSend(v12, "characterAtIndex:", v32) == 10) {
      goto LABEL_48;
    }
  }
  unint64_t v24 = *((void *)&v98 + 1);
  if (!typesetter)
  {
LABEL_38:
    if (v24 < 2)
    {
      if (*(void *)&v100[0])
      {
        NSUInteger v34 = v12;
        if (*(void *)&v100[0] >= 0x20uLL) {
          uint64_t v35 = 32;
        }
        else {
          uint64_t v35 = *(void *)&v100[0];
        }
        *(void *)&long long v98 = v35;
        *((void *)&v98 + 1) = v35;
        *(void *)&v100[0] -= v35;
        uint64_t v36 = *(void *)&v100[0];
        unint64_t v37 = (void *)v99;
        uint64_t v38 = sel_getUid("getCharacters:range:");
        uint64_t v39 = v36;
        unint64_t v16 = v91;
        uint64_t v40 = v35;
        NSUInteger v12 = v34;
        objc_msgSend(v37, v38, (char *)v100 + 8, v39, v40);
        unint64_t v31 = (char *)v100 + 2 * *((void *)&v98 + 1) + 8;
        goto LABEL_45;
      }
LABEL_46:
      *((void *)&v98 + 1) = 0;
      __int16 v33 = -1;
LABEL_47:
      WORD4(v101) = v33;
      NSUInteger v11 = v9.length + 1;
      NSUInteger v10 = v9.location - 1;
      if (v9.location == 1) {
        goto LABEL_88;
      }
      goto LABEL_48;
    }
LABEL_39:
    *((void *)&v98 + 1) = v24 - 1;
    __int16 v33 = *((_WORD *)v100 + v24 + 2);
    goto LABEL_47;
  }
  if (([(NSTypesetter *)typesetter actionForControlCharacterAtIndex:*(void *)&v100[0] + *((void *)&v98 + 1) - 1] & v95) != 0)
  {
    unint64_t v24 = *((void *)&v98 + 1);
    goto LABEL_38;
  }
LABEL_48:
  double v93 = v12;
  uint64_t v88 = 0;
  unint64_t v41 = 0;
  CGFloat v42 = *MEMORY[0x1E4F28AD8];
  double v43 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v45 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v44 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  char v46 = 1;
  while (WORD4(v101) > 0x84u)
  {
    if (WORD4(v101) - 8232 < 2 || WORD4(v101) == 133) {
      goto LABEL_60;
    }
LABEL_62:
    unint64_t v49 = v41 + 1;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 2) != 0) {
      goto LABEL_76;
    }
    if (v10 >= v97) {
      goto LABEL_76;
    }
    unint64_t v50 = [(NSLayoutManager *)self _glyphIndexForCharacterIndex:v10 startOfRange:1 okToFillHoles:0 considerNulls:1];
    if (v50 >= firstUnlaidGlyphIndex) {
      goto LABEL_76;
    }
    double v51 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v50, v103);
    double v55 = v51;
    double v56 = v52;
    double v57 = v53;
    double v58 = v54;
    if (v46)
    {
      CGFloat v42 = v51;
      double v43 = v52;
      CGFloat v45 = v53;
      double v44 = v54;
    }
    v110.origin.double x = v42;
    v110.origin.double y = v43;
    v110.size.double width = v45;
    v110.size.double height = v44;
    if (NSEqualRects(*(NSRect *)&v51, v110))
    {
      char v46 = 0;
    }
    else
    {
      if (v56 == v43 && v58 == v44)
      {
        char v46 = 0;
LABEL_75:
        CGFloat v42 = v55;
        double v43 = v56;
        CGFloat v45 = v57;
        double v44 = v58;
        goto LABEL_76;
      }
      char v46 = 0;
      unint64_t v59 = ++v88;
      if (v49 < 0xB) {
        goto LABEL_75;
      }
      CGFloat v42 = v55;
      double v43 = v56;
      CGFloat v45 = v57;
      double v44 = v58;
      if (v59 >= 2) {
        goto LABEL_86;
      }
    }
LABEL_76:
    uint64_t v60 = *((void *)&v98 + 1);
    if (*((void *)&v98 + 1) < 2uLL)
    {
      if (*(void *)&v100[0])
      {
        if (*(void *)&v100[0] >= 0x20uLL) {
          uint64_t v62 = 32;
        }
        else {
          uint64_t v62 = *(void *)&v100[0];
        }
        *(void *)&long long v98 = v62;
        *((void *)&v98 + 1) = v62;
        *(void *)&v100[0] -= v62;
        uint64_t v63 = *(void *)&v100[0];
        unint64_t v64 = (void *)v99;
        int64_t v65 = sel_getUid("getCharacters:range:");
        uint64_t v66 = v63;
        unint64_t v16 = v91;
        objc_msgSend(v64, v65, (char *)v100 + 8, v66, v62);
        __int16 v61 = *((_WORD *)v100 + *((void *)&v98 + 1) + 3);
      }
      else
      {
        *((void *)&v98 + 1) = 0;
        __int16 v61 = -1;
      }
    }
    else
    {
      --*((void *)&v98 + 1);
      __int16 v61 = *((_WORD *)v100 + v60 + 2);
    }
    WORD4(v101) = v61;
    unint64_t v41 = v49;
    if (!--v10)
    {
      v11 += v49;
      goto LABEL_87;
    }
  }
  if (WORD4(v101) != 10 && WORD4(v101) != 12)
  {
    if (WORD4(v101) != 13) {
      goto LABEL_62;
    }
    unint64_t v48 = *((void *)&v98 + 1) + *(void *)&v100[0];
    if (v48 < [v93 length] && objc_msgSend(v93, "characterAtIndex:", v48) == 10) {
      goto LABEL_62;
    }
  }
LABEL_60:
  if (typesetter
    && ([(NSTypesetter *)typesetter actionForControlCharacterAtIndex:*(void *)&v100[0] + *((void *)&v98 + 1) - 1] & v95) == 0)
  {
    goto LABEL_62;
  }
LABEL_86:
  ++v10;
  NSUInteger v11 = v11 + v41 - 1;
LABEL_87:
  NSUInteger v12 = v93;
LABEL_88:
  unint64_t v67 = v10 + v11;
  if (v10 + v11 >= v16) {
    goto LABEL_138;
  }
  if (!v11) {
    goto LABEL_102;
  }
  unint64_t v68 = v67 - 1;
  if (v67 - 1 > v89 + v90) {
    goto LABEL_103;
  }
  int v69 = [v12 characterAtIndex:v67 - 1];
  if (v69 > 132)
  {
    if ((v69 - 8232) < 2 || v69 == 133) {
      goto LABEL_100;
    }
LABEL_103:
    int v70 = (*(_DWORD *)&self->_lmFlags >> 25) & 1;
    if (v67 + 30000 > v16) {
      int v70 = 1;
    }
    *((void *)&v99 + 1) = v16;
    *(void *)&v100[0] = v68;
    if (v70) {
      unint64_t v71 = v16;
    }
    else {
      unint64_t v71 = v67 + 30000;
    }
    *(void *)&long long v99 = v12;
    double v94 = v12;
    if (v16 <= v68)
    {
      *(void *)&long long v98 = 0;
      unsigned __int16 v74 = -1;
    }
    else
    {
      NSUInteger v72 = v12;
      if (v16 - v68 >= 0x20) {
        uint64_t v73 = 32;
      }
      else {
        uint64_t v73 = v16 - v68;
      }
      *(void *)&long long v98 = v73;
      objc_msgSend(v72, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v68, v73);
      unsigned __int16 v74 = WORD4(v100[0]);
    }
    WORD4(v101) = v74;
    *((void *)&v98 + 1) = 1;
    NSUInteger v92 = v16 - v10;
    while (1)
    {
      if (v74 > 0x84u)
      {
        if (v74 - 8232 >= 2 && v74 != 133) {
          goto LABEL_126;
        }
      }
      else if (v74 != 10 && v74 != 12)
      {
        if (v74 != 13) {
          goto LABEL_126;
        }
        unint64_t v75 = *((void *)&v98 + 1) + *(void *)&v100[0];
        if (v75 < [v94 length] && objc_msgSend(v94, "characterAtIndex:", v75) == 10) {
          goto LABEL_126;
        }
      }
      if (!typesetter
        || ([(NSTypesetter *)typesetter actionForControlCharacterAtIndex:*(void *)&v100[0] + *((void *)&v98 + 1) - 1] & v95) != 0)
      {
        goto LABEL_138;
      }
LABEL_126:
      long long v76 = v98;
      if (*((void *)&v98 + 1) < (unint64_t)v98)
      {
        ++*((void *)&v98 + 1);
        __int16 v77 = *((_WORD *)v100 + *((void *)&v76 + 1) + 4);
LABEL_134:
        WORD4(v101) = v77;
        goto LABEL_135;
      }
      uint64_t v78 = *(void *)&v100[0] + v98;
      if (*((void *)&v99 + 1) <= *(void *)&v100[0] + (void)v98)
      {
        *((void *)&v98 + 1) = v98 + 1;
        __int16 v77 = -1;
        goto LABEL_134;
      }
      if (*((void *)&v99 + 1) - (*(void *)&v100[0] + (void)v98) >= 0x20uLL) {
        uint64_t v79 = 32;
      }
      else {
        uint64_t v79 = *((void *)&v99 + 1) - (*(void *)&v100[0] + v98);
      }
      *(void *)&v100[0] += v98;
      *(void *)&long long v98 = v79;
      objc_msgSend((id)v99, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v78, v79);
      WORD4(v101) = WORD4(v100[0]);
      *((void *)&v98 + 1) = 1;
LABEL_135:
      if (v10 + 1 + v11 >= v71)
      {
        NSUInteger v11 = v92;
        goto LABEL_138;
      }
      unsigned __int16 v74 = WORD4(v101);
      ++v11;
    }
  }
  if (v69 != 10
    && v69 != 12
    && (v69 != 13
     || v67 < [v12 length] && objc_msgSend(v12, "characterAtIndex:", v10 + v11) == 10))
  {
    goto LABEL_103;
  }
LABEL_100:
  if (typesetter
    && ([(NSTypesetter *)typesetter actionForControlCharacterAtIndex:v67 - 1] & v95) == 0)
  {
    goto LABEL_103;
  }
LABEL_102:
  ++v11;
  unint64_t v68 = v67;
  unint64_t v67 = v10 + v11;
  if (v10 + v11 < v16) {
    goto LABEL_103;
  }
LABEL_138:
  NSUInteger v80 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v10, v11, &v102);
  NSUInteger v82 = v81;
  v105.NSUInteger location = v10;
  v105.NSUInteger length = v11;
  v108.NSUInteger location = v80;
  v108.NSUInteger length = v82;
  NSRange v83 = NSUnionRange(v105, v108);
  NSUInteger location = v83.location;
  NSUInteger length = v83.length;
  if (!v102)
  {
    v109.NSUInteger location = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v80, v82);
    v109.NSUInteger length = v84;
    NSRange v85 = NSUnionRange(v83, v109);
    NSUInteger location = v85.location;
    NSUInteger length = v85.length;
  }
LABEL_140:
  NSUInteger v86 = location;
  NSUInteger v87 = length;
  result.NSUInteger length = v87;
  result.NSUInteger location = v86;
  return result;
}

- (BOOL)_canDoLayout
{
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000) {
    return ![(NSTextStorage *)self->_textStorage _isEditing];
  }
  else {
    return 1;
  }
}

- (void)_fillGlyphHoleAtIndex:(unint64_t)a3 desiredNumberOfCharacters:(unint64_t)a4
{
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v8 = 0;
  unint64_t v5 = 2048;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 8) == 0) {
    unint64_t v5 = 0x2000;
  }
  if (!a4) {
    a4 = **((void **)self->_extraData + 26);
  }
  if (a4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = a4;
  }
  _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, v6, &v9, &v8, &v10);
  unint64_t v7 = v8;
  if (v8 > v6)
  {
    unint64_t v8 = v6;
    unint64_t v7 = v6;
  }
  -[NSLayoutManager _fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:](self, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:", v9, v7, v10, v7);
}

- (void)_fillGlyphHoleForCharacterRange:(_NSRange)a3 startGlyphIndex:(unint64_t)a4 desiredNumberOfCharacters:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v17 = 0;
  NSUInteger v18 = 0;
  NSUInteger v19 = 0;
  if ((*(_DWORD *)&self->_lmFlags & 0x8000000) != 0) {
    unint64_t v9 = 2048;
  }
  else {
    unint64_t v9 = 0x2000;
  }
  extraDatdouble a = (atomic_ullong *)self->_extraData;
  BOOL v11 = [(NSAttributedString *)[(NSLayoutManager *)self textStorage] _isStringDrawingTextStorage];
  if (!v11 && !extraData[7])
  {
    NSUInteger v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
    uint64_t v13 = 0;
    atomic_compare_exchange_strong(extraData + 7, (unint64_t *)&v13, (unint64_t)v12);
    if (v13) {
  }
    }
  [(id)extraData[7] lock];
  BOOL v14 = [(NSTextStorage *)self->_textStorage _lockForReading];
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000
    && [(NSTextStorage *)self->_textStorage _isEditing])
  {
    if (v14) {
      [(NSTextStorage *)self->_textStorage _unlock];
    }
    if (!v11) {
      [*((id *)self->_extraData + 7) unlock];
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** attempted glyph generation while textStorage is editing.  It is not valid to cause the layoutManager to do glyph generation while the textStorage is editing (ie the textStorage has been sent a beginEditing message without a matching endEditing.)", _NSFullMethodName() format];
  }
  if ((*((unsigned char *)&self->_lmFlags + 2) & 8) != 0) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"*** layout manager %p reentrant glyph generation problem.", self);
  }
  if (a5) {
    unint64_t v15 = a5;
  }
  else {
    unint64_t v15 = length;
  }
  if (v15 <= v9) {
    unint64_t v15 = v9;
  }
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  self->_newlyFilledGlyphRange.NSUInteger location = a4;
  self->_newlyFilledGlyphRange.NSUInteger length = 0;
  if (length >= v15) {
    NSUInteger length = v15;
  }
  *(_DWORD *)&self->_lmFlags |= 0x80000u;
  [(NSTextStorage *)self->_textStorage _setForceFixAttributes:1];
  unint64_t v17 = a4;
  NSUInteger v18 = location;
  [(NSGlyphGenerator *)[(NSLayoutManager *)self glyphGenerator] generateGlyphsForGlyphStorage:self desiredNumberOfCharacters:length glyphIndex:&v17 characterIndex:&v18];
  NSUInteger v19 = v18 - location;
  [(NSTextStorage *)self->_textStorage _setForceFixAttributes:0];
  *(_DWORD *)&self->_lmFlags &= ~0x80000u;
  self->_newlyFilledGlyphRange = (_NSRange)xmmword_18E5F72A0;
  if (v14) {
    [(NSTextStorage *)self->_textStorage _unlock];
  }
  if (!v11) {
    [*((id *)self->_extraData + 7) unlock];
  }
}

- (BOOL)_doOptimizedLayoutStartingAtGlyphIndex:(unint64_t)a3 forCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 lineLimit:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7
{
  *a7 = a3;
  return 0;
}

- (void)_doLayoutWithFullContainerStartingAtGlyphIndex:(unint64_t)a3 nextGlyphIndex:(unint64_t *)a4
{
  uint64_t v7 = *((void *)self->_extraData + 26);
  unint64_t v8 = *(void *)(v7 + 8);
  if ((*(unsigned char *)(v7 + 56) & 1) == 0) {
    -[NSLayoutManager _setExtraLineFragmentRect:usedRect:textContainer:](self, "_setExtraLineFragmentRect:usedRect:textContainer:", 0, *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24), *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
  }
  if (v8 <= a3)
  {
    unint64_t v8 = a3;
  }
  else
  {
    -[NSLayoutManager _setTextContainer:forGlyphRange:](self, "_setTextContainer:forGlyphRange:", 0, a3, v8 - a3);
    -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", a3, v8 - a3, *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24), *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
    -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", a3, v8 - a3, *MEMORY[0x1E4F28AD0], *(double *)(MEMORY[0x1E4F28AD0] + 8));
    unint64_t v9 = (void *)*((void *)self->_extraData + 23);
    if (v9) {
      _NSRemoveTextBlocksStartingAtGlyphIndex(v9, a3);
    }
  }
  *a4 = v8;
}

- (void)_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:(unint64_t)a3
{
  [self->_firstTextView visibleRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [self->_firstTextView textContainerOrigin];
  double v14 = v13;
  double v16 = v15;
  v31.origin.double x = v6;
  v31.origin.double y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  if (!NSIsEmptyRect(v31))
  {
    double v17 = v6 - v14;
    double v18 = v8 - v16;
    uint64_t v19 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", [self->_firstTextView textContainer], v17, v18, v10, v12);
    if (v20)
    {
      unint64_t v21 = v19;
      unint64_t v22 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v19, v20);
      if (v23) {
        BOOL v24 = v22 >= a3;
      }
      else {
        BOOL v24 = 0;
      }
      if (v24)
      {
        unint64_t v25 = v22;
        unint64_t v26 = v23;
        double v27 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v21, 0);
        unint64_t v28 = (unint64_t *)((char *)self->_extraData + 352);
        *unint64_t v28 = v25;
        v28[1] = v26;
        unint64_t v29 = (double *)((char *)self->_extraData + 368);
        *unint64_t v29 = v17 - v27;
        v29[1] = v18 - v30;
      }
    }
  }
}

- (void)_fillLayoutHoleForCharacterRange:(_NSRange)a3 desiredNumberOfLines:(unint64_t)a4 isSoft:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger range2 = [(NSTextStorage *)self->_textStorage length];
  double v151 = 0;
  v152[0] = 0;
  extraDatdouble a = (atomic_ullong *)self->_extraData;
  BOOL v148 = [(NSAttributedString *)[(NSLayoutManager *)self textStorage] _isStringDrawingTextStorage];
  if (!v148 && !extraData[7])
  {
    double v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
    uint64_t v12 = 0;
    atomic_compare_exchange_strong(extraData + 7, (unint64_t *)&v12, (unint64_t)v11);
    if (v12) {
  }
    }
  [(id)extraData[7] lock];
  BOOL v13 = [(NSTextStorage *)self->_textStorage _lockForReading];
  if (!a5
    && (*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0
    && self->_firstTextView
    && !*((void *)self->_extraData + 45))
  {
    [(NSLayoutManager *)self _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:location];
  }
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000
    && [(NSTextStorage *)self->_textStorage _isEditing])
  {
    if (v13) {
      [(NSTextStorage *)self->_textStorage _unlock];
    }
    if (!v148) {
      [*((id *)self->_extraData + 7) unlock];
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** attempted layout while textStorage is editing.  It is not valid to cause the layoutManager to do layout while the textStorage is editing (ie the textStorage has been sent a beginEditing message without a matching endEditing.)", _NSFullMethodName() format];
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(unsigned char *)&lmFlags & 8) == 0)
  {
    ++self->_textViewResizeDisableStack;
    __lmFlags lmFlags = self->_lmFlags;
  }
  if ((*(_WORD *)&lmFlags & 0x2000) == 0) {
    goto LABEL_20;
  }
  extraLineFragmentContainer = self->_extraLineFragmentContainer;
  if (extraLineFragmentContainer) {
    goto LABEL_22;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:v152];
    firstUnlaidGlyphIndedouble x = v152[0];
    if (v152[0]) {
      goto LABEL_32;
    }
LABEL_70:
    extraLineFragmentContainer = (NSTextContainer *)*((void *)self->_extraData + 10);
    goto LABEL_22;
  }
  v152[0] = self->_firstUnlaidGlyphIndex;
  if (!firstUnlaidGlyphIndex) {
    goto LABEL_70;
  }
LABEL_32:
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    extraLineFragmentContainer = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v23 = firstUnlaidGlyphIndex - 1;
    if ([(NSRunStorage *)self->_containerRuns count] <= firstUnlaidGlyphIndex - 1)
    {
LABEL_20:
      extraLineFragmentContainer = 0;
      goto LABEL_22;
    }
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v23, 0);
    unint64_t v26 = 0;
    if (containerRuns->_gapBlockIndex <= v25) {
      unint64_t v26 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    extraLineFragmentContainer = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8)
                                                                                * (v26 + v25)];
  }
LABEL_22:
  BOOL v146 = v13;
  double v16 = (char *)-[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, 1, 0);
  __lmFlags v17 = self->_lmFlags;
  if ((*(unsigned char *)&v17 & 1) == 0)
  {
    if ((*(_DWORD *)&v17 & 0x8000000) != 0)
    {
      if ([*((id *)self->_extraData + 23) count])
      {
        NSUInteger v18 = range2 - location;
        NSUInteger v19 = location;
      }
      else
      {
        v153.NSUInteger location = location;
        v153.NSUInteger length = length;
        v154.NSUInteger location = 0;
        v154.NSUInteger length = range2;
        NSRange v27 = NSIntersectionRange(v153, v154);
        NSUInteger v19 = v27.location;
        NSUInteger v18 = v27.length;
      }
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:", v19, v18, 0, 0);
    }
    uint64_t v28 = -[NSTypesetter layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:]([(NSLayoutManager *)self typesetter], "layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:", location, length, self, a4);
    uint64_t v30 = v29;
    unint64_t v136 = v28;
    uint64_t v31 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:");
    int64_t v20 = v32;
    CGFloat v141 = (unsigned char *)v31;
    double v151 = (char *)(v31 + v32);
    uint64_t v135 = v30;
    if (v16 == (char *)(v31 + v32) && (__int16 v33 = self->_extraData, (unint64_t)v16 < *(void *)(v33[26] + 8)))
    {
      *(_OWORD *)value = xmmword_18E5F72A0;
      if (v33[23])
      {
        int64_t v34 = v32;
        uint64_t v35 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", location, 0), "textBlocks");
        if (v35 && (uint64_t v36 = v35, [v35 count]))
        {
          unint64_t v37 = (void *)[v36 objectAtIndex:0];
          objc_opt_class();
          double v144 = v37;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v38 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](self->_textStorage, "_rangeOfTextTableRow:atIndex:", [v37 table], location);
            uint64_t v40 = v39;
            unint64_t v41 = (void *)-[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v38, v39);
            uint64_t v43 = v38;
            value[0] = v41;
            value[1] = v42;
          }
          else
          {
            uint64_t v40 = 0;
            uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
            CGFloat v42 = value[1];
          }
          int64_t v20 = v34;
          if (!v42)
          {
            [(NSLayoutManager *)self layoutRectForTextBlock:v144 atIndex:location effectiveRange:value];
            if (value[1])
            {
              uint64_t v43 = [(NSLayoutManager *)self _primitiveCharacterRangeForGlyphRange:value[0]];
              uint64_t v40 = v109;
            }
            else
            {
              uint64_t v110 = [(NSAttributedString *)self->_textStorage rangeOfTextBlock:v144 atIndex:location];
              uint64_t v40 = v111;
              double v112 = (void *)-[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v110, v111);
              uint64_t v43 = v110;
              int64_t v20 = v34;
              value[0] = v112;
              value[1] = v113;
            }
          }
        }
        else
        {
          uint64_t v40 = 0;
          uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
          int64_t v20 = v34;
        }
      }
      else
      {
        uint64_t v40 = 0;
        uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v43 && v40 && value[1] && v16 > value[0])
      {
        uint64_t v140 = v43;
        __n128 v149 = 0uLL;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          unint64_t v145 = (unint64_t)(v16 - 1);
          v149.n128_u64[1] = *(void *)(*((void *)self->_extraData + 26) + 8);
          double v117 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
          if (v117) {
            goto LABEL_234;
          }
        }
        else if ([(NSRunStorage *)self->_containerRuns count] > (unint64_t)(v16 - 1))
        {
          double v114 = self->_containerRuns;
          unint64_t v145 = (unint64_t)(v16 - 1);
          _NSBlockNumberForIndex(v114, (unint64_t)(v16 - 1), &v149);
          unint64_t v116 = v114->_gapBlockIndex <= v115 ? v114->_maxBlocks - v114->_numBlocks : 0;
          double v117 = *(void **)&v114->_runs->var1[(v114->_elementSize + 8) * (v116 + v115)];
          if (v117)
          {
LABEL_234:
            unint64_t v118 = v149.n128_u64[0];
            if ((void *)v149.n128_u64[0] == value[0])
            {
              int64_t v139 = v20;
              uint64_t v119 = (char *)value[1];
              v120 = (char *)value[1] + v149.n128_u64[0] - (void)v16;
              double v121 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v145, 0);
              double v123 = v122;
              double v125 = v124;
              double v127 = v126;
              [v117 size];
              double v129 = 10000000.0;
              if (v128 > 0.0) {
                double v129 = v128;
              }
              double v130 = v123 + v127;
              double v131 = v129 - v130;
              if (v131 >= 0.0) {
                double v132 = v131;
              }
              else {
                double v132 = 0.0;
              }
              -[NSLayoutManager setTextContainer:forGlyphRange:](self, "setTextContainer:forGlyphRange:", v117, v16, v120);
              -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", v16, v120, v121, v130, v125, v132, v121, v130, v125, v132);
              -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", v16, v120, *MEMORY[0x1E4F28AD0], *(double *)(MEMORY[0x1E4F28AD0] + 8));
              double v133 = &v119[v118];
              if (v16 < v133)
              {
                v134 = v16;
                do
                  [(NSLayoutManager *)self setNotShownAttribute:1 forGlyphAtIndex:v134++];
                while (v133 != v134);
              }
              uint64_t v40 = 0;
              double v151 = v133;
              uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
              int64_t v20 = v139;
            }
          }
        }
LABEL_48:
        uint64_t v143 = v40;
        if ([(NSLayoutManager *)self hasNonContiguousLayout]) {
          int v44 = ![(NSLayoutManager *)self isScrolling];
        }
        else {
          int v44 = 1;
        }
        int v142 = v44;
        goto LABEL_52;
      }
      uint64_t v40 = 0;
      *(_DWORD *)&self->_lmFlags |= 1u;
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_48;
  }
  if (*(unsigned char *)(*((void *)self->_extraData + 26) + 56)) {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, (unint64_t)v16, 0x9C4uLL);
  }
  [(NSLayoutManager *)self _doLayoutWithFullContainerStartingAtGlyphIndex:v16 nextGlyphIndex:&v151];
  int64_t v20 = v151 - v16;
  unint64_t v136 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v16, v151 - v16);
  uint64_t v135 = v21;
  int v142 = 0;
  uint64_t v143 = 0;
  uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
  CGFloat v141 = v16;
LABEL_52:
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, (unint64_t)v151, 1uLL);
  self->_firstUnlaidGlyphIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_firstUnlaidCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  long long v45 = xmmword_18E5F72A0;
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  id v46 = self->_extraData;
  int64_t v138 = v20;
  if (!v20)
  {
    LODWORD(v47) = 0;
    goto LABEL_77;
  }
  uint64_t v47 = *((void *)v46 + 49);
  if (!v47) {
    goto LABEL_77;
  }
  unint64_t v48 = (unint64_t)&v141[v20 - 1];
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    uint64_t v52 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else if ([(NSRunStorage *)self->_containerRuns count] <= v48)
  {
    uint64_t v52 = 0;
  }
  else
  {
    unint64_t v49 = self->_containerRuns;
    _NSBlockNumberForIndex(v49, v48, 0);
    unint64_t v51 = 0;
    if (v49->_gapBlockIndex <= v50) {
      unint64_t v51 = v49->_maxBlocks - v49->_numBlocks;
    }
    uint64_t v52 = *(void *)&v49->_runs->var1[(v49->_elementSize + 8) * (v51 + v50)];
  }
  long long v45 = xmmword_18E5F72A0;
  id v46 = self->_extraData;
  if (v52 != *((void *)v46 + 51) || v136 < *((void *)v46 + 48)) {
    goto LABEL_76;
  }
  unint64_t v53 = *((void *)v46 + 49) + *((void *)v46 + 48);
  if (v136 + v135 != v53)
  {
LABEL_73:
    if (v136 + v135 < v53)
    {
      value[0] = 0;
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, (unint64_t)v151, (unint64_t *)value);
      double v56 = (char *)value[0];
      if (value[0] == v151)
      {
        char v137 = 1;
        goto LABEL_85;
      }
      LODWORD(v47) = 0;
      id v46 = self->_extraData;
      goto LABEL_218;
    }
LABEL_76:
    LODWORD(v47) = 0;
    goto LABEL_77;
  }
  _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v48, 0);
  id v46 = self->_extraData;
  if (vabdd_f64(v54 + v55, *((double *)v46 + 50)) >= 0.01)
  {
    unint64_t v53 = *((void *)v46 + 49) + *((void *)v46 + 48);
    long long v45 = xmmword_18E5F72A0;
    goto LABEL_73;
  }
  LODWORD(v47) = 1;
LABEL_218:
  long long v45 = xmmword_18E5F72A0;
LABEL_77:
  *((_OWORD *)v46 + 24) = v45;
  *((void *)self->_extraData + 50) = 0;
  *((void *)self->_extraData + 51) = 0;
  if (v47)
  {
    char v137 = 1;
    double v56 = v151;
    goto LABEL_85;
  }
  double v56 = v151;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    char v137 = 0;
LABEL_85:
    if (*(void *)(*((void *)self->_extraData + 26) + 8) > (unint64_t)v56)
    {
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        CFDictionaryRef v66 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else
      {
        unint64_t v62 = (unint64_t)(v56 - 1);
        if ([(NSRunStorage *)self->_containerRuns count] <= (unint64_t)(v56 - 1))
        {
          CFDictionaryRef v66 = 0;
        }
        else
        {
          uint64_t v63 = self->_containerRuns;
          _NSBlockNumberForIndex(v63, v62, 0);
          unint64_t v65 = 0;
          if (v63->_gapBlockIndex <= v64) {
            unint64_t v65 = v63->_maxBlocks - v63->_numBlocks;
          }
          CFDictionaryRef v66 = *(CFDictionaryRef *)&v63->_runs->var1[(v63->_elementSize + 8) * (v65 + v64)];
        }
      }
      value[0] = 0;
      unint64_t v67 = (CFDictionaryRef *)self->_extraData;
      if (v67[10] == v66)
      {
        uint64_t v68 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(v67[11], v66, (const void **)value))
      {
        uint64_t v68 = (uint64_t)value[0];
      }
      else
      {
        uint64_t v68 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v69 = [(NSMutableArray *)self->_textContainers count];
      if (v68 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v70 = v69;
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v68, v69 - v68);
        unint64_t v71 = v68 + 1;
        if (v71 < v70)
        {
          do
            CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)[(NSMutableArray *)self->_textContainers objectAtIndex:v71++]);
          while (v70 != v71);
        }
      }
    }
    goto LABEL_102;
  }
  unint64_t v57 = *(void *)(*((void *)self->_extraData + 26) + 8);
  if (v57 <= (unint64_t)v151)
  {
    char v137 = 0;
  }
  else
  {
    unint64_t v58 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v151);
    unint64_t v59 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v57) - v58;
    __lmFlags v60 = self->_lmFlags;
    int v61 = *(unsigned char *)&v60 & 1;
    if ((*(_DWORD *)&v60 & 0x8100000) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:", v58, v59, 0, 0);
      __lmFlags v60 = self->_lmFlags;
    }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:", v58, v59, 0, (*(unsigned int *)&v60 >> 30) & 1);
    char v137 = 0;
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFFE | v61);
  }
LABEL_102:
  NSUInteger v72 = self->_extraData;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    uint64_t v78 = *(char **)(v72[26] + 8);
    if (v151 < v78) {
      goto LABEL_144;
    }
    uint64_t v79 = (void *)[(NSTextStorage *)self->_textStorage string];
    if (range2)
    {
      NSUInteger v80 = v79;
      int v81 = [v79 characterAtIndex:range2 - 1];
      if (v81 > 132)
      {
        if ((v81 - 8232) >= 2 && v81 != 133) {
          goto LABEL_144;
        }
      }
      else if (v81 != 10 {
             && v81 != 12
      }
             && (v81 != 13
              || range2 < [v80 length]
              && [v80 characterAtIndex:range2] == 10))
      {
        goto LABEL_144;
      }
    }
    [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:v78 maxNumberOfLineFragments:1 nextGlyphIndex:&v151];
    goto LABEL_144;
  }
  if (*(unsigned char *)(v72[30] + 56)) {
    goto LABEL_144;
  }
  uint64_t v73 = *(void *)(v72[26] + 8);
  unint64_t v74 = [(NSMutableArray *)self->_textContainers count];
  unint64_t v75 = (void *)[(NSTextStorage *)self->_textStorage string];
  if (range2)
  {
    long long v76 = v75;
    int v77 = [v75 characterAtIndex:range2 - 1];
    if (v77 > 132)
    {
      if ((v77 - 8232) >= 2 && v77 != 133) {
        goto LABEL_124;
      }
    }
    else if (v77 != 10 {
           && v77 != 12
    }
           && (v77 != 13
            || range2 < [v76 length]
            && [v76 characterAtIndex:range2] == 10))
    {
      goto LABEL_124;
    }
  }
  [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:v73 maxNumberOfLineFragments:1 nextGlyphIndex:&v151];
LABEL_124:
  if (v73)
  {
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      CFDictionaryRef v86 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else
    {
      unint64_t v82 = v73 - 1;
      if ([(NSRunStorage *)self->_containerRuns count] <= v82)
      {
        CFDictionaryRef v86 = 0;
      }
      else
      {
        NSRange v83 = self->_containerRuns;
        _NSBlockNumberForIndex(v83, v82, 0);
        unint64_t v85 = 0;
        if (v83->_gapBlockIndex <= v84) {
          unint64_t v85 = v83->_maxBlocks - v83->_numBlocks;
        }
        CFDictionaryRef v86 = *(CFDictionaryRef *)&v83->_runs->var1[(v83->_elementSize + 8) * (v85 + v84)];
      }
    }
    value[0] = 0;
    uint64_t v88 = (CFDictionaryRef *)self->_extraData;
    if (v88[10] == v86)
    {
      uint64_t v90 = 0;
    }
    else
    {
      int ValueIfPresent = CFDictionaryGetValueIfPresent(v88[11], v86, (const void **)value);
      uint64_t v90 = (uint64_t)value[0];
      if (!ValueIfPresent) {
        uint64_t v90 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    unint64_t v87 = v90 + 1;
  }
  else
  {
    unint64_t v87 = 0;
  }
  if (v87 < v74)
  {
    do
      [(NSLayoutManager *)self _resizeTextViewForTextContainer:[(NSMutableArray *)self->_textContainers objectAtIndex:v87++]];
    while (v74 != v87);
  }
LABEL_144:
  [(NSLayoutManager *)self _invalidateInsertionPoint];
  if (v142)
  {
    if (v137)
    {
      int64_t v91 = v138;
    }
    else
    {
      int64_t v91 = v138;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0) {
        int64_t v91 = *(void *)(*((void *)self->_extraData + 26) + 8) - (void)v16;
      }
    }
    -[NSLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v141, v91);
  }
  else if (self->_deferredDisplayCharRange.location != 0x7FFFFFFFFFFFFFFFLL && !self->_displayInvalidationDisableStack)
  {
    [(NSLayoutManager *)self _invalidateDisplayIfNeeded];
  }
  _enableTextViewResizing((uint64_t)self);
  char v92 = *(unsigned char *)(*((void *)self->_extraData + 30) + 56);
  if ((*((unsigned char *)&self->_lmFlags + 1) & 0x20) == 0)
  {
    if (*(unsigned char *)(*((void *)self->_extraData + 30) + 56)) {
      goto LABEL_192;
    }
    goto LABEL_187;
  }
  double v93 = self->_extraLineFragmentContainer;
  if (v93) {
    goto LABEL_157;
  }
  unint64_t v98 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v99 = *(void *)(*((void *)self->_extraData + 26) + 8);
  double v100 = (void *)[(NSTextStorage *)self->_textStorage string];
  if ((v92 & 1) == 0)
  {
    double v93 = 0;
    if (!v98 || !v99) {
      goto LABEL_162;
    }
    long long v101 = v100;
    int v102 = [v100 characterAtIndex:v98 - 1];
    double v93 = 0;
    if (v102 > 132)
    {
      if ((v102 - 8232) < 2 || v102 == 133) {
        goto LABEL_162;
      }
    }
    else
    {
      if (v102 == 10 || v102 == 12) {
        goto LABEL_162;
      }
      if (v102 == 13
        && (v98 >= [v101 length] || objc_msgSend(v101, "characterAtIndex:", v98) != 10))
      {
        double v93 = 0;
        goto LABEL_162;
      }
    }
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v104 = self->_firstUnlaidGlyphIndex, v104 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:v152];
    unint64_t v104 = v152[0];
    if (v152[0]) {
      goto LABEL_204;
    }
LABEL_211:
    double v93 = (NSTextContainer *)*((void *)self->_extraData + 10);
    goto LABEL_157;
  }
  v152[0] = self->_firstUnlaidGlyphIndex;
  if (!v104) {
    goto LABEL_211;
  }
LABEL_204:
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    double v93 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v105 = v104 - 1;
    if ([(NSRunStorage *)self->_containerRuns count] <= v104 - 1)
    {
      double v93 = 0;
    }
    else
    {
      double v106 = self->_containerRuns;
      _NSBlockNumberForIndex(v106, v105, 0);
      unint64_t v108 = 0;
      if (v106->_gapBlockIndex <= v107) {
        unint64_t v108 = v106->_maxBlocks - v106->_numBlocks;
      }
      double v93 = *(NSTextContainer **)&v106->_runs->var1[(v106->_elementSize + 8) * (v108 + v107)];
    }
  }
LABEL_157:
  if (extraLineFragmentContainer == v93 && (v92 & 1) != 0) {
    goto LABEL_192;
  }
LABEL_162:
  value[0] = 0;
  uint64_t v95 = (CFDictionaryRef *)self->_extraData;
  if (v95[10] == (CFDictionaryRef)extraLineFragmentContainer)
  {
    uint64_t v97 = 0;
  }
  else
  {
    int v96 = CFDictionaryGetValueIfPresent(v95[11], extraLineFragmentContainer, (const void **)value);
    uint64_t v97 = (uint64_t)value[0];
    if (!v96) {
      uint64_t v97 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(_DWORD *)&self->_lmFlags &= ~0x40000u;
  if (extraLineFragmentContainer != v93)
  {
    unint64_t v103 = v97 + 1;
    do
    {
      if ((*((unsigned char *)&self->_lmFlags + 2) & 4) != 0) {
        break;
      }
      objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, extraLineFragmentContainer, 0);
      extraLineFragmentContainer = v103 >= [(NSMutableArray *)self->_textContainers count]
                                 ? 0
                                 : (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:v103];
      ++v103;
    }
    while (extraLineFragmentContainer != v93);
  }
  if ((*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) == 0)
  {
    if ((*((unsigned char *)&self->_lmFlags + 2) & 4) == 0) {
      objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, v93, 1);
    }
LABEL_187:
    if ([(NSLayoutManager *)self didCompleteLayoutObserverBlock]) {
      (*(void (**)(void))([(NSLayoutManager *)self didCompleteLayoutObserverBlock] + 16))();
    }
    if ([(NSLayoutManager *)self applicationFrameworkContext] == 2
      && [MEMORY[0x1E4F29060] isMainThread])
    {
      _NSRemoveDirtyLayoutManager((uint64_t)self);
    }
  }
LABEL_192:
  if (v146) {
    [(NSTextStorage *)self->_textStorage _unlock];
  }
  if (!v148) {
    [*((id *)self->_extraData + 7) unlock];
  }
  if (v143) {
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v140, v143, 0);
  }
}

- (void)_fillLayoutHoleAtIndex:(unint64_t)a3 desiredNumberOfLines:(unint64_t)a4
{
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  uint64_t v8 = 0;
  if (100 * a4 <= 0x400) {
    unint64_t v6 = 1024;
  }
  else {
    unint64_t v6 = 100 * a4;
  }
  _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength((uint64_t)self, 0, v6, &v10, &v9);
  unint64_t v7 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v10);
  objc_msgSend((id)-[NSTextStorage string](self->_textStorage, "string"), "getParagraphStart:end:contentsEnd:forRange:", 0, &v8, 0, v7, _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v9 + v10) - v7);
  -[NSLayoutManager _fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:](self, "_fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:", v7, v8 - v7, a4, 0);
}

- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6
{
  if (a5) {
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3, 1uLL);
  }

  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, a3);
}

- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5
{
  return [(NSLayoutManager *)self _smallEncodingGlyphIndexForCharacterIndex:a3 startOfRange:a4 okToFillHoles:a5 considerNulls:1];
}

- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5
{
  return [(NSLayoutManager *)self _glyphIndexForCharacterIndex:a3 startOfRange:a4 okToFillHoles:a5 considerNulls:1];
}

- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6
{
  if (a5) {
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3, 1uLL);
  }

  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, a3);
}

- (_NSRange)_glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4 okToFillHoles:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a5) {
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3.location, a3.length + 1);
  }

  NSUInteger v10 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, v5, 1, 1, (uint64_t *)a4);
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)_exactGlyphRangeForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3.location, 1uLL);
  if (length >= 2) {
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, length + location - 1, 2uLL);
  }

  NSUInteger v6 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, 1, 1, 0, 0);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)_primitiveCharacterRangeForGlyphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, a3.location);
  unint64_t v7 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location + length);
  unint64_t v8 = [(NSTextStorage *)self->_textStorage length];
  if (v6 >= v8) {
    NSUInteger v9 = v8;
  }
  else {
    NSUInteger v9 = v6;
  }
  if (v7 >= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v7;
  }
  BOOL v11 = v10 >= v9;
  NSUInteger v12 = v10 - v9;
  if (v11) {
    NSUInteger v13 = v12;
  }
  else {
    NSUInteger v13 = 0;
  }
  NSUInteger v14 = v9;
  result.NSUInteger length = v13;
  result.NSUInteger location = v14;
  return result;
}

- (_NSRange)_primitiveGlyphRangeForCharacterRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  unint64_t v6 = [(NSTextStorage *)self->_textStorage length];
  if (location >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = location;
  }
  if (v5 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v5;
  }
  if (v8 <= v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = v8;
  }
  NSUInteger v10 = -[NSLayoutManager glyphIndexForCharacterAtIndex:](self, "glyphIndexForCharacterAtIndex:");
  NSUInteger v11 = [(NSLayoutManager *)self glyphIndexForCharacterAtIndex:v9] - v10;
  NSUInteger v12 = v10;
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

+ (BOOL)_inBackgroundLayout
{
  return _inBackgroundLayout;
}

+ (void)_doSomeBackgroundLayout
{
  uint64_t v2 = [(id)_dirtyLMs count];
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  while (1)
  {
    uint64_t v4 = [(id)_dirtyLMs pointerAtIndex:0];
    if (!v4)
    {
      [(id)_dirtyLMs removePointerAtIndex:0];
      goto LABEL_15;
    }
    uint64_t v5 = v4;
    if ((*(unsigned char *)(v4 + 64) & 4) != 0) {
      break;
    }
    [(id)_dirtyLMs removePointerAtIndex:0];
    *(_DWORD *)(v5 + 64) &= ~0x100u;
LABEL_15:
    if (!--v3) {
      return;
    }
  }
  uint64_t v6 = *(void *)(v4 + 240);
  char v7 = objc_msgSend((id)objc_msgSend((id)v4, "textStorage"), "_isStringDrawingTextStorage");
  if ((v7 & 1) == 0 && !*(void *)(v6 + 56))
  {
    unint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", objc_msgSend((id)v5, "zone")), "init");
    uint64_t v9 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v6 + 56), (unint64_t *)&v9, (unint64_t)v8);
    if (v9) {
  }
    }
  [*(id *)(v6 + 56) lock];
  [(id)v5 _mergeLayoutHoles];
  if ((*(unsigned char *)(*(void *)(*(void *)(v5 + 240) + 240) + 56) & 1) == 0 || (*(unsigned char *)(v5 + 67) & 0x40) != 0)
  {
    [(id)_dirtyLMs removePointerAtIndex:0];
    *(_DWORD *)(v5 + 64) &= ~0x100u;
    if ((v7 & 1) == 0) {
      [*(id *)(*(void *)(v5 + 240) + 56) unlock];
    }
    goto LABEL_15;
  }
  if ((unint64_t)[(id)_dirtyLMs count] >= 2)
  {
    id v10 = (id)v5;
    [(id)_dirtyLMs removePointerAtIndex:0];
    [(id)_dirtyLMs addPointer:v5];
  }
  _inBackgroundLayout = 1;
  [(id)v5 _fillLayoutHoleAtIndex:0 desiredNumberOfLines:100];
  if ((v7 & 1) == 0) {
    [*(id *)(*(void *)(v5 + 240) + 56) unlock];
  }
  _inBackgroundLayout = 0;
}

- (void)_markSelfAsDirtyForBackgroundLayout:(id)a3
{
  if ([(NSMutableArray *)self->_textContainers count])
  {
    int64_t v4 = [(NSLayoutManager *)self applicationFrameworkContext];
    __lmFlags lmFlags = self->_lmFlags;
    if (v4 == 2)
    {
      if ((*(_DWORD *)&lmFlags & 0x40000104) == 4 && [MEMORY[0x1E4F29060] isMainThread])
      {
        _NSAddDirtyLayoutManager((uint64_t)self);
      }
    }
    else if ((*(_DWORD *)&lmFlags & 0xC0000004) == 4)
    {
      self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x80000000);
      extraDatdouble a = (atomic_ullong *)self->_extraData;
      BOOL v7 = [(NSAttributedString *)[(NSLayoutManager *)self textStorage] _isStringDrawingTextStorage];
      if (!v7 && !extraData[7])
      {
        unint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
        uint64_t v9 = 0;
        atomic_compare_exchange_strong(extraData + 7, (unint64_t *)&v9, (unint64_t)v8);
        if (v9) {
      }
        }
      [(id)extraData[7] lock];
      [(NSLayoutManager *)self _mergeLayoutHoles];
      if (*(unsigned char *)(*((void *)self->_extraData + 30) + 56)) {
        [(NSLayoutManager *)self _fillLayoutHoleAtIndex:0 desiredNumberOfLines:0x7FFFFFFFFFFFFFFFLL];
      }
      if (!v7) {
        [*((id *)self->_extraData + 7) unlock];
      }
      *(_DWORD *)&self->_lmFlags &= ~0x80000000;
    }
  }
}

- (id)_containerDescription
{
  v23.receiver = self;
  v23.super_class = (Class)NSLayoutManager;
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", -[NSLayoutManager description](&v23, sel_description)];
  unint64_t v22 = 0;
  __n128 v21 = 0uLL;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&v22];
    if (!v22) {
      return v3;
    }
    goto LABEL_6;
  }
  unint64_t v22 = self->_firstUnlaidGlyphIndex;
  if (firstUnlaidGlyphIndex)
  {
LABEL_6:
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        unint64_t v10 = *(void *)(*((void *)self->_extraData + 26) + 8);
        v21.n128_u64[0] = 0;
        v21.n128_u64[1] = v10;
        NSUInteger v11 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= v5)
      {
        NSUInteger v11 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        _NSBlockNumberForIndex(containerRuns, v5, &v21);
        if (containerRuns->_gapBlockIndex <= v8) {
          unint64_t v9 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        }
        else {
          unint64_t v9 = 0;
        }
        NSUInteger v11 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v9 + v8)];
      }
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 && v21.n128_u64[1] + v21.n128_u64[0] > v22) {
        v21.n128_u64[1] = v22 - v21.n128_u64[0];
      }
      if (v11) {
        ValueAtIndedouble x = CFStorageGetValueAtIndex();
      }
      else {
        ValueAtIndedouble x = 0;
      }
      NSUInteger v13 = &stru_1EDD49F70;
      if (v11 == self->_extraLineFragmentContainer)
      {
        NSUInteger v14 = NSString;
        memset(&v24, 0, sizeof(v24));
        _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v24, 0);
        double v15 = NSStringFromRect(v24);
        memset(&v24, 0, sizeof(v24));
        _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&v24);
        NSUInteger v13 = (__CFString *)[v14 stringWithFormat:@"elf rect %@ used rect %@", v15, NSStringFromRect(v24)];
      }
      __n128 v16 = v21;
      if (v11)
      {
        __lmFlags v17 = [(NSTextContainer *)v11 description];
        [(NSTextContainer *)v11 size];
        NSUInteger v18 = NSStringFromSize(v25);
        if (ValueAtIndex) {
          goto LABEL_25;
        }
      }
      else
      {
        __lmFlags v17 = @"nil";
        NSUInteger v18 = (NSString *)@"N/A";
        if (ValueAtIndex)
        {
LABEL_25:
          NSUInteger v19 = @"<invalid>";
          if ((*(unsigned char *)(ValueAtIndex + 64) & 1) == 0) {
            NSUInteger v19 = (__CFString *)[NSString stringWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)ValueAtIndex, *(void *)(ValueAtIndex + 8), *(void *)(ValueAtIndex + 16), *(void *)(ValueAtIndex + 24)];
          }
          goto LABEL_29;
        }
      }
      NSUInteger v19 = @"<none>";
LABEL_29:
      [v3 appendFormat:@"Container %lu: glyph range {%lu, %lu}, %@, size %@, used rect %@ %@\n", v6, *(_OWORD *)&v16, v17, v18, v19, v13];
      unint64_t v5 = v21.n128_u64[1] + v21.n128_u64[0];
      ++v6;
    }
    while (v21.n128_u64[1] + v21.n128_u64[0] < v22);
  }
  return v3;
}

- (id)_lineFragmentDescriptionForGlyphRange:(_NSRange)a3 includeGlyphLocations:(BOOL)a4
{
  BOOL v33 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v36.receiver = self;
  v36.super_class = (Class)NSLayoutManager;
  BOOL v7 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", -[NSLayoutManager description](&v36, sel_description)];
  v35.NSUInteger location = 0;
  v35.NSUInteger length = 0;
  uint64_t v8 = [(NSTextStorage *)self->_textStorage string];
  NSUInteger v32 = location + length;
  if (location < location + length)
  {
    unint64_t v9 = (void *)v8;
    uint64_t v10 = 0;
    do
    {
      double v11 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v35);
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      double v18 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, location, 0);
      [v7 appendFormat:@"Line %lu: glyph range {%lu, %lu}, bounds {{%.2f, %.2f}, {%.2f, %.2f}}, usedRect {{%.2f, %.2f}, {%.2f, %.2f}}\n", v10, v35.location, v35.length, *(void *)&v11, v13, v15, v17, *(void *)&v18, v19, v20, v21];
      if (v33)
      {
        uint64_t v31 = v10;
        v34.NSUInteger location = 0;
        v34.NSUInteger length = 0;
        NSUInteger v22 = v35.location;
        for (NSUInteger i = v35.length + v35.location; v22 < i; NSUInteger i = v35.length + v35.location)
        {
          double v24 = _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, v22, &v34);
          uint64_t v26 = v25;
          NSRange v34 = NSIntersectionRange(v34, v35);
          [v7 appendFormat:@"    {%lu, %lu} {%.2f, %.2f}, glyphs: ", v34.location, v34.length, *(void *)&v24, v26];
          while (v22 < v34.length + v34.location)
          {
            uint64_t v27 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v22, 0);
            unsigned int v28 = objc_msgSend(v9, "characterAtIndex:", _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v22));
            if (v27 == 0xFFFFFF) {
              [v7 appendString:@"NSControlGlyph "];
            }
            else {
              objc_msgSend(v7, "appendFormat:", @"0x%x ", v27);
            }
            if (v28 - 32 >= 0x5F) {
              uint64_t v29 = @"(ch=0x%04x) ";
            }
            else {
              uint64_t v29 = @"(ch='%c') ";
            }
            objc_msgSend(v7, "appendFormat:", v29, v28);
            ++v22;
          }
          [v7 appendString:@"\n"];
        }
        objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length") - 2, 2, @"\n");
        uint64_t v10 = v31;
      }
      NSUInteger location = v35.length + v35.location;
      ++v10;
    }
    while (v35.length + v35.location < v32);
  }
  return v7;
}

- (id)_lineFragmentDescription:(BOOL)a3
{
  return -[NSLayoutManager _lineFragmentDescriptionForGlyphRange:includeGlyphLocations:](self, "_lineFragmentDescriptionForGlyphRange:includeGlyphLocations:", 0, *(void *)(*((void *)self->_extraData + 26) + 8), a3);
}

- (id)_lineFragmentDescription
{
  return [(NSLayoutManager *)self _lineFragmentDescription:0];
}

- (id)_glyphLocationDescription
{
  return [(NSLayoutManager *)self _lineFragmentDescription:1];
}

- (id)_glyphDescriptionForGlyphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v21.receiver = self;
  v21.super_class = (Class)NSLayoutManager;
  double v18 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", -[NSLayoutManager description](&v21, sel_description)];
  uint64_t v17 = (void *)[(NSTextStorage *)self->_textStorage string];
  if (location < location + length)
  {
    do
    {
      unint64_t v6 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
      unsigned int v7 = [v17 characterAtIndex:v6];
      uint64_t v20 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, location, 0);
      if (v7 - 32 > 0x5E) {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"0x%04x", v7);
      }
      else {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"'%c'", v7);
      }
      uint64_t v19 = v8;
      uint64_t v9 = _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 5);
      unsigned int v10 = _NSGlyphTreeBidiLevelForGlyphAtIndex((uint64_t)self, location);
      if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 0)) {
        double v11 = @"sft ";
      }
      else {
        double v11 = @"    ";
      }
      if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 1)) {
        uint64_t v12 = @"ela ";
      }
      else {
        uint64_t v12 = @"    ";
      }
      if (_NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, location)) {
        uint64_t v13 = @"out ";
      }
      else {
        uint64_t v13 = @"    ";
      }
      int v14 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, location);
      uint64_t v15 = @"inv ";
      if (!v14) {
        uint64_t v15 = @"    ";
      }
      [v18 appendFormat:@"%4d: %u (ch=%@) cix=%4d insc=%d bidi=%d %@%@%@%@\n", location++, v20, v19, v6, v9, v10, v11, v12, v13, v15];
      --length;
    }
    while (length);
  }
  return v18;
}

- (id)_glyphDescription
{
  return -[NSLayoutManager _glyphDescriptionForGlyphRange:](self, "_glyphDescriptionForGlyphRange:", 0, *(void *)(*((void *)self->_extraData + 26) + 8));
}

- (id)_glyphHoleDescription
{
  unint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v4 = *(void *)(*((void *)self->_extraData + 26) + 8);
  v25.receiver = self;
  v25.super_class = (Class)NSLayoutManager;
  unint64_t v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n    Currently holding %lu characters and %lu glyphs\n", -[NSLayoutManager description](&v25, sel_description), v3, v4];
  v24.NSUInteger location = 0;
  v24.NSUInteger length = 0;
  HasGlyphsForCharacterAtIndedouble x = _NSGlyphTreeHasGlyphsForCharacterAtIndex((uint64_t)self, 0, 0);
  if (v3)
  {
    char v7 = HasGlyphsForCharacterAtIndex;
    unint64_t v8 = 0;
    NSUInteger length = 0;
    NSUInteger location = 0;
    do
    {
      BOOL v11 = _NSGlyphTreeHasGlyphsForCharacterAtIndex((uint64_t)self, v8, (uint64_t *)&v24);
      if ((v7 & 1) == v11)
      {
        v30.NSUInteger location = location;
        v30.NSUInteger length = length;
        NSRange v18 = NSUnionRange(v24, v30);
        NSUInteger location = v18.location;
        NSUInteger length = v18.length;
        NSUInteger v16 = v24.location;
        NSUInteger v17 = v24.length;
      }
      else
      {
        NSUInteger v12 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
        NSUInteger v13 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, length + location) - v12;
        if (v7) {
          int v14 = @"has glyphs";
        }
        else {
          int v14 = @"no glyphs ";
        }
        v26.NSUInteger location = location;
        v26.NSUInteger length = length;
        uint64_t v15 = NSStringFromRange(v26);
        v27.NSUInteger location = v12;
        v27.NSUInteger length = v13;
        [v5 appendFormat:@"    %@ char range %@ glyph range %@\n", v14, v15, NSStringFromRange(v27)];
        NSUInteger v16 = v24.location;
        NSUInteger v17 = v24.length;
        NSUInteger location = v24.location;
        NSUInteger length = v24.length;
        char v7 = v11;
      }
      unint64_t v8 = v17 + v16;
      if (v17 + v16 == v3)
      {
        NSUInteger v19 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
        NSUInteger v20 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, length + location) - v19;
        if (v11) {
          objc_super v21 = @"has glyphs";
        }
        else {
          objc_super v21 = @"no glyphs ";
        }
        v28.NSUInteger location = location;
        v28.NSUInteger length = length;
        NSUInteger v22 = NSStringFromRange(v28);
        v29.NSUInteger location = v19;
        v29.NSUInteger length = v20;
        [v5 appendFormat:@"    %@ char range %@ glyph range %@\n", v21, v22, NSStringFromRange(v29)];
        unint64_t v8 = v24.length + v24.location;
      }
    }
    while (v8 < v3);
  }
  return v5;
}

- (id)_layoutHoleDescription
{
  uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  unint64_t v4 = *(void *)(*((void *)self->_extraData + 26) + 8);
  v25.receiver = self;
  v25.super_class = (Class)NSLayoutManager;
  unint64_t v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n    Currently holding %lu characters and %lu glyphs\n", -[NSLayoutManager description](&v25, sel_description), v3, v4];
  v24.NSUInteger location = 0;
  v24.NSUInteger length = 0;
  HasFragmentsForGlyphAtIndedouble x = _NSLayoutTreeHasFragmentsForGlyphAtIndex((uint64_t)self, 0, 0);
  if (v4)
  {
    char v7 = HasFragmentsForGlyphAtIndex;
    unint64_t v8 = 0;
    NSUInteger length = 0;
    NSUInteger location = 0;
    do
    {
      BOOL v11 = _NSLayoutTreeHasFragmentsForGlyphAtIndex((uint64_t)self, v8, (uint64_t *)&v24);
      if ((v7 & 1) == v11)
      {
        v28.NSUInteger location = location;
        v28.NSUInteger length = length;
        NSRange v18 = NSUnionRange(v24, v28);
        NSUInteger location = v18.location;
        NSUInteger length = v18.length;
        NSUInteger v16 = v24.location;
        NSUInteger v17 = v24.length;
      }
      else
      {
        NSUInteger v12 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        v13.NSUInteger length = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, length + location) - v12;
        if (v7) {
          int v14 = @"laid out";
        }
        else {
          int v14 = @"not laid";
        }
        v13.NSUInteger location = v12;
        uint64_t v15 = NSStringFromRange(v13);
        v26.NSUInteger location = location;
        v26.NSUInteger length = length;
        [v5 appendFormat:@"    %@ char range %@ glyph range %@\n", v14, v15, NSStringFromRange(v26)];
        NSUInteger v16 = v24.location;
        NSUInteger v17 = v24.length;
        NSUInteger location = v24.location;
        NSUInteger length = v24.length;
        char v7 = v11;
      }
      unint64_t v8 = v17 + v16;
      if (v17 + v16 == v4)
      {
        NSUInteger v19 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        v20.NSUInteger length = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, length + location) - v19;
        if (v11) {
          objc_super v21 = @"laid out";
        }
        else {
          objc_super v21 = @"not laid";
        }
        v20.NSUInteger location = v19;
        NSUInteger v22 = NSStringFromRange(v20);
        v27.NSUInteger location = location;
        v27.NSUInteger length = length;
        [v5 appendFormat:@"    %@ char range %@ glyph range %@\n", v21, v22, NSStringFromRange(v27)];
        unint64_t v8 = v24.length + v24.location;
      }
    }
    while (v8 < v4);
  }
  return v5;
}

- (void)_updateUsageForTextContainer:(id)a3 addingUsedRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  value = 0;
  extraDatdouble a = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] != a3) {
    CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&value);
  }
  ValueAtIndedouble x = CFStorageGetValueAtIndex();
  if ((*(unsigned char *)(ValueAtIndex + 64) & 1) == 0)
  {
    uint64_t v12 = ValueAtIndex;
    NSRange v13 = (void *)[a3 textView];
    CGFloat v14 = *(double *)v12;
    CGFloat v15 = *(double *)(v12 + 8);
    CGFloat v16 = *(double *)(v12 + 16);
    CGFloat v17 = *(double *)(v12 + 24);
    int v18 = *(_DWORD *)(v12 + 64);
    v23.origin.double x = *(CGFloat *)v12;
    v23.origin.double y = v15;
    v23.size.double width = v16;
    v23.size.double height = v17;
    if (!NSEqualRects(v23, *MEMORY[0x1E4F28AD8]))
    {
      double x = NSLMUnionRect(*(double *)v12, *(double *)(v12 + 8), *(double *)(v12 + 16), *(double *)(v12 + 24), x, y, width, height);
      double y = v19;
      double width = v20;
      double height = v21;
    }
    *(double *)uint64_t v12 = x;
    *(double *)(v12 + 8) = y;
    *(double *)(v12 + 16) = width;
    *(double *)(v12 + 24) = height;
    *(_DWORD *)(v12 + 64) = *(_DWORD *)(v12 + 64) & 0xFFFFFFFB | (4
                                                                * (*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1));
    if (v13)
    {
      v24.origin.double x = v14;
      v24.origin.double y = v15;
      v24.size.double width = v16;
      v24.size.double height = v17;
      v25.origin.double x = x;
      v25.origin.double y = y;
      v25.size.double width = width;
      v25.size.double height = height;
      if (!NSEqualRects(v24, v25)
        || (*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 && (v18 & 4) != 0 && (*(unsigned char *)(v12 + 64) & 4) == 0)
      {
        [(NSLayoutManager *)self _resizeTextViewForTextContainer:a3];
      }
      [v13 invalidateTextContainerOrigin];
    }
  }
}

- (void)_invalidateUsageForTextContainersInRange:(_NSRange)a3
{
  if (a3.length)
  {
    do
    {
      NSUInteger v3 = a3.length - 1;
      ValueAtIndedouble x = CFStorageGetValueAtIndex();
      *(_DWORD *)(ValueAtIndex + 64) |= 1u;
      a3.NSUInteger length = v3;
    }
    while (v3);
  }
}

- (void)_recalculateUsageForTextContainerAtIndex:(unint64_t)a3
{
  unint64_t v5 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:");
  ValueAtIndedouble x = CFStorageGetValueAtIndex();
  unint64_t v48 = [(NSTextContainer *)v5 textView];
  char v7 = (void *)[(NSTextStorage *)self->_textStorage string];
  unint64_t v8 = [(NSLayoutManager *)self _indexOfFirstGlyphInTextContainer:v5 okToFillHoles:0];
  unint64_t v9 = [(NSTextStorage *)self->_textStorage length];
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0) {
    ++self->_textViewResizeDisableStack;
  }
  firstUnlaidGlyphIndedouble x = 0;
  uint64_t v50 = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
  }
  else {
    firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex;
  }
  if (((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0 || (*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) == 0)
    && !self->_extraLineFragmentContainer)
  {
    if (v9)
    {
      int v10 = [v7 characterAtIndex:v9 - 1];
      if (v10 > 132)
      {
        if ((v10 - 8232) >= 2 && v10 != 133) {
          goto LABEL_37;
        }
      }
      else
      {
        BOOL v11 = v10 == 10 || v10 == 12;
        if (!v11
          && (v10 != 13
           || v9 < [v7 length] && objc_msgSend(v7, "characterAtIndex:", v9) == 10))
        {
          goto LABEL_37;
        }
      }
    }
    if (!firstUnlaidGlyphIndex) {
      goto LABEL_63;
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      CGFloat v16 = (const void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else
    {
      unint64_t v12 = firstUnlaidGlyphIndex - 1;
      if ([(NSRunStorage *)self->_containerRuns count] <= v12)
      {
        CGFloat v16 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        _NSBlockNumberForIndex(containerRuns, v12, 0);
        unint64_t v15 = 0;
        if (containerRuns->_gapBlockIndex <= v14) {
          unint64_t v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        }
        CGFloat v16 = *(const void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v14)];
      }
    }
    value[0] = 0;
    extraDatdouble a = self->_extraData;
    if (*((const void **)extraData + 10) == v16) {
      goto LABEL_63;
    }
    int ValueIfPresent = CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), v16, (const void **)value);
    unint64_t v19 = (unint64_t)value[0];
    if (!ValueIfPresent) {
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v19 <= a3)
    {
LABEL_63:
      if (self->_textStorage) {
        [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:*(void *)(*((void *)self->_extraData + 26) + 8) maxNumberOfLineFragments:1 nextGlyphIndex:&v50];
      }
      [(NSLayoutManager *)self _invalidateInsertionPoint];
    }
  }
LABEL_37:
  *(_DWORD *)(ValueAtIndex + 64) &= ~1u;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
  *(_OWORD *)ValueAtIndedouble x = *MEMORY[0x1E4F28AD8];
  *(_OWORD *)(ValueAtIndex + 16) = v20;
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_55;
  }
  value[0] = 0;
  value[1] = 0;
  __n128 v49 = 0uLL;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    unint64_t v22 = *(void *)(*((void *)self->_extraData + 26) + 8);
    v49.n128_u64[1] = v22;
    [(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    if ([(NSRunStorage *)self->_containerRuns count] > (unint64_t)v8)
    {
      _NSBlockNumberForIndex(&self->_containerRuns->super.isa, (unint64_t)v8, &v49);
      unint64_t v22 = v49.n128_u64[1];
      unint64_t v21 = v49.n128_u64[0];
      goto LABEL_44;
    }
    unint64_t v22 = 0;
  }
  unint64_t v21 = 0;
LABEL_44:
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 && v22 + v21 > firstUnlaidGlyphIndex)
  {
    unint64_t v22 = firstUnlaidGlyphIndex - v21;
    v49.n128_u64[1] = firstUnlaidGlyphIndex - v21;
  }
  unint64_t v23 = v22 + v21;
  while ((unint64_t)v8 < v23)
  {
    double v24 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, (unint64_t)v8, (uint64_t *)value);
    *(double *)ValueAtIndedouble x = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), v24, v25, v26, v27);
    *(void *)(ValueAtIndex + 8) = v28;
    *(void *)(ValueAtIndex + 16) = v29;
    *(void *)(ValueAtIndex + 24) = v30;
    unint64_t v8 = (char *)value[1] + (unint64_t)value[0];
  }
  if (*((void *)self->_extraData + 23))
  {
    v54.origin.double x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v49.n128_u64[0]);
    double x = v54.origin.x;
    double y = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
    if (!NSIsEmptyRect(v54))
    {
      *(double *)ValueAtIndedouble x = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), x, y, width, height);
      *(void *)(ValueAtIndex + 8) = v35;
      *(void *)(ValueAtIndex + 16) = v36;
      *(void *)(ValueAtIndex + 24) = v37;
    }
    v55.origin.double x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v49.n128_u64[0] + v49.n128_u64[1] - 1);
    double v38 = v55.origin.x;
    double v39 = v55.origin.y;
    double v40 = v55.size.width;
    double v41 = v55.size.height;
    if (!NSIsEmptyRect(v55))
    {
      *(double *)ValueAtIndedouble x = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), v38, v39, v40, v41);
      *(void *)(ValueAtIndex + 8) = v42;
      *(void *)(ValueAtIndex + 16) = v43;
      *(void *)(ValueAtIndex + 24) = v44;
    }
  }
LABEL_55:
  if (self->_extraLineFragmentContainer == v5)
  {
    *(_OWORD *)value = 0u;
    long long v53 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)value);
    *(double *)ValueAtIndedouble x = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), *(double *)value, *(double *)&value[1], *(double *)&v53, *((double *)&v53 + 1));
    *(void *)(ValueAtIndex + 8) = v45;
    *(void *)(ValueAtIndex + 16) = v46;
    *(void *)(ValueAtIndex + 24) = v47;
  }
  *(_DWORD *)(ValueAtIndex + 64) = *(_DWORD *)(ValueAtIndex + 64) & 0xFFFFFFFB | (4
                                                                                * (*(unsigned char *)(*((void *)self->_extraData
                                                                                              + 30)
                                                                                            + 56) & 1));
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0) {
    --self->_textViewResizeDisableStack;
  }
  if (v48)
  {
    [(NSLayoutManager *)self _resizeTextViewForTextContainer:v5];
    [(NSTextView *)v48 invalidateTextContainerOrigin];
  }
}

- (_NSStoredContainerUsage)_validatedStoredUsageForTextContainerAtIndex:(unint64_t)a3
{
  ValueAtIndedouble x = CFStorageGetValueAtIndex();
  if (*(unsigned char *)(ValueAtIndex + 64)) {
    [(NSLayoutManager *)self _recalculateUsageForTextContainerAtIndex:a3];
  }
  return (_NSStoredContainerUsage *)ValueAtIndex;
}

- (void)_invalidateInsertionPoint
{
  if (self->_displayInvalidationDisableStack) {
    *(_DWORD *)&self->_lmFlags |= 0x80u;
  }
  else {
    [self->_firstTextView updateInsertionPointStateAndRestartTimer:0];
  }
}

- (void)_invalidateDisplayIfNeeded
{
  NSUInteger location = self->_deferredDisplayCharRange.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = self->_deferredDisplayCharRange.length;
    self->_deferredDisplayCharRange = (_NSRange)xmmword_18E5F72A0;
    -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", location, length);
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(unsigned char *)&lmFlags & 0x80) != 0)
  {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFF7F);
    [(NSLayoutManager *)self _invalidateInsertionPoint];
  }
}

- (void)_resizeTextViewForTextContainer:(id)a3
{
  value[0] = 0;
  extraDatdouble a = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    if (!CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)value)) {
      return;
    }
    unint64_t v6 = (char *)value[0];
    if (value[0] == (void *)0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
  }
  uint64_t v7 = [a3 textView];
  if (!v7) {
    return;
  }
  if (self->_textViewResizeDisableStack
    || (unint64_t v9 = (void *)v7, [(NSLayoutManager *)self hasNonContiguousLayout])
    && [(NSLayoutManager *)self isScrolling])
  {
    ValueAtIndedouble x = CFStorageGetValueAtIndex();
    *(_DWORD *)(ValueAtIndex + 64) |= 2u;
    return;
  }
  uint64_t v10 = [v9 superview];
  [v9 frame];
  double v12 = v11;
  double v14 = v13;
  [v9 layoutOrientation];
  [v9 textContainerOrigin];
  double v16 = v15;
  double v18 = v17;
  [a3 textContainerInsetsForView:v9];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  uint64_t v27 = CFStorageGetValueAtIndex();
  uint64_t v28 = v27;
  int v29 = *(_DWORD *)(v27 + 64);
  if (v29)
  {
    *(_DWORD *)(v27 + 64) = v29 | 2;
    return;
  }
  double v110 = v18;
  *(_DWORD *)(v27 + 64) = v29 & 0xFFFFFFFD;
  *(_OWORD *)value = *(_OWORD *)v27;
  double v30 = *(double *)(v27 + 16);
  double v106 = *(double *)(v27 + 32);
  double v107 = v16;
  double v109 = *(double *)(v27 + 40);
  double v111 = *(double *)(v27 + 48);
  double aRect = *(double *)(v27 + 56);
  double v31 = v22 + v26;
  double v32 = *(double *)(v27 + 24);
  objc_msgSend(v9, "convertSize:toView:", v10, v31 + v30, v20 + v24 + v32);
  double v34 = v33;
  double v36 = v35;
  double v108 = v32;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0 || (*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) == 0) {
    goto LABEL_15;
  }
  if ((unint64_t)v6 >= [(NSMutableArray *)self->_textContainers count] - 1)
  {
    if (*(unsigned char *)&self->_lmFlags) {
      goto LABEL_15;
    }
  }
  else if ([(NSLayoutManager *)self _indexOfFirstGlyphInTextContainer:[(NSMutableArray *)self->_textContainers objectAtIndex:v6 + 1] okToFillHoles:0] != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_15;
  }
  if (v34 >= v12) {
    double v38 = v34;
  }
  else {
    double v38 = v12;
  }
  if (v36 >= v14) {
    double v39 = v36;
  }
  else {
    double v39 = v14;
  }
  if (v36 < v14 || v34 < v12)
  {
    char v37 = 1;
    goto LABEL_16;
  }
  double v34 = v38;
LABEL_15:
  char v37 = 0;
  *(_OWORD *)(v28 + 32) = *(_OWORD *)value;
  *(double *)(v28 + 48) = v30;
  *(double *)(v28 + 56) = v32;
  double v38 = v34;
  double v39 = v36;
LABEL_16:
  objc_msgSend(v9, "setConstrainedFrameSize:", v38, v39);
  [v9 frame];
  double width = v115.width;
  double height = v115.height;
  v114.double width = v12;
  v114.double height = v14;
  if (!NSEqualSizes(v114, v115) && v10)
  {
    [v9 visibleRect];
    double v46 = v44;
    CGFloat v47 = v45;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      if (v14 != height)
      {
        double v65 = v42;
        double v66 = v43;
        if (NSIsEmptyRect(*(NSRect *)&v42)) {
          goto LABEL_49;
        }
        unint64_t v67 = v9;
        double v68 = v65;
        double v69 = v66;
        double v70 = v46;
        double v71 = v47;
        uint64_t v72 = 1;
LABEL_48:
        objc_msgSend(v67, "setNeedsDisplayInRect:avoidAdditionalLayout:", v72, v68, v69, v70, v71);
        goto LABEL_49;
      }
      if (width <= v12) {
        goto LABEL_49;
      }
      double v74 = v42;
      double v75 = v43;
      [v9 frame];
      [v9 convertRect:v10 fromView:v12 + v76];
      CGFloat v62 = v74;
      CGFloat v63 = v75;
      CGFloat v64 = v46;
    }
    else
    {
      CGFloat v103 = v42;
      CGFloat v104 = v43;
      CGFloat bRect = v44;
      [v9 frame];
      double v52 = v48;
      if (height > v14)
      {
        double v101 = v51;
        double v102 = v49;
        double v99 = v48;
        double v100 = v50;
        objc_msgSend(v9, "convertRect:fromView:", v10, v48, v14 + v49, v50, v51 - v14);
        v124.origin.double x = v103;
        v124.origin.double y = v104;
        v124.size.double width = bRect;
        v124.size.double height = v47;
        NSRect v117 = NSIntersectionRect(v116, v124);
        double x = v117.origin.x;
        double y = v117.origin.y;
        double v55 = v117.size.width;
        double v56 = v117.size.height;
        BOOL v57 = NSIsEmptyRect(v117);
        double v52 = v99;
        double v50 = v100;
        double v51 = v101;
        double v49 = v102;
        if (!v57)
        {
          objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, x, y, v55, v56, v99);
          double v52 = v99;
          double v50 = v100;
          double v51 = v101;
          double v49 = v102;
        }
      }
      if (width <= v12) {
        goto LABEL_49;
      }
      objc_msgSend(v9, "convertRect:fromView:", v10, v12 + v52, v49, v50 - v12, v51);
      CGFloat v62 = v103;
      CGFloat v63 = v104;
      CGFloat v64 = bRect;
    }
    CGFloat v77 = v47;
    NSRect v118 = NSIntersectionRect(*(NSRect *)&v58, *(NSRect *)&v62);
    CGFloat v78 = v118.origin.x;
    CGFloat v79 = v118.origin.y;
    CGFloat v80 = v118.size.width;
    CGFloat v81 = v118.size.height;
    if (NSIsEmptyRect(v118)) {
      goto LABEL_49;
    }
    unint64_t v67 = v9;
    double v68 = v78;
    double v69 = v79;
    double v70 = v80;
    double v71 = v81;
    uint64_t v72 = 0;
    goto LABEL_48;
  }
LABEL_49:
  if ((v37 & 1) == 0)
  {
    [v9 visibleRect];
    double v84 = v83;
    double v86 = v85;
    double v87 = v82;
    double v89 = v88;
    if (v30 >= v111)
    {
      double v94 = aRect;
      double v93 = aRect;
      double v91 = v109;
    }
    else
    {
      v119.origin.double x = v107 + v30 + v106;
      v119.origin.double y = v110 + v109;
      v119.size.double width = v84 + v82 - v119.origin.x;
      v119.size.double height = aRect;
      v125.origin.double x = v84;
      v125.origin.double y = v86;
      v125.size.double width = v87;
      v125.size.double height = v89;
      NSRect v120 = NSIntersectionRect(v119, v125);
      double v90 = v120.origin.x;
      double v91 = v120.origin.y;
      double v92 = v120.size.width;
      double v93 = v120.size.height;
      if (!NSIsEmptyRect(v120)) {
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v90, v91, v92, v93);
      }
      double v94 = aRect;
    }
    if (v108 < v94)
    {
      v121.origin.double y = v110 + v108 + v91;
      v121.size.double height = v93 - v108;
      v121.origin.double x = v84;
      v121.size.double width = v87;
      v126.origin.double x = v84;
      v126.origin.double y = v86;
      v126.size.double width = v87;
      v126.size.double height = v89;
      NSRect v122 = NSIntersectionRect(v121, v126);
      double v95 = v122.origin.x;
      double v96 = v122.origin.y;
      double v97 = v122.size.width;
      double v98 = v122.size.height;
      if (!NSIsEmptyRect(v122)) {
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v95, v96, v97, v98);
      }
    }
    if (v111 < 0.0 && aRect < 0.0)
    {
      v123.origin.double x = v84;
      v123.origin.double y = v86;
      v123.size.double width = v87;
      v123.size.double height = v89;
      if (!NSIsEmptyRect(v123)) {
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v84, v86, v87, v89);
      }
    }
  }
}

- (id)_selectedRanges
{
  return 0;
}

- (void)_growCachedRectArrayToSize:(unint64_t)a3
{
  cachedRectArrayCapacitdouble y = self->_cachedRectArrayCapacity;
  if (cachedRectArrayCapacity < a3)
  {
    cachedRectArradouble y = self->_cachedRectArray;
    if (cachedRectArray)
    {
      self->_cachedRectArrayCapacitdouble y = 2 * cachedRectArrayCapacity;
      unint64_t v6 = (CGRect *)NSReallocateCollectable(cachedRectArray, cachedRectArrayCapacity << 6, 0);
    }
    else
    {
      self->_cachedRectArrayCapacitdouble y = 3;
      unint64_t v6 = (CGRect *)NSAllocateCollectable(0x60uLL, 0);
    }
    self->_cachedRectArradouble y = v6;
  }
}

- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11 rectArray:(CGRect *)a12 rectArrayCapacity:(unint64_t)a13
{
  BOOL v265 = a6;
  BOOL v252 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t range1 = a3.length;
  NSUInteger v14 = a3.location;
  double v15 = self;
  double v16 = a9;
  unint64_t v273 = 0;
  BOOL v18 = (*(_DWORD *)&self->_lmFlags & 0x20) == 0 && a12 == 0;
  BOOL v257 = v18;
  v272.NSUInteger location = 0;
  v272.NSUInteger length = 0;
  uint64_t v19 = [(NSTextStorage *)self->_textStorage string];
  extraDatdouble a = v15->_extraData;
  if (!extraData[26] || !extraData[30])
  {
    *a9 = 0;
    _NSRange result = 0;
    if (a11) {
      *a11 = 0;
    }
    return result;
  }
  double v21 = (void *)v19;
  if ((*(unsigned char *)&v15->_lmFlags & 0x40) == 0) {
    ++v15->_displayInvalidationDisableStack;
  }
  if (v257)
  {
    v244 = 0;
    *(_DWORD *)&v15->_lmFlags |= 0x20u;
  }
  else if (a12)
  {
    v244 = 0;
  }
  else
  {
    v244 = (void *)[MEMORY[0x1E4F1CA58] data];
  }
  unint64_t v23 = v14;
  if (v252) {
    unint64_t v23 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1);
  }
  if ((*((unsigned char *)&v15->_lmFlags + 3) & 0x40) != 0)
  {
    firstUnlaidGlyphIndedouble x = *(void *)(*((void *)v15->_extraData + 26) + 8);
  }
  else if (v15->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL {
         || (firstUnlaidGlyphIndedouble x = v15->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  }
  {
    [(NSLayoutManager *)v15 getFirstUnlaidCharacterIndex:0 glyphIndex:&v273];
    firstUnlaidGlyphIndedouble x = v273;
    goto LABEL_26;
  }
  unint64_t v273 = firstUnlaidGlyphIndex;
LABEL_26:
  uint64_t v25 = [(NSLayoutManager *)v15 _indexOfFirstGlyphInTextContainer:a8 okToFillHoles:0];
  if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v26 = firstUnlaidGlyphIndex;
  }
  else {
    unint64_t v26 = v25;
  }
  if (v23 > v26) {
    unint64_t v26 = v23;
  }
  if ((*((unsigned char *)&v15->_lmFlags + 3) & 0x40) != 0)
  {
    unint64_t v27 = v273;
  }
  else
  {
    unint64_t v27 = v273;
    if (*(unsigned char *)(*((void *)v15->_extraData + 30) + 56))
    {
      CFDictionaryRef v28 = (CFDictionaryRef)a8;
      goto LABEL_37;
    }
  }
  CFDictionaryRef v28 = (CFDictionaryRef)a8;
  if (v23 == v27)
  {
    unint64_t v27 = v23;
    unint64_t v26 = v23;
  }
LABEL_37:
  if (v26 >= v27) {
    unint64_t v29 = v27;
  }
  else {
    unint64_t v29 = v26;
  }
  value[0] = 0;
  double v30 = (CFDictionaryRef *)v15->_extraData;
  if (v30[10] == v28)
  {
    unint64_t v236 = 0;
  }
  else
  {
    int ValueIfPresent = CFDictionaryGetValueIfPresent(v30[11], v28, (const void **)value);
    uint64_t v32 = (uint64_t)value[0];
    if (!ValueIfPresent) {
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v236 = v32;
  }
  *a9 = 0;
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v29, 1uLL);
  if (v29 >= *(void *)(*((void *)v15->_extraData + 26) + 8))
  {
    v272.NSUInteger location = v29;
    v272.NSUInteger length = 0;
    NSUInteger v33 = v29;
  }
  else
  {
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v29, (uint64_t *)&v272);
    NSUInteger v33 = v272.location;
  }
  long long v233 = a10;
  if (v33)
  {
    unint64_t v34 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v33 - 1);
    if (v34 >= [v21 length]) {
      goto LABEL_62;
    }
    int v35 = [v21 characterAtIndex:v34];
    char v36 = 1;
    if (v35 <= 132)
    {
      if (v35 == 10 || v35 == 12) {
        goto LABEL_67;
      }
      if (v35 == 13)
      {
        unint64_t v38 = v34 + 1;
        if (v38 >= [v21 length] || objc_msgSend(v21, "characterAtIndex:", v38) != 10) {
          goto LABEL_67;
        }
      }
LABEL_62:
      if (v272.location == v29
        && [(NSLayoutManager *)v15 applicationFrameworkContext] == 2
        && [v15->_firstTextView selectionAffinity] == 1)
      {
        unint64_t v39 = v29 - 1;
        _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v39, 1uLL);
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v39, (uint64_t *)&v272);
      }
      char v36 = 0;
      goto LABEL_67;
    }
    if ((v35 - 8232) >= 2 && v35 != 133) {
      goto LABEL_62;
    }
  }
  else
  {
    char v36 = 1;
  }
LABEL_67:
  NSUInteger v40 = v272.location;
  if (v272.location >= *(void *)(*((void *)v15->_extraData + 26) + 8))
  {
    LOBYTE(v237) = 0;
    char v180 = 0;
    cachedRectArradouble y = a12;
    goto LABEL_394;
  }
  NSUInteger v234 = location;
  BOOL v239 = 0;
  int v243 = 0;
  int v237 = 0;
  unint64_t __n = 32 * a13;
  cachedRectArradouble y = a12;
  v253 = v15;
  v260 = v21;
  while (1)
  {
    unint64_t v42 = v40;
    if (v252) {
      unint64_t v42 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v40);
    }
    uint64_t v43 = range1;
    if (range1 || (v36 & 1) == 0 && (v44 = [v15->_firstTextView selectionAffinity], uint64_t v43 = 0, v44))
    {
      if (v42 >= v43 + v14) {
        goto LABEL_385;
      }
    }
    else if (v42 > v14)
    {
      char v180 = 0;
      uint64_t range1 = 0;
      goto LABEL_394;
    }
    if ((*((unsigned char *)&v15->_lmFlags + 3) & 0x40) == 0) {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v40, 1uLL);
    }
    double v45 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v40, (uint64_t *)&v272);
    double v264 = v46;
    double v258 = v48;
    double v259 = v47;
    NSUInteger v49 = v272.location;
    if ((*((unsigned char *)&v15->_lmFlags + 3) & 0x40) != 0)
    {
      CFDictionaryRef v53 = (CFDictionaryRef)[(NSMutableArray *)v15->_textContainers objectAtIndex:0];
    }
    else if ([(NSRunStorage *)v15->_containerRuns count] <= v49)
    {
      CFDictionaryRef v53 = 0;
    }
    else
    {
      containerRuns = v15->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v49, 0);
      unint64_t v52 = 0;
      if (containerRuns->_gapBlockIndex <= v51) {
        unint64_t v52 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      CFDictionaryRef v53 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v52 + v51)];
    }
    unint64_t v54 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v49);
    unint64_t v55 = v54;
    if (!(v243 & 1 | (v53 != a8)))
    {
      if (v252)
      {
        if (v54 > v14)
        {
          uint64_t range1 = range1 + v14 - v54;
          int v243 = 1;
          NSUInteger v14 = v54;
          goto LABEL_93;
        }
      }
      else if (v49 > v14)
      {
        uint64_t range1 = range1 + v14 - v49;
        int v243 = 1;
        NSUInteger v14 = v49;
        goto LABEL_93;
      }
      int v243 = 1;
    }
LABEL_93:
    if (v239)
    {
      BOOL v56 = 1;
    }
    else
    {
      BOOL v57 = cachedRectArray;
      NSUInteger v58 = v14;
      if (v252) {
        NSUInteger v58 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1);
      }
      BOOL v56 = v36 & 1 | (range1 != 0) || [v15->_firstTextView selectionAffinity] != 1
          ? v58 < v272.length + v272.location
          : v58 <= v272.length + v272.location;
      cachedRectArradouble y = v57;
    }
    value[0] = 0;
    unint64_t v59 = (CFDictionaryRef *)v15->_extraData;
    if (v59[10] != v53)
    {
      int v60 = CFDictionaryGetValueIfPresent(v59[11], v53, (const void **)value);
      unint64_t v61 = (unint64_t)value[0];
      if (!v60) {
        unint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v61 > v236) {
        break;
      }
    }
    BOOL v239 = v56;
    if ((v243 & v56) != 1) {
      goto LABEL_131;
    }
    NSUInteger v62 = v272.location;
    NSUInteger v63 = v272.length;
    [a8 lineFragmentPadding];
    double v65 = v64;
    double v66 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)v15, v272.location, 0);
    double v250 = v67;
    double v69 = v68;
    if (v252)
    {
      uint64_t v70 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1, v66);
      NSUInteger v72 = v70;
      NSUInteger v73 = v71;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v269 = v71;
        NSUInteger v249 = v70;
      }
      else
      {
        NSUInteger v249 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v234, length);
        NSUInteger v269 = v76;
      }
    }
    else
    {
      NSUInteger v73 = range1;
      NSUInteger v74 = length;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v74 = range1;
      }
      NSUInteger v269 = v74;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v75 = v14;
      }
      else {
        NSUInteger v75 = v234;
      }
      NSUInteger v249 = v75;
      NSUInteger v72 = v14;
    }
    NSRange v77 = v272;
    CGFloat v78 = cachedRectArray;
    if (v72 == v272.length + v272.location)
    {
      NSUInteger v79 = 0;
    }
    else
    {
      v276.NSUInteger location = v72;
      v276.NSUInteger length = v73;
      NSRange v80 = NSIntersectionRange(v276, v77);
      NSUInteger v72 = v80.location;
      NSUInteger v79 = v80.length;
      v77.NSUInteger location = v272.location;
    }
    NSUInteger v81 = v63 + v62;
    if ((*((unsigned char *)&v15->_lmFlags + 3) & 2) != 0)
    {
      double v21 = v260;
      if (v79 && v81 > v77.location)
      {
        do
        {
          NSUInteger v82 = v81 - 1;
          if ((-[NSLayoutManager propertyForGlyphAtIndex:](v15, "propertyForGlyphAtIndex:", v81 - 1, v233) & 4) == 0) {
            break;
          }
          --v81;
        }
        while (v82 > v272.location);
      }
    }
    else
    {
      double v21 = v260;
    }
    NSUInteger v242 = v81;
    if (v72 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v247 = v249 + v269;
      double v246 = v250 + v69;
      double v87 = v45 + v65 + v259 + v65 * -2.0;
      double v245 = v87;
      if (v87 < v45 + v65) {
        double v87 = v45 + v65;
      }
      double v254 = v45 + v65;
      double v255 = v45;
      double v241 = v87 - (v45 + v65);
      BOOL v88 = v252;
      if (!range1) {
        BOOL v88 = 0;
      }
      BOOL v240 = v88;
      NSUInteger v248 = v14;
      cachedRectArradouble y = v78;
      while (1)
      {
        if ((*((unsigned char *)&v15->_lmFlags + 3) & 2) == 0)
        {
          int v89 = 0;
LABEL_154:
          uint64_t v90 = v79;
          goto LABEL_155;
        }
        int v89 = 0;
        if (a7) {
          goto LABEL_154;
        }
        uint64_t v90 = v79;
        if (v272.length)
        {
          int v96 = [(NSLayoutManager *)v15 intAttribute:2 forGlyphAtIndex:v72 - (v72 >= v272.length + v272.location)];
          int v89 = v96 & 1;
          if (!v79)
          {
            uint64_t v90 = 0;
            NSUInteger v14 = v248;
            goto LABEL_155;
          }
          uint64_t v90 = v79;
          if (v72 + 1 < v72 + v79)
          {
            double v97 = cachedRectArray;
            uint64_t v90 = 1;
            do
            {
              if ((-[NSLayoutManager intAttribute:forGlyphAtIndex:](v15, "intAttribute:forGlyphAtIndex:", 2, v72 + v90, v233)- v96))
              {
                if (v72 + v90 + 1 != v272.length + v272.location) {
                  goto LABEL_175;
                }
                unint64_t v98 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v72 + v90);
                int v99 = [v21 characterAtIndex:v98];
                if (v99 > 132)
                {
                  if ((v99 - 8232) >= 2 && v99 != 133) {
                    goto LABEL_175;
                  }
                }
                else if (v99 != 10 && v99 != 12)
                {
                  if (v99 != 13) {
                    goto LABEL_175;
                  }
                  unint64_t v100 = v98 + 1;
                  if (v100 < [v21 length]
                    && [v21 characterAtIndex:v100] == 10)
                  {
                    goto LABEL_175;
                  }
                }
              }
              ++v90;
            }
            while (v79 != v90);
            uint64_t v90 = v79;
LABEL_175:
            cachedRectArradouble y = v97;
          }
          if (v72 <= v272.location)
          {
            NSUInteger v101 = v90 + v72;
            BOOL v112 = v90 + v72 < v272.length + v272.location && v242 > v72;
            NSUInteger v14 = v248;
            if (!v112) {
              goto LABEL_155;
            }
          }
          else
          {
            NSUInteger v14 = v248;
            if (v242 <= v72) {
              goto LABEL_155;
            }
            NSUInteger v101 = v90 + v72;
          }
          if (v101 > v242) {
            uint64_t v90 = v242 - v72;
          }
        }
LABEL_155:
        NSUInteger v91 = v90 + v72;
        NSUInteger v268 = v90 + v72;
        if (a7)
        {
          int v92 = 1;
          double v93 = v45;
          double v94 = v264;
          double v262 = v264;
          double v95 = v259;
          double v266 = v259;
          double v261 = v258;
          double v270 = v258;
          goto LABEL_341;
        }
        NSUInteger v102 = v272.length + v272.location;
        if (v272.location <= v249) {
          double v103 = v250;
        }
        else {
          double v103 = v264;
        }
        if (v102 >= v247) {
          double v104 = v246;
        }
        else {
          double v104 = v264 + v258;
        }
        BOOL v106 = v72 > v272.location || v72 == v249;
        v256 = cachedRectArray;
        if (v91 != v247 && v91 >= v102)
        {
LABEL_193:
          int v107 = 0;
          goto LABEL_218;
        }
        BOOL v108 = v91 != v102 || v102 == 0;
        if (v108 || ![(NSTextStorage *)v15->_textStorage length]) {
          goto LABEL_217;
        }
        unint64_t v109 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.location + v272.length - 1);
        int v110 = [v260 characterAtIndex:v109];
        int v107 = 0;
        if (v110 > 132)
        {
          if ((v110 - 8232) < 2 || v110 == 133) {
            goto LABEL_218;
          }
LABEL_217:
          int v107 = 1;
          goto LABEL_218;
        }
        if (v110 == 10 || v110 == 12) {
          goto LABEL_218;
        }
        if (v110 != 13) {
          goto LABEL_217;
        }
        unint64_t v111 = v109 + 1;
        if (v111 < [v260 length])
        {
          NSUInteger v14 = v248;
          if ([v260 characterAtIndex:v111] != 10) {
            goto LABEL_193;
          }
          goto LABEL_217;
        }
        int v107 = 0;
        NSUInteger v14 = v248;
LABEL_218:
        double v113 = v104 - v103;
        if (v89) {
          char v114 = v107;
        }
        else {
          char v114 = v106;
        }
        if (!v89) {
          BOOL v106 = v107;
        }
        double v270 = v113;
        if ((v114 & 1) == 0 && !v106)
        {
          double v94 = v103;
          int v92 = 1;
          double v93 = v254;
          double v262 = v264;
          double v266 = v259;
          double v261 = v258;
          double v95 = v241;
          double v15 = v253;
          double v21 = v260;
          cachedRectArradouble y = v256;
          goto LABEL_341;
        }
        unint64_t v115 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v253, v272.location);
        NSRect v116 = _insertionPointHelperForCharacterAtIndex((uint64_t)v253, v115);
        v117.NSUInteger location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v253, "characterRangeForGlyphRange:actualGlyphRange:", v72, v90, 0);
        v118.NSUInteger location = v14;
        if (v252)
        {
          NSUInteger v119 = 0;
        }
        else
        {
          NSUInteger v14 = v117.location;
          NSUInteger v119 = v118.length;
        }
        if (v240)
        {
          v117.NSUInteger length = v118.length;
          v118.NSUInteger length = range1;
          NSRange v120 = NSIntersectionRange(v118, v117);
          NSUInteger v14 = v120.location;
          NSUInteger v119 = v120.length;
        }
        BOOL v263 = v106;
        if (v116)
        {
          logicalPositions = v116->_logicalPositions;
          logicalLeftBoundaries = v116->_logicalLeftBoundaries;
          logicalCharIndexes = v116->_logicalCharIndexes;
          logicalRightBoundaries = v116->_logicalRightBoundaries;
          logicalAltPositions = v116->_logicalAltPositions;
          logicalAltCharIndexes = v116->_logicalAltCharIndexes;
          unint64_t count = v116->_count;
          unint64_t altCount = v116->_altCount;
        }
        else
        {
          logicalPositions = 0;
          logicalAltPositions = 0;
          logicalLeftBoundaries = 0;
          logicalRightBoundaries = 0;
          logicalCharIndexes = 0;
          logicalAltCharIndexes = 0;
          unint64_t count = 0;
          unint64_t altCount = 0;
        }
        cachedRectArradouble y = v256;
        if (v119)
        {
          if (v114)
          {
            double v93 = v245;
            if (!count) {
              goto LABEL_285;
            }
LABEL_251:
            double v132 = v245;
            if (logicalLeftBoundaries)
            {
              double v132 = v245;
              if (logicalCharIndexes)
              {
                uint64_t v133 = 0;
                double v132 = v245;
                do
                {
                  v134.NSUInteger location = logicalCharIndexes[v133];
                  uint64_t v135 = v133 + 1;
                  if (v133 + 1 >= count) {
                    v134.NSUInteger length = 1;
                  }
                  else {
                    v134.NSUInteger length = logicalCharIndexes[v133 + 1] - v134.location;
                  }
                  v277.NSUInteger location = v14;
                  v277.NSUInteger length = v119;
                  if (NSIntersectionRange(v277, v134).length && v45 + logicalLeftBoundaries[v133] < v132) {
                    double v132 = v45 + logicalLeftBoundaries[v133];
                  }
                  ++v133;
                }
                while (count != v135);
              }
            }
            if (v114)
            {
              double v93 = v132;
              cachedRectArradouble y = v256;
              goto LABEL_285;
            }
            int v131 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
            cachedRectArradouble y = v256;
          }
          else
          {
            int v131 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
            if (v131)
            {
              double v132 = v245;
              if (count) {
                goto LABEL_251;
              }
            }
            else
            {
              double v132 = v245;
            }
          }
          double v93 = v254;
          if (!v131) {
            goto LABEL_285;
          }
          double v93 = v254;
          if (!count) {
            goto LABEL_285;
          }
          double v93 = v254;
          if (!logicalLeftBoundaries) {
            goto LABEL_285;
          }
          double v93 = v254;
          if (!logicalCharIndexes) {
            goto LABEL_285;
          }
          unint64_t v136 = cachedRectArray;
          for (uint64_t i = 0; ; ++i)
          {
            v138.NSUInteger location = logicalCharIndexes[i];
            unint64_t v139 = i + 1;
            if (i + 1 < count) {
              v138.NSUInteger length = logicalCharIndexes[i + 1] - v138.location;
            }
            else {
              v138.NSUInteger length = 1;
            }
            v278.NSUInteger location = v14;
            v278.NSUInteger length = v119;
            if (NSIntersectionRange(v278, v138).length)
            {
              if (v139 >= count)
              {
                double v93 = v254;
                goto LABEL_284;
              }
            }
            else
            {
              double v140 = v45 + logicalLeftBoundaries[i];
              if (v140 < v132 || v139 >= count)
              {
                if (v140 >= v132) {
                  double v93 = v254;
                }
                else {
                  double v93 = v132;
                }
LABEL_284:
                cachedRectArradouble y = v136;
LABEL_285:
                if (v263)
                {
                  double v15 = v253;
                  if (!count)
                  {
                    double v142 = v254;
                    goto LABEL_334;
                  }
LABEL_290:
                  double v142 = v254;
                  if (logicalRightBoundaries)
                  {
                    double v142 = v254;
                    if (logicalCharIndexes)
                    {
                      uint64_t v144 = 0;
                      double v142 = v254;
                      do
                      {
                        v145.NSUInteger location = logicalCharIndexes[v144];
                        uint64_t v146 = v144 + 1;
                        if (v144 + 1 >= count) {
                          v145.NSUInteger length = 1;
                        }
                        else {
                          v145.NSUInteger length = logicalCharIndexes[v144 + 1] - v145.location;
                        }
                        v279.NSUInteger location = v14;
                        v279.NSUInteger length = v119;
                        if (NSIntersectionRange(v279, v145).length && v45 + logicalRightBoundaries[v144] > v142) {
                          double v142 = v45 + logicalRightBoundaries[v144];
                        }
                        ++v144;
                      }
                      while (count != v146);
                    }
                  }
                  if (!v263)
                  {
                    int v143 = *(_DWORD *)&v15->_lmFlags & 0x2000000;
                    goto LABEL_302;
                  }
LABEL_321:
                  double v16 = a9;
LABEL_335:
                  double v21 = v260;
                  NSUInteger v14 = v248;
LABEL_336:
                  double v94 = v103;
                  if (v142 >= v93) {
                    double v153 = v142;
                  }
                  else {
                    double v153 = v93;
                  }
                  int v92 = 1;
                  double v95 = v153 - v93;
LABEL_340:
                  double v262 = v264;
                  double v266 = v259;
                  double v261 = v258;
                  goto LABEL_341;
                }
                double v15 = v253;
                int v143 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
                if (v143)
                {
                  double v142 = v254;
                  if (count) {
                    goto LABEL_290;
                  }
LABEL_302:
                  if (v143 && count && logicalRightBoundaries && logicalCharIndexes)
                  {
                    for (uint64_t j = 0; ; ++j)
                    {
                      v148.NSUInteger location = logicalCharIndexes[j];
                      unint64_t v149 = j + 1;
                      if (j + 1 < count) {
                        v148.NSUInteger length = logicalCharIndexes[j + 1] - v148.location;
                      }
                      else {
                        v148.NSUInteger length = 1;
                      }
                      v280.NSUInteger location = v14;
                      v280.NSUInteger length = v119;
                      if (NSIntersectionRange(v280, v148).length)
                      {
                        if (v149 >= count)
                        {
                          double v142 = v245;
                          goto LABEL_321;
                        }
                      }
                      else
                      {
                        double v150 = v45 + logicalRightBoundaries[j];
                        if (v150 > v142 || v149 >= count)
                        {
                          if (v150 <= v142) {
                            double v142 = v245;
                          }
                          goto LABEL_321;
                        }
                      }
                    }
                  }
                }
                double v142 = v245;
LABEL_334:
                double v16 = a9;
                goto LABEL_335;
              }
            }
          }
        }
        unint64_t v128 = 0x7FFFFFFFFFFFFFFFLL;
        if (!count)
        {
          double v93 = v254;
          double v15 = v253;
LABEL_323:
          if (!altCount) {
            goto LABEL_333;
          }
          goto LABEL_324;
        }
        double v15 = v253;
        if (logicalPositions)
        {
          double v93 = v254;
          if (!logicalCharIndexes) {
            goto LABEL_323;
          }
          unint64_t v129 = 0;
          do
            unint64_t v128 = logicalCharIndexes[v129++];
          while (v128 < v14 && v129 < count);
          double v93 = v45 + logicalPositions[v129 - 1];
          if (!altCount)
          {
LABEL_333:
            double v142 = v93;
            goto LABEL_334;
          }
        }
        else
        {
          double v93 = v254;
          if (!altCount) {
            goto LABEL_333;
          }
        }
LABEL_324:
        double v16 = a9;
        double v21 = v260;
        NSUInteger v14 = v248;
        if (!logicalAltPositions || !logicalAltCharIndexes)
        {
          double v142 = v93;
          goto LABEL_336;
        }
        uint64_t v152 = 0;
        while (logicalAltCharIndexes[v152] != v128)
        {
          if (++v152 >= altCount)
          {
            double v94 = v103;
            int v92 = 1;
            double v95 = v93 - v93;
            goto LABEL_340;
          }
        }
        int v92 = 0;
        double v45 = v45 + logicalAltPositions[v152];
        double v94 = v103;
        double v261 = v113;
        double v262 = v103;
        double v266 = v93 - v93;
        double v95 = v93 - v93;
        if (!*v16) {
          goto LABEL_357;
        }
LABEL_341:
        if (v265) {
          goto LABEL_367;
        }
        NSRange v154 = &cachedRectArray[*v16];
        double x = v154[-1].origin.x;
        double y = v154[-1].origin.y;
        double width = v154[-1].size.width;
        double height = v154[-1].size.height;
        if (v93 == x && v95 == width)
        {
          double v160 = v270;
          if (v94 == y + height || y == v94 + v270) {
            goto LABEL_367;
          }
          double v162 = v94;
          double v163 = v93;
          double v164 = v95;
          if (NSIntersectsRect(*(NSRect *)(&v160 - 3), v154[-1])) {
            goto LABEL_367;
          }
        }
        if (v94 != y || v270 != height) {
          goto LABEL_357;
        }
        if (v93 == x + width || x == v93 + v95) {
          goto LABEL_367;
        }
        v281.origin.double x = v93;
        v281.origin.double y = v94;
        v281.size.double width = v95;
        v281.size.double height = v270;
        v282.origin.double x = x;
        v282.origin.double y = y;
        v282.size.double width = width;
        v282.size.double height = height;
        if (NSIntersectsRect(v281, v282))
        {
LABEL_367:
          unint64_t v170 = *v16;
          BOOL v171 = &cachedRectArray[*v16];
          v171[-1].origin.double x = NSLMUnionRect(v171[-1].origin.x, v171[-1].origin.y, v171[-1].size.width, v171[-1].size.height, v93, v94, v95, v270);
          v171[-1].origin.double y = v172;
          v171[-1].size.double width = v173;
          v171[-1].size.double height = v174;
          double v21 = v260;
        }
        else
        {
LABEL_357:
          unint64_t v166 = *v16 + 1;
          unint64_t *v16 = v166;
          if (v257)
          {
            -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
            cachedRectArradouble y = v15->_cachedRectArray;
            double v167 = v270;
          }
          else
          {
            double v167 = v270;
            if (a12)
            {
              if (v166 > a13)
              {
                BOOL v168 = (void *)[MEMORY[0x1E4F1CA58] data];
                [v168 setLength:32 * *v16];
                v244 = v168;
                cachedRectArradouble y = (CGRect *)[v168 mutableBytes];
                memcpy(cachedRectArray, a12, __n);
              }
            }
            else
            {
              [v244 setLength:32 * v166];
              cachedRectArradouble y = (CGRect *)[v244 mutableBytes];
            }
          }
          unint64_t v170 = *v16;
          double v175 = &cachedRectArray[*v16];
          v175[-1].origin.double x = v93;
          v175[-1].origin.double y = v94;
          v175[-1].size.double width = v95;
          v175[-1].size.double height = v167;
        }
        if ((v92 | v265))
        {
          NSUInteger v176 = v268;
          goto LABEL_380;
        }
        unint64_t v177 = v170 + 1;
        unint64_t *v16 = v170 + 1;
        if (v257)
        {
          -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
          cachedRectArradouble y = v15->_cachedRectArray;
        }
        else
        {
          if (a12)
          {
            NSUInteger v176 = v268;
            if (v177 > a13)
            {
              NSUInteger v178 = (void *)[MEMORY[0x1E4F1CA58] data];
              [v178 setLength:32 * *v16];
              v244 = v178;
              cachedRectArradouble y = (CGRect *)[v178 mutableBytes];
              memcpy(cachedRectArray, a12, __n);
            }
            goto LABEL_379;
          }
          [v244 setLength:32 * v177];
          cachedRectArradouble y = (CGRect *)[v244 mutableBytes];
        }
        NSUInteger v176 = v268;
LABEL_379:
        uint64_t v179 = &cachedRectArray[*v16];
        v179[-1].origin.double x = v45;
        v179[-1].origin.double y = v262;
        v179[-1].size.double width = v266;
        v179[-1].size.double height = v261;
LABEL_380:
        NSUInteger v79 = v72 + v79 - v176;
        double v45 = v255;
        if (v79)
        {
          NSUInteger v72 = v176;
          if (v176 != 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
        }
        goto LABEL_130;
      }
    }
    cachedRectArradouble y = v78;
LABEL_130:
    v237 |= _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)v15, v272.location);
LABEL_131:
    NSUInteger v40 = v272.length + v272.location;
    unint64_t v83 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.length + v272.location - 1);
    int v84 = [v21 characterAtIndex:v83];
    char v36 = 1;
    if (v84 > 132)
    {
      if ((v84 - 8232) < 2 || v84 == 133) {
        goto LABEL_143;
      }
    }
    else
    {
      if (v84 == 10 || v84 == 12) {
        goto LABEL_143;
      }
      if (v84 == 13)
      {
        unint64_t v86 = v83 + 1;
        if (v86 >= [v21 length] || objc_msgSend(v21, "characterAtIndex:", v86) != 10) {
          goto LABEL_143;
        }
      }
    }
    char v36 = 0;
LABEL_143:
    if ((*((unsigned char *)&v15->_lmFlags + 3) & 0x40) == 0) {
      _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)v15, v40, 1uLL);
    }
    if (v40 >= *(void *)(*((void *)v15->_extraData + 26) + 8))
    {
LABEL_385:
      char v180 = 0;
      goto LABEL_394;
    }
  }
  NSUInteger v181 = range1 + v14;
  if (v252)
  {
    if (v55 <= v181)
    {
      NSUInteger v182 = v55 + range1;
      goto LABEL_391;
    }
  }
  else if (v49 <= v181)
  {
    NSUInteger v182 = v49 + range1;
LABEL_391:
    uint64_t range1 = v182 - v181 + 1;
  }
  char v180 = 1;
LABEL_394:
  if (v233)
  {
    uint64_t v183 = 0x7FFFFFFFFFFFFFFFLL;
    if (*v16)
    {
      uint64_t v183 = v14;
      NSUInteger v184 = range1;
    }
    else
    {
      NSUInteger v184 = 0;
    }
    v233->NSUInteger location = v183;
    v233->NSUInteger length = v184;
  }
  if (*v16 | range1) {
    char v180 = 1;
  }
  if ((v180 & 1) != 0
    || ((unint64_t v185 = [(NSTextStorage *)v15->_textStorage length],
         unint64_t v186 = *(void *)(*((void *)v15->_extraData + 26) + 8),
         uint64_t v271 = 0,
         [a8 lineFragmentPadding],
         !v252)
      ? (unint64_t v188 = v186)
      : (unint64_t v188 = v185),
        v14 != v188))
  {
LABEL_454:
    uint64_t v191 = a11;
    goto LABEL_455;
  }
  double v189 = v187;
  if (!v185 || !v186) {
    goto LABEL_417;
  }
  int v190 = [v21 characterAtIndex:v185 - 1];
  if (v190 > 132)
  {
    if ((v190 - 8232) < 2 || v190 == 133) {
      goto LABEL_417;
    }
LABEL_429:
    unint64_t v203 = v186 - 1;
    double v204 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v203, (uint64_t *)&v272);
    double v205 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)v15, v203, 0);
    double v195 = v206;
    CGFloat v197 = v207;
    double v209 = v205 + v208 - v189;
    if (v272.length
      && (unint64_t v210 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.location),
          (int64_t v211 = _insertionPointHelperForCharacterAtIndex((uint64_t)v15, v210)) != 0))
    {
      BOOL v212 = 0;
      unint64_t v213 = v211->_count;
      uint64_t v214 = 1;
      if (v213)
      {
        v215 = v211->_logicalPositions;
        if (v215)
        {
          unint64_t v216 = v211->_logicalCharIndexes;
          if (v216)
          {
            BOOL v212 = 0;
            unint64_t v217 = v211->_altCount;
            uint64_t v218 = 8 * v213 - 8;
            double v219 = v204 + *(double *)((char *)v215 + v218);
            uint64_t v214 = 1;
            if (v217)
            {
              uint64_t v220 = v211->_logicalAltPositions;
              if (v220)
              {
                double v221 = v211->_logicalAltCharIndexes;
                if (v221)
                {
                  uint64_t v222 = 0;
                  uint64_t v223 = *(unint64_t *)((char *)v216 + v218);
                  uint64_t v214 = 1;
                  while (1)
                  {
                    unint64_t v224 = v221[v222];
                    BOOL v212 = v224 == v223;
                    if (v224 == v223) {
                      break;
                    }
                    if (++v222 >= v217) {
                      goto LABEL_446;
                    }
                  }
                  double v209 = v204 + v220[v222];
                  uint64_t v214 = 2;
                }
              }
            }
LABEL_446:
            unint64_t v227 = *v16 + v214;
            unint64_t *v16 = v227;
            if (v257)
            {
              -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
              cachedRectArradouble y = v15->_cachedRectArray;
            }
            else if (a12)
            {
              if (v227 > a13)
              {
                CGAffineTransform v228 = (void *)[MEMORY[0x1E4F1CA58] data];
                [v228 setLength:32 * *v16];
                cachedRectArradouble y = (CGRect *)[v228 mutableBytes];
                memcpy(cachedRectArray, a12, 32 * a13);
              }
            }
            else
            {
              [v244 setLength:32 * v227];
              cachedRectArradouble y = (CGRect *)[v244 mutableBytes];
            }
            unint64_t v229 = *v16;
            CGAffineTransform v230 = &cachedRectArray[*v16 - v214];
            v230->origin.double x = v219;
            *(void *)&v230->origin.double y = v195;
            v230->size.double width = 0.0;
            v230->size.double height = v197;
            if (v212)
            {
              v231 = &cachedRectArray[v229];
              v231[-1].origin.double x = v209;
              p_double x = &v231[-1].origin.x;
              uint64_t v191 = a11;
              goto LABEL_443;
            }
            goto LABEL_454;
          }
        }
      }
    }
    else
    {
      BOOL v212 = 0;
      uint64_t v214 = 1;
    }
    double v219 = v209;
    goto LABEL_446;
  }
  if (v190 != 10
    && v190 != 12
    && (v190 != 13
     || v185 < [v21 length] && objc_msgSend(v21, "characterAtIndex:", v185) == 10))
  {
    goto LABEL_429;
  }
LABEL_417:
  if (v15->_textStorage && !v15->_extraLineFragmentContainer) {
    [(NSTypesetter *)[(NSLayoutManager *)v15 typesetter] layoutGlyphsInLayoutManager:v15 startingAtGlyphIndex:v186 maxNumberOfLineFragments:1 nextGlyphIndex:&v271];
  }
  uint64_t v191 = a11;
  if (v15->_extraLineFragmentContainer == a8)
  {
    *(_OWORD *)value = 0u;
    long long v275 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)v15, (uint64_t)value, 0);
    v192 = value[0];
    double v193 = *(double *)&v275;
    *(_OWORD *)value = 0u;
    long long v275 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)v15, 0, (uint64_t)value);
    double v194 = value[0];
    double v195 = value[1];
    CGFloat v197 = *((double *)&v275 + 1);
    double v196 = *(double *)&v275;
    unint64_t v198 = *v16 + 1;
    unint64_t *v16 = v198;
    double v199 = *(double *)&v194 + v196;
    double v200 = v189 + *(double *)&v194;
    if (v199 == *(double *)&v192 + v193) {
      double v201 = v200;
    }
    else {
      double v201 = v199 - v189;
    }
    if (v257)
    {
      -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
      cachedRectArradouble y = v15->_cachedRectArray;
    }
    else if (a12)
    {
      if (v198 > a13)
      {
        double v202 = (void *)[MEMORY[0x1E4F1CA58] data];
        [v202 setLength:32 * *v16];
        cachedRectArradouble y = (CGRect *)[v202 mutableBytes];
        memcpy(cachedRectArray, a12, 32 * a13);
      }
    }
    else
    {
      [v244 setLength:32 * v198];
      cachedRectArradouble y = (CGRect *)[v244 mutableBytes];
    }
    NSUInteger v225 = &cachedRectArray[*v16];
    v225[-1].origin.double x = v201;
    p_double x = &v225[-1].origin.x;
LABEL_443:
    *((void *)p_x + 1) = v195;
    p_x[2] = 0.0;
    p_x[3] = v197;
  }
LABEL_455:
  __lmFlags lmFlags = v15->_lmFlags;
  if ((*(unsigned char *)&lmFlags & 0x40) == 0)
  {
    if (!v15->_displayInvalidationDisableStack) {
      goto LABEL_459;
    }
    if (!--v15->_displayInvalidationDisableStack)
    {
      __lmFlags lmFlags = v15->_lmFlags;
LABEL_459:
      v15->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x40);
      [(NSLayoutManager *)v15 _invalidateDisplayIfNeeded];
      *(_DWORD *)&v15->_lmFlags &= ~0x40u;
    }
  }
  if (v257) {
    *(_DWORD *)&v15->_lmFlags &= ~0x20u;
  }
  if (v191) {
    *uint64_t v191 = v237 & 1;
  }
  if (*v16) {
    return cachedRectArray;
  }
  else {
    return 0;
  }
}

- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11
{
  LOBYTE(v12) = a7;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", a3.location, a3.length, a4.location, a4.length, a5, a6, v12, a8, a9, a10, a11, 0, 0);
}

- (CGRect)_boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4 fast:(BOOL)a5 fullLineRectsOnly:(BOOL)a6
{
  unint64_t v6 = (NSTextContainer *)a4;
  uint64_t v122 = 0;
  NSRange v121 = (NSRange)0;
  char v120 = 0;
  LOBYTE(v107) = a6;
  unint64_t v8 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", a3.location, a3.length, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 1, v107, a4, &v122, &v121, &v120);
  if (v122 == 1)
  {
    double y = v8->origin.y;
    double x = v8->origin.x;
    double height = v8->size.height;
    double width = v8->size.width;
    memset(&value, 0, sizeof(value));
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&value);
    double v10 = value.origin.x;
    double v11 = value.origin.y;
    CGSize size = value.size;
    extraDatdouble a = self->_extraData;
    if (((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0 || (*(unsigned char *)(extraData[30] + 56) & 1) == 0)
      && v121.length + v121.location == *(void *)(extraData[26] + 8)
      && self->_extraLineFragmentContainer == v6)
    {
      if (NSIsEmptyRect(value))
      {
        double v14 = height;
      }
      else
      {
        double v25 = NSLMUnionRect(x, y, width, height, v10, v11, size.width, size.height);
        double y = v26;
        double x = v25;
        double width = v27;
      }
    }
    else
    {
      double v14 = height;
    }
    if (v120 && v121.length)
    {
      value.origin.double x = 0.0;
      value.origin.double y = 0.0;
      __n128 v119 = 0uLL;
      double v114 = v14;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v119.n128_u64[1] = *(void *)(*((void *)self->_extraData + 26) + 8);
        double v24 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else
      {
        double v15 = v6;
        NSUInteger location = v121.location;
        if ([(NSRunStorage *)self->_containerRuns count] <= location)
        {
          double v24 = 0;
          unint64_t v6 = v15;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, location, &v119);
          if (containerRuns->_gapBlockIndex <= v18) {
            unint64_t v19 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          }
          else {
            unint64_t v19 = 0;
          }
          unint64_t v6 = v15;
          double v24 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v19 + v18)];
        }
      }
      uint64_t v111 = [v24 layoutOrientation];
      [(NSLayoutManager *)self _setCachedTextContainer:v6 isVertical:v111 != 0];
      BOOL v108 = v6;
      if (v121.length)
      {
        NSUInteger v28 = v121.location;
        unint64_t v29 = &OBJC_IVAR___NSLayoutManager__textStorage;
        double v30 = &OBJC_IVAR___NSExtraLMData__cachedFontBounds;
        do
        {
          double v31 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v28, (uint64_t *)&value);
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          value.CGPoint origin = (CGPoint)NSIntersectionRange((NSRange)value.origin, v121);
          if (_NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v121.location))
          {
            unint64_t v38 = *(void *)&value.origin.x;
            double v112 = v33;
            double v113 = v31;
            CGFloat v109 = v37;
            for (CGFloat i = v35; v38 < *(void *)&value.origin.y + *(void *)&value.origin.x; ++v38)
            {
              char v39 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v38);
              int v40 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, v38);
              if ((v39 & 1) != 0 || !v40)
              {
                if (!v40
                  || !objc_msgSend(*(id *)((char *)&self->super.isa + *v29), "attribute:atIndex:effectiveRange:", @"NSAttachment", _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v38), 0))
                {
                  continue;
                }
                [(NSLayoutManager *)self locationForGlyphAtIndex:v38];
                double v82 = v81;
                double v84 = v83;
                [(NSLayoutManager *)self attachmentSizeForGlyphAtIndex:v38];
                double v86 = v85;
                double v88 = v87;
                double v89 = v113 + v82;
                double v90 = v112 + v84 - v87;
                double v91 = NSLMUnionRect(x, y, width, v114, v89, v90, v85, v87);
                double y = v92;
                double x = v91;
                double v114 = v94;
                double width = v93;
                double v73 = v31;
                double v74 = v33;
                double v75 = v35;
                double v76 = v37;
                double v77 = v89;
                double v78 = v90;
                double v79 = v86;
                double v80 = v88;
              }
              else
              {
                [(NSLayoutManager *)self locationForGlyphAtIndex:v38];
                double v42 = v41;
                double v44 = v43;
                NSUInteger v45 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v38);
                if (v45 < self->_cachedFontCharRange.location
                  || v45 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length)
                {
                  NSUInteger v47 = v45;
                  double v48 = v30;
                  cachedFont = self->_cachedFont;
                  double v50 = v29;
                  uint64_t v51 = *v29;
                  unint64_t v52 = (void *)[*(id *)((char *)&self->super.isa + v51) attribute:@"NSFont" atIndex:v45 effectiveRange:&self->_cachedFontCharRange];
                  CGPoint origin = (CGPoint)0;
                  CFDictionaryRef v53 = (void *)[*(id *)((char *)&self->super.isa + v51) attribute:@"CTVerticalForms" atIndex:v47 effectiveRange:&origin];
                  if (!v52) {
                    unint64_t v52 = NSDefaultFont();
                  }
                  char v54 = [v53 BOOLValue];
                  if (v111) {
                    BOOL v55 = v53 == 0;
                  }
                  else {
                    BOOL v55 = 0;
                  }
                  int v56 = v55;
                  if ((v54 & 1) != 0 || (uint64_t v57 = (uint64_t)v52, v56)) {
                    uint64_t v57 = [v52 verticalFont];
                  }
                  if (v57) {
                    unint64_t v52 = (void *)v57;
                  }
                  if ([v52 isVertical]) {
                    BOOL v58 = v53 == 0;
                  }
                  else {
                    BOOL v58 = 1;
                  }
                  unint64_t v29 = v50;
                  if (!v58
                    && *(void *)&origin.y + *(void *)&origin.x < self->_cachedFontCharRange.length
                                                                   + self->_cachedFontCharRange.location)
                  {
                    self->_cachedFontCharRange.NSUInteger length = *(void *)&origin.y
                                                      + *(void *)&origin.x
                                                      - self->_cachedFontCharRange.location;
                  }
                  self->_cachedFont = [(NSLayoutManager *)self substituteFontForFont:v52];

                  [(UIFont *)self->_cachedFont boundingRectForFont];
                  double v30 = v48;
                  unint64_t v61 = (double *)((char *)self->_extraData + *v48);
                  *(void *)unint64_t v61 = v62;
                  v61[1] = -v59 - v60;
                  *((void *)v61 + 2) = v63;
                  v61[3] = v60;
                }
                double v64 = (double *)((char *)self->_extraData + *v30);
                double v65 = v64[2];
                double v66 = v64[3];
                double v67 = v113 + v42 + *v64;
                double v68 = v112 + v44 + v64[1];
                double v69 = NSLMUnionRect(x, y, width, v114, v67, v68, v65, v66);
                double y = v70;
                double x = v69;
                double v114 = v72;
                double width = v71;
                double v73 = v31;
                double v74 = v33;
                double v75 = v35;
                double v76 = v37;
                double v77 = v67;
                double v78 = v68;
                double v79 = v65;
                double v80 = v66;
              }
              double v31 = NSLMUnionRect(v73, v74, v75, v76, v77, v78, v79, v80);
              CGFloat v33 = v95;
              CGFloat v35 = v96;
              CGFloat v37 = v97;
            }
            v124.origin.double y = v112;
            v124.origin.double x = v113;
            v124.size.double height = v109;
            v124.size.double width = i;
            v127.origin.double x = v31;
            v127.origin.double y = v33;
            v127.size.double width = v35;
            v127.size.double height = v37;
            if (!NSEqualRects(v124, v127))
            {
              CGPoint origin = value.origin;
              uint64_t v98 = 30;
              do
              {
                if (*(void *)&origin.x <= v119.n128_u64[0]) {
                  break;
                }
                v128.origin.double x = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, *(void *)&origin.x - 1, (uint64_t *)&origin);
                v128.origin.double y = v99;
                v128.size.double width = v100;
                v128.size.double height = v101;
                v125.origin.double x = v31;
                v125.origin.double y = v33;
                v125.size.double width = v35;
                v125.size.double height = v37;
                if (!NSIntersectsRect(v125, v128)) {
                  break;
                }
                if (!_NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex((uint64_t)self, *(unint64_t *)&origin.x))_NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex((uint64_t)self, *(unint64_t *)&origin.x); {
                --v98;
                }
              }
              while (v98);
            }
          }
          NSUInteger v28 = *(void *)&value.origin.y + *(void *)&value.origin.x;
          NSUInteger v102 = v121.length + v121.location - (*(void *)&value.origin.y + *(void *)&value.origin.x);
          BOOL v55 = v121.length + v121.location == *(void *)&value.origin.y + *(void *)&value.origin.x;
          v121.NSUInteger location = *(void *)&value.origin.y + *(void *)&value.origin.x;
          v121.NSUInteger length = v102;
        }
        while (!v55);
      }
      [(NSLayoutManager *)self _resetCachedTextContainer];
      unint64_t v6 = v108;
      double v14 = v114;
    }
    double v103 = v14;
    value.origin.double x = 0.0;
    double v104 = (CFDictionaryRef *)self->_extraData;
    if (v104[10] == (CFDictionaryRef)v6)
    {
      CGFloat v105 = 0.0;
    }
    else if (!CFDictionaryGetValueIfPresent(v104[11], v6, (const void **)&value) {
           || (CGFloat v105 = value.origin.x, *(void *)&value.origin.x == 0x7FFFFFFFFFFFFFFFLL))
    }
    {
      double v21 = y;
      double v20 = x;
      double v22 = width;
      double v23 = v103;
      goto LABEL_74;
    }
    BOOL v106 = [(NSStorage *)self->_containerUsedRects elementAtIndex:*(void *)&v105];
    double v21 = y;
    double v20 = x;
    *((double *)v106 + 9) = x;
    *((double *)v106 + 10) = y;
    double v22 = width;
    *((double *)v106 + 11) = width;
    *((double *)v106 + 12) = v103;
    double v23 = v103;
    *(NSRange *)(v106 + 104) = v121;
    goto LABEL_74;
  }
  double v20 = *MEMORY[0x1E4F28AD8];
  double v21 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
LABEL_74:
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 hintGlyphRange:(_NSRange)a5 okToFillHoles:(BOOL)a6
{
  HIDWORD(bRect.origin.y) = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  firstUnlaidGlyphIndeCGFloat x = 0;
  bRect.size.CGFloat width = 0.0;
  bRect.size.double height = 0.0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
  }
  else {
    firstUnlaidGlyphIndeCGFloat x = self->_firstUnlaidGlyphIndex;
  }
  CGFloat v14 = 0.0;
  if (*(double *)&location != 0.0)
  {
    CGFloat v15 = NAN;
    CGFloat v16 = *(double *)&location;
    while (1)
    {
      unint64_t v17 = *(void *)&v16 - 1;
      double v18 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, *(void *)&v16 - 1, (uint64_t *)&bRect.size);
      double v20 = v19;
      CGFloat v22 = v21;
      double v24 = v23;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        id v28 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= v17)
      {
        id v28 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        *(void *)&a3.origin.CGFloat x = _NSBlockNumberForIndex(containerRuns, v17, 0).n128_u64[0];
        unint64_t v27 = 0;
        if (containerRuns->_gapBlockIndex <= v26) {
          unint64_t v27 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        }
        id v28 = *(id *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v27 + v26)];
      }
      if (v28 != a4) {
        goto LABEL_24;
      }
      v94.origin.CGFloat x = v18;
      v94.origin.double y = v20;
      v94.size.CGFloat width = v22;
      v94.size.double height = v24;
      v98.origin.CGFloat x = x;
      v98.origin.double y = y;
      v98.size.CGFloat width = width;
      v98.size.double height = height;
      if (!NSIntersectsRect(v94, v98)) {
        break;
      }
      if (v14 == 0.0)
      {
        CGFloat v16 = bRect.size.width;
        CGFloat v14 = bRect.size.height;
        CGFloat v15 = bRect.size.width;
        if (!*(void *)&bRect.size.width) {
          goto LABEL_24;
        }
      }
      else
      {
        *(CGFloat *)&v89.NSUInteger location = v15;
        *(CGFloat *)&v89.NSUInteger length = v14;
        NSRange v29 = NSUnionRange(v89, (NSRange)bRect.size);
        CGFloat v15 = *(double *)&v29.location;
        CGFloat v14 = *(double *)&v29.length;
LABEL_19:
        CGFloat v16 = bRect.size.width;
        if (!*(void *)&bRect.size.width) {
          goto LABEL_24;
        }
      }
    }
    a3.origin.CGFloat x = v20 + v24;
    if (v20 + v24 <= y) {
      goto LABEL_24;
    }
    goto LABEL_19;
  }
  CGFloat v15 = NAN;
LABEL_24:
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    unint64_t v30 = *(void *)(*((void *)self->_extraData + 26) + 8);
  }
  else if (HIDWORD(bRect.origin.y))
  {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, location, 1uLL);
    unint64_t v88 = 0;
    _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
    unint64_t v30 = v88;
  }
  else
  {
    unint64_t v30 = firstUnlaidGlyphIndex;
  }
  if (location < v30)
  {
    char v31 = 0;
    NSUInteger v32 = location + length;
    do
    {
      double v33 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&bRect.size);
      double v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        id v43 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= location)
      {
        id v43 = 0;
      }
      else
      {
        int v40 = self->_containerRuns;
        *(void *)&a3.origin.CGFloat x = _NSBlockNumberForIndex(v40, location, 0).n128_u64[0];
        unint64_t v42 = 0;
        if (v40->_gapBlockIndex <= v41) {
          unint64_t v42 = v40->_maxBlocks - v40->_numBlocks;
        }
        id v43 = *(id *)&v40->_runs->var1[(v40->_elementSize + 8) * (v42 + v41)];
      }
      v31 |= v43 == a4;
      if (v43 != a4) {
        goto LABEL_42;
      }
      v95.origin.CGFloat x = v33;
      v95.origin.double y = v35;
      v95.size.CGFloat width = v37;
      v95.size.double height = v39;
      v99.origin.CGFloat x = x;
      v99.origin.double y = y;
      v99.size.CGFloat width = width;
      v99.size.double height = height;
      if (NSIntersectsRect(v95, v99))
      {
        if (v14 == 0.0)
        {
          CGFloat v15 = bRect.size.width;
          CGFloat v14 = bRect.size.height;
        }
        else
        {
          *(CGFloat *)&v90.NSUInteger location = v15;
          *(CGFloat *)&v90.NSUInteger length = v14;
          NSRange v44 = NSUnionRange(v90, (NSRange)bRect.size);
          CGFloat v15 = *(double *)&v44.location;
          CGFloat v14 = *(double *)&v44.length;
        }
      }
      else
      {
LABEL_42:
        BOOL v46 = v35 < y + height && v43 == a4;
        if (((location < v32) & ~v31) == 0 && !v46) {
          break;
        }
      }
      NSUInteger location = *(void *)&bRect.size.height + *(void *)&bRect.size.width;
      if (HIDWORD(bRect.origin.y) && (*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
      {
        _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, *(void *)&bRect.size.height + *(void *)&bRect.size.width, 1uLL);
        unint64_t v88 = 0;
        _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
        unint64_t v30 = v88;
      }
    }
    while (location < v30);
  }
  uint64_t v47 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", *(void *)&v15, *(void *)&v14, a3.origin.x, *(void *)&x);
  uint64_t v49 = v48;
  uint64_t v51 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v47, v48);
  if (v47 != v51 || v49 != v50)
  {
    unint64_t v52 = -[NSLayoutManager _glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:](self, "_glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:", v51, v50, 0, HIDWORD(bRect.origin.y));
    unint64_t v53 = v52;
    uint64_t v55 = v54;
    if (v52 >= *(void *)&v15)
    {
      CGFloat v57 = bRect.origin.x;
    }
    else
    {
      unint64_t v56 = v52;
      CGFloat v57 = bRect.origin.x;
      do
      {
        double v58 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v56, (uint64_t *)&bRect.size);
        CGFloat v60 = v59;
        CGFloat v62 = v61;
        CGFloat v64 = v63;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          id v68 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v56)
        {
          id v68 = 0;
        }
        else
        {
          double v65 = self->_containerRuns;
          _NSBlockNumberForIndex(v65, v56, 0);
          unint64_t v67 = 0;
          if (v65->_gapBlockIndex <= v66) {
            unint64_t v67 = v65->_maxBlocks - v65->_numBlocks;
          }
          id v68 = *(id *)&v65->_runs->var1[(v65->_elementSize + 8) * (v67 + v66)];
        }
        if (v68 == a4)
        {
          v96.origin.CGFloat x = v58;
          v96.origin.double y = v60;
          v96.size.CGFloat width = v62;
          v96.size.double height = v64;
          v100.origin.CGFloat x = bRect.origin.x;
          v100.origin.double y = y;
          v100.size.CGFloat width = width;
          v100.size.double height = height;
          if (NSIntersectsRect(v96, v100))
          {
            if (v14 == 0.0)
            {
              CGFloat v15 = bRect.size.width;
              CGFloat v14 = bRect.size.height;
            }
            else
            {
              *(CGFloat *)&v91.NSUInteger location = v15;
              *(CGFloat *)&v91.NSUInteger length = v14;
              NSRange v69 = NSUnionRange(v91, (NSRange)bRect.size);
              CGFloat v15 = *(double *)&v69.location;
              CGFloat v14 = *(double *)&v69.length;
            }
          }
        }
        unint64_t v56 = *(void *)&bRect.size.height + *(void *)&bRect.size.width;
      }
      while (*(void *)&bRect.size.height + *(void *)&bRect.size.width < *(void *)&v15);
    }
    unint64_t v70 = *(void *)&v15 + *(void *)&v14;
    if (*(void *)&v15 + *(void *)&v14 < v30)
    {
      unint64_t v71 = v53 + v55;
      do
      {
        if (v70 >= v71) {
          break;
        }
        double v72 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v70, (uint64_t *)&bRect.size);
        CGFloat v74 = v73;
        CGFloat v76 = v75;
        CGFloat v78 = v77;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          id v82 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v70)
        {
          id v82 = 0;
        }
        else
        {
          double v79 = self->_containerRuns;
          _NSBlockNumberForIndex(v79, v70, 0);
          unint64_t v81 = 0;
          if (v79->_gapBlockIndex <= v80) {
            unint64_t v81 = v79->_maxBlocks - v79->_numBlocks;
          }
          id v82 = *(id *)&v79->_runs->var1[(v79->_elementSize + 8) * (v81 + v80)];
        }
        if (v82 == a4)
        {
          v97.origin.CGFloat x = v72;
          v97.origin.double y = v74;
          v97.size.CGFloat width = v76;
          v97.size.double height = v78;
          v101.origin.CGFloat x = v57;
          v101.origin.double y = y;
          v101.size.CGFloat width = width;
          v101.size.double height = height;
          if (NSIntersectsRect(v97, v101))
          {
            if (v14 == 0.0)
            {
              CGFloat v15 = bRect.size.width;
              CGFloat v14 = bRect.size.height;
            }
            else
            {
              *(CGFloat *)&v92.NSUInteger location = v15;
              *(CGFloat *)&v92.NSUInteger length = v14;
              NSRange v83 = NSUnionRange(v92, (NSRange)bRect.size);
              CGFloat v15 = *(double *)&v83.location;
              CGFloat v14 = *(double *)&v83.length;
            }
          }
        }
        unint64_t v70 = *(void *)&bRect.size.height + *(void *)&bRect.size.width;
        if (HIDWORD(bRect.origin.y) && (*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, *(void *)&bRect.size.height + *(void *)&bRect.size.width, 1uLL);
          unint64_t v88 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
          unint64_t v30 = v88;
        }
      }
      while (v70 < v30);
    }
  }
  NSUInteger v84 = *(void *)&v15;
  NSUInteger v85 = *(void *)&v14;
  result.NSUInteger length = v85;
  result.NSUInteger location = v84;
  return result;
}

- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 okToFillHoles:(BOOL)a5
{
  BOOL v87 = a5;
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  NSRect value = 0;
  v91.NSUInteger location = 0;
  v91.NSUInteger length = 0;
  __n128 v90 = 0uLL;
  NSUInteger v11 = 0;
  NSUInteger v12 = 0;
  if (!NSIsEmptyRect(a3))
  {
    firstUnlaidGlyphIndeCGFloat x = 0;
    if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL) {
      [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
    }
    else {
      firstUnlaidGlyphIndeCGFloat x = self->_firstUnlaidGlyphIndex;
    }
    if (a4)
    {
      if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)self->_extraData + 12), a4, (const void **)&value)) {
        double v13 = value;
      }
      else {
        double v13 = 0;
      }
    }
    else
    {
      double v13 = 0;
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      unint64_t v14 = *(void *)(*((void *)self->_extraData + 26) + 8);
    }
    else if (v87)
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v13, 1uLL);
      unint64_t v88 = 0;
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
      unint64_t v14 = v88;
    }
    else
    {
      unint64_t v14 = firstUnlaidGlyphIndex;
    }
    if ((unint64_t)v13 >= v14)
    {
      NSUInteger v11 = 0;
      NSUInteger location = 0;
    }
    else
    {
      NSUInteger v84 = 0;
      NSUInteger v85 = 0;
      BOOL v15 = 0;
      char v16 = 0;
      char v17 = 0;
      do
      {
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          unint64_t v21 = *(void *)(*((void *)self->_extraData + 26) + 8);
          v90.n128_u64[0] = 0;
          v90.n128_u64[1] = v21;
          id v22 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= (unint64_t)v13)
        {
          id v22 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, (unint64_t)v13, &v90);
          if (containerRuns->_gapBlockIndex <= v19) {
            unint64_t v20 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          }
          else {
            unint64_t v20 = 0;
          }
          id v22 = *(id *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v20 + v19)];
        }
        BOOL v23 = v22 == a4;
        if (v22 == a4)
        {
          double v26 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, (unint64_t)v13, (uint64_t *)&v91);
          double v28 = v27;
          uint64_t v30 = v29;
          double v32 = v31;
          int v33 = (*(_DWORD *)&self->_lmFlags >> 30) & 1;
          if (v90.n128_u64[1] + v90.n128_u64[0] < firstUnlaidGlyphIndex) {
            int v33 = 1;
          }
          if (v33) {
            unint64_t v34 = v90.n128_u64[1] + v90.n128_u64[0];
          }
          else {
            unint64_t v34 = firstUnlaidGlyphIndex;
          }
          v97.origin.CGFloat x = x;
          v97.origin.double y = y;
          v97.size.CGFloat width = width;
          v97.size.double height = height;
          double v35 = v28;
          double v36 = v32;
          if (NSIntersectsRect(v97, *(NSRect *)&v26))
          {
            NSUInteger location = v91.location;
            NSUInteger v38 = v85;
            if ((v16 & 1) == 0) {
              NSUInteger v38 = v91.location;
            }
            NSUInteger v85 = v38;
            char v16 = 1;
          }
          else if (v16)
          {
            NSUInteger location = v91.location;
            if (v28 >= y + height) {
              goto LABEL_66;
            }
            char v16 = 1;
            NSUInteger v84 = v91.location;
          }
          else if (v17)
          {
            char v16 = 0;
            char v17 = 1;
            NSUInteger location = v91.location;
          }
          else
          {
            NSUInteger location = v91.location;
            if (v28 + v32 >= y
              || (length = v91.length, NSUInteger v40 = v91.length + v91.location, v91.length + v91.location + 2500 >= v34))
            {
              char v17 = 0;
              char v16 = 0;
            }
            else
            {
              unint64_t v41 = v34 - v40;
              if (v34 - v40 >= 0xCA)
              {
                do
                {
                  unint64_t v42 = location + (v41 >> 1) + length;
                  if (v42 >= v34) {
                    break;
                  }
                  unint64_t v88 = 0;
                  NSUInteger v89 = 0;
                  _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v42, (uint64_t *)&v88);
                  if (v43 + v44 < y)
                  {
                    NSUInteger location = v88;
                    NSUInteger length = v89;
                  }
                  BOOL v45 = v41 > 0x193;
                  v41 >>= 1;
                }
                while (v45);
              }
              char v16 = 0;
              v91.NSUInteger location = location;
              v91.NSUInteger length = length;
              char v17 = 1;
            }
          }
          double v13 = (void *)(v91.length + location);
        }
        else
        {
          if (v15) {
            break;
          }
          if (v87 || (*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v13, &v90, v84);
            unint64_t v25 = v90.n128_u64[1];
            unint64_t v24 = v90.n128_u64[0];
          }
          else
          {
            unint64_t v25 = v90.n128_u64[1];
            unint64_t v24 = v90.n128_u64[0];
            if (v90.n128_u64[1] + v90.n128_u64[0] > firstUnlaidGlyphIndex)
            {
              unint64_t v25 = firstUnlaidGlyphIndex - v90.n128_u64[0];
              v90.n128_u64[1] = firstUnlaidGlyphIndex - v90.n128_u64[0];
            }
          }
          double v13 = (void *)(v25 + v24);
        }
        if (v87 && (*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v13, 1uLL);
          unint64_t v88 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
          unint64_t v14 = v88;
        }
        BOOL v15 = v23;
      }
      while ((unint64_t)v13 < v14);
      if (v16) {
        NSUInteger location = v91.length + v91.location;
      }
      else {
        NSUInteger location = v84;
      }
LABEL_66:
      NSUInteger v11 = v85;
    }
    if (location >= v11) {
      NSUInteger v12 = location - v11;
    }
    else {
      NSUInteger v12 = 0;
    }
    uint64_t v46 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v11, v12, v84);
    uint64_t v48 = v47;
    uint64_t v50 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v46, v47);
    if (v46 != v50 || v48 != v49)
    {
      unint64_t v51 = -[NSLayoutManager _glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:](self, "_glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:", v50, v49, 0, v87);
      unint64_t v52 = v51;
      uint64_t v86 = v53;
      if (v51 < v11)
      {
        unint64_t v54 = v51;
        do
        {
          double v55 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v54, (uint64_t *)&v91);
          CGFloat v57 = v56;
          CGFloat v59 = v58;
          CGFloat v61 = v60;
          if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            id v66 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
          }
          else if ([(NSRunStorage *)self->_containerRuns count] <= v54)
          {
            id v66 = 0;
          }
          else
          {
            NSUInteger v62 = v11;
            double v63 = self->_containerRuns;
            _NSBlockNumberForIndex(v63, v54, 0);
            unint64_t v65 = 0;
            if (v63->_gapBlockIndex <= v64) {
              unint64_t v65 = v63->_maxBlocks - v63->_numBlocks;
            }
            id v66 = *(id *)&v63->_runs->var1[(v63->_elementSize + 8) * (v65 + v64)];
            NSUInteger v11 = v62;
          }
          if (v66 == a4)
          {
            v98.origin.CGFloat x = v55;
            v98.origin.double y = v57;
            v98.size.CGFloat width = v59;
            v98.size.double height = v61;
            v100.origin.CGFloat x = x;
            v100.origin.double y = y;
            v100.size.CGFloat width = width;
            v100.size.double height = height;
            if (NSIntersectsRect(v98, v100))
            {
              v94.NSUInteger location = v11;
              v94.NSUInteger length = v12;
              NSRange v67 = NSUnionRange(v94, v91);
              NSUInteger v11 = v67.location;
              NSUInteger v12 = v67.length;
            }
          }
          unint64_t v54 = v91.length + v91.location;
        }
        while (v91.length + v91.location < v11);
      }
      unint64_t v68 = v11 + v12;
      if (v11 + v12 < v14)
      {
        unint64_t v69 = v52 + v86;
        do
        {
          if (v68 >= v69) {
            break;
          }
          double v70 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v68, (uint64_t *)&v91);
          CGFloat v72 = v71;
          CGFloat v74 = v73;
          CGFloat v76 = v75;
          if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            id v80 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
          }
          else if ([(NSRunStorage *)self->_containerRuns count] <= v68)
          {
            id v80 = 0;
          }
          else
          {
            double v77 = self->_containerRuns;
            _NSBlockNumberForIndex(v77, v68, 0);
            unint64_t v79 = 0;
            if (v77->_gapBlockIndex <= v78) {
              unint64_t v79 = v77->_maxBlocks - v77->_numBlocks;
            }
            id v80 = *(id *)&v77->_runs->var1[(v77->_elementSize + 8) * (v79 + v78)];
          }
          if (v80 == a4)
          {
            v99.origin.CGFloat x = v70;
            v99.origin.double y = v72;
            v99.size.CGFloat width = v74;
            v99.size.double height = v76;
            v101.origin.CGFloat x = x;
            v101.origin.double y = y;
            v101.size.CGFloat width = width;
            v101.size.double height = height;
            if (NSIntersectsRect(v99, v101))
            {
              v95.NSUInteger location = v11;
              v95.NSUInteger length = v12;
              NSRange v81 = NSUnionRange(v95, v91);
              NSUInteger v11 = v81.location;
              NSUInteger v12 = v81.length;
            }
          }
          unint64_t v68 = v91.length + v91.location;
          if (v87 && (*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
          {
            _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, v91.length + v91.location, 1uLL);
            unint64_t v88 = 0;
            _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
            unint64_t v14 = v88;
          }
        }
        while (v68 < v14);
      }
    }
  }
  NSUInteger v82 = v11;
  NSUInteger v83 = v12;
  result.NSUInteger length = v83;
  result.NSUInteger location = v82;
  return result;
}

- (_NSRange)_glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 fast:(BOOL)a5 okToFillHoles:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a4;
  double height = a3.size.height;
  double y = a3.origin.y;
  double width = a3.size.width;
  double x = a3.origin.x;
  firstUnlaidGlyphIndedouble x = 0;
  NSRect value = 0;
  extraDatdouble a = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a4)
  {
    double v13 = 0;
  }
  else if (!CFDictionaryGetValueIfPresent(extraData[11], a4, (const void **)&value) {
         || (double v13 = value, value == (void *)0x7FFFFFFFFFFFFFFFLL))
  }
  {
    NSUInteger v14 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_144;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
  }
  else {
    firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex;
  }
  char v16 = [(NSStorage *)self->_containerUsedRects elementAtIndex:v13];
  uint64_t v17 = *((void *)v16 + 14);
  id v127 = v8;
  if (!v17) {
    goto LABEL_31;
  }
  double v18 = v16;
  if (*((void *)v16 + 13) + v17 > firstUnlaidGlyphIndex) {
    goto LABEL_31;
  }
  v140.origin.double x = x;
  v140.origin.double y = y;
  v140.size.double width = width;
  v140.size.double height = height;
  if (!NSContainsRect(v140, *(NSRect *)(v16 + 72))) {
    goto LABEL_31;
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    uint64_t v23 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v19 = *((void *)v18 + 13);
    if ([(NSRunStorage *)self->_containerRuns count] <= v19)
    {
      uint64_t v23 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v19, 0);
      unint64_t v22 = 0;
      if (containerRuns->_gapBlockIndex <= v21) {
        unint64_t v22 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      uint64_t v23 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v22 + v21)];
    }
    id v8 = v127;
  }
  if ((id)v23 == v8) {
    goto LABEL_145;
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    uint64_t v28 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v24 = *((void *)v18 + 13) + *((void *)v18 + 14) - 1;
    if ([(NSRunStorage *)self->_containerRuns count] <= v24)
    {
      uint64_t v28 = 0;
    }
    else
    {
      unint64_t v25 = self->_containerRuns;
      _NSBlockNumberForIndex(v25, v24, 0);
      unint64_t v27 = 0;
      if (v25->_gapBlockIndex <= v26) {
        unint64_t v27 = v25->_maxBlocks - v25->_numBlocks;
      }
      uint64_t v28 = *(void *)&v25->_runs->var1[(v25->_elementSize + 8) * (v27 + v26)];
    }
    id v8 = v127;
  }
  if ((id)v28 == v8) {
LABEL_145:
  }
    uint64_t v29 = -[NSLayoutManager _firstPassGlyphRangeForBoundingRect:inTextContainer:hintGlyphRange:okToFillHoles:](self, "_firstPassGlyphRangeForBoundingRect:inTextContainer:hintGlyphRange:okToFillHoles:", v8, *((void *)v18 + 13), *((void *)v18 + 14), v6, x, y, width, height);
  else {
LABEL_31:
  }
    uint64_t v29 = -[NSLayoutManager _firstPassGlyphRangeForBoundingRect:inTextContainer:okToFillHoles:](self, "_firstPassGlyphRangeForBoundingRect:inTextContainer:okToFillHoles:", v8, v6, x, y, width, height);
  uint64_t v15 = v29;
  if (!a5)
  {
    double v130 = (char *)v14;
    NSRect value = 0;
    uint64_t v137 = 0;
    uint64_t v131 = [v8 layoutOrientation];
    [(NSLayoutManager *)self _setCachedTextContainer:v8 isVertical:v131 != 0];
    if (v15)
    {
      unint64_t v30 = 0;
      uint64_t v129 = v15;
      double v31 = (char *)v15;
      while (1)
      {
        unint64_t v32 = (unint64_t)(v31 - 1);
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          uint64_t v36 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v32)
        {
          uint64_t v36 = 0;
        }
        else
        {
          int v33 = self->_containerRuns;
          _NSBlockNumberForIndex(v33, v32, 0);
          unint64_t v35 = 0;
          if (v33->_gapBlockIndex <= v34) {
            unint64_t v35 = v33->_maxBlocks - v33->_numBlocks;
          }
          uint64_t v36 = *(void *)&v33->_runs->var1[(v33->_elementSize + 8) * (v35 + v34)];
          id v8 = v127;
        }
        if ((id)v36 != v8) {
          goto LABEL_88;
        }
        double v37 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v32, (uint64_t *)&value);
        double v39 = v38;
        double v41 = v40;
        BOOL v42 = _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v32);
        double v31 = (char *)value;
        if (!v42 || value >= (char *)value + v137) {
          goto LABEL_83;
        }
        double v128 = v39 + v41;
        while (1)
        {
          char v43 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
          int v44 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
          if ((v43 & 1) != 0 || !v44)
          {
            if (!v44
              || ![(NSTextStorage *)self->_textStorage attribute:@"NSAttachment" atIndex:_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v31) effectiveRange:0])
            {
              goto LABEL_79;
            }
            [(NSLayoutManager *)self locationForGlyphAtIndex:v31];
            double v76 = v75;
            double v78 = v77;
            [(NSLayoutManager *)self attachmentSizeForGlyphAtIndex:v31];
            CGFloat v73 = v79;
            double v74 = v80;
            double v67 = v37 + v76;
            double v68 = v39 + v78 - v80;
            double v69 = x;
            double v70 = y;
            double v71 = width;
            double v72 = height;
          }
          else
          {
            NSUInteger v45 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
            BOOL v46 = v45 < self->_cachedFontCharRange.location
               || v45 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length;
            if (v46)
            {
              NSUInteger v47 = v45;
              cachedFont = self->_cachedFont;
              uint64_t v49 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"NSFont" atIndex:v45 effectiveRange:&self->_cachedFontCharRange];
              unint64_t v134 = 0;
              uint64_t v135 = 0;
              uint64_t v50 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:v47 effectiveRange:&v134];
              if (!v49) {
                uint64_t v49 = NSDefaultFont();
              }
              char v51 = [v50 BOOLValue];
              if (v131) {
                BOOL v52 = v50 == 0;
              }
              else {
                BOOL v52 = 0;
              }
              int v53 = v52;
              if ((v51 & 1) != 0 || (uint64_t v54 = (uint64_t)v49, v53)) {
                uint64_t v54 = [v49 verticalFont];
              }
              if (v54) {
                uint64_t v49 = (void *)v54;
              }
              if ([v49 isVertical]) {
                BOOL v55 = v50 == 0;
              }
              else {
                BOOL v55 = 1;
              }
              if (!v55 && v135 + v134 < self->_cachedFontCharRange.length + self->_cachedFontCharRange.location) {
                self->_cachedFontCharRange.NSUInteger length = v135 + v134 - self->_cachedFontCharRange.location;
              }
              self->_cachedFont = [(NSLayoutManager *)self substituteFontForFont:v49];

              [(UIFont *)self->_cachedFont boundingRectForFont];
              double v58 = (double *)((char *)self->_extraData + 112);
              *(void *)double v58 = v59;
              v58[1] = -v56 - v57;
              *((void *)v58 + 2) = v60;
              v58[3] = v57;
            }
            double v61 = *((double *)self->_extraData + 14);
            double v62 = *((double *)self->_extraData + 15);
            CGFloat v63 = *((double *)self->_extraData + 16);
            CGFloat v64 = *((double *)self->_extraData + 17);
            v141.origin.double x = x + v61;
            v141.origin.double y = v128 + v62;
            v141.size.double width = v63;
            v141.size.double height = v64;
            v143.origin.double x = x;
            v143.origin.double y = y;
            v143.size.double width = width;
            v143.size.double height = height;
            if (!NSIntersectsRect(v141, v143)) {
              goto LABEL_79;
            }
            [(NSLayoutManager *)self locationForGlyphAtIndex:v31];
            double v67 = v37 + v61 + v65;
            double v68 = v39 + v62 + v66;
            double v69 = x;
            double v70 = y;
            double v71 = width;
            double v72 = height;
            CGFloat v73 = v63;
            double v74 = v64;
          }
          if (NSIntersectsRect(*(NSRect *)&v69, *(NSRect *)&v67)) {
            break;
          }
LABEL_79:
          if (++v31 >= (char *)value + v137)
          {
            double v31 = (char *)value;
            goto LABEL_82;
          }
        }
        double v31 = (char *)value;
        NSRange v81 = (char *)(&v130[v129] - (unsigned char *)value);
        uint64_t v129 = (uint64_t)value;
        double v130 = v81;
LABEL_82:
        id v8 = v127;
LABEL_83:
        if (v31)
        {
          BOOL v46 = v30++ >= 0x1D;
          if (!v46) {
            continue;
          }
        }
        goto LABEL_88;
      }
    }
    uint64_t v129 = 0;
LABEL_88:
    uint64_t v15 = v129;
    NSUInteger v82 = &v130[v129];
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      unint64_t v83 = *(void *)(*((void *)self->_extraData + 26) + 8);
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)&v130[v129], 1uLL);
      unint64_t v134 = 0;
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v134);
      unint64_t v83 = v134;
    }
    if ((unint64_t)v82 < v83)
    {
      unint64_t v84 = 0;
      do
      {
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          uint64_t v88 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= (unint64_t)v82)
        {
          uint64_t v88 = 0;
        }
        else
        {
          NSUInteger v85 = self->_containerRuns;
          _NSBlockNumberForIndex(v85, (unint64_t)v82, 0);
          unint64_t v87 = 0;
          if (v85->_gapBlockIndex <= v86) {
            unint64_t v87 = v85->_maxBlocks - v85->_numBlocks;
          }
          uint64_t v88 = *(void *)&v85->_runs->var1[(v85->_elementSize + 8) * (v87 + v86)];
          id v8 = v127;
        }
        if ((id)v88 != v8) {
          break;
        }
        double v89 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, (unint64_t)v82, (uint64_t *)&value);
        double v91 = v90;
        BOOL v92 = _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, (unint64_t)v82);
        double v93 = (char *)value;
        NSUInteger v82 = (char *)value + v137;
        if (v92 && value < v82)
        {
          while (1)
          {
            char v94 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
            int v95 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
            if ((v94 & 1) == 0)
            {
              if (v95) {
                break;
              }
            }
            if (v95
              && [(NSTextStorage *)self->_textStorage attribute:@"NSAttachment" atIndex:_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v93) effectiveRange:0])
            {
              [(NSLayoutManager *)self locationForGlyphAtIndex:v93];
              double v121 = v120;
              double v123 = v122;
              [(NSLayoutManager *)self attachmentSizeForGlyphAtIndex:v93];
              uint64_t v116 = v124;
              double v117 = v125;
              double v118 = v89 + v121;
              double v119 = v91 + v123 - v125;
LABEL_134:
              v142.origin.double x = x;
              v142.origin.double y = y;
              v142.size.double width = width;
              v142.size.double height = height;
              if (NSIntersectsRect(v142, *(NSRect *)&v118))
              {
                double v130 = (char *)value + v137 - v15;
                double v93 = (char *)value + v137 - 1;
              }
            }
            ++v93;
            NSUInteger v82 = (char *)value + v137;
            if (v93 >= (char *)value + v137)
            {
              id v8 = v127;
              goto LABEL_138;
            }
          }
          [(NSLayoutManager *)self locationForGlyphAtIndex:v93];
          double v97 = v96;
          double v99 = v98;
          NSUInteger v100 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
          if (v100 < self->_cachedFontCharRange.location
            || v100 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length)
          {
            NSUInteger v102 = v100;
            double v103 = self->_cachedFont;
            double v104 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"NSFont" atIndex:v100 effectiveRange:&self->_cachedFontCharRange];
            unint64_t v134 = 0;
            uint64_t v135 = 0;
            CGFloat v105 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:v102 effectiveRange:&v134];
            if (!v104) {
              double v104 = NSDefaultFont();
            }
            char v106 = [v105 BOOLValue];
            if (v131) {
              BOOL v107 = v105 == 0;
            }
            else {
              BOOL v107 = 0;
            }
            int v108 = v107;
            if ((v106 & 1) != 0 || (uint64_t v109 = (uint64_t)v104, v108)) {
              uint64_t v109 = [v104 verticalFont];
            }
            if (v109) {
              double v104 = (void *)v109;
            }
            if ([v104 isVertical]) {
              BOOL v110 = v105 == 0;
            }
            else {
              BOOL v110 = 1;
            }
            if (!v110 && v135 + v134 < self->_cachedFontCharRange.length + self->_cachedFontCharRange.location) {
              self->_cachedFontCharRange.NSUInteger length = v135 + v134 - self->_cachedFontCharRange.location;
            }
            self->_cachedFont = [(NSLayoutManager *)self substituteFontForFont:v104];

            [(UIFont *)self->_cachedFont boundingRectForFont];
            double v113 = (double *)((char *)self->_extraData + 112);
            *(void *)double v113 = v114;
            v113[1] = -v111 - v112;
            *((void *)v113 + 2) = v115;
            v113[3] = v112;
            uint64_t v15 = v129;
          }
          uint64_t v116 = *((void *)self->_extraData + 16);
          double v117 = *((double *)self->_extraData + 17);
          double v118 = v89 + v97 + *((double *)self->_extraData + 14);
          double v119 = v91 + v99 + *((double *)self->_extraData + 15);
          goto LABEL_134;
        }
LABEL_138:
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v82, 1uLL);
          unint64_t v134 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v134);
          unint64_t v83 = v134;
        }
        if ((unint64_t)v82 >= v83) {
          break;
        }
        BOOL v46 = v84++ >= 0x1D;
      }
      while (!v46);
    }
    [(NSLayoutManager *)self _resetCachedTextContainer];
    NSUInteger v14 = (NSUInteger)v130;
  }
LABEL_144:
  NSUInteger v126 = v15;
  result.NSUInteger length = v14;
  result.NSUInteger location = v126;
  return result;
}

- (unint64_t)_indexOfFirstGlyphInTextContainer:(id)a3 okToFillHoles:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  NSRect value = (void *)0x7FFFFFFFFFFFFFFFLL;
  firstUnlaidGlyphIndedouble x = 0;
  *(_OWORD *)double v38 = xmmword_18E5F72A0;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0
    && *(void *)(*((void *)self->_extraData + 26) + 8)
    && (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0] == a3)
  {
    return 0;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v8 = self->_firstUnlaidGlyphIndex, v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
    unint64_t v8 = (unint64_t)firstUnlaidGlyphIndex;
    if (!firstUnlaidGlyphIndex) {
      return v7;
    }
  }
  else
  {
    firstUnlaidGlyphIndedouble x = (char *)self->_firstUnlaidGlyphIndex;
    if (!v8) {
      return v7;
    }
  }
  if (a3)
  {
    int ValueIfPresent = CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)self->_extraData + 12), a3, (const void **)&value);
    unint64_t v8 = (unint64_t)firstUnlaidGlyphIndex;
    if (ValueIfPresent)
    {
      unint64_t v7 = (unint64_t)value;
      if (value < firstUnlaidGlyphIndex) {
        return v7;
      }
      CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3);
      unint64_t v8 = (unint64_t)firstUnlaidGlyphIndex;
    }
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    NSUInteger v14 = *(void **)(*((void *)self->_extraData + 26) + 8);
    v38[0] = 0;
    v38[1] = v14;
    CFDictionaryRef v15 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v10 = v8 - 1;
    if ([(NSRunStorage *)self->_containerRuns count] <= v8 - 1)
    {
      if (!a3)
      {
        if (v38[0] >= firstUnlaidGlyphIndex) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          return (unint64_t)v38[0];
        }
      }
      goto LABEL_27;
    }
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v10, (__n128 *)v38);
    if (containerRuns->_gapBlockIndex <= v12) {
      unint64_t v13 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    else {
      unint64_t v13 = 0;
    }
    CFDictionaryRef v15 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v13 + v12)];
  }
  if (v15 == a3) {
    goto LABEL_42;
  }
  if (!v15)
  {
LABEL_27:
    if (!v38[0]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      unint64_t v20 = *(void **)(*((void *)self->_extraData + 26) + 8);
      v38[0] = 0;
      v38[1] = v20;
      CFDictionaryRef v15 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else
    {
      char v16 = (char *)v38[0] - 1;
      if ([(NSRunStorage *)self->_containerRuns count] <= (unint64_t)v16)
      {
        CFDictionaryRef v15 = 0;
      }
      else
      {
        uint64_t v17 = self->_containerRuns;
        _NSBlockNumberForIndex(v17, (unint64_t)v16, (__n128 *)v38);
        if (v17->_gapBlockIndex <= v18) {
          unint64_t v19 = v17->_maxBlocks - v17->_numBlocks;
        }
        else {
          unint64_t v19 = 0;
        }
        CFDictionaryRef v15 = *(CFDictionaryRef *)&v17->_runs->var1[(v17->_elementSize + 8) * (v19 + v18)];
      }
    }
    if (v15 != a3) {
      goto LABEL_37;
    }
LABEL_42:
    if (v38[0] < firstUnlaidGlyphIndex) {
      unint64_t v7 = (unint64_t)v38[0];
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v38[0] < firstUnlaidGlyphIndex && a3)
    {
      CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, v38[0]);
      return (unint64_t)v38[0];
    }
    return v7;
  }
LABEL_37:
  uint64_t v36 = 0;
  extraDatdouble a = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a3)
  {
    unint64_t v22 = 0;
  }
  else
  {
    if (CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&v36)) {
      unint64_t v22 = (unint64_t)v36;
    }
    else {
      unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    extraDatdouble a = (CFDictionaryRef *)self->_extraData;
  }
  uint64_t v36 = 0;
  if (extraData[10] == v15)
  {
    unint64_t v24 = 0;
  }
  else
  {
    int v23 = CFDictionaryGetValueIfPresent(extraData[11], v15, (const void **)&v36);
    unint64_t v24 = (unint64_t)v36;
    if (!v23) {
      unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v22 <= v24)
  {
    uint64_t v29 = 0;
    while (1)
    {
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        int v33 = *(void **)(*((void *)self->_extraData + 26) + 8);
        v38[0] = 0;
        v38[1] = v33;
        id v34 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= (unint64_t)v29)
      {
        id v34 = 0;
      }
      else
      {
        unint64_t v30 = self->_containerRuns;
        _NSBlockNumberForIndex(v30, (unint64_t)v29, (__n128 *)v38);
        unint64_t v32 = v30->_gapBlockIndex <= v31 ? v30->_maxBlocks - v30->_numBlocks : 0;
        id v34 = *(id *)&v30->_runs->var1[(v30->_elementSize + 8) * (v32 + v31)];
      }
      if (v34 == a3) {
        break;
      }
      uint64_t v29 = (char *)v38[1] + (unint64_t)v38[0];
      if ((char *)v38[1] + (unint64_t)v38[0] >= firstUnlaidGlyphIndex) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (v29 < firstUnlaidGlyphIndex) {
      unint64_t v7 = (unint64_t)v29;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (a3 && v29 < firstUnlaidGlyphIndex)
    {
      CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, v29);
      return (unint64_t)v29;
    }
    return v7;
  }
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = (unint64_t)(firstUnlaidGlyphIndex - 1);
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  if (v15 != a3)
  {
    do
    {
      [(NSLayoutManager *)self textContainerForGlyphAtIndex:v7 effectiveRange:&v36];
      unint64_t v7 = (unint64_t)&v36[v37];
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)&v36[v37], 1uLL);
      if (v7 >= *(void *)(*((void *)self->_extraData + 26) + 8)) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        id v28 = (id)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= v7)
      {
        id v28 = 0;
      }
      else
      {
        unint64_t v25 = self->_containerRuns;
        _NSBlockNumberForIndex(v25, v7, 0);
        unint64_t v27 = 0;
        if (v25->_gapBlockIndex <= v26) {
          unint64_t v27 = v25->_maxBlocks - v25->_numBlocks;
        }
        id v28 = *(id *)&v25->_runs->var1[(v25->_elementSize + 8) * (v27 + v26)];
      }
    }
    while (v28 != a3);
  }
  if (a3) {
    CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, (const void *)v7);
  }
  return v7;
}

- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4 includeBlocks:(BOOL)a5
{
  BOOL v38 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v9 = a3.length - a4;
  NSUInteger v39 = a3.location;
  uint64_t v40 = a3.length - a4;
  extraDatdouble a = self->_extraData;
  BOOL v37 = (*(unsigned char *)(extraData[26] + 56) & 1) == 0 && (*(unsigned char *)(extraData[30] + 56) & 1) == 0;
  *(_DWORD *)&self->_lmFlags &= ~1u;
  self->_firstUnlaidGlyphIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_firstUnlaidCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  __lmFlags lmFlags = self->_lmFlags;
  if ((unint64_t)a4 <= 1)
  {
    if ((*(_DWORD *)&lmFlags & 0x40000000) != 0 && self->_firstTextView && !*((void *)self->_extraData + 45))
    {
      [(NSLayoutManager *)self _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:location];
      if (*((void *)self->_extraData + 45)) {
        *((void *)self->_extraData + 44) += a4;
      }
      if (a4) {
        goto LABEL_23;
      }
    }
    else if (a4)
    {
      goto LABEL_9;
    }
    if (*((void *)self->_extraData + 48) == location && *((void *)self->_extraData + 49) == v9) {
      goto LABEL_34;
    }
    goto LABEL_23;
  }
LABEL_9:
  if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
  {
    if (self->_firstTextView)
    {
      unint64_t v12 = (NSUInteger *)((char *)self->_extraData + 352);
      if (*((void *)self->_extraData + 45))
      {
        NSUInteger v13 = *v12;
        if (v9 + location <= *v12)
        {
          *unint64_t v12 = v13 + a4;
        }
        else if (location <= v13)
        {
          *(_OWORD *)unint64_t v12 = xmmword_18E5F72A0;
          *((_OWORD *)self->_extraData + 23) = *MEMORY[0x1E4F28AE0];
        }
      }
    }
  }
LABEL_23:
  if (!length || length == a4)
  {
    uint64_t v22 = 0;
    *((_OWORD *)self->_extraData + 24) = xmmword_18E5F72A0;
    *((void *)self->_extraData + 50) = 0;
  }
  else
  {
    unint64_t v15 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + v9 - 1);
    char v16 = (NSUInteger *)((char *)self->_extraData + 384);
    NSUInteger *v16 = location;
    v16[1] = length;
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
    *((double *)self->_extraData + 50) = v17 + v18;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      uint64_t v22 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else if ([(NSRunStorage *)self->_containerRuns count] <= v15)
    {
      uint64_t v22 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v15, 0);
      unint64_t v21 = 0;
      if (containerRuns->_gapBlockIndex <= v20) {
        unint64_t v21 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      uint64_t v22 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v21 + v20)];
    }
  }
  *((void *)self->_extraData + 51) = v22;
LABEL_34:
  _NSGlyphTreePrepareToInvalidateGlyphsForCharacterRange((uint64_t)self, location, v9, a4);
  p_cachedFontCharRange = &self->_cachedFontCharRange;
  v42.NSUInteger location = location;
  v42.NSUInteger length = v9;
  if (NSIntersectionRange((NSRange)self[184], v42).length)
  {
    _NSRange *p_cachedFontCharRange = (_NSRange)xmmword_18E5F72A0;
  }
  else if (p_cachedFontCharRange->location > location)
  {
    p_cachedFontCharRange->location += a4;
  }
  unint64_t v28 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, v9, 0, 0, 1, (uint64_t *)&v39);
  unint64_t v29 = v24;
  if (v40 + v39 >= v9 + location) {
    uint64_t v30 = v40 + v39 - (v9 + location);
  }
  else {
    uint64_t v30 = 0;
  }
  if (v24)
  {
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", v28, v24, 1);
    if (v38)
    {
      unint64_t v31 = (void *)*((void *)self->_extraData + 23);
      if (v31) {
        _NSDeleteGlyphRangeFromTextBlocks(v31, v28, v29);
      }
    }
  }
  NSUInteger v32 = location + length + v30;
  uint64_t v41 = 0;
  uint64_t v33 = v32 - v39;
  if (v32 == v39)
  {
    if (v38) {
      goto LABEL_54;
    }
    goto LABEL_52;
  }
  -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v41, v28, v33, 1);
  if (!v38)
  {
LABEL_52:
    unint64_t v35 = (void *)*((void *)self->_extraData + 23);
    if (v35) {
      _NSRemoveTextBlocksForGlyphRange(v35, v28, v29);
    }
    goto LABEL_54;
  }
  id v34 = (void *)*((void *)self->_extraData + 23);
  if (v34) {
    _NSInsertGlyphRangeInTextBlocks(v34, v28, v33);
  }
LABEL_54:
  _NSGlyphTreeInvalidateGlyphsForCharacterRange((uint64_t)self, v39, v40, a4, 0, v25, v26, v27, v36);
  if ((*(unsigned char *)(*((void *)self->_extraData + 26) + 56) & 2) == 0) {
    *(_DWORD *)&self->_lmFlags &= 0xF5EFFFFC;
  }
  if (v37
    && (*((unsigned char *)&self->_lmFlags + 1) & 0x10) != 0
    && (*(unsigned char *)(*((void *)self->_extraData + 26) + 56) & 1) != 0)
  {
    objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManagerDidInvalidateLayout:", self);
  }
}

- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
}

- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4 invalidateUsage:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  extraDatdouble a = self->_extraData;
  BOOL v56 = a5;
  BOOL v57 = (*(unsigned char *)(extraData[26] + 56) & 1) == 0 && (*(unsigned char *)(extraData[30] + 56) & 1) == 0;
  firstUnlaidGlyphIndedouble x = 0;
  unint64_t v55 = [(NSTextStorage *)self->_textStorage length];
  int v10 = _invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit;
  if (_invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit == 254)
  {
    int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "hasPrefix:", @"com.omnigroup.OmniOutliner");
    _invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit = v10;
  }
  *(_DWORD *)&self->_lmFlags &= ~1u;
  self->_firstUnlaidGlyphIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  if (v10) {
    a4 &= (location != 0) | ~a4 | (length == 0);
  }
  self->_firstUnlaidCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  BOOL v58 = a4;
  if (!a4)
  {
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0 && self->_firstTextView && !*((void *)self->_extraData + 45)) {
      [(NSLayoutManager *)self _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:location];
    }
    if (length)
    {
      if (location != *((void *)self->_extraData + 48) || length != *((void *)self->_extraData + 49))
      {
        unint64_t v54 = location + length;
        unint64_t v16 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + length - 1);
        double v17 = (NSUInteger *)((char *)self->_extraData + 384);
        *double v17 = location;
        v17[1] = length;
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v16, 0);
        *((double *)self->_extraData + 50) = v18 + v19;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          uint64_t v24 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v16)
        {
          uint64_t v24 = 0;
        }
        else
        {
          NSUInteger v20 = length;
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v16, 0);
          unint64_t v23 = 0;
          if (containerRuns->_gapBlockIndex <= v22) {
            unint64_t v23 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          }
          uint64_t v24 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v23 + v22)];
          NSUInteger length = v20;
          a4 = v58;
        }
        *((void *)self->_extraData + 51) = v24;
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          if (self->_firstTextView)
          {
            if (!*((void *)self->_extraData + 45))
            {
              NSRect value = 0;
              _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v16, (unint64_t *)&value);
              if (_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)value) >= v54) {
                [(NSLayoutManager *)self _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:0];
              }
            }
          }
        }
      }
    }
  }
  _NSLayoutTreeInvalidateLayoutForCharacterRange((uint64_t)self, location, length, a4, v11, v12, v13, v14, v53);
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 || (location + length < v55 ? (BOOL v25 = 1) : (BOOL v25 = a4), !v25))
  {
    _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24), *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
    self->_extraLineFragmentContainer = 0;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v26 = self->_firstUnlaidGlyphIndex, v26 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
    unint64_t v26 = firstUnlaidGlyphIndex;
  }
  else
  {
    firstUnlaidGlyphIndedouble x = self->_firstUnlaidGlyphIndex;
  }
  if (v26)
  {
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      CFDictionaryRef v31 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else
    {
      unint64_t v27 = v26 - 1;
      if ([(NSRunStorage *)self->_containerRuns count] <= v26 - 1)
      {
        CFDictionaryRef v31 = 0;
      }
      else
      {
        unint64_t v28 = self->_containerRuns;
        _NSBlockNumberForIndex(v28, v27, 0);
        unint64_t v30 = 0;
        if (v28->_gapBlockIndex <= v29) {
          unint64_t v30 = v28->_maxBlocks - v28->_numBlocks;
        }
        CFDictionaryRef v31 = *(CFDictionaryRef *)&v28->_runs->var1[(v28->_elementSize + 8) * (v30 + v29)];
      }
    }
    NSRect value = 0;
    unint64_t v35 = (CFDictionaryRef *)self->_extraData;
    if (v35[10] == v31)
    {
      uint64_t v36 = 0;
    }
    else if (CFDictionaryGetValueIfPresent(v35[11], v31, (const void **)&value))
    {
      uint64_t v36 = (uint64_t)value;
    }
    else
    {
      uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v37 = [(NSMutableArray *)self->_textContainers count];
    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v38 = v37;
      if (v56) {
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v36, v37 - v36);
      }
      uint64_t v39 = v36 + 1;
      if (v36 + 1 < v38)
      {
        do
          CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)[(NSMutableArray *)self->_textContainers objectAtIndex:v39++]);
        while (v38 != v39);
      }
    }
  }
  else
  {
    uint64_t v32 = [(NSMutableArray *)self->_textContainers count];
    if (v32)
    {
      uint64_t v33 = v32;
      if (v56) {
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, v32);
      }
      for (uint64_t i = 0; i != v33; ++i)
        CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)[(NSMutableArray *)self->_textContainers objectAtIndex:i]);
    }
  }
  if (!v58 && (*((void *)self->_extraData + 23) || [(NSRunStorage *)self->_containerRuns count]))
  {
    NSUInteger v40 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
    NSUInteger v41 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + length) - v40;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 && v40 < [(NSRunStorage *)self->_containerRuns count])
    {
      NSRect value = 0;
      NSRange v42 = self->_containerRuns;
      v61.NSUInteger length = [(NSRunStorage *)v42 count];
      v61.NSUInteger location = 0;
      v62.NSUInteger location = v40;
      v62.NSUInteger length = v41;
      NSRange v43 = NSIntersectionRange(v61, v62);
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v42, "replaceElementsInRange:withElement:coalesceRuns:", v43.location, v43.length, &value, 1);
    }
    int v44 = (void *)*((void *)self->_extraData + 23);
    if (v44)
    {
      _NSRemoveTextBlocksForGlyphRange(v44, v40, v41);
      uint64_t v45 = *((void *)self->_extraData + 52);
      if (v45)
      {
        if (location < *(void *)(v45 + 16) + *(void *)(v45 + 8)) {
          [(NSLayoutManager *)self _setRowArrayCache:0];
        }
      }
    }
  }
  BOOL v46 = (void *)*((void *)self->_extraData + 25);
  if (v46)
  {
    uint64_t v47 = [v46 count];
    if (v47)
    {
      uint64_t v48 = v47 - 1;
      do
      {
        uint64_t v49 = [*((id *)self->_extraData + 25) objectAtIndex:v48];
        NSUInteger v50 = *(void *)(v49 + 8);
        uint64_t v51 = *(void *)(v49 + 16);
        if (location < v51 + v50 || (!v51 ? (BOOL v52 = location > v50) : (BOOL v52 = 1), !v52)) {
          [*((id *)self->_extraData + 25) removeObjectAtIndex:v48];
        }
        --v48;
      }
      while (v48 != -1);
    }
  }
  [(NSLayoutManager *)self _markSelfAsDirtyForBackgroundLayout:self];
  [(NSLayoutManager *)self _invalidateInsertionPoint];
  if (v57
    && (*((unsigned char *)&self->_lmFlags + 1) & 0x10) != 0
    && (*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) != 0)
  {
    objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManagerDidInvalidateLayout:", self);
  }
}

- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4
{
}

- (void)_firstTextViewChanged
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  textContainers = self->_textContainers;
  uint64_t v4 = [(NSMutableArray *)textContainers countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(textContainers);
        }
        uint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) textView];
        if (v8)
        {
          id v9 = (id)v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)textContainers countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:
  p_id firstTextView = &self->_firstTextView;
  if (v9 != self->_firstTextView)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = [*p_firstTextView delegate];
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = *p_firstTextView;
    *((_OWORD *)self->_extraData + 22) = xmmword_18E5F72A0;
    if (v11)
    {
      if (NSLayoutManager *)[v12 layoutManager] == self && (objc_opt_respondsToSelector()) {
        [*p_firstTextView setDelegate:0];
      }
      *p_id firstTextView = objc_storeWeak(&self->_firstTextView, v9);
      if (objc_opt_respondsToSelector()) {
        [*p_firstTextView setDelegate:v11];
      }
      if (*p_firstTextView) {
        goto LABEL_22;
      }
    }
    else
    {
      id v14 = objc_storeWeak(&self->_firstTextView, v9);
      *p_id firstTextView = v14;
      if (v14)
      {
LABEL_22:
        if (objc_opt_respondsToSelector()) {
          int v13 = 0x10000000;
        }
        else {
          int v13 = 0;
        }
LABEL_27:
        *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xEFFFFFFF | v13;
        if (v9 && v12)
        {
          unint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          double v19 = @"NSNewNotifyingTextView";
          uint64_t v20 = 0;
          id v18 = v9;
        }
        else
        {
          if (!v12)
          {
            if (!v9)
            {
              uint64_t v17 = 0;
              goto LABEL_34;
            }
            uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, @"NSNewNotifyingTextView", 0, v19, v20);
LABEL_33:
            uint64_t v17 = v16;
LABEL_34:
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSTextViewWillChangeNotifyingTextViewNotification", v12, v17);
            return;
          }
          unint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          id v18 = 0;
        }
        uint64_t v16 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v12, @"NSOldNotifyingTextView", v18, v19, v20);
        goto LABEL_33;
      }
    }
    int v13 = 0;
    goto LABEL_27;
  }
}

- (void)_drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = (void *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:[(NSLayoutManager *)self applicationFrameworkContext]];
  range2_8 = (CGContext *)[v9 CGContext];
  NSRange v123 = (NSRange)xmmword_18E5F72A0;
  unsigned int v10 = [v9 isDrawingToScreen];
  double v120 = self;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x10) != 0) {
    int v119 = [v9 isFlipped];
  }
  else {
    int v119 = 1;
  }
  uint64_t v11 = _os_feature_enabled_impl();
  id v12 = self;
  int64_t v13 = [(NSLayoutManager *)self applicationFrameworkContext];
  BOOL v14 = [(NSTextStorage *)self->_textStorage _lockForReading];
  BOOL v15 = v14;
  if (length)
  {
    v125.NSUInteger location = 0;
    v125.NSUInteger length = 0;
    v124.NSUInteger location = 0;
    v124.NSUInteger length = 0;
    unint64_t v122 = 0;
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v120, location, length);
    NSUInteger v16 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v120, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    NSUInteger v18 = v17;
    if ((*((unsigned char *)&v120->_lmFlags + 3) & 0x40) != 0)
    {
      uint64_t v114 = [(NSMutableArray *)v120->_textContainers objectAtIndex:0];
    }
    else if ([(NSRunStorage *)v120->_containerRuns count] <= location)
    {
      uint64_t v114 = 0;
    }
    else
    {
      containerRuns = v120->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, location, 0);
      unint64_t v21 = 0;
      if (containerRuns->_gapBlockIndex <= v20) {
        unint64_t v21 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      uint64_t v114 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v21 + v20)];
      id v12 = v120;
    }
    CGContextSaveGState(range2_8);
    CGContextSetShouldAntialias(range2_8, 0);
    BOOL v113 = v15;
    NSUInteger range2 = v16;
    if (v16 < v16 + v18)
    {
      NSUInteger v115 = v16 + v18;
      NSUInteger v116 = v18;
      unsigned int v110 = v10;
      unsigned int v111 = v11;
      int64_t v112 = v13;
      while (1)
      {
        long long v23 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:longestEffectiveRange:inRange:](v12->_textStorage, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v16, &v125, range2, v116), "textBlocks");
        if (v23)
        {
          long long v24 = v23;
          uint64_t v25 = [v23 count];
          if (v25) {
            break;
          }
        }
LABEL_44:
        NSUInteger v16 = v125.length + v125.location;
        if (v125.length + v125.location >= v115)
        {
          uint64_t v58 = 0;
          NSUInteger v59 = range2;
          uint64_t v11 = v111;
          NSUInteger v60 = v115;
          do
          {
            unint64_t v61 = [v12->_firstTextView markedRange];
            if (v59 < v61 || v59 - v61 >= v62) {
              char v64 = 1;
            }
            else {
              char v64 = v111;
            }
            if (v64)
            {
              NSRange v67 = v123;
              if (v59 < v123.location || v59 - v123.location >= v123.length)
              {
                NSUInteger v71 = range2;
                textStorage = v12->_textStorage;
                NSUInteger v70 = v116;
                uint64_t v58 = [(NSTextStorage *)textStorage attribute:@"NSBackgroundColor", v59, &v123, range2, v116 atIndex longestEffectiveRange inRange];
                NSRange v67 = v123;
              }
              else
              {
                NSUInteger v70 = v116;
                NSUInteger v71 = range2;
              }
              v128.NSUInteger location = v71;
              v128.NSUInteger length = v70;
              NSRange v72 = NSIntersectionRange(v67, v128);
              NSRange v125 = v72;
              if ((v110 & 1) != 0 || (CGFloat v73 = (void *)v58, (*((unsigned char *)v120->_extraData + 449) & 0x10) != 0))
              {
                double v74 = -[NSLayoutManager temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:](v120, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v59, &v124, v72.location, v72.length);
                if ((*((unsigned char *)v120->_extraData + 449) & 0x10) != 0) {
                  double v74 = (NSDictionary *)objc_msgSend(-[NSLayoutManager delegate](v120, "delegate"), "layoutManager:shouldUseTemporaryAttributes:forDrawingToScreen:atCharacterIndex:effectiveRange:", v120, v74, v110, v59, &v124);
                }
                NSRange v125 = NSIntersectionRange(v125, v124);
                CGFloat v73 = (void *)v58;
                if (v74)
                {
                  uint64_t v75 = [(NSDictionary *)v74 objectForKey:@"NSBackgroundColor"];
                  if (v75) {
                    CGFloat v73 = (void *)v75;
                  }
                  else {
                    CGFloat v73 = (void *)v58;
                  }
                }
              }
              id v12 = v120;
              if (v73)
              {
                if (([v73 isEqual:0] & 1) == 0)
                {
                  objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v120, "renderingColorForDocumentColor:", v73), "set");
                  uint64_t v76 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v120, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v125.location, v125.length, 0x7FFFFFFFFFFFFFFFLL, 0, v114, &v122);
                  uint64_t v77 = v122;
                  if (v122)
                  {
                    double v78 = (double *)v76;
                    unint64_t v79 = v122;
                    do
                    {
                      *double v78 = x + *v78;
                      if (v119) {
                        double v80 = y + v78[1];
                      }
                      else {
                        double v80 = y - (v78[1] + v78[3]);
                      }
                      v78[1] = v80;
                      v78 += 4;
                      --v79;
                    }
                    while (v79);
                    if (v77) {
                      -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v120, "fillBackgroundRectArray:count:forCharacterRange:color:", v76, v77, v125.location, v125.length, v73);
                    }
                  }
                }
              }
              NSUInteger v59 = v125.length + v125.location;
              NSUInteger v60 = v115;
            }
            else
            {
              uint64_t v65 = [v12->_firstTextView markedRange];
              NSUInteger v59 = v65 + v66;
            }
          }
          while (v59 < v60);
          int64_t v13 = v112;
          NSUInteger v18 = v116;
          goto LABEL_81;
        }
      }
      uint64_t v26 = v25;
      if (v16 <= range2)
      {
        unint64_t v28 = 0;
      }
      else
      {
        unint64_t v27 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v12->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v16 - 1, 0), "textBlocks");
        unint64_t v28 = v27;
        if (v27)
        {
          unint64_t v29 = [v27 count];
          goto LABEL_25;
        }
      }
      unint64_t v29 = 0;
LABEL_25:
      unint64_t v30 = 0;
      char v31 = 1;
      do
      {
        uint64_t v32 = (void *)[v24 objectAtIndex:v30];
        int v33 = v31 & (v30 < v29);
        if (v33 == 1 && v32 == (void *)[v28 objectAtIndex:v30])
        {
          char v31 = 1;
        }
        else
        {
          uint64_t v34 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](v12, "glyphRangeForCharacterRange:actualCharacterRange:", v16, 1, 0);
          v121.NSUInteger location = 0;
          v121.NSUInteger length = 0;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v35 = (void *)[v32 table];
            if (!v33
              || (uint64_t v36 = (void *)[v28 objectAtIndex:v30],
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) == 0)
              || v35 != (void *)[v36 table])
            {
              [(NSLayoutManager *)v120 boundsRectForTextBlock:v35 atIndex:v34 effectiveRange:&v121];
              if (v121.length)
              {
                double v41 = v37;
                double v42 = v38;
                double v43 = v39;
                double v44 = v40;
                if (!NSIsEmptyRect(*(NSRect *)&v37))
                {
                  uint64_t v45 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v120, "characterRangeForGlyphRange:actualGlyphRange:", v121.location, v121.length, 0);
                  objc_msgSend(v35, "drawBackgroundWithFrame:inView:characterRange:layoutManager:", 0, v45, v46, v120, x + v41, y + v42, v43, v44);
                }
              }
            }
          }
          id v12 = v120;
          [(NSLayoutManager *)v120 boundsRectForTextBlock:v32 atIndex:v34 effectiveRange:&v121];
          if (v121.length)
          {
            double v51 = v47;
            double v52 = v48;
            double v53 = v49;
            double v54 = v50;
            if (!NSIsEmptyRect(*(NSRect *)&v47))
            {
              uint64_t v56 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v120, "characterRangeForGlyphRange:actualGlyphRange:", v121.location, v121.length, 0);
              double v57 = -(v52 + v54);
              if (v119) {
                double v57 = v52;
              }
              objc_msgSend(v32, "drawBackgroundWithFrame:inView:characterRange:layoutManager:", 0, v56, v55, v120, x + v51, y + v57, v53, v54);
            }
          }
          char v31 = 0;
        }
        ++v30;
      }
      while (v26 != v30);
      goto LABEL_44;
    }
LABEL_81:
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_111;
    }
    NSUInteger v81 = [v120->_firstTextView markedRange];
    NSUInteger v83 = v82;
    if (objc_opt_respondsToSelector())
    {
      unint64_t v84 = (void *)[v120->_firstTextView attributedSubstringForMarkedRange];
      if (!v83)
      {
LABEL_111:
        CGContextRestoreGState(range2_8);
        if (v113) {
          [(NSTextStorage *)v120->_textStorage _unlock];
        }
        return;
      }
    }
    else
    {
      unint64_t v84 = 0;
      if (!v83) {
        goto LABEL_111;
      }
    }
    v127.NSUInteger location = v81;
    v127.NSUInteger length = v83;
    v129.NSUInteger location = range2;
    v129.NSUInteger length = v18;
    NSRange v125 = NSIntersectionRange(v127, v129);
    if (!v125.length) {
      goto LABEL_111;
    }
    if (v84)
    {
      uint64_t v85 = [v84 length];
      if (v125.length)
      {
        uint64_t v86 = v85;
        NSUInteger v87 = v125.location;
        do
        {
          uint64_t v88 = objc_msgSend(v84, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSBackgroundColor", v87 - v81, &v124, 0, v86);
          if (v88) {
            char v89 = 1;
          }
          else {
            char v89 = v11;
          }
          if ((v89 & 1) == 0) {
            uint64_t v88 = [(Class)getNSColorClass_0[0]() _markedTextBackgroundColor];
          }
          v121.NSUInteger location = 0;
          v121.NSUInteger length = 0;
          uint64_t v90 = objc_msgSend(v84, "attribute:atIndex:longestEffectiveRange:inRange:", NSMarkedClauseSegmentAttributeName, v125.location - v81, &v121, 0, v86);
          NSRange v91 = v124;
          if (v90)
          {
            NSRange v91 = NSIntersectionRange(v91, v121);
            v124.NSUInteger length = v91.length;
          }
          v91.location += v81;
          v124.NSUInteger location = v91.location;
          NSRange v93 = NSIntersectionRange(v91, v125);
          NSUInteger v92 = v93.length;
          NSRange v124 = v93;
          if (v88)
          {
            objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v120, "renderingColorForDocumentColor:", v88), "set");
            uint64_t v94 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v120, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v124.location, v124.length, v81, v83, v114, &v122);
            if (v122)
            {
              uint64_t v95 = v94;
              uint64_t v96 = v11;
              unint64_t v97 = 0;
              double v98 = (double *)(v94 + 16);
              do
              {
                double v99 = x + *(v98 - 2);
                *(v98 - 2) = v99;
                if (v119)
                {
                  double v100 = y + *(v98 - 1);
                  *(v98 - 1) = v100;
                  double v101 = v98[1];
                }
                else
                {
                  double v101 = v98[1];
                  double v100 = y - (*(v98 - 1) + v101);
                  *(v98 - 1) = v100;
                }
                double v102 = *v98;
                CGRect v130 = CGContextConvertRectToDeviceSpace(range2_8, *(CGRect *)&v99);
                v130.origin.double x = round(v130.origin.x);
                v130.size.double width = round(v130.size.width);
                *(CGRect *)(v98 - 2) = v130;
                CGRect v131 = CGContextConvertRectToUserSpace(range2_8, v130);
                *(CGRect *)(v98 - 2) = v131;
                if (v131.size.width > 1.0) {
                  *double v98 = v131.size.width + -1.0;
                }
                ++v97;
                v98 += 4;
              }
              while (v97 < v122);
              NSUInteger v92 = v124.length;
              uint64_t v11 = v96;
              if (v122)
              {
                -[NSLayoutManager fillMarkedBackgroundRectArray:count:forCharacterRange:color:](v120, "fillMarkedBackgroundRectArray:count:forCharacterRange:color:", v95);
                NSUInteger v92 = v124.length;
              }
            }
            else
            {
              NSUInteger v92 = v124.length;
            }
          }
          NSUInteger v87 = v125.location + v92;
          v125.location += v92;
          v125.length -= v92;
        }
        while (v125.length);
      }
      goto LABEL_111;
    }
    if (objc_opt_respondsToSelector()) {
      double v103 = (void *)[v120->_firstTextView markedTextAttributes];
    }
    else {
      double v103 = 0;
    }
    uint64_t v104 = [v103 objectForKey:@"NSBackgroundColor"];
    if (!v104 && v13 != 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_111;
      }
      uint64_t v104 = objc_msgSend((id)objc_msgSend(v120->_firstTextView, "markedTextStyle"), "objectForKey:", @"NSBackgroundColor");
      if (v104) {
        goto LABEL_123;
      }
      uint64_t v104 = [(Class)getNSColorClass_0[0]() _markedTextBackgroundColor];
    }
    if (!v104) {
      goto LABEL_111;
    }
LABEL_123:
    objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v120, "renderingColorForDocumentColor:", v104), "set");
    uint64_t v105 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v120, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v125.location, v125.length, v81, v83, v114, &v122);
    uint64_t v106 = v122;
    if (v122)
    {
      BOOL v107 = (double *)v105;
      unint64_t v108 = v122;
      do
      {
        *BOOL v107 = x + *v107;
        if (v119) {
          double v109 = y + v107[1];
        }
        else {
          double v109 = y - (v107[1] + v107[3]);
        }
        v107[1] = v109;
        v107 += 4;
        --v108;
      }
      while (v108);
      if (v106) {
        -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v120, "fillBackgroundRectArray:count:forCharacterRange:color:", v105, v106, v125.location, v125.length, v104);
      }
    }
    goto LABEL_111;
  }
  if (v14)
  {
    long long v22 = v120->_textStorage;
    [(NSTextStorage *)v22 _unlock];
  }
}

- (id)selectedTextAttributesForCharacterAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if (a4)
  {
    NSUInteger v7 = [(NSTextStorage *)self->_textStorage length];
    a4->NSUInteger location = 0;
    a4->NSUInteger length = v7;
  }
  if (![(NSLayoutManager *)self delegate]) {
    return 0;
  }
  [(NSLayoutManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v8 = [(NSLayoutManager *)self delegate];

  return (id)[v8 layoutManager:self shouldUseSelectedTextAttributes:0 atCharacterIndex:a3 effectiveRange:a4];
}

- (char)_packedGlyphs:(unint64_t)a3 range:(_NSRange)a4 length:(unint64_t *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = 2 * a4.length + 2;
  if (self->_glyphBufferSize < v9)
  {
    self->_glyphBuffer = (char *)NSReallocateCollectable(self->_glyphBuffer, 2 * a4.length + 2, 0);
    if (!self->_glyphBuffer) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A0], @"*** %@, _getGlyphBuffer(): NSZoneMalloc failed!", objc_opt_class() format];
    }
    self->_glyphBufferSize = v9;
  }
  glyphBuffer = self->_glyphBuffer;
  if (length) {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, location, length);
  }
  uint64_t PackedGlyphsInRange = _NSGlyphTreeGetPackedGlyphsInRange((uint64_t)self, location, length, glyphBuffer);
  if (a5) {
    *a5 = 2 * PackedGlyphsInRange;
  }
  return glyphBuffer;
}

- (void)_drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double v9 = ((double (*)(NSLayoutManager *, SEL, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, __n128, __n128))MEMORY[0x1F4188790])(self, a2, a3.location, a3.length, v4, v5, v6, (__n128)a4, *(__n128 *)&a4.y);
  double v310 = v10;
  double v290 = v9;
  uint64_t v362 = *MEMORY[0x1E4F143B8];
  unint64_t v336 = v11;
  if (v11)
  {
    unint64_t v12 = v8;
    uint64_t v13 = v7;
    int v273 = [*(id *)(v7 + 8) _lockForReading];
    char v275 = _os_feature_enabled_impl();
    uint64_t v338 = v13;
    BOOL v14 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", [(id)v13 applicationFrameworkContext]);
    BOOL v15 = (CGContext *)[v14 CGContext];
    NSRange v355 = (NSRange)xmmword_18E5F72A0;
    NSRange range2 = (NSRange)xmmword_18E5F72A0;
    NSRange v353 = (NSRange)xmmword_18E5F72A0;
    NSRange v352 = (NSRange)xmmword_18E5F72A0;
    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v351 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    int v303 = objc_msgSend((id)objc_msgSend((id)v13, "typesetter"), "_allowsEllipsisGlyphSubstitution");
    if ((*(unsigned char *)(v13 + 67) & 0x10) != 0) {
      int v340 = [v14 isFlipped];
    }
    else {
      int v340 = 1;
    }
    int v17 = [(id)v13 _drawsDebugBaselines];
    double v18 = 0.0;
    if (v17)
    {
      memset(v360, 0, 48);
      CGContextGetCTM(v360, v15);
      double v19 = fabs(v360[0].a * v360[0].d - v360[0].b * v360[0].c);
      double v20 = 1.0 / sqrt(v19);
      if (v19 <= 0.001) {
        double v18 = 1.0;
      }
      else {
        double v18 = v20;
      }
    }
    int v269 = v17;
    if (_drawGlyphsForGlyphRange_atPoint__configureOnce != -1) {
      dispatch_once(&_drawGlyphsForGlyphRange_atPoint__configureOnce, &__block_literal_global_160);
    }
    _NSFastFillAllLayoutHolesForGlyphRange(v13, v12, v336);
    uint64_t v21 = objc_msgSend((id)v13, "characterRangeForGlyphRange:actualGlyphRange:", v12, v336, 0);
    NSUInteger v331 = v22;
    NSUInteger v335 = v21;
    if ((*(unsigned char *)(v13 + 67) & 0x40) != 0)
    {
      uint64_t v26 = (void *)[*(id *)(v13 + 32) objectAtIndex:0];
    }
    else if ([*(id *)(v13 + 48) count] <= v12)
    {
      uint64_t v26 = 0;
    }
    else
    {
      long long v23 = *(void **)(v13 + 48);
      _NSBlockNumberForIndex(v23, v12, 0);
      if (v23[11] <= v24) {
        uint64_t v25 = v23[4] - v23[3];
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = *(void **)(v23[7] + (v23[2] + 8) * (v25 + v24) + 8);
    }
    uint64_t v27 = [v26 layoutOrientation];
    [(id)v13 _setCachedTextContainer:v26 isVertical:v27 != 0];
    uint64_t v292 = v27;
    v274 = v26;
    unint64_t v28 = *(void **)(v13 + 104);
    double c = v15;
    v291 = v14;
    CGFloat v268 = v18;
    if (v28)
    {
      uint64_t v29 = [v28 markedRange];
      NSUInteger v31 = v30;
      if NSIntersectsRange() && (objc_opt_respondsToSelector()) {
        NSRange v280 = (void *)[*(id *)(v13 + 104) attributedSubstringForMarkedRange];
      }
      else {
        NSRange v280 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v32 = [*(id *)(v13 + 104) selectedRange];
        NSUInteger v34 = v33;
        unint64_t v35 = v12;
        NSUInteger v36 = v31;
        uint64_t v37 = v29;
        NSUInteger v38 = v34;
      }
      else
      {
        unint64_t v35 = v12;
        NSUInteger v38 = 0;
        uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        NSUInteger v36 = v31;
        uint64_t v37 = v29;
      }
    }
    else
    {
      unint64_t v35 = v12;
      NSRange v280 = 0;
      NSUInteger v38 = 0;
      NSUInteger v36 = 0;
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    }
    NSUInteger length = 0;
    NSRect v281 = 0;
    uint64_t v282 = 0;
    NSUInteger v287 = 0;
    CGFloat v272 = 0.0;
    v339 = 0;
    double v39 = 0;
    v306 = 0;
    uint64_t v311 = 0;
    v330 = 0;
    v324 = 0;
    char v40 = 0;
    v334 = 0;
    uint64_t v315 = 0;
    v322 = 0;
    uint64_t v316 = 0;
    uint64_t v314 = 0;
    uint64_t v321 = 0;
    uint64_t v323 = 0;
    v299 = 0;
    uint64_t v300 = 0;
    v308 = 0;
    v302 = 0;
    uint64_t v298 = 0;
    uint64_t v305 = 0;
    uint64_t v294 = 0;
    CGFloat b = *(double *)(v16 + 8);
    CGFloat a = *(double *)v16;
    long long v295 = *(_OWORD *)(v16 + 16);
    double v41 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    CGFloat v313 = *MEMORY[0x1E4F28AD0];
    CGFloat aPoint = *(double *)(MEMORY[0x1E4F28AD0] + 8);
    double v42 = *MEMORY[0x1E4F28AE0];
    double v43 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
    if (v340) {
      double v44 = -1.0;
    }
    else {
      double v44 = 1.0;
    }
    double v301 = 0.0;
    CGFloat v293 = 0.0;
    CGFloat v320 = *MEMORY[0x1E4F28AD8];
    double v329 = *MEMORY[0x1E4F28AD8];
    CGFloat v319 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    CGFloat v318 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v327 = v318;
    CGFloat aRect = *(double *)(MEMORY[0x1E4F28AD8] + 24);
    double bRect = aRect;
    NSUInteger v289 = v36;
    NSUInteger v309 = v37;
    NSUInteger v277 = v37 + v36;
    NSUInteger v285 = v32;
    NSUInteger v278 = v32 + v38;
    unint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v288 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger range1 = v38;
    uint64_t v271 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      NSUInteger v337 = v35;
      int v325 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex(v13, v35);
      if (v335 < range2.location || v335 - range2.location >= range2.length)
      {
        v339 = objc_msgSend(*(id *)(v13 + 8), "attributesAtIndex:longestEffectiveRange:inRange:", v335, &range2, v335, v331);
        if (v325) {
          v306 = (void *)[v339 objectForKey:@"NSAttachment"];
        }
        else {
          v306 = 0;
        }
        uint64_t v311 = [v339 objectForKey:@"NSLink"];
        double v47 = (void *)[v339 objectForKey:@"NSExpansion"];
        if (v47)
        {
          [v47 doubleValue];
          double v49 = exp(v48);
        }
        else
        {
          double v49 = 1.0;
        }
        double v301 = v49;
        if (_drawGlyphsForGlyphRange_atPoint__isBidiDebugging)
        {
          double v50 = (void *)[v339 objectForKey:@"NSWritingDirection"];
          double v51 = v50;
          if (v50)
          {
            if ([v50 count]) {
              double v52 = v51;
            }
            else {
              double v52 = 0;
            }
            v324 = v52;
          }
          else
          {
            v324 = 0;
          }
        }
        double v53 = (void *)[v339 objectForKey:@"NSFont"];
        if (!v53) {
          double v53 = NSDefaultFont();
        }
        double v54 = (void *)[v339 objectForKey:@"CTVerticalForms"];
        int v55 = [v54 BOOLValue];
        if (v292) {
          BOOL v56 = v54 == 0;
        }
        else {
          BOOL v56 = 0;
        }
        if (v56) {
          int v57 = 1;
        }
        else {
          int v57 = v55;
        }
        uint64_t v58 = v53;
        if (v57 == 1) {
          uint64_t v58 = (void *)[v53 verticalFont];
        }
        if (!v58) {
          uint64_t v58 = v53;
        }
        v330 = v58;
        char v40 = [v58 isVertical];
        if (v330)
        {
          [v330 _textMatrixTransformForContext:v291];
          CGFloat b = v360[0].b;
          CGFloat a = v360[0].a;
          long long v295 = *(_OWORD *)&v360[0].c;
        }
        else
        {
          long long v295 = 0uLL;
          CGFloat b = 0.0;
          CGFloat a = 0.0;
          memset(v360, 0, 48);
        }
        long long v351 = *(_OWORD *)&v360[0].tx;
      }
      NSRange v59 = v355;
      v60.unint64_t location = v335;
      if (v335 < v355.location || v335 - v355.location >= v355.length) {
        break;
      }
      v60.NSUInteger length = v331;
      NSRange v355 = NSIntersectionRange(v60, v59);
      v363.unint64_t location = v337;
      v363.NSUInteger length = v336;
      v367.unint64_t location = location;
      v367.NSUInteger length = length;
      NSRange v68 = NSIntersectionRange(v363, v367);
      NSUInteger length = v68.length;
      unint64_t location = v68.location;
LABEL_161:
      if (location < v352.location || location - v352.location >= v352.length)
      {
        double v329 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(v13, location, (uint64_t *)&v352);
        double v327 = v104;
        double bRect = v105;
        double v41 = v106;
      }
      [(id)v13 locationForGlyphAtIndex:location];
      double v108 = v107;
      double v110 = v109;
      if (!v337) {
        goto LABEL_171;
      }
      v374.origin.double x = v320;
      v374.origin.double y = v319;
      v374.size.double width = v318;
      v374.size.double height = aRect;
      v377.origin.double x = v329;
      v377.origin.double y = v41;
      v377.size.double width = v327;
      v377.size.double height = bRect;
      if (!NSEqualRects(v374, v377)) {
        goto LABEL_171;
      }
      v372.double x = v313;
      v372.double y = aPoint;
      v373.double x = v108;
      v373.double y = v110;
      if (NSEqualPoints(v372, v373))
      {
        unint64_t v35 = v352.length + v352.location;
        NSUInteger v112 = v336 + v337 - (v352.length + v352.location);
        BOOL v111 = v336 + v337 > v352.length + v352.location;
        if (v336 + v337 < v352.length + v352.location) {
          NSUInteger v112 = 0;
        }
        unint64_t v336 = v112;
        if (!v111) {
          goto LABEL_399;
        }
      }
      else
      {
LABEL_171:
        double v113 = v290 + v329;
        double v114 = v290 + v329 + v108;
        double v115 = v41 + v110;
        if (!v340) {
          double v115 = -(v41 + v110);
        }
        double v283 = v115;
        NSUInteger v286 = v355.location;
        NSUInteger v116 = v355.length;
        if (v308 && length)
        {
          uint64_t v117 = [v308 integerValue];
          if (v117 <= 0) {
            uint64_t v118 = -(-v117 & 3);
          }
          else {
            uint64_t v118 = v117 & 3;
          }
          double v119 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(v338, location, 0);
          double v121 = v120;
          double v123 = v122;
          double width = (double)v118;
          uint64_t v124 = objc_msgSend(v308, "integerValue", v119) & 0x3000;
          if (v124 || (uint64_t v124 = [v322 integerValue] & 0x3000) != 0)
          {
            if (v124 == 12288)
            {
              double v128 = bRect + v41;
              if (v340)
              {
                v322 = 0;
                double v129 = v310 + v128;
                double v130 = -1.0;
                goto LABEL_190;
              }
              v322 = 0;
              double v140 = v128 + -1.0;
            }
            else
            {
              if (v124 == 4096) {
                goto LABEL_182;
              }
              if (v340)
              {
                v322 = 0;
                double v129 = v310 + v41;
                double v130 = 1.0;
LABEL_190:
                double v131 = v129 + v130;
LABEL_212:
                double y = v131;
                if ([(id)v338 _hasSeenRightToLeft])
                {
                  double v144 = v114 + -1.0;
                  if ((_NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location) & 1) == 0)
                  {
                    unint64_t v145 = location + length;
                    if (location + length < v352.length + v352.location)
                    {
                      int v146 = _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location + length);
                      if (v146)
                      {
                        do
                        {
                          unint64_t v147 = v145;
                          unint64_t v148 = v145 + 1;
                          if (v145 + 1 >= v352.length + v352.location) {
                            break;
                          }
                          ++v145;
                        }
                        while (v146 == _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, v148));
                      }
                      else
                      {
                        unint64_t v147 = location + length;
                      }
                      [(id)v338 locationForGlyphAtIndex:v147];
                      double v150 = v290 + v329 + v149;
                      double v151 = 1.0;
                      if (v116 + v286 != v277) {
                        double v151 = 0.0;
                      }
                      double v144 = v150 - v151;
                    }
                    if (v144 < v114)
                    {
                      int v152 = _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location);
                      NSUInteger v153 = location;
                      do
                      {
                        NSUInteger v154 = v153;
                        NSUInteger v155 = v352.location;
                        if (v153 <= v352.location) {
                          goto LABEL_227;
                        }
                        --v153;
                      }
                      while (v152 == _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, v154 - 1));
                      NSUInteger v155 = v352.location;
LABEL_227:
                      if (v154 <= v155)
                      {
                        [(id)v338 lineFragmentUsedRectForGlyphAtIndex:location effectiveRange:0];
                        double v169 = v168;
                        double v171 = v170;
                        objc_msgSend((id)objc_msgSend((id)v338, "textContainerForGlyphAtIndex:effectiveRange:", location, 0), "lineFragmentPadding");
                        double v144 = v290 + v169 + v171 - v172 + -1.0;
                      }
                      else
                      {
                        [(id)v338 locationForGlyphAtIndex:v154 - 1];
                        double v157 = v290 + v329 + v156;
                        double v158 = 1.0;
                        if (v116 + v286 != v277) {
                          double v158 = 0.0;
                        }
                        double v144 = v157 - v158;
                      }
                    }
                  }
                  double v167 = v114;
                  if (v144 < v114)
                  {
                    v360[0].CGFloat a = 0.0;
                    if ((*(unsigned char *)(v338 + 67) & 0x40) != 0)
                    {
                      uint64_t v176 = [*(id *)(v338 + 32) objectAtIndex:0];
                    }
                    else if ([*(id *)(v338 + 48) count] <= location)
                    {
                      uint64_t v176 = 0;
                    }
                    else
                    {
                      CGFloat v173 = *(void **)(v338 + 48);
                      _NSBlockNumberForIndex(v173, location, 0);
                      if (v173[11] <= v174) {
                        uint64_t v175 = v173[4] - v173[3];
                      }
                      else {
                        uint64_t v175 = 0;
                      }
                      uint64_t v176 = *(void *)(v173[7] + (v173[2] + 8) * (v175 + v174) + 8);
                    }
                    LOBYTE(v267) = 0;
                    unint64_t v177 = (double *)objc_msgSend((id)v338, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", location, length, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 1, v267, v176, v360, 0, 0);
                    double v167 = *v177;
                    double v144 = *v177 + v177[2];
                  }
                }
                else
                {
                  if (location + length >= v352.length + v352.location)
                  {
                    [(id)v338 lineFragmentUsedRectForGlyphAtIndex:location effectiveRange:0];
                    double v163 = v162;
                    double v165 = v164;
                    objc_msgSend((id)objc_msgSend((id)v338, "textContainerForGlyphAtIndex:effectiveRange:", location, 0), "lineFragmentPadding");
                    double v144 = v290 + v163 + v165 - v166 + -1.0;
                  }
                  else
                  {
                    objc_msgSend((id)v338, "locationForGlyphAtIndex:");
                    double v160 = v290 + v329 + v159;
                    double v161 = 1.0;
                    if (v116 + v286 != v277) {
                      double v161 = 0.0;
                    }
                    double v144 = v160 - v161;
                  }
                  double v167 = v114;
                }
                if (!v282)
                {
                  uint64_t v178 = [(Class)getNSColorClass_0[0]() blackColor];
                  if (v285 == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange())
                  {
                    if (v334 && ([v334 isEqual:v178] & 1) == 0) {
                      uint64_t v282 = [v334 colorWithAlphaComponent:0.8];
                    }
                    else {
                      uint64_t v282 = [(Class)getNSColorClass_0[0]() colorWithWhite:0.17 alpha:1.0];
                    }
                  }
                  else
                  {
                    uint64_t v179 = (uint64_t)v334;
                    if (!v334) {
                      uint64_t v179 = v178;
                    }
                    uint64_t v282 = v179;
                  }
                }
                if (v275)
                {
                  if (!v281)
                  {
                    char v180 = [__NSLMMarkedTextUnderlineRenderer alloc];
                    if (v180)
                    {
                      *(void *)&v360[0].CGFloat a = v180;
                      *(void *)&v360[0].CGFloat b = __NSLMMarkedTextUnderlineRenderer;
                      char v180 = [(CGAffineTransform *)(objc_super *)v360 init];
                      if (v180) {
                        v180->_cgContextRef = c;
                      }
                    }
                    NSRect v281 = v180;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    int v181 = [v302 BOOLValue];
                  }
                  else {
                    int v181 = v118 != 1;
                  }
                  -[__NSLMMarkedTextUnderlineRenderer processMarkedTextUnderlineStartX:endX:yPosition:underlineColor:selected:]((uint64_t)v281, (void *)[(id)v338 renderingColorForDocumentColor:v282], v181, v167, v144, y);
                }
                else
                {
                  CGContextSaveGState(c);
                  objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v282), "set");
                  if (v144 - v167 > 1.0 && v271 != v309 && v286 == v271) {
                    double v167 = v167 + 1.0;
                  }
                  if (v116 + v286 == v271 + *(void *)&v272 && v144 - v167 > 1.0 && v116 + v286 != v277) {
                    double v144 = v144 + -1.0;
                  }
                  CGContextSetLineWidth(c, width);
                  CGContextMoveToPoint(c, v167, y);
                  CGContextAddLineToPoint(c, v144, y);
                  CGContextStrokePath(c);
                  CGContextRestoreGState(c);
                }
                goto LABEL_283;
              }
              v322 = 0;
              double v140 = v41 + 1.0;
            }
LABEL_210:
            double v143 = v310;
          }
          else
          {
LABEL_182:
            objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", v338, location);
            double v126 = v121 + v123;
            if (v121 + v123 <= v41)
            {
              double v127 = bRect;
            }
            else
            {
              double v127 = bRect;
              if (v126 < bRect + v41)
              {
                double v125 = v125 - (bRect + v41 - v126);
                double v127 = v126 - v41;
              }
            }
            double v137 = v125 * 0.5;
            double v138 = floor(v137);
            BOOL v139 = v137 < 4.0;
            if (v137 >= 4.0) {
              double v140 = (v137 - width) * 0.666;
            }
            else {
              double v140 = v138;
            }
            NSRect v141 = v322;
            if (v139) {
              NSRect v141 = 0;
            }
            v322 = v141;
            double v142 = v41 + v127;
            if (!v340)
            {
              double v140 = v142 - v140;
              goto LABEL_210;
            }
            double v143 = v310 + v142;
          }
          double v131 = v143 - v140;
          goto LABEL_212;
        }
LABEL_283:
        double v185 = v310 + v283;
        if (v306)
        {
          uint64_t v186 = [v306 attachmentCell];
          [(id)v338 attachmentSizeForGlyphAtIndex:location];
          double v189 = v187;
          double v190 = v188;
          if (v186)
          {
            objc_msgSend((id)v338, "showAttachmentCell:inRect:characterIndex:", v186, v335, v114, v185, v187, v188);
          }
          else
          {
            objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v334), "set");
            objc_msgSend((id)v338, "showAttachment:inRect:textContainer:characterIndex:", v306, v274, v335, v114, v185, v189, v190);
          }
          if (v116 > 1) {
            unint64_t v219 = 1;
          }
          else {
            unint64_t v219 = length;
          }
          BOOL v220 = v116 != 0;
          unint64_t v221 = location;
          goto LABEL_381;
        }
        CGGlyph glyphs = 0;
        double v349 = 0.0;
        double v348 = 0.0;
        v347.NSUInteger length = 0;
        v347.unint64_t location = 0;
        NSUInteger v191 = length;
        NSUInteger v192 = location + length;
        NSRange v193 = v352;
        NSUInteger v194 = location;
        if (location + length > v352.length + v352.location)
        {
          v365.unint64_t location = location;
          v365.NSUInteger length = length;
          NSRange v195 = NSIntersectionRange(v365, v193);
          NSUInteger v191 = v195.length;
          NSUInteger v194 = v195.location;
          NSUInteger v192 = v195.location + v195.length;
        }
        NSUInteger v284 = v116;
        uint64_t v196 = 0;
        v307 = 0;
        NSUInteger v197 = v194;
        v347.unint64_t location = v194;
        v347.NSUInteger length = v191;
        unint64_t v198 = v360;
        double v199 = v361;
        while (1)
        {
          NSUInteger v200 = v347.location;
          _NSLayoutTreeRunLocationForGlyphAtIndex(v338, v347.location, &v347);
          v370.unint64_t location = v197;
          v370.NSUInteger length = v191;
          NSRange v201 = NSIntersectionRange(v347, v370);
          NSUInteger v202 = v201.location;
          NSUInteger v203 = v201.length;
          NSRange v347 = v201;
          if (v201.location < v200)
          {
            NSUInteger v203 = v201.location - v200 + v201.length;
            v347.NSUInteger length = v203;
            v347.unint64_t location = v200;
            NSUInteger v202 = v200;
          }
          uint64_t v204 = 512 - 2 * v196;
          if (v203 > v204 >> 1)
          {
            NSUInteger v203 = v204 >> 1;
            v347.NSUInteger length = v204 >> 1;
          }
          uint64_t PackedGlyphsInRange = _NSGlyphTreeGetPackedGlyphsInRange(v338, v202, v203, v199);
          uint64_t v206 = PackedGlyphsInRange;
          int v207 = PackedGlyphsInRange == 1 ? v303 : 0;
          if (v207 == 1)
          {
            if (_NSGlyphTreeVirtualEllipsisAttributeForGlyphAtIndex(v338, v347.location))
            {
              LOWORD(characters.a) = 8230;
              double v208 = (const __CTFont *)objc_msgSend((id)v338, "substituteFontForFont:", objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "_ellipsisFontForFont:", v330));
              CTFontGetGlyphsForCharacters(v208, (const UniChar *)&characters, &glyphs, 1);
              [(__CTFont *)v208 getAdvancements:&v358 forCGGlyphs:&glyphs count:1];
              v307 = v208;
              double v348 = v114;
              double v349 = v185;
              if (v40)
              {
                [(__CTFont *)v208 getVerticalOriginTranslations:&v356 forCGGlyphs:&glyphs count:1];
                double v209 = v357;
                if (v340) {
                  double v209 = -v357;
                }
                double v348 = v356 + v348;
                double v349 = v349 + v209;
              }
              goto LABEL_311;
            }
          }
          else if (!PackedGlyphsInRange)
          {
            goto LABEL_311;
          }
          [v330 getAdvancements:&v358 forCGGlyphs:v199 count:v206];
          if (v40) {
            [v330 getVerticalOriginTranslations:&v356 forCGGlyphs:v199 count:v206];
          }
          v196 += v206;
          unint64_t v210 = &v357;
          int64_t v211 = (double *)&v359;
          do
          {
            v198->CGFloat a = v114;
            v198->CGFloat b = v185;
            if (v40)
            {
              double v212 = *v210;
              if (v340) {
                double v212 = -*v210;
              }
              v198->CGFloat a = v114 + *(v210 - 1);
              v198->CGFloat b = v212 + v185;
            }
            unint64_t v198 = (CGAffineTransform *)((char *)v198 + 16);
            double v114 = v114 + v42 + *(v211 - 1);
            double v213 = *v211;
            v211 += 2;
            double v185 = v185 + (v43 + v213) * v44;
            v210 += 2;
            --v206;
          }
          while (v206);
LABEL_311:
          NSUInteger v214 = v347.length + v347.location;
          v347.unint64_t location = v214;
          if (v214 >= v192) {
            break;
          }
          objc_msgSend((id)v338, "locationForGlyphAtIndex:");
          double v114 = v113 + v215;
          double v217 = v41 + v216;
          double v218 = -(v41 + v216);
          if (!v340) {
            double v217 = v218;
          }
          double v185 = v310 + v217;
          double v199 = &v361[v196];
          if (v196 >= 256)
          {
            NSUInteger v214 = v347.location;
            goto LABEL_322;
          }
        }
        double v199 = &v361[v196];
LABEL_322:
        BOOL v111 = v192 > v214;
        unint64_t v221 = v197;
        if (v111) {
          unint64_t v219 = v214 - v197;
        }
        else {
          unint64_t v219 = v191;
        }
        if (v219 < length) {
          NSUInteger v284 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(v338, v219 + v197) - v286;
        }
        if (v219)
        {
          long long v346 = v351;
          CGContextGetFontRenderingStyle();
          char v222 = v325 ^ 1;
          if (v219 > 1) {
            char v222 = 1;
          }
          BOOL v223 = (v222 & 1) != 0 || [(id)v338 glyphAtIndex:v197] != 0;
          objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v334), "set");
          if ((v300 & 7) != 0 && v223)
          {
            CGContextSaveGState(c);
            if (v316) {
              objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v316), "set");
            }
            [(id)v321 applyToGraphicsContext:v291];
            objc_msgSend((id)v338, "underlineGlyphRange:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v300, v352.location, v352.length, v329, v41, v327, bRect, v290, v310);
            CGContextRestoreGState(c);
          }
          if (v269)
          {
            CGContextSaveGState(c);
            objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", v338, v197);
            double v226 = v225;
            CFDictionaryRef Mutable = CGPathCreateMutable();
            CGFloat v228 = v310 + bRect + v41 - v226;
            CGPathMoveToPoint(Mutable, 0, v113, v228);
            CGPathAddLineToPoint(Mutable, 0, v327 + v113, v228);
            CGContextAddPath(c, Mutable);
            CGContextSetLineWidth(c, v268);
            objc_msgSend((id)objc_msgSend((Class)getNSColorClass_0[0](), "blueColor"), "setStroke");
            CGContextSetLineDash(c, 0.0, _drawGlyphsForGlyphRange_atPoint__components, 2uLL);
            CGContextSetShouldAntialias(c, 0);
            CGContextStrokePath(c);
            CGPathRelease(Mutable);
            CGContextRestoreGState(c);
          }
          [v330 applyToGraphicsContext:v291];
          if (v301 != 1.0 || (v229 = b, v326 = a, CGFloat d = *((double *)&v295 + 1), v231 = *(double *)&v295, v299))
          {
            CGContextGetTextMatrix(&t1, c);
            t2.CGFloat a = v301;
            t2.CGFloat b = 0.0;
            t2.double c = v293;
            t2.CGFloat d = 1.0;
            t2.tdouble x = 0.0;
            t2.tdouble y = 0.0;
            CGAffineTransformConcat(&characters, &t1, &t2);
            CGFloat v229 = characters.b;
            CGFloat v231 = characters.c;
            CGFloat d = characters.d;
            long long v345 = *(_OWORD *)&characters.tx;
            CGFloat v326 = characters.a;
            CGContextSetTextMatrix(c, &characters);
            long long v346 = v345;
          }
          if (v321 | v323)
          {
            CGContextSaveGState(c);
            [(id)v321 applyToGraphicsContext:v291];
            if (v323)
            {
              [v330 pointSize];
              double v233 = v232;
              [(id)v323 doubleValue];
              double v235 = v233 * 0.01 * v234;
              if (v235 <= 0.0)
              {
                if (v235 < 0.0)
                {
                  CGContextSetLineWidth(c, -v235);
                  CGTextDrawingMode v236 = kCGTextFillStroke;
                }
                else
                {
                  CGTextDrawingMode v236 = kCGTextFill;
                }
              }
              else
              {
                CGContextSetLineWidth(c, v235);
                CGTextDrawingMode v236 = kCGTextStroke;
              }
              CGContextSetTextDrawingMode(c, v236);
              if (v315) {
                objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v315), "setStroke");
              }
            }
          }
          uint64_t v237 = (uint64_t)v339;
          if (!v339) {
            uint64_t v237 = [MEMORY[0x1E4F1C9E8] dictionary];
          }
          characters.CGFloat a = v326;
          characters.CGFloat b = v229;
          characters.double c = v231;
          characters.CGFloat d = d;
          *(_OWORD *)&characters.tdouble x = v346;
          [(id)v338 showCGGlyphs:v361 positions:v360 count:v199 - v361 font:v330 matrix:&characters attributes:v237 inContext:c];
          if (v307)
          {
            CGContextSaveGState(c);
            [(__CTFont *)v307 applyToGraphicsContext:v291];
            characters.CGFloat a = v326;
            characters.CGFloat b = v229;
            characters.double c = v231;
            characters.CGFloat d = d;
            *(_OWORD *)&characters.tdouble x = v346;
            [(id)v338 showCGGlyphs:&glyphs positions:&v348 count:1 font:v307 matrix:&characters attributes:v237 inContext:c];
            CGContextRestoreGState(c);
          }
          CGContextSetFontRenderingStyle();
          if (v321 | v323) {
            CGContextRestoreGState(c);
          }
          if (v223)
          {
            if ((v298 & 7) != 0)
            {
              CGContextSaveGState(c);
              if (v314) {
                objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v314), "set");
              }
              [(id)v321 applyToGraphicsContext:v291];
              double v238 = v329;
              if (v299)
              {
                objc_msgSend(v299, "doubleValue", v329);
                double v240 = v239;
                [v330 xHeight];
                double v238 = v329 + v240 * v241 * 0.5;
              }
              objc_msgSend((id)v338, "strikethroughGlyphRange:strikethroughType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v298, v352.location, v352.length, v238, v41, v327, bRect, v290, v310);
              CGContextRestoreGState(c);
            }
            if (v305 | v294)
            {
              characters.CGFloat b = 0.0;
              characters.CGFloat a = 0.0;
              uint64_t v243 = objc_msgSend((id)v338, "characterRangeForGlyphRange:actualGlyphRange:", v352.location, v352.length, 0);
              uint64_t v244 = v242;
              if (v305) {
                double v245 = @"NSSpellingState";
              }
              else {
                double v245 = @"NSTextAlternativesDisplayStyle";
              }
              objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", v245, v286, &characters, v243, v242);
              uint64_t v246 = objc_msgSend((id)v338, "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)&characters.a, *(void *)&characters.b, 0);
              NSUInteger v248 = v247;
              if ((v305 & 0x80) != 0
                && (objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", NSTemporaryTextCorrectionAttributeName, v286, &characters, v243, v244)|| objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", @"NSTextAlternatives", v286, &characters, v243, v244)))
              {
                v371.unint64_t location = objc_msgSend((id)v338, "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)&characters.a, *(void *)&characters.b, 0);
                v371.NSUInteger length = v249;
                v366.unint64_t location = v246;
                v366.NSUInteger length = v248;
                NSRange v250 = NSIntersectionRange(v366, v371);
                uint64_t v246 = v250.location;
                NSUInteger v248 = v250.length;
              }
              if (v305) {
                uint64_t v251 = v305;
              }
              else {
                uint64_t v251 = v294;
              }
              objc_msgSend((id)v338, "drawSpellingUnderlineForGlyphRange:spellingState:inGlyphRange:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v251, v246, v248, v329, v41, v327, bRect, v290, v310, v352.location, v352.length);
            }
          }
          unint64_t v221 = v197;
        }
        v306 = 0;
        BOOL v220 = v284;
LABEL_381:
        if (v311)
        {
          if (v220 && CGContextGetType() == 1)
          {
            objc_opt_class();
            CFURLRef v252 = (const __CFURL *)v311;
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (CFURLRef v252 = (const __CFURL *)[MEMORY[0x1E4F1CB10] URLWithString:v311]) != 0)
            {
              v360[0].CGFloat a = 0.0;
              unint64_t v253 = v221;
              uint64_t v254 = objc_msgSend((id)v338, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v221, v219, 0x7FFFFFFFFFFFFFFFLL, 0, v274, v360);
              CGFloat v255 = v360[0].a;
              if (*(void *)&v360[0].a)
              {
                unint64_t v256 = 0;
                BOOL v257 = (CGFloat *)(v254 + 16);
                do
                {
                  CGFloat v258 = *v257;
                  if (*v257 > 0.0)
                  {
                    double v259 = v257[1];
                    if (v259 > 0.0)
                    {
                      double v260 = *(v257 - 2);
                      double v261 = *(v257 - 1);
                      CGContextGetCTM(&v341, c);
                      double v262 = -(v261 + v259);
                      if (v340) {
                        double v262 = v261;
                      }
                      v375.origin.double y = v310 + v262;
                      v375.origin.double x = v290 + v260;
                      v375.size.double width = v258;
                      v375.size.double height = v259;
                      CGRect v376 = CGRectApplyAffineTransform(v375, &v341);
                      CGPDFContextSetURLForRect(c, v252, v376);
                      CGFloat v255 = v360[0].a;
                    }
                  }
                  ++v256;
                  v257 += 4;
                }
                while (v256 < *(void *)&v255);
              }
              unint64_t v221 = v253;
            }
          }
        }
        NSUInteger v263 = v335 + v331;
        NSUInteger v335 = v220 + v286;
        NSUInteger v331 = v263 - (v220 + v286);
        unint64_t v35 = v221 + v219;
        unint64_t v265 = v336 + v337 - (v221 + v219);
        BOOL v264 = v336 + v337 > v221 + v219;
        if (v336 + v337 < v221 + v219) {
          unint64_t v265 = 0;
        }
        unint64_t v336 = v265;
        uint64_t v13 = v338;
        if (!v264)
        {
LABEL_399:
          -[__NSLMMarkedTextUnderlineRenderer renderUnderline]((uint64_t)v281);

          [(id)v13 _resetCachedTextContainer];
          double v266 = (void *)(*(void *)(v13 + 240) + 168);
          *double v266 = 0;
          v266[1] = 0;
          if (v273) {
            [*(id *)(v13 + 8) _unlock];
          }
          return;
        }
      }
    }
    v60.NSUInteger length = v331;
    NSRange v62 = NSIntersectionRange(v60, range2);
    NSRange v355 = v62;
    if (v62.location < v353.location || v62.location - v353.location >= v353.length)
    {
      double v39 = objc_msgSend((id)v13, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v62.location, &v353, v62.location, v62.length);
      if (v311)
      {
        uint64_t v64 = [(id)v13 linkAttributesForAttributes:v339 forCharacterAtIndex:v355.location];
        if (v64)
        {
          uint64_t v65 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v64];
          [v65 addEntriesFromDictionary:v39];
          double v39 = v65;
        }
      }
      if ((*(unsigned char *)(*(void *)(v13 + 240) + 449) & 0x10) != 0)
      {
        uint64_t v66 = objc_msgSend((id)v13, "delegate", v64);
        double v39 = (void *)[v66 layoutManager:v13 shouldUseTemporaryAttributes:v39 forDrawingToScreen:1 atCharacterIndex:v355.location effectiveRange:&v353];
      }
    }
    if (!v39
      || (NSRange v355 = NSIntersectionRange(v355, v353),
          (v334 = (void *)[v39 objectForKey:@"NSColor"]) == 0))
    {
      v334 = (void *)[v339 objectForKey:@"NSColor"];
    }
    if (v324)
    {
      v334 = (void *)[(Class)getNSColorClass_0[0]() brownColor];
      if ([v324 count] == 1)
      {
        uint64_t v67 = objc_msgSend((id)objc_msgSend(v324, "objectAtIndex:", 0), "unsignedIntegerValue");
        if (v67)
        {
          if (v67 == 1) {
            v334 = (void *)[(Class)getNSColorClass_0[0]() redColor];
          }
        }
        else
        {
          v334 = (void *)[(Class)getNSColorClass_0[0]() blueColor];
        }
      }
    }
    if (!v39 || (uint64_t v315 = [v39 objectForKey:@"NSStrokeColor"]) == 0) {
      uint64_t v315 = [v339 objectForKey:@"NSStrokeColor"];
    }
    v322 = (void *)[v339 objectForKey:@"NSUnderline"];
    if (!v39 || (uint64_t v316 = [v39 objectForKey:@"NSUnderlineColor"]) == 0) {
      uint64_t v316 = [v339 objectForKey:@"NSUnderlineColor"];
    }
    double v69 = (void *)[v339 objectForKey:@"NSStrikethrough"];
    if (((v39 && (uint64_t v314 = [v39 objectForKey:@"NSStrikethroughColor"]) != 0
        || (uint64_t v314 = [v339 objectForKey:@"NSStrikethroughColor"], v39))
       && (uint64_t v321 = [v39 objectForKey:@"NSShadow"]) != 0
       || (uint64_t v321 = [v339 objectForKey:@"NSShadow"], v39))
      && (uint64_t v323 = [v39 objectForKey:@"NSStrokeWidth"]) != 0
      || (uint64_t v323 = [v339 objectForKey:@"NSStrokeWidth"], v39))
    {
      NSUInteger v70 = (void *)[v39 objectForKey:@"NSObliqueness"];
      if (v70) {
        goto LABEL_105;
      }
    }
    NSUInteger v70 = (void *)[v339 objectForKey:@"NSObliqueness"];
    if (v70)
    {
LABEL_105:
      v299 = v70;
      [v70 doubleValue];
      if (v340) {
        double v71 = -v71;
      }
    }
    else
    {
      v299 = 0;
      double v71 = 0.0;
    }
    CGFloat v293 = v71;
    if (v309 != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
    {
      if (v355.location < v309)
      {
        v302 = 0;
        v308 = 0;
        v355.NSUInteger length = v309 - v355.location;
        goto LABEL_128;
      }
      if (v355.location - v309 >= v289)
      {
        v302 = 0;
        v308 = 0;
        v355.length += v355.location - v277;
        v355.unint64_t location = v277;
        goto LABEL_128;
      }
      if (v280)
      {
        *(_OWORD *)&v360[0].CGFloat a = 0uLL;
        uint64_t v72 = objc_msgSend(v280, "attribute:atIndex:effectiveRange:", @"NSColor");
        if (v72)
        {
          if (*(void *)&v360[0].b < v355.length) {
            v355.NSUInteger length = *(void *)&v360[0].b;
          }
          v334 = (void *)v72;
        }
        v308 = (void *)[v280 attribute:@"NSUnderline" atIndex:v355.location - v309 effectiveRange:v360];
        if (v308)
        {
          if (*(void *)&v360[0].b < v355.length) {
            v355.NSUInteger length = *(void *)&v360[0].b;
          }
          uint64_t v282 = [v280 attribute:@"NSUnderlineColor" atIndex:v355.location - v309 effectiveRange:v360];
          if (v282 && *(void *)&v360[0].b < v355.length) {
            v355.NSUInteger length = *(void *)&v360[0].b;
          }
          uint64_t v73 = [v280 attribute:NSMarkedClauseSegmentAttributeName atIndex:v355.location - v309 effectiveRange:v360];
          v74.unint64_t location = v355.location;
          if (v73)
          {
            v368.NSUInteger length = *(void *)&v360[0].b;
            v368.unint64_t location = *(void *)&v360[0].a + v309;
            v74.NSUInteger length = v355.length;
            uint64_t v271 = *(void *)&v360[0].a + v309;
            CGFloat v272 = v360[0].b;
            NSRange v74 = NSIntersectionRange(v74, v368);
            NSRange v355 = v74;
          }
          v302 = (void *)[v280 attribute:@"NSMarkedTextSelectionAttributeName" atIndex:v74.location - v309 effectiveRange:0];
        }
        else
        {
          v302 = 0;
        }
LABEL_128:
        if (v322) {
          uint64_t v75 = [v322 integerValue];
        }
        else {
          uint64_t v75 = 0;
        }
        uint64_t v76 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"NSUnderline"), "integerValue");
        if (v69) {
          uint64_t v77 = [v69 integerValue];
        }
        else {
          uint64_t v77 = 0;
        }
        uint64_t v78 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"NSStrikethrough"), "integerValue");
        *(_OWORD *)&v360[0].CGFloat a = 0uLL;
        uint64_t v305 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"NSSpellingState"), "integerValue");
        uint64_t v294 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", @"NSTextAlternativesDisplayStyle"), "integerValue");
        uint64_t v79 = [v39 objectForKey:NSTemporaryTextCorrectionAttributeName];
        double v80 = (void *)[v39 objectForKey:@"NSTextAlternatives"];
        if (v79)
        {
          NSUInteger v81 = (void *)[*(id *)(v338 + 8) string];
          NSUInteger v82 = v355.location;
          uint64_t v83 = [*(id *)(v338 + 8) length];
          uint64_t v84 = objc_msgSend(v81, "rangeOfString:options:range:", v79, 8, v82, v83 - v355.location);
          uint64_t v86 = v85;
          if (v85)
          {
            unint64_t v87 = v84;
            if (objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", NSTemporaryTextCorrectionAttributeName, v355.location, v360, v84, v85))
            {
              if (__PAIR128__(v86, v87) == *(_OWORD *)&v360[0].a)
              {
                NSUInteger v88 = v287;
                if (v355.location < v288 || v355.location - v288 >= v287)
                {
                  NSUInteger v358 = 0;
                  double v356 = 0.0;
                  char v89 = (void *)[*(id *)(v338 + 8) string];
                  objc_msgSend(v89, "getParagraphStart:end:contentsEnd:forRange:", &v358, 0, &v356, v355.location, v355.length);
                  NSUInteger v288 = v358;
                  NSUInteger v88 = *(void *)&v356 - v358;
                }
                NSUInteger v287 = v88;
                if (v288 + v88 >= v285 && v278 >= v288)
                {
                  if (!_drawGlyphsForGlyphRange_atPoint__correctionUnderlineBehavior)
                  {
                    NSUInteger v132 = v87 + v86;
                    NSUInteger v133 = v285;
                    NSUInteger v134 = range1;
                    BOOL v111 = v285 > v87 + v86;
                    uint64_t v13 = v338;
                    if (v111)
                    {
                      NSUInteger v333 = v132;
                      v369.unint64_t location = [*(id *)(v338 + 8) nextWordFromIndex:v285 forward:0];
                      v369.NSUInteger length = v278 - v369.location;
                      v364.unint64_t location = v285;
                      v364.NSUInteger length = range1;
                      NSRange v135 = NSUnionRange(v364, v369);
                      NSUInteger v134 = v135.length;
                      NSUInteger v133 = v135.location;
                      NSUInteger v132 = v333;
                    }
                    if (v132 >= v133)
                    {
                      uint64_t v136 = v305;
                      if (v134 + v133 >= v87) {
                        uint64_t v136 = v305 | 0x80;
                      }
                      uint64_t v305 = v136;
                    }
                    goto LABEL_146;
                  }
                  v305 |= 0x80uLL;
                }
              }
            }
          }
        }
        uint64_t v13 = v338;
LABEL_146:
        if (v80)
        {
          uint64_t v90 = (void *)[*(id *)(v13 + 8) string];
          uint64_t v91 = [v80 primaryString];
          NSUInteger v92 = v355.location;
          uint64_t v93 = [*(id *)(v13 + 8) length];
          uint64_t v94 = objc_msgSend(v90, "rangeOfString:options:range:", v91, 8, v92, v93 - v355.location);
          unint64_t v96 = v95;
          if (v95)
          {
            uint64_t v97 = v94;
            if (objc_msgSend((id)v13, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", @"NSTextAlternatives", v355.location, v360, v94, v95))
            {
              uint64_t v13 = v338;
              if (__PAIR128__(v96, v97) == *(_OWORD *)&v360[0].a)
              {
                NSUInteger v98 = v288;
                NSUInteger v99 = v287;
                if (v355.location < v288 || v355.location - v288 >= v287)
                {
                  NSUInteger v358 = 0;
                  double v356 = 0.0;
                  double v100 = (void *)[*(id *)(v338 + 8) string];
                  objc_msgSend(v100, "getParagraphStart:end:contentsEnd:forRange:", &v358, 0, &v356, v355.location, v355.length);
                  NSUInteger v98 = v358;
                  NSUInteger v99 = *(void *)&v356 - v358;
                }
                NSUInteger v287 = v99;
                NSUInteger v288 = v98;
                if (v98 + v99 >= v285)
                {
                  uint64_t v101 = v305;
                  if (v278 >= v98) {
                    uint64_t v101 = v305 | 0x80;
                  }
                  uint64_t v305 = v101;
                }
              }
            }
            else
            {
              uint64_t v13 = v338;
            }
          }
        }
        if (!v334)
        {
          v334 = (void *)[(Class)getNSColorClass_0[0]() blackColor];
          uint64_t v13 = v338;
        }
        unint64_t v102 = _NSGlyphTreeGlyphRangeForCharacterRange(v13, v355.location, v355.length, 1, 1, 1, (uint64_t *)&v355);
        NSUInteger length = v103;
        unint64_t location = v102;
        uint64_t v300 = v76 | v75;
        uint64_t v298 = v78 | v77;
        goto LABEL_161;
      }
    }
    v302 = 0;
    v308 = 0;
    goto LABEL_128;
  }
}

uint64_t __63__NSLayoutManager_NSPrivate___drawGlyphsForGlyphRange_atPoint___block_invoke()
{
  _drawGlyphsForGlyphRange_atPoint__isBidiDebugging = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSDebugBidi");
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"NSCorrectionUnderlineBehavior");
  _drawGlyphsForGlyphRange_atPoint__correctionUnderlineBehavior = result;
  return result;
}

- (unsigned)_glyphAtIndex:(unint64_t)a3 characterIndex:(unint64_t *)a4 glyphInscription:(unint64_t *)a5 isValidIndex:(BOOL *)a6
{
  unint64_t v9 = a3;
  BOOL v15 = 0;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, a3, 1uLL);
  unsigned int v11 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v9, &v15);
  if (v15)
  {
    unint64_t v12 = v9;
    if (a4) {
      unint64_t v12 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v9);
    }
    if (a5) {
      unint64_t v13 = _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, v9, 5);
    }
    else {
      unint64_t v13 = 0;
    }
    unint64_t v9 = v12;
    if (a4) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if (a4) {
LABEL_10:
    }
      *a4 = v9;
  }
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v15;
  }
  return v11;
}

- (BOOL)_needToFlushGlyph
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 3) & 1;
}

- (void)_setNeedToFlushGlyph:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xF7FFFFFF | v3);
}

- (void)_simpleInsertGlyph:(unsigned int)a3 atGlyphIndex:(unint64_t)a4 characterIndex:(unint64_t)a5 elastic:(BOOL)a6
{
  uint64_t v9 = 0;
  -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v9, a4, 1, 1);
  unint64_t v8 = (void *)*((void *)self->_extraData + 23);
  if (v8) {
    _NSInsertGlyphRangeInTextBlocks(v8, a4, 1);
  }
}

- (void)_simpleDeleteGlyphsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", a3.location, a3.length, 1);
    uint64_t v6 = (void *)*((void *)self->_extraData + 23);
    if (v6)
    {
      _NSDeleteGlyphRangeFromTextBlocks(v6, location, length);
    }
  }
}

- (void)_insertGlyphs:(unsigned int *)a3 elasticAttributes:(BOOL *)a4 count:(unint64_t)a5 atGlyphIndex:(unint64_t)a6 characterIndex:(unint64_t)a7
{
  unint64_t v7 = a6;
  unint64_t v8 = a5;
  _NSGlyphTreeInsertGlyphs((uint64_t)self, a7, a6, a5, a3);
  for (; v8; --v8)
  {
    BOOL v15 = *a4++;
    _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, v7++, 1, v15, v11, v12, v13, v14, v17);
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }
}

- (id)_attachmentSizesRun
{
  return 0;
}

- (CGRect)_currentAttachmentRect
{
  double v2 = *((double *)self->_extraData + 2);
  double v3 = *((double *)self->_extraData + 3);
  double v4 = *((double *)self->_extraData + 4);
  double v5 = *((double *)self->_extraData + 5);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (unint64_t)_currentAttachmentIndex
{
  return *((void *)self->_extraData + 6);
}

- (void)_setCurrentAttachmentRect:(CGRect)a3 index:(unint64_t)a4
{
  extraDatCGFloat a = (char *)self->_extraData;
  *(CGRect *)(extraData + 16) = a3;
  *((void *)extraData + 6) = a4;
}

- (void)_clearCurrentAttachmentSettings
{
  *((void *)self->_extraData + 6) = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_clearTemporaryAttributes
{
  extraDatCGFloat a = self->_extraData;
  double v4 = (void *)extraData[55];
  if (v4)
  {
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_175];
    [*((id *)self->_extraData + 55) removeAllObjects];
    extraDatCGFloat a = self->_extraData;
  }
  double v5 = (void *)extraData[9];
  if (v5)
  {

    *((void *)self->_extraData + 9) = 0;
  }
}

uint64_t __55__NSLayoutManager_NSPrivate___clearTemporaryAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a2 performSelector:sel_removeView];
  }
  return result;
}

- (void)_clearTemporaryAttributesForCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  extraDatCGFloat a = self->_extraData;
  double v5 = (void *)*((void *)extraData + 9);
  if (v5)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    NSUInteger v9 = a3.length - a4;
    v34.NSUInteger length = [*((id *)extraData + 9) count];
    v33.NSUInteger location = location;
    v33.NSUInteger length = v9;
    v34.NSUInteger location = 0;
    NSRange v10 = NSIntersectionRange(v33, v34);
    if (v10.length)
    {
      id v11 = 0;
      NSUInteger v28 = v10.location;
      uint64_t v29 = 0;
      if (v10.location < v10.location + v10.length)
      {
        id v11 = 0;
        NSUInteger v12 = v10.location;
        do
        {
          id v13 = [(NSLayoutManager *)self temporaryAttribute:@"NSViewTextAttachmentCellHelper" atCharacterIndex:v12 effectiveRange:&v28];
          if (v13)
          {
            id v14 = v13;
            if (!v11) {
              id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v11 addObject:v14];
          }
          NSUInteger v12 = v29 + v28;
        }
        while (v29 + v28 < v10.location + v10.length);
      }
      objc_msgSend(v5, "replaceObjectsInRange:withObject:length:", v10.location, v10.length, +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), length);
      if (v11)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v15 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v11);
              }
              double v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v19 performSelector:sel_removeView];
              }
            }
            uint64_t v16 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
          }
          while (v16);
        }
        [*((id *)self->_extraData + 55) minusSet:v11];
      }
    }
    else
    {
      unint64_t v20 = [v5 count];
      if (location <= v20) {
        NSUInteger v21 = location;
      }
      else {
        NSUInteger v21 = v20;
      }
      if (location <= v20) {
        NSUInteger v22 = length;
      }
      else {
        NSUInteger v22 = location + length - v20;
      }
      id v23 = +[NSAttributeDictionary emptyAttributeDictionary];
      objc_msgSend(v5, "insertObject:range:", v23, v21, v22);
    }
  }
}

- (void)setAllowsOriginalFontMetricsOverride:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFDFF | v3);
}

- (BOOL)allowsOriginalFontMetricsOverride
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 1) & 1;
}

- (void)_setHasSeenRightToLeft:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFDFFFFFF | v3);
}

- (BOOL)_hasSeenRightToLeft
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 1) & 1;
}

- (BOOL)flipsIfNeeded
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 4) & 1;
}

- (void)setFlipsIfNeeded:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xEFFFFFFF | v3);
}

- (void)setLineFragmentRect:(CGRect)a3 forGlyphRange:(_NSRange)a4 usedRect:(CGRect)a5 baselineOffset:(double)a6
{
  NSUInteger location = a4.location;
  -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", a4.location, a4.length, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [(NSLayoutManager *)self setBaselineOffset:location forGlyphAtIndex:a6];
}

- (double)baselineOffsetForGlyphAtIndex:(unint64_t)a3
{
  double v4 = 0.0;
  _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex((uint64_t)self, a3, &v4);
  return v4;
}

- (void)setBaselineOffset:(double)a3 forGlyphAtIndex:(unint64_t)a4
{
}

- (BOOL)ignoresViewTransformations
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 2) & 1;
}

- (void)setIgnoresViewTransformations:(BOOL)a3
{
  __lmFlags lmFlags = self->_lmFlags;
  if (a3)
  {
    if ((*(_DWORD *)&lmFlags & 0x4000000) != 0) {
      return;
    }
    int v5 = 0x4000000;
  }
  else
  {
    if ((*(_DWORD *)&lmFlags & 0x4000000) == 0) {
      return;
    }
    int v5 = 0;
  }
  uint64_t v6 = [(NSTextStorage *)self->_textStorage length];
  __lmFlags v7 = self->_lmFlags;
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v7 & 0xFBFFFFFF | v5);
  if (v6)
  {
    uint64_t v8 = v6;
    if ((*(_DWORD *)&v7 & 0x8100000) != 0) {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v6, 0);
    }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v8, 0);
  }
}

- (BOOL)ignoresAntialiasThreshold
{
  return 0;
}

- (BOOL)_alwaysDrawsActive
{
  return *((unsigned __int8 *)self->_extraData + 449) >> 7;
}

- (void)_setAlwaysDrawsActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFFF7FFF | v3;
}

- (id)_insertionPointHelperForGlyphAtIndex:(unint64_t)a3
{
  v194[256] = *MEMORY[0x1E4F143B8];
  unint64_t v191 = 0;
  uint64_t v192 = 0;
  unint64_t v189 = 0;
  uint64_t v190 = 0;
  uint64_t v187 = 0;
  uint64_t v188 = 0;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage string];
  double v6 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, a3, (uint64_t *)&v191);
  double v7 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, v191, 0);
  double v9 = v8;
  uint64_t v10 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v191, v192, 0);
  NSUInteger v12 = v11;
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    double v18 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v13 = v191;
    if ([(NSRunStorage *)self->_containerRuns count] <= v13) {
      return 0;
    }
    containerRuns = self->_containerRuns;
    *(void *)&double v16 = _NSBlockNumberForIndex(containerRuns, v13, 0).n128_u64[0];
    unint64_t v17 = 0;
    if (containerRuns->_gapBlockIndex <= v15) {
      unint64_t v17 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    double v18 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v17 + v15)];
  }
  if (v18) {
    BOOL v19 = v12 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19) {
    return 0;
  }
  NSUInteger v22 = [+[NSInsertionPointHelper allocWithZone:[(NSLayoutManager *)self zone]] init];
  unint64_t v20 = v22;
  if (v22)
  {
    uint64_t v175 = v18;
    unint64_t v176 = v10;
    NSUInteger v182 = (__CFString *)v5;
    v22->_charRange.NSUInteger location = v10;
    v22->_charRange.NSUInteger length = v12;
    double v185 = (double *)NSAllocateCollectable(8 * (v12 + 1), 0);
    v20->_logicalPositions = v185;
    id v23 = 0;
    NSUInteger v184 = (unint64_t *)NSAllocateCollectable(8 * (v12 + 1), 0);
    v20->_logicalCharIndexes = v184;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 2) != 0) {
      id v23 = (char *)malloc_type_malloc(v12 + 1, 0x100004077774924uLL);
    }
    long long v24 = 0;
    if (!v185)
    {
      long long v25 = 0;
      long long v26 = 0;
      long long v27 = 0;
      goto LABEL_175;
    }
    long long v25 = 0;
    long long v26 = 0;
    long long v27 = 0;
    if (!v184) {
      goto LABEL_175;
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 2) == 0 || v23)
    {
      double v172 = v20;
      uint64_t v171 = objc_msgSend((id)objc_msgSend(v18, "textView"), "layoutOrientation");
      [v18 lineFragmentPadding];
      double v29 = v28;
      double v30 = v7 + v9;
      unint64_t v31 = v176 + v12;
      char v180 = v23;
      if (v176 < v176 + v12)
      {
        NSUInteger length = 0;
        unint64_t v32 = 0;
        char v173 = 0;
        uint64_t v181 = 0;
        unint64_t v174 = v23 + 1;
        NSRange v33 = v182;
        double v170 = v185 + 1;
        NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t range1_8 = v176 + v12;
        while (1)
        {
          RangeOfCharacterClusterAtIndedouble x = CFStringGetRangeOfCharacterClusterAtIndex();
          NSUInteger v36 = v35;
          if (v35 <= 1)
          {
            if ([(__CFString *)v33 characterAtIndex:RangeOfCharacterClusterAtIndex] == 13
              && RangeOfCharacterClusterAtIndex + 1 < v31)
            {
              if (-[__CFString characterAtIndex:](v33, "characterAtIndex:") == 10) {
                NSUInteger v36 = 2;
              }
              else {
                NSUInteger v36 = 1;
              }
            }
            else
            {
              NSUInteger v36 = 1;
            }
          }
          unint64_t v37 = v36 + RangeOfCharacterClusterAtIndex;
          if (v36 + RangeOfCharacterClusterAtIndex >= v31)
          {
            int v38 = [(__CFString *)v33 characterAtIndex:v37 - 1];
            if (v38 > 132)
            {
              if ((v38 - 8232) < 2 || v38 == 133)
              {
LABEL_128:
                NSUInteger v51 = RangeOfCharacterClusterAtIndex;
                goto LABEL_129;
              }
            }
            else if (v38 == 13)
            {
              if (v37 >= [(__CFString *)v33 length]
                || [(__CFString *)v33 characterAtIndex:v36 + RangeOfCharacterClusterAtIndex] != 10)
              {
                goto LABEL_128;
              }
            }
            else if (v38 == 10 || v38 == 12)
            {
              goto LABEL_128;
            }
          }
          unint64_t v39 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", RangeOfCharacterClusterAtIndex, v36, &v189, v170);
          uint64_t v41 = v40;
          if (!v190) {
            uint64_t v190 = 1;
          }
          [(NSLayoutManager *)self locationForGlyphAtIndex:v39];
          double v43 = v42;
          unint64_t v44 = v39 + v41;
          unint64_t v45 = v39 + 1;
          if (v39 + 1 < v39 + v41)
          {
            uint64_t v46 = v41 - 1;
            do
            {
              [(NSLayoutManager *)self locationForGlyphAtIndex:v45];
              if (v47 < v43) {
                double v43 = v47;
              }
              ++v45;
              --v46;
            }
            while (v46);
          }
          v184[v32] = RangeOfCharacterClusterAtIndex;
          v185[v32] = v43;
          id v23 = v180;
          if (v180)
          {
            int v48 = _NSGlyphTreeBidiLevelForGlyphAtIndex((uint64_t)self, v39);
            v180[v32] = v48;
            char v173 = v48;
            LOBYTE(v181) = (v48 != 0) | v181;
            BYTE4(v181) |= v48 == 0;
            if (([(NSLayoutManager *)self propertyForGlyphAtIndex:v39] & 4) != 0)
            {
              v49.NSUInteger length = length;
              if (length)
              {
                v49.NSUInteger location = range1;
                v195.NSUInteger location = RangeOfCharacterClusterAtIndex;
                v195.NSUInteger length = v36;
                NSRange v50 = NSUnionRange(v49, v195);
                NSUInteger range1 = v50.location;
                NSUInteger length = v50.length;
              }
              else
              {
                NSUInteger length = v36;
                NSUInteger range1 = RangeOfCharacterClusterAtIndex;
              }
            }
            else
            {
              NSUInteger length = 0;
              NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          NSUInteger v51 = v190 + v189;
          if (v37 < v190 + v189) {
            break;
          }
          NSRange v33 = v182;
          unint64_t v31 = range1_8;
LABEL_94:
          ++v32;
          if (v51 >= v31) {
            goto LABEL_129;
          }
        }
        v194[0] = 0;
        uint64_t v52 = [(NSTextStorage *)self->_textStorage attribute:@"NSFont" atIndex:RangeOfCharacterClusterAtIndex effectiveRange:&v187];
        if (v188 + v187 < v190 + v189) {
          goto LABEL_92;
        }
        double v53 = (void *)v52;
        double v54 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:RangeOfCharacterClusterAtIndex effectiveRange:0];
        if (!v53) {
          double v53 = NSDefaultFont();
        }
        int v55 = [v54 BOOLValue];
        if (v54) {
          BOOL v56 = 1;
        }
        else {
          BOOL v56 = v171 == 0;
        }
        char v57 = v56;
        if (v55 || (uint64_t v58 = (uint64_t)v53, (v57 & 1) == 0)) {
          uint64_t v58 = [v53 verticalFont];
        }
        NSRange v59 = v58 ? (void *)v58 : v53;
        NSRange v60 = [(NSLayoutManager *)self substituteFontForFont:v59];
        if (v39 >= v44)
        {
LABEL_92:
          NSRange v33 = v182;
          unint64_t v31 = range1_8;
        }
        else
        {
          unint64_t v61 = v60;
          double v62 = 0.0;
          unint64_t v63 = 1;
          do
          {
            int v64 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v39, 0);
            if (v64)
            {
              unsigned __int16 v65 = v64;
              if (v64 != 0xFFFFFF
                && ![(NSLayoutManager *)self notShownAttributeForGlyphAtIndex:v39])
              {
                unsigned __int16 v186 = v65;
                uint64_t v66 = [(UIFont *)v61 getCaretPositions:v193 forGlyph:v65 maximumLength:16];
                if ((unint64_t)(v66 - 1) > 0xE || v66 + v63 > 0xFF)
                {
                  unint64_t v69 = v63;
                }
                else
                {
                  uint64_t v67 = (double *)v193;
                  do
                  {
                    double v68 = *v67++;
                    unint64_t v69 = v63 + 1;
                    *(double *)&v194[v63++] = v62 + v68;
                    --v66;
                  }
                  while (v66);
                }
                [(UIFont *)v61 _totalAdvancementForNativeGlyphs:&v186 count:1];
                double v62 = v62 + v70;
                unint64_t v63 = v69;
              }
            }
            ++v39;
          }
          while (v39 != v44);
          if (v62 > 0.0 && v63 <= 1)
          {
            unint64_t v71 = v189;
            unint64_t v72 = v190 + v189;
            NSRange v33 = v182;
            unint64_t v31 = range1_8;
            if (v189 < v190 + v189)
            {
              while (1)
              {
                unsigned int v73 = [(__CFString *)v182 characterAtIndex:v71];
                if ((v73 - 1792) >> 9 < 0xB || v73 >> 8 > 0x30 || v73 - 11904 < 0x180) {
                  goto LABEL_93;
                }
                ++v71;
                unint64_t v72 = v190 + v189;
                if (v71 >= v190 + v189) {
                  goto LABEL_98;
                }
              }
            }
            goto LABEL_98;
          }
          NSRange v33 = v182;
          unint64_t v31 = range1_8;
          if (v62 > 0.0)
          {
            unint64_t v72 = v190 + v189;
LABEL_98:
            unint64_t v74 = v32;
            if (v37 < v72)
            {
              unint64_t v74 = v32;
              do
              {
                uint64_t v75 = CFStringGetRangeOfCharacterClusterAtIndex();
                v184[v74 + 1] = v75;
                if (v180) {
                  v174[v74] = v173;
                }
                ++v74;
              }
              while (v75 + v76 < v190 + v189);
            }
            uint64_t v77 = v74 - v32 + 1;
            if (v63 == v77)
            {
              unint64_t v78 = v74 - v32;
              if (v74 >= v32)
              {
                unint64_t v79 = 0;
                do
                {
                  if (v173) {
                    unint64_t v80 = v78;
                  }
                  else {
                    unint64_t v80 = v79;
                  }
                  v185[v32 + v79++] = v43 + *(double *)&v194[v80];
                  --v78;
                }
                while (v32 + v79 <= v74);
              }
            }
            else
            {
              unint64_t v81 = v74 - v32;
              if (v74 >= v32)
              {
                unint64_t v82 = 0;
                double v83 = (double)(unint64_t)v77;
                unint64_t v84 = v32 + 1;
                if (v32 + 1 <= v74 + 1) {
                  unint64_t v84 = v74 + 1;
                }
                unint64_t v85 = v84 - v32;
                unint64_t v86 = (v84 - v32 + 1) & 0xFFFFFFFFFFFFFFFELL;
                uint64x2_t v87 = (uint64x2_t)vdupq_n_s64(v85 - 1);
                NSUInteger v88 = &v170[v32];
                do
                {
                  int32x2_t v89 = vmovn_s64((int64x2_t)vcgeq_u64(v87, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v82), (int8x16_t)xmmword_18E5F73B0)));
                  if (v89.i8[0])
                  {
                    if (v173) {
                      unint64_t v90 = v81;
                    }
                    else {
                      unint64_t v90 = v82;
                    }
                    *(v88 - 1) = v43 + v62 * (double)v90 / v83;
                  }
                  if (v89.i8[4])
                  {
                    unint64_t v91 = v81 - 1;
                    if ((v173 & 1) == 0) {
                      unint64_t v91 = v82 + 1;
                    }
                    *NSUInteger v88 = v43 + v62 * (double)v91 / v83;
                  }
                  v82 += 2;
                  v81 -= 2;
                  v88 += 2;
                }
                while (v86 != v82);
              }
            }
            unint64_t v32 = v74;
          }
        }
LABEL_93:
        NSUInteger v51 = v190 + v189;
        goto LABEL_94;
      }
      uint64_t v181 = 0;
      unint64_t v32 = 0;
      NSUInteger length = 0;
      NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v51 = v176;
LABEL_129:
      HasRightToLeftBaseWritingDirectionAtIndedouble x = 0;
      double v93 = v7 + v29;
      double v94 = v30 - v29;
      if (v23)
      {
        if ((v181 & 0x100000000) == 0)
        {
          uint64_t v95 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"NSParagraphStyle" atIndex:v176 effectiveRange:0];
          unint64_t v96 = v95;
          if (!v95
            || (HasRightToLeftBaseWritingDirectionAtIndedouble x = [v95 baseWritingDirection],
                HasRightToLeftBaseWritingDirectionAtIndex == -1))
          {
            uint64_t v97 = objc_msgSend(v175, "textView", v170);
            if (objc_opt_respondsToSelector()) {
              unint64_t v96 = (void *)[v97 defaultParagraphStyle];
            }
            if (!v96
              || (HasRightToLeftBaseWritingDirectionAtIndedouble x = [v96 baseWritingDirection],
                  HasRightToLeftBaseWritingDirectionAtIndex == -1))
            {
              HasRightToLeftBaseWritingDirectionAtIndedouble x = _NSStringHasRightToLeftBaseWritingDirectionAtIndex(v182, v176, 0, [(__CFString *)v182 length]);
            }
          }
        }
      }
      double v98 = v93 - v6;
      double v99 = v94 - v6;
      v172->_writingDirection = HasRightToLeftBaseWritingDirectionAtIndex;
      if (v32)
      {
        double v100 = v185;
        uint64_t v101 = v185;
        unint64_t v102 = v32;
        double v103 = v99;
        do
        {
          double v104 = *v101++;
          double v105 = v104;
          if (v104 < v103) {
            double v103 = v105;
          }
          if (v105 > v98) {
            double v98 = v105;
          }
          --v102;
        }
        while (v102);
      }
      else
      {
        double v103 = v99;
        double v100 = v185;
      }
      v184[v32] = v51;
      uint64_t v183 = HasRightToLeftBaseWritingDirectionAtIndex;
      if (HasRightToLeftBaseWritingDirectionAtIndex == 1) {
        double v106 = v103;
      }
      else {
        double v106 = v99;
      }
      v100[v32] = v106;
      if (v23) {
        v23[v32] = HasRightToLeftBaseWritingDirectionAtIndex == 1;
      }
      size_t v107 = v32 + 1;
      v172->_unint64_t count = v32 + 1;
      p_unint64_t count = &v172->_count;
      long long v25 = malloc_type_malloc(32 * (v32 + 1), 0x1000040E0EAB150uLL);
      v172->_logicalLeftBoundaries = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_logicalRightBoundaries = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_displayPositions = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      double v109 = (unint64_t *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_displayCharIndexes = v109;
      if (!v25 || !v172->_logicalLeftBoundaries || !v172->_logicalRightBoundaries)
      {
        long long v24 = 0;
        long long v26 = 0;
        long long v27 = 0;
        goto LABEL_174;
      }
      long long v24 = 0;
      if (!v172->_displayPositions)
      {
        long long v26 = 0;
        long long v27 = 0;
        goto LABEL_174;
      }
      long long v26 = 0;
      long long v27 = 0;
      if (!v109)
      {
LABEL_174:
        *p_unint64_t count = 0;
        unint64_t v20 = v172;
        id v23 = v180;
        goto LABEL_175;
      }
      id v23 = v180;
      double v110 = v185;
      if (v32 != -1)
      {
        BOOL v111 = v25 + 2;
        NSUInteger v112 = v184;
        unint64_t v113 = v32 + 1;
        do
        {
          uint64_t v114 = *(void *)v110++;
          *BOOL v111 = v114;
          uint64_t v115 = *v112++;
          *(v111 - 2) = v115;
          v111 += 4;
          --v113;
        }
        while (v113);
        if (v181)
        {
          NSUInteger v116 = v25 + 1;
          uint64_t v117 = v180;
          unint64_t v118 = v32 + 1;
          do
          {
            unsigned int v119 = *v117++;
            *NSUInteger v116 = v119;
            v116 += 4;
            --v118;
          }
          while (v118);
          if (range1 != 0x7FFFFFFFFFFFFFFFLL && length)
          {
            double v120 = v25 + 1;
            unint64_t v121 = v32 + 1;
            do
            {
              NSUInteger v122 = *(v120 - 1);
              BOOL v124 = v122 >= range1;
              NSUInteger v123 = v122 - range1;
              BOOL v124 = !v124 || v123 >= length;
              if (!v124) {
                void *v120 = v180[v32];
              }
              v120 += 4;
              --v121;
            }
            while (v121);
          }
        }
        else
        {
          double v125 = v25 + 1;
          unint64_t v126 = v32 + 1;
          do
          {
            *double v125 = 0;
            v125 += 4;
            --v126;
          }
          while (v126);
        }
      }
      double v127 = v103 + -1.0;
      if (v183 != 1) {
        double v127 = v98 + 1.0;
      }
      double v128 = (double *)&v25[4 * v32];
      v128[2] = v127;
      if (v183 == 1) {
        double v129 = (int (__cdecl *)(const void *, const void *))_NSInsertionPointDisplayCompareR;
      }
      else {
        double v129 = (int (__cdecl *)(const void *, const void *))_NSInsertionPointDisplayCompareL;
      }
      qsort(v25, v32 + 1, 0x20uLL, v129);
      if (v32 == -1)
      {
        v128[3] = v99;
        qsort(v25, 0, 0x20uLL, (int (__cdecl *)(const void *, const void *))_NSInsertionPointLogicalCompare);
        unint64_t v20 = v172;
      }
      else
      {
        double v130 = (double *)(v25 + 2);
        unint64_t v131 = v32 + 1;
        do
        {
          if (*((void *)v130 - 2) == v51) {
            *double v130 = v106;
          }
          v130 += 4;
          --v131;
        }
        while (v131);
        if (v107 >= 2)
        {
          NSUInteger v132 = v25 + 3;
          unint64_t v133 = v32;
          do
          {
            *NSUInteger v132 = v132[3];
            v132 += 4;
            --v133;
          }
          while (v133);
        }
        *(double *)&v25[4 * v32 + 3] = v99;
        unint64_t v20 = v172;
        if (!((v107 == 0) | v181 & 1))
        {
          displayPositions = v172->_displayPositions;
          displayCharIndexes = v172->_displayCharIndexes;
          uint64_t v136 = (double *)(v25 + 2);
          size_t v137 = v107;
          do
          {
            *displayPositions++ = *v136;
            *displayCharIndexes++ = *((void *)v136 - 2);
            v136 += 4;
            --v137;
          }
          while (v137);
        }
        qsort(v25, v107, 0x20uLL, (int (__cdecl *)(const void *, const void *))_NSInsertionPointLogicalCompare);
        if (v107)
        {
          logicalLeftBoundaries = v172->_logicalLeftBoundaries;
          logicalRightBoundaries = v172->_logicalRightBoundaries;
          double v140 = (double *)(v25 + 3);
          size_t v141 = v107;
          do
          {
            *logicalLeftBoundaries++ = *(v140 - 1);
            double v142 = *v140;
            v140 += 4;
            *logicalRightBoundaries++ = v142;
            --v141;
          }
          while (v141);
        }
      }
      if ((v181 & 1) == 0)
      {
        long long v24 = 0;
        long long v26 = 0;
        long long v27 = 0;
        goto LABEL_175;
      }
      long long v26 = malloc_type_malloc(8 * v107, 0x100004000313F17uLL);
      long long v27 = malloc_type_malloc(8 * v107, 0x100004000313F17uLL);
      double v143 = (unsigned __int8 *)malloc_type_malloc(v107, 0x100004077774924uLL);
      long long v24 = v143;
      if (v26 && v27 && v143)
      {
        double v144 = (double *)v25;
        if (!v107)
        {
          qsort(v25, 0, 0x20uLL, v129);
          size_t v147 = 0;
          goto LABEL_244;
        }
        uint64_t v145 = 0;
        int v146 = v25;
        size_t v147 = 0;
        unint64_t v148 = v146 + 3;
        double v149 = v185;
        while (1)
        {
          unint64_t v150 = *(v148 - 3);
          v27[v147] = v150;
          v184[v145] = v150;
          LOBYTE(v150) = *((unsigned char *)v148 - 16);
          v143[v145] = v150;
          v180[v145] = v150;
          uint64_t v151 = *(v148 - 2);
          if (v183 == 1)
          {
            if (v151)
            {
              v185[v145] = *(double *)v148;
              if (!v145 || (*(unsigned char *)(v148 - 6) & 1) != 0) {
                goto LABEL_236;
              }
              uint64_t v153 = *(v148 - 4);
            }
            else if (v145)
            {
              if ((*(unsigned char *)(v148 - 6) & 1) == 0)
              {
                double v152 = *((double *)v148 - 1);
LABEL_235:
                v185[v145] = v152;
                goto LABEL_236;
              }
              v185[v145] = *((double *)v148 - 5);
              uint64_t v153 = *(v148 - 1);
            }
            else
            {
              double *v185 = v99;
              uint64_t v153 = *((void *)v144 + 2);
            }
          }
          else if (v151)
          {
            if (v145)
            {
              if (*(unsigned char *)(v148 - 6))
              {
                double v152 = *(double *)v148;
                goto LABEL_235;
              }
              v185[v145] = *((double *)v148 - 4);
              uint64_t v153 = *v148;
            }
            else
            {
              double *v185 = v103;
              uint64_t v153 = *((void *)v144 + 3);
            }
          }
          else
          {
            v185[v145] = *((double *)v148 - 1);
            if (!v145 || (*(unsigned char *)(v148 - 6) & 1) == 0) {
              goto LABEL_236;
            }
            uint64_t v153 = *(v148 - 5);
          }
          v26[v147++] = v153;
LABEL_236:
          ++v145;
          v148 += 4;
          if (v107 == v145)
          {
            uint64_t v154 = 2;
            size_t v155 = v107;
            do
            {
              double v156 = *v149++;
              v144[v154] = v156;
              v154 += 4;
              --v155;
            }
            while (v155);
            qsort(v144, v107, 0x20uLL, v129);
            double v157 = v20->_displayPositions;
            double v158 = v20->_displayCharIndexes;
            double v159 = v144 + 2;
            do
            {
              *v157++ = *v159;
              *v158++ = *((void *)v159 - 2);
              v159 += 4;
              --v107;
            }
            while (v107);
LABEL_244:
            if (!v147)
            {
              id v23 = v180;
              goto LABEL_256;
            }
            v20->_unint64_t altCount = v147;
            p_unint64_t count = &v20->_altCount;
            v20->_logicalAltPositions = (double *)NSAllocateCollectable(8 * v147, 0);
            v20->_logicalAltCharIndexes = (unint64_t *)NSAllocateCollectable(8 * v147, 0);
            v20->_displayAltPositions = (double *)NSAllocateCollectable(8 * v147, 0);
            double v160 = (unint64_t *)NSAllocateCollectable(8 * v147, 0);
            v20->_displayAltCharIndexes = v160;
            logicalAltPositions = v20->_logicalAltPositions;
            if (logicalAltPositions)
            {
              logicalAltCharIndexes = v20->_logicalAltCharIndexes;
              if (logicalAltCharIndexes)
              {
                if (v20->_displayAltPositions && v160)
                {
                  uint64_t v163 = 0;
                  double v164 = v144 + 2;
                  do
                  {
                    double v165 = *(double *)&v26[v163];
                    logicalAltPositions[v163] = v165;
                    *double v164 = v165;
                    unint64_t v166 = v27[v163];
                    logicalAltCharIndexes[v163] = v166;
                    *((void *)v164 - 2) = v166;
                    *((void *)v164 - 1) = v24[v163++];
                    v164 += 4;
                  }
                  while (v147 != v163);
                  qsort(v144, v147, 0x20uLL, v129);
                  displayAltPositions = v20->_displayAltPositions;
                  displayAltCharIndexes = v20->_displayAltCharIndexes;
                  double v169 = v144 + 2;
                  id v23 = v180;
                  do
                  {
                    *displayAltPositions++ = *v169;
                    *displayAltCharIndexes++ = *((void *)v169 - 2);
                    v169 += 4;
                    --v147;
                  }
                  while (v147);
LABEL_256:
                  long long v25 = v144;
                  break;
                }
              }
            }
            long long v25 = v144;
            goto LABEL_174;
          }
        }
      }
LABEL_175:
      if (v23) {
        free(v23);
      }
      if (v26) {
        free(v26);
      }
      if (v27) {
        free(v27);
      }
      if (v24) {
        free(v24);
      }
      if (v25) {
        free(v25);
      }
    }
  }
  return v20;
}

- (int64_t)getLineFragmentInsertionPointArraysForCharacterAtIndex:(unint64_t)a3 inDisplayOrder:(BOOL)a4 positions:(double *)a5 characterIndexes:(unint64_t *)a6 count:(unint64_t *)a7 alternatePositions:(double *)a8 characterIndexes:(unint64_t *)a9 count:(unint64_t *)a10
{
  BOOL v14 = a4;
  unint64_t v15 = _insertionPointHelperForCharacterAtIndex((uint64_t)self, a3);
  if (v15)
  {
    double v16 = v15;
    int64_t result = v15->_writingDirection;
    if (a5)
    {
      uint64_t v18 = 48;
      if (v14) {
        uint64_t v18 = 80;
      }
      *a5 = *(double **)((char *)&v16->super.isa + v18);
    }
    if (a6)
    {
      uint64_t v19 = 72;
      if (v14) {
        uint64_t v19 = 88;
      }
      *a6 = *(unint64_t **)((char *)&v16->super.isa + v19);
    }
    if (a7) {
      *a7 = v16->_count;
    }
    if (a8)
    {
      uint64_t v20 = 96;
      if (v14) {
        uint64_t v20 = 112;
      }
      *a8 = *(double **)((char *)&v16->super.isa + v20);
    }
    if (a9)
    {
      uint64_t v21 = 104;
      if (v14) {
        uint64_t v21 = 120;
      }
      *a9 = *(unint64_t **)((char *)&v16->super.isa + v21);
    }
    if (a10)
    {
      unint64_t altCount = v16->_altCount;
LABEL_33:
      *a10 = altCount;
    }
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    if (a6) {
      *a6 = 0;
    }
    if (a7) {
      *a7 = 0;
    }
    if (a8) {
      *a8 = 0;
    }
    if (a9) {
      *a9 = 0;
    }
    unint64_t altCount = 0;
    int64_t result = 0;
    if (a10) {
      goto LABEL_33;
    }
  }
  return result;
}

- (id)_selectionRangesForInsertionPointRange:(_NSRange)a3
{
  return 0;
}

- (void)_setDrawsUnderlinesLikeWebKit:(BOOL)a3
{
  extraDatCGFloat a = self->_extraData;
  int v4 = extraData[112];
  if (((((v4 & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v6 = 0x20000;
    }
    else {
      int v6 = 0;
    }
    extraData[112] = v4 & 0xFFFDFFFF | v6;
    uint64_t v7 = [(NSTextStorage *)[(NSLayoutManager *)self textStorage] length];
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v7, 0);
  }
}

- (BOOL)_drawsUnderlinesLikeWebKit
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 1) & 1;
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  extraDatCGFloat a = self->_extraData;
  int v4 = extraData[112];
  if (((((v4 & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v6 = 0x40000;
    }
    else {
      int v6 = 0;
    }
    extraData[112] = v4 & 0xFFFBFFFF | v6;
    uint64_t v7 = [(NSTextStorage *)[(NSLayoutManager *)self textStorage] length];
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v7, 0);
  }
}

- (BOOL)_drawsDebugBaselines
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 2) & 1;
}

- (BOOL)_mirrorsTextAlignment
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 3) & 1;
}

- (void)_setMirrorsTextAlignment:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFF7FFFF | v3;
}

- (BOOL)_forcesTrackingFloor
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 4) & 1;
}

- (void)_setForcesTrackingFloor:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFEFFFFF | v3;
}

- (void)showAttachment:(id)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterIndex:(unint64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v14 = [a3 attachmentCell];
  if (v14)
  {
    -[NSLayoutManager showAttachmentCell:inRect:characterIndex:](self, "showAttachmentCell:inRect:characterIndex:", v14, a6, x, y, width, height);
  }
  else
  {
    if (a3)
    {
      [a3 lineLayoutPadding];
      CGFloat v16 = v15;
      int64_t v17 = [(NSLayoutManager *)self applicationFrameworkContext];
      if (v16 != 0.0)
      {
        v39.origin.double x = x;
        v39.origin.double y = y;
        v39.size.double width = width;
        v39.size.double height = height;
        NSRect v40 = NSInsetRect(v39, v16, 0.0);
        double x = v40.origin.x;
        double y = v40.origin.y;
        double width = v40.size.width;
        double height = v40.size.height;
      }
    }
    else
    {
      int64_t v17 = [(NSLayoutManager *)self applicationFrameworkContext];
    }
    if ([a3 usesTextAttachmentView]
      && (uint64_t v18 = [a5 textView]) != 0
      && (uint64_t v19 = (void *)v18,
          uint64_t v20 = (void *)[a3 viewProviderForParentView:v18 characterIndex:a6 layoutManager:self],
          (uint64_t v21 = [v20 view]) != 0))
    {
      NSUInteger v22 = (void *)v21;
      [v19 contentScaleFactor];
      softLinkUIRectIntegralWithScale(x, y - height, width, height, v23);
      objc_msgSend(a3, "placeView:withFrame:inParentView:characterIndex:layoutManager:", v22, v19, a6, self);
      long long v24 = (void *)*((void *)self->_extraData + 55);
      if (!v24)
      {
        *((void *)self->_extraData + 55) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v24 = (void *)*((void *)self->_extraData + 55);
      }
      [v24 addObject:v20];
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [v22 setHidden:0];
      long long v25 = (void *)MEMORY[0x1E4F39CF8];
      [v25 commit];
    }
    else
    {
      long long v26 = objc_msgSend(a3, "imageForBounds:textContainer:characterIndex:", a5, a6, x, y, width, height);
      uint64_t v27 = [a3 image];
      if (v17 == 2 && v26 == (void *)v27)
      {
        if ([v26 conformsToProtocol:&unk_1EDD8B9A8])
        {
          uint64_t v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "layoutManager"), "textStorage"), "attributesAtIndex:effectiveRange:", a6, 0);
          if ([v26 willProvideAdaptedImageForPresentation]) {
            long long v26 = objc_msgSend(v26, "imageForBounds:attributes:location:textContainer:", v28, 0, a5, x, y, width, height);
          }
        }
      }
      double v29 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
      double v30 = y - height;
      if (v29)
      {
        unint64_t v31 = v29;
        double v32 = x;
        CGPoint v33 = CGContextConvertPointToDeviceSpace(v29, *(CGPoint *)(&v30 - 1));
        v38.double x = floor(v33.x + 0.5);
        v38.double y = floor(v33.y + 0.5);
        CGPoint v36 = CGContextConvertPointToUserSpace(v31, v38);
        double v35 = v36.y;
        double v34 = v36.x;
      }
      else
      {
        double v34 = floor(x + 0.5);
        double v35 = floor(v30 + 0.5);
      }
      objc_msgSend(v26, "drawInRect:", v34, v35, width, height);
    }
  }
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  CFStringRef v5 = (const __CFString *)[(NSTextStorage *)self->_textStorage string];
  RangeOfCharacterClusterAtIndedouble x = CFStringGetRangeOfCharacterClusterAtIndex();
  uint64_t v8 = v7;
  CFIndex v12 = RangeOfCharacterClusterAtIndex;
  uint64_t v13 = v7;
  if (v7 == 2)
  {
    CharacterAtIndedouble x = CFStringGetCharacterAtIndex(v5, RangeOfCharacterClusterAtIndex);
    if (((CFStringGetCharacterAtIndex(v5, RangeOfCharacterClusterAtIndex + 1) + (CharacterAtIndex << 10)) & 0x7FFFFE0) == 0x361CDE0)
    {
      -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", RangeOfCharacterClusterAtIndex, 2, &v12);
      RangeOfCharacterClusterAtIndedouble x = v12;
      uint64_t v8 = v13;
    }
    else
    {
      uint64_t v8 = 2;
    }
  }
  NSUInteger v10 = RangeOfCharacterClusterAtIndex;
  NSUInteger v11 = v8;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (void)_setExtraLineFragmentRect:(CGRect)a3 usedRect:(CGRect)a4 textContainer:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  if (self->_extraLineFragmentContainer)
  {
    memset(&v19, 0, sizeof(v19));
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v19, 0);
    if (!NSIsEmptyRect(v19))
    {
      extraLineFragmentContainer = self->_extraLineFragmentContainer;
      v19.origin.double x = 0.0;
      extraDatCGFloat a = (CFDictionaryRef *)self->_extraData;
      if (extraData[10] == (CFDictionaryRef)extraLineFragmentContainer)
      {
        CGFloat v17 = 0.0;
      }
      else
      {
        if (!CFDictionaryGetValueIfPresent(extraData[11], extraLineFragmentContainer, (const void **)&v19)) {
          goto LABEL_9;
        }
        CGFloat v17 = v19.origin.x;
        if (*(void *)&v19.origin.x == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_9;
        }
      }
      -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", *(void *)&v17, 1, *(void *)&v19.origin.x);
    }
  }
LABEL_9:
  _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, v13, v12, v11, v10, x, y, width, height);
  self->_extraLineFragmentContainer = (NSTextContainer *)a5;
  if (a5)
  {
    v20.origin.double x = v13;
    v20.origin.double y = v12;
    v20.size.double width = v11;
    v20.size.double height = v10;
    if (!NSIsEmptyRect(v20))
    {
      -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", a5, x, y, width, height);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", [(NSTextStorage *)self->_textStorage length], 0);
      if ([a5 textView])
      {
        if (![(NSTextStorage *)self->_textStorage length])
        {
          uint64_t v18 = (void *)[a5 textView];
          [v18 bounds];
          objc_msgSend(v18, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1);
        }
      }
    }
  }
}

- (void)_setTextContainer:(id)a3 forGlyphRange:(_NSRange)a4
{
  id v24 = a3;
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    __n128 v23 = 0uLL;
    containerRuns = self->_containerRuns;
    *(void *)&double v14 = _NSBlockNumberForIndex(containerRuns, a4.location, &v23).n128_u64[0];
    unint64_t v15 = 0;
    if (containerRuns->_gapBlockIndex <= v9) {
      unint64_t v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    if (&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v9)] != a3
      || v23.n128_u64[1] + v23.n128_u64[0] < location + length)
    {
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_containerRuns, "replaceElementsInRange:withElement:coalesceRuns:", location, length, &v24, 1, v14);
    }
    _NSLayoutTreeInvalidateLayoutForGlyphRange((uint64_t)self, location, length, 0, v10, v11, v12, v13, v21);
    if (v24) {
      _NSGlyphTreeResetLayoutAttributesForGlyphsInRange((uint64_t)self, location, length, v16, v17, v18, v19, v20, v22);
    }
  }
}

- (NSParagraphArbitrator)paragraphArbitrator
{
  return (NSParagraphArbitrator *)*((void *)self->_extraData + 53);
}

- (void)setParagraphArbitrator:(id)a3
{
  id v4 = (id)*((void *)self->_extraData + 53);
  if (v4 != a3)
  {
    id v6 = v4;
    if (a3) {
      CFStringRef v5 = (NSParagraphArbitrator *)a3;
    }
    else {
      CFStringRef v5 = -[NSParagraphArbitrator initWithAttributedString:range:]([NSParagraphArbitrator alloc], "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    }
    *((void *)self->_extraData + 53) = v5;
  }
}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  return (CUIStyleEffectConfiguration *)*((void *)self->_extraData + 54);
}

- (void)setStyleEffectConfiguration:(id)a3
{
  extraDatCGFloat a = self->_extraData;
  if ((id)extraData[54] != a3)
  {
    id v4 = (id)extraData[54];
    *((void *)self->_extraData + 54) = [a3 copy];
  }
}

- (id)viewProviderForTextAttachment:(id)a3 characterIndex:(unint64_t)a4
{
  return [(NSLayoutManager *)self temporaryAttribute:@"NSViewTextAttachmentCellHelper" atCharacterIndex:a4 effectiveRange:0];
}

- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 characterIndex:(unint64_t)a5
{
  if (a3) {
    [(NSLayoutManager *)self addTemporaryAttribute:@"NSViewTextAttachmentCellHelper", a3, a5, 1 value forCharacterRange];
  }
}

- (void)beginScrollingForView:(id)a3 textContainer:(id)a4
{
  if (beginScrollingForView_textContainer__onceToken != -1) {
    dispatch_once(&beginScrollingForView_textContainer__onceToken, &__block_literal_global_238);
  }
  if ([(NSLayoutManager *)self hasNonContiguousLayout])
  {
    if ((beginScrollingForView_textContainer__allowsLiveScrollOptimization & 1) == 0)
    {
      *((_DWORD *)self->_extraData + 112) |= 0x200000u;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      *((void *)self->_extraData + 63) = v5;
    }
  }
}

uint64_t __66__NSLayoutManager_NSPrivate__beginScrollingForView_textContainer___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"_NSLayoutManagerDisableLiveScrollingOptimization");
  if (result) {
    beginScrollingForView_textContainer__allowsLiveScrollOptimization = 1;
  }
  return result;
}

- (void)endScrollingForView:(id)a3 textContainer:(id)a4
{
  *((_DWORD *)self->_extraData + 112) &= ~0x200000u;
  if ([(NSLayoutManager *)self hasNonContiguousLayout])
  {
    [a3 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(NSLayoutManager *)self _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:0];
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, 1);
    uint64_t v15 = [(NSMutableArray *)self->_textContainers count];
    uint64_t v16 = [(NSMutableArray *)self->_textContainers count];
    if (v16)
    {
      uint64_t v17 = v16;
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(unsigned char *)(CFStorageGetValueAtIndex() + 64)) {
          [(NSLayoutManager *)self _recalculateUsageForTextContainerAtIndex:i];
        }
      }
    }
    if (v15)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if ((*(unsigned char *)(CFStorageGetValueAtIndex() + 64) & 2) != 0) {
          [(NSLayoutManager *)self _resizeTextViewForTextContainer:[(NSMutableArray *)self->_textContainers objectAtIndex:j]];
        }
      }
    }
    [a3 bounds];
    v33.origin.double x = v20;
    v33.origin.double y = v21;
    v33.size.double width = v22;
    v33.size.double height = v23;
    v31.origin.double x = v8;
    v31.origin.double y = v10;
    v31.size.double width = v12;
    v31.size.double height = v14;
    if (NSEqualRects(v31, v33))
    {
      [a3 visibleRect];
      double x = v32.origin.x;
      double y = v32.origin.y;
      double width = v32.size.width;
      double height = v32.size.height;
      if (!NSIsEmptyRect(v32))
      {
        uint64_t v28 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a4, x, y, width, height);
        if (v29) {
          -[NSLayoutManager _primitiveInvalidateDisplayForGlyphRange:](self, "_primitiveInvalidateDisplayForGlyphRange:", v28, v29);
        }
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture"), "timeIntervalSinceReferenceDate");
  *((void *)self->_extraData + 63) = v30;
}

- (BOOL)isScrolling
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 5) & 1;
}

- (CGRect)prepareLayoutForBoundingRect:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v10 = ![(NSLayoutManager *)self isScrolling];
  if (prepareLayoutForBoundingRect_textContainer__onceToken != -1) {
    dispatch_once(&prepareLayoutForBoundingRect_textContainer__onceToken, &__block_literal_global_244);
  }
  p_extraDatCGFloat a = &self->_extraData;
  while ((*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) != 0)
  {
    uint64_t v12 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", a4, x, y, width, height);
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    unint64_t v29 = 0;
    if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0) {
      unint64_t v16 = v12;
    }
    else {
      unint64_t v16 = 0;
    }
    _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v16, &v29);
    if (v29 >= v13 + v15) {
      break;
    }
    -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v13, v15);
    if (v13 + v15 < [(NSLayoutManager *)self numberOfGlyphs])
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      if (v17 - *((double *)*p_extraData + 63) <= *(double *)&prepareLayoutForBoundingRect_textContainer__timeStampDelta) {
        continue;
      }
    }
    char v10 = 1;
    p_extraDatCGFloat a = &self->_extraData;
  }
  if ([(NSLayoutManager *)self hasNonContiguousLayout] && (v10 & 1) != 0)
  {
    BOOL v18 = [(NSLayoutManager *)self isScrolling];
    *((_DWORD *)*p_extraData + 112) &= ~0x200000u;
    uint64_t v19 = [(NSMutableArray *)self->_textContainers count];
    uint64_t v20 = [(NSMutableArray *)self->_textContainers count];
    if (v20)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(unsigned char *)(CFStorageGetValueAtIndex() + 64)) {
          [(NSLayoutManager *)self _recalculateUsageForTextContainerAtIndex:i];
        }
      }
    }
    if (v19)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if ((*(unsigned char *)(CFStorageGetValueAtIndex() + 64) & 2) != 0) {
          [(NSLayoutManager *)self _resizeTextViewForTextContainer:[(NSMutableArray *)self->_textContainers objectAtIndex:j]];
        }
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *((void *)*p_extraData + 63) = v23;
    if (v18) {
      int v24 = 0x200000;
    }
    else {
      int v24 = 0;
    }
    *((_DWORD *)*p_extraData + 112) = *((_DWORD *)*p_extraData + 112) & 0xFFDFFFFF | v24;
  }
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

uint64_t __73__NSLayoutManager_NSPrivate__prepareLayoutForBoundingRect_textContainer___block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"_NSLayoutManagerLiveScrollResizeTimeStampDelta");
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [v0 doubleValue];
    prepareLayoutForBoundingRect_textContainer__timeStampDeltCGFloat a = v2;
  }
  return result;
}

- (id)underlineColorForTextAlternatives
{
  if ((*((unsigned char *)self->_extraData + 450) & 0x40) != 0) {
    return objc_getAssociatedObject(self, sel_underlineColorForTextAlternatives);
  }
  else {
    return 0;
  }
}

- (void)setUnderlineColorForTextAlternatives:(id)a3
{
  BOOL v4 = a3 != 0;
  objc_setAssociatedObject(self, sel_underlineColorForTextAlternatives, a3, (void *)0x301);
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFBFFFFF | (v4 << 22);
}

- (id)underlineColorForSpelling
{
  if ((*((unsigned char *)self->_extraData + 450) & 0x40) != 0) {
    return objc_getAssociatedObject(self, sel_underlineColorForSpelling);
  }
  else {
    return 0;
  }
}

- (void)setUnderlineColorForSpelling:(id)a3
{
  BOOL v4 = a3 != 0;
  objc_setAssociatedObject(self, sel_underlineColorForSpelling, a3, (void *)0x301);
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFBFFFFF | (v4 << 22);
}

- (int64_t)applicationFrameworkContext
{
  return ((unint64_t)*((unsigned int *)self->_extraData + 112) >> 23) & 7;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3) {
    LOBYTE(a3) = _NSTextScalingTypeForCurrentEnvironment();
  }
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFC7FFFFF | ((a3 & 7) << 23);
}

- (id)renderingColorForDocumentColor:(id)a3
{
  int v5 = *((_DWORD *)self->_extraData + 112);
  if ((v5 & 0x8000000) == 0) {
    goto LABEL_4;
  }
  id result = (id)objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:renderingColorForDocumentColor:", self, a3);
  if (!result)
  {
    int v5 = *((_DWORD *)self->_extraData + 112);
LABEL_4:
    if ((v5 & 0x10000000) != 0) {
      id result = (id)[self->_firstTextView renderingColorForDocumentColor:a3];
    }
    else {
      id result = 0;
    }
  }
  if (!result) {
    return a3;
  }
  return result;
}

- (void)fillMarkedBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6
{
  unint64_t v6 = a4;
  if ((*((unsigned char *)self->_extraData + 451) & 0x20) != 0)
  {
    if (a4)
    {
      CGFloat v8 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", a3, a4, a5.location, a5.length, a6), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
      CGContextSaveGState(v8);
      CGContextSetShouldAntialias(v8, 1);
      p_CGSize size = &a3->size;
      do
      {
        CGRect v12 = *(CGRect *)&p_size[-1].width;
        p_size += 2;
        char v10 = CGPathCreateWithRoundedRect(v12, 3.0, 3.0, 0);
        CGContextAddPath(v8, v10);
        CGContextFillPath(v8);
        CGPathRelease(v10);
        --v6;
      }
      while (v6);
      CGContextRestoreGState(v8);
    }
  }
  else
  {
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](self, "fillBackgroundRectArray:count:forCharacterRange:color:", a3, a4, a5.location, a5.length, a6);
  }
}

- (id)_stringForLoggingLineFragmentForGlyphAtIndex:(int64_t)a3
{
  if ([(NSLayoutManager *)self numberOfGlyphs] <= a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSLayoutManager_Private.m", 6630, @"Glyph index %ld is out-of-bounds for %@", a3, self);
  }
  -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", a3, 1);
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Line Fragment @ %ld", a3);
  v28.NSUInteger location = 0;
  v28.NSUInteger length = 0;
  [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:a3 effectiveRange:&v28];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:a3 effectiveRange:0];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  uint64_t v23 = NSStringFromRange(v28);
  v30.origin.double x = v8;
  v30.origin.double y = v10;
  v30.size.double width = v12;
  v30.size.double height = v14;
  int v24 = NSStringFromRect(v30);
  v31.origin.double x = v16;
  v31.origin.double y = v18;
  v31.size.double width = v20;
  v31.size.double height = v22;
  [v6 appendFormat:@", glyph range %@, rects %@/%@", v23, v24, NSStringFromRect(v31)];
  for (NSUInteger i = v28.location; i < v28.length + v28.location; ++i)
  {
    unsigned int v26 = [(NSLayoutManager *)self CGGlyphAtIndex:i];
    [(NSLayoutManager *)self locationForGlyphAtIndex:i];
    [v6 appendFormat:@"\n %ld: %hu %@", i, v26, NSStringFromPoint(v29)];
  }
  return v6;
}

+ (BOOL)_usesScreenFonts
{
  return __NSUsesScreenFonts;
}

+ (BOOL)_ignoresViewTransformations
{
  return __NSIgnoresViewTransformations;
}

+ (BOOL)_showsInvisibleCharacters
{
  return __NSShowsInvisibleCharacters;
}

+ (BOOL)_showsControlCharacters
{
  return __NSShowsControlCharacters;
}

- (void)_commonInit
{
  self->_textContainers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
  self->_containerUsedRects = [+[NSStorage allocWithZone:[(NSLayoutManager *)self zone]] initWithElementSize:120 capacity:0];
  *(_DWORD *)&self->_lmFlags &= 0xFFFF3FFF;
  self->_containerRuns = (NSRunStorage *)[(NSRunStorage *)+[NSIdRunStorage allocWithZone:[(NSLayoutManager *)self zone]] initWithElementSize:8 capacity:0];
  int v3 = [+[NSExtraLMData allocWithZone:[(NSLayoutManager *)self zone]] init];
  v3->_hyphenationFactor = 0.0;
  CGPoint v7 = (CGPoint)*MEMORY[0x1E4F28AD8];
  CGSize v8 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  v3->_currentAttachmentRect.CGPoint origin = (CGPoint)*MEMORY[0x1E4F28AD8];
  v3->_currentAttachmentRect.CGSize size = v8;
  v3->_currentAttachmentIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  v3->_textContainerIndexes = CFDictionaryCreateMutable(0, 0, 0, 0);
  v3->_textContainerGlyphIndexes = CFDictionaryCreateMutable(0, 0, 0, 0);
  v3->_typesetterBehavior = +[NSTypesetter defaultTypesetterBehavior];
  v3->_cachedFontBounds.CGPoint origin = v7;
  v3->_cachedFontBounds.CGSize size = v8;
  *(_OWORD *)&v3->_cachedUnderlineThickness = 0u;
  *(_OWORD *)&v3->_cachedUnderlineAdjustment = 0u;
  v3->_cachedUnderlineRange.NSUInteger length = 0;
  CGSize v4 = (CGSize)*MEMORY[0x1E4F28AE0];
  v3->_firstTextViewVisibleCharRange = (_NSRange)xmmword_18E5F72A0;
  v3->_firstTextViewVisibleOffset = v4;
  v3->_lastInvalidatedCharRange.NSUInteger length = 0;
  v3->_lastInvalidatedLongitudinalPosition = 0.0;
  v3->_lastInvalidatedCharRange.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  v3->_paragraphArbitrator = -[NSParagraphArbitrator initWithAttributedString:range:]([NSParagraphArbitrator alloc], "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  v3->_lmFlags2 = (__lmFlags2)(*(_DWORD *)&v3->_lmFlags2 & 0xFC7FFFFF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 23));
  if (_allocExtraData_onceToken != -1) {
    dispatch_once(&_allocExtraData_onceToken, &__block_literal_global_539);
  }
  v3->_lmFlags2 = (__lmFlags2)(*(_DWORD *)&v3->_lmFlags2 & 0xBFFFFFFF | (__NSUsesDefaultHyphenation << 30));
  self->_extraDatCGFloat a = v3;
  if (!self->_textContainers || !self->_containerRuns || !self->_containerUsedRects)
  {
    uint64_t v5 = _NSFullMethodName();
    [(NSLayoutManager *)self dealloc];
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A0], @"*** %@: memory allocation failed.", v5 format];
  }
  _NSGlyphTreeCreate((uint64_t)self);
  _NSLayoutTreeCreate((uint64_t)self);
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xDA1FF1EB | (4
                                                                        * __NSBackgroundLayoutEnabled) | (16 * __NSUsesScreenFonts) | (__NSShowsInvisibleCharacters << 10) | (__NSShowsControlCharacters << 11) | (__NSIgnoresViewTransformations << 26) | (__NSAllowsNonContiguousLayout << 29) | 0x1000200);
  self->_deferredDisplayCharRange = (_NSRange)xmmword_18E5F72A0;
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  self->_cachedFontCharRange = (_NSRange)xmmword_18E5F72A0;
  *(int64x2_t *)&self->_firstUnlaidGlyphIndedouble x = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_newlyFilledGlyphRange = (_NSRange)xmmword_18E5F72A0;
  uint64_t v6 = __NSFillBackgroundRectArray;
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xDFFFFFFF | ((v6 == [(NSLayoutManager *)self methodForSelector:sel_fillBackgroundRectArray_count_forCharacterRange_color_]) << 29);
  if (__NSForcesOldShowGlyphs) {
    *((_DWORD *)self->_extraData + 112) |= 0x10000u;
  }
}

- (NSLayoutManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSLayoutManager;
  uint64_t v2 = [(NSLayoutManager *)&v5 init];
  int v3 = v2;
  if (v2) {
    [(NSLayoutManager *)v2 _commonInit];
  }
  return v3;
}

- (void)finalize
{
  _NSGlyphTreeFree((uint64_t)self);
  _NSLayoutTreeFree((uint64_t)self);
  _freeExtraData((uint64_t)self->_extraData);
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutManager;
  [(NSLayoutManager *)&v3 finalize];
}

- (void)dealloc
{
  if (*((unsigned char *)&self->_lmFlags + 1)) {
    _NSRemoveDirtyLayoutManager((uint64_t)self);
  }
  self->_id firstTextView = objc_storeWeak(&self->_firstTextView, 0);
  [(NSLayoutManager *)self setDelegate:0];

  textContainers = self->_textContainers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__NSLayoutManager_dealloc__block_invoke;
  v7[3] = &unk_1E55C5C38;
  v7[4] = self;
  [(NSMutableArray *)textContainers enumerateObjectsUsingBlock:v7];

  _NSGlyphTreeFree((uint64_t)self);
  _NSLayoutTreeFree((uint64_t)self);
  _freeExtraData((uint64_t)self->_extraData);
  cachedRectArradouble y = self->_cachedRectArray;
  if (cachedRectArray) {
    NSZoneFree(0, cachedRectArray);
  }
  glyphBuffer = self->_glyphBuffer;
  if (glyphBuffer) {
    NSZoneFree(0, glyphBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSLayoutManager;
  [(NSLayoutManager *)&v6 dealloc];
}

uint64_t __26__NSLayoutManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _hasLayoutManager:*(void *)(a1 + 32)];
  if (result)
  {
    return [a2 setLayoutManager:0];
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    __lmFlags lmFlags = self->_lmFlags;
    uint64_t v6 = (*(unsigned char *)&lmFlags & 4 | (*(unsigned int *)&lmFlags >> 22) & 3 | (*(unsigned int *)&lmFlags >> 7) & 0x18 | (32 * ((*(unsigned int *)&lmFlags >> 4) & 1)) | (*(unsigned int *)&lmFlags >> 18) & 0x40 | (*(unsigned int *)&lmFlags >> 22) & 0x80 | (*(unsigned int *)&lmFlags >> 13) & 0x100 | (*((_DWORD *)self->_extraData + 112) >> 17) & 0x200) ^ 0x20;
    [a3 encodeObject:self->_textStorage forKey:@"NSTextStorage"];
    [a3 encodeObject:self->_textContainers forKey:@"NSTextContainers"];
    extraDatCGFloat a = (double *)self->_extraData;
    double v8 = extraData[24];
    if (v8 != 0.0)
    {
      *(float *)&double v8 = v8;
      [a3 encodeFloat:@"NSHyphenationFactor" forKey:v8];
      extraDatCGFloat a = (double *)self->_extraData;
    }
    if ((*((unsigned char *)extraData + 451) & 0x40) != 0) {
      [a3 encodeBool:1 forKey:@"NSUsesDefaultHyphenation"];
    }
    [a3 encodeInt:v6 forKey:@"NSLMFlags"];
    id v9 = [(NSLayoutManager *)self delegate];
    [a3 encodeConditionalObject:v9 forKey:@"NSDelegate"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** NSLayoutManager does not support non-keyed coding.", _NSFullMethodName() format];
  }
}

- (NSLayoutManager)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    long long v38 = 0u;
    memset(v39, 0, 56);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    [(NSLayoutManager *)self _commonInit];
    [(NSCoder *)coder decodeFloatForKey:@"NSHyphenationFactor"];
    *((double *)self->_extraData + 24) = v5;
    if ([(NSCoder *)coder containsValueForKey:@"NSUsesDefaultHyphenation"]) {
      int v6 = [(NSCoder *)coder decodeBoolForKey:@"NSUsesDefaultHyphenation"];
    }
    else {
      int v6 = __NSUsesDefaultHyphenation;
    }
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xBFFFFFFF | (v6 << 30);
    unsigned int v7 = [(NSCoder *)coder decodeIntForKey:@"NSLMFlags"];
    if (((__NSBackgroundLayoutEnabled != 0) & ((v7 & 4) >> 2)) != 0) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
    unsigned int v9 = v8 | *(_DWORD *)&self->_lmFlags & 0xDE1FF3EB | ((v7 & 3) << 22) | (((__NSShowsInvisibleCharacters | v7 & 8) != 0) << 10) | (((__NSShowsControlCharacters | v7 & 0x10) != 0) << 11);
    if ((v7 & 0x20) != 0 || __NSUsesScreenFonts == 0) {
      int v11 = 0;
    }
    else {
      int v11 = 16;
    }
    self->___lmFlags lmFlags = (__lmFlags)((v7 << 13) & 0x200000 | (((__NSAllowsNonContiguousLayout | v7 & 0x80) != 0) << 29) | v11 & 0xFEFFFFFF | (((v7 >> 6) & 1) << 24) | v9);
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFBFFFFFF | (((v7 >> 9) & 1) << 26);

    if ([(NSCoder *)coder requiresSecureCoding]) {
      CGFloat v12 = (NSMutableArray *)[(NSArray *)[(NSCoder *)coder decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NSTextContainers"] mutableCopy];
    }
    else {
      CGFloat v12 = (NSMutableArray *)[(NSCoder *)coder decodeObjectForKey:@"NSTextContainers"];
    }
    self->_textContainers = v12;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
    long long v35 = *MEMORY[0x1E4F28AD8];
    long long v36 = v13;
    long long v37 = 0uLL;
    __asm { FMOV            V2.2D, #-1.0 }
    long long v38 = _Q2;
    LODWORD(v39[0]) = 0;
    *(_OWORD *)((char *)v39 + 8) = v35;
    *(_OWORD *)((char *)&v39[1] + 8) = v13;
    *(_OWORD *)((char *)&v39[2] + 8) = xmmword_18E5F72A0;
    uint64_t v18 = [(NSMutableArray *)v12 count];
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t i = 0; i != v19; ++i)
        [(NSStorage *)self->_containerUsedRects insertElements:&v35 count:1 atIndex:i];
    }
    textContainers = self->_textContainers;
    CGFloat v22 = (__CFDictionary *)*((void *)self->_extraData + 11);
    unint64_t v23 = [(NSMutableArray *)textContainers count];
    if (v23) {
      int v24 = (void *)[(NSMutableArray *)textContainers objectAtIndex:0];
    }
    else {
      int v24 = 0;
    }
    [v24 size];
    double v26 = v25;
    CFDictionaryRemoveAllValues(v22);
    *((void *)self->_extraData + 10) = v24;
    __lmFlags lmFlags = self->_lmFlags;
    if (v23 != 1 || (*(_DWORD *)&lmFlags & 0x20000000) == 0)
    {
      self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xBFFFFFFF);
      if (v23 >= 2)
      {
        for (uint64_t j = 1; j != v23; ++j)
          CFDictionarySetValue(v22, (const void *)[(NSMutableArray *)textContainers objectAtIndex:j], (const void *)j);
      }
    }
    else
    {
      int v30 = [v24 isSimpleRectangularTextContainer];
      BOOL v31 = v26 >= 10000000.0;
      if (v26 <= 0.0) {
        BOOL v31 = 1;
      }
      if ((v30 & v31) != 0) {
        int v32 = 0x40000000;
      }
      else {
        int v32 = 0;
      }
      self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v32);
    }
    objc_msgSend(-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSTextStorage"), "addLayoutManager:", self);
    [(NSLayoutManager *)self _firstTextViewChanged];
    id v33 = [(NSCoder *)coder decodeObjectForKey:@"NSDelegate"];
    if (v33) {
      [(NSLayoutManager *)self setDelegate:v33];
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@ *** NSLayoutManager does not support non-keyed coding.", _NSFullMethodName() format];
  }
  return self;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NSLayoutManager;
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", -[NSLayoutManager description](&v7, sel_description)];
  uint64_t v4 = [(NSMutableArray *)self->_textContainers count];
  textStorage = self->_textStorage;
  if (textStorage) {
    textStorage = (NSTextStorage *)[(NSTextStorage *)textStorage length];
  }
  [v3 appendFormat:@"    %lu containers, text backing has %lu characters\n", v4, textStorage];
  objc_msgSend(v3, "appendFormat:", @"    Currently holding %lu glyphs", *(void *)(*((void *)self->_extraData + 26) + 8));
  [v3 appendString:@".\n"];
  [v3 appendFormat:@"    %@\n", _NSGlyphTreeSummaryDescription((uint64_t)self)];
  [v3 appendFormat:@"    %@\n", _NSLayoutTreeSummaryDescription((uint64_t)self)];
  return v3;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (id)attributedString
{
  return self->_textStorage;
}

- (void)setTextStorage:(NSTextStorage *)textStorage
{
  uint64_t v5 = [(NSMutableArray *)self->_textContainers count];
  if ((*(unsigned char *)&self->_lmFlags & 8) == 0) {
    ++self->_textViewResizeDisableStack;
  }
  self->_textStorage = textStorage;
  _NSGlyphTreeFree((uint64_t)self);
  _NSGlyphTreeCreate((uint64_t)self);
  unint64_t v6 = [(NSRunStorage *)self->_containerRuns count];
  if (v6)
  {
    unint64_t v7 = v6;
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", 0, v6, 1);
    int v8 = (void *)*((void *)self->_extraData + 23);
    if (v8) {
      _NSDeleteGlyphRangeFromTextBlocks(v8, 0, v7);
    }
  }
  _NSLayoutTreeFree((uint64_t)self);
  *(void *)&double v9 = _NSLayoutTreeCreate((uint64_t)self).n128_u64[0];
  extraDatCGFloat a = self->_extraData;
  int v11 = (void *)extraData[23];
  if (v11)
  {
    _NSRemoveTextBlocksStartingAtGlyphIndex(v11, 0);

    *((void *)self->_extraData + 23) = 0;
    extraDatCGFloat a = self->_extraData;
    if (extraData[52])
    {
      [(NSLayoutManager *)self _setRowArrayCache:0];
      extraDatCGFloat a = self->_extraData;
    }
  }
  CGFloat v12 = (void *)extraData[25];
  if (v12)
  {

    *((void *)self->_extraData + 25) = 0;
  }
  self->_firstUnlaidGlyphIndedouble x = 0;
  self->_firstUnlaidCharIndedouble x = 0;
  if (v5) {
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, v5, v9);
  }
  __lmFlags lmFlags = self->_lmFlags;
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xF5EFFFFC);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  self->_cachedFontCharRange = (_NSRange)xmmword_18E5F72A0;
  self->_extraLineFragmentContainer = 0;
  CGFloat v14 = self->_textStorage;
  if (v14)
  {
    uint64_t v15 = [(NSTextStorage *)v14 length];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v22 = 0;
      -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v22, 0, v15, 1);
      double v17 = (void *)*((void *)self->_extraData + 23);
      if (v17) {
        _NSInsertGlyphRangeInTextBlocks(v17, 0, v16);
      }
      [(NSLayoutManager *)self _markSelfAsDirtyForBackgroundLayout:self];
    }
    else if ([(NSMutableArray *)self->_textContainers count])
    {
      uint64_t v22 = 0;
      [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:0 maxNumberOfLineFragments:1 nextGlyphIndex:&v22];
      [(NSLayoutManager *)self _invalidateInsertionPoint];
    }
    if (objc_opt_respondsToSelector()) {
      int v19 = 0x10000;
    }
    else {
      int v19 = 0;
    }
    unsigned int v18 = *(_DWORD *)&self->_lmFlags & 0xFFFEFFFF | v19;
  }
  else
  {
    unsigned int v18 = *(_DWORD *)&lmFlags & 0xF5EEFFFC;
  }
  self->___lmFlags lmFlags = (__lmFlags)v18;
  [(NSLayoutManager *)self _clearTemporaryAttributes];
  textContainers = self->_textContainers;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__NSLayoutManager_setTextStorage___block_invoke;
  v21[3] = &unk_1E55C5C38;
  v21[4] = self;
  [(NSMutableArray *)textContainers enumerateObjectsUsingBlock:v21];
  _enableTextViewResizing_0((uint64_t)self);
}

uint64_t __34__NSLayoutManager_setTextStorage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 layoutManager];
  if (result == *(void *)(a1 + 32))
  {
    return [a2 setLayoutManager:result];
  }
  return result;
}

- (void)replaceTextStorage:(NSTextStorage *)newTextStorage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!newTextStorage) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** %@: nil NSTextStorage given.  You must supply a NSTextStorage.", _NSFullMethodName() format];
  }
  textStorage = self->_textStorage;
  if (textStorage)
  {
    unint64_t v6 = textStorage;
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", -[NSTextStorage layoutManagers](v6, "layoutManagers"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [(NSTextStorage *)v6 removeLayoutManager:v12];
          [(NSTextStorage *)newTextStorage addLayoutManager:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(NSTextStorage *)newTextStorage addLayoutManager:self];
  }
}

- (NSGlyphGenerator)glyphGenerator
{
  uint64_t result = self->_glyphGenerator;
  if (!result) {
    return (NSGlyphGenerator *)+[NSGlyphGenerator defaultGlyphGenerator];
  }
  return result;
}

- (void)setGlyphGenerator:(NSGlyphGenerator *)glyphGenerator
{
  if (self->_glyphGenerator != glyphGenerator)
  {
    uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
    unint64_t v6 = self->_glyphGenerator;
    self->_glyphGenerator = glyphGenerator;
    if (v5)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
    }
  }
}

- (NSTypesetter)typesetter
{
  if (self->_typesetter) {
    return self->_typesetter;
  }
  else {
    return (NSTypesetter *)+[NSTypesetter sharedSystemTypesetterForBehavior:*((void *)self->_extraData + 13)];
  }
}

- (void)setTypesetter:(NSTypesetter *)typesetter
{
  if (self->_typesetter != typesetter)
  {
    uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
    unint64_t v6 = self->_typesetter;
    self->_typesetter = typesetter;
    if (v5)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
    }
  }
}

- (id)delegate
{
  objc_sync_enter(self);
  p_delegate = &self->_delegate;
  if (self->_delegateIsWeakValue) {
    id Weak = (id)[*p_delegate weakObjectValue];
  }
  else {
    id Weak = objc_loadWeak(p_delegate);
  }
  uint64_t v5 = Weak;
  objc_sync_exit(self);
  return v5;
}

- (void)setDelegate:(id)delegate
{
  objc_sync_enter(self);
  if (self->_delegateIsWeakValue) {

  }
  objc_storeWeak(&self->_delegate, delegate);
  self->_delegateIsWeakValue = 0;
  objc_sync_exit(self);
  if (delegate)
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = 4096;
    }
    else {
      int v5 = 0;
    }
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFEFFF | v5);
    if (objc_opt_respondsToSelector()) {
      int v6 = 0x2000;
    }
    else {
      int v6 = 0;
    }
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFDFFF | v6);
    if (objc_opt_respondsToSelector()) {
      int v7 = 4096;
    }
    else {
      int v7 = 0;
    }
    extraDatCGFloat a = self->_extraData;
    p_extraDatCGFloat a = &self->_extraData;
    extraData[112] = extraData[112] & 0xFFFFEFFF | v7;
    if (objc_opt_respondsToSelector()) {
      int v10 = 0x8000000;
    }
    else {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
    int v11 = self->_extraData;
    p_extraDatCGFloat a = &self->_extraData;
    *((_DWORD *)p_extraData - 44) &= 0xFFFFCFFF;
    v11[112] &= ~0x1000u;
  }
  *((_DWORD *)*p_extraData + 112) = *((_DWORD *)*p_extraData + 112) & 0xF7FFFFFF | v10;
}

- (NSArray)textContainers
{
  return &self->_textContainers->super;
}

- (_NSRange)_characterRangeCurrentlyInAndAfterContainer:(id)a3
{
  NSUInteger v5 = [(NSTextStorage *)self->_textStorage length];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = [(NSMutableArray *)self->_textContainers count];
    unint64_t v8 = v7;
    if (a3)
    {
      NSRect value = 0;
      extraDatCGFloat a = (CFDictionaryRef *)self->_extraData;
      if (extraData[10] == a3)
      {
        unint64_t v10 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&value))
      {
        unint64_t v10 = (unint64_t)value;
      }
      else
      {
        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v10 = v7;
    }
    do
    {
      if (v8 == v10) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = [(NSMutableArray *)self->_textContainers objectAtIndex:v10];
      }
      unint64_t v13 = [(NSLayoutManager *)self _indexOfFirstGlyphInTextContainer:v12 okToFillHoles:0];
      NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        NSUInteger v5 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v13);
      }
      ++v10;
    }
    while (v10 <= v8 && v5 == 0x7FFFFFFFFFFFFFFFLL);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v11 = 0;
    }
    else {
      NSUInteger v11 = v6 - v5;
    }
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v5 = 0;
    }
  }
  else
  {
    NSUInteger v11 = 0;
  }
  result.NSUInteger length = v11;
  result.NSUInteger location = v5;
  return result;
}

- (void)addTextContainer:(NSTextContainer *)container
{
  uint64_t v5 = [(NSMutableArray *)self->_textContainers count];

  [(NSLayoutManager *)self insertTextContainer:container atIndex:v5];
}

- (void)insertTextContainer:(NSTextContainer *)container atIndex:(NSUInteger)index
{
  uint64_t v7 = [(NSTextStorage *)self->_textStorage length];
  NSUInteger v8 = [(NSMutableArray *)self->_textContainers count];
  uint64_t v9 = [(NSTextContainer *)container textView];
  if (v8 < index) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"*** %@: container index %lu is beyond the range of containers (count %lu)", _NSFullMethodName(), index, v8 format];
  }
  uint64_t v40 = 0;
  if (!v7)
  {
    BOOL v13 = 0;
    if (index || !v8) {
      goto LABEL_20;
    }
    long long v14 = self;
    NSUInteger v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
LABEL_15:
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0) {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v8, v7, 0);
    }
    long long v14 = self;
    NSUInteger v15 = v8;
    uint64_t v16 = v7;
LABEL_18:
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](v14, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v15, v16, 0);
    goto LABEL_19;
  }
  if (v8 != index)
  {
    uint64_t v10 = [(NSLayoutManager *)self _characterRangeCurrentlyInAndAfterContainer:[(NSMutableArray *)self->_textContainers objectAtIndex:index]];
    if (!v11)
    {
LABEL_19:
      BOOL v13 = 0;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  uint64_t v10 = [(NSLayoutManager *)self _characterRangeCurrentlyInAndAfterContainer:0];
  if (v11)
  {
LABEL_14:
    NSUInteger v8 = v10;
    uint64_t v7 = v11;
    goto LABEL_15;
  }
  unint64_t v35 = 0;
  firstUnlaidCharIndedouble x = self->_firstUnlaidCharIndex;
  if (firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:&v35 glyphIndex:0];
    firstUnlaidCharIndedouble x = v35;
  }
  BOOL v13 = firstUnlaidCharIndex == v7;
LABEL_20:
  *(_DWORD *)&self->_lmFlags &= ~1u;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
  v36[0] = *MEMORY[0x1E4F28AD8];
  v36[1] = v17;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  __asm { FMOV            V2.2D, #-1.0 }
  long long v39 = _Q2;
  LODWORD(v40) = 0;
  long long v41 = v36[0];
  long long v42 = v17;
  long long v43 = xmmword_18E5F72A0;
  [(NSStorage *)self->_containerUsedRects insertElements:v36 count:1 atIndex:index];
  [(NSMutableArray *)self->_textContainers insertObject:container atIndex:index];
  textContainers = self->_textContainers;
  int v24 = (__CFDictionary *)*((void *)self->_extraData + 11);
  unint64_t v25 = [(NSMutableArray *)textContainers count];
  if (v25) {
    double v26 = (void *)[(NSMutableArray *)textContainers objectAtIndex:0];
  }
  else {
    double v26 = 0;
  }
  [v26 size];
  double v28 = v27;
  CFDictionaryRemoveAllValues(v24);
  *((void *)self->_extraData + 10) = v26;
  __lmFlags lmFlags = self->_lmFlags;
  if (v25 == 1 && (*(_DWORD *)&lmFlags & 0x20000000) != 0)
  {
    int v30 = [v26 isSimpleRectangularTextContainer];
    BOOL v31 = v28 >= 10000000.0;
    if (v28 <= 0.0) {
      BOOL v31 = 1;
    }
    if ((v30 & v31) != 0) {
      int v32 = 0x40000000;
    }
    else {
      int v32 = 0;
    }
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v32);
  }
  else
  {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xBFFFFFFF);
    if (v25 >= 2)
    {
      for (uint64_t i = 1; i != v25; ++i)
        CFDictionarySetValue(v24, (const void *)[(NSMutableArray *)textContainers objectAtIndex:i], (const void *)i);
    }
  }
  [(NSTextContainer *)container setLayoutManager:self];
  if (v9) {
    [(NSLayoutManager *)self _firstTextViewChanged];
  }
  if (v13 || !index && (textStorage = self->_textStorage) != 0 && ![(NSTextStorage *)textStorage length])
  {
    unint64_t v35 = 0;
    [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:*(void *)(*((void *)self->_extraData + 26) + 8) maxNumberOfLineFragments:1 nextGlyphIndex:&v35];
    [(NSLayoutManager *)self _invalidateInsertionPoint];
  }
  *(_DWORD *)&self->_lmFlags |= 0x40000u;
}

- (void)removeTextContainerAtIndex:(NSUInteger)index
{
  uint64_t v26 = [(NSTextStorage *)self->_textStorage length];
  NSUInteger v5 = [(NSMutableArray *)self->_textContainers count];
  if (v5 <= index) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"*** %@: container index %lu is beyond the range of containers (%lu)", _NSFullMethodName(), index, v5 format];
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(unsigned char *)&lmFlags & 0x40) == 0) {
    ++self->_displayInvalidationDisableStack;
  }
  if ((*(unsigned char *)&lmFlags & 8) == 0) {
    ++self->_textViewResizeDisableStack;
  }
  uint64_t v7 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:index];
  uint64_t v8 = [(NSTextContainer *)v7 textView];
  uint64_t v9 = [(NSLayoutManager *)self _characterRangeCurrentlyInAndAfterContainer:v7];
  uint64_t v11 = v10;
  *(_DWORD *)&self->_lmFlags &= ~1u;
  [(NSTextContainer *)v7 setLayoutManager:0];
  uint64_t v12 = v7;
  [(NSMutableArray *)self->_textContainers removeObjectAtIndex:index];
  textContainers = self->_textContainers;
  long long v14 = (__CFDictionary *)*((void *)self->_extraData + 11);
  unint64_t v15 = [(NSMutableArray *)textContainers count];
  if (v15) {
    uint64_t v16 = (void *)[(NSMutableArray *)textContainers objectAtIndex:0];
  }
  else {
    uint64_t v16 = 0;
  }
  [v16 size];
  double v18 = v17;
  CFDictionaryRemoveAllValues(v14);
  *((void *)self->_extraData + 10) = v16;
  __lmFlags v19 = self->_lmFlags;
  if (v15 == 1 && (*(_DWORD *)&v19 & 0x20000000) != 0)
  {
    int v20 = [v16 isSimpleRectangularTextContainer];
    BOOL v21 = v18 >= 10000000.0;
    if (v18 <= 0.0) {
      BOOL v21 = 1;
    }
    if ((v20 & v21) != 0) {
      int v22 = 0x40000000;
    }
    else {
      int v22 = 0;
    }
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v22);
  }
  else
  {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v19 & 0xBFFFFFFF);
    if (v15 >= 2)
    {
      for (uint64_t i = 1; i != v15; ++i)
        CFDictionarySetValue(v14, (const void *)[(NSMutableArray *)textContainers objectAtIndex:i], (const void *)i);
    }
  }
  [(NSStorage *)self->_containerUsedRects removeElementAtIndex:index];
  CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), v7);
  if (v7 == self->_extraLineFragmentContainer)
  {
    _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24), *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
    self->_extraLineFragmentContainer = 0;
    if (v11)
    {
LABEL_23:
      if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0) {
        -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v9, v11, 0);
      }
      goto LABEL_28;
    }
  }
  else if (v11)
  {
    goto LABEL_23;
  }
  if (!v26)
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
LABEL_28:
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v9, v11, 0);
  }
  _enableTextViewResizing_0((uint64_t)self);
  __lmFlags v24 = self->_lmFlags;
  if ((*(unsigned char *)&v24 & 0x40) == 0)
  {
    if (!self->_displayInvalidationDisableStack
      || (unsigned __int16 v25 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v25) == 0))
    {
      self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v24 | 0x40);
      [(NSLayoutManager *)self _invalidateDisplayIfNeeded];
      __lmFlags v24 = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFBF);
      self->___lmFlags lmFlags = v24;
    }
  }
  if (v8)
  {
    [(NSLayoutManager *)self _firstTextViewChanged];
    __lmFlags v24 = self->_lmFlags;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v24 | 0x40000);
}

- (void)textContainerChangedGeometry:(NSTextContainer *)container
{
  NSRect value = 0;
  extraDatCGFloat a = self->_extraData;
  if (*((NSTextContainer **)extraData + 10) != container
    && (!CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value)
     || value == (void *)0x7FFFFFFFFFFFFFFFLL))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** %@: given container does not appear in the list of containers for this NSLayoutManager.", _NSFullMethodName() format];
  }
  uint64_t v7 = [(NSLayoutManager *)self _characterRangeCurrentlyInAndAfterContainer:container];
  uint64_t v8 = v6;
  if (v6)
  {
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0) {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v7, v6, 0);
    }
    goto LABEL_9;
  }
  if (![(NSTextStorage *)[(NSLayoutManager *)self textStorage] length]) {
LABEL_9:
  }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v7, v8, 0);
  *(_DWORD *)&self->_lmFlags &= ~1u;
  textStorage = self->_textStorage;
  if (textStorage && ![(NSTextStorage *)textStorage length])
  {
    if ([(NSMutableArray *)self->_textContainers count])
    {
      NSRect value = 0;
      [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:0 maxNumberOfLineFragments:1 nextGlyphIndex:&value];
      [(NSLayoutManager *)self _invalidateInsertionPoint];
    }
  }
}

- (void)textContainerChangedTextView:(NSTextContainer *)container
{
  [(NSLayoutManager *)self _firstTextViewChanged];

  [(NSLayoutManager *)self _invalidateInsertionPoint];
}

- (void)textContainerChangedTextView:(id)a3 fromTextView:(id)a4
{
  -[NSLayoutManager textContainerChangedTextView:](self, "textContainerChangedTextView:");
  if ((id)[a3 textView] != a4)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = v7;
    if (a4) {
      [v7 setObject:a4 forKey:@"_NSOldTextView"];
    }
    if ([a3 textView]) {
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(a3, "textView"), @"_NSNewTextView");
    }
    uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"_NSLayoutManagerObservedTextViewChangeNotification" object:self userInfo:v8];
  }
}

- (void)setAllowsNonContiguousLayout:(BOOL)allowsNonContiguousLayout
{
  int v3 = allowsNonContiguousLayout;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  __lmFlags lmFlags = self->_lmFlags;
  int v7 = (*(unsigned int *)&lmFlags >> 30) & 1;
  if (v3) {
    int v8 = 0x20000000;
  }
  else {
    int v8 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xDFFFFFFF | v8);
  textContainers = self->_textContainers;
  uint64_t v10 = (__CFDictionary *)*((void *)self->_extraData + 11);
  unint64_t v11 = [(NSMutableArray *)textContainers count];
  if (v11) {
    uint64_t v12 = (void *)[(NSMutableArray *)textContainers objectAtIndex:0];
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = v7 & ~v3;
  [v12 size];
  double v15 = v14;
  CFDictionaryRemoveAllValues(v10);
  *((void *)self->_extraData + 10) = v12;
  __lmFlags v16 = self->_lmFlags;
  if (v11 != 1 || (*(_DWORD *)&v16 & 0x20000000) == 0)
  {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v16 & 0xBFFFFFFF);
    if (v11 >= 2)
    {
      for (uint64_t i = 1; i != v11; ++i)
        CFDictionarySetValue(v10, (const void *)[(NSMutableArray *)textContainers objectAtIndex:i], (const void *)i);
    }
  }
  else
  {
    int v19 = [v12 isSimpleRectangularTextContainer];
    BOOL v20 = v15 >= 10000000.0;
    if (v15 <= 0.0) {
      BOOL v20 = 1;
    }
    if ((v19 & v20) != 0) {
      int v21 = 0x40000000;
    }
    else {
      int v21 = 0;
    }
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v21);
  }
  if (v5) {
    int v22 = v13;
  }
  else {
    int v22 = 0;
  }
  if (v22 == 1)
  {
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0) {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
    }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
  }
}

- (BOOL)allowsNonContiguousLayout
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 5) & 1;
}

- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 offsetPerLineEstimate:(double)a4
{
  uint64_t v7 = [(NSTextStorage *)self->_textStorage length];
  _NSLayoutTreeSetGlyphsPerLineEstimate((uint64_t)self, a3);
  _NSLayoutTreeSetOffsetPerLineEstimate((uint64_t)self, a4);

  -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v7, 0);
}

- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 integerOffsetPerLineEstimate:(unint64_t)a4
{
}

- (BOOL)hasNonContiguousLayout
{
  BOOL result = (*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0
        && (extraDatCGFloat a = self->_extraData, (*(unsigned char *)(extraData[30] + 56) & 1) != 0)
        && *(void *)(extraData[26] + 8) != 0;
  return result;
}

- (void)setBackgroundLayoutEnabled:(BOOL)backgroundLayoutEnabled
{
  if (backgroundLayoutEnabled) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFFB | v3);
  if (backgroundLayoutEnabled && (*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) != 0) {
    [(NSLayoutManager *)self _markSelfAsDirtyForBackgroundLayout:self];
  }
}

- (BOOL)backgroundLayoutEnabled
{
  return (*(unsigned char *)&self->_lmFlags >> 2) & 1;
}

- (BOOL)usesScreenFonts
{
  return (*(unsigned char *)&self->_lmFlags >> 4) & 1;
}

- (void)setUsesScreenFonts:(BOOL)usesScreenFonts
{
  BOOL v3 = usesScreenFonts;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v6 = v5;
  __lmFlags lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(unsigned char *)&lmFlags & 0x10) != 0) {
      return;
    }
    int v8 = 16;
  }
  else
  {
    if ((*(unsigned char *)&lmFlags & 0x10) == 0) {
      return;
    }
    int v8 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFFEF | v8);
  if (v5)
  {
    if ((*(_DWORD *)&lmFlags & 0x8100000) != 0) {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
    }
    else {
      self->_cachedFontCharRange = (_NSRange)xmmword_18E5F72A0;
    }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v6, 0);
  }
}

- (void)setShowsInvisibleCharacters:(BOOL)showsInvisibleCharacters
{
  BOOL v3 = showsInvisibleCharacters;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v6 = v5;
  __lmFlags lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(_WORD *)&lmFlags & 0x400) != 0) {
      return;
    }
    int v8 = 1024;
  }
  else
  {
    if ((*(_WORD *)&lmFlags & 0x400) == 0) {
      return;
    }
    int v8 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFBFF | v8);
  if (v5)
  {
    -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v6, 0);
  }
}

- (BOOL)showsInvisibleCharacters
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 2) & 1;
}

- (void)setShowsControlCharacters:(BOOL)showsControlCharacters
{
  BOOL v3 = showsControlCharacters;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v6 = v5;
  __lmFlags lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(_WORD *)&lmFlags & 0x800) != 0) {
      return;
    }
    int v8 = 2048;
  }
  else
  {
    if ((*(_WORD *)&lmFlags & 0x800) == 0) {
      return;
    }
    int v8 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFF7FF | v8);
  if (v5)
  {
    -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v6, 0);
  }
}

- (BOOL)showsControlCharacters
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 3) & 1;
}

- (void)_setHyphenationFactor:(double)a3
{
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  extraDatCGFloat a = (double *)self->_extraData;
  if (extraData[24] != a3)
  {
    uint64_t v7 = v5;
    extraData[24] = a3;
    if (v5)
    {
      -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
      -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v7, 0);
    }
  }
}

- (double)_hyphenationFactor
{
  return *((double *)self->_extraData + 24);
}

- (BOOL)usesDefaultHyphenation
{
  return (*((unsigned __int8 *)self->_extraData + 451) >> 6) & 1;
}

- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation
{
  BOOL v3 = usesDefaultHyphenation;
  uint64_t v5 = [(NSTextStorage *)self->_textStorage length];
  extraDatCGFloat a = self->_extraData;
  int v7 = extraData[112];
  if (((((v7 & 0x40000000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v8 = v5;
    int v9 = v3 ? 0x40000000 : 0;
    extraData[112] = v7 & 0xBFFFFFFF | v9;
    if (v5)
    {
      -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
      -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v8, 0);
    }
  }
}

- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior
{
  NSTypesetterBehavior v3 = NSTypesetterBehavior_10_4|NSTypesetterBehavior_10_2;
  if ((unint64_t)typesetterBehavior < (NSTypesetterBehavior_10_4|NSTypesetterBehavior_10_2)) {
    NSTypesetterBehavior v3 = typesetterBehavior;
  }
  *((void *)self->_extraData + 13) = v3;
}

- (NSTypesetterBehavior)typesetterBehavior
{
  return *((void *)self->_extraData + 13);
}

- (unint64_t)layoutOptions
{
  return (*(_DWORD *)&self->_lmFlags >> 9) & 2 | (*(_DWORD *)&self->_lmFlags >> 11) & 1u;
}

- (BOOL)backgroundColorProvidesOpaqueSurface
{
  return self->_firstTextView != 0;
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  return (*((unsigned __int8 *)self->_extraData + 451) >> 2) & 1;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents
{
  BOOL v3 = limitsLayoutForSuspiciousContents;
  if ([(NSLayoutManager *)self limitsLayoutForSuspiciousContents] != limitsLayoutForSuspiciousContents)
  {
    if (v3) {
      int v5 = 0x4000000;
    }
    else {
      int v5 = 0;
    }
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFBFFFFFF | v5;
    uint64_t v6 = [(NSTextStorage *)[(NSLayoutManager *)self textStorage] length];
    -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v6, 0);
  }
}

- (void)_invalidateGlyphsForCharacterRange:(_NSRange)a3 editedCharacterRange:(_NSRange)a4 changeInLength:(int64_t)a5 actualCharacterRange:(_NSRange *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v10 = a3.length;
  NSUInteger v11 = a3.location;
  int v13 = (void *)[(NSTextStorage *)self->_textStorage string];
  NSUInteger v14 = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", v11, v10, location, length);
  NSUInteger v16 = v14;
  uint64_t v17 = *((void *)self->_extraData + 45);
  if (a6)
  {
    a6->NSUInteger location = v14;
    a6->NSUInteger length = v15;
  }
  -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v14, v15, a5);
  if (a5 == 1 && length == 1 && *((void *)self->_extraData + 45))
  {
    int v18 = [v13 characterAtIndex:location];
    if (v18 > 132)
    {
      if ((v18 - 8232) >= 2 && v18 != 133)
      {
LABEL_17:
        if (!v17)
        {
          extraDatCGFloat a = self->_extraData;
          unint64_t v20 = extraData[44];
          if (v20 >= v16 + 1 && v20 < location + 1) {
            extraData[44] = v20 - 1;
          }
        }
        return;
      }
    }
    else if (v18 != 10 {
           && v18 != 12
    }
           && (v18 != 13
            || location + 1 < [v13 length]
            && [v13 characterAtIndex:location + 1] == 10))
    {
      goto LABEL_17;
    }
    *((_OWORD *)self->_extraData + 22) = xmmword_18E5F72A0;
    *((_OWORD *)self->_extraData + 23) = *MEMORY[0x1E4F28AE0];
  }
}

- (void)invalidateGlyphsForCharacterRange:(NSRange)charRange changeInLength:(NSInteger)delta actualCharacterRange:(NSRangePointer)actualCharRange
{
}

- (void)invalidateLayoutForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  uint64_t location = charRange.location;
  if (charRange.length)
  {
    uint64_t location = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", charRange.location, charRange.length, charRange.location, charRange.length);
    NSUInteger v8 = v7;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 8) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", location, v7, location, v7, 0, 0);
      if (!actualCharRange) {
        return;
      }
    }
    else
    {
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", location, v7, 0);
      if (!actualCharRange) {
        return;
      }
    }
    goto LABEL_8;
  }
  if (![(NSTextStorage *)[(NSLayoutManager *)self textStorage] length]) {
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, 0, 0);
  }
  NSUInteger v8 = 0;
  if (actualCharRange)
  {
LABEL_8:
    actualCharRange->uint64_t location = location;
    actualCharRange->NSUInteger length = v8;
  }
}

- (void)invalidateLayoutForCharacterRange:(NSRange)charRange isSoft:(BOOL)flag actualCharacterRange:(NSRangePointer)actualCharRange
{
  uint64_t location = charRange.location;
  if (charRange.length)
  {
    BOOL v8 = flag;
    uint64_t location = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", charRange.location, charRange.length, charRange.location, charRange.length);
    NSUInteger v10 = v9;
    if (!v8 && (*((unsigned char *)&self->_lmFlags + 3) & 8) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", location, v9, location, v9, 0, 0);
      if (!actualCharRange) {
        return;
      }
    }
    else
    {
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", location, v9, v8);
      if (!actualCharRange) {
        return;
      }
    }
    goto LABEL_9;
  }
  if (!-[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage", charRange.location, 0, flag), "length"))-[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, 0, 0); {
  NSUInteger v10 = 0;
  }
  if (actualCharRange)
  {
LABEL_9:
    actualCharRange->uint64_t location = location;
    actualCharRange->NSUInteger length = v10;
  }
}

- (void)_primitiveInvalidateDisplayForGlyphRange:(_NSRange)a3
{
  unint64_t length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length)
  {
    __n128 v208 = 0uLL;
    uint64_t v6 = (void *)*((void *)self->_extraData + 55);
    *(void *)&long long v204 = 0;
    *((void *)&v204 + 1) = &v204;
    *(void *)&long long v205 = 0x3052000000;
    *((void *)&v205 + 1) = __Block_byref_object_copy__8;
    uint64_t v206 = __Block_byref_object_dispose__8;
    uint64_t v207 = 0;
    uint64_t v7 = [v6 count];
    if (v7) {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    }
    uint64_t v207 = v7;
    v199[0] = MEMORY[0x1E4F143A8];
    v199[1] = 3221225472;
    NSUInteger v200 = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke;
    NSRange v201 = &unk_1E55C6F80;
    NSUInteger v202 = v6;
    NSUInteger v203 = &v204;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      unint64_t v12 = *(void *)(*((void *)self->_extraData + 26) + 8);
      v208.n128_u64[0] = 0;
      v208.n128_u64[1] = v12;
      int v13 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else if ([(NSRunStorage *)self->_containerRuns count] <= location)
    {
      int v13 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, location, &v208);
      if (containerRuns->_gapBlockIndex <= v9) {
        unint64_t v10 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      else {
        unint64_t v10 = 0;
      }
      int v13 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v10 + v9)];
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0 && location && location == v208.n128_u64[0])
    {
      if ([(NSRunStorage *)self->_containerRuns count] <= location - 1)
      {
        uint64_t v17 = 0;
      }
      else
      {
        NSUInteger v14 = self->_containerRuns;
        _NSBlockNumberForIndex(v14, location - 1, 0);
        unint64_t v16 = v14->_gapBlockIndex <= v15 ? v14->_maxBlocks - v14->_numBlocks : 0;
        uint64_t v17 = *(void **)&v14->_runs->var1[(v14->_elementSize + 8) * (v16 + v15)];
      }
      double v18 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location - 1, 0);
      double v20 = v19;
      double v22 = v21;
      unint64_t v23 = objc_msgSend(v17, "textView", v18);
      if (v23)
      {
        [v17 textContainerOrigin];
        double v25 = v24;
        [v23 bounds];
        double v27 = v26;
        double v29 = v28;
        double v30 = v22 + v20 + v25;
        double v33 = v31 + v32 - v30;
        objc_msgSend(v23, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v26, v30);
        v200((uint64_t)v199, (uint64_t)v23, v27, v30, v29, v33);
      }
    }
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0
      || ((unint64_t v34 = [(NSRunStorage *)self->_containerRuns count], v35 = location + length - 1, v34 <= v35)
        ? (long long v39 = 0)
        : ((long long v36 = self->_containerRuns, _NSBlockNumberForIndex(v36, v35, 0), v36->_gapBlockIndex <= v37)
         ? (unint64_t v38 = v36->_maxBlocks - v36->_numBlocks)
         : (unint64_t v38 = 0),
           long long v39 = *(void **)&v36->_runs->var1[(v36->_elementSize + 8) * (v38 + v37)]),
          v13 == v39))
    {
      NSUInteger v11 = (void *)[v13 textView];
      if (v11)
      {
        if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0 && !*((void *)self->_extraData + 23))
        {
          _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
          double v63 = v62;
          double v64 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location + length - 1, 0);
          double v66 = v65;
          double v68 = v67;
          objc_msgSend(v11, "bounds", v64);
          double v70 = v69;
          double v72 = v71;
          [v13 textContainerOrigin];
          double v74 = v63 + v73;
          double v75 = v66 + v68 - v63;
          objc_msgSend(v11, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v70, v74, v72, v75);
          v200((uint64_t)v199, (uint64_t)v11, v70, v74, v72, v75);
        }
        else
        {
          -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", location, length, v13, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          [v13 textContainerOrigin];
          double v192 = v52;
          double v194 = v51;
          if (*((void *)self->_extraData + 23))
          {
            v211.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, location);
            CGFloat x = v211.origin.x;
            CGFloat y = v211.origin.y;
            CGFloat width = v211.size.width;
            CGFloat height = v211.size.height;
            if (!NSIsEmptyRect(v211))
            {
              v212.origin.CGFloat x = v44;
              v212.origin.CGFloat y = v46;
              v212.size.CGFloat width = v48;
              v212.size.CGFloat height = v50;
              v234.origin.CGFloat x = x;
              v234.origin.CGFloat y = y;
              v234.size.CGFloat width = width;
              v234.size.CGFloat height = height;
              NSRect v213 = NSUnionRect(v212, v234);
              double v44 = v213.origin.x;
              double v46 = v213.origin.y;
              double v48 = v213.size.width;
              double v50 = v213.size.height;
            }
            v214.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, location + length - 1);
            CGFloat v57 = v214.origin.x;
            CGFloat v58 = v214.origin.y;
            CGFloat v59 = v214.size.width;
            CGFloat v60 = v214.size.height;
            if (!NSIsEmptyRect(v214))
            {
              v215.origin.CGFloat x = v44;
              v215.origin.CGFloat y = v46;
              v215.size.CGFloat width = v48;
              v215.size.CGFloat height = v50;
              v235.origin.CGFloat x = v57;
              v235.origin.CGFloat y = v58;
              v235.size.CGFloat width = v59;
              v235.size.CGFloat height = v60;
              NSRect v216 = NSUnionRect(v215, v235);
              double v44 = v216.origin.x;
              double v46 = v216.origin.y;
              double v48 = v216.size.width;
              double v50 = v216.size.height;
            }
          }
          objc_msgSend(v11, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v194 + v44, v192 + v46, v48, v50);
          v200((uint64_t)v199, (uint64_t)v11, v194 + v44, v192 + v46, v48, v50);
        }
      }
    }
    else
    {
      uint64_t v197 = 0;
      uint64_t v198 = 0;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        unint64_t v61 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else if ([(NSRunStorage *)self->_containerRuns count] <= location)
      {
        unint64_t v61 = 0;
      }
      else
      {
        uint64_t v40 = self->_containerRuns;
        _NSBlockNumberForIndex(v40, location, 0);
        if (v40->_gapBlockIndex <= v41) {
          unint64_t v42 = v40->_maxBlocks - v40->_numBlocks;
        }
        else {
          unint64_t v42 = 0;
        }
        unint64_t v61 = *(void **)&v40->_runs->var1[(v40->_elementSize + 8) * (v42 + v41)];
      }
      unint64_t v76 = location;
      unint64_t v77 = location;
      do
      {
        double v78 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v77, &v197);
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          uint64_t v82 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0, v78);
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v77)
        {
          uint64_t v82 = 0;
        }
        else
        {
          unint64_t v79 = self->_containerRuns;
          _NSBlockNumberForIndex(v79, v77, 0);
          if (v79->_gapBlockIndex <= v80) {
            unint64_t v81 = v79->_maxBlocks - v79->_numBlocks;
          }
          else {
            unint64_t v81 = 0;
          }
          uint64_t v82 = *(void *)&v79->_runs->var1[(v79->_elementSize + 8) * (v81 + v80)];
        }
        if ((void *)v82 != v61)
        {
          double v83 = (void *)[v61 textView];
          unint64_t v84 = v83;
          if (v83)
          {
            [v83 bounds];
            double v193 = v86;
            double v195 = v85;
            -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", v76, v77 - v76, v61, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
            double v88 = v87;
            double v90 = v89;
            CGFloat v92 = v91;
            CGFloat v94 = v93;
            if (*((void *)self->_extraData + 23) && v77 > v76)
            {
              v217.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v76);
              CGFloat v95 = v217.origin.x;
              CGFloat v96 = v217.origin.y;
              CGFloat v97 = v217.size.width;
              CGFloat v98 = v217.size.height;
              if (!NSIsEmptyRect(v217))
              {
                v218.origin.CGFloat x = v88;
                v218.origin.CGFloat y = v90;
                v218.size.CGFloat width = v92;
                v218.size.CGFloat height = v94;
                v236.origin.CGFloat x = v95;
                v236.origin.CGFloat y = v96;
                v236.size.CGFloat width = v97;
                v236.size.CGFloat height = v98;
                NSRect v219 = NSUnionRect(v218, v236);
                double v88 = v219.origin.x;
                double v90 = v219.origin.y;
                CGFloat v92 = v219.size.width;
                CGFloat v94 = v219.size.height;
              }
              v220.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v77 - 1);
              CGFloat v99 = v220.origin.x;
              CGFloat v100 = v220.origin.y;
              CGFloat v101 = v220.size.width;
              CGFloat v102 = v220.size.height;
              if (!NSIsEmptyRect(v220))
              {
                v221.origin.CGFloat x = v88;
                v221.origin.CGFloat y = v90;
                v221.size.CGFloat width = v92;
                v221.size.CGFloat height = v94;
                v237.origin.CGFloat x = v99;
                v237.origin.CGFloat y = v100;
                v237.size.CGFloat width = v101;
                v237.size.CGFloat height = v102;
                NSRect v222 = NSUnionRect(v221, v237);
                double v88 = v222.origin.x;
                double v90 = v222.origin.y;
                CGFloat v92 = v222.size.width;
                CGFloat v94 = v222.size.height;
              }
            }
            [v61 textContainerOrigin];
            v223.origin.CGFloat x = v88 + v103;
            v223.origin.CGFloat y = v90 + v104;
            v238.size.CGFloat height = v195 + v193 - v223.origin.y;
            v223.size.CGFloat width = v92;
            v223.size.CGFloat height = v94;
            v238.origin.CGFloat x = v223.origin.x;
            v238.origin.CGFloat y = v223.origin.y;
            v238.size.CGFloat width = v92;
            NSRect v224 = NSUnionRect(v223, v238);
            double v105 = v224.origin.x;
            double v106 = v224.origin.y;
            double v107 = v224.size.width;
            double v108 = v224.size.height;
            objc_msgSend(v84, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1);
            v200((uint64_t)v199, (uint64_t)v84, v105, v106, v107, v108);
            unint64_t v61 = (void *)v82;
            unint64_t v76 = v77;
          }
          else
          {
            unint64_t v61 = (void *)v82;
            unint64_t v76 = v77;
          }
        }
        unint64_t v77 = v198 + v197;
      }
      while (v198 + v197 >= location && v198 + v197 - location < length);
      NSUInteger v11 = (void *)[v61 textView];
      if (v11)
      {
        v209.unint64_t length = v77 - v76;
        v209.NSUInteger location = v76;
        v210.NSUInteger location = location;
        v210.unint64_t length = length;
        NSRange v110 = NSIntersectionRange(v209, v210);
        -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", v110.location, v110.length, v61, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
        double v112 = v111;
        double v114 = v113;
        double v116 = v115;
        double v118 = v117;
        if (*((void *)self->_extraData + 23) && v110.length)
        {
          v225.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v110.location);
          CGFloat v119 = v225.origin.x;
          CGFloat v120 = v225.origin.y;
          CGFloat v121 = v225.size.width;
          CGFloat v122 = v225.size.height;
          if (!NSIsEmptyRect(v225))
          {
            v226.origin.CGFloat x = v112;
            v226.origin.CGFloat y = v114;
            v226.size.CGFloat width = v116;
            v226.size.CGFloat height = v118;
            v239.origin.CGFloat x = v119;
            v239.origin.CGFloat y = v120;
            v239.size.CGFloat width = v121;
            v239.size.CGFloat height = v122;
            NSRect v227 = NSUnionRect(v226, v239);
            double v112 = v227.origin.x;
            double v114 = v227.origin.y;
            double v116 = v227.size.width;
            double v118 = v227.size.height;
          }
          v228.origin.CGFloat x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v110.length + v110.location - 1);
          CGFloat v123 = v228.origin.x;
          CGFloat v124 = v228.origin.y;
          CGFloat v125 = v228.size.width;
          CGFloat v126 = v228.size.height;
          if (!NSIsEmptyRect(v228))
          {
            v229.origin.CGFloat x = v112;
            v229.origin.CGFloat y = v114;
            v229.size.CGFloat width = v116;
            v229.size.CGFloat height = v118;
            v240.origin.CGFloat x = v123;
            v240.origin.CGFloat y = v124;
            v240.size.CGFloat width = v125;
            v240.size.CGFloat height = v126;
            NSRect v230 = NSUnionRect(v229, v240);
            double v112 = v230.origin.x;
            double v114 = v230.origin.y;
            double v116 = v230.size.width;
            double v118 = v230.size.height;
          }
        }
        [v61 textContainerOrigin];
        double v128 = v112 + v127;
        double v130 = v114 + v129;
        objc_msgSend(v11, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v128, v130, v116, v118);
        v200((uint64_t)v199, (uint64_t)v11, v128, v130, v116, v118);
      }
    }
    if ([*(id *)(*((void *)&v204 + 1) + 40) count])
    {
      uint64_t v131 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
      uint64_t v133 = v132;
      NSUInteger v134 = [(NSLayoutManager *)self textStorage];
      v196[0] = MEMORY[0x1E4F143A8];
      v196[1] = 3221225472;
      v196[2] = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_3;
      v196[3] = &unk_1E55C6FA8;
      v196[4] = self;
      v196[5] = &v204;
      [(NSTextStorage *)v134 enumerateAttribute:@"NSAttachment", v131, v133, 0x100000, v196 inRange options usingBlock];
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [*(id *)(*((void *)&v204 + 1) + 40) enumerateObjectsUsingBlock:&__block_literal_global_14];
      [MEMORY[0x1E4F39CF8] commit];
      [*((id *)self->_extraData + 55) minusSet:*(void *)(*((void *)&v204 + 1) + 40)];
    }
    _Block_object_dispose(&v204, 8);
  }
  else
  {
    NSUInteger v11 = 0;
  }
  NSUInteger v135 = location + length;
  if (location + length >= *(void *)(*((void *)self->_extraData + 26) + 8))
  {
    extraLineFragmentContainer = self->_extraLineFragmentContainer;
    if (extraLineFragmentContainer)
    {
      uint64_t v137 = [(NSTextContainer *)extraLineFragmentContainer textView];
      if (!v137) {
        goto LABEL_94;
      }
      double v138 = (void *)v137;
      long long v204 = 0u;
      long long v205 = 0u;
      _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v204, 0);
      long long v139 = v204;
      long long v140 = v205;
      [v138 textContainerOrigin];
      double v142 = *(double *)&v139 + v141;
      double v144 = *((double *)&v139 + 1) + v143;
      double v145 = *((double *)&v140 + 1) + *((double *)&v140 + 1);
      int v146 = v138;
      double v147 = *(double *)&v140;
    }
    else
    {
      if (!v135) {
        goto LABEL_94;
      }
      if ((*(unsigned char *)&self->_lmFlags & 2) == 0) {
        goto LABEL_94;
      }
      unint64_t v148 = v135 - 1;
      if (!_NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v135 - 1)) {
        goto LABEL_94;
      }
      double v149 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v148, 0);
      double v151 = v150;
      CGFloat v153 = v152;
      double v155 = v154;
      [v11 textContainerOrigin];
      CGFloat v157 = v149 + v156;
      CGFloat v159 = v151 + v158 + v155;
      [v11 bounds];
      CGFloat v162 = v160 + v161 - v159;
      [v11 visibleRect];
      v241.origin.CGFloat x = v163;
      v241.origin.CGFloat y = v164;
      v241.size.CGFloat width = v165;
      v241.size.CGFloat height = v166;
      v231.origin.CGFloat x = v157;
      v231.origin.CGFloat y = v159;
      v231.size.CGFloat width = v153;
      v231.size.CGFloat height = v162;
      *(NSRect *)&double v142 = NSIntersectionRect(v231, v241);
      int v146 = v11;
    }
    objc_msgSend(v146, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v142, v144, v147, v145);
  }
LABEL_94:
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(unsigned char *)&lmFlags & 2) != 0 && location)
  {
    *(void *)&long long v204 = location;
    *((void *)&v204 + 1) = length;
    __n128 v208 = 0uLL;
    if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
    {
      v208.n128_u64[1] = *(void *)(*((void *)self->_extraData + 26) + 8);
      double v172 = (void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    }
    else
    {
      unint64_t v168 = location - 1;
      if ([(NSRunStorage *)self->_containerRuns count] <= location - 1)
      {
        double v172 = 0;
      }
      else
      {
        double v169 = self->_containerRuns;
        _NSBlockNumberForIndex(v169, v168, &v208);
        unint64_t v171 = v169->_gapBlockIndex <= v170 ? v169->_maxBlocks - v169->_numBlocks : 0;
        double v172 = *(void **)&v169->_runs->var1[(v169->_elementSize + 8) * (v171 + v170)];
      }
    }
    uint64_t v173 = [v172 textView];
    if (v173)
    {
      unint64_t v174 = (void *)v173;
      CGFloat v176 = *MEMORY[0x1E4F28AD8];
      CGFloat v175 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      CGFloat v178 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      CGFloat v177 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      [v172 textContainerOrigin];
      double v180 = v179;
      double v182 = v181;
      char v183 = 0;
      uint64_t v184 = 50;
      while ((unint64_t)v204 > v208.n128_u64[0]
           && _NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex((uint64_t)self, v204 - 1))
      {
        CGFloat v185 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v204 - 1, (uint64_t *)&v204);
        double v187 = v186;
        double v189 = v188;
        double v191 = v190;
        if (v183)
        {
          v232.origin.CGFloat x = v176;
          v232.origin.CGFloat y = v175;
          v232.size.CGFloat width = v178;
          v232.size.CGFloat height = v177;
          NSRect v233 = NSUnionRect(v232, *(NSRect *)&v185);
          CGFloat v185 = v233.origin.x;
          double v187 = v233.origin.y;
          double v189 = v233.size.width;
          double v191 = v233.size.height;
        }
        char v183 = 1;
        CGFloat v177 = v191;
        CGFloat v178 = v189;
        CGFloat v175 = v187;
        CGFloat v176 = v185;
        if (!--v184) {
          goto LABEL_113;
        }
      }
      double v191 = v177;
      double v189 = v178;
      double v187 = v175;
      CGFloat v185 = v176;
      if ((v183 & 1) == 0) {
        return;
      }
LABEL_113:
      objc_msgSend(v174, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v180 + v185, v182 + v187, v189, v191);
    }
  }
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v6 + 8) + 40))
  {
    uint64_t v7 = *(void **)(result + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_2;
    v8[3] = &unk_1E55C6F58;
    *(double *)&v8[6] = a3;
    *(double *)&v8[7] = a4;
    *(double *)&v8[8] = a5;
    *(double *)&v8[9] = a6;
    v8[4] = a2;
    v8[5] = v6;
    return [v7 enumerateObjectsUsingBlock:v8];
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)[a2 view];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t result = [v4 superview];
  if (v5 == result)
  {
    uint64_t result = [v4 isFirstResponder];
    if ((result & 1) == 0)
    {
      [v4 frame];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [v4 frame];
      v22.origin.CGFloat x = v15;
      v22.origin.CGFloat y = v16;
      v22.size.CGFloat width = v17;
      v22.size.CGFloat height = v18;
      NSRect v23 = NSIntersectionRect(*(NSRect *)(a1 + 48), v22);
      v21.origin.CGFloat x = v8;
      v21.origin.CGFloat y = v10;
      v21.size.CGFloat width = v12;
      v21.size.CGFloat height = v14;
      uint64_t result = NSEqualRects(v21, v23);
      if (result)
      {
        double v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        return [v19 addObject:a2];
      }
    }
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) viewProviderForTextAttachment:a2 characterIndex:a3];
  uint64_t result = [v5 view];
  if (result)
  {
    double v7 = (void *)result;
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v5];
    if (result)
    {
      unint64_t v8 = [*(id *)(a1 + 32) glyphIndexForCharacterAtIndex:a3];
      double v9 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(*(void *)(a1 + 32), v8, 0);
      double v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      uint64_t v16 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v16 + 67) & 0x40) != 0)
      {
        NSRect v21 = (void *)[*(id *)(v16 + 32) objectAtIndex:0];
      }
      else if ([*(id *)(v16 + 48) count] <= v8)
      {
        NSRect v21 = 0;
      }
      else
      {
        CGFloat v18 = *(void **)(v16 + 48);
        *(void *)&double v17 = _NSBlockNumberForIndex(v18, v8, 0).n128_u64[0];
        uint64_t v20 = 0;
        if (v18[11] <= v19) {
          uint64_t v20 = v18[4] - v18[3];
        }
        NSRect v21 = *(void **)(v18[7] + (v18[2] + 8) * (v20 + v19) + 8);
      }
      objc_msgSend(v21, "textContainerOrigin", v17);
      CGFloat v23 = v9 + v22;
      CGFloat v25 = v11 + v24;
      objc_msgSend((id)objc_msgSend(v7, "superview"), "visibleRect");
      v33.origin.CGFloat x = v26;
      v33.origin.CGFloat y = v27;
      v33.size.CGFloat width = v28;
      v33.size.CGFloat height = v29;
      v32.origin.CGFloat x = v23;
      v32.origin.CGFloat y = v25;
      v32.size.CGFloat width = v13;
      v32.size.CGFloat height = v15;
      uint64_t result = NSIntersectsRect(v32, v33);
      if (result)
      {
        double v30 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        return [v30 removeObject:v5];
      }
    }
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 view];

  return [v2 setHidden:1];
}

- (void)invalidateDisplayForCharacterRange:(NSRange)charRange
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  unint64_t v6 = [(NSTextStorage *)self->_textStorage length];
  NSUInteger v7 = v6;
  if (location >= v6) {
    NSUInteger v8 = v6;
  }
  else {
    NSUInteger v8 = location;
  }
  if (location + length > v6)
  {
    NSUInteger location = v8;
    NSUInteger length = v6 - v8;
  }
  v19.NSUInteger location = -[NSLayoutManager _blockRowRangeForCharRange:](self, "_blockRowRangeForCharRange:", location, length);
  v19.NSUInteger length = v9;
  v18.NSUInteger location = location;
  v18.NSUInteger length = length;
  NSRange v10 = NSUnionRange(v18, v19);
  NSUInteger v11 = v10.length;
  if (self->_displayInvalidationDisableStack) {
    goto LABEL_7;
  }
  range2.NSUInteger location = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:&range2 glyphIndex:0];
  }
  else {
    range2.NSUInteger location = self->_firstUnlaidCharIndex;
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) == 0)
  {
    v13.NSUInteger location = range2.location;
    if (range2.location < v7)
    {
      if (range2.location <= v10.location)
      {
LABEL_7:
        v12.NSUInteger location = self->_deferredDisplayCharRange.location;
        if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_deferredDisplayCharRange = v10;
        }
        else
        {
          v12.NSUInteger length = self->_deferredDisplayCharRange.length;
          self->_deferredDisplayCharRange = NSUnionRange(v12, v10);
        }
        return;
      }
      v13.NSUInteger length = v10.location + v10.length - range2.location;
      if (v10.location + v10.length > range2.location)
      {
        v14.NSUInteger location = self->_deferredDisplayCharRange.location;
        if (v14.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_deferredDisplayCharRange.NSUInteger location = range2.location;
          self->_deferredDisplayCharRange.NSUInteger length = v13.length;
        }
        else
        {
          v14.NSUInteger length = self->_deferredDisplayCharRange.length;
          self->_deferredDisplayCharRange = NSUnionRange(v14, v13);
          v13.NSUInteger location = range2.location;
        }
        NSUInteger v11 = v13.location - v10.location;
      }
    }
  }
  if (v10.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v10.location, v11);
    -[NSLayoutManager _primitiveInvalidateDisplayForGlyphRange:](self, "_primitiveInvalidateDisplayForGlyphRange:", v15, v16);
  }
}

- (void)invalidateDisplayForGlyphRange:(NSRange)glyphRange
{
  uint64_t v5 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", glyphRange.location, glyphRange.length);

  -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v5, v4);
}

- (void)_forceDisplayToBeCorrectForViewsWithUnlaidGlyphs
{
  firstUnlaidGlyphIndeCGFloat x = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v3 = self->_firstUnlaidGlyphIndex, v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSLayoutManager *)self getFirstUnlaidCharacterIndex:0 glyphIndex:&firstUnlaidGlyphIndex];
    unint64_t v3 = firstUnlaidGlyphIndex;
    if (!firstUnlaidGlyphIndex) {
      goto LABEL_17;
    }
  }
  else
  {
    firstUnlaidGlyphIndeCGFloat x = self->_firstUnlaidGlyphIndex;
    if (!v3)
    {
LABEL_17:
      unint64_t v10 = 0;
      goto LABEL_18;
    }
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    NSUInteger v8 = (const void *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else
  {
    unint64_t v4 = v3 - 1;
    if ([(NSRunStorage *)self->_containerRuns count] <= v3 - 1)
    {
      NSUInteger v8 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v4, 0);
      unint64_t v7 = 0;
      if (containerRuns->_gapBlockIndex <= v6) {
        unint64_t v7 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      NSUInteger v8 = *(const void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v7 + v6)];
    }
  }
  NSRect value = 0;
  extraDatCGFloat a = self->_extraData;
  if (*((const void **)extraData + 10) == v8) {
    goto LABEL_17;
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), v8, (const void **)&value)) {
    unint64_t v10 = (unint64_t)value;
  }
  else {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_18:
  if (v10 < [(NSMutableArray *)self->_textContainers count])
  {
    double v11 = *MEMORY[0x1E4F28AD8];
    double v12 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
    do
    {
      uint64_t v15 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v10), "textView");
      if (v15)
      {
        uint64_t v16 = v15;
        if ([v15 needsDisplay]) {
          objc_msgSend(v16, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0, v11, v12, v13, v14);
        }
      }
      ++v10;
    }
    while (v10 < [(NSMutableArray *)self->_textContainers count]);
  }
}

- (void)textStorage:(NSTextStorage *)str edited:(NSTextStorageEditedOptions)editedMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange
{
  NSUInteger length = newCharRange.length;
  NSUInteger location = newCharRange.location;
  char v10 = editedMask;
  unint64_t v12 = [(NSTextStorage *)self->_textStorage length];
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  __lmFlags lmFlags = self->_lmFlags;
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x20000);
  if ((*(unsigned char *)&lmFlags & 8) == 0) {
    ++self->_textViewResizeDisableStack;
  }
  if ((v10 & 2) != 0) {
    -[NSLayoutManager _clearTemporaryAttributesForCharacterRange:changeInLength:](self, "_clearTemporaryAttributesForCharacterRange:changeInLength:", location, length, delta);
  }
  -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", invalidatedCharRange.location, invalidatedCharRange.length, location, length, delta, &v17);
  -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v17, v18, 0);
  uint64_t v14 = v18 + v17;
  unint64_t v15 = v12 - (v18 + v17);
  if (v12 >= v18 + v17) {
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v14, v15, 1);
  }
  if (self->_textStorage && !v12 && [(NSMutableArray *)self->_textContainers count])
  {
    uint64_t v16 = 0;
    [(NSTypesetter *)[(NSLayoutManager *)self typesetter] layoutGlyphsInLayoutManager:self startingAtGlyphIndex:0 maxNumberOfLineFragments:1 nextGlyphIndex:&v16];
    [(NSLayoutManager *)self _invalidateInsertionPoint];
  }
  if ((v10 & 2) != 0)
  {
    -[NSLayoutManager _fixSelectionAfterChangeInCharacterRange:changeInLength:](self, "_fixSelectionAfterChangeInCharacterRange:changeInLength:", location, length, delta);
    if (delta < 0
      && (*(_DWORD *)&self->_lmFlags & 0x2000) != 0
      && ![(NSTextStorage *)self->_textStorage length])
    {
      if ([(NSMutableArray *)self->_textContainers count])
      {
        *(_DWORD *)&self->_lmFlags &= ~0x40000u;
        objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0), 1);
        if ([(NSLayoutManager *)self didCompleteLayoutObserverBlock]) {
          (*(void (**)(void))([(NSLayoutManager *)self didCompleteLayoutObserverBlock]
        }
                            + 16))();
      }
    }
  }
  _enableTextViewResizing_0((uint64_t)self);
  [(NSLayoutManager *)self _forceDisplayToBeCorrectForViewsWithUnlaidGlyphs];
  *(_DWORD *)&self->_lmFlags &= ~0x20000u;
}

- (void)processEditingForTextStorage:(NSTextStorage *)textStorage edited:(NSTextStorageEditActions)editMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange
{
}

- (void)ensureGlyphsForCharacterRange:(NSRange)charRange
{
}

- (void)ensureGlyphsForGlyphRange:(NSRange)glyphRange
{
}

- (void)ensureLayoutForCharacterRange:(NSRange)charRange
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  -[NSLayoutManager ensureGlyphsForCharacterRange:](self, "ensureGlyphsForCharacterRange:");
  unint64_t v7 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);

  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, v7, v6);
}

- (void)ensureLayoutForGlyphRange:(NSRange)glyphRange
{
}

- (void)ensureLayoutForTextContainer:(NSTextContainer *)container
{
  __n128 v23 = 0uLL;
  if ([(NSTextContainer *)container layoutManager] != self) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** %@: given container does not appear in the list of containers for this NSLayoutManager.", _NSFullMethodName() format];
  }
  extraDatCGFloat a = self->_extraData;
  if (*(unsigned char *)(*((void *)extraData + 30) + 56))
  {
    uint64_t v6 = *((void *)extraData + 26);
    if ((*(unsigned char *)(v6 + 56) & 1) != 0 || *(void *)(v6 + 8))
    {
      NSRect value = 0;
      if (*((NSTextContainer **)extraData + 10) == container)
      {
        unint64_t v7 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value))
      {
        unint64_t v7 = (unint64_t)value;
      }
      else
      {
        unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      __lmFlags lmFlags = self->_lmFlags;
      if ((*(unsigned char *)&lmFlags & 0x40) == 0) {
        ++self->_displayInvalidationDisableStack;
      }
      if ((*(unsigned char *)&lmFlags & 8) == 0) {
        ++self->_textViewResizeDisableStack;
      }
      unint64_t v9 = 0;
      do
      {
        _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, v9);
        if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          unint64_t v13 = *(void *)(*((void *)self->_extraData + 26) + 8);
          v23.n128_u64[0] = 0;
          v23.n128_u64[1] = v13;
          uint64_t v14 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
        }
        else if ([(NSRunStorage *)self->_containerRuns count] <= v9)
        {
          uint64_t v14 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v9, &v23);
          if (containerRuns->_gapBlockIndex <= v11) {
            unint64_t v12 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          }
          else {
            unint64_t v12 = 0;
          }
          uint64_t v14 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v12 + v11)];
        }
        if (v23.n128_u64[1]) {
          v9 += v23.n128_u64[1];
        }
        else {
          ++v9;
        }
        if (v14) {
          BOOL v15 = v14 == container;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15) {
          break;
        }
        NSRect value = 0;
        uint64_t v16 = (CFDictionaryRef *)self->_extraData;
        if (v16[10] == (CFDictionaryRef)v14)
        {
          unint64_t v18 = 0;
        }
        else
        {
          int ValueIfPresent = CFDictionaryGetValueIfPresent(v16[11], v14, (const void **)&value);
          unint64_t v18 = (unint64_t)value;
          if (!ValueIfPresent) {
            unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        if (v18 >= v7) {
          break;
        }
        NSRange v19 = self->_extraData;
        if ((*(unsigned char *)(v19[30] + 56) & 1) == 0) {
          break;
        }
        uint64_t v20 = v19[26];
      }
      while ((*(unsigned char *)(v20 + 56) & 1) != 0 || v9 < *(void *)(v20 + 8));
      _enableTextViewResizing_0((uint64_t)self);
      __lmFlags v21 = self->_lmFlags;
      if ((*(unsigned char *)&v21 & 0x40) == 0)
      {
        if (!self->_displayInvalidationDisableStack
          || (unsigned __int16 v22 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v22) == 0))
        {
          self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v21 | 0x40);
          [(NSLayoutManager *)self _invalidateDisplayIfNeeded];
          *(_DWORD *)&self->_lmFlags &= ~0x40u;
        }
      }
    }
  }
}

- (void)ensureLayoutForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  if (*(unsigned char *)(*((void *)self->_extraData + 30) + 56))
  {
    double height = bounds.size.height;
    double width = bounds.size.width;
    double y = bounds.origin.y;
    double x = bounds.origin.x;
    do
    {
      uint64_t v10 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", container, x, y, width, height);
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      unint64_t v15 = 0;
      if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0) {
        unint64_t v14 = v10;
      }
      else {
        unint64_t v14 = 0;
      }
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v14, &v15);
      if (v15 >= v11 + v13) {
        break;
      }
      -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v11, v13);
    }
    while ((*(unsigned char *)(*((void *)self->_extraData + 30) + 56) & 1) != 0);
  }
}

- (void)insertGlyphs:(const NSGlyph *)glyphs length:(NSUInteger)length forStartingGlyphAtIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex
{
  _NSGlyphTreeInsertGlyphs((uint64_t)self, charIndex, glyphIndex, length, (unsigned int *)glyphs);
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }
}

- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex
{
  NSGlyph v5 = glyph;
  [(NSLayoutManager *)self insertGlyphs:&v5 length:1 forStartingGlyphAtIndex:glyphIndex characterIndex:charIndex];
}

- (void)replaceGlyphAtIndex:(NSUInteger)glyphIndex withGlyph:(NSGlyph)newGlyph
{
  _NSGlyphTreeReplaceGlyphAtIndex((uint64_t)self, glyphIndex, newGlyph);
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }
}

- (void)deleteGlyphsInRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  _NSGlyphTreeDeleteGlyphsInRange((uint64_t)self, glyphRange.location, glyphRange.length, glyphRange.length, v3, v4, v5, v6, v11);
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }

  -[NSLayoutManager _primitiveDeleteGlyphsInRange:](self, "_primitiveDeleteGlyphsInRange:", location, length);
}

- (void)setCharacterIndex:(NSUInteger)charIndex forGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSGlyphTreeSetCharacterIndexForGlyphAtIndex((uint64_t)self, charIndex, glyphIndex, glyphIndex, v4, v5, v6, v7, v10);
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }
}

- (void)setIntAttribute:(NSInteger)attributeTag value:(NSInteger)val forGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, attributeTag, val, glyphIndex, v5, v6, v7, v12);
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
  {
    __lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
    self->___lmFlags lmFlags = lmFlags;
  }
  if (attributeTag == 2 && val && (*(_DWORD *)&lmFlags & 0x2000000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x2000000);
  }
}

- (void)invalidateGlyphsOnLayoutInvalidationForGlyphRange:(NSRange)glyphRange
{
  *(_DWORD *)&self->_lmFlags |= 0x8000000u;
}

- (void)setGlyphs:(const CGGlyph *)glyphs properties:(const NSGlyphProperty *)props characterIndexes:(const NSUInteger *)charIndexes font:(UIFont *)aFont forGlyphRange:(NSRange)glyphRange
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((uint64_t)glyphRange.length >= 1)
  {
    NSUInteger location = glyphRange.location;
    char v11 = glyphs;
    char v12 = &glyphs[glyphRange.length];
    do
    {
      unint64_t v13 = v12 - v11;
      if (v13 >= 0x80) {
        unint64_t v13 = 128;
      }
      if (v13)
      {
        size_t v14 = 0;
        NSUInteger v15 = -1;
        while (1)
        {
          NSUInteger v16 = v15;
          NSUInteger v15 = charIndexes[v14];
          if (v16 == v15) {
            break;
          }
          NSGlyphProperty v17 = props[v14];
          if (v17)
          {
            unsigned int v18 = 0;
          }
          else if ((v17 & 2) != 0)
          {
            unsigned int v18 = 0xFFFFFF;
          }
          else
          {
            unsigned int v18 = v11[v14];
          }
          v26[v14++] = v18;
          if (v13 == v14)
          {
            size_t v14 = v13;
            break;
          }
        }
        _NSGlyphTreeInsertGlyphs((uint64_t)self, *charIndexes, location, v14, v26);
        if (v14)
        {
          __n128 v23 = &props[v14];
          do
          {
            NSGlyphProperty v24 = *props;
            if ((*props & 4) != 0)
            {
              _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, location, 1, 1, v19, v20, v21, v22, v26[0]);
              NSGlyphProperty v24 = *props;
            }
            if ((v24 & 8) != 0) {
              _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, location, 5, 1, v19, v20, v21, v22, v26[0]);
            }
            ++props;
            ++location;
          }
          while (props < v23);
        }
      }
      else
      {
        _NSGlyphTreeInsertGlyphs((uint64_t)self, *charIndexes, location, 0, v26);
        size_t v14 = 0;
      }
      v11 += v14;
      charIndexes += v14;
    }
    while (v11 < v12);
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0) {
    self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  }
}

- (NSUInteger)numberOfGlyphs
{
  uint64_t v3 = [(NSTextStorage *)self->_textStorage length];
  if (!*((void *)self->_extraData + 26)) {
    return 0;
  }
  if (v3) {
    unint64_t v4 = v3 - 1;
  }
  else {
    unint64_t v4 = 0;
  }
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, v4, 1uLL);
  return *(void *)(*((void *)self->_extraData + 26) + 8);
}

- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex isValidIndex:(BOOL *)isValidIndex
{
  if (*((void *)self->_extraData + 26))
  {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
    return _NSGlyphTreeGlyphAtIndex((uint64_t)self, glyphIndex, isValidIndex);
  }
  else
  {
    if (isValidIndex) {
      *isValidIndedouble x = 0;
    }
    return -1;
  }
}

- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex
{
  char v7 = 1;
  CGGlyph v5 = [(NSLayoutManager *)self glyphAtIndex:glyphIndex isValidIndex:&v7];
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"*** %@: glyph index %lu not valid in layout manager %p", _NSFullMethodName(), glyphIndex, self format];
  }
  return v5;
}

- (BOOL)isValidGlyphIndex:(NSUInteger)glyphIndex
{
  BOOL v4 = 0;
  [(NSLayoutManager *)self glyphAtIndex:glyphIndex isValidIndex:&v4];
  return v4;
}

- (NSUInteger)characterIndexForGlyphAtIndex:(NSUInteger)glyphIndex
{
  if (!*((void *)self->_extraData + 26)) {
    return glyphIndex;
  }
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  return _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (NSUInteger)glyphIndexForCharacterAtIndex:(NSUInteger)charIndex
{
  if (!*((void *)self->_extraData + 26)) {
    return charIndex;
  }
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, charIndex, 1uLL);

  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, charIndex);
}

- (NSInteger)intAttribute:(NSInteger)attributeTag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  return _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, attributeTag);
}

- (NSGlyphProperty)propertyForGlyphAtIndex:(NSUInteger)glyphIndex
{
  if (!*((void *)self->_extraData + 26)) {
    return 0;
  }
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  int v5 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, glyphIndex, 0);
  if (v5 == 0xFFFFFF) {
    NSGlyphProperty v6 = 2;
  }
  else {
    NSGlyphProperty v6 = v5 == 0;
  }
  if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, 1)) {
    v6 |= 4uLL;
  }
  if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, 5)) {
    return v6 | 8;
  }
  else {
    return v6;
  }
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(CGGlyph *)glyphBuffer properties:(NSGlyphProperty *)props characterIndexes:(NSUInteger *)charIndexBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  if (glyphRange.length) {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  }

  return _NSGlyphTreeGetCGGlyphsInRange((uint64_t)self, location, length, (unint64_t)glyphBuffer, props, charIndexBuffer, bidiLevelBuffer);
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer
{
  return -[NSLayoutManager getGlyphsInRange:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:](self, "getGlyphsInRange:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:", glyphRange.location, glyphRange.length, glyphBuffer, charIndexBuffer, inscribeBuffer, elasticBuffer, 0);
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  if (glyphRange.length) {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  }

  return _NSGlyphTreeGetGlyphsInRange((uint64_t)self, location, length, glyphBuffer, charIndexBuffer, inscribeBuffer, elasticBuffer, bidiLevelBuffer);
}

- (NSUInteger)getGlyphs:(NSGlyph *)glyphArray range:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  if (glyphRange.length) {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  }

  return _NSGlyphTreeGetShownGlyphsInRange((uint64_t)self, location, length, (int *)glyphArray);
}

- (void)_setCachedTextContainer:(id)a3 isVertical:(BOOL)a4
{
  self->_cachedTextContainer = (NSTextContainer *)a3;
  self->_cachedTextContainerIsVertical = a4;
}

- (void)_resetCachedTextContainer
{
  self->_cachedTextContainer = 0;
}

- (void)setLineFragmentRect:(CGRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(CGRect)usedRect
{
  if (!glyphRange.length) {
    return;
  }
  double height = usedRect.size.height;
  double width = usedRect.size.width;
  double y = usedRect.origin.y;
  double x = usedRect.origin.x;
  NSUInteger location = glyphRange.location;
  _NSLayoutTreeSetLineFragmentRectForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length, fragmentRect.origin.x, fragmentRect.origin.y, fragmentRect.size.width, fragmentRect.size.height, usedRect.origin.x, usedRect.origin.y, usedRect.size.width, usedRect.size.height, glyphRange.length, v5, v6, v7, v8, v22);
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    CFDictionaryRef v19 = (CFDictionaryRef)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
    if (!v19) {
      return;
    }
  }
  else
  {
    if ([(NSRunStorage *)self->_containerRuns count] <= location) {
      return;
    }
    containerRuns = self->_containerRuns;
    *(void *)&double v17 = _NSBlockNumberForIndex(containerRuns, location, 0).n128_u64[0];
    unint64_t v18 = 0;
    if (containerRuns->_gapBlockIndex <= v16) {
      unint64_t v18 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    CFDictionaryRef v19 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v18 + v16)];
    if (!v19) {
      return;
    }
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    NSRect value = 0;
    extraDatCGFloat a = (CFDictionaryRef *)self->_extraData;
    if (extraData[10] == v19)
    {
      uint64_t v21 = 0;
    }
    else
    {
      if (!CFDictionaryGetValueIfPresent(extraData[11], v19, (const void **)&value)) {
        return;
      }
      uint64_t v21 = value;
      if (value == (void *)0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
    }
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v21, 1, v17);
    return;
  }

  -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", v19, x, y, width, height);
}

- (void)setLocation:(CGPoint)a3 forStartOfGlyphRange:(_NSRange)a4 coalesceRuns:(BOOL)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  double y = a3.y;
  double x = a3.x;
  NSRange cachedLocationNominalGlyphRange = self->_cachedLocationNominalGlyphRange;
  v11.NSUInteger location = location;
  v11.NSUInteger length = length;
  if (NSIntersectionRange(v11, cachedLocationNominalGlyphRange).length) {
    self->_NSRange cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  }

  _NSLayoutTreeSetLocationForGlyphRange((uint64_t)self, location, length, x, y);
}

- (void)setLocation:(CGPoint)location forStartOfGlyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger v5 = glyphRange.location;
  double y = location.y;
  double x = location.x;
  NSRange cachedLocationNominalGlyphRange = self->_cachedLocationNominalGlyphRange;
  v10.NSUInteger location = v5;
  v10.NSUInteger length = length;
  if (NSIntersectionRange(v10, cachedLocationNominalGlyphRange).length) {
    self->_NSRange cachedLocationNominalGlyphRange = (_NSRange)xmmword_18E5F72A0;
  }

  _NSLayoutTreeSetLocationForGlyphRange((uint64_t)self, v5, length, x, y);
}

- (void)setLocations:(NSPointArray)locations startingGlyphIndexes:(NSUInteger *)glyphIndexes count:(NSUInteger)count forGlyphRange:(NSRange)glyphRange
{
  if (count)
  {
    uint64_t v9 = 0;
    NSUInteger v10 = glyphRange.location + glyphRange.length;
    p_double y = &locations->y;
    do
    {
      uint64_t v12 = v9 + 1;
      NSUInteger v13 = v10;
      if (v9 + 1 < count) {
        NSUInteger v13 = glyphIndexes[v9 + 1];
      }
      -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", glyphIndexes[v9], v13 - glyphIndexes[v9], *(p_y - 1), *p_y);
      p_y += 2;
      uint64_t v9 = v12;
    }
    while (count != v12);
  }
}

- (void)setNotShownAttribute:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, flag, glyphIndex, v4, v5, v6, v7, v8);
}

- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  BOOL v9 = flag;
  if (flag)
  {
    _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex((uint64_t)self, glyphIndex);
    *(_DWORD *)&self->_lmFlags |= 2u;
  }

  _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, glyphIndex, v9, glyphIndex, v4, v5, v6, v7, v12);
}

- (void)setAttachmentSize:(CGSize)attachmentSize forGlyphRange:(NSRange)glyphRange
{
}

- (void)setEllipsisGlyphAttribute:(BOOL)a3 forGlyphAtIndex:(unint64_t)a4
{
  _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex((uint64_t)self, a4, a3, a4, v4, v5, v6, v7, v8);
}

- (NSUInteger)firstUnlaidCharacterIndex
{
  NSUInteger v3 = 0;
  _getFirstUnlaid(self, &v3, 0);
  return v3;
}

- (NSUInteger)firstUnlaidGlyphIndex
{
  NSUInteger v3 = 0;
  _getFirstUnlaid(self, 0, &v3);
  return v3;
}

- (void)getFirstUnlaidCharacterIndex:(NSUInteger *)charIndex glyphIndex:(NSUInteger *)glyphIndex
{
  if (charIndex) {
    *charIndedouble x = [(NSLayoutManager *)self firstUnlaidCharacterIndex];
  }
  if (glyphIndex) {
    *glyphIndedouble x = [(NSLayoutManager *)self firstUnlaidGlyphIndex];
  }
}

- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  extraDatCGFloat a = self->_extraData;
  uint64_t v7 = extraData[26];
  if (!v7 || !extraData[30])
  {
    if (effectiveGlyphRange)
    {
      char v12 = 0;
      effectiveGlyphRange->NSUInteger location = 0;
      effectiveGlyphRange->NSUInteger length = 0;
      return v12;
    }
    return 0;
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x40000000) == 0)
  {
    if (flag)
    {
      if (self->_containerRuns->_count <= glyphIndex)
      {
        if (effectiveGlyphRange)
        {
          char v12 = 0;
          NSUInteger v13 = *(void *)(v7 + 8);
          effectiveGlyphRange->NSUInteger location = 0;
          effectiveGlyphRange->NSUInteger length = v13;
          return v12;
        }
        return 0;
      }
      goto LABEL_25;
    }
    if ((*(unsigned char *)&lmFlags & 0x40) == 0) {
      ++self->_displayInvalidationDisableStack;
    }
    if ((*(unsigned char *)&lmFlags & 8) == 0) {
      ++self->_textViewResizeDisableStack;
    }
    if (effectiveGlyphRange)
    {
      _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, glyphIndex);
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        NSUInteger v17 = *(void *)(*((void *)self->_extraData + 26) + 8);
        effectiveGlyphRange->NSUInteger location = 0;
        effectiveGlyphRange->NSUInteger length = v17;
LABEL_28:
        char v12 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
        goto LABEL_33;
      }
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0) {
        goto LABEL_28;
      }
    }
LABEL_25:
    if ([(NSRunStorage *)self->_containerRuns count] <= glyphIndex)
    {
      char v12 = 0;
      if (flag) {
        return v12;
      }
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, glyphIndex, (__n128 *)effectiveGlyphRange);
      if (containerRuns->_gapBlockIndex <= v19) {
        unint64_t v20 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      else {
        unint64_t v20 = 0;
      }
      char v12 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v20 + v19)];
      if (flag) {
        return v12;
      }
    }
LABEL_33:
    _enableTextViewResizing_0((uint64_t)self);
    __lmFlags v21 = self->_lmFlags;
    if ((*(unsigned char *)&v21 & 0x40) == 0)
    {
      if (!self->_displayInvalidationDisableStack
        || (unsigned __int16 v22 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v22) == 0))
      {
        self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v21 | 0x40);
        [(NSLayoutManager *)self _invalidateDisplayIfNeeded];
        *(_DWORD *)&self->_lmFlags &= ~0x40u;
      }
    }
    return v12;
  }
  if (effectiveGlyphRange)
  {
    NSUInteger v15 = *(void *)(v7 + 8);
    effectiveGlyphRange->NSUInteger location = 0;
    effectiveGlyphRange->NSUInteger length = v15;
  }
  textContainers = self->_textContainers;

  return (NSTextContainer *)[(NSMutableArray *)textContainers objectAtIndex:0];
}

- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  extraDatCGFloat a = self->_extraData;
  uint64_t v6 = extraData[26];
  if (!v6 || !extraData[30])
  {
    NSRange v11 = 0;
    if (effectiveGlyphRange)
    {
      effectiveGlyphRange->NSUInteger location = 0;
      effectiveGlyphRange->NSUInteger length = 0;
    }
    return v11;
  }
  __lmFlags lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x40000000) == 0)
  {
    if ((*(unsigned char *)&lmFlags & 0x40) == 0) {
      ++self->_displayInvalidationDisableStack;
    }
    if ((*(unsigned char *)&lmFlags & 8) == 0) {
      ++self->_textViewResizeDisableStack;
    }
    if (effectiveGlyphRange)
    {
      _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, glyphIndex);
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        NSUInteger v10 = *(void *)(*((void *)self->_extraData + 26) + 8);
        effectiveGlyphRange->NSUInteger location = 0;
        effectiveGlyphRange->NSUInteger length = v10;
LABEL_22:
        NSRange v11 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
LABEL_26:
        _enableTextViewResizing_0((uint64_t)self);
        __lmFlags v18 = self->_lmFlags;
        if ((*(unsigned char *)&v18 & 0x40) == 0)
        {
          if (!self->_displayInvalidationDisableStack
            || (unsigned __int16 v19 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v19) == 0))
          {
            self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&v18 | 0x40);
            [(NSLayoutManager *)self _invalidateDisplayIfNeeded];
            *(_DWORD *)&self->_lmFlags &= ~0x40u;
          }
        }
        return v11;
      }
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0) {
        goto LABEL_22;
      }
    }
    if ([(NSRunStorage *)self->_containerRuns count] <= glyphIndex)
    {
      NSRange v11 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, glyphIndex, (__n128 *)effectiveGlyphRange);
      if (containerRuns->_gapBlockIndex <= v16) {
        unint64_t v17 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      }
      else {
        unint64_t v17 = 0;
      }
      NSRange v11 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v17 + v16)];
    }
    goto LABEL_26;
  }
  if (effectiveGlyphRange)
  {
    NSUInteger v12 = *(void *)(v6 + 8);
    effectiveGlyphRange->NSUInteger location = 0;
    effectiveGlyphRange->NSUInteger length = v12;
  }
  textContainers = self->_textContainers;

  return (NSTextContainer *)[(NSMutableArray *)textContainers objectAtIndex:0];
}

- (CGRect)usedRectForTextContainer:(NSTextContainer *)container
{
  NSRect value = 0;
  extraDatCGFloat a = self->_extraData;
  if (*((NSTextContainer **)extraData + 10) == container)
  {
    uint64_t v5 = 0;
LABEL_6:
    uint64_t v6 = [(NSLayoutManager *)self _validatedStoredUsageForTextContainerAtIndex:v5];
    goto LABEL_7;
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value))
  {
    uint64_t v5 = value;
    if (value != (void *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = (_NSStoredContainerUsage *)MEMORY[0x1E4F28AD8];
LABEL_7:
  double width = v6->var0.size.width;
  double height = v6->var0.size.height;
  double x = v6->var0.origin.x;
  double y = v6->var0.origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  if (!flag) {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  }

  double v8 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  double v7 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  if (!flag) {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  }

  double v8 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 allowLayout:(BOOL)a5
{
  [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:a3 effectiveRange:a4 withoutAdditionalLayout:!a5];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  double v7 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)extraLineFragmentRect
{
  long long v6 = 0u;
  long long v7 = 0u;
  _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v6, 0);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)extraLineFragmentUsedRect
{
  long long v6 = 0u;
  long long v7 = 0u;
  _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = *((double *)&v7 + 1);
  double v4 = *(double *)&v7;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (NSTextContainer)extraLineFragmentTextContainer
{
  return self->_extraLineFragmentContainer;
}

- (CGPoint)locationForGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v50.NSUInteger location = 0;
  v50.NSUInteger length = 0;
  p_NSRange cachedLocationNominalGlyphRange = &self->_cachedLocationNominalGlyphRange;
  NSUInteger location = self->_cachedLocationNominalGlyphRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || ((v8 = glyphIndex >= location, NSUInteger v7 = glyphIndex - location, v8)
      ? (BOOL v8 = v7 >= self->_cachedLocationNominalGlyphRange.length)
      : (BOOL v8 = 1),
        v8 || (cachedLocationGlyphIndedouble x = self->_cachedLocationGlyphIndex, cachedLocationGlyphIndex > glyphIndex)))
  {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)&v50);
    self->_cachedLocation.double x = _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, glyphIndex, p_cachedLocationNominalGlyphRange);
    self->_cachedLocation.double y = v10;
    NSRange v11 = NSIntersectionRange(self->_cachedLocationNominalGlyphRange, v50);
    cachedLocationGlyphIndedouble x = v11.location;
    self->_NSRange cachedLocationNominalGlyphRange = v11;
    self->_cachedLocationGlyphIndedouble x = v11.location;
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    unint64_t v16 = (NSTextContainer *)[(NSMutableArray *)self->_textContainers objectAtIndex:0];
  }
  else if ([(NSRunStorage *)self->_containerRuns count] <= cachedLocationGlyphIndex)
  {
    unint64_t v16 = 0;
  }
  else
  {
    containerRuns = self->_containerRuns;
    *(void *)&double v12 = _NSBlockNumberForIndex(containerRuns, cachedLocationGlyphIndex, 0).n128_u64[0];
    unint64_t v15 = 0;
    if (containerRuns->_gapBlockIndex <= v14) {
      unint64_t v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    unint64_t v16 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v14)];
  }
  if (v16 == self->_cachedTextContainer) {
    BOOL v17 = !self->_cachedTextContainerIsVertical;
  }
  else {
    BOOL v17 = [(NSTextContainer *)v16 layoutOrientation] == 0;
  }
  int v18 = !v17;
  NSUInteger v19 = self->_cachedLocationGlyphIndex;
  if (v19 >= glyphIndex) {
    goto LABEL_62;
  }
  uint64_t v20 = 0;
  p_cachedFontCharRange = &self->_cachedFontCharRange;
  double v46 = @"NSFont";
  do
  {
    if (_NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v19)) {
      goto LABEL_59;
    }
    unint64_t v21 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, self->_cachedLocationGlyphIndex);
    NSUInteger v22 = self->_cachedFontCharRange.location;
    BOOL v8 = v21 >= v22;
    NSUInteger v23 = v21 - v22;
    char v25 = v8 && v23 < self->_cachedFontCharRange.length;
    if (v20 == 256) {
      char v26 = 0;
    }
    else {
      char v26 = v25;
    }
    if (v20 >= 1 && (v26 & 1) == 0)
    {
      [(UIFont *)self->_cachedFont _totalAdvancementForNativeGlyphs:v51 count:v20];
      uint64_t v20 = 0;
      self->_cachedLocation.double x = v27 + self->_cachedLocation.x;
    }
    if ((v25 & 1) == 0)
    {
      cachedFont = self->_cachedFont;
      CGFloat v29 = (void *)[(NSTextStorage *)self->_textStorage attribute:v46 atIndex:v21 effectiveRange:p_cachedFontCharRange];
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      double v30 = (void *)[(NSTextStorage *)self->_textStorage attribute:@"CTVerticalForms" atIndex:v21 effectiveRange:&v48];
      char v31 = [v30 BOOLValue];
      if (v30) {
        int v32 = 0;
      }
      else {
        int v32 = v18;
      }
      if (v31) {
        int v33 = 1;
      }
      else {
        int v33 = v32;
      }
      if (v29)
      {
        if (!v33) {
          goto LABEL_53;
        }
      }
      else
      {
        CGFloat v29 = NSDefaultFont();
        if (!v33)
        {
LABEL_53:
          self->_cachedFont = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v29, v46, p_cachedFontCharRange);

          [(UIFont *)self->_cachedFont boundingRectForFont];
          extraDatCGFloat a = (double *)self->_extraData;
          *((void *)extraData + 14) = v40;
          extraData[15] = -v37 - v39;
          *((void *)extraData + 16) = v41;
          extraData[17] = v39;
          goto LABEL_54;
        }
      }
      uint64_t v34 = objc_msgSend(v29, "verticalFont", v46, p_cachedFontCharRange);
      if (v34) {
        CGFloat v29 = (void *)v34;
      }
      int v35 = [v29 isVertical];
      if (v30)
      {
        if (v35)
        {
          NSUInteger v36 = self->_cachedFontCharRange.location;
          if (v49 + v48 < self->_cachedFontCharRange.length + v36) {
            self->_cachedFontCharRange.NSUInteger length = v49 + v48 - v36;
          }
        }
      }
      goto LABEL_53;
    }
LABEL_54:
    int v42 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, self->_cachedLocationGlyphIndex, 0);
    if (v42 == 0xFFFFFF)
    {
      if ([(UIFont *)self->_cachedFont _isDefaultFace]) {
        LOWORD(v42) = 0;
      }
      else {
        LOWORD(v42) = -1;
      }
    }
    v51[v20++] = v42;
LABEL_59:
    NSUInteger v19 = self->_cachedLocationGlyphIndex + 1;
    self->_cachedLocationGlyphIndedouble x = v19;
  }
  while (v19 < glyphIndex);
  if (v20 <= 0)
  {
LABEL_62:
    double x = self->_cachedLocation.x;
    goto LABEL_63;
  }
  [(UIFont *)self->_cachedFont _totalAdvancementForNativeGlyphs:v51 count:v20];
  double x = v43 + self->_cachedLocation.x;
  self->_cachedLocation.double x = x;
LABEL_63:
  double y = self->_cachedLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)notShownAttributeForGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  return _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (BOOL)drawsOutsideLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);

  return _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (CGSize)attachmentSizeForGlyphAtIndex:(NSUInteger)glyphIndex
{
  double v3 = _NSLayoutTreeAttachmentSizeForGlyphAtIndex((uint64_t)self, glyphIndex);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (NSRange)truncatedGlyphRangeInLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex
{
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:glyphIndex effectiveRange:&v8];
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9
    && (unint64_t v5 = _NSGlyphTreeEllipsisGlyphIndexForTruncatedGlyphRange((uint64_t)self, v8, v9), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v6 = v8 - v5 + v9;
    uint64_t v4 = v5;
  }
  else
  {
    NSUInteger v6 = 0;
  }
  NSUInteger v7 = v4;
  result.NSUInteger length = v6;
  result.NSUInteger location = v7;
  return result;
}

- (void)setLayoutRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  NSUInteger v13 = _NSAddTextBlockWithGlyphRange((uint64_t)self, (id *)self->_extraData + 23, (uint64_t)block, location, length);
  v13->_layoutRect.origin.CGFloat x = x;
  v13->_layoutRect.origin.CGFloat y = y;
  v13->_layoutRect.size.CGFloat width = width;
  v13->_layoutRect.size.CGFloat height = height;
  if (location)
  {
    unint64_t v14 = v13;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    if (!NSIsEmptyRect(v19))
    {
      unint64_t v15 = location - 1;
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
      v14->_layoutRect.origin.CGFloat y = v14->_layoutRect.origin.y - (v16 + v17);
      _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex((uint64_t)self, v15);
    }
  }
}

- (void)setBoundsRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  NSUInteger v13 = _NSAddTextBlockWithGlyphRange((uint64_t)self, (id *)self->_extraData + 23, (uint64_t)block, location, length);
  v13->_boundsRect.origin.double x = x;
  v13->_boundsRect.origin.double y = y;
  v13->_boundsRect.size.double width = width;
  v13->_boundsRect.size.double height = height;
  if (location)
  {
    unint64_t v14 = v13;
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    if (!NSIsEmptyRect(v22))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
      v14->_boundsRect.origin.double y = v14->_boundsRect.origin.y - v15;
      _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex((uint64_t)self, location);
    }
  }
  if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    uint64_t v20 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
    if (!v20) {
      return;
    }
    goto LABEL_11;
  }
  unint64_t v16 = length + location - 1;
  if ([(NSRunStorage *)self->_containerRuns count] > v16)
  {
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v16, 0);
    unint64_t v19 = 0;
    if (containerRuns->_gapBlockIndex <= v18) {
      unint64_t v19 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    }
    uint64_t v20 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v19 + v18)];
    if (v20)
    {
LABEL_11:
      v23.origin.double x = x;
      v23.origin.double y = y;
      v23.size.double width = width;
      v23.size.double height = height;
      if (!NSIsEmptyRect(v23))
      {
        -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", v20, x, y, width, height);
      }
    }
  }
}

- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  double v8 = *MEMORY[0x1E4F28AD8];
  double v9 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  long long v20 = xmmword_18E5F72A0;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  double v12 = (void *)*((void *)self->_extraData + 23);
  if (v12)
  {
    _NSLocateTextBlockAtIndex(v12, (uint64_t)block, location, &v20);
    if (v13)
    {
      if (__PAIR128__(length, location) == v20)
      {
        double v8 = *(double *)(v13 + 16);
        double v9 = *(double *)(v13 + 24);
        double v10 = *(double *)(v13 + 32);
        double v11 = *(double *)(v13 + 40);
        if (location)
        {
          if (!NSIsEmptyRect(*(NSRect *)(v13 + 16)))
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location - 1, 0);
            double v9 = v9 + v14 + v15;
          }
        }
      }
    }
  }
  double v16 = v8;
  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  double v8 = *MEMORY[0x1E4F28AD8];
  double v9 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  long long v19 = xmmword_18E5F72A0;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  double v12 = (void *)*((void *)self->_extraData + 23);
  if (v12)
  {
    _NSLocateTextBlockAtIndex(v12, (uint64_t)block, location, &v19);
    if (v13)
    {
      if (__PAIR128__(length, location) == v19)
      {
        double v8 = *(double *)(v13 + 48);
        double v9 = *(double *)(v13 + 56);
        double v10 = *(double *)(v13 + 64);
        double v11 = *(double *)(v13 + 72);
        if (location)
        {
          if (!NSIsEmptyRect(*(NSRect *)(v13 + 48)))
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
            double v9 = v9 + v14;
          }
        }
      }
    }
  }
  double v15 = v8;
  double v16 = v9;
  double v17 = v10;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v9 = *MEMORY[0x1E4F28AD8];
  double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  uint64_t v13 = (void *)*((void *)self->_extraData + 23);
  if (v13 && (long long v23 = xmmword_18E5F72A0, _NSLocateTextBlockAtIndex(v13, (uint64_t)block, glyphIndex, &v23), v14))
  {
    double v9 = *(double *)(v14 + 16);
    double v10 = *(double *)(v14 + 24);
    double v11 = *(double *)(v14 + 32);
    double v12 = *(double *)(v14 + 40);
    NSUInteger v15 = *((void *)&v23 + 1);
    NSUInteger v16 = v23;
    if ((void)v23 && !NSIsEmptyRect(*(NSRect *)(v14 + 16)))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v16 - 1, 0);
      double v10 = v10 + v17 + v18;
    }
  }
  else
  {
    NSUInteger v15 = 0;
    NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (effectiveGlyphRange)
  {
    effectiveGlyphRange->NSUInteger location = v16;
    effectiveGlyphRange->NSUInteger length = v15;
  }
  double v19 = v9;
  double v20 = v10;
  double v21 = v11;
  double v22 = v12;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v9 = *MEMORY[0x1E4F28AD8];
  double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  uint64_t v13 = (void *)*((void *)self->_extraData + 23);
  if (v13 && (long long v22 = xmmword_18E5F72A0, _NSLocateTextBlockAtIndex(v13, (uint64_t)block, glyphIndex, &v22), v14))
  {
    double v9 = *(double *)(v14 + 48);
    double v10 = *(double *)(v14 + 56);
    double v11 = *(double *)(v14 + 64);
    double v12 = *(double *)(v14 + 72);
    NSUInteger v16 = *((void *)&v22 + 1);
    unint64_t v15 = v22;
    if ((void)v22 && !NSIsEmptyRect(*(NSRect *)(v14 + 48)))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
      double v10 = v10 + v17;
    }
  }
  else
  {
    NSUInteger v16 = 0;
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (effectiveGlyphRange)
  {
    effectiveGlyphRange->NSUInteger location = v15;
    effectiveGlyphRange->NSUInteger length = v16;
  }
  double v18 = v9;
  double v19 = v10;
  double v20 = v11;
  double v21 = v12;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  if (*((void *)self->_extraData + 26))
  {
    NSUInteger length = charRange.length;
    NSUInteger location = charRange.location;
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, charRange.location, 1uLL);
    if (length >= 2) {
      _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, length + location - 1, 2uLL);
    }
    NSUInteger v8 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, 1, 1, 1, (uint64_t *)actualCharRange);
  }
  else
  {
    if (actualCharRange)
    {
      actualCharRange->NSUInteger location = 0;
      actualCharRange->NSUInteger length = 0;
    }
    NSUInteger v8 = 0;
    NSUInteger v9 = 0;
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange
{
  if (*((void *)self->_extraData + 26))
  {
    NSUInteger length = glyphRange.length;
    NSUInteger location = glyphRange.location;
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, 1uLL);
    if (length) {
      _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, length + location - 1, 2uLL);
    }
    NSUInteger v8 = _NSGlyphTreeCharacterRangeForGlyphRange((uint64_t)self, location, length, 1, 1, &actualGlyphRange->location);
  }
  else
  {
    if (actualGlyphRange)
    {
      actualGlyphRange->NSUInteger location = 0;
      actualGlyphRange->NSUInteger length = 0;
    }
    NSUInteger v8 = 0;
    NSUInteger v9 = 0;
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (NSRange)glyphRangeForTextContainer:(NSTextContainer *)container
{
  if ([(NSTextContainer *)container layoutManager] != self) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** %@: given container does not appear in the list of containers for this NSLayoutManager.", _NSFullMethodName() format];
  }
  if ([(NSTextStorage *)self->_textStorage length])
  {
    NSUInteger v19 = 0;
    NSUInteger v20 = 0;
    if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      NSUInteger v7 = 0;
      NSUInteger v8 = *(void *)(*((void *)self->_extraData + 26) + 8);
      goto LABEL_33;
    }
    NSRect value = 0;
    extraDatCGFloat a = (CFDictionaryRef *)self->_extraData;
    if (extraData[10] == (CFDictionaryRef)container)
    {
      unint64_t v6 = 0;
    }
    else if (CFDictionaryGetValueIfPresent(extraData[11], container, (const void **)&value))
    {
      unint64_t v6 = (unint64_t)value;
    }
    else
    {
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    NSUInteger v9 = [(NSLayoutManager *)self textContainerForGlyphAtIndex:0 effectiveRange:&v19];
    NSRect value = 0;
    double v10 = (CFDictionaryRef *)self->_extraData;
    if (v10[10] == (CFDictionaryRef)v9)
    {
      unint64_t v12 = 0;
    }
    else
    {
      int ValueIfPresent = CFDictionaryGetValueIfPresent(v10[11], v9, (const void **)&value);
      unint64_t v12 = (unint64_t)value;
      if (!ValueIfPresent) {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (v9 == container)
    {
LABEL_32:
      NSUInteger v7 = v19;
      NSUInteger v8 = v20;
      goto LABEL_33;
    }
    NSUInteger v7 = 0;
    while (v12 <= v6)
    {
      if (v20) {
        v7 += v20;
      }
      else {
        ++v7;
      }
      uint64_t v13 = *((void *)self->_extraData + 26);
      if ((*(unsigned char *)(v13 + 56) & 1) == 0)
      {
        NSUInteger v14 = *(void *)(v13 + 8);
        if (v7 >= v14)
        {
          NSUInteger v8 = 0;
          NSUInteger v7 = v14;
          goto LABEL_33;
        }
      }
      unint64_t v15 = [(NSLayoutManager *)self textContainerForGlyphAtIndex:v7 effectiveRange:&v19];
      NSRect value = 0;
      NSUInteger v16 = (CFDictionaryRef *)self->_extraData;
      if (v16[10] == (CFDictionaryRef)v15)
      {
        unint64_t v12 = 0;
      }
      else
      {
        int v17 = CFDictionaryGetValueIfPresent(v16[11], v15, (const void **)&value);
        unint64_t v12 = (unint64_t)value;
        if (!v17) {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v15 == container) {
        goto LABEL_32;
      }
    }
  }
  else
  {
    NSUInteger v7 = 0;
  }
  NSUInteger v8 = 0;
LABEL_33:
  NSUInteger v18 = v7;
  result.NSUInteger length = v8;
  result.NSUInteger location = v18;
  return result;
}

- (NSRange)rangeOfNominallySpacedGlyphsContainingIndex:(NSUInteger)glyphIndex
{
  NSUInteger location = glyphIndex;
  NSUInteger length = 1;
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  if ((_NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, location) & 1) == 0)
  {
    v12.NSUInteger location = 0;
    v12.NSUInteger length = 0;
    v11.NSUInteger location = 0;
    v11.NSUInteger length = 0;
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v11);
    _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, location, &v12);
    NSRange v6 = NSIntersectionRange(v12, v11);
    NSRange v12 = v6;
    unint64_t v7 = location + 1;
    if (location + 1 >= v6.length + v6.location)
    {
      NSUInteger length = v6.length;
      NSUInteger location = v6.location;
    }
    else
    {
      do
      {
        char v8 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v7);
        NSUInteger location = v12.location;
        if (v8)
        {
          NSUInteger length = v7 - v12.location;
          v12.NSUInteger length = v7 - v12.location;
        }
        else
        {
          NSUInteger length = v12.length;
        }
        ++v7;
      }
      while (v7 < length + v12.location);
    }
  }
  NSUInteger v9 = location;
  NSUInteger v10 = length;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (NSRectArray)rectArrayForCharacterRange:(NSRange)charRange withinSelectedCharacterRange:(NSRange)selCharRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount
{
  LOBYTE(v7) = 0;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", charRange.location, charRange.length, selCharRange.location, selCharRange.length, 1, 0, v7, container, rectCount, 0, 0);
}

- (NSRectArray)rectArrayForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selGlyphRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount
{
  LOBYTE(v7) = 0;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", glyphRange.location, glyphRange.length, selGlyphRange.location, selGlyphRange.length, 0, 0, v7, container, rectCount, 0, 0);
}

- (CGRect)boundingRectForGlyphRange:(NSRange)glyphRange inTextContainer:(NSTextContainer *)container
{
  -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", glyphRange.location, glyphRange.length, container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (NSRange)glyphRangeForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  NSUInteger v4 = -[NSLayoutManager _glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:](self, "_glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:", container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (NSRange)glyphRangeForBoundingRectWithoutAdditionalLayout:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  NSUInteger v4 = -[NSLayoutManager _glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:](self, "_glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:", container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container
{
  return _glyphIndexForPoint((uint64_t)self, container, 0, point.x, point.y);
}

- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container
{
  double v5 = 0.0;
  _glyphIndexForPoint((uint64_t)self, container, &v5, point.x, point.y);
  return v5;
}

- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceThroughGlyph:(CGFloat *)partialFraction
{
  double y = point.y;
  double x = point.x;
  if (partialFraction)
  {
    -[NSLayoutManager fractionOfDistanceThroughGlyphForPoint:inTextContainer:](self, "fractionOfDistanceThroughGlyphForPoint:inTextContainer:", container, point.x, point.y);
    *(void *)partialFraction = v10;
  }

  return -[NSLayoutManager glyphIndexForPoint:inTextContainer:](self, "glyphIndexForPoint:inTextContainer:", container, x, y);
}

- (NSUInteger)characterIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceBetweenInsertionPoints:(CGFloat *)partialFraction
{
  double y = point.y;
  double x = point.x;
  double v50 = 0.0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  unint64_t v10 = [(NSTextStorage *)self->_textStorage length];
  NSUInteger v11 = -[NSLayoutManager glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:](self, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", container, &v50, x, y);
  NSUInteger v12 = [(NSLayoutManager *)self characterIndexForGlyphAtIndex:v11];
  uint64_t v46 = 0;
  double v47 = 0;
  unint64_t v44 = 0;
  unint64_t v45 = 0;
  uint64_t v13 = [(NSTextStorage *)self->_textStorage string];
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  if (v12 >= v10) {
    goto LABEL_95;
  }
  NSUInteger v14 = (void *)v13;
  [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v11 effectiveRange:&v42];
  if (!v43) {
    goto LABEL_95;
  }
  if (y < v16 || y >= v16 + v17) {
    goto LABEL_95;
  }
  double v19 = x - v15;
  int64_t v20 = [(NSLayoutManager *)self getLineFragmentInsertionPointArraysForCharacterAtIndex:v12 inDisplayOrder:1 positions:&v49 characterIndexes:&v47 count:&v45 alternatePositions:&v48 characterIndexes:&v46 count:&v44];
  if (v45 >= 2)
  {
    if (v19 < *v49)
    {
      if (!v44) {
        goto LABEL_18;
      }
      for (unint64_t i = 0; i < v44; ++i)
      {
        if (*v49 == *(double *)(v48 + 8 * i)) {
          uint64_t v22 = *(void *)(v46 + 8 * i);
        }
        else {
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_18:
        if (*v47 >= v10)
        {
          NSUInteger v12 = v47[1];
        }
        else
        {
          if (objc_msgSend(v14, "characterAtIndex:") != 13
            || *v47 + 1 >= v10
            || objc_msgSend(v14, "characterAtIndex:") != 10)
          {
            goto LABEL_95;
          }
          NSUInteger v12 = *v47;
        }
        goto LABEL_94;
      }
      NSUInteger v35 = *v47;
LABEL_55:
      double v50 = 0.0;
      if (v35)
      {
        NSUInteger v12 = v35 - 1;
        goto LABEL_94;
      }
LABEL_98:
      NSUInteger v12 = 0;
      if (!partialFraction) {
        return v12;
      }
      goto LABEL_96;
    }
    unint64_t v23 = v45 - 1;
    double v24 = v49[v45 - 1];
    if (v19 >= v24)
    {
      if (!v44) {
        goto LABEL_38;
      }
      for (unint64_t j = 0; j < v44; ++j)
      {
        if (v24 == *(double *)(v48 + 8 * j)) {
          uint64_t v32 = *(void *)(v46 + 8 * j);
        }
        else {
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
      }
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_38:
        if (v47[v23] >= v10)
        {
          NSUInteger v12 = v47[v45 - 2];
        }
        else
        {
          if (objc_msgSend(v14, "characterAtIndex:") != 13
            || v47[v45 - 1] + 1 >= v10
            || objc_msgSend(v14, "characterAtIndex:") != 10)
          {
            goto LABEL_95;
          }
          NSUInteger v12 = v47[v45 - 1];
        }
LABEL_94:
        double v50 = 1.0;
        goto LABEL_95;
      }
      NSUInteger v35 = v47[v23];
      goto LABEL_55;
    }
  }
  if (v45 < 2) {
    goto LABEL_95;
  }
  uint64_t v25 = 0;
  double v26 = v50;
  while (1)
  {
    double v27 = v49[v25];
    if (v19 >= v27)
    {
      CGFloat v28 = &v49[v25];
      double v29 = v28[1];
      if (v19 < v29) {
        break;
      }
    }
    unint64_t v30 = v25 + 2;
    ++v25;
    if (v30 >= v45) {
      goto LABEL_95;
    }
  }
  if (v44)
  {
    for (unint64_t k = 0; k < v44; ++k)
    {
      if (v27 == *(double *)(v48 + 8 * k)) {
        unint64_t v34 = *(void *)(v46 + 8 * k);
      }
      else {
        unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v34 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
  }
  else
  {
    unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v44)
  {
    for (unint64_t m = 0; m < v44; ++m)
    {
      if (v29 == *(double *)(v48 + 8 * m)) {
        unint64_t v37 = *(void *)(v46 + 8 * m);
      }
      else {
        unint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v37 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
  }
  else
  {
    unint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v38 = &v47[v25];
  NSUInteger v40 = *v38;
  NSUInteger v39 = v38[1];
  if (v40 >= v39)
  {
    if (v40 > v39)
    {
      double v26 = (v29 - v19) / (v29 - v27);
      double v50 = v26;
      NSUInteger v12 = v39;
    }
  }
  else
  {
    double v26 = (v19 - v27) / (v29 - v27);
    double v50 = v26;
    NSUInteger v12 = v40;
  }
  if (v20 == 1)
  {
    if (v34 == 0x7FFFFFFFFFFFFFFFLL || v26 < 0.5)
    {
      if (v37 == 0x7FFFFFFFFFFFFFFFLL || v26 >= 0.5)
      {
        if (v40 < v37 && v37 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5)
        {
          double v50 = (v19 - v49[v25]) / (v28[1] - v49[v25]);
          NSUInteger v12 = v40;
          if (!partialFraction) {
            return v12;
          }
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_92:
      double v50 = 0.0;
      if (v39)
      {
        NSUInteger v12 = v39 - 1;
        goto LABEL_94;
      }
      goto LABEL_98;
    }
LABEL_83:
    double v50 = 0.0;
    if (v40)
    {
      NSUInteger v12 = v40 - 1;
      goto LABEL_94;
    }
    goto LABEL_98;
  }
  if (v34 != 0x7FFFFFFFFFFFFFFFLL && v26 < 0.5) {
    goto LABEL_83;
  }
  if (v34 > v39 && v34 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5)
  {
    double v50 = (v28[1] - v19) / (v28[1] - v49[v25]);
    NSUInteger v12 = v39;
    if (!partialFraction) {
      return v12;
    }
    goto LABEL_96;
  }
  if (v37 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5) {
    goto LABEL_92;
  }
LABEL_95:
  if (partialFraction) {
LABEL_96:
  }
    *partialFraction = v50;
  return v12;
}

- (NSUInteger)getLineFragmentInsertionPointsForCharacterAtIndex:(NSUInteger)charIndex alternatePositions:(BOOL)aFlag inDisplayOrder:(BOOL)dFlag positions:(CGFloat *)positions characterIndexes:(NSUInteger *)charIndexes
{
  NSUInteger v12 = 0;
  __srdouble c = 0;
  NSUInteger v11 = 0;
  if (aFlag) {
    [(NSLayoutManager *)self getLineFragmentInsertionPointArraysForCharacterAtIndex:charIndex inDisplayOrder:dFlag positions:0 characterIndexes:0 count:0 alternatePositions:&__src characterIndexes:&v11 count:&v12];
  }
  else {
    [(NSLayoutManager *)self getLineFragmentInsertionPointArraysForCharacterAtIndex:charIndex inDisplayOrder:dFlag positions:&__src characterIndexes:&v11 count:&v12 alternatePositions:0 characterIndexes:0 count:0];
  }
  NSUInteger result = v12;
  if (v12)
  {
    if (positions)
    {
      memmove(positions, __src, 8 * v12);
      NSUInteger result = v12;
    }
    if (charIndexes)
    {
      memmove(charIndexes, v11, 8 * result);
      return v12;
    }
  }
  return result;
}

- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveCharRange
{
  double v6 = (void *)*((void *)self->_extraData + 9);
  if (!v6)
  {
    NSUInteger v11 = +[NSAttributeDictionary emptyAttributeDictionary];
    if (effectiveCharRange)
    {
      NSUInteger v12 = [(NSTextStorage *)self->_textStorage length];
      effectiveCharRange->NSUInteger location = 0;
      effectiveCharRange->NSUInteger length = v12;
    }
    return v11;
  }
  NSUInteger v8 = [v6 count];
  if (v8 <= charIndex)
  {
    NSUInteger v13 = v8;
    NSUInteger v11 = +[NSAttributeDictionary emptyAttributeDictionary];
    if (effectiveCharRange)
    {
      NSUInteger v14 = [(NSTextStorage *)self->_textStorage length];
      if (v14 <= charIndex)
      {
        effectiveCharRange->NSUInteger location = charIndex;
        effectiveCharRange->NSUInteger length = 1;
      }
      else
      {
        effectiveCharRange->NSUInteger location = v13;
        effectiveCharRange->NSUInteger length = v14 - v13;
      }
    }
    return v11;
  }
  NSUInteger v9 = (void *)*((void *)self->_extraData + 9);

  return (NSDictionary *)[v9 objectAtIndex:charIndex effectiveRange:effectiveCharRange];
}

- (void)setTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange
{
  if (charRange.length)
  {
    NSUInteger length = charRange.length;
    NSUInteger location = charRange.location;
    NSUInteger v8 = (void *)*((void *)self->_extraData + 9);
    if (!v8)
    {
      if (![(NSDictionary *)attrs count]) {
        return;
      }
      NSUInteger v8 = (void *)*((void *)self->_extraData + 9);
      if (!v8)
      {
        *((void *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E68], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
        objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
        NSUInteger v8 = (void *)*((void *)self->_extraData + 9);
      }
    }
    v13.NSUInteger length = [v8 count];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    v13.NSUInteger location = 0;
    NSRange v9 = NSIntersectionRange(v12, v13);
    id v10 = +[NSAttributeDictionary newWithDictionary:attrs];
    objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v9.location, v9.length, v10, v9.length);

    -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v9.location, v9.length);
  }
}

- (void)addTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange
{
  if (charRange.length)
  {
    NSUInteger length = charRange.length;
    NSUInteger location = charRange.location;
    NSUInteger v8 = (void *)*((void *)self->_extraData + 9);
    if (!v8)
    {
      *((void *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E68], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
      objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
      NSUInteger v8 = (void *)*((void *)self->_extraData + 9);
    }
    v19.NSUInteger length = [v8 count];
    v16.NSUInteger location = location;
    v16.NSUInteger length = length;
    v19.NSUInteger location = 0;
    NSRange v9 = NSIntersectionRange(v16, v19);
    if (v9.length)
    {
      NSUInteger v10 = v9.location;
      NSUInteger v11 = v9.length;
      do
      {
        v15.NSUInteger location = 0;
        v15.NSUInteger length = 0;
        NSRange v12 = objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v10, &v15), "mutableCopyWithZone:", 0);
        v17.NSUInteger location = v10;
        v17.NSUInteger length = v11;
        NSRange v13 = NSIntersectionRange(v17, v15);
        v15.NSUInteger location = v10;
        v15.NSUInteger length = v13.length;
        if (v13.length > v11) {
          v15.NSUInteger length = v11;
        }
        objc_msgSend(v12, "addEntriesFromDictionary:", attrs, v15.location);
        if (v15.length) {
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v15.location, v15.length, v12, v15.length);
        }

        if (!v15.length) {
          break;
        }
        v10 += v15.length;
        v11 -= v15.length;
      }
      while (v11);
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSDictionary allKeys](attrs, "allKeys")), "isSubsetOfSet:", _NSFaultInObject()) & 1) == 0)
    {
      v20.NSUInteger length = [*((id *)self->_extraData + 9) count];
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      v20.NSUInteger location = 0;
      NSRange v14 = NSIntersectionRange(v18, v20);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v14.location, v14.length);
    }
  }
}

- (void)addTemporaryAttribute:(NSAttributedStringKey)attrName value:(id)value forCharacterRange:(NSRange)charRange
{
  if (charRange.length)
  {
    NSUInteger length = charRange.length;
    NSUInteger location = charRange.location;
    NSUInteger v10 = (void *)*((void *)self->_extraData + 9);
    if (!v10)
    {
      *((void *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28E68], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
      objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
      NSUInteger v10 = (void *)*((void *)self->_extraData + 9);
    }
    v21.NSUInteger length = [v10 count];
    v18.NSUInteger location = location;
    v18.NSUInteger length = length;
    v21.NSUInteger location = 0;
    NSRange v11 = NSIntersectionRange(v18, v21);
    if (v11.length)
    {
      NSUInteger v12 = v11.location;
      NSUInteger v13 = v11.length;
      do
      {
        v17.NSUInteger location = 0;
        v17.NSUInteger length = 0;
        NSRange v14 = objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v12, &v17), "mutableCopyWithZone:", 0);
        v19.NSUInteger location = v12;
        v19.NSUInteger length = v13;
        NSRange v15 = NSIntersectionRange(v19, v17);
        v17.NSUInteger location = v12;
        v17.NSUInteger length = v15.length;
        if (v15.length > v13) {
          v17.NSUInteger length = v13;
        }
        objc_msgSend(v14, "setObject:forKey:", value, attrName, v17.location);
        if (v17.length) {
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v17.location, v17.length, v14, v17.length);
        }

        if (!v17.length) {
          break;
        }
        v12 += v17.length;
        v13 -= v17.length;
      }
      while (v13);
    }
    if (([(id)_NSFaultInObject() containsObject:attrName] & 1) == 0)
    {
      v22.NSUInteger length = [*((id *)self->_extraData + 9) count];
      v20.NSUInteger location = location;
      v20.NSUInteger length = length;
      v22.NSUInteger location = 0;
      NSRange v16 = NSIntersectionRange(v20, v22);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v16.location, v16.length);
    }
  }
}

- (void)removeTemporaryAttribute:(NSAttributedStringKey)attrName forCharacterRange:(NSRange)charRange
{
  double v5 = (void *)*((void *)self->_extraData + 9);
  if (v5) {
    BOOL v6 = charRange.length == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    NSUInteger length = charRange.length;
    NSUInteger location = charRange.location;
    v20.NSUInteger length = [v5 count];
    v17.NSUInteger location = location;
    v17.NSUInteger length = length;
    v20.NSUInteger location = 0;
    NSRange v10 = NSIntersectionRange(v17, v20);
    if (v10.length)
    {
      NSUInteger v11 = v10.location;
      NSUInteger v12 = v10.length;
      do
      {
        v16.NSUInteger location = 0;
        v16.NSUInteger length = 0;
        NSUInteger v13 = objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v11, &v16), "mutableCopyWithZone:", 0);
        v18.NSUInteger location = v11;
        v18.NSUInteger length = v12;
        NSRange v14 = NSIntersectionRange(v18, v16);
        v16.NSUInteger location = v11;
        v16.NSUInteger length = v14.length;
        if (v14.length > v12) {
          v16.NSUInteger length = v12;
        }
        objc_msgSend(v13, "removeObjectForKey:", attrName, v16.location);
        if (v16.length) {
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v16.location, v16.length, v13, v16.length);
        }

        if (!v16.length) {
          break;
        }
        v11 += v16.length;
        v12 -= v16.length;
      }
      while (v12);
    }
    if (([(id)_NSFaultInObject() containsObject:attrName] & 1) == 0)
    {
      v21.NSUInteger length = [*((id *)self->_extraData + 9) count];
      v19.NSUInteger location = location;
      v19.NSUInteger length = length;
      v21.NSUInteger location = 0;
      NSRange v15 = NSIntersectionRange(v19, v21);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v15.location, v15.length);
    }
  }
}

- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  BOOL v6 = [(NSLayoutManager *)self temporaryAttributesAtCharacterIndex:location effectiveRange:range];

  return [(NSDictionary *)v6 objectForKey:attrName];
}

- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  NSUInteger v7 = rangeLimit.location;
  id v11 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", attrName, location);
  if (range)
  {
    unint64_t v12 = [(NSTextStorage *)self->_textStorage length];
    NSRange range2 = *range;
    if (v7 + length >= v12) {
      NSUInteger v13 = v12;
    }
    else {
      NSUInteger v13 = v7 + length;
    }
    do
    {
      NSUInteger v14 = range2.length + range2.location;
      if (range2.length + range2.location >= v13) {
        break;
      }
      id v15 = [(NSLayoutManager *)self temporaryAttribute:attrName atCharacterIndex:range2.length + range2.location effectiveRange:&range2];
    }
    while (v15 == v11 || [v15 isEqual:v11]);
    NSRange range2 = *range;
    do
    {
      NSUInteger v16 = range2.location;
      if (range2.location <= v7) {
        break;
      }
      id v17 = [(NSLayoutManager *)self temporaryAttribute:attrName atCharacterIndex:range2.location - 1 effectiveRange:&range2];
    }
    while (v17 == v11 || [v17 isEqual:v11]);
    v21.NSUInteger length = v14 - v16;
    v20.NSUInteger location = v7;
    v20.NSUInteger length = length;
    v21.NSUInteger location = v16;
    *range = NSIntersectionRange(v20, v21);
  }
  return v11;
}

- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  NSUInteger v6 = rangeLimit.location;
  NSRange v9 = -[NSLayoutManager temporaryAttributesAtCharacterIndex:effectiveRange:](self, "temporaryAttributesAtCharacterIndex:effectiveRange:", location);
  if (range)
  {
    unint64_t v10 = [(NSTextStorage *)self->_textStorage length];
    NSRange range2 = *range;
    if (v6 + length >= v10) {
      NSUInteger v11 = v10;
    }
    else {
      NSUInteger v11 = v6 + length;
    }
    do
      NSUInteger v12 = range2.length + range2.location;
    while (range2.length + range2.location < v11
         && [(NSDictionary *)[(NSLayoutManager *)self temporaryAttributesAtCharacterIndex:range2.length + range2.location effectiveRange:&range2] isEqualToDictionary:v9]);
    NSRange range2 = *range;
    do
      NSUInteger v13 = range2.location;
    while (range2.location > v6
         && [(NSDictionary *)[(NSLayoutManager *)self temporaryAttributesAtCharacterIndex:range2.location - 1 effectiveRange:&range2] isEqualToDictionary:v9]);
    v17.NSUInteger length = v12 - v13;
    v16.NSUInteger location = v6;
    v16.NSUInteger length = length;
    v17.NSUInteger location = v13;
    *range = NSIntersectionRange(v16, v17);
  }
  return v9;
}

- (NSFont)substituteFontForFont:(NSFont *)originalFont
{
  if (![(NSLayoutManager *)self usesScreenFonts]) {
    return originalFont;
  }

  return (NSFont *)[(UIFont *)originalFont screenFontWithRenderingMode:0];
}

- (CGFloat)defaultLineHeightForFont:(NSFont *)theFont
{
  BOOL v4 = [(NSLayoutManager *)self usesFontLeading];
  [(UIFont *)theFont _defaultLineHeightForUILayout];
  double v6 = v5;
  double v7 = 0.0;
  if (v4) {
    [(UIFont *)theFont _leading];
  }
  return v6 + v7;
}

- (CGFloat)defaultBaselineOffsetForFont:(NSFont *)theFont
{
  [(NSLayoutManager *)self usesFontLeading];

  [(UIFont *)theFont ascender];
  return result;
}

- (BOOL)usesFontLeading
{
  return *((unsigned char *)&self->_lmFlags + 3) & 1;
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  if (usesFontLeading) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFEFFFFFF | v3);
}

- (BOOL)synchronizesAlignmentToDirection
{
  return (*((unsigned __int8 *)&self->_lmFlags + 2) >> 5) & 1;
}

- (void)setSynchronizesAlignmentToDirection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->___lmFlags lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFDFFFFF | v3);
}

- (id)didCompleteLayoutObserverBlock
{
  return (id)*((void *)self->_extraData + 64);
}

- (void)setDidCompleteLayoutObserverBlock:(id)a3
{
  *((void *)self->_extraData + 64) = [a3 copy];
}

- (void)enumerateLineFragmentsForGlyphRange:(NSRange)glyphRange usingBlock:(void *)block
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  NSUInteger v31 = glyphRange.location;
  uint64_t v32 = 0;
  char v30 = 0;
  [(NSLayoutManager *)self ensureLayoutForGlyphRange:"ensureLayoutForGlyphRange:"];
  NSUInteger v8 = *(void *)(*((void *)self->_extraData + 26) + 8);
  if (v8 > location)
  {
    NSUInteger v9 = location + length <= v8 ? length : v8 - location;
    for (NSUInteger i = v9 + location; location < i; v31 = location)
    {
      double v11 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v31);
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, v31, 0);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      if ((*((unsigned char *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        uint64_t v29 = [(NSMutableArray *)self->_textContainers objectAtIndex:0];
      }
      else
      {
        unint64_t v25 = v31;
        if ([(NSRunStorage *)self->_containerRuns count] <= v25)
        {
          uint64_t v29 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v25, 0);
          unint64_t v28 = 0;
          if (containerRuns->_gapBlockIndex <= v27) {
            unint64_t v28 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          }
          uint64_t v29 = *(void *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v28 + v27)];
        }
      }
      (*((void (**)(void *, uint64_t, NSUInteger, uint64_t, char *, double, double, double, double, double, double, double, double))block
       + 2))(block, v29, v31, v32, &v30, v11, v13, v15, v17, v18, v20, v22, v24);
      if (v30) {
        break;
      }
      NSUInteger location = v32 + v31;
    }
  }
}

- (void)enumerateEnclosingRectsForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selectedRange inTextContainer:(NSTextContainer *)textContainer usingBlock:(void *)block
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  char v12 = 0;
  LOBYTE(v11) = 0;
  double v7 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", glyphRange.location, glyphRange.length, selectedRange.location, selectedRange.length, 0, 0, v11, textContainer, &v13, 0, 0, v14, 64);
  if (v13 >= 1)
  {
    p_double x = &v7->origin.x;
    NSUInteger v9 = &v7[v13];
    do
    {
      (*((void (**)(void *, char *, double, double, double, double))block + 2))(block, &v12, *p_x, p_x[1], p_x[2], p_x[3]);
      p_x += 4;
      if (v12) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = p_x >= (double *)v9;
      }
    }
    while (!v10);
  }
}

- (void)enumerateEnclosingRectsForCharacterRange:(_NSRange)a3 withinSelectedCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 usingBlock:(id)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  char v12 = 0;
  LOBYTE(v11) = 0;
  double v7 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", a3.location, a3.length, a4.location, a4.length, 1, 0, v11, a5, &v13, 0, 0, v14, 64);
  if (v13 >= 1)
  {
    p_double x = &v7->origin.x;
    NSUInteger v9 = &v7[v13];
    do
    {
      (*((void (**)(id, char *, double, double, double, double))a6 + 2))(a6, &v12, *p_x, p_x[1], p_x[2], p_x[3]);
      p_x += 4;
      if (v12) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = p_x >= (double *)v9;
      }
    }
    while (!v10);
  }
}

- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSUInteger)glyphCount font:(UIFont *)font matrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)graphicsContext
{
  long long v9 = *(_OWORD *)&textMatrix->c;
  v10[0] = *(_OWORD *)&textMatrix->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&textMatrix->tx;
  [(NSLayoutManager *)self showCGGlyphs:glyphs positions:positions count:glyphCount font:font textMatrix:v10 attributes:attributes inContext:graphicsContext];
}

- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 2;
  if (rectCount)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__NSLayoutManager_fillBackgroundRectArray_count_forCharacterRange_color___block_invoke;
      block[3] = &unk_1E55C6FF0;
      void block[4] = &v12;
      if (fillBackgroundRectArray_count_forCharacterRange_color__onceToken != -1) {
        dispatch_once(&fillBackgroundRectArray_count_forCharacterRange_color__onceToken, block);
      }
    }
    long long v9 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
    int CompositeOperation = CGContextGetCompositeOperation();
    if (CompositeOperation != *((_DWORD *)v13 + 6)) {
      CGContextSetCompositeOperation();
    }
    CGContextFillRects(v9, rectArray, rectCount);
    if (CompositeOperation != *((_DWORD *)v13 + 6)) {
      CGContextSetCompositeOperation();
    }
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __73__NSLayoutManager_fillBackgroundRectArray_count_forCharacterRange_color___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSLayoutManagerUseCompositeCopy");
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
}

- (void)drawStrikethroughForGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
}

- (void)strikethroughGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
}

- (void)underlineGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
}

- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSInteger)glyphCount font:(UIFont *)font textMatrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)CGContext
{
  long long v9 = *(_OWORD *)&textMatrix->c;
  v10[0] = *(_OWORD *)&textMatrix->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&textMatrix->tx;
  [(NSLayoutManager *)self _showCGGlyphs:glyphs positions:positions count:glyphCount font:font textMatrix:v10 attributes:attributes inContext:CGContext];
}

- (void)showAttachmentCell:(NSCell *)cell inRect:(NSRect)rect characterIndex:(NSUInteger)attachmentIndex
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  uint64_t v12 = (void *)[(NSCell *)cell attachment];
  if (v12)
  {
    [v12 lineLayoutPadding];
    if (v13 != 0.0)
    {
      CGFloat v14 = v13;
      v16.origin.double x = x;
      v16.origin.double y = y;
      v16.size.double width = width;
      v16.size.double height = height;
      NSRect v17 = NSInsetRect(v16, v14, 0.0);
      double x = v17.origin.x;
      double y = v17.origin.y;
      double width = v17.size.width;
      double height = v17.size.height;
    }
  }

  -[NSLayoutManager _showAttachmentCell:inRect:characterIndex:](self, "_showAttachmentCell:inRect:characterIndex:", cell, attachmentIndex, x, y, width, height);
}

- (void)coordinateAccess:(id)a3
{
  [(NSTextStorage *)self->_textStorage _lockForWriting];
  (*((void (**)(id, NSLayoutManager *))a3 + 2))(a3, self);
  textStorage = self->_textStorage;

  [(NSTextStorage *)textStorage _unlock];
}

- (id)destinationTextContainerForRange:(_NSRange)a3 inTextContainer:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(NSLayoutManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (NSUInteger v8 = objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:destinationTextContainerForRange:inTextContainer:", self, location, length, a4)) == 0)
  {
    [(NSLayoutManager *)self textStorage];
    id v9 = objc_alloc_init((Class)objc_opt_class());
    id v10 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v10, "setUsesFontLeading:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "usesFontLeading"));
    objc_msgSend(v10, "setAllowsOriginalFontMetricsOverride:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "allowsOriginalFontMetricsOverride"));
    objc_msgSend(v10, "setTypesetterBehavior:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "typesetterBehavior"));
    id v11 = objc_alloc((Class)objc_opt_class());
    [a4 size];
    NSUInteger v8 = objc_msgSend(v11, "initWithSize:");
    [a4 lineFragmentPadding];
    objc_msgSend(v8, "setLineFragmentPadding:");
    objc_msgSend(v8, "setExclusionPaths:", objc_msgSend(a4, "exclusionPaths"));
    objc_msgSend(v8, "setLineBreakMode:", objc_msgSend(a4, "lineBreakMode"));
    objc_msgSend(v8, "setMaximumNumberOfLines:", objc_msgSend(a4, "maximumNumberOfLines"));
    [v9 addLayoutManager:v10];
    [v10 addTextContainer:v8];

    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v9, "length"), -[NSTextStorage attributedSubstringFromRange:](-[NSLayoutManager textStorage](self, "textStorage"), "attributedSubstringFromRange:", location, length));
  }
  return v8;
}

- (id)layoutFragmentsForReplacingCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4 rect:(CGRect)a5 textContainer:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v15 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (length || [a4 length])
  {
    NSUInteger v16 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
    NSUInteger v18 = v17;
    v231.NSUInteger location = 0;
    v231.NSUInteger length = 0;
    double v19 = [(NSLayoutManager *)self textContainerForGlyphAtIndex:v17 + v16 - 1 effectiveRange:&v231];
    v232.NSUInteger location = v16;
    v232.NSUInteger length = v18;
    NSRange v20 = NSIntersectionRange(v232, v231);
    if ((v20.length || [a4 length])
      && (length || [(NSTextStorage *)[(NSLayoutManager *)self textStorage] length] != location)
      && v19 == a6)
    {
      [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v20.location effectiveRange:0];
      v259.origin.double x = x;
      v259.origin.double y = y;
      v259.size.double width = width;
      v259.size.double height = height;
      if (NSIntersectsRect(v241, v259)
        || ([(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v20.length + v20.location - 1 effectiveRange:0], v260.origin.x = x, v260.origin.y = y, v260.size.width = width, v260.size.double height = height, NSIntersectsRect(v242, v260)))
      {
        unint64_t v21 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v20.location, v20.length, 0);
        uint64_t v222 = v22;
        double v23 = (void *)[(NSTextStorage *)[(NSLayoutManager *)self textStorage] string];
        unint64_t v230 = 0;
        -[NSLayoutManager boundingRectForGlyphRange:inTextContainer:](self, "boundingRectForGlyphRange:inTextContainer:", v20.location, v20.length, a6);
        NSUInteger v25 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a6, x, y, width, height + v24);
        uint64_t v27 = v26;
        unint64_t v29 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v25, v26, 0);
        unint64_t v30 = v28;
        if (v25 > v231.location)
        {
          objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", &v230, 0, 0, v29, v28);
          unint64_t v31 = v230;
          if (v230 == v29)
          {
            objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", &v230, 0, 0, v29 - 1, 1);
            unint64_t v31 = v230;
          }
          if (v31 < v29)
          {
            unint64_t v30 = v29 + v30 - v31;
            unint64_t v29 = v31;
          }
        }
        NSUInteger v32 = v231.location;
        NSUInteger v33 = v231.length;
        if (v231.length + v231.location > v25 + v27)
        {
          objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", 0, 0, &v230, v29 + v30 - 1, 1);
          unint64_t v34 = v230;
          if (v230 == v29 + v30)
          {
            objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", 0, 0, &v230, v29 + v30, 1);
            unint64_t v34 = v230;
          }
          if (v34 > v29 + v30) {
            unint64_t v30 = v34 - v29;
          }
          NSUInteger v32 = v231.location;
          NSUInteger v33 = v231.length;
        }
        uint64_t v35 = v222;
        uint64_t v225 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v32, v33, 0);
        unint64_t v36 = v30 + v29;
        unint64_t v37 = v30 + v29 - v225;
        id v227 = -[NSLayoutManager destinationTextContainerForRange:inTextContainer:](self, "destinationTextContainerForRange:inTextContainer:", v225, v37, a6);
        unint64_t v38 = (void *)[v227 layoutManager];
        NSUInteger v39 = (void *)[v38 textStorage];
        unint64_t v214 = v37;
        unint64_t v220 = v36;
        if (a4) {
          objc_msgSend(v39, "replaceCharactersInRange:withAttributedString:", v21, v222, a4);
        }
        else {
          objc_msgSend(v39, "replaceCharactersInRange:withString:", v21, v222, &stru_1EDD49F70);
        }
        [v38 ensureLayoutForTextContainer:v227];
        uint64_t v213 = [a4 length];
        NSRect v226 = v15;
        if (v21 > v29)
        {
          uint64_t v40 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v29, v21 - v29, 0);
          uint64_t v42 = v41;
          [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v40 effectiveRange:0];
          CGFloat v44 = v43;
          CGFloat v46 = v45;
          CGFloat v48 = v47;
          CGFloat v50 = v49;
          uint64_t v51 = v42 + v40 - 1;
          [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v51 effectiveRange:0];
          v261.origin.double x = v52;
          v261.origin.double y = v53;
          v261.size.double width = v54;
          v261.size.double height = v55;
          v243.origin.double x = v44;
          v243.origin.double y = v46;
          v243.size.double width = v48;
          v243.size.double height = v50;
          NSRect v244 = NSUnionRect(v243, v261);
          double v215 = v244.size.height;
          double aRect = v244.origin.y;
          objc_msgSend(a6, "size", v244.origin.x);
          double v211 = v56;
          [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:v51 effectiveRange:0];
          CGFloat v58 = v57;
          CGFloat v60 = v59;
          CGFloat v62 = v61;
          CGFloat v64 = v63;
          uint64_t v65 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v29 - v225, v21 - v29, 0);
          uint64_t v67 = v66;
          [v38 lineFragmentRectForGlyphAtIndex:v65 effectiveRange:0];
          CGFloat v69 = v68;
          CGFloat v71 = v70;
          CGFloat v73 = v72;
          CGFloat v75 = v74;
          [v38 lineFragmentRectForGlyphAtIndex:v67 + v65 - 1 effectiveRange:0];
          v262.origin.double x = v76;
          v262.origin.double y = v77;
          v262.size.double width = v78;
          v262.size.double height = v79;
          v245.origin.double x = v69;
          v245.origin.double y = v71;
          v245.size.double width = v73;
          v245.size.double height = v75;
          NSRect v246 = NSUnionRect(v245, v262);
          double v80 = v246.origin.y;
          double v81 = v246.size.height;
          objc_msgSend(v227, "size", v246.origin.x);
          double v83 = v82;
          [v38 lineFragmentUsedRectForGlyphAtIndex:v67 + v65 - 1 effectiveRange:0];
          v263.origin.double x = v84;
          v263.origin.double y = v85;
          v263.size.double width = v86;
          v263.size.double height = v87;
          v247.origin.double x = v58;
          v247.origin.double y = v60;
          v247.size.double width = v62;
          v247.size.double height = v64;
          uint64_t v88 = !NSEqualRects(v247, v263);
          v233.double width = v211;
          v233.double height = v215;
          v237.double width = v83;
          v237.double height = v81;
          if (!NSEqualSizes(v233, v237)) {
            v88 |= 4uLL;
          }
          double v89 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v29, v21 - v29, v88, 0.0, aRect, v211, v215);
          if ([(NSTextLayoutFragment *)v89 animationType])
          {
            -[NSTextLayoutFragment setDestinationTextStorage:](v89, "setDestinationTextStorage:", [v38 textStorage]);
            [(NSTextLayoutFragment *)v89 setDestinationLayoutManager:v38];
            -[NSTextLayoutFragment setDestinationGlyphRange:](v89, "setDestinationGlyphRange:", v65, v67);
            [(NSTextLayoutFragment *)v89 setDestinationVerticalDelta:-v80];
            -[NSTextLayoutFragment setDestinationBoundingRect:](v89, "setDestinationBoundingRect:", 0.0, v80, v83, v81);
          }
          [v226 addObject:v89];

          uint64_t v35 = v222;
        }
        uint64_t v90 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21, v35, 0);
        uint64_t v92 = v91;
        [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v90 effectiveRange:0];
        double v97 = v96;
        if (v92)
        {
          CGFloat v98 = v93;
          CGFloat v99 = v94;
          CGFloat v100 = v95;
          [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v92 + v90 - 1 effectiveRange:0];
          v264.origin.double x = v101;
          v264.origin.double y = v102;
          v264.size.double width = v103;
          v264.size.double height = v104;
          v248.origin.double x = v98;
          v248.origin.double y = v97;
          v248.size.double width = v99;
          v248.size.double height = v100;
          NSRect v249 = NSUnionRect(v248, v264);
          double v97 = v249.origin.y;
          double v105 = v249.size.height;
          -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v92 + v90 - 1, 0, v249.origin.x);
          CGFloat v107 = v106;
          CGFloat v109 = v108;
          CGFloat v223 = v110;
          aRectCGFloat a = v111;
          [a6 size];
          double v216 = v112;
        }
        else
        {
          double v105 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
          double v216 = *MEMORY[0x1E4F28AE0];
          CGFloat v107 = *MEMORY[0x1E4F28AD8];
          CGFloat v109 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
          CGFloat v223 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
          aRectCGFloat a = *(double *)(MEMORY[0x1E4F28AD8] + 24);
        }
        [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:v90 effectiveRange:0];
        CGFloat v210 = v114;
        CGFloat v212 = v113;
        CGFloat v208 = v116;
        CGFloat v209 = v115;
        uint64_t v117 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v21 - v225, objc_msgSend(a4, "length"), 0);
        uint64_t v119 = v118;
        [v38 lineFragmentRectForGlyphAtIndex:v117 effectiveRange:0];
        double v124 = v123;
        if (v119)
        {
          CGFloat v125 = v120;
          CGFloat v126 = v121;
          CGFloat v127 = v122;
          uint64_t v128 = v119 + v117 - 1;
          [v38 lineFragmentRectForGlyphAtIndex:v128 effectiveRange:0];
          v265.origin.double x = v129;
          v265.origin.double y = v130;
          v265.size.double width = v131;
          v265.size.double height = v132;
          v250.origin.double x = v125;
          v250.origin.double y = v124;
          v250.size.double width = v126;
          v250.size.double height = v127;
          NSRect v251 = NSUnionRect(v250, v265);
          double v124 = v251.origin.y;
          double v133 = v251.size.height;
          objc_msgSend(v227, "size", v251.origin.x);
          double v135 = v134;
        }
        else
        {
          double v135 = *MEMORY[0x1E4F28AE0];
          double v133 = *(double *)(MEMORY[0x1E4F28AE0] + 8);
          uint64_t v128 = v117 - 1;
        }
        [v38 lineFragmentUsedRectForGlyphAtIndex:v128 effectiveRange:0];
        v266.origin.double x = v136;
        v266.origin.double y = v137;
        v266.size.double width = v138;
        v266.size.double height = v139;
        v252.origin.double x = v107;
        v252.origin.double y = v109;
        v252.size.double width = v223;
        v252.size.double height = aRecta;
        if (!NSEqualRects(v252, v266)) {
          goto LABEL_38;
        }
        [v38 lineFragmentUsedRectForGlyphAtIndex:v117 effectiveRange:0];
        v267.origin.double x = v140;
        v267.origin.double y = v141;
        v267.size.double width = v142;
        v267.size.double height = v143;
        v253.origin.double y = v210;
        v253.origin.double x = v212;
        v253.size.double height = v208;
        v253.size.double width = v209;
        uint64_t v144 = 0;
        if (!NSEqualRects(v253, v267)) {
LABEL_38:
        }
          uint64_t v144 = 1;
        v234.double width = v216;
        v234.double height = v105;
        v238.double width = v135;
        v238.double height = v133;
        if (!NSEqualSizes(v234, v238)) {
          v144 |= 4uLL;
        }
        double v145 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v21, v35, v144, 0.0, v97, v216, v105);
        if ([(NSTextLayoutFragment *)v145 animationType])
        {
          -[NSTextLayoutFragment setDestinationTextStorage:](v145, "setDestinationTextStorage:", [v38 textStorage]);
          [(NSTextLayoutFragment *)v145 setDestinationLayoutManager:v38];
          -[NSTextLayoutFragment setDestinationGlyphRange:](v145, "setDestinationGlyphRange:", v117, v119);
          [(NSTextLayoutFragment *)v145 setDestinationVerticalDelta:-v124];
          -[NSTextLayoutFragment setDestinationBoundingRect:](v145, "setDestinationBoundingRect:", 0.0, v124, v135, v133);
        }
        int v15 = v226;
        [v226 addObject:v145];

        uint64_t v146 = v220 - (v21 + v35);
        if (v220 != v21 + v35)
        {
          unint64_t v228 = 0;
          uint64_t v229 = 0;
          uint64_t v147 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21 + v35, v220 - (v21 + v35), 0);
          uint64_t v149 = v148;
          [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v147 effectiveRange:0];
          CGFloat v151 = v150;
          CGFloat v153 = v152;
          CGFloat v155 = v154;
          CGFloat v157 = v156;
          [(NSLayoutManager *)self lineFragmentRectForGlyphAtIndex:v149 + v147 - 1 effectiveRange:0];
          v268.origin.double x = v158;
          v268.origin.double y = v159;
          v268.size.double width = v160;
          v268.size.double height = v161;
          v254.origin.double x = v151;
          v254.origin.double y = v153;
          v254.size.double width = v155;
          v254.size.double height = v157;
          NSRect v255 = NSUnionRect(v254, v268);
          double v162 = v255.origin.y;
          double v163 = v255.size.height;
          objc_msgSend(a6, "size", v255.origin.x);
          double v165 = v164;
          [(NSLayoutManager *)self lineFragmentUsedRectForGlyphAtIndex:v147 effectiveRange:0];
          CGFloat v221 = v167;
          CGFloat v224 = v166;
          double v169 = v168;
          aRectCGFloat b = v170;
          unint64_t v230 = [a4 length] + v21;
          unint64_t v171 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v230 - v225, v225 - v35 + v213 + v214 - v230, 0);
          uint64_t v173 = v172;
          [v38 lineFragmentRectForGlyphAtIndex:v171 effectiveRange:&v228];
          CGFloat v175 = v174;
          CGFloat v177 = v176;
          CGFloat v179 = v178;
          CGFloat v181 = v180;
          if (v228 < v171)
          {
            double v182 = (void *)[MEMORY[0x1E4F28B88] newlineCharacterSet];
            char v183 = objc_msgSend((id)objc_msgSend(v38, "textStorage"), "string");
            if (objc_msgSend(v182, "longCharacterIsMember:", objc_msgSend(v183, "characterAtIndex:", v230 - v225)))
            {
              unint64_t v184 = v171 + v173;
              unint64_t v171 = v229 + v228;
              uint64_t v173 = v184 - (v229 + v228);
              [v38 lineFragmentRectForGlyphAtIndex:v229 + v228 effectiveRange:0];
              CGFloat v175 = v185;
              CGFloat v177 = v186;
              CGFloat v179 = v187;
              CGFloat v181 = v188;
            }
          }
          [v38 lineFragmentRectForGlyphAtIndex:v173 + v171 - 1 effectiveRange:0];
          v269.origin.double x = v189;
          v269.origin.double y = v190;
          v269.size.double width = v191;
          v269.size.double height = v192;
          v256.origin.double x = v175;
          v256.origin.double y = v177;
          v256.size.double width = v179;
          v256.size.double height = v181;
          NSRect v257 = NSUnionRect(v256, v269);
          double v193 = v257.origin.y;
          double v194 = v257.size.height;
          objc_msgSend(v227, "size", v257.origin.x);
          double v196 = v195;
          v235.double x = 0.0;
          v239.double x = 0.0;
          v235.double y = v162;
          v239.double y = v193;
          BOOL v197 = NSEqualPoints(v235, v239);
          v236.double width = v165;
          v236.double height = v163;
          v240.double width = v196;
          v240.double height = v194;
          BOOL v198 = NSEqualSizes(v236, v240);
          BOOL v199 = !v197;
          if (v197) {
            uint64_t v200 = 0;
          }
          else {
            uint64_t v200 = 2;
          }
          if (v199) {
            CGFloat v201 = v193;
          }
          else {
            CGFloat v201 = v169;
          }
          [v38 lineFragmentUsedRectForGlyphAtIndex:v171 effectiveRange:0];
          v270.origin.double x = v202;
          v270.origin.double y = v203;
          v270.size.double width = v204;
          v270.size.double height = v205;
          v258.size.double width = v221;
          v258.origin.double x = v224;
          v258.origin.double y = v201;
          v258.size.double height = aRectb;
          uint64_t v206 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v21 + v35, v146, v200 | (!NSEqualRects(v258, v270) || !v198), 0.0, v162, v165, v163);
          if ([(NSTextLayoutFragment *)v206 animationType]) {
            -[NSTextLayoutFragment setDestinationBoundingRect:](v206, "setDestinationBoundingRect:", 0.0, v193, v196, v194);
          }
          int v15 = v226;
          if ([(NSTextLayoutFragment *)v206 animationType])
          {
            -[NSTextLayoutFragment setDestinationTextStorage:](v206, "setDestinationTextStorage:", [v38 textStorage]);
            [(NSTextLayoutFragment *)v206 setDestinationLayoutManager:v38];
            -[NSTextLayoutFragment setDestinationGlyphRange:](v206, "setDestinationGlyphRange:", v171, v173);
            [(NSTextLayoutFragment *)v206 setDestinationVerticalDelta:-v193];
          }
          [v226 addObject:v206];
        }
      }
    }
  }
  return v15;
}

@end