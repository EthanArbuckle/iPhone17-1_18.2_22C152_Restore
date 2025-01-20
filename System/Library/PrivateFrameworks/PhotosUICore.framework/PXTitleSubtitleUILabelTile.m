@interface PXTitleSubtitleUILabelTile
- (BOOL)rendersTextAsynchronously;
- (NSString)subtitle;
- (NSString)title;
- (PXTitleSubtitleLabelSpec)labelSpec;
- (PXTitleSubtitleUILabelTile)init;
- (UIView)view;
- (double)lastBaseline;
- (int64_t)_animationCount;
- (void)_setAnimationCount:(int64_t)a3;
- (void)_updateLabelTitleAndSubtitle;
- (void)becomeReusable;
- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)performBatchUpdates:(id)a3;
- (void)prepareForReuse;
- (void)setRendersTextAsynchronously:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
@end

@implementation PXTitleSubtitleUILabelTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelSpec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (BOOL)rendersTextAsynchronously
{
  return self->_rendersTextAsynchronously;
}

- (PXTitleSubtitleLabelSpec)labelSpec
{
  return self->_labelSpec;
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

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  int64_t v6 = [(PXTitleSubtitleUILabelTile *)self _animationCount] - 1;
  [(PXTitleSubtitleUILabelTile *)self _setAnimationCount:v6];
}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  int64_t v6 = [(PXTitleSubtitleUILabelTile *)self _animationCount] + 1;
  [(PXTitleSubtitleUILabelTile *)self _setAnimationCount:v6];
}

- (void)prepareForReuse
{
  id v2 = [(PXTitleSubtitleUILabelTile *)self view];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  [(PXTitleSubtitleUILabelTile *)self setTitle:0];
  [(PXTitleSubtitleUILabelTile *)self setSubtitle:0];
  id v3 = [(PXTitleSubtitleUILabelTile *)self view];
  [v3 setHidden:1];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  view = self->_view;
  label = self->_label;
  id v7 = a4;
  [(UIView *)view bounds];
  -[PXTitleSubtitleUILabel setFrame:](label, "setFrame:");
  v8 = [v7 viewSpec];

  [(PXTitleSubtitleUILabel *)self->_label setSpec:v8];
  labelSpec = self->_labelSpec;
  self->_labelSpec = v8;

  [(PXTitleSubtitleUILabelTile *)self _updateLabelTitleAndSubtitle];
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    v5 = self->_view;
    self->_view = v4;

    [(UIView *)self->_view setUserInteractionEnabled:0];
    int64_t v6 = objc_alloc_init(PXTitleSubtitleUILabel);
    label = self->_label;
    self->_label = v6;

    [(PXTitleSubtitleUILabel *)self->_label setRendersTextAsynchronously:[(PXTitleSubtitleUILabelTile *)self rendersTextAsynchronously]];
    [(PXTitleSubtitleUILabel *)self->_label setUserInteractionEnabled:0];
    [(UIView *)self->_view addSubview:self->_label];
    view = self->_view;
  }
  return view;
}

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    [(PXTitleSubtitleUILabel *)self->_label setShouldRasterizeTextLayer:a3 > 0];
  }
}

- (void)_updateLabelTitleAndSubtitle
{
  id v4 = [(PXTitleSubtitleUILabelTile *)self title];
  id v3 = [(PXTitleSubtitleUILabelTile *)self subtitle];
  [(PXTitleSubtitleUILabel *)self->_label setTitleText:v4];
  [(PXTitleSubtitleUILabel *)self->_label setSubtitleText:v3];
}

- (double)lastBaseline
{
  [(PXTitleSubtitleUILabel *)self->_label lastBaseline];
  return result;
}

- (void)setRendersTextAsynchronously:(BOOL)a3
{
  if (self->_rendersTextAsynchronously != a3)
  {
    self->_rendersTextAsynchronously = a3;
    -[PXTitleSubtitleUILabel setRendersTextAsynchronously:](self->_label, "setRendersTextAsynchronously:");
  }
}

- (void)performBatchUpdates:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  [(PXTitleSubtitleUILabelTile *)self _updateLabelTitleAndSubtitle];
}

- (PXTitleSubtitleUILabelTile)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabelTile;
  double result = [(PXTitleSubtitleUILabelTile *)&v3 init];
  if (result) {
    result->_rendersTextAsynchronously = 1;
  }
  return result;
}

@end