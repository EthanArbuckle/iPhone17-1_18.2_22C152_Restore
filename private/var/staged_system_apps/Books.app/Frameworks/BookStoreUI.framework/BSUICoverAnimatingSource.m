@interface BSUICoverAnimatingSource
+ (id)renderReferenceMatchingQuery:(id)a3 inFeedViewController:(id)a4;
- (BOOL)coverAnimationSourceUseLargeCover;
- (BSUICoverAnimatingSource)initWithFeedViewController:(id)a3 query:(id)a4 audioBookControlQuery:(id)a5;
- (CGRect)coverAnimationSourceFrame;
- (TUIFeedViewController)feedViewController;
- (TUIRenderReferenceOverride)overrideForHiding;
- (TUIRenderReferenceOverride)overrideForHidingAudioControl;
- (TUIRenderReferenceQuery)query;
- (TUIRenderReferenceTransform)transformForSourceFrame;
- (id)coverAnimationSourceImage;
- (id)coverAnimationSourceReferenceView;
- (id)coverAnimationSourceView;
- (id)renderReferenceTransform;
- (int64_t)coverAnimationSourceAlignment;
- (void)coverAnimationSourceFinalize;
- (void)coverAnimationSourceInvalidateFrame;
- (void)coverAnimationSourcePrepare;
- (void)setFeedViewController:(id)a3;
- (void)setOverrideForHiding:(id)a3;
- (void)setOverrideForHidingAudioControl:(id)a3;
- (void)setQuery:(id)a3;
- (void)setTransformForSourceFrame:(id)a3;
@end

@implementation BSUICoverAnimatingSource

+ (id)renderReferenceMatchingQuery:(id)a3 inFeedViewController:(id)a4
{
  v4 = [a4 renderReferencesMatchingQuery:a3];
  v5 = [v4 allKeys];
  v6 = [v5 firstObject];

  return v6;
}

- (BSUICoverAnimatingSource)initWithFeedViewController:(id)a3 query:(id)a4 audioBookControlQuery:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BSUICoverAnimatingSource;
  v12 = [(BSUICoverAnimatingSource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feedViewController, a3);
    objc_storeStrong((id *)&v13->_query, a4);
    uint64_t v14 = +[TUIRenderReferenceOverride overrideWithQuery:v10 alpha:0.0];
    overrideForHiding = v13->_overrideForHiding;
    v13->_overrideForHiding = (TUIRenderReferenceOverride *)v14;

    uint64_t v16 = +[TUIRenderReferenceOverride overrideWithQuery:v11 alpha:0.0];
    overrideForHidingAudioControl = v13->_overrideForHidingAudioControl;
    v13->_overrideForHidingAudioControl = (TUIRenderReferenceOverride *)v16;
  }
  return v13;
}

- (void)coverAnimationSourceInvalidateFrame
{
}

- (int64_t)coverAnimationSourceAlignment
{
  return 2;
}

- (id)renderReferenceTransform
{
  v3 = [(BSUICoverAnimatingSource *)self feedViewController];
  v4 = [(BSUICoverAnimatingSource *)self query];
  v5 = [v3 renderReferencesMatchingQuery:v4];

  v6 = [v5 allKeys];
  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:v7];
    id v9 = [v8 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (CGRect)coverAnimationSourceFrame
{
  v3 = [(BSUICoverAnimatingSource *)self transformForSourceFrame];

  if (!v3)
  {
    v4 = [(BSUICoverAnimatingSource *)self renderReferenceTransform];
    [(BSUICoverAnimatingSource *)self setTransformForSourceFrame:v4];
  }
  v5 = [(BSUICoverAnimatingSource *)self transformForSourceFrame];
  v6 = v5;
  if (v5)
  {
    [v5 center];
    [v6 size];
    CGRectMakeWithCenterAndSize();
    CGFloat x = v7;
    CGFloat y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)coverAnimationSourceReferenceView
{
  v2 = [(BSUICoverAnimatingSource *)self feedViewController];
  v3 = [v2 view];

  return v3;
}

- (id)coverAnimationSourceImage
{
  return 0;
}

- (id)coverAnimationSourceView
{
  v3 = [(BSUICoverAnimatingSource *)self renderReferenceTransform];
  v4 = [(BSUICoverAnimatingSource *)self feedViewController];
  v5 = [v3 renderModel];
  v6 = [v5 identifier];
  double v7 = [v4 descendentViewWithIdentifier:v6];

  return v7;
}

- (BOOL)coverAnimationSourceUseLargeCover
{
  return 0;
}

- (void)coverAnimationSourcePrepare
{
  v3 = [(BSUICoverAnimatingSource *)self feedViewController];
  v4 = [(BSUICoverAnimatingSource *)self overrideForHiding];
  [v3 addRenderOverride:v4];

  id v6 = [(BSUICoverAnimatingSource *)self feedViewController];
  v5 = [(BSUICoverAnimatingSource *)self overrideForHidingAudioControl];
  [v6 addRenderOverride:v5];
}

- (void)coverAnimationSourceFinalize
{
  v3 = [(BSUICoverAnimatingSource *)self feedViewController];
  v4 = [(BSUICoverAnimatingSource *)self overrideForHiding];
  [v3 removeRenderOverride:v4];

  v5 = [(BSUICoverAnimatingSource *)self feedViewController];
  id v6 = [(BSUICoverAnimatingSource *)self overrideForHidingAudioControl];
  [v5 removeRenderOverride:v6];

  id v8 = [(BSUICoverAnimatingSource *)self feedViewController];
  double v7 = [v8 view];
  [v7 layoutIfNeeded];
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (TUIFeedViewController)feedViewController
{
  return self->_feedViewController;
}

- (void)setFeedViewController:(id)a3
{
}

- (TUIRenderReferenceTransform)transformForSourceFrame
{
  return self->_transformForSourceFrame;
}

- (void)setTransformForSourceFrame:(id)a3
{
}

- (TUIRenderReferenceOverride)overrideForHiding
{
  return self->_overrideForHiding;
}

- (void)setOverrideForHiding:(id)a3
{
}

- (TUIRenderReferenceOverride)overrideForHidingAudioControl
{
  return self->_overrideForHidingAudioControl;
}

- (void)setOverrideForHidingAudioControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideForHidingAudioControl, 0);
  objc_storeStrong((id *)&self->_overrideForHiding, 0);
  objc_storeStrong((id *)&self->_transformForSourceFrame, 0);
  objc_storeStrong((id *)&self->_feedViewController, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end