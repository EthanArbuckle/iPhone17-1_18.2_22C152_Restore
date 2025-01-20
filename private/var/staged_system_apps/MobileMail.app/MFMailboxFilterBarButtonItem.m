@interface MFMailboxFilterBarButtonItem
- (BOOL)isFilterEnabled;
- (MFMailboxFilterBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4;
- (UIImage)notSelectedImage;
- (UIImage)selectedImage;
- (void)setFilterEnabled:(BOOL)a3;
- (void)setNotSelectedImage:(id)a3;
- (void)setSelectedImage:(id)a3;
@end

@implementation MFMailboxFilterBarButtonItem

- (MFMailboxFilterBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = +[UIImage systemImageNamed:MFImageGlyphFilterDisabled];
  notSelectedImage = self->_notSelectedImage;
  self->_notSelectedImage = v7;

  v9 = self->_notSelectedImage;
  v16.receiver = self;
  v16.super_class = (Class)MFMailboxFilterBarButtonItem;
  v10 = [(MFMailboxFilterBarButtonItem *)&v16 initWithImage:v9 style:0 target:v6 action:a4];
  if (v10)
  {
    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"TOGGLE_FILTERING" value:&stru_100619928 table:@"Main"];
    [(MFMailboxFilterBarButtonItem *)v10 setTitle:v12];

    uint64_t v13 = +[UIImage systemImageNamed:MFImageGlyphFilterEnabled];
    selectedImage = v10->_selectedImage;
    v10->_selectedImage = (UIImage *)v13;
  }
  return v10;
}

- (BOOL)isFilterEnabled
{
  return self->_filterEnabled;
}

- (void)setFilterEnabled:(BOOL)a3
{
  self->_filterEnabled = a3;
  if (a3) {
    [(MFMailboxFilterBarButtonItem *)self selectedImage];
  }
  else {
  id v4 = [(MFMailboxFilterBarButtonItem *)self notSelectedImage];
  }
  [(MFMailboxFilterBarButtonItem *)self setImage:v4];
}

- (UIImage)notSelectedImage
{
  return self->_notSelectedImage;
}

- (void)setNotSelectedImage:(id)a3
{
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);

  objc_storeStrong((id *)&self->_notSelectedImage, 0);
}

@end