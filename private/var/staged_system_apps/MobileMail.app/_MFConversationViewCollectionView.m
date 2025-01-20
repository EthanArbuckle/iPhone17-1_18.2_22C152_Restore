@interface _MFConversationViewCollectionView
- (NSDirectionalEdgeInsets)_updateLayoutMarginsForFrame:(CGRect)a3;
- (NSDirectionalEdgeInsets)updateLayoutMargins;
- (void)setFrame:(CGRect)a3;
@end

@implementation _MFConversationViewCollectionView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_MFConversationViewCollectionView *)self frame];
  double v8 = CGRectGetWidth(v12);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  double v9 = v8 - CGRectGetWidth(v13);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= 2.22044605e-16)
  {
    -[_MFConversationViewCollectionView _updateLayoutMarginsForFrame:](self, "_updateLayoutMarginsForFrame:", x, y, width, height);
    v10 = [(_MFConversationViewCollectionView *)self collectionViewLayout];
    [v10 invalidateLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)_MFConversationViewCollectionView;
  -[_MFConversationViewCollectionView setFrame:](&v11, "setFrame:", x, y, width, height);
  [(_MFConversationViewCollectionView *)self setAccessibilityIdentifier:MSAccessibilityIdentifierMailConversationViewCollection];
}

- (NSDirectionalEdgeInsets)_updateLayoutMarginsForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_MFConversationViewCollectionView *)self delegate];
  [v8 layoutMarginsForCollectionViewFrame:x, y, width, height];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(_MFConversationViewCollectionView *)self directionalLayoutMargins];
  if (v12 != v20 || v10 != v17 || v16 != v19 || v14 != v18)
  {
    -[_MFConversationViewCollectionView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v10, v12, v14, v16);
    [v8 collectionViewMarginsDidChange:v10, v12, v14, v16];
  }

  double v24 = v10;
  double v25 = v12;
  double v26 = v14;
  double v27 = v16;
  result.trailing = v27;
  result.bottom = v26;
  result.leading = v25;
  result.top = v24;
  return result;
}

- (NSDirectionalEdgeInsets)updateLayoutMargins
{
  [(_MFConversationViewCollectionView *)self frame];

  [(_MFConversationViewCollectionView *)self _updateLayoutMarginsForFrame:"_updateLayoutMarginsForFrame:"];
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

@end