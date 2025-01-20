@interface MTLToolsFence
- (MTLDevice)device;
- (NSString)label;
- (void)setLabel:(id)a3;
@end

@implementation MTLToolsFence

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

@end