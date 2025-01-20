@interface _UISearchBarAppearanceStorage
- (NSValue)searchFieldPositionAdjustment;
- (UIImage)scopeBarBackgroundImage;
- (UIImage)separatorImage;
- (id)imageForIcon:(int64_t)a3 state:(unint64_t)a4;
- (id)searchFieldBackgroundImageForState:(unint64_t)a3;
- (void)setImage:(id)a3 forIcon:(int64_t)a4 state:(unint64_t)a5;
- (void)setScopeBarBackgroundImage:(id)a3;
- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4;
- (void)setSearchFieldPositionAdjustment:(id)a3;
- (void)setSeparatorImage:(id)a3;
@end

@implementation _UISearchBarAppearanceStorage

- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  searchFieldBackgroundImages = self->searchFieldBackgroundImages;
  id v11 = v6;
  if (v6)
  {
    if (!searchFieldBackgroundImages)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->searchFieldBackgroundImages;
      self->searchFieldBackgroundImages = v8;

      searchFieldBackgroundImages = self->searchFieldBackgroundImages;
    }
    v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)searchFieldBackgroundImages setObject:v11 forKey:v10];
  }
  else
  {
    if (!searchFieldBackgroundImages) {
      goto LABEL_8;
    }
    v10 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)searchFieldBackgroundImages removeObjectForKey:v10];
  }

LABEL_8:
}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  searchFieldBackgroundImages = self->searchFieldBackgroundImages;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)searchFieldBackgroundImages objectForKey:v4];

  return v5;
}

- (void)setImage:(id)a3 forIcon:(int64_t)a4 state:(unint64_t)a5
{
  id v8 = a3;
  iconImages = self->iconImages;
  id v14 = v8;
  if (v8)
  {
    if (!iconImages)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v11 = self->iconImages;
      self->iconImages = v10;
    }
    goto LABEL_5;
  }
  if (iconImages)
  {
LABEL_5:
    v12 = [NSNumber numberWithInteger:a5 + 100 * a4];
    v13 = self->iconImages;
    if (v14) {
      [(NSMutableDictionary *)v13 setObject:v14 forKey:v12];
    }
    else {
      [(NSMutableDictionary *)v13 removeObjectForKey:v12];
    }
  }
}

- (id)imageForIcon:(int64_t)a3 state:(unint64_t)a4
{
  iconImages = self->iconImages;
  int64_t v7 = 100 * a3;
  id v8 = [NSNumber numberWithInteger:100 * a3 + a4];
  v9 = [(NSMutableDictionary *)iconImages objectForKey:v8];

  if (a4 == 1 && !v9)
  {
    v10 = self->iconImages;
    id v11 = [NSNumber numberWithInteger:v7];
    v9 = [(NSMutableDictionary *)v10 objectForKey:v11];
  }
  return v9;
}

- (NSValue)searchFieldPositionAdjustment
{
  return self->searchFieldPositionAdjustment;
}

- (void)setSearchFieldPositionAdjustment:(id)a3
{
}

- (UIImage)separatorImage
{
  return self->separatorImage;
}

- (void)setSeparatorImage:(id)a3
{
}

- (UIImage)scopeBarBackgroundImage
{
  return self->scopeBarBackgroundImage;
}

- (void)setScopeBarBackgroundImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->scopeBarBackgroundImage, 0);
  objc_storeStrong((id *)&self->separatorImage, 0);
  objc_storeStrong((id *)&self->iconImages, 0);
  objc_storeStrong((id *)&self->searchFieldPositionAdjustment, 0);
  objc_storeStrong((id *)&self->searchFieldBackgroundImages, 0);
}

@end