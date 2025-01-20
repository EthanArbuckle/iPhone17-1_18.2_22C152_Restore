@interface OBTextBulletedList
- (double)bulletedListItemSpacing;
- (id)bulletImage;
- (void)addItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5;
@end

@implementation OBTextBulletedList

- (void)addItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [OBTextBulletedListItem alloc];
  v12 = [(OBTextBulletedList *)self bulletImage];
  v13 = [(OBTextBulletedListItem *)v11 initWithTitle:v10 description:v9 image:v12 accessoryButton:v8];

  [(OBTextBulletedListItem *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(OBBulletedList *)self addBulletedListItem:v13];
}

- (double)bulletedListItemSpacing
{
  return 16.0;
}

- (id)bulletImage
{
  v7.width = 8.0;
  v7.height = 8.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  v2 = [MEMORY[0x1E4FB1618] grayColor];
  [v2 setFill];

  v3 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, 8.0, 8.0);
  [v3 fill];
  v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
}

@end