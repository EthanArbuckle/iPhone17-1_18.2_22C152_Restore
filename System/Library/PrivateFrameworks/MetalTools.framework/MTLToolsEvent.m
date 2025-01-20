@interface MTLToolsEvent
- (BOOL)enableBarrier;
- (BOOL)supportsRollback;
- (MTLDevice)device;
- (NSString)label;
- (void)setEnableBarrier:(BOOL)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsEvent

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (NSString)label
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 label];
}

- (void)setLabel:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setLabel:a3];
}

- (BOOL)enableBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 enableBarrier];
}

- (void)setEnableBarrier:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setEnableBarrier:v3];
}

- (BOOL)supportsRollback
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRollback];
}

@end