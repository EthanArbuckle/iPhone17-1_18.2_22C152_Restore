@interface _BasicTwoLinesContentViewModel
- (BOOL)allowsSubtitleWrapping;
- (BOOL)hasVibrantBackground;
- (BOOL)imageCreationCanBeCached;
- (BOOL)isDisabled;
- (BOOL)shouldCenterImage;
- (BOOL)shouldEnableGrayscaleHighlighting;
- (BOOL)showBadgeView;
- (BOOL)subtitleUsesMonospacedNumbers;
- (CGSize)imageSize;
- (GEOObserverHashTable)observers;
- (GEOPublisher)publisher;
- (NSArray)cellAccessories;
- (NSArray)subtitleHighlightRanges;
- (NSArray)titleHighlightRanges;
- (NSAttributedString)attributedSubtitleText;
- (NSString)axIdentifier;
- (NSString)debugString;
- (NSString)subtitleText;
- (NSString)titleText;
- (PlaceContextViewModel)placeContextViewModel;
- (UIColor)leadingImageBackgroundColor;
- (UIColor)leftImageTintColor;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UIFont)titleTextFont;
- (UIView)customAccessoryView;
- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5;
- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 imageCreationBlock:(id)a5;
- (id)imageCreationBlock;
- (id)personalizedItemForQuickActionMenuCreator;
- (unint64_t)imageShadowStyle;
- (unint64_t)imageStyle;
- (void)dealloc;
- (void)fetchImageForScreenScale:(double)a3 withCompletionHandler:(id)a4;
- (void)invalidateCachedImage;
- (void)setAllowsSubtitleWrapping:(BOOL)a3;
- (void)setAttributedSubtitleText:(id)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setCellAccessories:(id)a3;
- (void)setCustomAccessoryView:(id)a3;
- (void)setDebugString:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setImageCreationBlock:(id)a3;
- (void)setImageCreationCanBeCached:(BOOL)a3;
- (void)setImageShadowStyle:(unint64_t)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageStyle:(unint64_t)a3;
- (void)setLeadingImageBackgroundColor:(id)a3;
- (void)setLeftImageTintColor:(id)a3;
- (void)setPersonalizedItemForQuickActionMenuCreator:(id)a3;
- (void)setPlaceContextViewModel:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setShouldCenterImage:(BOOL)a3;
- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3;
- (void)setShowBadgeView:(BOOL)a3;
- (void)setSubtitleHighlightRanges:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubtitleUsesMonospacedNumbers:(BOOL)a3;
- (void)setTitleHighlightRanges:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTitleTextFont:(id)a3;
- (void)setVibrantBackground:(BOOL)a3;
- (void)updateObservers;
@end

@implementation _BasicTwoLinesContentViewModel

- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BasicTwoLinesContentViewModel;
  v11 = [(_BasicTwoLinesContentViewModel *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    titleText = v11->_titleText;
    v11->_titleText = v12;

    v14 = (NSString *)[v9 copy];
    subtitleText = v11->_subtitleText;
    v11->_subtitleText = v14;

    id v16 = [v10 copy];
    id imageCreationBlock = v11->_imageCreationBlock;
    v11->_id imageCreationBlock = v16;
  }
  return v11;
}

- (_BasicTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 imageCreationBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A117C0;
  v11[3] = &unk_101314570;
  id v12 = a5;
  id v8 = v12;
  id v9 = [(_BasicTwoLinesContentViewModel *)self initWithTitleText:a3 subtitleText:a4 cancelableImageCreationBlock:v11];

  return v9;
}

- (void)dealloc
{
  id cancelImageCreation = self->_cancelImageCreation;
  if (cancelImageCreation)
  {
    v4 = (void (**)(void))objc_retainBlock(cancelImageCreation);
    id v5 = self->_cancelImageCreation;
    self->_id cancelImageCreation = 0;

    id pendingImageCreationCompletionBlock = self->_pendingImageCreationCompletionBlock;
    self->_id pendingImageCreationCompletionBlock = 0;

    v4[2](v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)_BasicTwoLinesContentViewModel;
  [(_BasicTwoLinesContentViewModel *)&v7 dealloc];
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___TwoLinesContentViewModelObserver queue:0];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)updateObservers
{
}

- (void)setImageCreationCanBeCached:(BOOL)a3
{
  if (self->_imageCreationCanBeCached != a3)
  {
    self->_imageCreationCanBeCached = a3;
    if (!a3) {
      [(_BasicTwoLinesContentViewModel *)self invalidateCachedImage];
    }
  }
}

- (void)invalidateCachedImage
{
  cachedImage = self->_cachedImage;
  if (cachedImage)
  {
    self->_cachedImage = 0;

    self->_cachedImageAllowsClipping = 0;
    [(_BasicTwoLinesContentViewModel *)self updateObservers];
  }
}

- (void)fetchImageForScreenScale:(double)a3 withCompletionHandler:(id)a4
{
  v6 = (void (**)(id, UIImage *, BOOL))a4;
  if (v6)
  {
    if ([(_BasicTwoLinesContentViewModel *)self imageCreationCanBeCached]
      && (cachedImage = self->_cachedImage) != 0)
    {
      v6[2](v6, cachedImage, self->_cachedImageAllowsClipping);
    }
    else
    {
      id v8 = [(_BasicTwoLinesContentViewModel *)self imageCreationBlock];

      if (v8)
      {
        if ([(_BasicTwoLinesContentViewModel *)self imageCreationCanBeCached]
          && (id v9 = self->_pendingImageCreationCompletionBlock) != 0)
        {
          id v10 = objc_retainBlock(v9);
          id v11 = [v6 copy];
          id pendingImageCreationCompletionBlock = self->_pendingImageCreationCompletionBlock;
          self->_id pendingImageCreationCompletionBlock = v11;

          (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
        }
        else
        {
          id cancelImageCreation = self->_cancelImageCreation;
          if (cancelImageCreation)
          {
            v14 = (void (**)(void))objc_retainBlock(cancelImageCreation);
            id v15 = self->_cancelImageCreation;
            self->_id cancelImageCreation = 0;

            v14[2](v14);
          }
          if ([(_BasicTwoLinesContentViewModel *)self imageCreationCanBeCached])
          {
            id v16 = [v6 copy];
            id v17 = self->_pendingImageCreationCompletionBlock;
            self->_id pendingImageCreationCompletionBlock = v16;
          }
          objc_initWeak(&location, self);
          v18 = [(_BasicTwoLinesContentViewModel *)self imageCreationBlock];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100A11B5C;
          v21[3] = &unk_101314598;
          objc_copyWeak(&v23, &location);
          v21[4] = self;
          v22 = v6;
          objc_super v19 = ((void (**)(void, void *, double))v18)[2](v18, v21, a3);
          id v20 = self->_cancelImageCreation;
          self->_id cancelImageCreation = v19;

          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);
        }
      }
    }
  }
}

- (UIView)customAccessoryView
{
  return self->_customAccessoryView;
}

- (void)setCustomAccessoryView:(id)a3
{
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (void)setPlaceContextViewModel:(id)a3
{
}

- (BOOL)hasVibrantBackground
{
  return self->_vibrantBackground;
}

- (void)setVibrantBackground:(BOOL)a3
{
  self->_vibrantBackground = a3;
}

- (GEOPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSAttributedString)attributedSubtitleText
{
  return self->_attributedSubtitleText;
}

- (void)setAttributedSubtitleText:(id)a3
{
}

- (UIColor)leadingImageBackgroundColor
{
  return self->_leadingImageBackgroundColor;
}

- (void)setLeadingImageBackgroundColor:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
}

- (NSArray)titleHighlightRanges
{
  return self->_titleHighlightRanges;
}

- (void)setTitleHighlightRanges:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
}

- (NSArray)subtitleHighlightRanges
{
  return self->_subtitleHighlightRanges;
}

- (void)setSubtitleHighlightRanges:(id)a3
{
}

- (BOOL)showBadgeView
{
  return self->_showBadgeView;
}

- (void)setShowBadgeView:(BOOL)a3
{
  self->_showBadgeView = a3;
}

- (BOOL)allowsSubtitleWrapping
{
  return self->_allowsSubtitleWrapping;
}

- (void)setAllowsSubtitleWrapping:(BOOL)a3
{
  self->_allowsSubtitleWrapping = a3;
}

- (BOOL)subtitleUsesMonospacedNumbers
{
  return self->_subtitleUsesMonospacedNumbers;
}

- (void)setSubtitleUsesMonospacedNumbers:(BOOL)a3
{
  self->_subtitleUsesMonospacedNumbers = a3;
}

- (id)personalizedItemForQuickActionMenuCreator
{
  return self->_personalizedItemForQuickActionMenuCreator;
}

- (void)setPersonalizedItemForQuickActionMenuCreator:(id)a3
{
}

- (NSString)debugString
{
  return self->_debugString;
}

- (void)setDebugString:(id)a3
{
}

- (unint64_t)imageStyle
{
  return self->_imageStyle;
}

- (void)setImageStyle:(unint64_t)a3
{
  self->_imageStyle = a3;
}

- (unint64_t)imageShadowStyle
{
  return self->_imageShadowStyle;
}

- (void)setImageShadowStyle:(unint64_t)a3
{
  self->_imageShadowStyle = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)shouldCenterImage
{
  return self->_shouldCenterImage;
}

- (void)setShouldCenterImage:(BOOL)a3
{
  self->_shouldCenterImage = a3;
}

- (id)imageCreationBlock
{
  return self->_imageCreationBlock;
}

- (void)setImageCreationBlock:(id)a3
{
}

- (BOOL)imageCreationCanBeCached
{
  return self->_imageCreationCanBeCached;
}

- (UIColor)leftImageTintColor
{
  return self->_leftImageTintColor;
}

- (void)setLeftImageTintColor:(id)a3
{
}

- (NSArray)cellAccessories
{
  return self->_cellAccessories;
}

- (void)setCellAccessories:(id)a3
{
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3
{
  self->_shouldEnableGrayscaleHighlighting = a3;
}

- (UIFont)titleTextFont
{
  return self->_titleTextFont;
}

- (void)setTitleTextFont:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_titleTextFont, 0);
  objc_storeStrong((id *)&self->_cellAccessories, 0);
  objc_storeStrong((id *)&self->_leftImageTintColor, 0);
  objc_storeStrong(&self->_imageCreationBlock, 0);
  objc_storeStrong((id *)&self->_debugString, 0);
  objc_storeStrong(&self->_personalizedItemForQuickActionMenuCreator, 0);
  objc_storeStrong((id *)&self->_subtitleHighlightRanges, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleHighlightRanges, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_leadingImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_attributedSubtitleText, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_storeStrong((id *)&self->_customAccessoryView, 0);
  objc_storeStrong(&self->_pendingImageCreationCompletionBlock, 0);
  objc_storeStrong(&self->_cancelImageCreation, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end