@interface SXComponentBookmarkApplicator
- (SXComponentBookmarkApplicator)initWithScrollPositionRestoring:(id)a3;
- (SXScrollPositionRestoring)scrollPositionRestoring;
- (void)applyBookmark:(id)a3;
@end

@implementation SXComponentBookmarkApplicator

- (SXComponentBookmarkApplicator)initWithScrollPositionRestoring:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentBookmarkApplicator;
  v6 = [(SXComponentBookmarkApplicator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scrollPositionRestoring, a3);
  }

  return v7;
}

- (void)applyBookmark:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v9 componentIdentifier];

      if (v4)
      {
        id v5 = [SXComponentScrollPosition alloc];
        v6 = [v9 componentIdentifier];
        v7 = [(SXComponentScrollPosition *)v5 initWithComponentIdentifier:v6 canvasWidth:0.0 relativePageOffset:0.0];

        v8 = [(SXComponentBookmarkApplicator *)self scrollPositionRestoring];
        [v8 updateScrollPosition:v7 animated:0];
      }
    }
  }
}

- (SXScrollPositionRestoring)scrollPositionRestoring
{
  return self->_scrollPositionRestoring;
}

- (void).cxx_destruct
{
}

@end