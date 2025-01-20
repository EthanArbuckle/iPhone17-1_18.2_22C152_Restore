@interface RAPTwoLinesViewModelImpl
+ (id)viewModelFromMapItem:(id)a3;
+ (id)viewModelFromRAPMenuItem:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RAPTwoLinesViewModelImpl

+ (id)viewModelFromRAPMenuItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  v5 = [v3 image];
  [(RAPTwoLinesViewModelImpl *)v4 setImage:v5];

  v6 = [v3 localizedTitle];
  [(RAPTwoLinesViewModelImpl *)v4 setTitle:v6];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 localizedServerControlledDescription],
        v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 length],
        v7,
        v8))
  {
    uint64_t v9 = [v3 localizedServerControlledDescription];
  }
  else
  {
    uint64_t v9 = [v3 localizedDescription];
  }
  v10 = (void *)v9;
  [(RAPTwoLinesViewModelImpl *)v4 setSubtitle:v9];

  return v4;
}

+ (id)viewModelFromMapItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  v6 = +[MKIconManager imageForMapItem:forScale:](MKIconManager, "imageForMapItem:forScale:", v3);
  [(RAPTwoLinesViewModelImpl *)v4 setImage:v6];

  v7 = [v3 name];
  [(RAPTwoLinesViewModelImpl *)v4 setTitle:v7];

  id v8 = [v3 _shortAddress];

  [(RAPTwoLinesViewModelImpl *)v4 setSubtitle:v8];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end