@interface OBTextBulletedListItem
- (BOOL)shouldLayoutVertically;
- (OBTextBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 accessoryButton:(id)a6;
- (double)imageSizeForImage:(id)a3;
- (double)leadingMargins;
- (double)trailingMargins;
@end

@implementation OBTextBulletedListItem

- (OBTextBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 accessoryButton:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)OBTextBulletedListItem;
  return [(OBBulletedListItem *)&v7 initWithTitle:a3 description:a4 image:a5 tintColor:0 linkButton:a6];
}

- (double)imageSizeForImage:(id)a3
{
  [a3 size];
  return v3;
}

- (BOOL)shouldLayoutVertically
{
  return 0;
}

- (double)leadingMargins
{
  return 10.0;
}

- (double)trailingMargins
{
  return 0.0;
}

@end