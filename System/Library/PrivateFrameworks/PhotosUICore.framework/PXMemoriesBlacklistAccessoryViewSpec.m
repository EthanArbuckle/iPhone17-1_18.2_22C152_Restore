@interface PXMemoriesBlacklistAccessoryViewSpec
+ (PXMemoriesBlacklistAccessoryViewSpec)specWithFrame:(CGRect)a3;
- (CGRect)accessoryViewFrame;
- (CGRect)contentViewFrame;
- (PXMemoriesBlacklistAccessoryViewSpec)initWithContentViewFrame:(CGRect)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation PXMemoriesBlacklistAccessoryViewSpec

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (CGRect)accessoryViewFrame
{
  double x = self->_accessoryViewFrame.origin.x;
  double y = self->_accessoryViewFrame.origin.y;
  double width = self->_accessoryViewFrame.size.width;
  double height = self->_accessoryViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentViewFrame
{
  double x = self->_contentViewFrame.origin.x;
  double y = self->_contentViewFrame.origin.y;
  double width = self->_contentViewFrame.size.width;
  double height = self->_contentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXMemoriesBlacklistAccessoryViewSpec)initWithContentViewFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PXMemoriesBlacklistAccessoryViewSpec;
  CGRect result = [(PXMemoriesBlacklistAccessoryViewSpec *)&v8 init];
  if (result)
  {
    result->_contentViewFrame.origin.CGFloat x = x;
    result->_contentViewFrame.origin.CGFloat y = y;
    result->_contentViewFrame.size.CGFloat width = width;
    result->_contentViewFrame.size.CGFloat height = height;
    result->_accessoryViewFrame.origin = (CGPoint)kDefaultAccessoryViewRect;
    result->_accessoryViewFrame.size = (CGSize)unk_1AB35CA28;
    result->_type = 0;
  }
  return result;
}

+ (PXMemoriesBlacklistAccessoryViewSpec)specWithFrame:(CGRect)a3
{
  v3 = -[PXMemoriesBlacklistAccessoryViewSpec initWithContentViewFrame:]([PXMemoriesBlacklistAccessoryViewSpec alloc], "initWithContentViewFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

@end