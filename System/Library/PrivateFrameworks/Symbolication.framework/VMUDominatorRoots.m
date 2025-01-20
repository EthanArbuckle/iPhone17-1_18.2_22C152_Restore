@interface VMUDominatorRoots
- (VMUDominatorRoots)initWithDominatorGraph:(id)a3;
- (id)nextObject;
@end

@implementation VMUDominatorRoots

- (VMUDominatorRoots)initWithDominatorGraph:(id)a3
{
  self->_i = 0;
  objc_storeStrong((id *)&self->_dg, a3);
  return self;
}

- (id)nextObject
{
  unsigned int v3 = [(VMUDominatorGraph *)self->_dg nodeNamespaceSize];
  v4 = [(VMUDominatorGraph *)self->_dg dominators];
  v5 = [(VMUDominatorGraph *)self->_dg firstDominates];
  uint64_t i = self->_i;
  if (v3 <= i)
  {
LABEL_6:
    v8 = 0;
    self->_uint64_t i = v3;
  }
  else
  {
    int v7 = v3 - i;
    while (v4[i] != -1 || v5[i] == -1)
    {
      ++i;
      if (!--v7) {
        goto LABEL_6;
      }
    }
    self->_uint64_t i = i + 1;
    v8 = [NSNumber numberWithUnsignedInt:];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end