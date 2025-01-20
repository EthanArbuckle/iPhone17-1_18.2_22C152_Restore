@interface _UIOLAGapGuide
- (id)followingItem;
- (unint64_t)followingItemIndex;
- (void)setFollowingItem:(id)a3;
- (void)setFollowingItemIndex:(unint64_t)a3;
@end

@implementation _UIOLAGapGuide

- (void)setFollowingItemIndex:(unint64_t)a3
{
  self->_followingItemIndex = a3;
}

- (void)setFollowingItem:(id)a3
{
  self->_followingItem = a3;
}

- (unint64_t)followingItemIndex
{
  return self->_followingItemIndex;
}

- (id)followingItem
{
  return self->_followingItem;
}

@end