@interface TUIFeedViewState
- (NSDictionary)embeddedScrollAnchors;
- (TUIFeedViewState)initWithOther:(id)a3;
- (TUIScrollAnchor)feedScrollAnchor;
- (id)embeddedScrollAnchorForIdentifier:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setEmbeddedScrollAnchors:(id)a3;
- (void)setFeedScrollAnchor:(id)a3;
@end

@implementation TUIFeedViewState

- (TUIFeedViewState)initWithOther:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIFeedViewState;
  v5 = [(TUIFeedViewState *)&v13 init];
  if (v5)
  {
    v6 = [v4 feedScrollAnchor];
    v7 = (TUIScrollAnchor *)[v6 copy];
    feedScrollAnchor = v5->_feedScrollAnchor;
    v5->_feedScrollAnchor = v7;

    v9 = [v4 embeddedScrollAnchors];
    v10 = (NSDictionary *)[v9 copy];
    embeddedScrollAnchors = v5->_embeddedScrollAnchors;
    v5->_embeddedScrollAnchors = v10;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [TUIMutableFeedViewState alloc];

  return [(TUIMutableFeedViewState *)v4 initWithOther:self];
}

- (id)embeddedScrollAnchorForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKeyedSubscript:](self->_embeddedScrollAnchors, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (TUIScrollAnchor)feedScrollAnchor
{
  return self->_feedScrollAnchor;
}

- (void)setFeedScrollAnchor:(id)a3
{
}

- (NSDictionary)embeddedScrollAnchors
{
  return self->_embeddedScrollAnchors;
}

- (void)setEmbeddedScrollAnchors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedScrollAnchors, 0);

  objc_storeStrong((id *)&self->_feedScrollAnchor, 0);
}

@end