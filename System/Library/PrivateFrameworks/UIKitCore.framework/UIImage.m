@interface UIImage
+ (BOOL)_isCGImageAlphaMask:(CGImage *)a3;
+ (BOOL)supportsSecureCoding;
+ (CGSize)_applyOrientation:(int64_t)a3 toContentSizeInPixels:(CGSize)result;
+ (CGSize)_legibilityImageSizeForSize:(CGSize)a3 style:(int64_t)a4;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (UIEdgeInsets)_edgeInsetsForStylePresetNames:(id)a3 scale:(double)a4 traitCollection:(id)a5;
+ (UIImage)actionsImage;
+ (UIImage)addImage;
+ (UIImage)animatedImageNamed:(NSString *)name duration:(NSTimeInterval)duration;
+ (UIImage)animatedImageWithImages:(NSArray *)images duration:(NSTimeInterval)duration;
+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets duration:(NSTimeInterval)duration;
+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode duration:(NSTimeInterval)duration;
+ (UIImage)checkmarkImage;
+ (UIImage)imageNamed:(NSString *)name;
+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration;
+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle withConfiguration:(UIImageConfiguration *)configuration;
+ (UIImage)imageWithCGImage:(CGImageRef)cgImage;
+ (UIImage)imageWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation;
+ (UIImage)imageWithCIImage:(CIImage *)ciImage;
+ (UIImage)imageWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation;
+ (UIImage)imageWithContentsOfCPBitmapFile:(id)a3 flags:(int)a4;
+ (UIImage)imageWithContentsOfFile:(NSString *)path;
+ (UIImage)imageWithData:(NSData *)data;
+ (UIImage)imageWithData:(NSData *)data scale:(CGFloat)scale;
+ (UIImage)removeImage;
+ (UIImage)strokedCheckmarkImage;
+ (UIImage)systemImageNamed:(NSString *)name;
+ (UIImage)systemImageNamed:(NSString *)name compatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (UIImage)systemImageNamed:(NSString *)name variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration;
+ (UIImage)systemImageNamed:(NSString *)name withConfiguration:(UIImageConfiguration *)configuration;
+ (id)_ISImageDescriptorNameForUIApplicationIconFormat:(int)a3;
+ (id)__systemImageNamed:(id)a3;
+ (id)__systemImageNamedSwift:(id)a3;
+ (id)_animatedImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 duration:(double)a6;
+ (id)_animatedResizableImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 capInsets:(UIEdgeInsets)a6 resizingMode:(int64_t)a7 duration:(double)a8;
+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4;
+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5;
+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5 style:(int64_t)a6;
+ (id)_backgroundGradientWithStartColor:(id)a3 andEndColor:(id)a4;
+ (id)_baseImageDescriptorForUIApplicationIconFormat:(int)a3;
+ (id)_cachedImageForKey:(id)a3 fromBlock:(id)a4;
+ (id)_defaultBackgroundGradient;
+ (id)_deviceSpecificImageNamed:(id)a3;
+ (id)_deviceSpecificImageNamed:(id)a3 inBundle:(id)a4;
+ (id)_generateCompositedSymbolImageForAsset:(id)a3 usingLayers:(id)a4 configuration:(id)a5 alignUsingBaselines:(BOOL)a6;
+ (id)_iconForResourceProxy:(id)a3 format:(int)a4;
+ (id)_iconForResourceProxy:(id)a3 format:(int)a4 options:(unint64_t)a5;
+ (id)_imageNamed:(id)a3 withTrait:(id)a4;
+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3;
+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3;
+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5;
+ (id)_imageWithIcon:(void *)a3 descriptor:;
+ (id)_kitImageNamed:(id)a3 withTrait:(id)a4;
+ (id)_noiseImage;
+ (id)_systemImageNamed:(id)a3;
+ (id)_systemImageNamed:(id)a3 fallback:(id)a4;
+ (id)_systemImageNamed:(id)a3 fallback:(id)a4 withConfiguration:(id)a5;
+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4;
+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5;
+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5 withConfiguration:(id)a6;
+ (id)_systemImageNamed:(id)a3 variableValue:(double)a4 withConfiguration:(id)a5;
+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4;
+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4 withConfiguration:(id)a5;
+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4;
+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4 allowPrivate:(BOOL)a5;
+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 effectsImage:(id)a5 maskImage:(id)a6 style:(int)a7;
+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7;
+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7 edgeInsets:(UIEdgeInsets)a8;
+ (id)imageAtPath:(id)a3;
+ (id)imageFromAlbumArtData:(id)a3 height:(int)a4 width:(int)a5 bytesPerRow:(int)a6 cache:(BOOL)a7;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageNamed:(id)a3 withConfiguration:(id)a4;
+ (id)kitImageNamed:(id)a3;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)preferredSymbolImageNamed:(id)a3;
+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5;
+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5 traitCollection:(id)a6 inBundle:(id)a7;
+ (id)symbolImageNamed:(id)a3;
+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5;
+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5 traitCollection:(id)a6 inBundle:(id)a7;
+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6;
+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6 traitCollection:(id)a7 inBundle:(id)a8;
+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 idiom:(int64_t)a4 scale:(double *)a5;
+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 scale:(double *)a4;
+ (int64_t)_horizontallyFlippedOrientationForOrientation:(int64_t)a3;
+ (int64_t)_idiomDefinedByPath:(id)a3;
+ (int64_t)_mirroredImageOrientationForOrientation:(int64_t)a3;
+ (unint64_t)_scaleDefinedByPath:(id)a3;
+ (void)_dropResourceReferencesForURL:(id)a3;
+ (void)_flushCache:(id)a3;
+ (void)_flushSharedImageCache;
+ (void)_loadImageFromURL:(id)a3 completionHandler:(id)a4;
+ (void)initialize;
- ($8452678F12DBC466148836A9D382CAFC)_calculateEdgeStatistics;
- ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics;
- ($8452678F12DBC466148836A9D382CAFC)_calculateStatisticsOfEdge:(SEL)a3;
- (BOOL)_canEncodeWithName:(id)a3 coder:(id)a4;
- (BOOL)_hasBaseline;
- (BOOL)_hasContentInsets;
- (BOOL)_hasExplicitAlignmentRectInsets;
- (BOOL)_hasExplicitBaseline;
- (BOOL)_hasExplicitContentInsets;
- (BOOL)_hasImageAsset;
- (BOOL)_hasVisibleContentInRect:(CGRect)a3 atScale:(double)a4;
- (BOOL)_isAlphaMask;
- (BOOL)_isCGImageOnly;
- (BOOL)_isCached;
- (BOOL)_isColoredSymbolImage;
- (BOOL)_isDecompressing;
- (BOOL)_isHierarchicalColorSymbolImage;
- (BOOL)_isInvisibleAndGetIsTranslucent:(BOOL *)a3;
- (BOOL)_isMultiColorSymbolImage;
- (BOOL)_isNamed;
- (BOOL)_isPDFVector;
- (BOOL)_isPaletteColorSymbolImage;
- (BOOL)_isRTLImage;
- (BOOL)_isResizable;
- (BOOL)_isSVGVector;
- (BOOL)_isSameSymbolImageExceptVariableValue:(id)a3;
- (BOOL)_isSubimage;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3;
- (BOOL)_probeIsSeeThrough;
- (BOOL)_representsCIImageWhichSupportsIOSurfaceRendering;
- (BOOL)_representsLayeredImage;
- (BOOL)_shouldDrawVectorContentDirectly;
- (BOOL)_suppressesAccessibilityHairlineThickening;
- (BOOL)flipsForRightToLeftLayoutDirection;
- (BOOL)hasBaseline;
- (BOOL)hasContentInsets;
- (BOOL)hasMidline;
- (BOOL)hasPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromStatusBarImageProvider;
- (BOOL)isHighDynamicRange;
- (BOOL)isSymbolImage;
- (BOOL)writeToCPBitmapFile:(id)a3 flags:(int)a4;
- (CGColor)_tiledPatternColor;
- (CGFloat)baselineOffsetFromBottom;
- (CGFloat)scale;
- (CGImage)imageRef;
- (CGImageRef)CGImage;
- (CGPDFPage)_CGPDFPage;
- (CGRect)_contentRectInPixels;
- (CGRect)_contentStretchInPixels;
- (CGSVGDocument)_CGSVGDocument;
- (CGSize)_CGPDFPageSize;
- (CGSize)_CGSVGDocumentSize;
- (CGSize)_fullSize;
- (CGSize)_sizeInPixels;
- (CGSize)_sizeInPixelsFromPDF;
- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4;
- (CIImage)CIImage;
- (NSArray)images;
- (NSInteger)leftCapWidth;
- (NSInteger)topCapHeight;
- (NSString)_asMenuElementImageName;
- (NSString)description;
- (NSTimeInterval)duration;
- (UIEdgeInsets)_contentInsets;
- (UIEdgeInsets)_inverseAlignmentRectInsets;
- (UIEdgeInsets)_subimageInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)capInsets;
- (UIEdgeInsets)padding;
- (UIGraphicsImageRendererFormat)imageRendererFormat;
- (UIImage)imageByApplyingSymbolConfiguration:(UIImageSymbolConfiguration *)configuration;
- (UIImage)imageByPreparingForDisplay;
- (UIImage)imageByPreparingThumbnailOfSize:(CGSize)size;
- (UIImage)imageFlippedForRightToLeftLayoutDirection;
- (UIImage)imageRestrictedToStandardDynamicRange;
- (UIImage)imageWithAlignmentRectInsets:(UIEdgeInsets)alignmentInsets;
- (UIImage)imageWithBaselineOffsetFromBottom:(CGFloat)baselineOffset;
- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration;
- (UIImage)imageWithHorizontallyFlippedOrientation;
- (UIImage)imageWithRenderingMode:(UIImageRenderingMode)renderingMode;
- (UIImage)imageWithTintColor:(UIColor *)color;
- (UIImage)imageWithTintColor:(UIColor *)color renderingMode:(UIImageRenderingMode)renderingMode;
- (UIImage)imageWithoutBaseline;
- (UIImage)init;
- (UIImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4;
- (UIImage)initWithCGImage:(CGImageRef)cgImage;
- (UIImage)initWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation;
- (UIImage)initWithCIImage:(CIImage *)ciImage;
- (UIImage)initWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation;
- (UIImage)initWithCoder:(id)a3;
- (UIImage)initWithContentsOfFile:(NSString *)path;
- (UIImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4;
- (UIImage)initWithData:(NSData *)data;
- (UIImage)initWithData:(NSData *)data scale:(CGFloat)scale;
- (UIImage)initWithData:(id)a3 cache:(BOOL)a4;
- (UIImage)initWithIOSurface:(__IOSurface *)a3;
- (UIImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets;
- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode;
- (UIImage)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;
- (UIImageAsset)imageAsset;
- (UIImageConfiguration)configuration;
- (UIImageOrientation)imageOrientation;
- (UIImageRenderingMode)renderingMode;
- (UIImageResizingMode)resizingMode;
- (UIImageSymbolConfiguration)_automaticSymbolConfiguration;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (UITraitCollection)traitCollection;
- (__IOSurface)_copyIOSurface;
- (__IOSurface)ioSurface;
- (double)__baselineOffsetFromBottom;
- (double)_baselineOffsetFromBottom;
- (double)_capHeight;
- (double)_scaleFromPDF;
- (double)midlineOffsetFromCenter;
- (double)variableValue;
- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4;
- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4 scale:(double)a5;
- (id)_applyBackdropViewSettings:(id)a3;
- (id)_applyBackdropViewSettings:(id)a3 allowImageResizing:(BOOL)a4;
- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5;
- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 allowImageResizing:(BOOL)a6;
- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5;
- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6;
- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6 allowImageResizing:(BOOL)a7;
- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11;
- (id)_bundle;
- (id)_colorForFlattening;
- (id)_colorForName:(id)a3 withTraitCollection:(id)a4;
- (id)_defaultConfiguration;
- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14;
- (id)_flatImageWithColor:(id)a3;
- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4;
- (id)_identityDescription;
- (id)_imageByApplyingSymbolVariant:(id)a3;
- (id)_imageByApplyingVariant:(unint64_t)a3 allowNone:(BOOL)a4;
- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4;
- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4 alphaOnly:(BOOL)a5;
- (id)_imageForLegibilityStyle:(int64_t)a3;
- (id)_imagePaddedByInsets:(UIEdgeInsets)a3;
- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4;
- (id)_imageThatSuppressesAccessibilityHairlineThickening;
- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5;
- (id)_imageWithBitmapRepresentation;
- (id)_imageWithBrightnessModifiedForLegibilityStyle:(int64_t)a3;
- (id)_imageWithContent:(id)a3;
- (id)_imageWithContentInsets:(UIEdgeInsets)a3;
- (id)_imageWithContentInsets:(UIEdgeInsets)a3 withUpdatedCGImage:(BOOL)a4;
- (id)_imageWithImageAsset:(id)a3;
- (id)_imageWithImageAsset:(id)a3 configuration:(id)a4;
- (id)_imageWithSize:(CGSize)a3;
- (id)_imageWithSize:(CGSize)a3 content:(id)a4;
- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5;
- (id)_imageWithSymbolMetricsFromNamedVectorGlyph:(id)a3;
- (id)_imageWithVariableValue:(double)a3;
- (id)_initWithCGPDFPage:(CGPDFPage *)a3;
- (id)_initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3;
- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4;
- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4 alignUsingBaselines:(BOOL)a5;
- (id)_initWithContent:(id)a3 orientation:(int64_t)a4;
- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6;
- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7;
- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4;
- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5;
- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5 scale:(double)a6;
- (id)_initWithData:(id)a3 scale:(double)a4;
- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4;
- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5;
- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5 withName:(id)a6;
- (id)_initWithIOSurface:(__IOSurface *)a3 imageOrientation:(int64_t)a4;
- (id)_initWithIOSurface:(__IOSurface *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (id)_initWithOtherImage:(id)a3;
- (id)_metricsDescription;
- (id)_outlinePath;
- (id)_primitiveImageAsset;
- (id)_rasterizedImage;
- (id)_resizableImageWithSubimageInsets:(UIEdgeInsets)a3 resizeInsets:(UIEdgeInsets)a4;
- (id)_serializedData;
- (id)_stretchableImageWithCapInsets:(UIEdgeInsets)a3;
- (id)_swizzleContent:(id)a3;
- (id)content;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)patternColor;
- (int64_t)_effectiveRenderingModeWithSymbolConfiguration:(id)a3;
- (int64_t)_imageOrientationConsideringRTL;
- (int64_t)_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3;
- (int64_t)_imageOrientationForSymbolLayerConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3;
- (unint64_t)hash;
- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4;
- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5;
- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5 alphaOnly:(BOOL)a6;
- (void)_drawImageForLegibilityStyle:(int64_t)a3 size:(CGSize)a4;
- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5;
- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5 scale:(double)a6 applyContentsTransform:(BOOL)a7;
- (void)_encodeDataWithCoder:(id)a3 imageName:(id)a4;
- (void)_encodePropertiesWithCoder:(id)a3;
- (void)_horizontallyFlipImageOrientation;
- (void)_mirrorImageOrientation;
- (void)_prepareForScreen:(id)a3 completionHandler:(id)a4;
- (void)_removeBaseline;
- (void)_removeBaselineExplicitly;
- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)_setAlignmentRectInsetsExplicitly:(UIEdgeInsets)a3;
- (void)_setBaselineOffsetFromBottom:(double)a3;
- (void)_setBaselineOffsetFromBottomExplicitly:(double)a3;
- (void)_setCached:(BOOL)a3;
- (void)_setCapHeight:(double)a3;
- (void)_setColorForFlattening:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setContentInsets:(UIEdgeInsets)a3;
- (void)_setContentInsetsExplicitly:(UIEdgeInsets)a3;
- (void)_setImageAsset:(id)a3;
- (void)_setIsFlippedInRightToLeft;
- (void)_setNamed:(BOOL)a3;
- (void)_setRenderingMode:(int64_t)a3;
- (void)_setSuppressesAccessibilityHairlineThickening:(BOOL)a3;
- (void)_setSymbolMetricsFromNamedVectorGlyph:(id)a3;
- (void)compositeToPoint:(CGPoint)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6;
- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4;
- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4 fraction:(double)a5;
- (void)compositeToRect:(CGRect)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6;
- (void)dealloc;
- (void)draw1PartImageInRect:(CGRect)a3;
- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4;
- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4 operation:(int)a5;
- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4;
- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5;
- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6;
- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4;
- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5;
- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6;
- (void)drawAsPatternInRect:(CGRect)rect;
- (void)drawAtPoint:(CGPoint)point;
- (void)drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void)drawInRect:(CGRect)rect;
- (void)drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForDisplayWithCompletionHandler:(void *)completionHandler;
- (void)prepareThumbnailOfSize:(CGSize)size completionHandler:(void *)completionHandler;
- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3;
@end

@implementation UIImage

+ (UIEdgeInsets)_edgeInsetsForStylePresetNames:(id)a3 scale:(double)a4 traitCollection:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (__CFString *)a5;
  if ([v7 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      uint64_t v13 = *(void *)off_1E52D22C8;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (([v15 isEqualToString:v13] & 1) == 0
            && ![v15 isEqualToString:@"_UIKitBoldTintStyle"])
          {
            double v23 = 0.0;
            double v24 = 0.0;
            double v25 = 0.0;
            double v26 = 0.0;
            goto LABEL_23;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v16 = v9;

    _UIKitGetTextEffectsCatalog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc_init(MEMORY[0x1E4F5E088]);
    [v17 setState:0];
    [v17 setValue:0];
    v18 = -[UITraitCollection _styleEffectAppearanceName](v8);
    [v17 setAppearanceName:v18];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      double v23 = 0.0;
      double v24 = 0.0;
      double v25 = 0.0;
      double v26 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(v9, "styledInsetsForStylePresetName:styleConfiguration:foregroundColor:scale:", *(void *)(*((void *)&v36 + 1) + 8 * j), v17, 0, a4, (void)v36);
          double v26 = v26 - v28 / a4;
          double v25 = v25 - v29 / a4;
          double v24 = v24 - v30 / a4;
          double v23 = v23 - v31 / a4;
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v21);
    }
    else
    {
      double v23 = 0.0;
      double v24 = 0.0;
      double v25 = 0.0;
      double v26 = 0.0;
    }

LABEL_23:
  }
  else
  {
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    double v26 = 0.0;
  }

  double v32 = v26;
  double v33 = v25;
  double v34 = v24;
  double v35 = v23;
  result.right = v35;
  result.bottom = v34;
  result.left = v33;
  result.top = v32;
  return result;
}

- (UIImage)imageWithConfiguration:(UIImageConfiguration *)configuration
{
  v4 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, configuration, 0);
  if ([(UIImage *)self _isSymbolImage])
  {
    v5 = [(UIImage *)self symbolConfiguration];
    id v6 = v4;
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = objc_opt_class();
    if (v7 == objc_opt_class())
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_5:
        id v9 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
        id v10 = [v9 configurationByApplyingConfiguration:v6];

        if (!v10) {
          goto LABEL_22;
        }
LABEL_21:
        if ([v10 _isUnspecified])
        {
LABEL_22:
          id v17 = 0;
LABEL_32:

          goto LABEL_33;
        }
        id v10 = v10;
        id v19 = v5;
        uint64_t v20 = v19;
        if (v10 == v19)
        {

          id v17 = 0;
          id v10 = v20;
        }
        else
        {
          if (v19)
          {
            char v21 = [v10 isEqual:v19];

            if (v21) {
              goto LABEL_22;
            }
          }
          else
          {
          }
          uint64_t v20 = [(UIImage *)self _primitiveImageAsset];
          id v17 = [v20 imageWithConfiguration:v10];
        }

        goto LABEL_32;
      }
    }
    id v10 = v6;
    goto LABEL_21;
  }
  uint64_t v11 = self->_configuration;
  uint64_t v12 = v4;
  uint64_t v13 = v11;
  if (v12 == v13)
  {

LABEL_16:
    id v17 = 0;
    goto LABEL_39;
  }
  v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
  }
  else
  {
    BOOL v16 = [(UIImageConfiguration *)v12 isEqual:v13];

    if (v16) {
      goto LABEL_16;
    }
  }
  v18 = [(UIImage *)self _primitiveImageAsset];
  v5 = v18;
  if (v18)
  {
    id v17 = [v18 imageWithConfiguration:v12];
LABEL_33:
    int v22 = 1;
    goto LABEL_34;
  }
  id v17 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [v17 _setConfiguration:v12];
  int v22 = 0;
LABEL_34:

  if (v17 && ([v17 isEqual:self] & 1) == 0)
  {
    if (v22)
    {
      uint64_t v23 = [objc_alloc((Class)objc_opt_class()) _initWithOtherImage:v17];

      id v17 = (void *)v23;
    }
    [(_UIImageContent *)self->_content variableValue];
    objc_msgSend(v17, "_imageWithVariableValue:");
    double v24 = (UIImage *)objc_claimAutoreleasedReturnValue();

    [(UIImage *)self _configureImage:v24 assumePreconfigured:1];
    self = v24;
    id v17 = v24;
  }
LABEL_39:
  double v25 = self;

  return v25;
}

- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4
{
  BOOL v4 = a4;
  v14 = (char *)a3;
  if (!v4)
  {
    id v6 = [(UIImage *)self configuration];
    [v14 _setConfiguration:v6];
  }
  if ([(UIImage *)self _isSymbolImage] && !*((void *)v14 + 1))
  {
    [v14 _setImageAsset:self->_imageAsset];
    [v14 _setNamed:*(_DWORD *)&self->_imageFlags & 1];
    if (!v4) {
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
    goto LABEL_9;
  }
  if (![(UIImage *)self _hasExplicitBaseline]) {
    goto LABEL_15;
  }
LABEL_9:
  if ([(UIImage *)self hasBaseline])
  {
    [(UIImage *)self baselineOffsetFromBottom];
    objc_msgSend(v14, "_setBaselineOffsetFromBottom:");
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    [v14 _removeBaseline];
    if (!v4)
    {
LABEL_11:
      *((void *)v14 + 12) = *(void *)&self->_capHeight;
      *((_DWORD *)v14 + 26) = *((_DWORD *)v14 + 26) & 0xFFFDFFFF | (((*(_DWORD *)&self->_imageFlags >> 17) & 1) << 17);
      *(CGSize *)(v14 + 72) = self->_sizeInPixels;
      if ([(UIImage *)self _hasExplicitContentInsets]) {
        int v7 = 0x4000;
      }
      else {
        int v7 = 0;
      }
      goto LABEL_17;
    }
  }
LABEL_15:
  if (![(UIImage *)self _hasExplicitContentInsets]) {
    goto LABEL_18;
  }
  int v7 = 0x4000;
LABEL_17:
  [(UIImage *)self _contentInsets];
  *((void *)v14 + 5) = v8;
  *((void *)v14 + 6) = v9;
  *((void *)v14 + 7) = v10;
  *((void *)v14 + 8) = v11;
  *((_DWORD *)v14 + 26) = *((_DWORD *)v14 + 26) & 0xFFFFBFFF | v7;
  if (v4)
  {
LABEL_18:
    if (![(UIImage *)self _hasExplicitAlignmentRectInsets]) {
      goto LABEL_20;
    }
  }
  [(UIImage *)self alignmentRectInsets];
  objc_msgSend(v14, "_setAlignmentRectInsets:");
LABEL_20:
  if ([(UIImage *)self flipsForRightToLeftLayoutDirection]) {
    [v14 _setIsFlippedInRightToLeft];
  }
  int v12 = *((_DWORD *)v14 + 26) & 0xFFFFF9FF | (([(UIImage *)self renderingMode] & 3) << 9);
  *((_DWORD *)v14 + 26) = v12;
  *((_DWORD *)v14 + 26) = v12 & 0xFFFFFFDF | (32 * ((*(_DWORD *)&self->_imageFlags >> 5) & 1));
  uint64_t v13 = [(UIImage *)self _colorForFlattening];
  [v14 _setColorForFlattening:v13];

  objc_msgSend(v14, "_setSuppressesAccessibilityHairlineThickening:", -[UIImage _suppressesAccessibilityHairlineThickening](self, "_suppressesAccessibilityHairlineThickening"));
}

- (BOOL)isSymbolImage
{
  return [(_UIImageContent *)self->_content isVectorGlyph];
}

- (id)_colorForFlattening
{
  return objc_getAssociatedObject(self, sel__colorForFlattening);
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return *((unsigned char *)&self->_imageFlags + 2) & 1;
}

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  if ((*((unsigned char *)&self->_imageFlags + 1) & 8) != 0) {
    return 1;
  }
  [(_UIImageContent *)self->_content scale];
  if (v3 == 1.0
    || +[UIDevice _isWatchCompanion]
    || +[UIDevice _isWatch])
  {
    return 1;
  }
  return [(UIImage *)self _isSymbolImage];
}

- (int64_t)_effectiveRenderingModeWithSymbolConfiguration:(id)a3
{
  id v4 = a3;
  UIImageRenderingMode v5 = [(UIImage *)self renderingMode];
  if (v5 == UIImageRenderingModeAutomatic)
  {
    if ([(UIImage *)self _isMultiColorSymbolImage]
      && ([v4 _prefersMulticolor] & 1) != 0)
    {
      UIImageRenderingMode v5 = UIImageRenderingModeAlwaysOriginal;
    }
    else if ([(UIImage *)self _isSymbolImage])
    {
      UIImageRenderingMode v5 = UIImageRenderingModeAlwaysTemplate;
    }
    else
    {
      UIImageRenderingMode v5 = UIImageRenderingModeAlwaysOriginal;
    }
  }

  return v5;
}

- (UIImageRenderingMode)renderingMode
{
  return ((unint64_t)self->_imageFlags >> 9) & 3;
}

- (BOOL)_isMultiColorSymbolImage
{
  return [(_UIImageContent *)self->_content containsNamedColorStyles];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIImage *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      UIImageRenderingMode v5 = v4;
      id v6 = [(UIImage *)v5 content];
      content = self->_content;
      if (content == v6) {
        int v8 = 0;
      }
      else {
        int v8 = ![(_UIImageContent *)content isEqual:v6];
      }
      uint64_t v10 = [(UIImage *)v5 _primitiveImageAsset];
      int v11 = dyld_program_sdk_at_least();
      imageAsset = self->_imageAsset;
      if (v11 && imageAsset == v10) {
        int v13 = 0;
      }
      else {
        int v13 = ![(UIImageAsset *)imageAsset isEqual:v10];
      }
      BOOL v14 = [(UIImage *)self hasBaseline];
      if (v14 == [(UIImage *)v5 hasBaseline])
      {
        if ([(UIImage *)self hasBaseline])
        {
          [(UIImage *)self baselineOffsetFromBottom];
          double v17 = v16;
          [(UIImage *)v5 baselineOffsetFromBottom];
          BOOL v15 = vabdd_f64(v17, v18) > 0.0001;
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 1;
      }
      BOOL v19 = [(UIImage *)self hasMidline];
      if (v19 == [(UIImage *)v5 hasMidline])
      {
        if ([(UIImage *)self hasMidline])
        {
          [(UIImage *)self midlineOffsetFromCenter];
          double v22 = v21;
          [(UIImage *)v5 midlineOffsetFromCenter];
          BOOL v24 = v22 != v23;
        }
        else
        {
          BOOL v24 = 0;
        }
        char v9 = 0;
        if (((v8 | v13 | v15) & 1) != 0 || v24) {
          goto LABEL_19;
        }
        [(UIImage *)self scale];
        double v26 = v25;
        [(UIImage *)v5 scale];
        if (v26 == v27)
        {
          UIImageOrientation v28 = [(UIImage *)self imageOrientation];
          if (v28 == [(UIImage *)v5 imageOrientation])
          {
            UIImageRenderingMode v29 = [(UIImage *)self renderingMode];
            if (v29 == [(UIImage *)v5 renderingMode])
            {
              BOOL v30 = [(UIImage *)self flipsForRightToLeftLayoutDirection];
              if (v30 == [(UIImage *)v5 flipsForRightToLeftLayoutDirection])
              {
                BOOL v31 = [(UIImage *)self _suppressesAccessibilityHairlineThickening];
                if (v31 == [(UIImage *)v5 _suppressesAccessibilityHairlineThickening])
                {
                  [(UIImage *)self alignmentRectInsets];
                  double v33 = v32;
                  double v35 = v34;
                  double v37 = v36;
                  double v39 = v38;
                  [(UIImage *)v5 alignmentRectInsets];
                  char v9 = 0;
                  if (v35 == v43 && v33 == v40 && v39 == v42 && v37 == v41)
                  {
                    v44 = [(UIImage *)self _colorForFlattening];
                    v45 = [(UIImage *)v5 _colorForFlattening];
                    if (UIEqual(v44, v45))
                    {
                      uint64_t v46 = [(UIImage *)self configuration];
                      v47 = [(UIImage *)v5 configuration];
                      char v9 = UIEqual(v46, v47);
                    }
                    else
                    {
                      char v9 = 0;
                    }
                  }
                  goto LABEL_19;
                }
              }
            }
          }
        }
      }
      char v9 = 0;
LABEL_19:

      goto LABEL_20;
    }
    char v9 = 0;
  }
LABEL_20:

  return v9;
}

- (BOOL)hasBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 4) & 1;
}

- (BOOL)hasMidline
{
  return 0;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIImageConfiguration)configuration
{
  return self->_configuration;
}

- (CGFloat)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (id)_primitiveImageAsset
{
  return self->_imageAsset;
}

- (CGSize)_fullSize
{
  if (!self->_content)
  {
    if (dyld_program_sdk_at_least()) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"This UIImage instance unexpectedly has nil content. Did calling code create an image with [UIImage alloc] without also sending -init? That's unsupported. %p", self);
    }
    if (self->_configuration)
    {
      double v3 = +[_UIImageContent empty];
      content = self->_content;
      self->_content = v3;
    }
    else
    {
      UIImageRenderingMode v5 = self;
      content = [(UIImage *)v5 _initWithContent:0 orientation:[(UIImage *)v5 imageOrientation]];
    }
  }
  [(UIImage *)self _sizeInPixels];
  double v7 = v6;
  double v9 = v8;
  [(UIImage *)self scale];
  double v11 = v9 / v10;
  double v12 = v7 / v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGFloat)scale
{
  [(_UIImageContent *)self->_content scale];
  return result;
}

- (CGSize)_sizeInPixels
{
  double width = self->_sizeInPixels.width;
  double height = self->_sizeInPixels.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  configuration = self->_configuration;
  if (configuration)
  {
    id v4 = configuration;
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        configuration = 0;
        goto LABEL_7;
      }
    }
    configuration = self->_configuration;
  }
LABEL_7:
  return (UIImageSymbolConfiguration *)configuration;
}

- (UIImageSymbolConfiguration)_automaticSymbolConfiguration
{
  return [(_UIImageContent *)self->_content _automaticSymbolConfiguration];
}

- (int64_t)_imageOrientationConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3
{
  UIImageOrientation v5 = [(UIImage *)self imageOrientation];
  if ((*((unsigned char *)&self->_imageFlags + 2) & 1) == 0) {
    return v5;
  }
  BOOL v6 = +[UIView _enableRTL];
  if (a3 != 1 || !v6 || [(UIImage *)self _isRTLImage]) {
    return v5;
  }
  double v8 = objc_opt_class();
  return [v8 _horizontallyFlippedOrientationForOrientation:v5];
}

- (UIImageOrientation)imageOrientation
{
  unint64_t imageFlags = self->_imageFlags;
  if ((imageFlags & 2) == 0) {
    return (imageFlags >> 2) & 7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIImage.m", 1862, @"Don’t know how to obtain orientation from <%p:%@>", objc_opt_class(), self->_content object file lineNumber description];
  }
  content = self->_content;
  return [(_UIImageContent *)content orientation];
}

- (void)_setColorForFlattening:(id)a3
{
}

- (void)_setSuppressesAccessibilityHairlineThickening:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_unint64_t imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFF7FF | v3);
}

- (BOOL)_hasExplicitContentInsets
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 6) & 1;
}

- (void)_setConfiguration:(id)a3
{
}

- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3
{
  if ((*((unsigned char *)&self->_imageFlags + 1) & 0x80) == 0) {
    self->_alignmentRectInsets = a3;
  }
}

- (id)_initWithOtherImage:(id)a3
{
  UIImageOrientation v5 = a3;
  if (!v5)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIImage.m", 1410, @"Invalid parameter not satisfying: %@", @"otherImage != nil" object file lineNumber description];
  }
  uint64_t v6 = v5[2];
  if (v6) {
    double v7 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v6, [v5 imageOrientation]);
  }
  else {
    double v7 = [(UIImage *)self init];
  }
  double v8 = v7;
  if (v7) {
    [v5 _configureImage:v7 assumePreconfigured:0];
  }

  return v8;
}

- (id)_initWithContent:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIImage;
  double v7 = [(UIImage *)&v15 init];
  if (v7)
  {
    if (v6)
    {
      double v8 = (_UIImageContent *)v6;
    }
    else
    {
      double v8 = +[_UIImageContent empty];
    }
    content = v7->_content;
    v7->_content = v8;

    v7->_unint64_t imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v7->_imageFlags & 0xFFFFFFE3 | (4 * (a4 & 7)));
    [(_UIImageContent *)v7->_content sizeInPixels];
    +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", a4);
    v7->_sizeInPixels.double width = v10;
    v7->_sizeInPixels.double height = v11;
    uint64_t v12 = [(UIImage *)v7 _defaultConfiguration];
    configuration = v7->_configuration;
    v7->_configuration = (UIImageConfiguration *)v12;
  }
  return v7;
}

+ (CGSize)_applyOrientation:(int64_t)a3 toContentSizeInPixels:(CGSize)result
{
  if ((a3 & 2) != 0) {
    double height = result.height;
  }
  else {
    double height = result.width;
  }
  if ((a3 & 2) != 0) {
    result.double height = result.width;
  }
  double v5 = height;
  result.double width = v5;
  return result;
}

- (id)_defaultConfiguration
{
  [(_UIImageContent *)self->_content scale];
  v2 = +[UITraitCollection traitCollectionWithDisplayScale:](UITraitCollection, "traitCollectionWithDisplayScale:");
  int v3 = v2;
  if (v2) {
    v2 = (void *)[v2 imageConfiguration];
  }
  id v4 = v2;

  return v4;
}

- (void)_setBaselineOffsetFromBottom:(double)a3
{
  $6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = self->_imageFlags;
  if ((*(_WORD *)&imageFlags & 0x2000) == 0)
  {
    self->_baselineOffsetFromBottom = a3;
    self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&imageFlags | 0x1000);
  }
}

- (void)_setImageAsset:(id)a3
{
}

- (void)_setNamed:(BOOL)a3
{
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFFE | a3);
}

- (id)_imageWithVariableValue:(double)a3
{
  id v4 = [(_UIImageContent *)self->_content contentWithVariableValue:a3];
  if (self->_content == v4)
  {
    double v5 = self;
  }
  else
  {
    double v5 = [(UIImage *)self _imageWithContent:v4];
  }
  id v6 = v5;

  return v6;
}

- (BOOL)_hasExplicitBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 5) & 1;
}

- (BOOL)_hasExplicitAlignmentRectInsets
{
  return *((unsigned __int8 *)&self->_imageFlags + 1) >> 7;
}

- (void)_removeBaseline
{
  $6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = self->_imageFlags;
  if ((*(_WORD *)&imageFlags & 0x2000) == 0)
  {
    self->_baselineOffsetFromBottom = 0.0;
    self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&imageFlags & 0xFFFFEFFF);
  }
}

- (UIEdgeInsets)_contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)content
{
  return self->_content;
}

- (int64_t)_imageOrientationForSymbolLayerConsideringRTLForUserInterfaceLayoutDirection:(int64_t)a3
{
  int64_t v4 = [(UIImage *)self _imageOrientationConsideringRTLForUserInterfaceLayoutDirection:a3];
  if (![(UIImage *)self isSymbolImage] || (*(unsigned char *)&self->_imageFlags & 0x20) == 0) {
    return v4;
  }
  return +[UIImage _horizontallyFlippedOrientationForOrientation:v4];
}

- (BOOL)isHighDynamicRange
{
  return [(_UIImageContent *)self->_content isHDR];
}

- (NSTimeInterval)duration
{
  return 0.0;
}

- (BOOL)_representsCIImageWhichSupportsIOSurfaceRendering
{
  BOOL v3 = [(_UIImageContent *)self->_content isCIImage];
  if (v3)
  {
    BOOL v3 = [(_UIImageContent *)self->_content canRenderCIImage];
    if (v3) {
      LOBYTE(v3) = ![(UIImage *)self _isResizable];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t result = [(_UIImageContent *)self->_content hash];
  if (!result) {
    return 305441741;
  }
  return result;
}

- (void)dealloc
{
  _UISharedImageDealloc(self);
  if ((*(unsigned char *)&self->_imageFlags & 0x80) != 0) {
    SetCachedPatternColor(self, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)UIImage;
  [(UIImage *)&v3 dealloc];
}

- (BOOL)_isNamed
{
  return *(_DWORD *)&self->_imageFlags & 1;
}

- (UIImage)imageWithTintColor:(UIColor *)color
{
  int64_t v4 = color;
  double v5 = [(UIImage *)self _imageTintedWithColor:v4 renderingMode:[(UIImage *)self renderingMode] withUpdatedCGImage:0];

  return (UIImage *)v5;
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:5 capacity:16];
  v1 = (void *)_MergedGlobals_1091;
  _MergedGlobals_1091 = v0;

  dispatch_queue_t v2 = dispatch_queue_create("weak image cache queue", 0);
  objc_super v3 = (void *)qword_1EB260E18;
  qword_1EB260E18 = (uint64_t)v2;
}

- (id)_imageWithImageAsset:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIImage *)self _primitiveImageAsset];
  id v9 = v6;
  CGFloat v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    id v11 = v9;
    uint64_t v12 = v8;
    if (!v9) {
      goto LABEL_15;
    }
    id v11 = v9;
    uint64_t v12 = v8;
    if (!v8) {
      goto LABEL_15;
    }
    int v13 = [v8 isEqual:v9];

    if (!v13) {
      goto LABEL_16;
    }
  }
  id v11 = [(UIImage *)self configuration];
  id v14 = v7;
  objc_super v15 = v14;
  if (v11 == v14)
  {

    goto LABEL_13;
  }
  if (v14 && v11)
  {
    char v16 = [v11 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_13:
    double v17 = self;
    goto LABEL_18;
  }

  uint64_t v12 = v11;
LABEL_15:

LABEL_16:
LABEL_17:
  double v17 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [(UIImage *)v17 _setImageAsset:v10];
  [(UIImage *)v17 _setConfiguration:v7];
LABEL_18:

  return v17;
}

- (id)_imageTintedWithColor:(id)a3 renderingMode:(int64_t)a4 withUpdatedCGImage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    id v9 = [(UIImage *)self content];
    [v9 size];
    double v11 = v10;
    double v13 = v12;

    id v14 = +[UIGraphicsImageRendererFormat defaultFormat];
    [(UIImage *)self scale];
    objc_msgSend(v14, "setScale:");
    objc_super v15 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v14, v11, v13);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __66__UIImage__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke;
    double v27 = &unk_1E52F17E0;
    double v30 = v11;
    double v31 = v13;
    id v28 = v8;
    UIImageRenderingMode v29 = self;
    char v16 = [(UIGraphicsImageRenderer *)v15 imageWithActions:&v24];

    id v17 = v16;
    if (objc_msgSend(v17, "CGImage", v24, v25, v26, v27) && -[_UIImageContent isCGImage](self->_content, "isCGImage"))
    {
      content = self->_content;
      id v19 = v17;
      uint64_t v20 = -[_UIImageContent contentWithCGImage:](content, "contentWithCGImage:", [v19 CGImage]);
      id v17 = [(UIImage *)self _imageWithContent:v20];
    }
  }
  else
  {
    id v17 = (id)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  }
  [v17 _setColorForFlattening:v8];
  [v17 _setRenderingMode:a4];
  if ([(UIImage *)self _isResizable])
  {
    [(UIImage *)self capInsets];
    uint64_t v21 = objc_msgSend(v17, "resizableImageWithCapInsets:");

    id v17 = (id)v21;
  }
  if (*((unsigned char *)&self->_imageFlags + 2))
  {
    uint64_t v22 = [v17 imageFlippedForRightToLeftLayoutDirection];

    id v17 = (id)v22;
  }

  return v17;
}

- (void)_setRenderingMode:(int64_t)a3
{
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFF9FF | ((a3 & 3) << 9));
}

- (void)_setSymbolMetricsFromNamedVectorGlyph:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 scale];
    double v40 = v5;
    [v4 contentBounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat rect = v10;
    CGFloat v12 = v11;
    [v4 alignmentRect];
    CGFloat x = v45.origin.x;
    CGFloat width = v45.size.width;
    CGFloat y = v45.origin.y;
    CGFloat v38 = v45.origin.y;
    CGFloat height = v45.size.height;
    double v43 = v45.size.height;
    double MinY = CGRectGetMinY(v45);
    v46.origin.CGFloat x = v7;
    v46.origin.CGFloat y = v9;
    v46.size.CGFloat width = rect;
    v46.size.CGFloat height = v12;
    double v39 = MinY - CGRectGetMinY(v46);
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v47);
    v48.origin.CGFloat x = v7;
    v48.origin.CGFloat y = v9;
    v48.size.CGFloat width = rect;
    v48.size.CGFloat height = v12;
    double v18 = MinX - CGRectGetMinX(v48);
    v49.origin.CGFloat x = v7;
    v49.origin.CGFloat y = v9;
    v49.size.CGFloat width = rect;
    v49.size.CGFloat height = v12;
    double MaxY = CGRectGetMaxY(v49);
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = v38;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = v43;
    double v20 = MaxY - CGRectGetMaxY(v50);
    v51.origin.CGFloat x = v7;
    v51.origin.CGFloat y = v9;
    v51.size.CGFloat width = rect;
    v51.size.CGFloat height = v12;
    double MaxX = CGRectGetMaxX(v51);
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = v38;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = v43;
    double v22 = MaxX - CGRectGetMaxX(v52);
    if (v18 >= 0.0) {
      double v23 = v18;
    }
    else {
      double v23 = 0.0;
    }
    if (v18 >= 0.0) {
      double v24 = 0.0;
    }
    else {
      double v24 = -v18;
    }
    if (v22 >= 0.0) {
      double v25 = v22;
    }
    else {
      double v25 = 0.0;
    }
    if (v22 >= 0.0) {
      double v26 = 0.0;
    }
    else {
      double v26 = -v22;
    }
    -[UIImage _setContentInsets:](self, "_setContentInsets:", v39, v23, v20, v25, *(void *)&v38);
    [v4 baselineOffset];
    double v28 = v27;
    double v29 = v20 + v27;
    UIRoundToScale(v20 + v27, v40);
    -[UIImage _setBaselineOffsetFromBottom:](self, "_setBaselineOffsetFromBottom:");
    [v4 capHeight];
    UIRoundToScale(v30, v40);
    -[UIImage _setCapHeight:](self, "_setCapHeight:");
    [v4 pointSize];
    CTFontGetAscentForSystemFontOfSize();
    double v32 = v31;
    [v4 pointSize];

    CTFontGetDescentForSystemFontOfSize();
    double v34 = -v33;
    UIRoundToScale(v32, v40);
    double v36 = v35;
    UIRoundToScale(v34, v40);
    -[UIImage _setAlignmentRectInsets:](self, "_setAlignmentRectInsets:", -(v36 - (v39 + v43 - v28)), v24, -(-v37 - v29), v26);
  }
}

- (void)_setContentInsets:(UIEdgeInsets)a3
{
  if ((*((unsigned char *)&self->_imageFlags + 1) & 0x40) == 0)
  {
    content = self->_content;
    float64x2_t v7 = *(float64x2_t *)&self->_contentInsets.bottom;
    float64x2_t v8 = *(float64x2_t *)&self->_contentInsets.top;
    self->_contentInsets.double top = fmax(a3.top, 0.0);
    self->_contentInsets.double left = fmax(a3.left, 0.0);
    self->_contentInsets.double bottom = fmax(a3.bottom, 0.0);
    self->_contentInsets.double right = fmax(a3.right, 0.0);
    [(_UIImageContent *)content scale];
    int8x16_t v6 = (int8x16_t)vmulq_n_f64(vsubq_f64(vaddq_f64(*(float64x2_t *)&self->_contentInsets.top, *(float64x2_t *)&self->_contentInsets.bottom), vaddq_f64(v8, v7)), v5);
    self->_sizeInPixels = (CGSize)vaddq_f64((float64x2_t)self->_sizeInPixels, (float64x2_t)vextq_s8(v6, v6, 8uLL));
  }
}

- (void)_setCapHeight:(double)a3
{
  self->_capHeight = a3;
  *(_DWORD *)&self->_imageFlags |= 0x20000u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_siblingImages, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
}

- (UITraitCollection)traitCollection
{
  return [(UIImageConfiguration *)self->_configuration _effectiveTraitCollectionForImageLookup];
}

- (BOOL)_isResizable
{
  return 0;
}

- (BOOL)_hasBaseline
{
  return (*((unsigned __int8 *)&self->_imageFlags + 1) >> 4) & 1;
}

- (NSArray)images
{
  return 0;
}

- (BOOL)_representsLayeredImage
{
  objc_super v3 = [(UIImage *)self _primitiveImageAsset];
  if (v3)
  {
    id v4 = [(UIImage *)self imageAsset];
    double v5 = [v4 _layerStack];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CGImageRef)CGImage
{
  return [(_UIImageContent *)self->_content CGImage];
}

- (void)drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  double height = rect.size.height;
  double width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  if (!CGRectIsEmpty(rect))
  {
    [(UIImage *)self size];
    if (v13 > 0.0 && v12 > 0.0)
    {
      CurrentContextAuxInfo = (double *)GetCurrentContextAuxInfo(1);
      if (!CurrentContextAuxInfo || (double v15 = *CurrentContextAuxInfo, *CurrentContextAuxInfo == 0.0))
      {
        [(UIImage *)self scale];
        double v15 = v16;
      }
      +[_UIImageContentLayoutDrawingTarget targetWithSize:scale:](width, height, v15);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = +[_UIImageContentLayout layoutForSource:self inTarget:width withSize:height];
      double v18 = (void *)v17;
      if (v17 && (*(unsigned char *)(v17 + 8) & 1) != 0)
      {
        id v19 = (double *)MEMORY[0x1E4F1DAD8];
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        }
        double v23 = *v19;
        double v22 = v19[1];
        CGContextSaveGState(v21);
        CGContextSetBlendMode(v21, blendMode);
        CGContextSetAlpha(v21, alpha);
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        CGFloat MinX = CGRectGetMinX(v29);
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.double width = width;
        v30.size.double height = height;
        CGFloat MinY = CGRectGetMinY(v30);
        CGContextTranslateCTM(v21, MinX, MinY);
        double v26 = [v18 contentsMultiplyColor];
        if ([(UIImage *)self renderingMode] == UIImageRenderingModeAlwaysTemplate || v26)
        {
          v31.origin.CGFloat x = v23;
          v31.origin.CGFloat y = v22;
          v31.size.double width = width;
          v31.size.double height = height;
          CGContextBeginTransparencyLayerWithRect(v21, v31, 0);
          -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", v21, v18, 1, v23, v22, width, height, v15);
          [v26 setFill];
          v32.origin.CGFloat x = v23;
          v32.origin.CGFloat y = v22;
          v32.size.double width = width;
          v32.size.double height = height;
          UIRectFillUsingBlendMode(v32, kCGBlendModeSourceIn);
          CGContextEndTransparencyLayer(v21);
        }
        else
        {
          -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", v21, v18, 1, v23, v22, width, height, v15);
        }
        CGContextRestoreGState(v21);
      }
    }
  }
}

- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5 scale:(double)a6 applyContentsTransform:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v15 = a5;
  [(UIImage *)self size];
  if (v16 > 0.0 && v17 > 0.0)
  {
    double v18 = v16;
    CGFloat v42 = x;
    CGFloat v43 = y;
    double v44 = v17;
    [(UIImage *)self capInsets];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    BOOL v27 = -[UIImage _isTiledWhenStretchedToSize:](self, "_isTiledWhenStretchedToSize:", width, height);
    int v28 = v27;
    BOOL v29 = v22 > 0.0;
    if (v26 > 0.0) {
      BOOL v29 = 1;
    }
    int v30 = v29 || v27;
    if (v24 > 0.0) {
      int v30 = 1;
    }
    if (v20 <= 0.0) {
      int v31 = v30;
    }
    else {
      int v31 = 1;
    }
    CGContextTranslateCTM(a3, 0.0, height);
    CGContextScaleCTM(a3, 1.0, -1.0);
    if (v7)
    {
      if (v15) {
        [v15 contentsTransform];
      }
      else {
        memset(&transform, 0, sizeof(transform));
      }
      CGContextConcatCTM(a3, &transform);
    }
    if (v31)
    {
      CGRect v32 = (CGImage *)v15;
      double v33 = v32;
      if (v32)
      {
        -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v32);
        if (*((unsigned char *)v33 + 8)) {
          double v33 = (CGImage *)*((void *)v33 + 4);
        }
        else {
          double v33 = 0;
        }
      }
      uint64_t v39 = (uint64_t)a6;
      remainder.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      remainder.size.double width = width;
      remainder.size.double height = height;
      memset(&slice, 0, sizeof(slice));
      memset(&v47, 0, sizeof(v47));
      memset(&v46, 0, sizeof(v46));
      v50.origin.CGFloat x = remainder.origin.x;
      v50.origin.CGFloat y = remainder.origin.y;
      v50.size.double width = width;
      v50.size.double height = height;
      CGRectDivide(v50, &slice, &remainder, v20, CGRectMaxYEdge);
      CGRectDivide(remainder, &v46, &v47, v24, CGRectMinYEdge);
      if (!CGRectIsEmpty(slice)) {
        Draw3PartSlice(a3, v33, v39, v28, 0.0, 0.0, v18, v20, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, v20, v22, v24, v26);
      }
      Draw3PartSlice(a3, v33, v39, v28, 0.0, v20, v18, v44 - v20 - v24, v47.origin.x, v47.origin.y, v47.size.width, v47.size.height, v20, v22, v24, v26);
      if (!CGRectIsEmpty(v46)) {
        Draw3PartSlice(a3, v33, v39, v28, 0.0, v44 - v24, v18, v24, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height, v20, v22, v24, v26);
      }
    }
    else if ([(UIImage *)self _shouldDrawVectorContentDirectly])
    {
      objc_msgSend(v15, "drawInContext:withSize:", a3, width, height);
    }
    else
    {
      id v34 = v15;
      if (v34)
      {
        id v35 = v34;
        -[_UIImageContentLayout _materializeRenditionContents]((uint64_t)v34);
        CGFloat v36 = v42;
        CGFloat v37 = v43;
        if (*((unsigned char *)v35 + 8)) {
          CGFloat v38 = (CGImage *)*((void *)v35 + 4);
        }
        else {
          CGFloat v38 = 0;
        }
      }
      else
      {
        CGFloat v38 = 0;
        CGFloat v36 = v42;
        CGFloat v37 = v43;
      }
      double v40 = width;
      double v41 = height;
      CGContextDrawImage(a3, *(CGRect *)&v36, v38);
    }
  }
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  return 0;
}

- (BOOL)_isSubimage
{
  return 0;
}

- (CGRect)_contentStretchInPixels
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double width = self->_sizeInPixels.width;
  double height = self->_sizeInPixels.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (UIEdgeInsets)capInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)_shouldDrawVectorContentDirectly
{
  return 0;
}

+ (id)_systemImageNamed:(id)a3
{
  return (id)[a1 _systemImageNamed:a3 withConfiguration:0];
}

- (CIImage)CIImage
{
  return [(_UIImageContent *)self->_content CIImage];
}

- (void)drawInRect:(CGRect)rect
{
}

uint64_t __66__UIImage__imageTintedWithColor_renderingMode_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) set];
  UIRectFillUsingOperation(1, 0.0, 0.0, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  [*(id *)(a1 + 40) _contentInsets];
  double v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "drawAtPoint:blendMode:alpha:", 22, -v3, -v2, 1.0);
}

- (void)drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
  uint64_t v6 = *(void *)&blendMode;
  double y = point.y;
  double x = point.x;
  [(UIImage *)self size];
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", v6, x, y, v10, v11, alpha);
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5 scale:(double)a6
{
  double v15 = a6;
  uint64_t v14 = 0;
  if (a4) {
    BOOL v7 = &v15;
  }
  else {
    BOOL v7 = 0;
  }
  CGImageRef v8 = _UIImageRefFromData(a3, a5, (unint64_t)&v14, v7);
  if (v8)
  {
    CGFloat v9 = v8;
    double v10 = [_UIImageCGImageContent alloc];
    double v11 = [(_UIImageCGImageContent *)v10 initWithCGImage:v9 scale:v15];
    id v12 = [(UIImage *)self _initWithContent:v11 orientation:v14];

    CGImageRelease(v9);
  }
  else
  {

    return 0;
  }
  return v12;
}

+ (UIImage)imageWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  double v5 = [[UIImage alloc] initWithCGImage:cgImage scale:orientation orientation:scale];
  return v5;
}

- (UIImage)initWithCGImage:(CGImageRef)cgImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  if (cgImage)
  {
    BOOL v7 = [[_UIImageCGImageContent alloc] initWithCGImage:cgImage scale:scale];
    CGImageRef v8 = [(UIImage *)self _initWithContent:v7 orientation:orientation];
    self = (UIImage *)v7;
  }
  else
  {
    CGImageRef v8 = 0;
  }

  return v8;
}

uint64_t __27__UIImage__rasterizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
}

+ (id)_iconForResourceProxy:(id)a3 format:(int)a4
{
  return (id)[a1 _iconForResourceProxy:a3 format:*(void *)&a4 options:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel__flushCache_ name:@"UIApplicationDidReceiveMemoryWarningNotification" object:UIApp];
    [v3 addObserver:a1 selector:sel__flushCache_ name:@"UIApplicationDidEnterBackgroundNotification" object:UIApp];
  }
}

- (id)_flatImageWithColor:(id)a3
{
  id v4 = a3;
  double v5 = [(UIImage *)self _imageTintedWithColor:v4 renderingMode:[(UIImage *)self renderingMode] withUpdatedCGImage:1];

  return v5;
}

- (UIImage)imageWithTintColor:(UIColor *)color renderingMode:(UIImageRenderingMode)renderingMode
{
  return (UIImage *)[(UIImage *)self _imageTintedWithColor:color renderingMode:renderingMode withUpdatedCGImage:0];
}

+ (UIImage)imageWithData:(NSData *)data
{
  id v3 = data;
  id v4 = [[UIImage alloc] initWithData:v3];

  return v4;
}

- (UIImage)initWithData:(NSData *)data
{
  return (UIImage *)[(UIImage *)self _initWithData:data preserveScale:0 cache:0];
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4 cache:(BOOL)a5
{
  return [(UIImage *)self _initWithData:a3 preserveScale:a4 cache:a5 scale:1.0];
}

- (UIGraphicsImageRendererFormat)imageRendererFormat
{
  return (UIGraphicsImageRendererFormat *)[(_UIImageContent *)self->_content imageRendererFormat];
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CGImageRef v8 = +[UIScreen _mainScreenThreadSafeTraitCollection];
  CGFloat v9 = [a1 imageNamed:v7 inBundle:v6 compatibleWithTraitCollection:v8];

  return v9;
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  CGImageRef v8 = bundle;
  CGFloat v9 = name;
  if (traitCollection) {
    double v10 = [(UITraitCollection *)traitCollection imageConfiguration];
  }
  else {
    double v10 = 0;
  }
  double v11 = v10;
  id v12 = [a1 imageNamed:v9 inBundle:v8 withConfiguration:v11];

  return (UIImage *)v12;
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle withConfiguration:(UIImageConfiguration *)configuration
{
  id v7 = name;
  CGImageRef v8 = bundle;
  CGFloat v9 = configuration;
  os_unfair_lock_lock(&stru_1EB25B110);
  if (!qword_1EB25B120)
  {
    uint64_t v10 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
    double v11 = (void *)qword_1EB25B120;
    qword_1EB25B120 = v10;
  }
  id v12 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v9, 0);
  if (!v8)
  {
    CGImageRef v8 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  double v13 = +[_UIImageCacheKey keyWithName:v7 configuration:v12 bundle:v8];
  uint64_t v14 = [(id)qword_1EB25B120 objectForKey:v13];
  os_unfair_lock_unlock(&stru_1EB25B110);
  if (!v14)
  {
    if (v8)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
      if (v8 == (NSBundle *)v15)
      {
        double v17 = _UIKitGetApplicationAssetManager();
        double v16 = v8;
      }
      else
      {
        double v16 = (void *)v15;
        double v17 = +[_UIAssetManager assetManagerForBundle:v8];
      }
    }
    else
    {
      double v17 = _UIKitGetApplicationAssetManager();
    }
    uint64_t v18 = [v17 imageNamed:v7 configuration:v12];
    if (v18)
    {
      uint64_t v14 = (void *)v18;
    }
    else
    {
      if (!v8)
      {
        CGImageRef v8 = [MEMORY[0x1E4F28B50] mainBundle];
      }
      if (dyld_program_sdk_at_least())
      {
        id v25 = +[_UIAssetManager newAssetNamed:v7 fromBundle:v8];
        double v19 = [v25 _defaultTraitCollection];
        double v20 = v19;
        if (v19) {
          double v19 = (void *)[v19 imageConfiguration];
        }
        id v21 = v19;
        uint64_t v22 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v9, v21);

        uint64_t v14 = [v25 imageWithConfiguration:v22];

        id v12 = (void *)v22;
      }
      else
      {
        char v23 = _UIScreenForcedMainScreenScale(2) == 1.0;
        uint64_t v14 = _UIImageAtPath(v7, v8, v23, 1);
      }
      if (!v14) {
        goto LABEL_23;
      }
    }
    os_unfair_lock_lock(&stru_1EB25B110);
    [(id)qword_1EB25B120 setObject:v14 forKey:v13];
    os_unfair_lock_unlock(&stru_1EB25B110);
LABEL_23:
  }
  return (UIImage *)v14;
}

+ (UIImage)systemImageNamed:(NSString *)name compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  id v6 = name;
  if (traitCollection) {
    id v7 = [(UITraitCollection *)traitCollection imageConfiguration];
  }
  else {
    id v7 = 0;
  }
  CGImageRef v8 = v7;
  CGFloat v9 = [a1 systemImageNamed:v6 withConfiguration:v8];

  return (UIImage *)v9;
}

+ (id)_systemImageNamed:(id)a3 fallback:(id)a4 withConfiguration:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7) {
    goto LABEL_8;
  }
  int v10 = dyld_program_sdk_at_least();
  if (v8)
  {
    if (!v10) {
      goto LABEL_8;
    }
  }
  if (v9) {
    +[UIImage systemImageNamed:v7 withConfiguration:v9];
  }
  else {
  double v11 = +[UIImage systemImageNamed:v7];
  }
  if (!v11)
  {
LABEL_8:
    double v11 = _UIImageWithName(v8);
  }

  return v11;
}

+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4 allowPrivate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, a4, 0);
  id v9 = +[_UIImageCacheKey keyWithSystemName:v7 private:v5 configuration:v8];
  os_unfair_lock_lock(&stru_1EB25B110);
  int v10 = (void *)qword_1EB25B120;
  if (!qword_1EB25B120)
  {
    uint64_t v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
    id v12 = (void *)qword_1EB25B120;
    qword_1EB25B120 = v11;

    int v10 = (void *)qword_1EB25B120;
  }
  double v13 = [v10 objectForKey:v9];
  os_unfair_lock_unlock(&stru_1EB25B110);
  if (!v13)
  {
    uint64_t v14 = _UIKitCoreGlyphsManager();
    double v13 = [v14 imageNamed:v7 configuration:v8];

    if (v13)
    {
LABEL_12:
      os_unfair_lock_lock(&stru_1EB25B110);
      [(id)qword_1EB25B120 setObject:v13 forKey:v9];
      os_unfair_lock_unlock(&stru_1EB25B110);
      goto LABEL_13;
    }
    if (v5) {
      goto LABEL_9;
    }
    if (qword_1EB25B138 != -1) {
      dispatch_once(&qword_1EB25B138, &__block_literal_global_191_0);
    }
    if (byte_1EB25B109)
    {
LABEL_9:
      uint64_t v15 = _UIKitPrivateCoreGlyphsManager();
      double v13 = [v15 imageNamed:v7 configuration:v8];
      if (v13 && byte_1EB25B109)
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v19 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            int v20 = 138412290;
            id v21 = v7;
          }
        }
        else
        {
          uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25B140) + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v20 = 138412290;
            id v21 = v7;
          }
        }
      }
      else
      {

        if (!v13) {
          goto LABEL_13;
        }
      }
      goto LABEL_12;
    }
    double v13 = 0;
  }
LABEL_13:
  id v16 = v13;

  return v16;
}

+ (UIImage)systemImageNamed:(NSString *)name withConfiguration:(UIImageConfiguration *)configuration
{
  return (UIImage *)[a1 _systemImageNamed:name withConfiguration:configuration allowPrivate:0];
}

+ (UIImage)systemImageNamed:(NSString *)name
{
  return (UIImage *)[a1 systemImageNamed:name withConfiguration:0];
}

- (id)_imageByApplyingSymbolVariant:(id)a3
{
  id v4 = a3;
  if ([(UIImage *)self isSymbolImage] && v4)
  {
    BOOL v5 = self;
    if (objc_opt_isKindOfClass())
    {
      int v6 = [v4 isUnspecified];

      if (!v6)
      {
        if (!_UIIsSystemSymbolImage(self))
        {
          uint64_t v15 = 0;
LABEL_25:
          if (v15) {
            int v20 = v15;
          }
          else {
            int v20 = self;
          }
          double v13 = v20;

          goto LABEL_13;
        }
        id v7 = _UIImageName(self);
        int v8 = _UIIsPrivateSystemSymbolImage(self);
        id v9 = (id *)MEMORY[0x1E4F97AC0];
        if (!v8) {
          id v9 = (id *)MEMORY[0x1E4F97AB8];
        }
        id v10 = *v9;
        uint64_t v11 = [v4 fillVariant];
        if (v11 == 2)
        {
          id v16 = [v10 allKeysForObject:v7];
          id v12 = [v16 firstObject];
        }
        else
        {
          if (v11 != 1)
          {
            id v12 = 0;
            goto LABEL_23;
          }
          id v12 = [v10 objectForKeyedSubscript:v7];
        }
        if (v12 && ([v7 isEqualToString:v12] & 1) == 0)
        {
          [(UIImage *)self variableValue];
          double v18 = v17;
          double v19 = [(UIImage *)self configuration];
          if (v8) {
            +[UIImage _systemImageNamed:v12 variableValue:v19 withConfiguration:v18];
          }
          else {
          uint64_t v15 = +[UIImage systemImageNamed:v12 variableValue:v19 withConfiguration:v18];
          }

          goto LABEL_24;
        }
LABEL_23:
        uint64_t v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  double v13 = self;
LABEL_13:

  return v13;
}

- (UIImageAsset)imageAsset
{
  if (!self->_imageAsset
    && dyld_program_sdk_at_least()
    && ([(_UIImageContent *)self->_content isCGImage] || dyld_program_sdk_at_least())
    && ![(_UIImageContent *)self->_content isPreparedCGImage])
  {
    id v3 = objc_alloc_init(UIImageAsset);
    imageAsset = self->_imageAsset;
    self->_imageAsset = v3;

    [(UIImageAsset *)self->_imageAsset _registerImage:self withConfiguration:self->_configuration];
  }
  BOOL v5 = self->_imageAsset;
  return v5;
}

- (double)variableValue
{
  [(_UIImageContent *)self->_content variableValue];
  return result;
}

+ (UIImage)systemImageNamed:(NSString *)name variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration
{
  int v6 = [a1 systemImageNamed:name withConfiguration:configuration];
  id v7 = [v6 _imageWithVariableValue:value];

  return (UIImage *)v7;
}

- (NSString)_asMenuElementImageName
{
  return 0;
}

+ (id)__systemImageNamedSwift:(id)a3
{
  return (id)[a1 systemImageNamed:a3 withConfiguration:0];
}

- (BOOL)_isInvisibleAndGetIsTranslucent:(BOOL *)a3
{
  BOOL v5 = objc_getAssociatedObject(self, &unk_1EB25B10A);
  int v6 = objc_getAssociatedObject(self, &unk_1EB25B10B);
  if (!v5)
  {
    [(UIImage *)self size];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = self;
    __int16 BitmapInfo = CGImageGetBitmapInfo([(UIImage *)v11 CGImage]);
    uint64_t v13 = 1;
    if (v8 == 0.0)
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 1;
      if (v10 != 0.0)
      {
        __int16 v15 = BitmapInfo;
        unsigned int v16 = BitmapInfo & 0x1F;
        if (v16 <= 6 && ((1 << v16) & 0x61) != 0)
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
        }
        else
        {
          [(UIImage *)v11 size];
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          [(UIImage *)v11 scale];
          _UIGraphicsBeginImageContextWithOptions(0, 0, v18, v20, v21);
          -[UIImage drawInRect:](v11, "drawInRect:", 0.0, 0.0, v18, v20);
          ContextStack = GetContextStack(0);
          if (*(int *)ContextStack < 1) {
            char v23 = 0;
          }
          else {
            char v23 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
          }
          Data = (char *)CGBitmapContextGetData(v23);
          int Width = CGBitmapContextGetWidth(v23);
          int Height = CGBitmapContextGetHeight(v23);
          int BytesPerRow = CGBitmapContextGetBytesPerRow(v23);
          BOOL v28 = v16 == 2 || v16 == 4;
          uint64_t v29 = 3;
          if (v28) {
            uint64_t v29 = 0;
          }
          if ((v15 & 0x7000) == 0x2000) {
            uint64_t v30 = v29 ^ 3;
          }
          else {
            uint64_t v30 = v29;
          }
          if (Height < 1)
          {
            char v32 = 0;
            char v35 = 1;
          }
          else
          {
            uint64_t v31 = 0;
            char v32 = 0;
            double v33 = &Data[v30];
            uint64_t v34 = Height;
            char v35 = 1;
            do
            {
              if (Width <= 0)
              {
                char v40 = v32;
                int v41 = v35 & 1;
              }
              else
              {
                CGFloat v36 = v33;
                uint64_t v37 = 1;
                do
                {
                  int v39 = *v36;
                  v36 += 4;
                  int v38 = v39;
                  if (v39) {
                    char v35 = 0;
                  }
                  if (v38 != 255) {
                    char v32 = 1;
                  }
                  char v40 = v32;
                  int v41 = v35 & 1;
                  if (!(((v32 & 1) == 0) | v41)) {
                    break;
                  }
                }
                while (v37++ < Width);
              }
              if (v41) {
                BOOL v43 = 1;
              }
              else {
                BOOL v43 = v40 == 0;
              }
              ++v31;
              v33 += BytesPerRow;
            }
            while (v43 && v31 != v34);
          }
          UIGraphicsEndImageContext();
          uint64_t v13 = v32 & 1;
          uint64_t v14 = v35 & 1;
        }
      }
    }
    BOOL v5 = [NSNumber numberWithBool:v14];
    CGRect v45 = [NSNumber numberWithBool:v13];

    objc_setAssociatedObject(v11, &unk_1EB25B10A, v5, (void *)1);
    objc_setAssociatedObject(v11, &unk_1EB25B10B, v45, (void *)1);
    int v6 = v45;
  }
  if (a3) {
    *a3 = [v6 BOOLValue];
  }
  char v46 = [v5 BOOLValue];

  return v46;
}

+ (UIImage)imageNamed:(NSString *)name
{
  return (UIImage *)[a1 imageNamed:name inBundle:0 withConfiguration:0];
}

- (UIImage)initWithData:(NSData *)data scale:(CGFloat)scale
{
  return (UIImage *)[(UIImage *)self _initWithData:data preserveScale:0 cache:0 scale:scale];
}

- (BOOL)_isHierarchicalColorSymbolImage
{
  return [(_UIImageContent *)self->_content numberOfHierarchyLayers] > 1;
}

- (UIImage)imageByApplyingSymbolConfiguration:(UIImageSymbolConfiguration *)configuration
{
  id v4 = configuration;
  BOOL v5 = [(UIImage *)self symbolConfiguration];
  uint64_t v6 = [v5 configurationByApplyingConfiguration:v4];
  double v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = (uint64_t)v4;
  }
  double v9 = [(UIImage *)self imageWithConfiguration:v8];

  return (UIImage *)v9;
}

- (BOOL)_isPaletteColorSymbolImage
{
  return [(_UIImageContent *)self->_content numberOfPaletteLayers] > 1;
}

+ (id)_iconForResourceProxy:(id)a3 format:(int)a4 options:(unint64_t)a5
{
  char v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F6F248];
  id v9 = a3;
  double v10 = (void *)[[v8 alloc] initWithResourceProxy:v9];

  uint64_t v11 = [a1 _baseImageDescriptorForUIApplicationIconFormat:v6];
  id v12 = +[UIScreen mainScreen];
  [v12 scale];
  objc_msgSend(v11, "setScale:");

  if (v5) {
    objc_msgSend(v11, "setVariantOptions:", objc_msgSend(v11, "variantOptions") | 1);
  }
  uint64_t v13 = +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v10, v11);

  return v13;
}

+ (id)_baseImageDescriptorForUIApplicationIconFormat:(int)a3
{
  id v4 = +[UIImage _ISImageDescriptorNameForUIApplicationIconFormat:](UIImage, "_ISImageDescriptorNameForUIApplicationIconFormat:");
  char v5 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:v4];
  [v5 setDrawBorder:(a3 < 0x11) & (0x1C001u >> a3)];

  return v5;
}

+ (id)_ISImageDescriptorNameForUIApplicationIconFormat:(int)a3
{
  if (a3 > 0x10) {
    id v3 = (id *)MEMORY[0x1E4F6F298];
  }
  else {
    id v3 = (id *)qword_1E52F1918[a3];
  }
  return *v3;
}

+ (id)_imageWithIcon:(void *)a3 descriptor:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = [v5 prepareImageForDescriptor:v4];

  uint64_t v7 = [v6 CGImage];
  [v6 scale];
  uint64_t v8 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, 0);

  return v8;
}

+ (UIImage)imageWithCGImage:(CGImageRef)cgImage
{
  id v3 = [[UIImage alloc] initWithCGImage:cgImage];
  return v3;
}

- (UIImage)initWithCGImage:(CGImageRef)cgImage
{
  return [(UIImage *)self initWithCGImage:cgImage scale:0 orientation:1.0];
}

- (BOOL)_hasImageAsset
{
  return self->_imageAsset != 0;
}

- (UIImage)imageFlippedForRightToLeftLayoutDirection
{
  if (*((unsigned char *)&self->_imageFlags + 2))
  {
    double v2 = self;
  }
  else
  {
    double v2 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
    [(UIImage *)v2 _setIsFlippedInRightToLeft];
  }
  return v2;
}

- (void)_setIsFlippedInRightToLeft
{
  *(_DWORD *)&self->_imageFlags |= 0x10000u;
}

+ (id)kitImageNamed:(id)a3
{
  return +[UIImage _kitImageNamed:a3 withTrait:0];
}

+ (id)_kitImageNamed:(id)a3 withTrait:(id)a4
{
  return _UIImageWithNameAndTraitCollection(a3, a4);
}

- (BOOL)_isDecompressing
{
  return [(_UIImageContent *)self->_content isDecompressing];
}

- (UIImage)init
{
  return (UIImage *)[(UIImage *)self _initWithContent:0 orientation:0];
}

- (UIImage)imageWithRenderingMode:(UIImageRenderingMode)renderingMode
{
  if ((((unint64_t)self->_imageFlags >> 9) & 3) == renderingMode)
  {
    id v4 = self;
  }
  else
  {
    os_unfair_lock_lock(&stru_1EB25B110);
    id v4 = [(NSMapTable *)self->_siblingImages objectForKey:renderingMode + 1];
    os_unfair_lock_unlock(&stru_1EB25B110);
    if (!v4)
    {
      id v4 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
      [(UIImage *)v4 _setRenderingMode:renderingMode];
      objc_storeStrong((id *)&v4->_siblingImages, self->_siblingImages);
      os_unfair_lock_lock(&stru_1EB25B110);
      siblingImages = self->_siblingImages;
      if (!siblingImages)
      {
        uint64_t v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:256 valueOptions:5];
        uint64_t v8 = self->_siblingImages;
        self->_siblingImages = v7;

        [(NSMapTable *)self->_siblingImages setObject:self forKey:(((unint64_t)self->_imageFlags >> 9) & 3) + 1];
        siblingImages = self->_siblingImages;
      }
      [(NSMapTable *)siblingImages setObject:v4 forKey:renderingMode + 1];
      os_unfair_lock_unlock(&stru_1EB25B110);
    }
  }
  return v4;
}

+ (id)_cachedImageForKey:(id)a3 fromBlock:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  if (qword_1EB260E20 != -1) {
    dispatch_once(&qword_1EB260E20, &__block_literal_global_284);
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__113;
  id v25 = __Block_byref_object_dispose__113;
  id v26 = 0;
  uint64_t v7 = qword_1EB260E18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_3;
  block[3] = &unk_1E52E3210;
  CGFloat v20 = &v21;
  id v8 = v5;
  id v19 = v8;
  dispatch_sync(v7, block);
  id v9 = (void *)v22[5];
  if (!v9)
  {
    uint64_t v10 = v6[2](v6);
    uint64_t v11 = (void *)v22[5];
    v22[5] = v10;

    id v12 = qword_1EB260E18;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_2;
    v15[3] = &unk_1E52E4728;
    id v16 = v8;
    double v17 = &v21;
    dispatch_sync(v12, v15);

    id v9 = (void *)v22[5];
  }
  id v13 = v9;

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)_systemImageNamed:(id)a3 variableValue:(double)a4 withConfiguration:(id)a5
{
  uint64_t v6 = [a1 _systemImageNamed:a3 withConfiguration:a5];
  uint64_t v7 = [v6 _imageWithVariableValue:a4];

  return v7;
}

+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4
{
  id v4 = _UIImageVariantName(a3, a4);
  id v5 = +[UIImage _systemImageNamed:v4 withConfiguration:0];

  return v5;
}

+ (id)_systemImageNamed:(id)a3 withConfiguration:(id)a4
{
  return (id)[a1 _systemImageNamed:a3 withConfiguration:a4 allowPrivate:1];
}

- (void)drawAtPoint:(CGPoint)point
{
}

- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode
{
  id v5 = -[_UIResizableImage initWithImage:capInsets:]([_UIResizableImage alloc], "initWithImage:capInsets:", self, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right);
  uint64_t v6 = v5;
  if (resizingMode == UIImageResizingModeStretch) {
    [(_UIResizableImage *)v5 _setAlwaysStretches:1];
  }
  return (UIImage *)v6;
}

- (UIImage)resizableImageWithCapInsets:(UIEdgeInsets)capInsets
{
  return -[UIImage resizableImageWithCapInsets:resizingMode:](self, "resizableImageWithCapInsets:resizingMode:", 0, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right);
}

- (UIImage)imageWithAlignmentRectInsets:(UIEdgeInsets)alignmentInsets
{
  double right = alignmentInsets.right;
  double bottom = alignmentInsets.bottom;
  double left = alignmentInsets.left;
  double top = alignmentInsets.top;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  objc_msgSend(v7, "_setAlignmentRectInsetsExplicitly:", top, left, bottom, right);
  return (UIImage *)v7;
}

- (void)_setAlignmentRectInsetsExplicitly:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
  *(_DWORD *)&self->_imageFlags |= 0x8000u;
}

- (CGColor)_tiledPatternColor
{
  if (![(_UIImageContent *)self->_content isCGImage]) {
    return 0;
  }
  if (!qword_1EB25B150
    || (id v3 = self,
        os_unfair_lock_lock(&stru_1EB25B114),
        PatternColorFromImage = (CGColor *)CFDictionaryGetValue((CFDictionaryRef)qword_1EB25B150, v3),
        v3,
        os_unfair_lock_unlock(&stru_1EB25B114),
        !PatternColorFromImage))
  {
    [(UIImage *)self size];
    double v6 = v5;
    double v8 = v7;
    [(UIImage *)self scale];
    uint64_t v10 = v9;
    if (((unint64_t)v6 & ((unint64_t)v6 - 1)) != 0
      || ((unint64_t)v8 & ((unint64_t)v8 - 1)) != 0)
    {
      [(UIImage *)self scale];
      if (v6 < v11 * 32.0 || ([(UIImage *)self scale], v8 < v12 * 32.0))
      {
        [(UIImage *)self scale];
        double v14 = v6 * ceil(v13 * 32.0 / v6);
        [(UIImage *)self scale];
        double v16 = v8 * ceil(v15 * 32.0 / v8);
        double v17 = [UIGraphicsImageRenderer alloc];
        CGFloat v18 = [(UIImage *)self imageRendererFormat];
        id v19 = -[UIGraphicsImageRenderer initWithSize:format:](v17, "initWithSize:format:", v18, v14, v16);

        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __55__UIImage_UIImageDeprecatedPrivate___tiledPatternColor__block_invoke;
        v22[3] = &unk_1E52F1830;
        v22[5] = 0;
        v22[6] = 0;
        *(double *)&v22[7] = v14;
        *(double *)&v22[8] = v16;
        v22[4] = self;
        *(double *)&v22[9] = v6;
        v22[10] = v10;
        *(double *)&v22[11] = v8;
        v22[12] = 0;
        v22[13] = 0;
        *(double *)&v22[14] = v6;
        *(double *)&v22[15] = v8;
        CGFloat v20 = [(UIGraphicsImageRenderer *)v19 imageWithActions:v22];
        PatternColorFromImage = createPatternColorFromImage(v20);

        if (!PatternColorFromImage) {
          return PatternColorFromImage;
        }
        goto LABEL_12;
      }
    }
    PatternColorFromImage = createPatternColorFromImage(self);
    if (PatternColorFromImage)
    {
LABEL_12:
      SetCachedPatternColor(self, PatternColorFromImage);
      CGColorRelease(PatternColorFromImage);
    }
  }
  return PatternColorFromImage;
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [(id)_MergedGlobals_1091 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)prepareForDisplayWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  content = self->_content;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__UIImage_prepareForDisplayWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E52F1808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_UIImageContent *)content prepareContentForDisplayWithCompletionHandler:v7];
}

void __50__UIImage_prepareForDisplayWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  if ((id)v4[2] == v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3)
    {
      id v6 = [v4 _imageWithContent:v3];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

- (UIImage)imageByPreparingForDisplay
{
  id v3 = [(_UIImageContent *)self->_content contentPreparedForDisplay];
  id v4 = v3;
  if (v3 == self->_content)
  {
    uint64_t v5 = self;
    goto LABEL_5;
  }
  if (v3)
  {
    uint64_t v5 = [(UIImage *)self _imageWithContent:v3];
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_imageWithContent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
    id v7 = (void *)v6;
    if (v6) {
      objc_storeStrong((id *)(v6 + 16), a3);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (UIImage)imageWithContentsOfFile:(NSString *)path
{
  id v3 = path;
  id v4 = [[UIImage alloc] initWithContentsOfFile:v3];

  return v4;
}

- (UIImage)initWithContentsOfFile:(NSString *)path
{
  return [(UIImage *)self initWithContentsOfFile:path cache:0];
}

- (UIImage)initWithContentsOfFile:(id)a3 cache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v19 = 0.0;
  uint64_t v20 = 0;
  id v18 = 0;
  id v7 = _UIImageSourceAtPath(v6, v4, (unint64_t)&v20, &v19, &v18);
  id v8 = v18;
  if (v7)
  {
    uint64_t v9 = [_UIImageCGImageContent alloc];
    uint64_t v10 = [(_UIImageCGImageContent *)v9 initWithCGImageSource:v7 scale:v19];
    CFRelease(v7);
    if (v10)
    {
      double v11 = [(UIImage *)self _initWithContent:v10 orientation:v20];
      if (dyld_program_sdk_at_least()) {
        double v12 = v8;
      }
      else {
        double v12 = v6;
      }
      id v13 = v12;
      double v14 = _UserInterfaceTraitFromPath(v13);
      double v15 = v14;
      if (v14) {
        double v16 = (void *)[v14 imageConfiguration];
      }
      else {
        double v16 = 0;
      }
      objc_storeStrong(v11 + 4, v16);

      self = v11;
      uint64_t v10 = self;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (unint64_t)_scaleDefinedByPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"@" options:4];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = objc_msgSend(v3, "substringWithRange:", v4 + 1, 1);
    uint64_t v7 = [v6 integerValue];

    if (v7) {
      unint64_t v5 = v7;
    }
  }

  return v5;
}

+ (int64_t)_idiomDefinedByPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"~" options:4];
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [v3 substringFromIndex:v4];
    if ([v6 rangeOfString:@"iphone"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"ipad"] == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t v5 = 1;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  return v5;
}

- (UIImageResizingMode)resizingMode
{
  return 0;
}

void __74__UIImage__UIImageTintedInterfaceExtension___cachedImageForKey_fromBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)_MergedGlobals_1091 objectForKey:*(void *)(a1 + 32)];
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    int64_t v5 = v2;
    objc_storeStrong(v3, v2);
  }
  else
  {
    id v4 = *v3;
    if (!v4) {
      goto LABEL_6;
    }
    int64_t v5 = 0;
    objc_setAssociatedObject(v4, &_MergedGlobals_1091, *(id *)(a1 + 32), (void *)1);
    [(id)_MergedGlobals_1091 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
  uint64_t v2 = v5;
LABEL_6:
}

- (NSString)description
{
  id v3 = [(UIImage *)self _metricsDescription];
  id v4 = [(_UIImageContent *)self->_content description];
  int64_t v5 = [(UIImage *)self symbolConfiguration];

  if (v5)
  {
    id v6 = NSString;
    uint64_t v7 = [(UIImage *)self symbolConfiguration];
    [v6 stringWithFormat:@" config=<%@>", v7];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_1ED0E84C0;
  }
  if ([(UIImage *)self renderingMode])
  {
    UIImageRenderingMode v9 = [(UIImage *)self renderingMode];
    uint64_t v10 = @"Unknown";
    if (v9 == UIImageRenderingModeAlwaysTemplate) {
      uint64_t v10 = @"alwaysTemplate";
    }
    double v11 = @"alwaysOriginal";
    BOOL v12 = v9 == UIImageRenderingModeAlwaysOriginal;
  }
  else
  {
    id v13 = [(UIImage *)self symbolConfiguration];
    int64_t v14 = [(UIImage *)self _effectiveRenderingModeWithSymbolConfiguration:v13];

    uint64_t v10 = @"automatic";
    if (v14 == 2) {
      uint64_t v10 = @"automatic(template)";
    }
    double v11 = @"automatic(original)";
    BOOL v12 = v14 == 1;
  }
  if (v12) {
    double v15 = v11;
  }
  else {
    double v15 = v10;
  }
  double v16 = [@" renderingMode=" stringByAppendingString:v15];
  double v17 = NSString;
  uint64_t v18 = objc_opt_class();
  double v19 = [(UIImage *)self _identityDescription];
  uint64_t v20 = [v17 stringWithFormat:@"<%@:%p %@ %@%@%@>", v18, self, v19, v3, v8, v16];

  return (NSString *)v20;
}

- (id)_metricsDescription
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([(UIImage *)self hasBaseline])
  {
    id v4 = NSString;
    [(UIImage *)self baselineOffsetFromBottom];
    id v6 = objc_msgSend(v4, "stringWithFormat:", @"baseline=%g", v5);
    [v3 addObject:v6];
  }
  if ([(UIImage *)self _hasContentInsets])
  {
    uint64_t v7 = NSString;
    [(UIImage *)self _contentInsets];
    id v8 = NSStringFromUIEdgeInsets(v25);
    UIImageRenderingMode v9 = [v7 stringWithFormat:@"contentInsets=%@", v8];
    [v3 addObject:v9];
  }
  [(UIImage *)self alignmentRectInsets];
  if (v13 != 0.0 || v11 != 0.0 || v10 != 0.0 || v12 != 0.0)
  {
    int64_t v14 = NSString;
    [(UIImage *)self alignmentRectInsets];
    double v15 = NSStringFromUIEdgeInsets(v26);
    double v16 = [v14 stringWithFormat:@"alignmentRectInsets=%@", v15];
    [v3 addObject:v16];
  }
  if ([v3 count])
  {
    double v17 = NSString;
    [(UIImage *)self size];
    uint64_t v18 = NSStringFromCGSize(v23);
    double v19 = [v3 componentsJoinedByString:@","];
    uint64_t v20 = [v17 stringWithFormat:@"%@ %@", v18, v19];
  }
  else
  {
    [(UIImage *)self size];
    uint64_t v20 = NSStringFromCGSize(v24);
  }

  return v20;
}

- (id)_identityDescription
{
  if (!self->_imageAsset)
  {
    id v6 = @"anonymous";
    goto LABEL_23;
  }
  _UIImageName(self);
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v3 length])
  {

    id v3 = @"?";
  }
  if (!_UIIsSystemSymbolImage(self))
  {
    if (_UIIsKitImage(self))
    {
      [NSString stringWithFormat:@"UIKit(%@)", v3];
LABEL_9:
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    BOOL v7 = [(UIImage *)self _isSymbolImage];
    unsigned int v8 = _UIImageIsFromMainBundle(self);
    if (v7)
    {
      if (v8)
      {
        [NSString stringWithFormat:@"symbol(main: %@)", v3];
        goto LABEL_9;
      }
      UIImageRenderingMode v9 = _UIImageIdentityBundleIdentifier(self);
      if ([v9 length]) {
        [NSString stringWithFormat:@"symbol(%@: %@)", v9, v3];
      }
      else {
        [NSString stringWithFormat:@"symbol(%@)", v3, v11];
      }
    }
    else
    {
      if (v8)
      {
        [NSString stringWithFormat:@"named(main: %@)", v3];
        goto LABEL_9;
      }
      UIImageRenderingMode v9 = _UIImageIdentityBundleIdentifier(self);
      if ([v9 length]) {
        [NSString stringWithFormat:@"named(%@: %@)", v9, v3];
      }
      else {
        [NSString stringWithFormat:@"named(%@)", v3, v11];
      }
    }
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  id v4 = NSString;
  uint64_t v5 = _UIImageName(self);
  id v6 = [v4 stringWithFormat:@"symbol(system: %@)", v5];

LABEL_22:
LABEL_23:
  return v6;
}

- (BOOL)_hasContentInsets
{
  double top = self->_contentInsets.top;
  BOOL result = 1;
  if (top == 0.0 && self->_contentInsets.bottom == 0.0 && self->_contentInsets.left == 0.0) {
    return self->_contentInsets.right != 0.0;
  }
  return result;
}

+ (UIImage)imageWithCIImage:(CIImage *)ciImage
{
  id v3 = ciImage;
  id v4 = [[UIImage alloc] initWithCIImage:v3];

  return v4;
}

- (UIImage)initWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  unsigned int v8 = ciImage;
  if (v8)
  {
    UIImageRenderingMode v9 = [[_UIImageCIImageContent alloc] initWithCIImage:v8 scale:scale];
    double v10 = [(UIImage *)self _initWithContent:v9 orientation:orientation];
    self = (UIImage *)v9;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (UIImage)initWithCIImage:(CIImage *)ciImage
{
  return [(UIImage *)self initWithCIImage:ciImage scale:0 orientation:0.0];
}

+ (UIImage)imageWithContentsOfCPBitmapFile:(id)a3 flags:(int)a4
{
  double valuePtr = 1.0;
  MappedDataFromPath = (UIImage *)CPBitmapCreateMappedDataFromPath();
  if (MappedDataFromPath)
  {
    CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
    if (ImagesFromData)
    {
      CFArrayRef v6 = ImagesFromData;
      ValueAtIndedouble x = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
      unsigned int v8 = CGImageRetain(ValueAtIndex);
      CFRelease(v6);
    }
    else
    {
      unsigned int v8 = 0;
    }
    CFRelease(MappedDataFromPath);
    if (v8)
    {
      UIImageRenderingMode v9 = [UIImage alloc];
      MappedDataFromPath = [(UIImage *)v9 initWithCGImage:v8 scale:0 orientation:valuePtr];
      CGImageRelease(v8);
    }
    else
    {
      MappedDataFromPath = 0;
    }
  }
  return MappedDataFromPath;
}

- (BOOL)writeToCPBitmapFile:(id)a3 flags:(int)a4
{
  id v5 = a3;
  CFArrayRef v6 = [(_UIImageContent *)self->_content CGImage];
  BOOL v7 = 0;
  values = v6;
  if (v5 && v6)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFArrayRef v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    if (v9)
    {
      CFArrayRef v10 = v9;
      CGImageHasAlpha();
      ColorSpace = CGImageGetColorSpace((CGImageRef)values);
      CGColorSpaceGetNumberOfComponents(ColorSpace);
      CGImageGetBitsPerComponent((CGImageRef)values);
      [(_UIImageContent *)self->_content scale];
      double v16 = v12;
      if (v12 == 1.0)
      {
        uint64_t v14 = CPBitmapWriteImagesToPath();
      }
      else
      {
        CFNumberRef v13 = CFNumberCreate(v8, kCFNumberCGFloatType, &v16);
        uint64_t v14 = CPBitmapWriteImagesToPath();
        if (v13) {
          CFRelease(v13);
        }
      }
      BOOL v7 = v14 != 0;
      CFRelease(v10);
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)_imageThatSuppressesAccessibilityHairlineThickening
{
  uint64_t v2 = self;
  if ([(UIImage *)v2 CGImage])
  {
    id v3 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:v2];
    [(UIImage *)v3 _setSuppressesAccessibilityHairlineThickening:1];
  }
  else
  {
    id v3 = v2;
  }
  return v3;
}

- (id)_rasterizedImage
{
  if ([(_UIImageContent *)self->_content isCGImage]
    && ([(UIImage *)self _contentInsets], v6 == 0.0)
    && v4 == 0.0
    && v3 == 0.0
    && v5 == 0.0)
  {
    BOOL v7 = self;
  }
  else
  {
    [(UIImage *)self size];
    double v9 = v8;
    double v11 = v10;
    double v12 = +[UIGraphicsImageRendererFormat defaultFormat];
    [(UIImage *)self scale];
    objc_msgSend(v12, "setScale:");
    CFNumberRef v13 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v12, v9, v11);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __27__UIImage__rasterizedImage__block_invoke;
    v17[3] = &unk_1E52ECB28;
    v17[4] = self;
    *(double *)&v17[5] = v9;
    *(double *)&v17[6] = v11;
    uint64_t v14 = [(UIGraphicsImageRenderer *)v13 imageWithActions:v17];

    if (v14)
    {
      [(UIImage *)self _configureImage:v14 assumePreconfigured:0];
      double v15 = *(void **)(v14 + 8);
      *(void *)(v14 + 8) = 0;

      *(_DWORD *)(v14 + 104) &= ~1u;
      objc_msgSend((id)v14, "_imageWithContentInsets:", 0.0, 0.0, 0.0, 0.0);
      BOOL v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (id)_imageWithContentInsets:(UIEdgeInsets)a3 withUpdatedCGImage:(BOOL)a4
{
  BOOL v4 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(UIImage *)self _isResizable]) {
    goto LABEL_15;
  }
  double v10 = fmax(top, 0.0);
  double v11 = fmax(left, 0.0);
  double v12 = fmax(bottom, 0.0);
  double v13 = fmax(right, 0.0);
  [(UIImage *)self _contentInsets];
  BOOL v18 = v11 == v17 && v10 == v14;
  BOOL v19 = v18 && v13 == v16;
  if (v19 && v12 == v15)
  {
LABEL_15:
    char v32 = self;
    goto LABEL_16;
  }
  if (v4)
  {
    double v21 = v10 - self->_contentInsets.top;
    double v22 = v11 - self->_contentInsets.left;
    double v23 = v12 - self->_contentInsets.bottom;
    double v24 = v13 - self->_contentInsets.right;
    [(_UIImageContent *)self->_content size];
    BOOL v27 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", v24 + v22 + v25, v23 + v21 + v26);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __54__UIImage__imageWithContentInsets_withUpdatedCGImage___block_invoke;
    v42[3] = &unk_1E52DD848;
    v42[4] = self;
    *(double *)&v42[5] = v21;
    *(double *)&v42[6] = v22;
    *(double *)&v42[7] = v23;
    *(double *)&v42[8] = v24;
    BOOL v28 = [(UIGraphicsImageRenderer *)v27 imageWithActions:v42];

    uint64_t v29 = [(UIImage *)self content];
    id v30 = v28;
    uint64_t v31 = objc_msgSend(v29, "contentWithCGImage:", objc_msgSend(v30, "CGImage"));
    char v32 = [(UIImage *)self _imageWithContent:v31];

    if ([(_UIImageContent *)self->_content canScaleImageToTargetResolution]) {
      goto LABEL_21;
    }
    double v33 = 0.0;
    double v34 = 0.0;
    double v35 = 0.0;
    double v36 = 0.0;
    uint64_t v37 = v32;
  }
  else
  {
    uint64_t v37 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
    char v32 = v37;
    double v33 = v10;
    double v34 = v11;
    double v35 = v12;
    double v36 = v13;
  }
  -[UIImage _setContentInsetsExplicitly:](v37, "_setContentInsetsExplicitly:", v33, v34, v35, v36);
LABEL_21:
  if ([(UIImage *)self hasBaseline])
  {
    [(UIImage *)self baselineOffsetFromBottom];
    double v40 = v39;
    [(UIImage *)self _contentInsets];
    [(UIImage *)v32 _setBaselineOffsetFromBottom:v12 + v40 + v41];
  }
LABEL_16:
  return v32;
}

- (void)_setContentInsetsExplicitly:(UIEdgeInsets)a3
{
  self->_contentInsets.double top = fmax(a3.top, 0.0);
  self->_contentInsets.double left = fmax(a3.left, 0.0);
  self->_contentInsets.double bottom = fmax(a3.bottom, 0.0);
  self->_contentInsets.double right = fmax(a3.right, 0.0);
  [(_UIImageContent *)self->_content scale];
  double v5 = v4 * self->_contentInsets.top;
  double v6 = v4 * self->_contentInsets.left;
  double v7 = v4 * self->_contentInsets.bottom;
  double v8 = v4 * self->_contentInsets.right;
  [(_UIImageContent *)self->_content sizeInPixels];
  self->_sizeInPixels.double width = v8 + v6 + v9;
  self->_sizeInPixels.double height = v7 + v5 + v10;
  +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", ((unint64_t)self->_imageFlags >> 2) & 7);
  self->_sizeInPixels.double width = v11;
  self->_sizeInPixels.double height = v12;
  *(_DWORD *)&self->_imageFlags |= 0x4000u;
}

- (id)_imageWithContentInsets:(UIEdgeInsets)a3
{
  return -[UIImage _imageWithContentInsets:withUpdatedCGImage:](self, "_imageWithContentInsets:withUpdatedCGImage:", 0, a3.top, a3.left, a3.bottom, a3.right);
}

void __60__UIImage__systemImageNamed_withConfiguration_allowPrivate___block_invoke()
{
  uint64_t v0 = _UIKitPreferencesOnce();
  double v3 = [v0 objectForKey:@"UIAllowPublicUseOfPrivateSystemSymbols"];

  v1 = v3;
  if (v3)
  {
    char v2 = [v3 BOOLValue];
    v1 = v3;
  }
  else
  {
    char v2 = 0;
  }
  byte_1EB25B109 = v2;
}

+ (id)imageNamed:(id)a3 withConfiguration:(id)a4
{
  return (id)[a1 imageNamed:a3 inBundle:0 withConfiguration:a4];
}

+ (id)_imageNamed:(id)a3 withTrait:(id)a4
{
  id v6 = a3;
  if (a4) {
    double v7 = (void *)[a4 imageConfiguration];
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;
  double v9 = [a1 imageNamed:v6 inBundle:0 withConfiguration:v8];

  return v9;
}

+ (id)__systemImageNamed:(id)a3
{
  return (id)[a1 systemImageNamed:a3 withConfiguration:0];
}

+ (UIImage)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle variableValue:(double)value withConfiguration:(UIImageConfiguration *)configuration
{
  double v7 = [a1 imageNamed:name inBundle:bundle withConfiguration:configuration];
  id v8 = [v7 _imageWithVariableValue:value];

  return (UIImage *)v8;
}

+ (id)_systemImageNamed:(id)a3 fallback:(id)a4
{
  return (id)[a1 _systemImageNamed:a3 fallback:a4 withConfiguration:0];
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4
{
  return [(UIImage *)self _initWithFilledSystemImageNamed:a3 fillColor:a4 symbolColor:0 withName:0];
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5
{
  return [(UIImage *)self _initWithFilledSystemImageNamed:a3 fillColor:a4 symbolColor:a5 withName:0];
}

- (id)_initWithFilledSystemImageNamed:(id)a3 fillColor:(id)a4 symbolColor:(id)a5 withName:(id)a6
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = +[UIImage systemImageNamed:v10];
  if (!v14) {
    goto LABEL_21;
  }
  if ([v10 containsString:@".circle"])
  {
    double v15 = @"circle.fill";
  }
  else if ([v10 containsString:@".square.stack"])
  {
    double v15 = @"square.stack.fill";
  }
  else if ([v10 containsString:@".rectangle.stack"])
  {
    double v15 = @"rectangle.stack.fill";
  }
  else if ([v10 containsString:@".square"])
  {
    double v15 = @"square.fill";
  }
  else if ([v10 containsString:@".rectangle"])
  {
    double v15 = @"rectangle.fill";
  }
  else
  {
    if (![v10 containsString:@".triangle"])
    {
LABEL_21:
      id v24 = 0;
      goto LABEL_22;
    }
    double v15 = @"arrowtriangle.up.fill";
  }
  uint64_t v16 = +[UIImage systemImageNamed:v15];
  if (!v16) {
    goto LABEL_21;
  }
  double v17 = (void *)v16;
  double v26 = self;
  if ([v10 containsString:@".fill"]) {
    double v18 = 0.85;
  }
  else {
    double v18 = 0.95;
  }
  double v19 = *MEMORY[0x1E4F1DAD8];
  double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v21 = +[_UIImageSymbolLayer _symbolLayerWithImage:color:offset:scaleFactor:](_UIImageSymbolLayer, "_symbolLayerWithImage:color:offset:scaleFactor:", v14, v12, *MEMORY[0x1E4F1DAD8], v20, 1.0);
  v27[0] = v21;
  double v22 = +[_UIImageSymbolLayer _symbolLayerWithImage:color:offset:scaleFactor:](_UIImageSymbolLayer, "_symbolLayerWithImage:color:offset:scaleFactor:", v17, v11, v19, v20, v18);
  v27[1] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  if (!v13)
  {
    id v13 = [v10 stringByAppendingString:@".composite"];
  }
  id v24 = [[UIImage alloc] _initWithCompositedSymbolImageLayers:v23 name:v13 alignUsingBaselines:0];

  self = v26;
LABEL_22:

  return v24;
}

- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4
{
  return [(UIImage *)self _initWithCompositedSymbolImageLayers:a3 name:a4 alignUsingBaselines:1];
}

- (id)_initWithCompositedSymbolImageLayers:(id)a3 name:(id)a4 alignUsingBaselines:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4F29128] UUID];
      id v11 = [v10 UUIDString];
      id v12 = [v11 stringByReplacingOccurrencesOfString:@"-" withString:@"."];
      id v9 = [v12 lowercaseString];
    }
    uint64_t v13 = [@"_." stringByAppendingString:v9];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    BOOL v27 = __73__UIImage__initWithCompositedSymbolImageLayers_name_alignUsingBaselines___block_invoke;
    BOOL v28 = &unk_1E52F1788;
    id v14 = v8;
    id v29 = v14;
    BOOL v30 = a5;
    double v15 = +[UIImageAsset _dynamicAssetNamed:v13 generator:&v25];
    uint64_t v16 = objc_msgSend(v14, "firstObject", v25, v26, v27, v28);
    double v17 = [v16 content];
    [v17 scale];
    double v19 = v18;

    double v20 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    double v21 = +[UITraitCollection traitCollectionWithDisplayScale:v19];
    double v22 = [v20 configurationWithTraitCollection:v21];

    double v23 = [v15 imageWithConfiguration:v22];

    id v9 = (id)v13;
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

id __73__UIImage__initWithCompositedSymbolImageLayers_name_alignUsingBaselines___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIImage _generateCompositedSymbolImageForAsset:a2 usingLayers:*(void *)(a1 + 32) configuration:a3 alignUsingBaselines:*(unsigned __int8 *)(a1 + 40)];
}

+ (id)_generateCompositedSymbolImageForAsset:(id)a3 usingLayers:(id)a4 configuration:(id)a5 alignUsingBaselines:(BOOL)a6
{
  BOOL v98 = a6;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  id v8 = a5;
  id v9 = [a4 reverseObjectEnumerator];
  id v10 = [v9 allObjects];

  v104 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v99 = [v10 valueForKeyPath:@"color"];
  CGFloat v14 = *MEMORY[0x1E4F1DB28];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = v10;
  uint64_t v17 = [obj countByEnumeratingWithState:&v120 objects:v124 count:16];
  if (!v17)
  {
    v116.size.double width = v15;
    v116.size.double height = v16;
    v116.origin.double x = v14;
    v116.origin.double y = v13;
    goto LABEL_32;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v121;
  CGFloat v102 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat v103 = *MEMORY[0x1E4F1DAD8];
  v116.size.double width = v15;
  v116.size.double height = v16;
  v116.origin.double x = v14;
  v116.origin.double y = v13;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      CGFloat v112 = v13;
      if (*(void *)v121 != v19) {
        objc_enumerationMutation(obj);
      }
      CGFloat v117 = v15;
      CGFloat v110 = v14;
      CGFloat r1 = v16;
      double v21 = *(void **)(*((void *)&v120 + 1) + 8 * i);
      double v22 = [v21 asset];
      double v23 = [v22 imageWithConfiguration:v8];

      id v24 = [v8 traitCollection];
      [v24 displayScale];
      double v26 = v25;
      if (v25 == 0.0)
      {
        [v23 scale];
        double v26 = v27;
      }

      BOOL v28 = [v23 content];
      id v29 = [v23 content];
      [v104 addObject:v29];

      [v21 offset];
      double v31 = v30;
      [v28 glyphScaleFactor];
      UICeilToScale(v31 * v32, v26);
      double v34 = v33;
      [v21 offset];
      double v36 = v35;
      [v28 glyphScaleFactor];
      UICeilToScale(v36 * v37, v26);
      double v106 = v34;
      double v108 = v38;
      double v39 = [MEMORY[0x1E4F29238] valueWithCGPoint:v34];
      [v11 addObject:v39];

      [v23 size];
      double v41 = v40;
      double v43 = v42;
      [v23 _contentInsets];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      [v21 scaleFactor];
      double v53 = v52;
      if (v52 < 1.0)
      {
        double v54 = v41 * v52 - 2.0 / v26;
        if (v54 >= v41 + -2.0) {
          double v54 = v41 + -2.0;
        }
        double v55 = v43 * v53 - 2.0 / v26;
        if (v55 >= v43 + -2.0) {
          double v55 = v43 + -2.0;
        }
        double v56 = v54 / v41;
        double v57 = v55 / v43;
        if (v56 >= v57) {
          double v53 = v57;
        }
        else {
          double v53 = v56;
        }
        UIFloorToScale(v41 * v53, v26);
        double v41 = v58;
        UIFloorToScale(v43 * v53, v26);
        double v43 = v59;
        UICeilToScale(v45 * v53, v26);
        double v45 = v60;
        UICeilToScale(v49 * v53, v26);
        double v105 = v61;
        UICeilToScale(v47 * v53, v26);
        double v47 = v62;
        UICeilToScale(v51 * v53, v26);
LABEL_26:
        double v51 = v63;
        goto LABEL_28;
      }
      if (v52 > 1.0)
      {
        double v64 = 2.0 / v26 + v41 * v52;
        if (v64 < v41 + 2.0) {
          double v64 = v41 + 2.0;
        }
        double v65 = 2.0 / v26 + v43 * v53;
        if (v65 < v43 + 2.0) {
          double v65 = v43 + 2.0;
        }
        double v66 = v64 / v41;
        double v67 = v65 / v43;
        if (v66 >= v67) {
          double v53 = v66;
        }
        else {
          double v53 = v67;
        }
        UICeilToScale(v41 * v53, v26);
        double v41 = v68;
        UICeilToScale(v43 * v53, v26);
        double v43 = v69;
        UIFloorToScale(v45 * v53, v26);
        double v45 = v70;
        UIFloorToScale(v49 * v53, v26);
        double v105 = v71;
        UIFloorToScale(v47 * v53, v26);
        double v47 = v72;
        UIFloorToScale(v51 * v53, v26);
        goto LABEL_26;
      }
      double v105 = v49;
LABEL_28:
      v73 = [NSNumber numberWithDouble:v53];
      [v12 addObject:v73];

      UIRoundToScale(v106 + v41 * -0.5, v26);
      CGFloat v75 = v74;
      [v23 baselineOffsetFromBottom];
      double v77 = v76;
      [v23 size];
      UIRoundToScale(v108 + v77 - v78, v26);
      CGFloat v80 = v79;
      v127.origin.double y = v102;
      v127.origin.double x = v103;
      v127.size.double width = v41;
      v127.size.double height = v43;
      CGRect v128 = CGRectOffset(v127, v75, v80);
      double x = v128.origin.x;
      double y = v128.origin.y;
      double width = v128.size.width;
      double height = v128.size.height;
      CGRect v116 = CGRectUnion(v116, v128);
      v135.origin.double x = v47 + x;
      v135.origin.double y = v45 + y;
      v135.size.double width = width - (v51 + v47);
      v135.size.double height = height - (v105 + v45);
      v129.origin.double x = v110;
      v129.origin.double y = v112;
      v129.size.double width = v117;
      v129.size.double height = r1;
      CGRect v130 = CGRectUnion(v129, v135);
      CGFloat v14 = v130.origin.x;
      CGFloat v13 = v130.origin.y;
      CGFloat v15 = v130.size.width;
      double v16 = v130.size.height;
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v120 objects:v124 count:16];
  }
  while (v18);
LABEL_32:

  double r1a = CGRectGetMinY(v116);
  v131.origin.double x = v14;
  v131.origin.double y = v13;
  v131.size.double width = v15;
  v131.size.double height = v16;
  double MinY = CGRectGetMinY(v131);
  double MinX = CGRectGetMinX(v116);
  v132.origin.double x = v14;
  v132.origin.double y = v13;
  v132.size.double width = v15;
  v132.size.double height = v16;
  double v109 = CGRectGetMinX(v132);
  v133.origin.double x = v14;
  v133.origin.double y = v13;
  v133.size.double width = v15;
  v133.size.double height = v16;
  double MaxY = CGRectGetMaxY(v133);
  double v85 = MaxY - CGRectGetMaxY(v116);
  if (v85 < 0.0) {
    double v85 = -v85;
  }
  double v107 = v85;
  v134.origin.double x = v14;
  v134.origin.double y = v13;
  double v119 = v15;
  v134.size.double width = v15;
  v134.size.double height = v16;
  double MaxX = CGRectGetMaxX(v134);
  double v87 = CGRectGetMaxX(v116);
  double v88 = CGRectGetMaxY(v116);
  double v89 = v88;
  if (v98)
  {
    double v90 = v107;
    double v91 = (v107 + v16 - v88) / v16;
  }
  else
  {
    double v91 = 0.5;
    double v90 = v107;
  }
  if (MaxX - v87 >= 0.0) {
    double v92 = MaxX - v87;
  }
  else {
    double v92 = -(MaxX - v87);
  }
  if (MinX - v109 >= 0.0) {
    double v93 = MinX - v109;
  }
  else {
    double v93 = -(MinX - v109);
  }
  if (r1a - MinY >= 0.0) {
    double v94 = r1a - MinY;
  }
  else {
    double v94 = -(r1a - MinY);
  }
  v95 = -[_UIImageMultiVectorGlyphContent initWithSize:glyphs:colors:offsets:scaleFactors:anchorPoint:]([_UIImageMultiVectorGlyphContent alloc], "initWithSize:glyphs:colors:offsets:scaleFactors:anchorPoint:", v104, v99, v11, v12, v119, v16, 0.5, v91);
  id v96 = [[UIImage alloc] _initWithContent:v95 orientation:0];
  [v96 _setRenderingMode:0];
  objc_msgSend(v96, "_setContentInsets:", v94, v93, v90, v92);
  [v96 _setBaselineOffsetFromBottom:v89];
  [v96 _setConfiguration:v8];
  [v96 _setNamed:1];
  [v96 _setImageAsset:v100];

  return v96;
}

+ (UIImage)imageWithData:(NSData *)data scale:(CGFloat)scale
{
  double v5 = data;
  id v6 = [[UIImage alloc] initWithData:v5 scale:scale];

  return v6;
}

+ (UIImage)imageWithCIImage:(CIImage *)ciImage scale:(CGFloat)scale orientation:(UIImageOrientation)orientation
{
  double v7 = ciImage;
  id v8 = [[UIImage alloc] initWithCIImage:v7 scale:orientation orientation:scale];

  return v8;
}

+ (void)_loadImageFromURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"UIImage.m", 1333, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F18DC0] sharedSession];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__UIImage__loadImageFromURL_completionHandler___block_invoke;
  v13[3] = &unk_1E52F17B0;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 downloadTaskWithURL:v7 completionHandler:v13];

  [v11 resume];
}

void __47__UIImage__loadImageFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v11 && [v11 isFileURL])
  {
    id v9 = [v11 path];
    id v10 = +[UIImage imageWithContentsOfFile:v9];
  }
  else
  {
    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_canEncodeWithName:(id)a3 coder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (_UIIsSystemSymbolImage(self) & 1) != 0
    || (objc_msgSend(v7, "_ui_isInterprocess") & 1) == 0
    && [(UIImage *)self _isNamed]
    && [v6 length] != 0;

  return v8;
}

- (void)_encodeDataWithCoder:(id)a3 imageName:(id)a4
{
  id v5 = a3;
  UIImagePNGRepresentation(self);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v7 copy];
  [v5 encodeObject:v6 forKey:@"UIImageData"];
}

- (void)_encodePropertiesWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeBool:1 forKey:@"UIKitWantsProperties"];
  [(_UIImageContent *)self->_content scale];
  *(float *)&double v4 = v4;
  [v9 encodeFloat:@"UIScale" forKey:v4];
  objc_msgSend(v9, "encodeCGSize:forKey:", @"UIImageSizeInPixels", self->_sizeInPixels.width, self->_sizeInPixels.height);
  objc_msgSend(v9, "encodeInt:forKey:", -[UIImage imageOrientation](self, "imageOrientation"), @"UIImageOrientation");
  [v9 encodeBool:(*(_DWORD *)&self->_imageFlags >> 7) & 1 forKey:@"UIHasPattern"];
  [v9 encodeInt:(*(_DWORD *)&self->_imageFlags >> 9) & 3 forKey:@"UIRenderingMode"];
  double top = self->_alignmentRectInsets.top;
  if (self->_alignmentRectInsets.left != 0.0
    || top != 0.0
    || self->_alignmentRectInsets.right != 0.0
    || self->_alignmentRectInsets.bottom != 0.0)
  {
    [v9 encodeUIEdgeInsets:@"UIImageAlignmentRectInsets" forKey:top];
  }
  if ([(UIImage *)self hasBaseline])
  {
    double baselineOffsetFromBottom = self->_baselineOffsetFromBottom;
    *(float *)&double baselineOffsetFromBottom = baselineOffsetFromBottom;
    [v9 encodeFloat:@"UIBaselineOffsetFromBottom" forKey:baselineOffsetFromBottom];
  }
  id v7 = [(UIImage *)self symbolConfiguration];
  BOOL v8 = v7;
  if (v7 && ([v7 _isUnspecified] & 1) == 0) {
    [v9 encodeObject:v8 forKey:@"UIImageSymbolConfiguration"];
  }
  if ([(UIImage *)self _hasContentInsets]) {
    objc_msgSend(v9, "encodeUIEdgeInsets:forKey:", @"UIImageContentInsets", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  [v17 encodeBool:1 forKey:@"UIKitDidEncode"];
  double v4 = _UIImageName(self);
  int v5 = _UIIsKitImage(self);
  int v6 = _UIIsSystemSymbolImage(self);
  if (![(UIImage *)self _canEncodeWithName:v4 coder:v17]) {
    goto LABEL_18;
  }
  if (v6)
  {
    if (_UIIsPrivateSystemSymbolImage(self)) {
      [v17 encodeBool:1 forKey:@"UIIsPrivateSystemImage"];
    }
    id v7 = @"UIIsSystemImage";
    goto LABEL_8;
  }
  if (!v5)
  {
    if (!dyld_program_sdk_at_least())
    {
      id v9 = _UIPathForImageWithCacheName(v4);
      [v17 encodeObject:v9 forKey:@"UIImageName"];
LABEL_16:

      goto LABEL_19;
    }
    BOOL v8 = [(UIImageAsset *)self->_imageAsset _assetManager];
    id v9 = [v8 bundle];

    id v10 = [v9 bundlePath];

    if (v10)
    {
      [v17 encodeObject:v4 forKey:@"UIImageName"];
      id v11 = [v9 bundleIdentifier];
      [v17 encodeObject:v11 forKey:@"UIImageBundleIdentifier"];

      id v12 = [v9 executablePath];
      CGFloat v13 = [v12 lastPathComponent];
      [v17 encodeObject:v13 forKey:@"UIImageBundleLibraryName"];

LABEL_15:
      goto LABEL_16;
    }
    id v12 = _UIPathForImageWithCacheName(v4);
    if ([v12 length])
    {
      [v17 encodeObject:v12 forKey:@"UIImageName"];
      goto LABEL_15;
    }

LABEL_18:
    [(UIImage *)self _encodeDataWithCoder:v17 imageName:v4];
    goto LABEL_19;
  }
  id v7 = @"UIIsKitImage";
LABEL_8:
  [v17 encodeBool:1 forKey:v7];
  [v17 encodeObject:v4 forKey:@"UIImageName"];
LABEL_19:
  if (![(UIImage *)self _canEncodeWithName:v4 coder:v17]
    || ![(UIImage *)self isMemberOfClass:objc_opt_class()]
    || [(UIImage *)self _isSymbolImage])
  {
    [(UIImage *)self _encodePropertiesWithCoder:v17];
  }
  [v17 encodeObject:self->_configuration forKey:@"UIImageConfiguration"];
  id v14 = [(UIImageConfiguration *)self->_configuration _effectiveTraitCollectionForImageLookup];
  [v17 encodeObject:v14 forKey:@"UIImageTraitCollection"];

  [(_UIImageContent *)self->_content variableValue];
  objc_msgSend(v17, "encodeDouble:forKey:", @"UIImageVariableValue");
  [v17 encodeBool:HIWORD(*(_DWORD *)&self->_imageFlags) & 1 forKey:@"UIImageIsFlippedInRightToLeft"];
  CGFloat v15 = [self accessibilityLabel];
  [v17 encodeObject:v15 forKey:@"UIImageAccessibilityLabel"];

  double v16 = [self accessibilityLanguage];
  [v17 encodeObject:v16 forKey:@"UIImageAccessibilityLanguage"];
}

- (UIImage)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 decodeBoolForKey:@"UIKitDidEncode"])
  {
    int v5 = 0;
    goto LABEL_49;
  }
  if ([v4 containsValueForKey:@"UIImageData"])
  {
    int v5 = [(UIImage *)self init];
    int v6 = 0;
    goto LABEL_30;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageName"];
  if (![v7 length])
  {
    int v6 = 0;
    goto LABEL_24;
  }
  int v8 = [v4 decodeBoolForKey:@"UIIsSystemImage"];
  int v9 = [v4 decodeBoolForKey:@"UIIsKitImage"];
  if (v8)
  {
    uint64_t v10 = +[UIImage _systemImageNamed:withConfiguration:allowPrivate:](UIImage, "_systemImageNamed:withConfiguration:allowPrivate:", v7, 0, [v4 decodeBoolForKey:@"UIIsPrivateSystemImage"]);
    goto LABEL_11;
  }
  if (v9)
  {
    uint64_t v10 = _UIImageWithName(v7);
LABEL_11:
    int v6 = (UIImage *)v10;
    if (!v10) {
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageBundleIdentifier"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageBundleLibraryName"];
  CGFloat v13 = [MEMORY[0x1E4F28B50] _bundleWithIdentifier:v11 andLibraryName:v12];
  if (v13) {
    +[UIImage imageNamed:v7 inBundle:v13 compatibleWithTraitCollection:0];
  }
  else {
  int v6 = +[UIImage imageNamed:v7];
  }

  if (!v6)
  {
LABEL_24:

    int v5 = [(UIImage *)self init];
    if (!v6) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
LABEL_17:
  if (![v7 length]) {
    goto LABEL_24;
  }
  char v14 = [(UIImage *)self isMemberOfClass:objc_opt_class()];

  if ((v14 & 1) == 0)
  {
    int v5 = [(UIImage *)self init];
LABEL_27:
    if ([(_UIImageContent *)v6->_content isCGImage])
    {
      int v6 = v6;
      uint64_t v19 = CGImageRetain([(UIImage *)v6 CGImage]);
      if (v19)
      {
LABEL_31:
        [v4 decodeFloatForKey:@"UIScale"];
        id v24 = [[_UIImageCGImageContent alloc] initWithCGImage:v19 scale:v23];
        content = v5->_content;
        v5->_content = &v24->super;

        CGImageRelease(v19);
        goto LABEL_32;
      }
      goto LABEL_29;
    }
LABEL_30:
    double v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageData"];
    uint64_t v19 = _UIImageRefFromData(v22, 0, 0, 0);

    if (v19) {
      goto LABEL_31;
    }
LABEL_29:
    uint64_t v20 = +[_UIImageContent empty];
    double v21 = v5->_content;
    v5->_content = (_UIImageContent *)v20;

    goto LABEL_32;
  }
  id v15 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageConfigurationClass"];
  if (![v15 conformsToProtocol:&unk_1ED59E5E0]
    || ([v4 decodeObjectOfClass:v15 forKey:@"UIImageConfiguration"],
        (double v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageSymbolConfiguration"];
    if (!v16)
    {
      int v5 = v6;
      int v6 = v5;
LABEL_46:

      self = v6;
      goto LABEL_47;
    }
  }
  id v17 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:v6];

  int v5 = [(UIImage *)v17 imageWithConfiguration:v16];

  int v18 = [v4 decodeBoolForKey:@"UIKitWantsProperties"];
  int v6 = v17;
  self = v17;
  if (v18)
  {
LABEL_32:
    v5->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFFFE3 | (4 * ([v4 decodeIntForKey:@"UIImageOrientation"] & 7)));
    if ([v4 containsValueForKey:@"UIImageSizeInPixels"])
    {
      [v4 decodeCGSizeForKey:@"UIImageSizeInPixels"];
    }
    else
    {
      unint64_t v28 = ((unint64_t)v5->_imageFlags >> 2) & 7;
      [(_UIImageContent *)v5->_content sizeInPixels];
      +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", v28);
    }
    v5->_sizeInPixels.double width = v26;
    v5->_sizeInPixels.double height = v27;
    if ([v4 decodeBoolForKey:@"UIHasPattern"]) {
      int v29 = 128;
    }
    else {
      int v29 = 0;
    }
    v5->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFFF7F | v29);
    v5->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFFF9FF | (([v4 decodeIntForKey:@"UIRenderingMode"] & 3) << 9));
    [v4 decodeUIEdgeInsetsForKey:@"UIImageAlignmentRectInsets"];
    v5->_alignmentRectInsets.double top = v30;
    v5->_alignmentRectInsets.double left = v31;
    v5->_alignmentRectInsets.double bottom = v32;
    v5->_alignmentRectInsets.double right = v33;
    if ([v4 containsValueForKey:@"UIImageContentInsets"])
    {
      [v4 decodeUIEdgeInsetsForKey:@"UIImageContentInsets"];
      v5->_contentInsets.double top = v34;
      v5->_contentInsets.double left = v35;
      v5->_contentInsets.double bottom = v36;
      v5->_contentInsets.double right = v37;
    }
    if ([v4 containsValueForKey:@"UIBaselineOffsetFromBottom"])
    {
      [v4 decodeFloatForKey:@"UIBaselineOffsetFromBottom"];
      v5->_double baselineOffsetFromBottom = v38;
      *(_DWORD *)&v5->_imageFlags |= 0x1000u;
    }
    if ([v4 decodeBoolForKey:@"UIImageIsFlippedInRightToLeft"]) {
      int v39 = 0x10000;
    }
    else {
      int v39 = 0;
    }
    v5->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&v5->_imageFlags & 0xFFFEFFFF | v39);
    double v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageAccessibilityLabel"];
    [v5 setAccessibilityLabel:v40];

    self = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageAccessibilityLanguage"];
    [v5 setAccessibilityLanguage:self];
    goto LABEL_46;
  }
LABEL_47:
  if ([v4 containsValueForKey:@"UIImageVariableValue"])
  {
    [v4 decodeDoubleForKey:@"UIImageVariableValue"];
    uint64_t v41 = -[UIImage _imageWithVariableValue:](v5, "_imageWithVariableValue:");

    int v5 = (UIImage *)v41;
  }
LABEL_49:

  return v5;
}

- (BOOL)_isCGImageOnly
{
  return [(_UIImageContent *)self->_content isCGImageOnly];
}

- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIImage *)self willChangeValueForKey:@"flipsForRightToLeftLayoutDirection"];
  if (v3) {
    int v5 = 0x10000;
  }
  else {
    int v5 = 0;
  }
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFEFFFF | v5);
  [(UIImage *)self didChangeValueForKey:@"flipsForRightToLeftLayoutDirection"];
}

- (int64_t)_imageOrientationConsideringRTL
{
  uint64_t v3 = [(id)UIApp userInterfaceLayoutDirection];
  return [(UIImage *)self _imageOrientationConsideringRTLForUserInterfaceLayoutDirection:v3];
}

- (BOOL)_isRTLImage
{
  if (([(UIImage *)self imageOrientation] & 4) == 0) {
    return 0;
  }
  id v4 = [(UIImage *)self configuration];
  int v5 = [v4 traitCollection];
  BOOL v3 = [v5 layoutDirection] == 1;

  return v3;
}

+ (int64_t)_mirroredImageOrientationForOrientation:(int64_t)a3
{
  return a3 ^ 4;
}

+ (int64_t)_horizontallyFlippedOrientationForOrientation:(int64_t)a3
{
  int64_t result = 7;
  switch(a3)
  {
    case 0:
    case 1:
    case 4:
    case 5:
      int64_t result = objc_msgSend(a1, "_mirroredImageOrientationForOrientation:");
      break;
    case 2:
      return result;
    case 3:
      int64_t result = 6;
      break;
    case 6:
      int64_t result = 3;
      break;
    case 7:
      int64_t result = 2;
      break;
    default:
      int64_t result = a3;
      break;
  }
  return result;
}

- (void)_horizontallyFlipImageOrientation
{
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFE1 | (4 * (+[UIImage _horizontallyFlippedOrientationForOrientation:[(UIImage *)self imageOrientation]] & 7)));
}

- (void)_mirrorImageOrientation
{
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFE1 | (4 * (+[UIImage _mirroredImageOrientationForOrientation:[(UIImage *)self imageOrientation]] & 7)));
}

- (UIImage)imageWithHorizontallyFlippedOrientation
{
  char v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [v2 _mirrorImageOrientation];
  return (UIImage *)v2;
}

- (CGRect)_contentRectInPixels
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double width = self->_sizeInPixels.width;
  double height = self->_sizeInPixels.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIEdgeInsets)_subimageInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (id)_bundle
{
  double v2 = [(UIImage *)self _primitiveImageAsset];
  double v3 = [v2 _assetManager];
  double v4 = [v3 bundle];

  return v4;
}

+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3
{
  double v3 = (void *)[objc_alloc((Class)a1) _initWithCGPDFPage:a3];
  return v3;
}

+ (id)_imageWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  double v5 = (void *)[objc_alloc((Class)a1) _initWithCGPDFPage:a3 scale:a5 orientation:a4];
  return v5;
}

- (id)_initWithCGPDFPage:(CGPDFPage *)a3
{
  return [(UIImage *)self _initWithCGPDFPage:a3 scale:0 orientation:1.0];
}

- (id)_initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  if (a3)
  {
    id v7 = [[_UIImageCGPDFPageContent alloc] initWithCGPDFPage:a3 scale:a4];
    id v8 = [(UIImage *)self _initWithContent:v7 orientation:a5];
    self = (UIImage *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGPDFPage)_CGPDFPage
{
  return [(_UIImageContent *)self->_content CGPDFPage];
}

- (BOOL)_isPDFVector
{
  return [(_UIImageContent *)self->_content isCGPDFPage];
}

- (CGSize)_CGPDFPageSize
{
  [(_UIImageContent *)self->_content CGPDFPageSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)_scaleFromPDF
{
  if (![(_UIImageContent *)self->_content isCGPDFPage]) {
    return 1.0;
  }
  content = self->_content;
  [(_UIImageContent *)content scale];
  return result;
}

- (CGSize)_sizeInPixelsFromPDF
{
  if ([(_UIImageContent *)self->_content isCGPDFPage])
  {
    [(UIImage *)self scale];
    double v4 = v3;
    [(UIImage *)self _contentInsets];
    double v6 = v5;
    double v8 = v7;
    [(_UIImageContent *)self->_content sizeInPixels];
    double v9 = v4 * (v6 + v8);
    double v11 = v10 + v9;
    double v13 = v12 + v9;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v13;
  result.double width = v11;
  return result;
}

+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3
{
  double v3 = (void *)[objc_alloc((Class)a1) _initWithCGSVGDocument:a3];
  return v3;
}

+ (id)_imageWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  double v5 = (void *)[objc_alloc((Class)a1) _initWithCGSVGDocument:a3 scale:a5 orientation:a4];
  return v5;
}

- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3
{
  return [(UIImage *)self _initWithCGSVGDocument:a3 scale:0 orientation:1.0];
}

- (id)_initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  if (a3)
  {
    double v7 = [[_UIImageCGSVGDocumentContent alloc] initWithCGSVGDocument:a3 scale:a4];
    id v8 = [(UIImage *)self _initWithContent:v7 orientation:a5];
    self = (UIImage *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGSVGDocument)_CGSVGDocument
{
  return [(_UIImageContent *)self->_content CGSVGDocument];
}

- (BOOL)_isSVGVector
{
  return [(_UIImageContent *)self->_content isCGSVGDocument];
}

- (CGSize)_CGSVGDocumentSize
{
  [(_UIImageContent *)self->_content CGSVGDocumentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UIImage)imageRestrictedToStandardDynamicRange
{
  double v2 = self;
  if ([(UIImage *)v2 isHighDynamicRange])
  {
    double v3 = [(_UIImageContent *)v2->_content makeSDRVersion];
    uint64_t v4 = [(UIImage *)v2 _imageWithContent:v3];

    double v2 = (UIImage *)v4;
  }
  return v2;
}

- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v57 = a4;
  double v9 = (__CFString *)a5;
  if ([(UIImage *)self renderingMode] == UIImageRenderingModeAlwaysOriginal
    || ([(UIImage *)self content],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isCGImage],
        v10,
        (v11 & 1) == 0))
  {
    CGFloat v35 = self;
  }
  else
  {
    double v12 = _UIKitGetTextEffectsCatalog();
    if (v12)
    {
      double v54 = v9;
      uint64_t v13 = -[UITraitCollection _styleEffectAppearanceName](v9);
      char v14 = self;
      uint64_t v15 = [(UIImage *)v14 CGImage];
      id v16 = objc_alloc_init(MEMORY[0x1E4F5E088]);
      [v16 setState:0];
      [v16 setValue:0];
      double v53 = (void *)v13;
      [v16 setAppearanceName:v13];
      double v52 = v14;
      [(UIImage *)v14 scale];
      double v18 = v17;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v55 = v8;
      obuint64_t j = v8;
      uint64_t v19 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        double v21 = 0;
        uint64_t v22 = *(void *)v59;
        double v23 = 0.0;
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
        double v27 = -1.0 / v18;
        do
        {
          uint64_t v28 = 0;
          int v29 = v21;
          do
          {
            if (*(void *)v59 != v22) {
              objc_enumerationMutation(obj);
            }
            CGFloat v30 = *(void **)(*((void *)&v58 + 1) + 8 * v28);
            objc_msgSend(v16, "setForegroundColorShouldTintEffects:", objc_msgSend(v30, "isEqualToString:", @"_UIKitBoldTintStyle"));
            double v21 = objc_msgSend(v12, "imageByStylingImage:stylePresetName:styleConfiguration:foregroundColor:scale:", v15, v30, v16, objc_msgSend(v57, "CGColor"), v18);

            if (v21) {
              uint64_t v15 = [v21 image];
            }
            [v12 styledInsetsForStylePresetName:v30 styleConfiguration:v16 foregroundColor:0 scale:v18];
            double v23 = v23 + v27 * v31;
            double v24 = v24 + v27 * v32;
            double v25 = v25 + v27 * v33;
            double v26 = v26 + v27 * v34;
            ++v28;
            int v29 = v21;
          }
          while (v20 != v28);
          uint64_t v20 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v20);
      }
      else
      {
        double v21 = 0;
        double v23 = 0.0;
        double v24 = 0.0;
        double v25 = 0.0;
        double v26 = 0.0;
      }

      uint64_t v36 = [v21 image];
      if (v36
        && (uint64_t v37 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCGImage:scale:orientation:", v36, -[UIImage imageOrientation](v52, "imageOrientation"), v18)) != 0)
      {
        CGFloat v35 = (UIImage *)v37;
        *(_DWORD *)(v37 + 104) = *(_DWORD *)(v37 + 104) & 0xFFFFF9FF | 0x200;
        id v8 = v55;
        if ([(UIImage *)v52 _isResizable])
        {
          [(UIImage *)v52 capInsets];
          double v42 = v38;
          if (v39 != 0.0 || v38 != 0.0 || v41 != 0.0 || (double v43 = v23, v44 = v24, v45 = v25, v46 = v26, v40 != 0.0))
          {
            if (v42 == 0.0 && v40 == 0.0)
            {
              double v44 = v24 + v39;
              double v46 = v26 + v41;
              double v43 = v42;
              double v45 = v40;
            }
            else
            {
              double v43 = v23 + v42;
              if (v39 == 0.0 && v41 == 0.0)
              {
                double v45 = v25 + v40;
                double v44 = v39;
                double v46 = v41;
              }
              else
              {
                double v44 = v24 + v39;
                double v45 = v25 + v40;
                double v46 = v26 + v41;
              }
            }
          }
          -[UIImage _setCapInsets:](v35, "_setCapInsets:", v43, v44, v45, v46);
          if ([(UIImage *)v52 resizingMode] == UIImageResizingModeStretch) {
            [(UIImage *)v35 _setAlwaysStretches:1];
          }
        }
        [(UIImage *)v52 alignmentRectInsets];
        -[UIImage _setAlignmentRectInsets:](v35, "_setAlignmentRectInsets:", v23 + v47, v24 + v48, v25 + v49, v26 + v50);
      }
      else
      {
        NSLog(&cfstr_SUnexpectedlyF.isa, "-[UIImage _imageWithStylePresets:tintColor:traitCollection:]");
        CGFloat v35 = v52;
        id v8 = v55;
      }
      double v9 = v54;
    }
    else
    {
      if (_imageWithStylePresets_tintColor_traitCollection__once != -1) {
        dispatch_once(&_imageWithStylePresets_tintColor_traitCollection__once, &__block_literal_global_415);
      }
      CGFloat v35 = self;
    }
  }
  return v35;
}

void __60__UIImage__imageWithStylePresets_tintColor_traitCollection___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    double v2 = "-[UIImage _imageWithStylePresets:tintColor:traitCollection:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "%s. Unexpectedly missing the text-effects catalog.", (uint8_t *)&v1, 0xCu);
  }
}

- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4
{
  BOOL v4 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = self;
  id v8 = v7;
  if (v6)
  {
    imageAsset = v7->_imageAsset;
    if (imageAsset)
    {
      uint64_t v10 = [(UIImageAsset *)imageAsset imageWithTraitCollection:v6];

      id v8 = (void *)v10;
    }
  }
  [v8 size];
  double v12 = v11;
  double v14 = v13;
  int v15 = [v8 _suppressesAccessibilityHairlineThickening];
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v15 && v4)
  {
    v27[0] = @"_UIKitBoldTintStyle";
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  [v8 scale];
  +[UIImage _edgeInsetsForStylePresetNames:scale:traitCollection:](UIImage, "_edgeInsetsForStylePresetNames:scale:traitCollection:", v16, v6);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v12 + v20 + v24;
  double v26 = v14 + v18 + v22;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (UIEdgeInsets)_inverseAlignmentRectInsets
{
  double v2 = -self->_alignmentRectInsets.top;
  double v3 = -self->_alignmentRectInsets.left;
  double v4 = -self->_alignmentRectInsets.bottom;
  double v5 = -self->_alignmentRectInsets.right;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)_isColoredSymbolImage
{
  if ([(UIImage *)self _isMultiColorSymbolImage]
    || [(UIImage *)self _isHierarchicalColorSymbolImage])
  {
    return 1;
  }
  return [(UIImage *)self _isPaletteColorSymbolImage];
}

- (id)_outlinePath
{
  double v3 = [(UIImage *)self content];
  double v4 = [v3 outlinePath];

  [(UIImage *)self scale];
  CGAffineTransformMakeScale(&v7, 1.0 / v5, 1.0 / v5);
  [v4 applyTransform:&v7];
  return v4;
}

- (BOOL)_isSameSymbolImageExceptVariableValue:(id)a3
{
  content = self->_content;
  double v4 = [a3 content];
  LOBYTE(content) = [(_UIImageContent *)content _isSameSymbolImageContentExceptVariableValue:v4];

  return (char)content;
}

- (double)_baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (double)__baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (void)_setBaselineOffsetFromBottomExplicitly:(double)a3
{
  self->_double baselineOffsetFromBottom = a3;
  *(_DWORD *)&self->_imageFlags |= 0x3000u;
}

- (double)_capHeight
{
  if ((*((unsigned char *)&self->_imageFlags + 2) & 2) != 0) {
    return self->_capHeight;
  }
  [(UIImage *)self size];
  double v4 = v3;
  [(UIImage *)self baselineOffsetFromBottom];
  return v4 - v5;
}

- (UIImage)imageWithBaselineOffsetFromBottom:(CGFloat)baselineOffset
{
  double v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [v4 _setBaselineOffsetFromBottomExplicitly:baselineOffset];
  return (UIImage *)v4;
}

- (UIImage)imageWithoutBaseline
{
  double v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [v2 _removeBaselineExplicitly];
  return (UIImage *)v2;
}

- (void)_removeBaselineExplicitly
{
  self->_double baselineOffsetFromBottom = 0.0;
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFCFFF | 0x2000);
}

- (id)_imageWithSymbolMetricsFromNamedVectorGlyph:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [v5 _setSymbolMetricsFromNamedVectorGlyph:v4];

  return v5;
}

- (double)midlineOffsetFromCenter
{
  return 0.0;
}

- (id)_flatImageWithWhite:(double)a3 alpha:(double)a4
{
  double v5 = +[UIColor colorWithWhite:a3 alpha:a4];
  id v6 = [(UIImage *)self _flatImageWithColor:v5];

  return v6;
}

- (id)_colorForName:(id)a3 withTraitCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIImage *)self _primitiveImageAsset];
  double v9 = [v8 _assetManager];
  uint64_t v10 = [v9 colorNamed:v7 withTraitCollection:v6];

  return v10;
}

uint64_t __54__UIImage__imageWithContentInsets_withUpdatedCGImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *(double *)(a1 + 48), *(double *)(a1 + 64), 1.0);
}

- (BOOL)hasContentInsets
{
  return 0;
}

- (UIEdgeInsets)padding
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (BOOL)hasPadding
{
  return 0;
}

+ (UIImage)animatedImageNamed:(NSString *)name duration:(NSTimeInterval)duration
{
  return (UIImage *)[a1 _animatedImageNamed:name inBundle:0 compatibleWithTraitCollection:0 duration:duration];
}

+ (id)_animatedImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 duration:(double)a6
{
  id v8 = LoadImageSequence(a3, a4, a5, 0, 0, 0.0, 0.0, 0.0, 0.0);
  if ([v8 count])
  {
    double v9 = [a1 animatedImageWithImages:v8 duration:a6];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets duration:(NSTimeInterval)duration
{
  return +[UIImage animatedResizableImageNamed:capInsets:resizingMode:duration:](UIImage, "animatedResizableImageNamed:capInsets:resizingMode:duration:", name, 0, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right, duration);
}

+ (UIImage)animatedResizableImageNamed:(NSString *)name capInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode duration:(NSTimeInterval)duration
{
  return (UIImage *)+[UIImage _animatedResizableImageNamed:inBundle:compatibleWithTraitCollection:capInsets:resizingMode:duration:](UIImage, "_animatedResizableImageNamed:inBundle:compatibleWithTraitCollection:capInsets:resizingMode:duration:", name, 0, 0, resizingMode, capInsets.top, capInsets.left, capInsets.bottom, capInsets.right, duration);
}

+ (id)_animatedResizableImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5 capInsets:(UIEdgeInsets)a6 resizingMode:(int64_t)a7 duration:(double)a8
{
  uint64_t v10 = LoadImageSequence(a3, a4, a5, 1, a7, a6.top, a6.left, a6.bottom, a6.right);
  if ([v10 count])
  {
    double v11 = [a1 animatedImageWithImages:v10 duration:a8];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

+ (UIImage)animatedImageWithImages:(NSArray *)images duration:(NSTimeInterval)duration
{
  double v5 = images;
  if ([(NSArray *)v5 count]) {
    id v6 = [[_UIAnimatedImage alloc] initWithImages:v5 duration:duration];
  }
  else {
    id v6 = 0;
  }

  return (UIImage *)v6;
}

- (void)_drawInContext:(CGContext *)a3 rect:(CGRect)a4 layout:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a5;
  [(UIImage *)self scale];
  -[UIImage _drawInContext:rect:layout:scale:applyContentsTransform:](self, "_drawInContext:rect:layout:scale:applyContentsTransform:", a3, v12, 0, x, y, width, height, v11);
}

- (void)drawAsPatternInRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  id v7 = +[UIColor colorWithPatternImage:self];
  if (v7)
  {
    id v10 = v7;
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      double v9 = 0;
    }
    else {
      double v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSetFillColorWithColor(v9, (CGColorRef)[v10 CGColor]);
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGContextFillRect(v9, v12);
    id v7 = v10;
  }
}

- (id)_imageWithImageAsset:(id)a3
{
  id v5 = a3;
  if (dyld_program_sdk_at_least())
  {
    CGRect v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIImage.m" lineNumber:3258 description:@"This code path should not be taken when linked against iOS 14 or newer."];
  }
  id v6 = [(UIImage *)self imageAsset];
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {

    goto LABEL_9;
  }
  if (v7 && v6)
  {
    char v9 = [v6 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    id v10 = self;
    goto LABEL_12;
  }

LABEL_11:
  id v10 = (UIImage *)[objc_alloc((Class)objc_opt_class()) _initWithOtherImage:self];
  [(UIImage *)v10 _setImageAsset:v8];
LABEL_12:

  return v10;
}

+ (void)_dropResourceReferencesForURL:(id)a3
{
}

+ (BOOL)_isCGImageAlphaMask:(CGImage *)a3
{
  BOOL IsMask = CGImageIsMask(a3);
  if (IsMask) {
    CGImageGetAlphaInfo(a3);
  }
  return IsMask;
}

- (BOOL)_isAlphaMask
{
  double v2 = [(_UIImageContent *)self->_content CGImage];
  return +[UIImage _isCGImageAlphaMask:v2];
}

+ (id)symbolImageNamed:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__UIImage_symbolImageNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  uint64_t v4 = symbolImageNamed__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&symbolImageNamed__once, block);
  }
  id v6 = [a1 systemImageNamed:v5];

  return v6;
}

void __28__UIImage_symbolImageNamed___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_2___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  uint64_t v10 = symbolImageNamed_size_weight_compatibleWithFontSize__once;
  id v11 = a3;
  if (v10 != -1) {
    dispatch_once(&symbolImageNamed_size_weight_compatibleWithFontSize__once, block);
  }
  CGRect v12 = +[UIImageSymbolConfiguration configurationWithPointSize:a5 weight:a4 scale:a6];
  double v13 = [a1 systemImageNamed:v11 withConfiguration:v12];

  return v13;
}

void __63__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_3___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 weight:(int64_t)a5 compatibleWithFontSize:(double)a6 traitCollection:(id)a7 inBundle:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  if (symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle__once != -1) {
    dispatch_once(&symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle__once, block);
  }
  double v18 = +[UIImageSymbolConfiguration configurationWithPointSize:a5 weight:a4 scale:a6];
  if (v17) {
    [a1 imageNamed:v15 inBundle:v17 compatibleWithTraitCollection:v16];
  }
  else {
  double v19 = [a1 systemImageNamed:v15 compatibleWithTraitCollection:v16];
  }
  double v20 = [v19 imageWithConfiguration:v18];

  return v20;
}

void __88__UIImage_symbolImageNamed_size_weight_compatibleWithFontSize_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_4___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)preferredSymbolImageNamed:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__UIImage_preferredSymbolImageNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  uint64_t v4 = preferredSymbolImageNamed__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&preferredSymbolImageNamed__once, block);
  }
  int v6 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody"];
  id v7 = [a1 systemImageNamed:v5 withConfiguration:v6];

  return v7;
}

void __37__UIImage_preferredSymbolImageNamed___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_5___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  uint64_t v8 = preferredSymbolImageNamed_size_compatibleWithTextStyle__once;
  id v9 = a5;
  id v10 = a3;
  if (v8 != -1) {
    dispatch_once(&preferredSymbolImageNamed_size_compatibleWithTextStyle__once, block);
  }
  id v11 = +[UIImageSymbolConfiguration configurationWithTextStyle:v9 scale:a4];

  CGRect v12 = [a1 systemImageNamed:v10 withConfiguration:v11];

  return v12;
}

void __66__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_6___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)preferredSymbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithTextStyle:(id)a5 traitCollection:(id)a6 inBundle:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  if (preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle__once != -1) {
    dispatch_once(&preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle__once, block);
  }
  id v17 = +[UIImageSymbolConfiguration configurationWithTextStyle:v14 scale:a4];
  if (v16) {
    [a1 imageNamed:v13 inBundle:v16 compatibleWithTraitCollection:v15];
  }
  else {
  double v18 = [a1 systemImageNamed:v13 compatibleWithTraitCollection:v15];
  }
  double v19 = [v18 imageWithConfiguration:v17];

  return v19;
}

void __91__UIImage_preferredSymbolImageNamed_size_compatibleWithTextStyle_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_7___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIImage_symbolImageNamed_size_compatibleWithFont___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  uint64_t v8 = symbolImageNamed_size_compatibleWithFont__once;
  id v9 = a5;
  id v10 = a3;
  if (v8 != -1) {
    dispatch_once(&symbolImageNamed_size_compatibleWithFont__once, block);
  }
  id v11 = +[UIImageSymbolConfiguration configurationWithFont:v9 scale:a4];

  CGRect v12 = [a1 systemImageNamed:v10 withConfiguration:v11];

  return v12;
}

void __52__UIImage_symbolImageNamed_size_compatibleWithFont___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_8___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)symbolImageNamed:(id)a3 size:(int64_t)a4 compatibleWithFont:(id)a5 traitCollection:(id)a6 inBundle:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__UIImage_symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a2;
  if (symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle__once != -1) {
    dispatch_once(&symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle__once, block);
  }
  id v17 = +[UIImageSymbolConfiguration configurationWithFont:v14 scale:a4];
  if (v16) {
    [a1 imageNamed:v13 inBundle:v16 compatibleWithTraitCollection:v15];
  }
  else {
  double v18 = [a1 systemImageNamed:v13 compatibleWithTraitCollection:v15];
  }
  double v19 = [v18 imageWithConfiguration:v17];

  return v19;
}

void __77__UIImage_symbolImageNamed_size_compatibleWithFont_traitCollection_inBundle___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &NSTextEffectBoldTintStyle_block_invoke_9___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    double v3 = *(const char **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = NSStringFromSelector(v3);
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "+%@ is deprecated. Please switch to +imageNamed: or +systemImageNamed:.", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_initWithData:(id)a3 preserveScale:(BOOL)a4
{
  return [(UIImage *)self _initWithData:a3 preserveScale:a4 cache:0];
}

- (id)_initWithData:(id)a3 scale:(double)a4
{
  return [(UIImage *)self _initWithData:a3 preserveScale:0 cache:0 scale:a4];
}

- (UIImage)initWithCGImage:(CGImage *)a3 imageOrientation:(int64_t)a4
{
  return [(UIImage *)self initWithCGImage:a3 scale:a4 orientation:1.0];
}

- (id)_initWithIOSurface:(__IOSurface *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  int v6 = (_UIImageIOSurfaceContent *)a3;
  if (a3) {
    int v6 = [[_UIImageIOSurfaceContent alloc] initWithIOSurface:a3 scale:a4];
  }
  id v8 = -[UIImage _initWithContent:orientation:](self, "_initWithContent:orientation:", v6, a5, a4);

  return v8;
}

- (id)_initWithIOSurface:(__IOSurface *)a3 imageOrientation:(int64_t)a4
{
  double Scale = _UIRenderingBufferGetScale(a3);
  if (Scale == 0.0) {
    double Scale = 1.0;
  }
  return [(UIImage *)self _initWithIOSurface:a3 scale:a4 orientation:Scale];
}

- (UIImage)initWithIOSurface:(__IOSurface *)a3
{
  return (UIImage *)[(UIImage *)self _initWithIOSurface:a3 imageOrientation:0];
}

- (__IOSurface)ioSurface
{
  return [(_UIImageContent *)self->_content IOSurface];
}

- (__IOSurface)_copyIOSurface
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if ([(_UIImageContent *)self->_content isIOSurface]) {
    return 0;
  }
  uint64_t v4 = self;
  id v5 = [(UIImage *)v4 CGImage];
  [(UIImage *)v4 scale];
  double v7 = v6;
  [(UIImage *)v4 size];
  double v9 = v7 * v8;
  [(UIImage *)v4 size];
  double v11 = v7 * v10;
  v21[0] = @"dst-scale";
  CGRect v12 = [NSNumber numberWithDouble:v7];
  v22[0] = v12;
  v22[1] = &unk_1ED3F4410;
  v21[1] = @"dst-gamut";
  v21[2] = @"dst-opaque";
  id v13 = [NSNumber numberWithInt:CGImageHasAlpha() ^ 1];
  v22[2] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  double v3 = _UIRenderingBufferCreate(v14, v9, v11);

  if (v3)
  {
    IOSurfaceLock(v3, 0, 0);
    CGImageGetColorSpace(v5);
    id v15 = (CGContext *)CGIOSurfaceContextCreate();
    if (v15)
    {
      id v16 = v15;
      CGContextScaleCTM(v15, v7, v7);
      [(UIImage *)v4 size];
      CGFloat v18 = v17;
      [(UIImage *)v4 size];
      v23.size.CGFloat height = v19;
      v23.origin.CGFloat x = 0.0;
      v23.origin.CGFloat y = 0.0;
      v23.size.CGFloat width = v18;
      CGContextDrawImage(v16, v23, v5);
      CGContextRelease(v16);
    }
    IOSurfaceUnlock(v3, 0, 0);
  }
  return v3;
}

+ (id)_backgroundGradientWithStartColor:(id)a3 andEndColor:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  _UIGraphicsBeginImageContextWithOptions(1, 0, 16.0, 1024.0, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v8 = 0;
  }
  else {
    double v8 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  [v6 getRed:&components green:&v15 blue:&v16 alpha:&v17];

  [v5 getRed:&v18 green:&v19 blue:&v20 alpha:v21];
  double v9 = +[UIColor clearColor];
  [v9 set];

  UIRectFillUsingOperation(1, 0.0, 0.0, 16.0, 1024.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v11 = CGGradientCreateWithColorComponents(DeviceRGB, &components, 0, 2uLL);
  v23.CGFloat x = 0.0;
  v23.CGFloat y = 0.0;
  v24.CGFloat x = 0.0;
  v24.CGFloat y = 1024.0;
  CGContextDrawLinearGradient(v8, v11, v23, v24, 0);
  CGGradientRelease(v11);
  CGColorSpaceRelease(DeviceRGB);
  CGRect v12 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  return v12;
}

+ (id)_defaultBackgroundGradient
{
  double v3 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
  if (!_defaultBackgroundGradient___defaultBackgroundGradient)
  {
    uint64_t v4 = +[UIDevice currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v6 = +[UIColor colorWithRed:0.88627451 green:0.898039216 blue:0.917647059 alpha:1.0];
      double v7 = 0.815686275;
      double v8 = 0.823529412;
      double v9 = 0.847058824;
    }
    else
    {
      id v6 = +[UIColor colorWithRed:0.843137255 green:0.862745098 blue:0.898039216 alpha:1.0];
      double v7 = 0.784313725;
      double v8 = 0.803921569;
      double v9 = 0.839215686;
    }
    double v10 = +[UIColor colorWithRed:v7 green:v8 blue:v9 alpha:1.0];
    uint64_t v11 = [a1 _backgroundGradientWithStartColor:v6 andEndColor:v10];
    CGRect v12 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
    _defaultBackgroundGradient___defaultBackgroundGradient = v11;

    double v3 = (void *)_defaultBackgroundGradient___defaultBackgroundGradient;
  }
  return v3;
}

+ (id)imageFromAlbumArtData:(id)a3 height:(int)a4 width:(int)a5 bytesPerRow:(int)a6 cache:(BOOL)a7
{
  CFDataRef v10 = (const __CFData *)a3;
  CFDataRef v11 = v10;
  if (a4 < 1)
  {
    CGRect v12 = 0;
  }
  else
  {
    CGRect v12 = 0;
    if (v10 && a5 >= 1)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      id v14 = CGDataProviderCreateWithCFData(v11);
      uint64_t v15 = CGImageCreate(a5, a4, 5uLL, 0x10uLL, a6, DeviceRGB, 0x1006u, v14, 0, 0, kCGRenderingIntentDefault);
      CGDataProviderRelease(v14);
      uint64_t v16 = [UIImage alloc];
      uint64_t v17 = +[UIScreen mainScreen];
      [v17 scale];
      CGRect v12 = -[UIImage initWithCGImage:scale:orientation:](v16, "initWithCGImage:scale:orientation:", v15, 0);

      CGImageRelease(v15);
      CGColorSpaceRelease(DeviceRGB);
    }
  }

  return v12;
}

- (id)_stretchableImageWithCapInsets:(UIEdgeInsets)a3
{
  double v3 = -[UIImage resizableImageWithCapInsets:](self, "resizableImageWithCapInsets:", a3.top, a3.left, a3.bottom, a3.right);
  [v3 _setAlwaysStretches:1];
  return v3;
}

- (id)_resizableImageWithSubimageInsets:(UIEdgeInsets)a3 resizeInsets:(UIEdgeInsets)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = -[_UIResizableImage initWithImage:capInsets:]([_UIResizableImage alloc], "initWithImage:capInsets:", self, a4.top, a4.left, a4.bottom, a4.right);
  -[_UIResizableImage _setSubimageInsets:](v8, "_setSubimageInsets:", top, left, bottom, right);
  return v8;
}

+ (id)_deviceSpecificImageNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _UIImageDeviceSpecificName();
  if (!v5
    || ([v4 stringByAppendingString:v5],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [a1 imageNamed:v6],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    double v7 = [a1 imageNamed:v4];
  }

  return v7;
}

+ (id)_deviceSpecificImageNamed:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = _UIImageDeviceSpecificName();
  if (!v8
    || ([v6 stringByAppendingString:v8],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [a1 imageNamed:v9 inBundle:v7],
        CFDataRef v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    CFDataRef v10 = [a1 imageNamed:v6 inBundle:v7];
  }

  return v10;
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateStatistics
{
  return [(UIImage *)self _calculateStatisticsOfEdge:0];
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateEdgeStatistics
{
  return [(UIImage *)self _calculateStatisticsOfEdge:1];
}

- ($8452678F12DBC466148836A9D382CAFC)_calculateStatisticsOfEdge:(SEL)a3
{
  v95[1] = *MEMORY[0x1E4F143B8];
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  [(UIImage *)self size];
  size_t v8 = (unint64_t)v7;
  size_t v10 = (unint64_t)v9;
  size_t v11 = 4 * (unint64_t)v7;
  CGRect v12 = [(UIImage *)self ioSurface];
  id v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  IOSurfaceLock(v12, 1u, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v13);
  OSType PixelFormat = IOSurfaceGetPixelFormat(v13);
  OSType v15 = PixelFormat;
  if (PixelFormat != 1999843442)
  {
    uint64_t v87 = 0;
    if (PixelFormat != 1647534392) {
      goto LABEL_22;
    }
  }
  uint64_t v94 = *MEMORY[0x1E4F2F400];
  v95[0] = &unk_1ED3F4428;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1, BaseAddress);
  uint64_t v87 = CGImageCreateFromIOSurface();
  IOSurfaceUnlock(v13, 1u, 0);

  if (v15 != 1999843442 && v15 != 1647534392)
  {
LABEL_22:
    if (a4)
    {
      uint64_t v19 = (unsigned __int8 *)BaseAddress;
      if (v10)
      {
        uint64_t v41 = 0;
        unint64_t v23 = 0;
        unint64_t v24 = 0;
        unint64_t v25 = 0;
        unint64_t v26 = 0;
        unint64_t v27 = 0;
        unint64_t v28 = 0;
        unint64_t v29 = 0;
        unint64_t v30 = 0;
        double v42 = (unsigned __int8 *)(BaseAddress + 3);
        do
        {
          if (v41 == v10 - 1 || v41 == 0) {
            uint64_t v44 = 1;
          }
          else {
            uint64_t v44 = v8 - 1;
          }
          if (v8)
          {
            size_t v45 = 0;
            double v46 = v42;
            do
            {
              uint64_t v47 = *(v46 - 1);
              v30 += v47;
              uint64_t v48 = *(v46 - 2);
              v29 += v48;
              uint64_t v49 = *(v46 - 3);
              v28 += v49;
              v27 += *v46;
              v26 += (v47 * v47);
              v25 += (v48 * v48);
              v24 += (v49 * v49);
              ++v23;
              v45 += v44;
              v46 += 4 * v44;
            }
            while (v45 < v8);
          }
          ++v41;
          v42 += v11;
        }
        while (v41 != v10);
        LODWORD(v40) = 0;
      }
      else
      {
        LODWORD(v40) = 0;
        unint64_t v30 = 0;
        unint64_t v29 = 0;
        unint64_t v28 = 0;
        unint64_t v27 = 0;
        unint64_t v26 = 0;
        unint64_t v25 = 0;
        unint64_t v24 = 0;
        unint64_t v23 = 0;
      }
      LODWORD(v39) = 1;
    }
    else
    {
      uint64_t v39 = 0;
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = 0;
      unint64_t v26 = 0;
      unint64_t v27 = 0;
      unint64_t v28 = 0;
      unint64_t v29 = 0;
      unint64_t v30 = 0;
      LOBYTE(v40) = 1;
      do
      {
        char v59 = v40;
        size_t v60 = qword_186B97890[v39];
        if (v60 < v10)
        {
          uint64_t v61 = (uint64_t)&BaseAddress[(v11 + 4) * v60 + 1];
          size_t v62 = qword_186B97890[v39];
          do
          {
            uint64_t v63 = (unsigned __int8 *)v61;
            for (size_t i = v60; i < v8; v63 += 4 * v60)
            {
              uint64_t v65 = v63[1];
              v30 += v65;
              uint64_t v66 = *v63;
              v29 += v66;
              uint64_t v67 = *(v63 - 1);
              v28 += v67;
              v27 += v63[2];
              v26 += (v65 * v65);
              v25 += (v66 * v66);
              v24 += (v67 * v67);
              ++v23;
              i += v60;
            }
            v62 += v60;
            v61 += v11 * v60;
          }
          while (v62 < v10);
        }
        LODWORD(v40) = 0;
        uint64_t v39 = 1;
      }
      while ((v59 & 1) != 0);
      uint64_t v19 = (unsigned __int8 *)BaseAddress;
    }
    goto LABEL_55;
  }
  uint64_t v17 = ($8452678F12DBC466148836A9D382CAFC *)v87;
  if (!v87)
  {
LABEL_7:
    UIEdgeInsets result = ($8452678F12DBC466148836A9D382CAFC *)CGImageRetain([(UIImage *)self CGImage]);
    uint64_t v17 = result;
    if (!result) {
      return result;
    }
  }
  uint64_t v19 = (unsigned __int8 *)malloc_type_malloc(v11 * v10, 0x44CC45B5uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v21 = CGBitmapContextCreate(v19, v8, v10, 8uLL, v11, DeviceRGB, 0x4001u);
  v96.size.CGFloat width = (double)v8;
  v96.size.CGFloat height = (double)v10;
  v96.origin.CGFloat x = 0.0;
  v96.origin.CGFloat y = 0.0;
  CGContextDrawImage(v21, v96, (CGImageRef)v17);
  CGContextRelease(v21);
  CGColorSpaceRelease(DeviceRGB);
  if (a4)
  {
    if (v10)
    {
      uint64_t v22 = 0;
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = 0;
      unint64_t v26 = 0;
      unint64_t v27 = 0;
      unint64_t v28 = 0;
      unint64_t v29 = 0;
      unint64_t v30 = 0;
      double v31 = v19 + 3;
      do
      {
        if (v22 == v10 - 1 || v22 == 0) {
          uint64_t v33 = 1;
        }
        else {
          uint64_t v33 = v8 - 1;
        }
        if (v8)
        {
          size_t v34 = 0;
          CGFloat v35 = v31;
          do
          {
            uint64_t v36 = *(v35 - 3);
            v30 += v36;
            uint64_t v37 = *(v35 - 2);
            v29 += v37;
            uint64_t v38 = *(v35 - 1);
            v28 += v38;
            v27 += *v35;
            v26 += (v36 * v36);
            v25 += (v37 * v37);
            v24 += (v38 * v38);
            ++v23;
            v34 += v33;
            v35 += 4 * v33;
          }
          while (v34 < v8);
        }
        ++v22;
        v31 += v11;
      }
      while (v22 != v10);
      LODWORD(v39) = 0;
      LODWORD(v40) = 1;
    }
    else
    {
      LODWORD(v39) = 0;
      unint64_t v30 = 0;
      unint64_t v29 = 0;
      unint64_t v28 = 0;
      unint64_t v27 = 0;
      unint64_t v26 = 0;
      unint64_t v25 = 0;
      unint64_t v24 = 0;
      unint64_t v23 = 0;
      LODWORD(v40) = 1;
    }
    goto LABEL_56;
  }
  uint64_t v87 = (uint64_t)v17;
  uint64_t v40 = 0;
  unint64_t v23 = 0;
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  unint64_t v26 = 0;
  unint64_t v27 = 0;
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  unint64_t v30 = 0;
  LOBYTE(v39) = 1;
  do
  {
    char v50 = v39;
    size_t v51 = qword_186B97890[v40];
    if (v51 < v10)
    {
      uint64_t v52 = (uint64_t)&v19[(v11 + 4) * v51 + 1];
      size_t v53 = qword_186B97890[v40];
      do
      {
        double v54 = (unsigned __int8 *)v52;
        for (size_t j = v51; j < v8; v54 += 4 * v51)
        {
          uint64_t v56 = *(v54 - 1);
          v30 += v56;
          uint64_t v57 = *v54;
          v29 += v57;
          uint64_t v58 = v54[1];
          v28 += v58;
          v27 += v54[2];
          v26 += (v56 * v56);
          v25 += (v57 * v57);
          v24 += (v58 * v58);
          ++v23;
          j += v51;
        }
        v53 += v51;
        v52 += v11 * v51;
      }
      while (v53 < v10);
    }
    LODWORD(v39) = 0;
    uint64_t v40 = 1;
  }
  while ((v50 & 1) != 0);
LABEL_55:
  uint64_t v17 = ($8452678F12DBC466148836A9D382CAFC *)v87;
LABEL_56:
  double v68 = 1.0 / (double)v23;
  unint64_t v69 = (unint64_t)(v68 * (double)v30);
  unint64_t v70 = (unint64_t)(v68 * (double)v29);
  double v71 = v68 * (double)v28;
  double v72 = v68 * (double)v27;
  float v73 = fmax(v68 * (double)v26 - (double)(v69 * v69), 0.0);
  double v74 = sqrtf(v73);
  float v75 = fmax(v68 * (double)v25 - (double)(v70 * v70), 0.0);
  double v76 = sqrtf(v75);
  *(float *)&double v68 = fmax(v68 * (double)v24 - (double)((unint64_t)v71 * (unint64_t)v71), 0.0);
  double v77 = sqrtf(*(float *)&v68);
  double v92 = 0.0;
  double v93 = 0.0;
  uint64_t v90 = 0;
  double v91 = 0.0;
  double v88 = 0.0;
  double v89 = 0.0;
  double v78 = (double)v69 * 0.00392156863;
  double v79 = (double)v70 * 0.00392156863;
  double v80 = (double)(unint64_t)v71 * 0.00392156863;
  __RGBtoHSV(&v93, &v92, &v91, v78, v79, v80);
  UIEdgeInsets result = ($8452678F12DBC466148836A9D382CAFC *)__RGBtoHSV((double *)&v90, &v89, &v88, v74 * 0.00392156863, v76 * 0.00392156863, v77 * 0.00392156863);
  if (v13 && v39) {
    UIEdgeInsets result = ($8452678F12DBC466148836A9D382CAFC *)IOSurfaceUnlock(v13, 1u, 0);
  }
  if (v17) {
    int v81 = v40;
  }
  else {
    int v81 = 0;
  }
  if (v81 == 1)
  {
    free(v19);
    CGImageRelease((CGImageRef)v17);
  }
  retstr->var0 = v78;
  retstr->vaCGFloat r1 = v79;
  double v82 = v93;
  retstr->var2 = v80;
  retstr->var3 = v82;
  double v83 = v91;
  retstr->var4 = v92;
  retstr->var5 = v83;
  double v84 = v88;
  double v85 = v89;
  retstr->var6 = (double)(unint64_t)v72 * 0.00392156863;
  retstr->var7 = v84;
  retstr->var8 = v85;
  return result;
}

- (id)_imagePaddedByInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(UIImage *)self _isResizable])
  {
    NSLog(&cfstr_Imagepaddedbyi.isa);
    size_t v8 = 0;
  }
  else
  {
    [(UIImage *)self _contentInsets];
    size_t v8 = -[UIImage _imageWithContentInsets:withUpdatedCGImage:](self, "_imageWithContentInsets:withUpdatedCGImage:", 1, top + v9, left + v10, bottom + v11, right + v12);
  }
  return v8;
}

- (id)_imageWithSize:(CGSize)a3
{
  id v4 = 0;
  if (a3.width >= 0.0)
  {
    double height = a3.height;
    if (a3.height >= 0.0)
    {
      double width = a3.width;
      [(UIImage *)self size];
      if (width == v8 && height == v7)
      {
        id v4 = self;
      }
      else
      {
        -[UIImage _imageWithSize:content:](self, "_imageWithSize:content:", self->_content, width, height);
        id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

- (id)_imageWithSize:(CGSize)a3 content:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(UIImage *)self size];
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = v8 <= 0.0;
  double v13 = 1.0;
  if (v12) {
    double v14 = 1.0;
  }
  else {
    double v14 = v9;
  }
  double v15 = width / v14;
  if (v11 > 0.0) {
    double v13 = v11;
  }
  double v16 = height / v13;
  uint64_t v17 = [(UIImage *)self _imageWithContent:v7];
  [v7 scale];
  double v19 = v18;

  v17[9] = width * v19;
  v17[10] = height * v19;
  double v20 = v15 * 0.5;
  double v21 = v16 * 0.5;
  objc_msgSend(v17, "_setContentInsets:", v16 * 0.5 * self->_contentInsets.top, v15 * 0.5 * self->_contentInsets.left, v16 * 0.5 * self->_contentInsets.bottom, v15 * 0.5 * self->_contentInsets.right);
  if ([(UIImage *)self _isResizable])
  {
    [(UIImage *)self capInsets];
    objc_msgSend(v17, "_setCapInsets:", v21 * v24, v20 * v22, v21 * v25, v20 * v23);
  }
  if ([(UIImage *)self _isSubimage])
  {
    [(UIImage *)self _subimageInsets];
    objc_msgSend(v17, "_setSubimageInsets:", v21 * v28, v20 * v26, v21 * v29, v20 * v27);
  }
  if ([(UIImage *)self hasBaseline] && v11 != 0.0)
  {
    [(UIImage *)self baselineOffsetFromBottom];
    [v17 _setBaselineOffsetFromBottom:v16 * v30];
  }
  if ([(UIImage *)self hasMidline] && v9 != 0.0)
  {
    [(UIImage *)self midlineOffsetFromCenter];
    [v17 _setMidlineOffsetFromCenter:v15 * v31];
  }
  return v17;
}

+ (id)_noiseImage
{
  return +[UIImage kitImageNamed:@"UIBackgroundNoise"];
}

- (UIImage)imageByPreparingThumbnailOfSize:(CGSize)size
{
  double v3 = 0;
  if (size.width >= 0.0 && size.height >= 0.0)
  {
    +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", [(UIImage *)self imageOrientation], size.width, size.height);
    uint64_t v5 = -[_UIImageContent contentOptimizedForImageSize:](self->_content, "contentOptimizedForImageSize:");
    if (v5)
    {
      id v6 = (void *)v5;
      UIImageOrientation v7 = [(UIImage *)self imageOrientation];
      [v6 size];
      +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", v7);
      double v3 = -[UIImage _imageWithSize:content:](self, "_imageWithSize:content:", v6);
    }
    else
    {
      double v3 = 0;
    }
  }
  return (UIImage *)v3;
}

- (void)prepareThumbnailOfSize:(CGSize)size completionHandler:(void *)completionHandler
{
  double height = size.height;
  double width = size.width;
  UIImageOrientation v7 = completionHandler;
  double v8 = v7;
  if (width < 0.0 || height < 0.0)
  {
    (*((void (**)(void *, void))v7 + 2))(v7, 0);
  }
  else
  {
    +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", [(UIImage *)self imageOrientation], width, height);
    double v10 = v9;
    double v12 = v11;
    content = self->_content;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__UIImage_prepareThumbnailOfSize_completionHandler___block_invoke;
    v14[3] = &unk_1E52F1808;
    v14[4] = self;
    id v15 = v8;
    -[_UIImageContent optimizeContentForImageSize:completionHandler:](content, "optimizeContentForImageSize:completionHandler:", v14, v10, v12);
  }
}

void __52__UIImage_prepareThumbnailOfSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [*(id *)(a1 + 32) imageOrientation];
    [v6 size];
    +[UIImage _applyOrientation:toContentSizeInPixels:](UIImage, "_applyOrientation:toContentSizeInPixels:", v3);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_imageWithSize:content:", v6);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_prepareForScreen:(id)a3 completionHandler:(id)a4
{
}

- (id)_imageWithBitmapRepresentation
{
  uint64_t v3 = +[UIScreen mainScreen];
  uint64_t v4 = [(UIImage *)self _imagePreparedForScreen:v3];

  return v4;
}

- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6
{
  return -[UIImage _initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:](self, "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", a3, a6, 1, a4.width, a4.height, a5);
}

- (id)_initWithData:(id)a3 immediateLoadWithMaxSize:(CGSize)a4 scale:(double)a5 renderingIntent:(unint64_t)a6 cache:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  double v14 = v13;
  if (v13 && [v13 length])
  {
    id v15 = -[_UIImageAsyncCGImageContent initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:]([_UIImageAsyncCGImageContent alloc], "initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v14, a6, v7, width, height, a5);
    double v16 = [(UIImage *)self _initWithContent:v15 orientation:0];
    if (v16) {
      v16[26] |= 2u;
    }
    self = v16;

    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (UIImage)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
{
  [(UIImage *)self size];
  double v8 = (double)leftCapWidth;
  double v10 = v9 - (double)topCapHeight + -1.0;
  if (topCapHeight) {
    double v11 = v10;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = v7 - v8 + -1.0;
  if (leftCapWidth) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  return (UIImage *)-[UIImage _stretchableImageWithCapInsets:](self, "_stretchableImageWithCapInsets:", (double)topCapHeight, (double)leftCapWidth, v11, v13, (double)topCapHeight, v8);
}

- (NSInteger)leftCapWidth
{
  [(UIImage *)self capInsets];
  return (uint64_t)v2;
}

- (NSInteger)topCapHeight
{
  [(UIImage *)self capInsets];
  return (uint64_t)v2;
}

+ (id)imageAtPath:(id)a3
{
  return _UIImageAtPath(a3, 0, 0, 0);
}

- (UIImage)initWithData:(id)a3 cache:(BOOL)a4
{
  return (UIImage *)[(UIImage *)self _initWithData:a3 preserveScale:0 cache:a4];
}

- (CGImage)imageRef
{
  return [(_UIImageContent *)self->_content CGImage];
}

- (void)compositeToRect:(CGRect)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v6 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  double v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    CGFloat v40 = v11;
    CGFloat v41 = v10;
    [(UIImage *)self scale];
    double v16 = v15;
    uint64_t v17 = [(_UIImageContent *)self->_content CGImage];
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    IsEmptdouble y = CGRectIsEmpty(v44);
    BOOL v19 = v16 != 0.0 && v16 != 1.0;
    if (IsEmpty)
    {
      size_t v20 = CGImageGetWidth(v17);
      double v21 = (double)v20;
      size_t v22 = CGImageGetHeight(v17);
      double v23 = (double)v22;
      double v24 = 0.0;
      if (v19)
      {
        double v25 = 1.0;
        double v24 = 1.0 / v16 * 0.0;
        if (v20 <= 1) {
          double v26 = 1.0;
        }
        else {
          double v26 = 1.0 / v16;
        }
        double v21 = v26 * v21;
        if (v22 > 1) {
          double v25 = 1.0 / v16;
        }
        double v23 = v25 * v23;
      }
      UIImageOrientation v27 = [(UIImage *)self imageOrientation];
      compositeCGImageRefInRect(v17, v13, v12, v11, v41, v24, v24, v21, v23, v6, v27, a6);
    }
    else
    {
      if (v19)
      {
        double v28 = x;
        double v29 = x * v16;
        double v30 = y * v16;
        if (width <= 1.0) {
          double v31 = 1.0;
        }
        else {
          double v31 = v16;
        }
        double v32 = width * v31;
        CGFloat v33 = height;
        double v34 = v12;
        CGFloat v35 = v13;
        double v36 = a6;
        if (height <= 1.0) {
          double v37 = height;
        }
        else {
          double v37 = height * v16;
        }
        CGFloat v38 = v28;
      }
      else
      {
        double v37 = height;
        double v32 = width;
        double v30 = y;
        double v29 = x;
        CGFloat v38 = x;
        CGFloat v33 = height;
        double v34 = v12;
        CGFloat v35 = v13;
        double v36 = a6;
      }
      uint64_t v39 = CGImageCreateWithImageInRect(v17, *(CGRect *)&v29);
      compositeCGImageRefInRect(v39, v35, v34, v40, v41, v38, y, width, v33, v6, [(UIImage *)self imageOrientation], v36);
      CGImageRelease(v39);
    }
  }
}

- (void)compositeToPoint:(CGPoint)a3 fromRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = a3.y;
  double v13 = a3.x;
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    [(UIImage *)self scale];
    double v16 = v15;
    uint64_t v17 = [(_UIImageContent *)self->_content CGImage];
    if (v16 == 1.0 || v16 == 0.0)
    {
      double v22 = height;
      double v21 = width;
      double v19 = y;
      double v18 = x;
    }
    else
    {
      double v18 = x * v16;
      double v19 = y * v16;
      if (width <= 1.0) {
        double v20 = 1.0;
      }
      else {
        double v20 = v16;
      }
      double v21 = width * v20;
      if (height <= 1.0) {
        double v22 = height;
      }
      else {
        double v22 = height * v16;
      }
    }
    double v23 = CGImageCreateWithImageInRect(v17, *(CGRect *)&v18);
    compositeCGImageRef(v23, v13, v12, x, y, width, height, a6, v7, [(UIImage *)self imageOrientation]);
    CGImageRelease(v23);
  }
}

- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4 fraction:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  double y = a3.y;
  double x = a3.x;
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    CGFloat v10 = [(_UIImageContent *)self->_content CGImage];
    size_t Width = CGImageGetWidth(v10);
    double v12 = (double)Width;
    size_t Height = CGImageGetHeight(v10);
    double v14 = (double)Height;
    [(UIImage *)self scale];
    double v16 = 0.0;
    if (v15 != 1.0 && v15 != 0.0)
    {
      double v17 = 1.0 / v15;
      double v16 = v17 * 0.0;
      if (Width <= 1) {
        double v18 = 1.0;
      }
      else {
        double v18 = v17;
      }
      double v12 = v18 * v12;
      if (Height <= 1) {
        double v17 = 1.0;
      }
      double v14 = v17 * v14;
    }
    UIImageOrientation v19 = [(UIImage *)self imageOrientation];
    compositeCGImageRef(v10, x, y, v16, v16, v12, v14, a5, v6, v19);
  }
}

- (void)compositeToPoint:(CGPoint)a3 operation:(int)a4
{
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memcpy(v9, a3, sizeof(v9));
  -[UIImage draw9PartImageWithSliceRects:inRect:fraction:](self, "draw9PartImageWithSliceRects:inRect:fraction:", v9, x, y, width, height, 1.0);
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memcpy(v11, a3, sizeof(v11));
  -[UIImage draw9PartImageWithSliceRects:inRect:operation:fraction:](self, "draw9PartImageWithSliceRects:inRect:operation:fraction:", v11, 2, x, y, width, height, a5);
}

- (void)draw9PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    CGPoint origin = a3->var0.var0.origin;
    v32.CGFloat width = a3->var0.var0.size.width;
    CGFloat v14 = a3->var0.var0.size.height;
    CGSize size = a3->var1.var1.size;
    CGPoint v45 = a3->var1.var1.origin;
    CGSize v46 = size;
    CGSize v16 = a3->var1.var2.size;
    CGPoint v47 = a3->var1.var2.origin;
    CGSize v48 = v16;
    CGSize v17 = a3->var0.var2.size;
    CGPoint v41 = a3->var0.var2.origin;
    CGSize v42 = v17;
    CGSize v18 = a3->var1.var0.size;
    CGPoint v43 = a3->var1.var0.origin;
    CGSize v44 = v18;
    CGSize v19 = a3->var0.var1.size;
    CGPoint v39 = a3->var0.var1.origin;
    CGSize v40 = v19;
    CGPoint v24 = a3->var2.var0.origin;
    CGFloat v25 = a3->var2.var0.size.width;
    CGFloat v20 = a3->var2.var0.size.height;
    CGSize v21 = a3->var2.var1.size;
    CGPoint v27 = a3->var2.var1.origin;
    CGSize v28 = v21;
    CGSize v22 = a3->var2.var2.size;
    CGPoint v29 = a3->var2.var2.origin;
    CGSize v30 = v22;
    remainder.origin.CGFloat x = x;
    remainder.origin.CGFloat y = y;
    remainder.size.CGFloat width = width;
    remainder.size.CGFloat height = height;
    memset(&slice, 0, sizeof(slice));
    double v23 = self;
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRectDivide(v50, &slice, &remainder, v14, CGRectMinYEdge);
    v32.CGFloat height = v14;
    CGPoint v33 = v39;
    CGSize v34 = v40;
    CGPoint v35 = v41;
    CGSize v36 = v42;
    draw9PartSlice(v23, &origin.x, v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, a6);
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMaxYEdge);
    CGPoint v33 = v45;
    CGSize v34 = v46;
    CGPoint v35 = v47;
    CGSize v36 = v48;
    CGPoint origin = v43;
    CGSize v32 = v44;
    draw9PartSlice(v23, &origin.x, v7, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, a6);
    CGFloat v26 = v20;
    draw9PartSlice(v23, &v24.x, v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, a6);
  }
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4
{
  CGSize size = a3->var1.size;
  v7[2] = a3->var1.origin;
  v7[3] = size;
  CGSize v5 = a3->var2.size;
  v7[4] = a3->var2.origin;
  void v7[5] = v5;
  CGSize v6 = a3->var0.size;
  v7[0] = a3->var0.origin;
  v7[1] = v6;
  -[UIImage draw3PartImageWithSliceRects:inRect:fraction:](self, "draw3PartImageWithSliceRects:inRect:fraction:", v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 1.0);
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 fraction:(double)a5
{
  CGSize size = a3->var1.size;
  v8[2] = a3->var1.origin;
  v8[3] = size;
  CGSize v6 = a3->var2.size;
  v8[4] = a3->var2.origin;
  v8[5] = v6;
  CGSize v7 = a3->var0.size;
  v8[0] = a3->var0.origin;
  v8[1] = v7;
  -[UIImage draw3PartImageWithSliceRects:inRect:operation:fraction:](self, "draw3PartImageWithSliceRects:inRect:operation:fraction:", v8, 2, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)draw3PartImageWithSliceRects:(id *)a3 inRect:(CGRect)a4 operation:(int)a5 fraction:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    double v26 = width;
    double v27 = height;
    double v14 = a3->var0.origin.x;
    double v15 = a3->var0.size.width;
    double v31 = a3->var0.size.height;
    double v32 = a3->var0.origin.y;
    double v16 = a3->var1.size.width;
    double v28 = a3->var1.origin.x;
    double v29 = a3->var1.origin.y;
    double v18 = a3->var1.size.height;
    double v17 = a3->var2.origin.x;
    double v30 = a3->var2.origin.y;
    double v34 = a3->var2.size.height;
    double v35 = a3->var2.size.width;
    CGSize v36 = self;
    -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, y, v14, v32, v15, v31, a6);
    double v33 = v17;
    if (v16 > v18 && v14 == v17)
    {
      double v23 = y + v31;
      double v24 = y + v27 - v34;
      if (v18 <= 1.0 && v23 < v24)
      {
        -[UIImage compositeToRect:fromRect:operation:fraction:](v36, "compositeToRect:fromRect:operation:fraction:", v7, x, v23, v16, v24 - v23, v28, v29, v16, v18, *(void *)&a6);
        double v23 = v24;
      }
      else
      {
        for (; v23 < v24; double v23 = v23 + v18)
        {
          if (v18 + v23 > v24) {
            double v18 = v24 - v23;
          }
          -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, v23, v28, v29, v16, v18, a6);
        }
      }
      double y = floor(v23);
    }
    else
    {
      double v20 = x + v15;
      double v21 = x + v26 - v35;
      if (v16 <= 1.0 && v20 < v21)
      {
        -[UIImage compositeToRect:fromRect:operation:fraction:](v36, "compositeToRect:fromRect:operation:fraction:", v7, v20, y, v21 - v20, v18, v28, v29, v16, v18, *(void *)&a6);
        double v20 = v21;
      }
      else
      {
        for (; v20 < v21; double v20 = v20 + v16)
        {
          if (v16 + v20 > v21) {
            double v16 = v21 - v20;
          }
          -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, v20, y, v28, v29, v16, v18, a6);
        }
      }
      double x = floor(v20);
    }
    -[UIImage compositeToPoint:fromRect:operation:fraction:](v36, "compositeToPoint:fromRect:operation:fraction:", v7, x, y, v33, v30, v35, v34, a6);
  }
}

- (void)draw1PartImageInRect:(CGRect)a3
{
}

- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4
{
}

- (void)draw1PartImageInRect:(CGRect)a3 fraction:(double)a4 operation:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_UIImageContent *)self->_content isCGImage])
  {
    double v21 = height;
    double v12 = self;
    double v13 = *MEMORY[0x1E4F1DAD8];
    double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGSize v22 = v12;
    [(UIImage *)v12 size];
    double v17 = v15;
    double v18 = v16;
    if (v15 <= 1.0)
    {
      -[UIImage compositeToRect:fromRect:operation:fraction:](v22, "compositeToRect:fromRect:operation:fraction:", v5, x, y, width, v21, v13, v14, v15, v16, *(void *)&a4);
      size_t i = v22;
    }
    else
    {
      double v19 = x + width;
      for (size_t i = v22; x < v19; x = x + v17)
      {
        if (x + v17 > v19) {
          double v17 = v19 - x;
        }
        -[UIImage compositeToPoint:fromRect:operation:fraction:](v22, "compositeToPoint:fromRect:operation:fraction:", v5, x, y, v13, v14, v17, v18, a4);
        size_t i = v22;
      }
    }
  }
}

- (id)patternColor
{
  return +[UIColor colorWithPatternImage:self];
}

void __55__UIImage_UIImageDeprecatedPrivate___tiledPatternColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  CGFloat MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 40));
  CGContextTranslateCTM(v3, MinX, MaxY);
  CGContextScaleCTM(v3, 1.0, -1.0);
  uint64_t v6 = [*(id *)(a1 + 32) imageOrientation];
  if (v6)
  {
    double v7 = *(double *)(a1 + 80);
    double v8 = *(double *)(a1 + 72) * v7;
    if (v8 > 0.0)
    {
      double v9 = v7 * *(double *)(a1 + 88);
      if (v9 > 0.0)
      {
        long long v10 = xmmword_186B97840;
        CGFloat v11 = -1.0;
        double v12 = 0.0;
        switch(v6)
        {
          case 1:
            break;
          case 2:
            double v12 = v9 / v8;
            *((void *)&v10 + 1) = 0;
            *(double *)&long long v10 = -v8 / v9;
            double v9 = 0.0;
            goto LABEL_13;
          case 3:
            double v12 = -v9 / v8;
            *((void *)&v10 + 1) = 0;
            *(double *)&long long v10 = v8 / v9;
            goto LABEL_12;
          case 4:
            long long v10 = xmmword_186B89740;
            double v9 = 0.0;
            break;
          case 5:
            CGFloat v11 = 1.0;
            double v8 = 0.0;
            break;
          case 6:
            double v12 = -v9 / v8;
            *((void *)&v10 + 1) = 0;
            *(double *)&long long v10 = -v8 / v9;
            goto LABEL_13;
          case 7:
            double v12 = v9 / v8;
            *((void *)&v10 + 1) = 0;
            *(double *)&long long v10 = v8 / v9;
            double v9 = 0.0;
LABEL_12:
            double v8 = 0.0;
LABEL_13:
            CGFloat v11 = 0.0;
            break;
          default:
            CGFloat v11 = *MEMORY[0x1E4F1DAB8];
            double v12 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
            long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            double v8 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
            double v9 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
            break;
        }
        v13.a = v11;
        v13.b = v12;
        *(_OWORD *)&v13.c = v10;
        v13.tdouble x = v8;
        v13.tdouble y = v9;
        CGContextConcatCTM(v3, &v13);
      }
    }
  }
  CGContextDrawTiledImage(v3, *(CGRect *)(a1 + 96), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
}

+ (void)_flushSharedImageCache
{
  _UISharedImageFlushAll();
  +[_UIOldCGImageDecompressor flushCaches]();
}

+ (void)_flushCache:(id)a3
{
  _UISharedImageFlushAll();
  +[_UIOldCGImageDecompressor flushCaches]();
}

- (id)_swizzleContent:(id)a3
{
  uint64_t v4 = (_UIImageContent *)a3;
  uint64_t v5 = self->_content;
  content = self->_content;
  self->_content = v4;
  double v7 = v4;

  return v5;
}

- (void)_setCached:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$6595B0E67A40C1ED63E9CC1684FA2626 imageFlags = ($6595B0E67A40C1ED63E9CC1684FA2626)(*(_DWORD *)&self->_imageFlags & 0xFFFFFFBF | v3);
  if (a3) {
    uint64_t v4 = self;
  }
  else {
    uint64_t v4 = 0;
  }
  objc_setAssociatedObject(self, &UIImageTableCachedRetainCycleAssociationKey, v4, (void *)1);
}

- (BOOL)_isCached
{
  return (*(unsigned char *)&self->_imageFlags >> 6) & 1;
}

- (BOOL)_hasVisibleContentInRect:(CGRect)a3 atScale:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3)) {
    return 0;
  }
  CGFloat v11 = [(UIImage *)self ioSurface];
  IOSurfaceLock(v11, 1u, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(v11);
  size_t v13 = IOSurfaceGetHeight(v11);
  size_t v14 = IOSurfaceGetWidth(v11);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(v11);
  size_t BytesPerElement = IOSurfaceGetBytesPerElement(v11);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  int v17 = (int)fmax(CGRectGetMinY(v28) * a4, 0.0);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v18 = CGRectGetMaxY(v29) * a4;
  if (v18 >= (double)v13) {
    double v18 = (double)v13;
  }
  int v19 = (int)v18;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v21 = CGRectGetMaxX(v31) * a4;
  if (v21 >= (double)v14) {
    double v21 = (double)v14;
  }
  if (v17 >= v19)
  {
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 0;
    int v22 = (int)v21;
    int v23 = (int)fmax(MinX * a4, 0.0);
    double v24 = &BaseAddress[BytesPerRow * v17];
    do
    {
      int v25 = v22 - v23;
      uint64_t v26 = BytesPerElement * v23 + 3;
      if (v22 > v23)
      {
        while (v24[v26] < 0x1Au)
        {
          v26 += BytesPerElement;
          if (!--v25) {
            goto LABEL_14;
          }
        }
        BOOL v10 = 1;
      }
LABEL_14:
      v24 += BytesPerRow;
      ++v17;
    }
    while (v17 != v19);
  }
  IOSurfaceUnlock(v11, 1u, 0);
  return v10;
}

- (BOOL)_probeIsSeeThrough
{
  int v3 = objc_getAssociatedObject(self, &__imageSeeThroughKey);
  if (!v3)
  {
    [(UIImage *)self size];
    double v5 = v4;
    double v7 = v6;
    double v8 = self;
    char BitmapInfo = CGImageGetBitmapInfo([(UIImage *)v8 CGImage]);
    uint64_t v10 = 1;
    if (v5 != 0.0 && v7 != 0.0)
    {
      if ((BitmapInfo & 0x1Fu) <= 6 && ((1 << (BitmapInfo & 0x1F)) & 0x61) != 0)
      {
        uint64_t v10 = 0;
      }
      else
      {
        if (v5 > 50.0 || v7 > 50.0)
        {
          double v11 = v5 / v7;
          if (v5 / v7 >= 1.0)
          {
            double v5 = 50.0;
            double v13 = 50.0 / v11;
            if (v13 >= 1.0) {
              double v7 = v13;
            }
            else {
              double v7 = 1.0;
            }
          }
          else
          {
            double v7 = 50.0;
            double v12 = v11 * 50.0;
            if (v12 >= 1.0) {
              double v5 = v12;
            }
            else {
              double v5 = 1.0;
            }
          }
        }
        double v14 = v5 * 0.8;
        if (v5 * 0.8 < 1.0) {
          double v14 = 1.0;
        }
        double v15 = v7 * 0.8;
        if (v7 * 0.8 < 1.0) {
          double v15 = 1.0;
        }
        double v16 = (v5 - v14) * -0.5;
        double v17 = (v7 - v15) * -0.5;
        _UIGraphicsBeginImageContextWithOptions(0, 1, v14, v15, 1.0);
        ContextStack = GetContextStack(0);
        if (*(int *)ContextStack < 1) {
          int v19 = 0;
        }
        else {
          int v19 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        }
        CGContextSetInterpolationQuality(v19, kCGInterpolationNone);
        -[UIImage drawInRect:](v8, "drawInRect:", v16, v17, v5, v7);
        Data = (unsigned __int8 *)CGBitmapContextGetData(v19);
        int Width = CGBitmapContextGetWidth(v19);
        int Height = CGBitmapContextGetHeight(v19);
        int BytesPerRow = CGBitmapContextGetBytesPerRow(v19);
        if (Height < 1)
        {
LABEL_29:
          uint64_t v10 = 0;
        }
        else
        {
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = Width;
            uint64_t v26 = Data;
            if (Width >= 1) {
              break;
            }
LABEL_28:
            ++v24;
            Data += BytesPerRow;
            if (v24 == Height) {
              goto LABEL_29;
            }
          }
          while (1)
          {
            unsigned int v27 = *v26++;
            if (v27 <= 0xE5) {
              break;
            }
            if (!--v25) {
              goto LABEL_28;
            }
          }
          uint64_t v10 = 1;
        }
        UIGraphicsEndImageContext();
      }
    }
    int v3 = [NSNumber numberWithBool:v10];
    objc_setAssociatedObject(v8, &__imageSeeThroughKey, v3, (void *)1);
  }
  char v28 = [v3 BOOLValue];

  return v28;
}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  BOOL v11 = a11;
  double v17 = +[UIColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
  double v18 = +[UIColor colorWithRed:a7 green:a8 blue:a9 alpha:a10];
  [(UIImage *)self size];
  CGFloat v21 = v20;
  CGFloat v22 = v19;
  double v23 = 0.0;
  if (v11) {
    double v23 = 1.0;
  }
  CGFloat v24 = v23 + v19;
  [(UIImage *)self scale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v21, v24, v25);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
  {
    unsigned int v27 = 0;
    if (v11) {
      goto LABEL_5;
    }
  }
  else
  {
    unsigned int v27 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    if (v11)
    {
LABEL_5:
      char v28 = (CGColor *)[v17 CGColor];
      v32.CGFloat width = 0.0;
      v32.CGFloat height = -1.0;
      CGContextSetShadowWithColor(v27, v32, 0.0, v28);
      CGContextBeginTransparencyLayer(v27, 0);
      [v18 set];
      UIRectFillUsingOperation(1, 0.0, 1.0, v21, v22);
      -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 1.0, v21, v22, 1.0);
      CGContextEndTransparencyLayer(v27);
      goto LABEL_8;
    }
  }
  [v18 set];
  UIRectFillUsingOperation(1, 0.0, 0.0, v21, v22);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v21, v22, 1.0);
LABEL_8:
  CGRect v29 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v29;
}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  double v19 = +[UIColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
  double v20 = +[UIColor colorWithRed:a11 green:a12 blue:a13 alpha:a14];
  CGFloat v21 = +[UIColor colorWithRed:a7 green:a8 blue:a9 alpha:a10];
  [(UIImage *)self size];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v26 = v24 + 1.0;
  [(UIImage *)self scale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v23, v26, v27);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    CGRect v29 = 0;
  }
  else {
    CGRect v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  id v30 = v19;
  CGRect v31 = (CGColor *)[v30 CGColor];
  v42.CGFloat width = 0.0;
  v42.CGFloat height = 1.0;
  CGContextSetShadowWithColor(v29, v42, 0.0, v31);
  CGContextBeginTransparencyLayer(v29, 0);
  [v20 set];
  UIRectFillUsingOperation(1, 0.0, 0.0, v23, v25);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v23, v25, 1.0);
  CGContextEndTransparencyLayer(v29);
  CGSize v32 = [(UIImage *)self _bezeledImageWithShadowRed:0 green:1.0 blue:1.0 alpha:1.0 fillRed:1.0 green:0.0 blue:0.0 alpha:0.0 drawShadow:1.0];
  CGContextScaleCTM(v29, 1.0, -1.0);
  [v32 size];
  CGContextTranslateCTM(v29, 0.0, -v33);
  id v34 = v32;
  double v35 = (CGImage *)[v34 CGImage];
  v44.origin.CGFloat x = 0.0;
  v44.origin.CGFloat y = 0.0;
  v44.size.CGFloat width = v23;
  v44.size.CGFloat height = v25;
  CGContextClipToMask(v29, v44, v35);
  [v34 size];
  CGContextTranslateCTM(v29, 0.0, v36);
  CGContextScaleCTM(v29, 1.0, -1.0);
  id v37 = v21;
  CGFloat v38 = (CGColor *)[v37 CGColor];
  v43.CGFloat width = 0.0;
  v43.CGFloat height = 1.0;
  CGContextSetShadowWithColor(v29, v43, 0.0, v38);
  CGContextBeginTransparencyLayer(v29, 0);
  [v20 set];
  UIRectFillUsingOperation(1, 0.0, -1.0, v23, v26 + 1.0);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 23, 0.0, 0.0, v23, v25, 1.0);
  CGContextEndTransparencyLayer(v29);
  CGPoint v39 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v39;
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  [(UIImage *)self size];
  double v8 = ceil(v7 * a3);
  double v10 = ceil(v9 * a3);
  [(UIImage *)self scale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v8, v10, v11);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v13 = 0;
  }
  else {
    double v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetInterpolationQuality(v13, (CGInterpolationQuality)a4);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v8, v10);
  double v14 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  double v15 = objc_msgSend(v14, "imageWithRenderingMode:", -[UIImage renderingMode](self, "renderingMode"));

  return v15;
}

- (id)_serializedData
{
  if (_UIIsKitImage(self) & 1) != 0 || (_UIIsSystemSymbolImage(self)) {
    int v3 = self;
  }
  else {
    int v3 = [[_UIImageSerializationWrapper alloc] initWithImage:self];
  }
  double v4 = v3;
  double v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];

  return v5;
}

+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 scale:(double *)a4
{
  uint64_t v5 = *(void *)&a3;
  double v7 = +[UIDevice currentDevice];
  LODWORD(a4) = objc_msgSend(a1, "_iconVariantForUIApplicationIconFormat:idiom:scale:", v5, objc_msgSend(v7, "userInterfaceIdiom"), a4);

  return (int)a4;
}

+ (int)_iconVariantForUIApplicationIconFormat:(int)a3 idiom:(int64_t)a4 scale:(double *)a5
{
  double v6 = *a5;
  switch(a3)
  {
    case 0:
      if (v6 < 3.0) {
        int v7 = 17;
      }
      else {
        int v7 = 34;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 4;
      goto LABEL_33;
    case 5:
      if (v6 < 3.0) {
        int v7 = 23;
      }
      else {
        int v7 = 35;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 22;
      goto LABEL_33;
    case 11:
      if (v6 < 3.0) {
        int v7 = 56;
      }
      else {
        int v7 = 57;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 55;
      goto LABEL_33;
    case 12:
      BOOL v10 = v6 < 2.0;
      int v11 = 58;
      int v12 = 59;
LABEL_18:
      if (v10) {
        return v11;
      }
      else {
        return v12;
      }
    case 13:
      if (v6 < 3.0) {
        int v7 = 61;
      }
      else {
        int v7 = 62;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 60;
      goto LABEL_33;
    case 15:
      if (v6 < 3.0) {
        int v7 = 74;
      }
      else {
        int v7 = 75;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 73;
      goto LABEL_33;
    case 16:
      if (v6 < 3.0) {
        int v7 = 77;
      }
      else {
        int v7 = 78;
      }
      BOOL v8 = v6 < 2.0;
      int v9 = 76;
LABEL_33:
      if (v8) {
        int v13 = v9;
      }
      else {
        int v13 = v7;
      }
      break;
    default:
      if (a4 == 1)
      {
        switch(a3)
        {
          case 1:
            BOOL v10 = v6 < 2.0;
            int v11 = 3;
            int v12 = 25;
            goto LABEL_18;
          case 3:
            BOOL v10 = v6 < 2.0;
            int v11 = 5;
            int v12 = 26;
            goto LABEL_18;
          case 4:
            BOOL v10 = v6 < 2.0;
            int v11 = 7;
            int v12 = 28;
            goto LABEL_18;
          case 6:
            BOOL v10 = v6 < 2.0;
            int v11 = 6;
            int v12 = 27;
            goto LABEL_18;
          case 7:
            BOOL v10 = v6 < 2.0;
            int v11 = 8;
            int v12 = 29;
            goto LABEL_18;
          case 8:
            goto LABEL_48;
          case 9:
            goto LABEL_49;
          case 10:
            if (v6 < 2.0) {
              return 1;
            }
            else {
              return 24;
            }
          case 14:
            int v13 = 71;
            if (v6 >= 2.0)
            {
              double v20 = +[UIScreen mainScreen];
              [v20 _referenceBounds];
              double Height = CGRectGetHeight(v23);

              if (Height < 1366.0) {
                return 71;
              }
              else {
                return 72;
              }
            }
            return v13;
          default:
            if (v6 >= 2.0)
            {
              double v18 = +[UIScreen mainScreen];
              [v18 _referenceBounds];
              double v19 = CGRectGetHeight(v22);

              BOOL v10 = v19 < 1366.0;
              int v11 = 24;
              int v12 = 63;
              goto LABEL_18;
            }
            int v13 = 1;
            break;
        }
      }
      else
      {
        if (qword_1EB25B148 != -1) {
          dispatch_once(&qword_1EB25B148, &__block_literal_global_961);
        }
        switch(a3)
        {
          case 1:
            if (v6 < 3.0) {
              int v7 = 16;
            }
            else {
              int v7 = 33;
            }
            BOOL v8 = v6 < 2.0;
            int v9 = 2;
            goto LABEL_33;
          case 3:
          case 6:
            if (v6 < 3.0) {
              int v7 = 19;
            }
            else {
              int v7 = 36;
            }
            BOOL v8 = v6 < 2.0;
            int v9 = 18;
            goto LABEL_33;
          case 4:
          case 7:
            if (v6 < 3.0) {
              int v7 = 21;
            }
            else {
              int v7 = 37;
            }
            BOOL v8 = v6 < 2.0;
            int v9 = 20;
            goto LABEL_33;
          case 8:
LABEL_48:
            BOOL v10 = v6 < 3.0;
            int v11 = 30;
            int v12 = 53;
            goto LABEL_18;
          case 9:
LABEL_49:
            BOOL v10 = v6 < 3.0;
            int v11 = 31;
            int v12 = 54;
            goto LABEL_18;
          case 14:
            if (v6 < 3.0) {
              int v7 = 69;
            }
            else {
              int v7 = 70;
            }
            BOOL v8 = v6 < 2.0;
            int v9 = 68;
            goto LABEL_33;
          default:
            if (v6 < 3.0)
            {
              if (v6 < 2.0) {
                return 0;
              }
              BOOL v15 = byte_1EB25B10C == 0;
              int v16 = 79;
              int v17 = 15;
            }
            else
            {
              BOOL v15 = byte_1EB25B10C == 0;
              int v16 = 80;
              int v17 = 32;
            }
            if (v15) {
              int v13 = v17;
            }
            else {
              int v13 = v16;
            }
            break;
        }
      }
      break;
  }
  return v13;
}

void __88__UIImage_UIApplicationIconPrivate___iconVariantForUIApplicationIconFormat_idiom_scale___block_invoke()
{
  id v0 = +[UIScreen _embeddedScreen];
  byte_1EB25B10C = _UIScreenIsPhyiscallyLargePhone([v0 _screenType]);
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = +[UIScreen mainScreen];
  [v7 scale];
  BOOL v8 = objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:", v6, v4);

  return v8;
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = [NSString stringWithFormat:@"AppIcon(bundleID=%@, format=%d, scale=%.1lf)", v8, v6, *(void *)&a5];
  BOOL v10 = [MEMORY[0x1E4F1CA60] dictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__UIImage_UIApplicationIconPrivate___applicationIconImageForBundleIdentifier_format_scale___block_invoke;
  v17[3] = &unk_1E52F1858;
  id v19 = v8;
  id v20 = a1;
  id v18 = v10;
  int v22 = v6;
  double v21 = a5;
  id v11 = v8;
  id v12 = v10;
  int v13 = +[UIImageAsset _dynamicAssetNamed:v9 generator:v17];
  double v14 = +[UIImageConfiguration _unspecifiedConfiguration];
  BOOL v15 = [v13 imageWithConfiguration:v14];

  return v15;
}

id __91__UIImage_UIApplicationIconPrivate___applicationIconImageForBundleIdentifier_format_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 traitCollection];
  if ([v5 userInterfaceStyle] == 2)
  {
    uint64_t v6 = [v4 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 == 3) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {

    uint64_t v8 = 1;
  }
  int v9 = [NSNumber numberWithInteger:v8];
  BOOL v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (!v10)
  {
    BOOL v10 = [*(id *)(a1 + 48) _applicationIconImageForBundleIdentifier:*(void *)(a1 + 40) format:*(unsigned int *)(a1 + 64) scale:v8 style:*(double *)(a1 + 56)];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
  }

  return v10;
}

+ (id)_applicationIconImageForBundleIdentifier:(id)a3 format:(int)a4 scale:(double)a5 style:(int64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  BOOL v10 = (objc_class *)MEMORY[0x1E4F6F248];
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithBundleIdentifier:v11];

  int v13 = [a1 _baseImageDescriptorForUIApplicationIconFormat:v8];
  [v13 setAppearance:a6 == 2];
  if (a5 > 0.0)
  {
    [v13 setScale:a5];
  }
  else
  {
    double v14 = +[UIScreen mainScreen];
    [v14 scale];
    objc_msgSend(v13, "setScale:");
  }
  BOOL v15 = +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v12, v13);

  return v15;
}

- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = +[UIScreen mainScreen];
  [v7 scale];
  uint64_t v8 = -[UIImage _applicationIconImageForFormat:precomposed:scale:](self, "_applicationIconImageForFormat:precomposed:scale:", v5, v4);

  return v8;
}

- (id)_applicationIconImageForFormat:(int)a3 precomposed:(BOOL)a4 scale:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc(MEMORY[0x1E4F6F238]);
  int v9 = self;
  uint64_t v10 = [(UIImage *)v9 CGImage];
  [(UIImage *)v9 scale];
  id v11 = objc_msgSend(v8, "initWithCGImage:scale:", v10);
  id v12 = objc_alloc(MEMORY[0x1E4F6F248]);
  v20[0] = v11;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  double v14 = (void *)[v12 initWithImages:v13];

  BOOL v15 = +[UIImage _baseImageDescriptorForUIApplicationIconFormat:v6];
  int v16 = v15;
  if (a5 > 0.0)
  {
    [v15 setScale:a5];
  }
  else
  {
    int v17 = +[UIScreen mainScreen];
    [v17 scale];
    objc_msgSend(v16, "setScale:");
  }
  id v18 = +[UIImage _imageWithIcon:descriptor:]((uint64_t)UIImage, v14, v16);

  return v18;
}

+ (UIImage)actionsImage
{
  self;
  double v2 = +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  int v3 = -[_UIImageSystemImageVisualStyle actionsImage](v2);

  return (UIImage *)v3;
}

+ (UIImage)addImage
{
  self;
  double v2 = +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  int v3 = -[_UIImageSystemImageVisualStyle addImage](v2);

  return (UIImage *)v3;
}

+ (UIImage)removeImage
{
  self;
  double v2 = +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  int v3 = -[_UIImageSystemImageVisualStyle removeImage](v2);

  return (UIImage *)v3;
}

+ (UIImage)checkmarkImage
{
  self;
  double v2 = +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  int v3 = -[_UIImageSystemImageVisualStyle checkmarkImage](v2);

  return (UIImage *)v3;
}

+ (UIImage)strokedCheckmarkImage
{
  self;
  double v2 = +[_UIImageSystemImageVisualStyle _iosVisualStyle]();
  int v3 = -[_UIImageSystemImageVisualStyle strokedCheckmarkImage](v2);

  return (UIImage *)v3;
}

- (id)_imageByApplyingVariant:(unint64_t)a3 allowNone:(BOOL)a4
{
  if (!a3 && !a4
    || (_UIImageName(self),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = _UIImageVariantValueForName(v6),
        v6,
        (a3 & ~v7) == 0))
  {
    id v8 = self;
    goto LABEL_17;
  }
  int v9 = _UIImageName(self);
  if (![v9 length]) {
    goto LABEL_15;
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  double v14 = __61__UIImage_UIImageVariant___imageByApplyingVariant_allowNone___block_invoke;
  BOOL v15 = &unk_1E52F1880;
  id v16 = v9;
  int v17 = self;
  uint64_t v10 = (void (**)(void *, unint64_t))_Block_copy(&v12);
  v10[2](v10, a3);
  id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10[2](v10, a3 & 0xFFFFFFFFFFFEFFFFLL);
    id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v10[2](v10, a3 & 0xFFFFFFFFBFFFFFFFLL);
      id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v10[2](v10, a3 & 0xFFFFFFFFFFFFFFF1);
        id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v10[2](v10, a3 & 0xFFFFFFFFBFFEFFFFLL);
          id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            v10[2](v10, a3 & 0xFFFFFFFFFFFEFFF1);
            id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
            if (!v8)
            {
              v10[2](v10, a3 & 0xFFFFFFFFBFFFFFF1);
              id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
              if (!v8)
              {

LABEL_15:
                id v8 = self;
                goto LABEL_16;
              }
            }
          }
        }
      }
    }
  }
  -[UIImage _configureImage:assumePreconfigured:](self, "_configureImage:assumePreconfigured:", v8, 1, v12, v13, v14, v15);

LABEL_16:
LABEL_17:
  return v8;
}

id __61__UIImage_UIImageVariant___imageByApplyingVariant_allowNone___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = _UIImageVariantName(*(void **)(a1 + 32), a2);
  int v4 = _UIIsSystemSymbolImage(*(void **)(a1 + 40));
  uint64_t v5 = [*(id *)(a1 + 40) configuration];
  if (v4) {
    +[UIImage _systemImageNamed:v3 withConfiguration:v5];
  }
  else {
  uint64_t v6 = +[UIImage imageNamed:v3 withConfiguration:v5];
  }

  return v6;
}

+ (id)_systemImageNamed:(id)a3 variant:(unint64_t)a4 withConfiguration:(id)a5
{
  id v7 = a5;
  id v8 = _UIImageVariantName(a3, a4);
  int v9 = +[UIImage _systemImageNamed:v8 withConfiguration:v7];

  return v9;
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_186B978D0[a4 - 1];
  }
  return (id)[a1 _systemImageNamed:a3 variant:v4];
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5
{
  if ((unint64_t)(a4 - 1) > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_186B978D0[a4 - 1];
  }
  if (a5 == 1) {
    uint64_t v6 = v5 | 0x40000000;
  }
  else {
    uint64_t v6 = v5;
  }
  return (id)[a1 _systemImageNamed:a3 variant:v6];
}

+ (id)_systemImageNamed:(id)a3 shape:(int64_t)a4 fill:(int64_t)a5 withConfiguration:(id)a6
{
  if ((unint64_t)(a4 - 1) > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_186B978D0[a4 - 1];
  }
  if (a5 == 1) {
    uint64_t v7 = v6 | 0x40000000;
  }
  else {
    uint64_t v7 = v6;
  }
  return (id)[a1 _systemImageNamed:a3 variant:v7 withConfiguration:a6];
}

- (id)_applyBackdropViewSettings:(id)a3 allowImageResizing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(UIImage *)self size];
  if (v7 < 1.0 || ([(UIImage *)self size], v8 < 1.0))
  {
    [(UIImage *)self size];
    uint64_t v10 = v9;
    [(UIImage *)self size];
    NSLog(&cfstr_Applybackdropv.isa, v10, v11, self);
LABEL_4:
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  double v14 = self;
  if (![(UIImage *)v14 CGImage])
  {
    NSLog(&cfstr_Applybackdropv_0.isa, v14);
    goto LABEL_4;
  }
  uint64_t v15 = [v6 grayscaleTintMaskImage];
  if (v15)
  {
    id v16 = (void *)v15;
    id v17 = [v6 grayscaleTintMaskImage];
    uint64_t v18 = [v17 CGImage];

    if (!v18)
    {
      double v54 = [v6 grayscaleTintMaskImage];
      NSLog(&cfstr_Applybackdropv_1.isa, v54);
LABEL_32:

      goto LABEL_4;
    }
  }
  uint64_t v19 = [v6 colorTintMaskImage];
  if (v19)
  {
    id v20 = (void *)v19;
    id v21 = [v6 colorTintMaskImage];
    uint64_t v22 = [v21 CGImage];

    if (!v22)
    {
      double v54 = [v6 colorTintMaskImage];
      NSLog(&cfstr_Applybackdropv_2.isa, v54);
      goto LABEL_32;
    }
  }
  uint64_t v23 = [v6 filterMaskImage];
  if (v23)
  {
    double v24 = (void *)v23;
    id v25 = [v6 filterMaskImage];
    uint64_t v26 = [v25 CGImage];

    if (!v26)
    {
      double v54 = [v6 filterMaskImage];
      NSLog(&cfstr_Applybackdropv_3.isa, v54);
      goto LABEL_32;
    }
  }
  [v6 blurRadius];
  double v28 = v27;
  [v6 saturationDeltaFactor];
  double v30 = v29;
  CGRect v31 = +[UIScreen mainScreen];
  [v31 scale];
  double v33 = v32;

  int v34 = [v6 usesBackdropEffectView];
  double v35 = fabs(v30 + -1.0);
  if (v28 > 0.00000011920929) {
    int v36 = v34;
  }
  else {
    int v36 = 0;
  }
  if ((v36 & v4) != 0) {
    double v37 = 0.25;
  }
  else {
    double v37 = 1.0;
  }
  [(UIImage *)v14 size];
  double v39 = v38;
  [(UIImage *)v14 size];
  double v41 = v40;
  CGSize v42 = v14;
  int v43 = [v6 usesBackdropEffectView];
  float v44 = v39 * v37;
  float v45 = ceilf(v44);
  double v46 = v45;
  float v47 = v41 * v37;
  float v48 = ceilf(v47);
  double v49 = v48;
  BOOL v50 = v35 > 0.00000011920929 || v28 > 0.00000011920929;
  size_t v51 = v42;
  if (v43)
  {
    size_t v51 = v42;
    if (v50)
    {
      _UIGraphicsBeginImageContextWithOptions(0, 0, v45, v48, v33);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        size_t v53 = 0;
      }
      else {
        size_t v53 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      CGContextScaleCTM(v53, 1.0, -1.0);
      CGContextTranslateCTM(v53, 0.0, -v49);
      id v55 = v42;
      uint64_t v56 = [(UIImage *)v55 CGImage];
      v141.origin.CGFloat x = 0.0;
      v141.origin.CGFloat y = 0.0;
      v141.size.CGFloat width = v45;
      v141.size.CGFloat height = v48;
      CGContextDrawImage(v53, v141, v56);
      src.data = CGBitmapContextGetData(v53);
      src.CGFloat width = CGBitmapContextGetWidth(v53);
      src.CGFloat height = CGBitmapContextGetHeight(v53);
      src.rowBytes = CGBitmapContextGetBytesPerRow(v53);
      _UIGraphicsBeginImageContextWithOptions(0, 0, v45, v48, v33);
      uint64_t v57 = GetContextStack(0);
      if (*(int *)v57 < 1) {
        uint64_t v58 = 0;
      }
      else {
        uint64_t v58 = (CGContext *)v57[3 * (*(_DWORD *)v57 - 1) + 1];
      }
      dest.data = CGBitmapContextGetData(v58);
      dest.CGFloat width = CGBitmapContextGetWidth(v58);
      dest.CGFloat height = CGBitmapContextGetHeight(v58);
      dest.rowBytes = CGBitmapContextGetBytesPerRow(v58);
      if (v28 > 0.00000011920929)
      {
        [v6 blurRadius];
        double v60 = v33 * (v59 * 0.25);
        double v61 = v60 * 3.0 * 2.50662827 * 0.25 + 0.5;
        BOOL v62 = v60 < 2.0;
        double v63 = 4.25994241;
        if (!v62) {
          double v63 = v61;
        }
        int v64 = vcvtmd_u64_f64(v63);
        uint32_t v65 = v64 | 1;
        if (v4)
        {
          vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, v64 | 1, v64 | 1, 0, 8u);
          vImageBoxConvolve_ARGB8888(&dest, &src, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, v65, v65, 0, 8u);
        }
        else
        {
          double v66 = ceilf(v45 * 0.25);
          double v67 = ceilf(v48 * 0.25);
          _UIGraphicsBeginImageContextWithOptions(0, 0, v66, v67, v33);
          double v68 = GetContextStack(0);
          if (*(int *)v68 < 1) {
            unint64_t v69 = 0;
          }
          else {
            unint64_t v69 = (CGContext *)v68[3 * (*(_DWORD *)v68 - 1) + 1];
          }
          v131.data = CGBitmapContextGetData(v69);
          v131.CGFloat width = CGBitmapContextGetWidth(v69);
          v131.CGFloat height = CGBitmapContextGetHeight(v69);
          v131.rowBytes = CGBitmapContextGetBytesPerRow(v69);
          _UIGraphicsBeginImageContextWithOptions(0, 0, v66, v67, v33);
          unint64_t v70 = GetContextStack(0);
          if (*(int *)v70 < 1) {
            double v71 = 0;
          }
          else {
            double v71 = (CGContext *)v70[3 * (*(_DWORD *)v70 - 1) + 1];
          }
          v128.data = CGBitmapContextGetData(v71);
          v128.CGFloat width = CGBitmapContextGetWidth(v71);
          v128.CGFloat height = CGBitmapContextGetHeight(v71);
          v128.rowBytes = CGBitmapContextGetBytesPerRow(v71);
          vImageScale_ARGB8888(&src, &v131, 0, 0);
          vImageBoxConvolve_ARGB8888(&v131, &v128, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&v128, &v131, 0, 0, 0, v65, v65, 0, 8u);
          vImageBoxConvolve_ARGB8888(&v131, &v128, 0, 0, 0, v65, v65, 0, 8u);
          vImageScale_ARGB8888(&v128, &dest, 0, 0);
          UIGraphicsEndImageContext();
          UIGraphicsEndImageContext();
        }
      }
      if (v35 > 0.00000011920929)
      {
        uint64_t v72 = [v6 saturationDeltaFactor];
        float64x2_t v74 = vmulq_n_f64((float64x2_t)xmmword_186B97850, v73);
        v75.f64[0] = 0.7152;
        *(void *)&v75.f64[0] = *(_OWORD *)&vsubq_f64(v75, v74);
        *(double *)&v131.data = v73 * 0.9278 + 0.0722;
        *(double *)&v131.CGFloat height = 0.0722 - v73 * 0.0722;
        long long v133 = *(unint64_t *)&v75.f64[0];
        v75.f64[1] = vaddq_f64(v74, (float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL)).f64[1];
        v131.CGFloat width = v131.height;
        float64x2_t v132 = v75;
        v76.f64[0] = 0.2126;
        v131.rowBytes = 0;
        float64x2_t v77 = vmulq_n_f64((float64x2_t)xmmword_186B97860, v73);
        *(void *)&long long v78 = *(_OWORD *)&vsubq_f64(v76, v77);
        uint64_t v134 = v78;
        *((void *)&v78 + 1) = *(void *)&vaddq_f64(v77, (float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL)).f64[1];
        long long v135 = v78;
        long long v136 = 0u;
        long long v137 = 0u;
        uint64_t v138 = 0x3FF0000000000000;
        MEMORY[0x1F4188790](v72);
        uint64_t v83 = 0;
        double v84 = (float64x2_t *)&v131;
        float64x2_t v85 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
        do
        {
          int32x2_t v86 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[3], v85))));
          int32x2_t v87 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[2], v85))));
          int32x2_t v88 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(v84[1], v85))));
          int32x2_t v89 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vmulq_f64(*v84, v85))));
          *(int8x16_t *)((char *)&v127 + v83) = vqtbl4q_s8(*(int8x16x4_t *)(&v79 - 1), (int8x16_t)xmmword_186B97870);
          v84 += 4;
          v83 += 16;
        }
        while (v83 != 32);
        if (v28 > 0.00000011920929)
        {
          vImageMatrixMultiply_ARGB8888(&dest, &src, (const int16_t *)&v127, 256, 0, 0, 0);
          UIGraphicsEndImageContext();
          size_t v51 = _UIGraphicsGetImageFromCurrentImageContext(0);

LABEL_56:
          UIGraphicsEndImageContext();
          goto LABEL_57;
        }
        vImageMatrixMultiply_ARGB8888(&src, &dest, (const int16_t *)&v127, 256, 0, 0, 0);
      }
      size_t v51 = _UIGraphicsGetImageFromCurrentImageContext(0);

      UIGraphicsEndImageContext();
      goto LABEL_56;
    }
  }
LABEL_57:
  +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", objc_msgSend(v6, "style", v128.data, v128.height, v128.width, v128.rowBytes, dest.data, dest.height, dest.width, dest.rowBytes, src.data, src.height, src.width, src.rowBytes, v131.data, v131.height,
      v131.width,
  uint64_t v90 = v131.rowBytes));
  [v90 setValuesFromModel:v6];
  double v91 = +[_UIBackdropViewSettings settingsForStyle:](_UIBackdropViewSettings, "settingsForStyle:", [v6 style]);
  if ([v91 requiresColorStatistics])
  {
    uint64_t v134 = 0;
    float64x2_t v132 = 0u;
    long long v133 = 0u;
    memset(&v131, 0, sizeof(v131));
    if (v51)
    {
      [v51 _calculateStatistics];
      double v92 = *(double *)&v131.rowBytes;
    }
    else
    {
      double v92 = 0.0;
    }
    double v93 = [v90 colorSettings];
    [v93 setAverageHue:v92];

    double v94 = v132.f64[0];
    v95 = [v90 colorSettings];
    [v95 setAverageSaturation:v94];

    double v96 = v132.f64[1];
    v97 = [v90 colorSettings];
    [v97 setAverageBrightness:v96];

    double v98 = *((double *)&v133 + 1);
    v99 = [v90 colorSettings];
    [v99 setContrast:v98];
  }
  [v91 computeOutputSettingsUsingModel:v90];
  id v100 = [v6 grayscaleTintMaskImage];
  if (v100 || ([v6 colorTintMaskImage], (id v100 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    uint64_t v125 = [v6 filterMaskImage];

    if (!v125)
    {
      CGBitmapInfo v126 = CGImageGetBitmapInfo([(UIImage *)v42 CGImage]) & 0x1F;
      int v101 = v126 - 5 < 2 || v126 == 0;
      goto LABEL_66;
    }
  }
  int v101 = 0;
LABEL_66:
  CGFloat v102 = 0.0;
  CGFloat v103 = 0.0;
  if (!v4)
  {
    CGFloat v102 = *MEMORY[0x1E4F1DAD8];
    CGFloat v103 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(UIImage *)v42 size];
    double v46 = v104;
    double v49 = v105;
  }
  _UIGraphicsBeginImageContextWithOptions(v101, 0, v46, v49, v33);
  double v106 = GetContextStack(0);
  if (*(int *)v106 < 1) {
    double v107 = 0;
  }
  else {
    double v107 = (CGContext *)v106[3 * (*(_DWORD *)v106 - 1) + 1];
  }
  CGContextScaleCTM(v107, 1.0, -1.0);
  CGContextTranslateCTM(v107, 0.0, -v49);
  double v108 = [(UIImage *)v42 CGImage];
  v142.origin.CGFloat x = v102;
  v142.origin.CGFloat y = v103;
  v142.size.CGFloat width = v46;
  v142.size.CGFloat height = v49;
  CGContextDrawImage(v107, v142, v108);
  if ([v91 usesBackdropEffectView])
  {
    CGContextSaveGState(v107);
    double v109 = [v6 filterMaskImage];

    if (v109)
    {
      id v110 = [v6 filterMaskImage];
      v111 = (CGImage *)[v110 CGImage];
      v143.origin.CGFloat x = v102;
      v143.origin.CGFloat y = v103;
      v143.size.CGFloat width = v46;
      v143.size.CGFloat height = v49;
      CGContextClipToMask(v107, v143, v111);
    }
    CGFloat v112 = (CGImage *)[v51 CGImage];
    v144.origin.CGFloat x = v102;
    v144.origin.CGFloat y = v103;
    v144.size.CGFloat width = v46;
    v144.size.CGFloat height = v49;
    CGContextDrawImage(v107, v144, v112);
    CGContextRestoreGState(v107);
  }
  if ([v91 usesGrayscaleTintView])
  {
    CGContextSaveGState(v107);
    [v91 grayscaleTintAlpha];
    CGFloat v114 = v113;
    [v91 grayscaleTintLevel];
    CGContextSetGrayFillColor(v107, v115, v114);
    CGRect v116 = [v6 grayscaleTintMaskImage];

    if (v116)
    {
      id v117 = [v6 grayscaleTintMaskImage];
      v118 = (CGImage *)[v117 CGImage];
      v145.origin.CGFloat x = v102;
      v145.origin.CGFloat y = v103;
      v145.size.CGFloat width = v46;
      v145.size.CGFloat height = v49;
      CGContextClipToMask(v107, v145, v118);
    }
    v146.origin.CGFloat x = v102;
    v146.origin.CGFloat y = v103;
    v146.size.CGFloat width = v46;
    v146.size.CGFloat height = v49;
    CGContextFillRect(v107, v146);
    CGContextRestoreGState(v107);
  }
  if ([v91 usesColorTintView])
  {
    double v119 = [v91 colorTint];

    if (v119)
    {
      CGContextSaveGState(v107);
      v131.data = 0;
      src.data = 0;
      dest.data = 0;
      v128.data = 0;
      long long v120 = [v91 colorTint];
      [v120 getRed:&v131 green:&src blue:&dest alpha:&v128];

      [v91 colorTintAlpha];
      *(double *)&v128.data = v121 * *(double *)&v128.data;
      CGContextSetRGBFillColor(v107, *(CGFloat *)&v131.data, *(CGFloat *)&src.data, *(CGFloat *)&dest.data, *(CGFloat *)&v128.data);
      long long v122 = [v6 colorTintMaskImage];

      if (v122)
      {
        id v123 = [v6 colorTintMaskImage];
        v124 = (CGImage *)[v123 CGImage];
        v147.origin.CGFloat x = v102;
        v147.origin.CGFloat y = v103;
        v147.size.CGFloat width = v46;
        v147.size.CGFloat height = v49;
        CGContextClipToMask(v107, v147, v124);
      }
      v148.origin.CGFloat x = v102;
      v148.origin.CGFloat y = v103;
      v148.size.CGFloat width = v46;
      v148.size.CGFloat height = v49;
      CGContextFillRect(v107, v148);
      CGContextRestoreGState(v107);
    }
  }
  uint64_t v12 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

LABEL_5:
  return v12;
}

- (id)_applyBackdropViewSettings:(id)a3
{
  return [(UIImage *)self _applyBackdropViewSettings:a3 allowImageResizing:0];
}

- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5
{
  return [(UIImage *)self _applyBackdropViewSettings:a3 includeTints:a4 includeBlur:a5 allowImageResizing:0];
}

- (id)_applyBackdropViewSettings:(id)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 allowImageResizing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  uint64_t v11 = v10;
  if (a4 || a5)
  {
    if (!a4)
    {
      [v10 setUsesGrayscaleTintView:0];
      [v11 setUsesColorTintView:0];
    }
    if (!a5)
    {
      [v11 setBlurRadius:0.0];
      [v11 setSaturationDeltaFactor:1.0];
    }
    uint64_t v12 = [(UIImage *)self _applyBackdropViewSettings:v11 allowImageResizing:v6];
  }
  else
  {
    uint64_t v12 = self;
  }
  uint64_t v13 = v12;

  return v13;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v9 = +[UIDevice currentDevice];
  id v10 = -[UIImage _applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:](self, "_applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:", a3, v6, v5, [v9 _graphicsQuality]);

  return v10;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = +[UIDevice currentDevice];
  uint64_t v11 = -[UIImage _applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:allowImageResizing:](self, "_applyBackdropViewStyle:includeTints:includeBlur:graphicsQuality:allowImageResizing:", a3, v7, v6, [v10 _graphicsQuality], 0);

  return v11;
}

- (id)_applyBackdropViewStyle:(int64_t)a3 includeTints:(BOOL)a4 includeBlur:(BOOL)a5 graphicsQuality:(int64_t)a6 allowImageResizing:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  BOOL v9 = a4;
  if (a4 || a5)
  {
    uint64_t v12 = +[_UIBackdropViewSettings settingsForPrivateStyle:a3 graphicsQuality:a6];
    uint64_t v11 = [(UIImage *)self _applyBackdropViewSettings:v12 includeTints:v9 includeBlur:v8 allowImageResizing:v7];
  }
  else
  {
    uint64_t v11 = self;
  }
  return v11;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 effectsImage:(id)a5 maskImage:(id)a6 style:(int)a7
{
  BOOL v7 = 0;
  if (a3.width > 0.0)
  {
    CGFloat height = a3.height;
    if (a3.height > 0.0)
    {
      CGFloat width = a3.width;
      CGFloat v13 = *MEMORY[0x1E4F1DAD8];
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      id v15 = a6;
      id v16 = a5;
      id v17 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
      uint64_t v18 = _UIImagePressedTintColor(v17, a7);

      [v18 set];
      UIRectFillUsingOperation(1, v13, v14, width, height);
      objc_msgSend(v16, "drawInRect:", v13, v14, width, height);

      objc_msgSend(v15, "drawInRect:blendMode:alpha:", 22, v13, v14, width, height, 1.0);
      BOOL v7 = _UIGraphicsGetImageFromCurrentImageContext(0);
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);
    }
  }
  return v7;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7
{
  BOOL v7 = 0;
  if (a3.width > 0.0)
  {
    CGFloat height = a3.height;
    if (a3.height > 0.0)
    {
      CGFloat width = a3.width;
      CGFloat v13 = *MEMORY[0x1E4F1DAD8];
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      id v15 = a6;
      id v16 = a5;
      id v17 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
      uint64_t v18 = _UIImagePressedTintColor(v17, a7);

      [v18 set];
      UIRectFillUsingOperation(1, v13, v14, width, height);
      objc_msgSend(v16, "drawInRect:blendMode:alpha:", 22, v13, v14, width, height, 1.0);

      objc_msgSend(v15, "drawInRect:", v13, v14, width, height);
      BOOL v7 = _UIGraphicsGetImageFromCurrentImageContext(0);
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);
    }
  }
  return v7;
}

+ (id)_tintedImageForSize:(CGSize)a3 withTint:(id)a4 maskImage:(id)a5 effectsImage:(id)a6 style:(int)a7 edgeInsets:(UIEdgeInsets)a8
{
  BOOL v8 = 0;
  if (a3.width > 0.0)
  {
    CGFloat height = a3.height;
    if (a3.height > 0.0)
    {
      double left = a8.left;
      double top = a8.top;
      CGFloat width = a3.width;
      double v16 = *MEMORY[0x1E4F1DAD8];
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CGFloat v18 = a3.width - (a8.left + a8.right);
      CGFloat v19 = a3.height - (a8.top + a8.bottom);
      id v20 = a6;
      id v21 = a5;
      id v22 = a4;
      _UIGraphicsBeginImageContextWithOptions(0, 0, v18, v19, 0.0);
      CGFloat v23 = v16 - left;
      CGFloat v24 = v17 - top;
      id v25 = _UIImagePressedTintColor(v22, a7);

      [v25 set];
      UIRectFillUsingOperation(1, v23, v24, width, height);
      objc_msgSend(v21, "drawInRect:blendMode:alpha:", 22, v23, v24, width, height, 1.0);

      objc_msgSend(v20, "drawInRect:", v23, v24, width, height);
      BOOL v8 = _UIGraphicsGetImageFromCurrentImageContext(0);
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);
    }
  }
  return v8;
}

+ (CGSize)_legibilityImageSizeForSize:(CGSize)a3 style:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[_UILegibilitySettings sharedInstanceForStyle:a4];
  [v6 imageOutset];
  double v8 = width + v7;
  [v6 imageOutset];
  double v10 = height + v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (id)_imageForLegibilityStyle:(int64_t)a3
{
  [(UIImage *)self size];
  if (v5 < 1.0) {
    return self;
  }
  [(UIImage *)self size];
  if (v6 < 1.0) {
    return self;
  }
  id v8 = +[_UILegibilitySettings sharedInstanceForStyle:a3];
  return [(UIImage *)self _imageForLegibilitySettings:v8 strength:1.5];
}

- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4
{
  return [(UIImage *)self _imageForLegibilitySettings:a3 strength:0 alphaOnly:a4];
}

- (id)_imageForLegibilitySettings:(id)a3 strength:(double)a4 alphaOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = self;
  [(UIImage *)self size];
  if (v9 >= 1.0)
  {
    [(UIImage *)v8 size];
    if (v10 >= 1.0)
    {
      uint64_t v11 = [a3 style];
      if (a4 != 0.0)
      {
        if (v11)
        {
          [(UIImage *)v8 size];
          double v13 = v12;
          [a3 imageOutset];
          double v15 = v13 + v14;
          [(UIImage *)v8 size];
          double v17 = v16;
          [a3 imageOutset];
          double v19 = v17 + v18;
          [+[UIScreen mainScreen] scale];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __73__UIImage__UILegibility___imageForLegibilitySettings_strength_alphaOnly___block_invoke;
          v22[3] = &unk_1E52F1B28;
          void v22[4] = v8;
          v22[5] = a3;
          *(double *)&v22[6] = a4;
          *(double *)&v22[7] = v15;
          *(double *)&v22[8] = v19;
          BOOL v23 = v5;
          return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v5, v22, v15, v19, v20);
        }
      }
    }
  }
  return v8;
}

uint64_t __73__UIImage__UILegibility___imageForLegibilitySettings_strength_alphaOnly___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawImageForLegibilitySettings:strength:size:alphaOnly:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_drawImageForLegibilityStyle:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = +[_UILegibilitySettings sharedInstanceForStyle:a3];
  -[UIImage _drawImageForLegibilitySettings:strength:size:](self, "_drawImageForLegibilitySettings:strength:size:", v7, 1.5, width, height);
}

- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5
{
}

- (void)_drawImageForLegibilitySettings:(id)a3 strength:(double)a4 size:(CGSize)a5 alphaOnly:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v12 = [a3 style];
  if (a4 != 0.0 && v12 != 0)
  {
    [(UIImage *)self size];
    double v15 = v14;
    [(UIImage *)self size];
    double v17 = v16;
    [+[UIScreen mainScreen] scale];
    double v19 = v18;
    double v20 = UIRectCenteredIntegralRectScale(0.0, 0.0, v15, v17, 0.0, 0.0, width, height, v18);
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    double v27 = self;
    if (!v6) {
      double v27 = -[UIImage _flatImageWithColor:](self, "_flatImageWithColor:", [a3 shadowColor]);
    }
    uint64_t v44 = 0;
    float v45 = &v44;
    uint64_t v46 = 0x3052000000;
    float v47 = __Block_byref_object_copy__114;
    float v48 = __Block_byref_object_dispose__114;
    uint64_t v49 = 0;
    [+[UIScreen mainScreen] scale];
    double v29 = v28;
    *(float *)&double v28 = width * 0.25;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke;
    v34[3] = &unk_1E52F1B78;
    float v30 = height * 0.25;
    double v35 = ceilf(*(float *)&v28);
    double v36 = ceilf(v30);
    uint64_t v37 = 0x3FD0000000000000;
    v34[4] = self;
    v34[5] = a3;
    double v38 = v19;
    double v39 = v20;
    uint64_t v40 = v22;
    uint64_t v41 = v24;
    uint64_t v42 = v26;
    BOOL v43 = v6;
    v34[6] = v27;
    v34[7] = &v44;
    _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v6, v34, v35, v36, v29);
    [a3 shadowAlpha];
    for (double i = v31 * a4; i > 0.00000011920929; double i = i + -1.0)
    {
      if (i + 0.00000011920929 <= 1.0) {
        double v33 = i;
      }
      else {
        double v33 = 1.0;
      }
      objc_msgSend((id)v45[5], "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, width, height, v33);
    }
    _Block_object_dispose(&v44, 8);
  }
}

id __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  double v3 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) size];
  *(float *)&double v4 = v4 * *(double *)(a1 + 80);
  double v5 = ceilf(*(float *)&v4);
  [*(id *)(a1 + 32) size];
  float v7 = v6 * *(double *)(a1 + 80);
  double v8 = UIRectCenteredIntegralRectScale(0.0, 0.0, v5, ceilf(v7), 0.0, 0.0, v2, v3, *(double *)(a1 + 88));
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v16 = 0;
  }
  else {
    double v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetFillColorWithColor(v16, (CGColorRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "shadowColor"), "CGColor"));
  double Height = CGRectGetHeight(*(CGRect *)(a1 + 96));
  [*(id *)(a1 + 40) minFillHeight];
  if (Height >= v18)
  {
    [*(id *)(a1 + 40) shadowRadius];
    CGContextScaleCTM(v16, 1.0, -1.0);
    CGContextTranslateCTM(v16, 0.0, -*(double *)(a1 + 72));
    double v19 = (CGImage *)[*(id *)(a1 + 48) CGImage];
    v33.origin.CGFloat x = v8;
    v33.origin.CGFloat y = v10;
    v33.size.double width = v12;
    v33.size.double height = v14;
    CGContextDrawImage(v16, v33, v19);
  }
  else
  {
    v32.origin.CGFloat x = v8;
    v32.origin.CGFloat y = v10;
    v32.size.double width = v12;
    v32.size.double height = v14;
    CGContextFillRect(v16, v32);
  }
  Data = CGBitmapContextGetData(v16);
  size_t Width = CGBitmapContextGetWidth(v16);
  size_t v22 = CGBitmapContextGetHeight(v16);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v16);
  [+[UIScreen mainScreen] scale];
  int v24 = *(unsigned __int8 *)(a1 + 128);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke_2;
  v30[3] = &unk_1E52F1B50;
  uint64_t v25 = *(void *)(a1 + 40);
  double v26 = *(double *)(a1 + 72);
  v30[6] = *(void *)(a1 + 80);
  char v31 = v24;
  v30[7] = Data;
  v30[8] = v22;
  v30[9] = Width;
  v30[10] = BytesPerRow;
  uint64_t v27 = *(void *)(a1 + 56);
  v30[4] = v25;
  v30[5] = v27;
  return _UIGraphicsDrawIntoImageContextWithMoreOptions(0, v24, v30, *(double *)(a1 + 64), v26, v28);
}

id __82__UIImage__UILegibility___drawImageForLegibilitySettings_strength_size_alphaOnly___block_invoke_2(uint64_t a1)
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v3 = 0;
  }
  else {
    double v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  dest.data = CGBitmapContextGetData(v3);
  dest.double width = CGBitmapContextGetWidth(v3);
  dest.double height = CGBitmapContextGetHeight(v3);
  dest.rowBytes = CGBitmapContextGetBytesPerRow(v3);
  [*(id *)(a1 + 32) shadowRadius];
  double v5 = v4 * *(double *)(a1 + 48);
  [+[UIScreen mainScreen] scale];
  double v7 = v5 * v6;
  double v8 = v7 * 3.0 * 2.50662827 * 0.25 + 0.5;
  BOOL v9 = v7 < 2.0;
  double v10 = 4.25994241;
  if (!v9) {
    double v10 = v8;
  }
  double v11 = (const vImage_Buffer *)(a1 + 56);
  uint32_t v12 = vcvtmd_u64_f64(v10) | 1;
  if (*(unsigned char *)(a1 + 88)) {
    vImageTentConvolve_Planar8(v11, &dest, 0, 0, 0, v12, v12, 0, 8u);
  }
  else {
    vImageTentConvolve_ARGB8888(v11, &dest, 0, 0, 0, v12, v12, 0, 8u);
  }
  id result = _UIGraphicsGetImageFromCurrentImageContext(0);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_imageWithBrightnessModifiedForLegibilityStyle:(int64_t)a3
{
  [+[UIScreen mainScreen] scale];
  double v6 = v5;
  double v7 = self;
  if (a3 != 2)
  {
    double v8 = (void *)[MEMORY[0x1E4F1E040] filterWithName:@"CIWhitePointAdjust"];
    BOOL v9 = +[UIColor colorWithWhite:0.92 alpha:1.0];
    objc_msgSend(v8, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1E008], "colorWithCGColor:", -[UIColor CGColor](v9, "CGColor")), @"inputColor");
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F1E050]) initWithImage:self];
    [v8 setValue:v10 forKey:*MEMORY[0x1E4F1E480]];
    double v7 = +[UIImage imageWithCIImage:scale:orientation:](UIImage, "imageWithCIImage:scale:orientation:", [v8 valueForKey:*MEMORY[0x1E4F1E520]], 0, v6);
  }
  if (v7)
  {
    if ([(UIImage *)self CGImage])
    {
      CGBitmapInfo v11 = CGImageGetBitmapInfo([(UIImage *)self CGImage]) & 0x1F;
      uint64_t v12 = v11 - 5 < 2 || v11 == 0;
    }
    else
    {
      uint64_t v12 = 0;
    }
    [(UIImage *)self size];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__UIImage__UILegibility___imageWithBrightnessModifiedForLegibilityStyle___block_invoke;
    v16[3] = &unk_1E52EBA80;
    v16[4] = v7;
    v16[5] = self;
    return _UIGraphicsDrawIntoImageContextWithMoreOptions(v12, 0, v16, v13, v14, v6);
  }
  return self;
}

uint64_t __73__UIImage__UILegibility___imageWithBrightnessModifiedForLegibilityStyle___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) size];
  double v4 = v3;
  [*(id *)(a1 + 40) size];
  return objc_msgSend(v2, "drawInRect:", 0.0, 0.0, v4, v5);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  if (qword_1EB262128 != -1) {
    dispatch_once(&qword_1EB262128, &__block_literal_global_412);
  }
  double v2 = (void *)qword_1EB262120;
  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v8 allowUndeclared:1];
  id v10 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.image" allowUndeclared:1];
  if ([v9 conformsToType:v10])
  {
    CGBitmapInfo v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v7 error:0];
    uint64_t v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v11 finishDecoding];
  }
  else
  {
    id v13 = v9;
    if (qword_1EB262128 != -1) {
      dispatch_once(&qword_1EB262128, &__block_literal_global_412);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v14 = (id)_MergedGlobals_1177;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(v13, "conformsToType:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20))
          {

            uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithData:v7];
            goto LABEL_15;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = 0;
  }
LABEL_15:
  id v18 = v12;

  return v18;
}

- (UIImage)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UIImage *)self init];
  CGBitmapInfo v11 = [(id)objc_opt_class() objectWithItemProviderData:v9 typeIdentifier:v8 error:a5];

  uint64_t v12 = v11;
  return v12;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"com.apple.uikit.image";
  double v2 = [(id)*MEMORY[0x1E4F443E0] identifier];
  v7[1] = v2;
  double v3 = [(id)*MEMORY[0x1E4F44460] identifier];
  v7[2] = v3;
  double v4 = [(id)*MEMORY[0x1E4F44410] identifier];
  v7[3] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

  return (NSArray *)v5;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isEqualToString:@"com.apple.uikit.image"])
  {
    uint64_t v8 = +[_UIInterprocessKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
LABEL_7:
    id v13 = (void *)v8;
    v7[2](v7, v8, 0);
    goto LABEL_8;
  }
  id v9 = [(id)*MEMORY[0x1E4F44460] identifier];
  int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    uint64_t v8 = UIImagePNGRepresentation(self);
    goto LABEL_7;
  }
  CGBitmapInfo v11 = [(id)*MEMORY[0x1E4F44410] identifier];
  int v12 = [v6 isEqualToString:v11];

  if (v12)
  {
    uint64_t v8 = _UIImageJPEGRepresentation(self, 0, 0.8);
    goto LABEL_7;
  }
  uint64_t v15 = [(id)*MEMORY[0x1E4F443E0] identifier];
  int v16 = [v6 isEqualToString:v15];

  if (!v16)
  {
    v7[2](v7, 0, 0);
    goto LABEL_9;
  }
  id v13 = UIImageHEICRepresentation(self);
  v7[2](v7, (uint64_t)v13, 0);
LABEL_8:

LABEL_9:
  return 0;
}

- (BOOL)isFromStatusBarImageProvider
{
  return objc_opt_isKindOfClass() & 1;
}

@end