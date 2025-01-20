@interface VMUDirectDominees
- (VMUDirectDominees)initWithDominatorGraph:(id)a3 rootNode:(unsigned int)a4;
- (id)nextObject;
@end

@implementation VMUDirectDominees

- (VMUDirectDominees)initWithDominatorGraph:(id)a3 rootNode:(unsigned int)a4
{
  v6 = (VMUDominatorGraph *)a3;
  self->_node = [(VMUDominatorGraph *)v6 firstDominates][4 * a4];
  dg = self->_dg;
  self->_dg = v6;

  return self;
}

- (id)nextObject
{
  if (self->_node == -1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSNumber numberWithUnsignedInt:];
    self->_node = [(VMUDominatorGraph *)self->_dg nextDominates][4 * self->_node];
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end