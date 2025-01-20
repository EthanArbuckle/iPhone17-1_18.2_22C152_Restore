@interface ICSearchAttachmentResultsCollectionViewCell
+ (CGSize)itemSize;
- (BOOL)highlightSelection;
- (BOOL)isAccessibilityElement;
- (ICAttachmentBrickView)attachmentBrickView;
- (ICSearchAttachmentResultsCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3 searchResult:(id)a4;
- (void)setAttachmentBrickView:(id)a3;
- (void)setHighlightSelection:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateTextAndStatus;
- (void)updateThumbnail;
@end

@implementation ICSearchAttachmentResultsCollectionViewCell

- (ICSearchAttachmentResultsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  v3 = -[ICSearchAttachmentResultsCollectionViewCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (ICAttachmentBrickView *)[objc_alloc((Class)ICAttachmentBrickView) initWithType:1];
    attachmentBrickView = v3->_attachmentBrickView;
    v3->_attachmentBrickView = v4;

    v6 = [(ICSearchAttachmentResultsCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_attachmentBrickView];

    [(ICAttachmentBrickView *)v3->_attachmentBrickView ic_addAnchorsToFillSuperview];
    [(ICSearchAttachmentResultsCollectionViewCell *)v3 setAutomaticallyUpdatesBackgroundConfiguration:0];
    v7 = +[UIBackgroundConfiguration clearConfiguration];
    [(ICSearchAttachmentResultsCollectionViewCell *)v3 setBackgroundConfiguration:v7];

    [(ICSearchAttachmentResultsCollectionViewCell *)v3 setFocusEffect:0];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  -[ICSearchAttachmentResultsCollectionViewCell setSelected:](&v6, "setSelected:");
  if ([(ICSearchAttachmentResultsCollectionViewCell *)self highlightSelection])
  {
    v5 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
    [v5 setSelected:v3];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ICSearchAttachmentResultsCollectionViewCell;
  [(ICSearchAttachmentResultsCollectionViewCell *)&v4 prepareForReuse];
  BOOL v3 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v3 prepareForReuse];
}

+ (CGSize)itemSize
{
  +[ICAttachmentBrickView defaultBrickSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setAttachment:(id)a3 searchResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v8 setAttachment:v7];

  id v10 = [v6 highlightPatternRegexFinder];

  objc_super v9 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v9 setHighlightPatternRegexFinder:v10];
}

- (void)updateTextAndStatus
{
  id v2 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v2 reloadData];
}

- (void)updateThumbnail
{
  id v2 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v2 reloadData];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if ([(ICSearchAttachmentResultsCollectionViewCell *)self isFocused]
    && ![(ICSearchAttachmentResultsCollectionViewCell *)self highlightSelection])
  {
    id v7 = +[UIColor ICTintColor];
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
    id v7 = 0;
  }
  id v6 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  [v6 setHighlightColor:v7];

  if (v5)
  {
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  double v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v2 = [(ICSearchAttachmentResultsCollectionViewCell *)self attachmentBrickView];
  double v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityDragSourceDescriptors
{
  return 0;
}

- (id)accessibilityDropPointDescriptors
{
  return 0;
}

- (BOOL)highlightSelection
{
  return self->_highlightSelection;
}

- (void)setHighlightSelection:(BOOL)a3
{
  self->_highlightSelection = a3;
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end