@interface BKAppLaunchBlock
- (BKAppLaunchBlock)init;
- (NSString)blockID;
- (id)block;
- (id)description;
- (unint64_t)conditionMask;
- (unint64_t)flags;
- (void)setBlock:(id)a3;
- (void)setBlockID:(id)a3;
- (void)setConditionMask:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
@end

@implementation BKAppLaunchBlock

- (id)block
{
  return self->_block;
}

- (unint64_t)conditionMask
{
  return self->_conditionMask;
}

- (NSString)blockID
{
  return self->_blockID;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setConditionMask:(unint64_t)a3
{
  self->_conditionMask = a3;
}

- (void)setBlockID:(id)a3
{
}

- (void)setBlock:(id)a3
{
}

- (BKAppLaunchBlock)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKAppLaunchBlock;
  v2 = [(BKAppLaunchBlock *)&v7 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    blockID = v2->_blockID;
    v2->_blockID = (NSString *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockID, 0);

  objc_storeStrong(&self->_block, 0);
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  unint64_t conditionMask = self->_conditionMask;
  id v6 = objc_retainBlock(self->_block);
  objc_super v7 = +[NSString stringWithFormat:@"<%@ %p c=%lx b=%@ id=%@>", v4, self, conditionMask, v6, self->_blockID];

  return v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end