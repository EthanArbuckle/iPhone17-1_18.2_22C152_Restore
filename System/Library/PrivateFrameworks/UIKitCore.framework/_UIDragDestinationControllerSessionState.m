@interface _UIDragDestinationControllerSessionState
- (id)description;
@end

@implementation _UIDragDestinationControllerSessionState

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
    int state = self->_state;
    uint64_t v8 = 0;
    v9 = @"suspended";
    v10 = @"pendingDragging";
    switch(state)
    {
      case 0:
        uint64_t v8 = 0;
        v9 = @"initial";
        break;
      case 1:
        v10 = @"pendingReordering";
        goto LABEL_12;
      case 2:
        goto LABEL_12;
      case 3:
        v10 = @"reordering";
        goto LABEL_12;
      case 4:
        v10 = @"dragging";
        goto LABEL_12;
      case 5:
        v10 = @"pendingMultiItemDrop";
        goto LABEL_12;
      case 6:
        v10 = @"committing";
        goto LABEL_12;
      case 7:
        v10 = @"cancelling";
        goto LABEL_12;
      case 8:
        break;
      case 9:
        v10 = @"waitingForResume";
LABEL_12:
        uint64_t v8 = 1;
        v9 = v10;
        break;
      default:
        uint64_t v8 = 0;
        v9 = @"<unknown>";
        break;
    }
    BOOL v12 = state == 2 || state == 4;
    BOOL v13 = (state & 0xFFFFFFFD) == 1;
  }
  else
  {
    BOOL v12 = 0;
    uint64_t v8 = 0;
    BOOL v13 = 0;
    v9 = @"initial";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; int state = %@; isActive = %d; isDragging = %d; isReordering = %d>",
    v5,
    self,
    v9,
    v8,
    v12,
  v14 = v13);

  return v14;
}

@end