@interface _UIContextMenuLoadingCell
+ (Class)_contentViewClass;
@end

@implementation _UIContextMenuLoadingCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end