@interface VUIListFloatingCollectionViewCell
- (BOOL)_descendantsShouldHighlight;
- (id)vuiContentView;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
@end

@implementation VUIListFloatingCollectionViewCell

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (id)vuiContentView
{
  v4.receiver = self;
  v4.super_class = (Class)VUIListFloatingCollectionViewCell;
  v2 = [(VUIBaseCollectionViewCell *)&v4 vuiContentView];
  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIListFloatingCollectionViewCell;
  id v4 = a3;
  [(VUIBaseCollectionViewCell *)&v8 setBackgroundColor:v4];
  v5 = [(VUIListFloatingCollectionViewCell *)self backgroundView];

  if (!v5)
  {
    v6 = objc_opt_new();
    [(VUIListFloatingCollectionViewCell *)self setBackgroundView:v6];
  }
  v7 = [(VUIListFloatingCollectionViewCell *)self backgroundView];
  [v7 setBackgroundColor:v4];
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIListFloatingCollectionViewCell;
  id v4 = a3;
  [(VUIBaseCollectionViewCell *)&v8 setHighlightedBackgroundColor:v4];
  v5 = [(VUIListFloatingCollectionViewCell *)self selectedBackgroundView];

  if (!v5)
  {
    v6 = objc_opt_new();
    [(VUIListFloatingCollectionViewCell *)self setSelectedBackgroundView:v6];
  }
  v7 = [(VUIListFloatingCollectionViewCell *)self selectedBackgroundView];
  [v7 setBackgroundColor:v4];
}

@end