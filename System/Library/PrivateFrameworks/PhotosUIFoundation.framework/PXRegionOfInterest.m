@interface PXRegionOfInterest
+ (CGRect)convertedImageContentsRectOfRegionOfInterest:(id)a3 toCoordinateSpace:(id)a4 fittingSize:(CGSize)a5 flipped:(BOOL)a6;
- (BOOL)isRepresentingPlaceholderContent;
- (CGRect)imageContentsRect;
- (CGRect)uncroppedImageFrameInCoordinateSpace:(id)a3;
- (NSArray)containingScrollViews;
- (NSString)subtitle;
- (NSString)title;
- (PXAnonymousView)trackingContainerView;
- (PXRegionOfInterest)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (PXRegionOfInterestImage)imageRequester;
- (PXTitleSubtitleLabelSpec)textViewSpec;
- (PXViewSpec)imageViewSpec;
- (id)copyWithRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)placeholderViewFactory;
- (id)trackingContainerViewFactory;
- (void)_copyPropertiesTo:(id)a3;
- (void)setContainingScrollViews:(id)a3;
- (void)setImageContentsRect:(CGRect)a3;
- (void)setImageRequester:(id)a3;
- (void)setImageViewSpec:(id)a3;
- (void)setIsRepresentingPlaceholderContent:(BOOL)a3;
- (void)setPlaceholderViewFactory:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextViewSpec:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrackingContainerViewFactory:(id)a3;
@end

@implementation PXRegionOfInterest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trackingContainerViewFactory, 0);
  objc_storeStrong(&self->_placeholderViewFactory, 0);
  objc_storeStrong((id *)&self->_textViewSpec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageViewSpec, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);

  objc_storeStrong((id *)&self->_scrollViews, 0);
}

- (void)setIsRepresentingPlaceholderContent:(BOOL)a3
{
  self->_isRepresentingPlaceholderContent = a3;
}

- (BOOL)isRepresentingPlaceholderContent
{
  return self->_isRepresentingPlaceholderContent;
}

- (void)setTrackingContainerViewFactory:(id)a3
{
}

- (id)trackingContainerViewFactory
{
  return self->_trackingContainerViewFactory;
}

- (void)setPlaceholderViewFactory:(id)a3
{
}

- (id)placeholderViewFactory
{
  return self->_placeholderViewFactory;
}

- (void)setTextViewSpec:(id)a3
{
}

- (PXTitleSubtitleLabelSpec)textViewSpec
{
  return self->_textViewSpec;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImageViewSpec:(id)a3
{
}

- (PXViewSpec)imageViewSpec
{
  return self->_imageViewSpec;
}

- (void)setImageContentsRect:(CGRect)a3
{
  self->_imageContentsRect = a3;
}

- (CGRect)imageContentsRect
{
  double x = self->_imageContentsRect.origin.x;
  double y = self->_imageContentsRect.origin.y;
  double width = self->_imageContentsRect.size.width;
  double height = self->_imageContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageRequester:(id)a3
{
}

- (PXRegionOfInterestImage)imageRequester
{
  return self->_imageRequester;
}

- (NSArray)containingScrollViews
{
  return [(NSPointerArray *)self->_scrollViews allObjects];
}

- (void)setContainingScrollViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  scrollViews = self->_scrollViews;
  self->_scrollViews = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[NSPointerArray addPointer:](self->_scrollViews, "addPointer:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_copyPropertiesTo:(id)a3
{
  objc_storeStrong((id *)a3 + 10, self->_imageRequester);
  long long v14 = (char *)a3;
  CGSize size = self->_imageContentsRect.size;
  *(CGPoint *)(v14 + 136) = self->_imageContentsRect.origin;
  *(CGSize *)(v14 + 152) = size;
  uint64_t v6 = [(PXViewSpec *)self->_imageViewSpec copy];
  id v7 = (void *)*((void *)v14 + 11);
  *((void *)v14 + 11) = v6;

  objc_storeStrong((id *)v14 + 12, self->_title);
  objc_storeStrong((id *)v14 + 13, self->_subtitle);
  uint64_t v8 = [(PXTitleSubtitleLabelSpec *)self->_textViewSpec copy];
  uint64_t v9 = (void *)*((void *)v14 + 14);
  *((void *)v14 + 14) = v8;

  uint64_t v10 = _Block_copy(self->_placeholderViewFactory);
  uint64_t v11 = (void *)*((void *)v14 + 15);
  *((void *)v14 + 15) = v10;

  long long v12 = _Block_copy(self->_trackingContainerViewFactory);
  long long v13 = (void *)*((void *)v14 + 16);
  *((void *)v14 + 16) = v12;

  v14[72] = self->_isRepresentingPlaceholderContent;
  objc_storeStrong((id *)v14 + 8, self->_scrollViews);
}

- (id)copyWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRect:inCoordinateSpace:", v9, x, y, width, height);

  [(PXRegionOfInterest *)self _copyPropertiesTo:v10];
  return v10;
}

- (PXAnonymousView)trackingContainerView
{
  v3 = [(PXRegionOfInterest *)self trackingContainerViewFactory];
  if (v3)
  {
    id v4 = [(PXRegionOfInterest *)self trackingContainerViewFactory];
    v5 = ((void (**)(void, PXRegionOfInterest *))v4)[2](v4, self);
  }
  else
  {
    v5 = 0;
  }

  return (PXAnonymousView *)v5;
}

- (CGRect)uncroppedImageFrameInCoordinateSpace:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(PXDisplayRect *)self rectInCoordinateSpace:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PXRegionOfInterest *)self imageContentsRect];
  double v15 = v14;
  double v17 = v16;
  double v18 = v12;
  double v19 = v13;
  if (v12 == 0.0
    || v13 == 0.0
    || (v12 == INFINITY ? (BOOL v20 = v13 == INFINITY) : (BOOL v20 = 0),
        v20 || !CGFloatIsValid() || (CGFloatIsValid() & 1) == 0))
  {
    v21 = PXAssertGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v30.origin.double x = v15;
      v30.origin.double y = v17;
      v30.size.double width = v18;
      v30.size.double height = v19;
      v26 = NSStringFromCGRect(v30);
      int v27 = 138412290;
      v28 = v26;
      _os_log_error_impl(&dword_259CDA000, v21, OS_LOG_TYPE_ERROR, "Contents rect size is invalid %@", (uint8_t *)&v27, 0xCu);
    }
    double v18 = 1.0;
    double v15 = 0.0;
    double v17 = 0.0;
    double v19 = 1.0;
  }
  double v22 = v9 / v18;
  double v23 = v11 / v19;
  double v24 = v5 - v9 / v18 * v15;
  double v25 = v7 - v11 / v19 * v17;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXRegionOfInterest;
  id v4 = [(PXDisplayRect *)&v6 copyWithZone:a3];
  [(PXRegionOfInterest *)self _copyPropertiesTo:v4];
  return v4;
}

- (PXRegionOfInterest)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXRegionOfInterest;
  CGRect result = -[PXDisplayRect initWithRect:inCoordinateSpace:](&v5, sel_initWithRect_inCoordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_imageContentsRect.origin = (CGPoint)PXRectUnit;
    result->_imageContentsRect.CGSize size = (CGSize)unk_259D74B60;
  }
  return result;
}

+ (CGRect)convertedImageContentsRectOfRegionOfInterest:(id)a3 toCoordinateSpace:(id)a4 fittingSize:(CGSize)a5 flipped:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    [v10 imageContentsRect];
    double x = v22.origin.x;
    double y = v22.origin.y;
    double v14 = v22.size.width;
    double v15 = v22.size.height;
    v24.origin.double x = 0.0;
    v24.origin.double y = 0.0;
    v24.size.double width = 1.0;
    v24.size.double height = 1.0;
    if (CGRectEqualToRect(v22, v24))
    {
      [v10 rectInCoordinateSpace:v11];
      double v15 = 0.0;
      PFSizeWithAspectRatioFittingSize();
      double x = width * 0.5 + 0.0 + v16 * -0.5;
      double v14 = 0.0;
      if (width != 0.0)
      {
        double x = x / width;
        double v14 = v16 / width;
      }
      double y = height * 0.5 + 0.0 + v17 * -0.5;
      if (height != 0.0)
      {
        double y = y / height;
        double v15 = v17 / height;
      }
    }
    if (v6) {
      double y = 1.0 - (y + v15);
    }
  }
  else
  {
    double y = 0.0;
    double v15 = 1.0;
    double v14 = 1.0;
    double x = 0.0;
  }

  double v18 = x;
  double v19 = y;
  double v20 = v14;
  double v21 = v15;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

@end