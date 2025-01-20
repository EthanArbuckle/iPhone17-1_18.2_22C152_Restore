@interface _UICollectionViewListAccessoryControl
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)accessoryBackgroundColor;
- (UIColor)accessoryTintColor;
- (UITableConstants)constants;
- (_UICollectionViewListAccessoryControl)initWithType:(int64_t)a3 constants:(id)a4;
- (id)_renderedImage;
- (id)actionHandler;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)type;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_executeActionHandler;
- (void)_setNeedsImageViewUpdate;
- (void)_updateImageViewIfNeeded;
- (void)layoutSubviews;
- (void)setAccessoryBackgroundColor:(id)a3;
- (void)setAccessoryTintColor:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setConstants:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UICollectionViewListAccessoryControl

- (void)setConstants:(id)a3
{
  v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
    v5 = v6;
  }
}

- (void)setAccessoryTintColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
    v5 = v6;
  }
}

- (void)setAccessoryBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_accessoryBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryBackgroundColor, a3);
    [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
    v5 = v6;
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIControl *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)_UICollectionViewListAccessoryControl;
  [(UIControl *)&v6 setSelected:v3];
  if (v5 != v3) {
    [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
  }
}

- (_UICollectionViewListAccessoryControl)initWithType:(int64_t)a3 constants:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListAccessoryControl;
  v8 = -[UIControl initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setOpaque:0];
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_constants, a4);
    v9->_needsImageViewUpdate = 1;
    v10 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    v11 = +[UITraitCollection systemTraitsAffectingImageLookup];
    v12 = [v10 arrayByAddingObjectsFromArray:v11];

    id v13 = [(UIView *)v9 registerForTraitChanges:v12 withAction:sel__setNeedsImageViewUpdate];
  }

  return v9;
}

- (void)setActionHandler:(id)a3
{
  id actionHandler = self->_actionHandler;
  objc_super v6 = (void *)[a3 copy];
  id v7 = self->_actionHandler;
  self->_id actionHandler = v6;

  if (!a3 || actionHandler)
  {
    if (!a3 && actionHandler)
    {
      [(UIControl *)self removeTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
    }
  }
  else
  {
    [(UIControl *)self addTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
  }
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)_executeActionHandler
{
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewListAccessoryControl;
  [(UIControl *)&v4 setHighlighted:a3];
  [(_UICollectionViewListAccessoryControl *)self _setNeedsImageViewUpdate];
}

- (void)_setNeedsImageViewUpdate
{
  self->_needsImageViewUpdate = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)_updateImageViewIfNeeded
{
  if (self->_needsImageViewUpdate)
  {
    self->_needsImageViewUpdate = 0;
    if (!self->_imageView)
    {
      BOOL v3 = objc_alloc_init(UIImageView);
      imageView = self->_imageView;
      self->_imageView = v3;

      [(UIView *)self addSubview:self->_imageView];
    }
    switch(self->_type)
    {
      case 0:
        uint64_t v5 = [(UITableConstants *)self->_constants defaultDeleteImageWithTintColor:self->_accessoryTintColor backgroundColor:self->_accessoryBackgroundColor];
        goto LABEL_11;
      case 1:
        uint64_t v5 = [(UITableConstants *)self->_constants defaultInsertImageWithTintColor:self->_accessoryTintColor backgroundColor:self->_accessoryBackgroundColor];
LABEL_11:
        id v17 = (id)v5;
        break;
      case 2:
        BOOL v6 = [(UIControl *)self isSelected];
        constants = self->_constants;
        v8 = [(UIView *)self traitCollection];
        accessoryTintColor = self->_accessoryTintColor;
        if (v6) {
          [(UITableConstants *)constants defaultMultiSelectSelectedImageForCellStyle:0 traitCollection:v8 checkmarkColor:accessoryTintColor backgroundColor:self->_accessoryBackgroundColor];
        }
        else {
        id v17 = [(UITableConstants *)constants defaultMultiSelectNotSelectedImageForCellStyle:0 traitCollection:v8 accessoryBaseColor:accessoryTintColor];
        }

        break;
      case 3:
        v10 = [(UITableConstants *)self->_constants defaultDetailAccessoryImage];
        v11 = self->_accessoryTintColor;
        id v17 = v10;
        if (v11)
        {
          uint64_t v12 = [v10 imageWithTintColor:v11 renderingMode:1];

          id v17 = (id)v12;
        }
        break;
      default:
        id v17 = 0;
        break;
    }
    id v13 = self->_constants;
    v14 = [(UIView *)self traitCollection];
    if (self->_type >= 4uLL) {
      int64_t type = 4;
    }
    else {
      int64_t type = self->_type;
    }
    v16 = [(UITableConstants *)v13 defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:v14 accessoryType:type];
    [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v16];

    [(UIImageView *)self->_imageView setImage:v17];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_UICollectionViewListAccessoryControl *)self _updateImageViewIfNeeded];
  objc_super v4 = [(UIImageView *)self->_imageView _currentImage];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewListAccessoryControl;
  [(UIView *)&v12 layoutSubviews];
  [(_UICollectionViewListAccessoryControl *)self _updateImageViewIfNeeded];
  BOOL v3 = [(UIImageView *)self->_imageView _currentImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  [(UIView *)self bounds];
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v9 + v8 * 0.5, v11 + v10 * 0.5);
}

- (id)viewForFirstBaselineLayout
{
  [(_UICollectionViewListAccessoryControl *)self _updateImageViewIfNeeded];
  imageView = self->_imageView;
  return imageView;
}

- (id)viewForLastBaselineLayout
{
  [(_UICollectionViewListAccessoryControl *)self _updateImageViewIfNeeded];
  imageView = self->_imageView;
  return imageView;
}

- (id)_renderedImage
{
  [(_UICollectionViewListAccessoryControl *)self _updateImageViewIfNeeded];
  imageView = self->_imageView;
  return [(UIImageView *)imageView _currentImage];
}

- (int64_t)type
{
  return self->_type;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end