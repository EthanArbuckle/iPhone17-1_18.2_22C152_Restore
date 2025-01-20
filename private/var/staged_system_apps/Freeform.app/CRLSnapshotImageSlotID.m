@interface CRLSnapshotImageSlotID
+ (id)snapshotContext;
- (CRLSnapshotImageSlotID)initWithSize:(CGSize)a3;
- (id)object;
- (unsigned)value;
- (void)dealloc;
- (void)p_teardown;
@end

@implementation CRLSnapshotImageSlotID

+ (id)snapshotContext
{
  if (qword_1016A9D40 != -1) {
    dispatch_once(&qword_1016A9D40, &stru_1014FC380);
  }
  v2 = (void *)qword_1016A9D38;

  return v2;
}

- (CRLSnapshotImageSlotID)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CRLSnapshotImageSlotID;
  v5 = [(CRLSnapshotImageSlotID *)&v8 init];
  if (v5)
  {
    v6 = +[CRLSnapshotImageSlotID snapshotContext];
    v5->_value = [v6 createImageSlot:1 hasAlpha:width height];
  }
  return v5;
}

- (void)dealloc
{
  [(CRLSnapshotImageSlotID *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)CRLSnapshotImageSlotID;
  [(CRLSnapshotImageSlotID *)&v3 dealloc];
}

- (void)p_teardown
{
  if (self->_value)
  {
    id v3 = +[CRLSnapshotImageSlotID snapshotContext];
    [v3 deleteSlot:self->_value];
  }
}

- (id)object
{
  if (self->_value)
  {
    v2 = +[CAContext objectForSlot:](CAContext, "objectForSlot:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unsigned)value
{
  return self->_value;
}

@end