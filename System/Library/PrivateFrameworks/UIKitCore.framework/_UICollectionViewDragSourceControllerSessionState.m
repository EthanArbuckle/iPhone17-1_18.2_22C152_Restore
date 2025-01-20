@interface _UICollectionViewDragSourceControllerSessionState
- (id)description;
@end

@implementation _UICollectionViewDragSourceControllerSessionState

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self)
  {
    dragSession = self->_dragSession;
    BOOL v8 = dragSession != 0;
  }
  else
  {
    BOOL v8 = 0;
    dragSession = 0;
  }
  v9 = [v3 stringWithFormat:@"<%@:%p isActive = %d dragSession = %@>", v5, self, v8, dragSession];;

  return v9;
}

@end