@interface MRMCBlockAction
+ (id)blockActionWithBlock:(id)a3;
- (MRMCBlockAction)initWithImprint:(id)a3;
- (id)block;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setBlock:(id)a3;
@end

@implementation MRMCBlockAction

+ (id)blockActionWithBlock:(id)a3
{
  v4 = objc_alloc_init(MRMCBlockAction);
  [(MRMCBlockAction *)v4 setBlock:a3];
  return v4;
}

- (MRMCBlockAction)initWithImprint:(id)a3
{
  return 0;
}

- (void)demolish
{
  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRMCBlockAction;
  [(MCAction *)&v3 demolish];
}

- (id)imprint
{
  return 0;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRMCBlockAction;
  -[MCAction _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  id block = self->_block;
  if (block) {
    *((void *)a3 + 3) = block;
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MRMCBlockAction;
  return objc_msgSend(-[MCAction description](&v3, "description"), "stringByAppendingFormat:", @"\n\tblock='%@'", self->_block);
}

- (id)block
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setBlock:(id)a3
{
}

@end