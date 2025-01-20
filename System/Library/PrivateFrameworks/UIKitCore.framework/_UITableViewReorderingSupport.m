@interface _UITableViewReorderingSupport
@end

@implementation _UITableViewReorderingSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomShadowView, 0);
  objc_storeStrong((id *)&self->_topShadowView, 0);
  objc_storeStrong((id *)&self->_autoscrollTimer, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderedCell, 0);
}

@end