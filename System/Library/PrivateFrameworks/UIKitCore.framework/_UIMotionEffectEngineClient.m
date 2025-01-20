@interface _UIMotionEffectEngineClient
- (BOOL)isEqual:(id)a3;
- (_UIMotionEffectEngineClient)initWithMotionEffect:(id)a3 view:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIMotionEffectEngineClient

- (unint64_t)hash
{
  uint64_t v3 = [(UIMotionEffect *)self->_effect hash];
  return [(UIView *)self->_view hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && (UIMotionEffect *)v4[1] == self->_effect && (UIView *)v4[2] == self->_view;

  return v5;
}

- (_UIMotionEffectEngineClient)initWithMotionEffect:(id)a3 view:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIMotionEffectEngineClient;
  v9 = [(_UIMotionEffectEngineClient *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_effect, a3);
    objc_storeStrong((id *)&v10->_view, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p effect=%@ view=%@>", v5, self, self->_effect, self->_view];

  return v6;
}

@end