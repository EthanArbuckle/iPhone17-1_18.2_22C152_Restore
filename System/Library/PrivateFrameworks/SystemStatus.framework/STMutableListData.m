@interface STMutableListData
- (BOOL)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addObject:(id)a3;
- (void)removeAllOccurrencesOfObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)setObjects:(id)a3;
@end

@implementation STMutableListData

- (void)setObjects:(id)a3
{
  id v8 = a3;
  if (([(NSMutableArray *)self->super._objects isEqual:v8] & 1) == 0)
  {
    v4 = (void *)[v8 mutableCopy];
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
    }
    objects = self->super._objects;
    self->super._objects = v6;
  }

  MEMORY[0x1F41817F8]();
}

- (void)addObject:(id)a3
{
}

- (void)removeObject:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->super._objects indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    objects = self->super._objects;
    [(NSMutableArray *)objects removeObjectAtIndex:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[STListData allocWithZone:a3];

  return -[STListData initWithListData:](v4, self);
}

- (void)removeAllOccurrencesOfObject:(id)a3
{
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableListData:self];
  }

  return isKindOfClass & 1;
}

@end