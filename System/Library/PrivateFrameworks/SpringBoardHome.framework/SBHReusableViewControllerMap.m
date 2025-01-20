@interface SBHReusableViewControllerMap
- (BOOL)isViewControllerRecycled:(id)a3;
- (SBHReusableViewControllerMap)init;
- (id)dequeueReusableViewController;
- (unint64_t)maximumRecycledViewControllerCount;
- (unint64_t)recycledViewControllerCount;
- (void)purgeAllViewControllers;
- (void)purgeViewController:(id)a3;
- (void)recycleViewController:(id)a3;
- (void)setMaximumRecycledViewControllerCount:(unint64_t)a3;
@end

@implementation SBHReusableViewControllerMap

- (SBHReusableViewControllerMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHReusableViewControllerMap;
  v2 = [(SBHReusableViewControllerMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    recycledViewControllers = v2->_recycledViewControllers;
    v2->_recycledViewControllers = v3;

    v2->_maximumRecycledViewControllerCount = 10;
  }
  return v2;
}

- (id)dequeueReusableViewController
{
  v3 = [(NSMutableSet *)self->_recycledViewControllers anyObject];
  if (v3) {
    [(NSMutableSet *)self->_recycledViewControllers removeObject:v3];
  }
  return v3;
}

- (void)recycleViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBHReusableViewControllerMap *)self recycledViewControllerCount];
  if (v5 < [(SBHReusableViewControllerMap *)self maximumRecycledViewControllerCount])
  {
    objc_super v6 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SBHReusableViewControllerMap_recycleViewController___block_invoke;
    v8[3] = &unk_1E6AAC810;
    id v7 = v4;
    id v9 = v7;
    [v6 performWithoutAnimation:v8];
    [v7 removeFromParentViewController];
    [(NSMutableSet *)self->_recycledViewControllers addObject:v7];
  }
}

uint64_t __54__SBHReusableViewControllerMap_recycleViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForReuse];
}

- (BOOL)isViewControllerRecycled:(id)a3
{
  return [(NSMutableSet *)self->_recycledViewControllers containsObject:a3];
}

- (void)purgeAllViewControllers
{
}

- (void)purgeViewController:(id)a3
{
}

- (unint64_t)recycledViewControllerCount
{
  return [(NSMutableSet *)self->_recycledViewControllers count];
}

- (unint64_t)maximumRecycledViewControllerCount
{
  return self->_maximumRecycledViewControllerCount;
}

- (void)setMaximumRecycledViewControllerCount:(unint64_t)a3
{
  self->_maximumRecycledViewControllerCount = a3;
}

- (void).cxx_destruct
{
}

@end