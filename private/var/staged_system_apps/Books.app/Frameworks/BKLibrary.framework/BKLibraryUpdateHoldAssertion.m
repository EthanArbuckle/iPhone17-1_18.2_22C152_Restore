@interface BKLibraryUpdateHoldAssertion
- (BKLibraryUpdateHoldAssertion)initWithRelease:(id)a3;
- (id)releaseBlock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKLibraryUpdateHoldAssertion

- (BKLibraryUpdateHoldAssertion)initWithRelease:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryUpdateHoldAssertion;
  v5 = [(BKLibraryUpdateHoldAssertion *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id releaseBlock = v5->_releaseBlock;
    v5->_id releaseBlock = v6;
  }
  return v5;
}

- (void)dealloc
{
  [(BKLibraryUpdateHoldAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryUpdateHoldAssertion;
  [(BKLibraryUpdateHoldAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id v4 = (void (**)(void))objc_retainBlock(self->_releaseBlock);
  if (v4) {
    v4[2]();
  }
  id releaseBlock = self->_releaseBlock;
  self->_id releaseBlock = 0;
}

- (id)releaseBlock
{
  return self->_releaseBlock;
}

- (void).cxx_destruct
{
}

@end