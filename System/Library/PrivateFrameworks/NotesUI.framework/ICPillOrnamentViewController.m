@interface ICPillOrnamentViewController
- (BOOL)isShowing;
- (CGPoint)contentAnchorPoint;
- (CGPoint)offset;
- (CGPoint)sceneAnchorPoint;
- (ICPillOrnamentViewController)initWithRootViewController:(id)a3 contentAnchorPoint:(CGPoint)a4 sceneAnchorPoint:(CGPoint)a5 offset:(CGPoint)a6 cornerRadius:(double)a7;
- (UIView)contentView;
- (UIViewController)rootViewController;
- (double)cornerRadius;
- (void)loadView;
- (void)setContentAnchorPoint:(CGPoint)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setRootViewController:(id)a3;
- (void)setSceneAnchorPoint:(CGPoint)a3;
@end

@implementation ICPillOrnamentViewController

- (ICPillOrnamentViewController)initWithRootViewController:(id)a3 contentAnchorPoint:(CGPoint)a4 sceneAnchorPoint:(CGPoint)a5 offset:(CGPoint)a6 cornerRadius:(double)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v10 = a5.y;
  CGFloat v11 = a5.x;
  CGFloat v12 = a4.y;
  CGFloat v13 = a4.x;
  id v16 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICPillOrnamentViewController;
  v17 = [(ICPillOrnamentViewController *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootViewController, a3);
    v18->_contentAnchorPoint.CGFloat x = v13;
    v18->_contentAnchorPoint.CGFloat y = v12;
    v18->_sceneAnchorPoint.CGFloat x = v11;
    v18->_sceneAnchorPoint.CGFloat y = v10;
    v18->_offset.CGFloat x = x;
    v18->_offset.CGFloat y = y;
    v18->_cornerRadius = a7;
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v18->_contentView;
    v18->_contentView = v19;
  }
  return v18;
}

- (void)loadView
{
  id v3 = [(ICPillOrnamentViewController *)self contentView];
  [(ICPillOrnamentViewController *)self setView:v3];
}

- (BOOL)isShowing
{
  return 0;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICPillOrnamentViewController;
  -[ICPillOrnamentViewController setPreferredContentSize:](&v3, sel_setPreferredContentSize_, a3.width, a3.height);
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CGPoint)contentAnchorPoint
{
  double x = self->_contentAnchorPoint.x;
  double y = self->_contentAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentAnchorPoint:(CGPoint)a3
{
  self->_contentAnchorPoint = a3;
}

- (CGPoint)sceneAnchorPoint
{
  double x = self->_sceneAnchorPoint.x;
  double y = self->_sceneAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSceneAnchorPoint:(CGPoint)a3
{
  self->_sceneAnchorPoint = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end