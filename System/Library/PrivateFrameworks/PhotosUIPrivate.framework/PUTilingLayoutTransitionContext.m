@interface PUTilingLayoutTransitionContext
- (BOOL)isCancelingTransition;
- (BOOL)isUpdatingDisplayedContent;
- (BOOL)isViewControllerTransition;
- (OS_dispatch_group)displayedContentUpdateGroup;
- (void)setCancelingTransition:(BOOL)a3;
- (void)setDisplayedContentUpdateGroup:(id)a3;
- (void)setIsUpdatingDisplayedContent:(BOOL)a3;
- (void)setIsViewControllerTransition:(BOOL)a3;
@end

@implementation PUTilingLayoutTransitionContext

- (void).cxx_destruct
{
}

- (void)setDisplayedContentUpdateGroup:(id)a3
{
}

- (OS_dispatch_group)displayedContentUpdateGroup
{
  return self->_displayedContentUpdateGroup;
}

- (void)setIsUpdatingDisplayedContent:(BOOL)a3
{
  self->_isUpdatingDisplayedContent = a3;
}

- (BOOL)isUpdatingDisplayedContent
{
  return self->_isUpdatingDisplayedContent;
}

- (void)setIsViewControllerTransition:(BOOL)a3
{
  self->_isViewControllerTransition = a3;
}

- (BOOL)isViewControllerTransition
{
  return self->_isViewControllerTransition;
}

- (void)setCancelingTransition:(BOOL)a3
{
  self->_isCancelingTransition = a3;
}

- (BOOL)isCancelingTransition
{
  return self->_isCancelingTransition;
}

@end