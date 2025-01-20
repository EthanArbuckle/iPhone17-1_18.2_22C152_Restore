@interface UICollectionViewCell(VideosUI)
+ (id)makePrototypeCellWithFrame:()VideosUI;
@end

@implementation UICollectionViewCell(VideosUI)

+ (id)makePrototypeCellWithFrame:()VideosUI
{
  id v8 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v8, "setFrame:", a1, a2, a3, a4);
  return v8;
}

@end