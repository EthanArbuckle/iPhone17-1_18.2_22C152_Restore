@interface _BKHIDKeyboardDevicePropertiesContainer
+ (id)protobufSchema;
- (NSArray)props;
- (void)setProps:(id)a3;
@end

@implementation _BKHIDKeyboardDevicePropertiesContainer

+ (id)protobufSchema
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AE3C;
  block[3] = &unk_1000F7D08;
  block[4] = a1;
  if (qword_100122DE8 != -1) {
    dispatch_once(&qword_100122DE8, block);
  }
  v2 = (void *)qword_100122DE0;

  return v2;
}

- (void).cxx_destruct
{
}

- (void)setProps:(id)a3
{
}

- (NSArray)props
{
  return self->_props;
}

@end