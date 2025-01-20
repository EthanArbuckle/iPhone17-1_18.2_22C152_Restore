@interface RSMirrorPoint
+ (BOOL)supportsSecureCoding;
- (RSMirrorPoint)initWithCoder:(id)a3;
- (RSMirrorPoint)initWithOrigin:(RSMirrorPoint *)self reflect:(SEL)a2;
- (__n128)origin;
- (__n128)reflect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RSMirrorPoint

- (__n128)reflect
{
  return a1[2];
}

- (__n128)origin
{
  return a1[1];
}

- (id)dictionaryRepresentation
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"origin";
  v4 = sub_25B4CB61C(*(__n128 *)self->_origin, (uint64_t)self, a2, v2);
  v11[1] = @"reflect";
  v12[0] = v4;
  v7 = sub_25B4CB61C(*(__n128 *)self->_reflect, (uint64_t)v4, v5, v6);
  v12[1] = v7;
  v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v12, v11, 2);

  return v9;
}

- (RSMirrorPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RSMirrorPoint;
  v5 = [(RSMirrorPoint *)&v16 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"origin");
    sub_25B4CB878(v12, v5->_origin);
    v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v10, @"reflect");
    sub_25B4CB878(v14, v5->_reflect);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  uint64_t v6 = sub_25B4CB61C(*(__n128 *)self->_origin, (uint64_t)v13, v4, v5);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)v6, @"origin");

  v11 = sub_25B4CB61C(*(__n128 *)self->_reflect, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v13, v12, (uint64_t)v11, @"reflect");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RSMirrorPoint alloc];
  long long v7 = *(_OWORD *)self->_origin;
  long long v8 = *(_OWORD *)self->_reflect;

  return (id)objc_msgSend_initWithOrigin_reflect_(v4, v5, v6, *(double *)&v7, *(double *)&v8);
}

- (RSMirrorPoint)initWithOrigin:(RSMirrorPoint *)self reflect:(SEL)a2
{
  long long v5 = v2;
  long long v6 = v3;
  v7.receiver = self;
  v7.super_class = (Class)RSMirrorPoint;
  result = [(RSMirrorPoint *)&v7 init];
  if (result)
  {
    *(_OWORD *)result->_origin = v5;
    *(_OWORD *)result->_reflect = v6;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end