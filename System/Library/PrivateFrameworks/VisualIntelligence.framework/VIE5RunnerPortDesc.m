@interface VIE5RunnerPortDesc
- (NSArray)shape;
- (NSArray)strides;
- (VIE5RunnerPortDType)dtype;
- (VIE5RunnerPortDesc)initWithShape:(id)a3 type:(unint64_t)a4 dtype:(VIE5RunnerPortDType)a5 csize:(unint64_t)a6 strides:(id)a7;
- (unint64_t)csize;
- (unint64_t)type;
@end

@implementation VIE5RunnerPortDesc

- (VIE5RunnerPortDesc)initWithShape:(id)a3 type:(unint64_t)a4 dtype:(VIE5RunnerPortDType)a5 csize:(unint64_t)a6 strides:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)VIE5RunnerPortDesc;
  v15 = [(VIE5RunnerPortDesc *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shape, a3);
    v16->_type = a4;
    v16->_dtype = a5;
    v16->_csize = a6;
    objc_storeStrong((id *)&v16->_strides, a7);
    v17 = v16;
  }

  return v16;
}

- (NSArray)shape
{
  return self->_shape;
}

- (unint64_t)type
{
  return self->_type;
}

- (VIE5RunnerPortDType)dtype
{
  return (VIE5RunnerPortDType)self->_dtype.surface;
}

- (unint64_t)csize
{
  return self->_csize;
}

- (NSArray)strides
{
  return self->_strides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

@end