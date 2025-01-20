@interface VGFloatArray
+ (BOOL)supportsSecureCoding;
- (VGFloatArray)initWithCoder:(id)a3;
- (VGFloatArray)initWithData:(id)a3;
- (VGFloatArray)initWithFloats:(const float *)a3 size:(unint64_t)a4;
- (VGFloatArray)initWithFloatsNoOwnership:(const float *)a3 size:(unint64_t)a4;
- (const)data;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGFloatArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  data = self->_data;
  v5 = NSStringFromSelector(sel_data);
  [v6 encodeObject:data forKey:v5];
}

- (VGFloatArray)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_data);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(VGFloatArray *)self initWithData:v7];

  return v8;
}

- (VGFloatArray)initWithFloats:(const float *)a3 size:(unint64_t)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 length:4 * a4];
  id v6 = [(VGFloatArray *)self initWithData:v5];

  return v6;
}

- (VGFloatArray)initWithFloatsNoOwnership:(const float *)a3 size:(unint64_t)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  id v6 = [(VGFloatArray *)self initWithData:v5];

  return v6;
}

- (VGFloatArray)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGFloatArray;
  id v6 = [(VGFloatArray *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (const)data
{
  return (const float *)[(NSData *)self->_data bytes];
}

- (unint64_t)size
{
  return [(NSData *)self->_data length] >> 2;
}

- (void).cxx_destruct
{
}

@end