@interface BSUICardStackTransitioningCoverSource
+ (BOOL)isValidSourceWithFeedViewController:(id)a3 query:(id)a4;
- (BOOL)isInNonHorizontalLayout;
- (BSUICardStackTransitioningCoverSource)initWithFeedViewController:(id)a3 query:(id)a4 isInNonHorizontalLayout:(BOOL)a5;
- (CGRect)frame;
- (TUIFeedViewController)feedViewController;
- (TUIImageResource)imageResource;
- (TUIRenderReferenceOverride)overrideForHiding;
- (TUIRenderReferenceQuery)query;
- (UIImage)cardStackTransitioningCoverSourceImage;
- (UIImage)coverImage;
- (UIView)referenceView;
- (double)cardStackTransitioningCoverSourceExtraXOffset;
- (id)cardStackTransitioningCoverSourceHide;
- (id)cardStackTransitioningCoverSourceImageChangeObserverBlock;
- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3;
- (void)dealloc;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3;
- (void)setCardStackTransitioningCoverSourceImageChangeObserverBlock:(id)a3;
- (void)setCoverImage:(id)a3;
- (void)setFeedViewController:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImageResource:(id)a3;
- (void)setIsInNonHorizontalLayout:(BOOL)a3;
- (void)setOverrideForHiding:(id)a3;
- (void)setQuery:(id)a3;
- (void)setReferenceView:(id)a3;
@end

@implementation BSUICardStackTransitioningCoverSource

+ (BOOL)isValidSourceWithFeedViewController:(id)a3 query:(id)a4
{
  v4 = [a3 renderReferencesMatchingQuery:a4];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BSUICardStackTransitioningCoverSource)initWithFeedViewController:(id)a3 query:(id)a4 isInNonHorizontalLayout:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)BSUICardStackTransitioningCoverSource;
  v11 = [(BSUICardStackTransitioningCoverSource *)&v40 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feedViewController, a3);
    objc_storeStrong((id *)&v12->_query, a4);
    v12->_isInNonHorizontalLayout = a5;
    v13 = [v9 renderReferencesMatchingQuery:v10];
    v14 = [v13 allKeys];
    v15 = [v14 firstObject];

    if (v15
      && ([v13 objectForKeyedSubscript:v15],
          v16 = objc_claimAutoreleasedReturnValue(),
          [v16 firstObject],
          v17 = objc_claimAutoreleasedReturnValue(),
          v16,
          v17))
    {
      [v17 center];
      [v17 size];
      CGRectMakeWithCenterAndSize();
      v12->_frame.origin.x = v18;
      v12->_frame.origin.y = v19;
      v12->_frame.size.width = v20;
      v12->_frame.size.height = v21;
    }
    else
    {
      CGSize size = CGRectZero.size;
      v12->_frame.origin = CGRectZero.origin;
      v12->_frame.CGSize size = size;
    }
    uint64_t v23 = [v9 view];
    referenceView = v12->_referenceView;
    v12->_referenceView = (UIView *)v23;

    v25 = [(BSUICardStackTransitioningCoverSource *)v12 feedViewController];
    v26 = [v25 imageResourcesMatchingQuery:v10];

    v27 = [v13 allKeys];
    v28 = [v27 firstObject];

    if (v28)
    {
      v29 = [v26 objectForKeyedSubscript:v28];
      uint64_t v30 = [v29 anyObject];
      imageResource = v12->_imageResource;
      v12->_imageResource = (TUIImageResource *)v30;
    }
    else
    {
      v29 = v12->_imageResource;
      v12->_imageResource = 0;
    }

    [(TUIImageResource *)v12->_imageResource addObserver:v12];
    v32 = [(TUIImageResource *)v12->_imageResource imageContentWithOptions:1];
    v33 = [v32 image];
    id v34 = [v33 newImage];
    [v32 insets];
    uint64_t v35 = [v34 imageWithAlignmentRectInsets:];
    coverImage = v12->_coverImage;
    v12->_coverImage = (UIImage *)v35;

    if ([v13 count])
    {
      uint64_t v37 = +[TUIRenderReferenceOverride overrideWithQuery:v10 alpha:0.0];
      overrideForHiding = v12->_overrideForHiding;
      v12->_overrideForHiding = (TUIRenderReferenceOverride *)v37;
    }
  }

  return v12;
}

- (void)dealloc
{
  [(TUIImageResource *)self->_imageResource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BSUICardStackTransitioningCoverSource;
  [(BSUICardStackTransitioningCoverSource *)&v3 dealloc];
}

- (UIImage)cardStackTransitioningCoverSourceImage
{
  return [(BSUICardStackTransitioningCoverSource *)self coverImage];
}

- (id)cardStackTransitioningCoverSourceHide
{
  objc_super v3 = [(BSUICardStackTransitioningCoverSource *)self overrideForHiding];
  v4 = [(BSUICardStackTransitioningCoverSource *)self feedViewController];
  [v4 addRenderOverride:v3];

  BOOL v5 = [(BSUICardStackTransitioningCoverSource *)self feedViewController];
  objc_initWeak(&location, v5);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_58690;
  v9[3] = &unk_38E2A0;
  objc_copyWeak(&v11, &location);
  id v10 = v3;
  id v6 = v3;
  v7 = objc_retainBlock(v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)cardStackTransitioningCoverSourceReplaceReferenceView:(id)a3
{
  id v13 = a3;
  [(BSUICardStackTransitioningCoverSource *)self frame];
  if (!CGRectIsEmpty(v15))
  {
    [(BSUICardStackTransitioningCoverSource *)self frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(BSUICardStackTransitioningCoverSource *)self referenceView];
    [v13 convertRect:v12 fromView:v5];
    -[BSUICardStackTransitioningCoverSource setFrame:](self, "setFrame:");

    [(BSUICardStackTransitioningCoverSource *)self setReferenceView:v13];
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5883C;
  v4[3] = &unk_38E1F8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (id)cardStackTransitioningCoverSourceImageChangeObserverBlock
{
  return self->_cardStackTransitioningCoverSourceImageChangeObserverBlock;
}

- (void)setCardStackTransitioningCoverSourceImageChangeObserverBlock:(id)a3
{
}

- (double)cardStackTransitioningCoverSourceExtraXOffset
{
  return self->cardStackTransitioningCoverSourceExtraXOffset;
}

- (void)setCardStackTransitioningCoverSourceExtraXOffset:(double)a3
{
  self->cardStackTransitioningCoverSourceExtraXOffset = a3;
}

- (TUIFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIView)referenceView
{
  return self->_referenceView;
}

- (void)setReferenceView:(id)a3
{
}

- (TUIImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
}

- (UIImage)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
}

- (TUIRenderReferenceOverride)overrideForHiding
{
  return self->_overrideForHiding;
}

- (void)setOverrideForHiding:(id)a3
{
}

- (BOOL)isInNonHorizontalLayout
{
  return self->_isInNonHorizontalLayout;
}

- (void)setIsInNonHorizontalLayout:(BOOL)a3
{
  self->_isInNonHorizontalLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideForHiding, 0);
  objc_storeStrong((id *)&self->_coverImage, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);

  objc_storeStrong(&self->_cardStackTransitioningCoverSourceImageChangeObserverBlock, 0);
}

@end