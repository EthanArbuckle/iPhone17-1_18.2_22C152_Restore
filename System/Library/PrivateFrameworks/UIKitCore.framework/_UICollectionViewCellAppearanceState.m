@interface _UICollectionViewCellAppearanceState
- (_UICollectionViewCellAppearanceState)init;
- (id)description;
- (int)dragState;
- (void)setDragState:(int)a3;
- (void)setHasBeganCancelling:(BOOL)a3;
- (void)setHasLifted:(BOOL)a3;
@end

@implementation _UICollectionViewCellAppearanceState

- (_UICollectionViewCellAppearanceState)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UICollectionViewCellAppearanceState;
  result = [(_UICollectionViewCellAppearanceState *)&v3 init];
  if (result)
  {
    result->_dragState = 0;
    result->_prefersGhostedDraggedAppearance = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unsigned int v6 = [(_UICollectionViewCellAppearanceState *)self dragState];
  if (v6 > 8) {
    v7 = @"<unknown>";
  }
  else {
    v7 = off_1E52E6660[v6];
  }
  if (self)
  {
    int dragState = self->_dragState;
    switch(dragState)
    {
      case 1:
        v9 = @"lifting";
        goto LABEL_14;
      case 6:
        if (self->_prefersGhostedDraggedAppearance)
        {
LABEL_12:
          v9 = @"ghosted";
          goto LABEL_14;
        }
        break;
      case 3:
        if (!self->_prefersGhostedDraggedAppearance)
        {
          v9 = @"hidden";
          goto LABEL_14;
        }
        goto LABEL_12;
    }
  }
  v9 = @"normal";
LABEL_14:
  v10 = [v3 stringWithFormat:@"<%@:%p - int dragState = %@ appearance = %@>", v5, self, v7, v9];;

  return v10;
}

- (void)setHasLifted:(BOOL)a3
{
  self->_hasLifted = a3;
}

- (void)setHasBeganCancelling:(BOOL)a3
{
  self->_hasBeganCancelling = a3;
}

- (int)dragState
{
  return self->_dragState;
}

- (void)setDragState:(int)a3
{
  self->_int dragState = a3;
}

@end