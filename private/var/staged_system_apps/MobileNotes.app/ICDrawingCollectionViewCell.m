@interface ICDrawingCollectionViewCell
- (BOOL)canBecomeFirstResponder;
- (ICDrawingCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)computedThumbnailLayout;
- (void)respondToLongPressGesture:(id)a3;
- (void)setAttachment:(id)a3;
@end

@implementation ICDrawingCollectionViewCell

- (ICDrawingCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [objc_alloc((Class)ICDrawingInlineView) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  v9 = [v8 layer];
  [v9 setAnchorPoint:0.5, 0.5];

  [v8 setThumbnailDisplay:1];
  [v8 setEditable:0];
  [v8 setHideLoadingProgress:1];
  v14.receiver = self;
  v14.super_class = (Class)ICDrawingCollectionViewCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithThumbnailView:frame:](&v14, "initWithThumbnailView:frame:", v8, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(ICDrawingCollectionViewCell *)v10 setClipsToBounds:1];
    id v12 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v11 action:"respondToLongPressGesture:"];
    [(ICDrawingCollectionViewCell *)v11 addGestureRecognizer:v12];
  }
  return v11;
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  v5 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
  [v5 setAttachment:v4];

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingCollectionViewCell;
  [(ICImagesAndMoviesBaseCell *)&v6 setAttachment:v4];
}

- (unint64_t)computedThumbnailLayout
{
  if (![(ICImagesAndMoviesBaseCell *)self thumbnailLayout]) {
    return 1;
  }

  return [(ICImagesAndMoviesBaseCell *)self thumbnailLayout];
}

- (void)respondToLongPressGesture:(id)a3
{
  id v7 = a3;
  id v4 = +[UIMenuController sharedMenuController];
  if (([v4 isMenuVisible] & 1) == 0)
  {
    [(ICDrawingCollectionViewCell *)self becomeFirstResponder];
    v5 = [v7 view];
    objc_super v6 = [v7 view];
    [v6 bounds];
    [v4 showMenuFromView:v5];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"sketch" value:&stru_10063F3D8 table:0];

  id v7 = [(ICBrowseAttachmentsBaseCell *)self itemNumberAccessibilityString];
  v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  id v4 = [v3 title];
  id v5 = [v4 length];

  objc_super v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  id v7 = v6;
  if (v5) {
    [v6 title];
  }
  else {
  id v8 = [v6 modificationDateForSpeaking];
  }

  return v8;
}

@end