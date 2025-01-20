@interface _UIImageViewPretiledImageWrapper
+ (id)cacheValueWithPretiledImage:(id)a3 cacheKey:(id)a4;
- (BOOL)isEqual:(id)a3;
- (UIImage)pretiledImage;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _UIImageViewPretiledImageWrapper

+ (id)cacheValueWithPretiledImage:(id)a3 cacheKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(_UIImageViewPretiledImageWrapper);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pretiledImage, a3);
    objc_storeStrong(p_isa + 2, a4);
    v10 = p_isa;
  }

  return p_isa;
}

- (void)dealloc
{
  [(id)qword_1EB264FE8 removeObjectForKey:self->_cacheKey];
  v3.receiver = self;
  v3.super_class = (Class)_UIImageViewPretiledImageWrapper;
  [(_UIImageViewPretiledImageWrapper *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(UIImage *)self->_pretiledImage hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIImage **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_pretiledImage == v4[1];

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; pretiledImage = %@>",
               objc_opt_class(),
               self,
               self->_pretiledImage);
}

- (UIImage)pretiledImage
{
  return self->_pretiledImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_pretiledImage, 0);
}

@end