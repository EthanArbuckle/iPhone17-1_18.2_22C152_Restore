@interface _UIImageSerializationWrapper
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (_UIImageSerializationWrapper)initWithCoder:(id)a3;
- (_UIImageSerializationWrapper)initWithImage:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIImageSerializationWrapper

- (_UIImageSerializationWrapper)initWithImage:(id)a3
{
  id v5 = a3;
  v6 = [(_UIImageSerializationWrapper *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_image, a3);
  }

  return v7;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(UIImage *)self->_image encodeWithCoder:v5];
  v4 = _UIImageName(self->_image);
  if ([(UIImage *)self->_image _canEncodeWithName:v4 coder:v5])
  {
    [(UIImage *)self->_image _encodeDataWithCoder:v5 imageName:v4];
    [(UIImage *)self->_image _encodePropertiesWithCoder:v5];
  }
}

- (_UIImageSerializationWrapper)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSerializationWrapper;
  return [(_UIImageSerializationWrapper *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end