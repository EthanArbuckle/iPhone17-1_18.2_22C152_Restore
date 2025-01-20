@interface CMDrawingAction
- (CMDrawingAction)initWithType:(int)a3 andFloatValue:(float)a4;
- (CMDrawingAction)initWithType:(int)a3 andValue:(id)a4;
- (float)floatValue;
- (id)description;
- (id)value;
- (int)type;
- (void)dealloc;
@end

@implementation CMDrawingAction

- (CMDrawingAction)initWithType:(int)a3 andValue:(id)a4
{
  id v7 = a4;
  self->_int type = a3;
  p_value = (CGColorRef *)&self->_value;
  objc_storeStrong(&self->_value, a4);
  int type = self->_type;
  if ((type - 2) < 2)
  {
    CGColorRetain(*p_value);
  }
  else if (type == 4)
  {
    CGImageRetain(*p_value);
  }
  else if (type == 8)
  {
    CGPathRetain(*p_value);
  }

  return self;
}

- (int)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void)dealloc
{
  int type = self->_type;
  if ((type - 2) < 2)
  {
    CGColorRelease((CGColorRef)self->_value);
  }
  else if (type == 4)
  {
    CGImageRelease((CGImageRef)self->_value);
  }
  else if (type == 8)
  {
    CGPathRelease((CGPathRef)self->_value);
  }
  v4.receiver = self;
  v4.super_class = (Class)CMDrawingAction;
  [(CMDrawingAction *)&v4 dealloc];
}

- (CMDrawingAction)initWithType:(int)a3 andFloatValue:(float)a4
{
  self->_int type = a3;
  self->_floatValue = a4;
  return self;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (id)description
{
  v2 = @"CMActionRestoreTransform";
  switch(self->_type)
  {
    case 0:
      v3 = NSString;
      objc_super v4 = [self->_value description];
      uint64_t v5 = [v3 stringWithFormat:@"CMActionAddTransform : %@", v4];
      goto LABEL_5;
    case 1:
      break;
    case 2:
      v2 = @"CMActionStrokeColor";
      break;
    case 3:
      v2 = @"CMActionFillColor";
      break;
    case 6:
      objc_msgSend(NSString, "stringWithFormat:", @"CMActionLineWidth : %f", self->_floatValue);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      v6 = NSString;
      objc_super v4 = [self->_value description];
      uint64_t v5 = [v6 stringWithFormat:@"CMActionLineDash : %@", v4];
LABEL_5:
      v2 = (__CFString *)v5;

      break;
    case 8:
      v2 = @"CMActionPath";
      break;
    default:
      v2 = @"unknown action";
      break;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end