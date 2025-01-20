@interface _UISlotId
+ (id)snapshotContext;
- (_UISlotId)initWithSize:(CGSize)a3;
- (id)object;
- (unsigned)value;
- (void)dealloc;
@end

@implementation _UISlotId

+ (id)snapshotContext
{
  if (qword_1EB262558 != -1) {
    dispatch_once(&qword_1EB262558, &__block_literal_global_461);
  }
  v2 = (void *)qword_1EB262550;
  return v2;
}

- (_UISlotId)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_UISlotId;
  v5 = [(_UISlotId *)&v8 init];
  if (v5)
  {
    v6 = +[_UISlotId snapshotContext];
    v5->_value = objc_msgSend(v6, "createImageSlot:hasAlpha:", 1, width, height);
  }
  return v5;
}

- (void)dealloc
{
  if (self->_value)
  {
    v3 = +[_UISlotId snapshotContext];
    [v3 deleteSlot:self->_value];
  }
  v4.receiver = self;
  v4.super_class = (Class)_UISlotId;
  [(_UISlotId *)&v4 dealloc];
}

- (id)object
{
  if (self->_value)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:");
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