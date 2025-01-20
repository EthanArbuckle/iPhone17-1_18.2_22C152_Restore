@interface _UITextInputSessionAccumulator
+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depth:(unint64_t)a5 block:(id)a6;
+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depthRange:(_NSRange)a5 block:(id)a6;
- (BOOL)_increaseWithActions:(id)a3;
- (NSString)name;
- (_NSRange)depthRange;
- (id)block;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)_increaseWithCount:(unint64_t)a3 source:(int64_t)a4;
- (void)enumerateAnalytics:(id)a3;
- (void)reset;
- (void)setDepthRange:(_NSRange)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UITextInputSessionAccumulator

+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depth:(unint64_t)a5 block:(id)a6
{
  return (id)objc_msgSend(a1, "accumulatorWithName:type:depthRange:block:", a3, a4, a5, 0, a6);
}

+ (id)accumulatorWithName:(id)a3 type:(int64_t)a4 depthRange:(_NSRange)a5 block:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a6;
  id v11 = a3;
  v12 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v13 = [v11 copy];

  v14 = (void *)v12[10];
  v12[10] = v13;

  v12[11] = a4;
  v12[13] = location;
  v12[14] = length;
  uint64_t v15 = [v10 copy];

  v16 = (void *)v12[12];
  v12[12] = v15;

  [v12 reset];
  return v12;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UITextInputSessionAccumulator;
  v4 = [(_UITextInputSessionAccumulator *)&v8 description];
  v5 = [(_UITextInputSessionAccumulator *)self name];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_increaseWithActions:(id)a3
{
  block = self->_block;
  v5 = (uint64_t (*)(void *, id))block[2];
  id v6 = a3;
  uint64_t v7 = v5(block, v6);
  objc_super v8 = [v6 firstObject];

  -[_UITextInputSessionAccumulator _increaseWithCount:source:](self, "_increaseWithCount:source:", v7, [v8 source]);
  return v7 != 0;
}

- (void)_increaseWithCount:(unint64_t)a3 source:(int64_t)a4
{
  if (self->_type) {
    values = &self->_values[a4];
  }
  else {
    values = self->_values;
  }
  *values += a3;
}

- (void)reset
{
  self->_values[8] = 0;
  *(_OWORD *)&self->_values[6] = 0u;
  *(_OWORD *)&self->_values[4] = 0u;
  *(_OWORD *)&self->_values[2] = 0u;
  *(_OWORD *)self->_values = 0u;
}

- (void)enumerateAnalytics:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  if (self->_type || !self->_values[0])
  {
    for (uint64_t i = 1; i != 10; ++i)
    {
      if (*((void *)&self->super.isa + i))
      {
        id v6 = +[UITextInputSessionActionAnalytics stringValueForSource:i - 1];
        v12[0] = @"SessionAction";
        uint64_t v7 = [(_UITextInputSessionAccumulator *)self name];
        v12[1] = @"InputSource";
        v13[0] = v7;
        v13[1] = v6;
        objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

        v4[2](v4, v8, *((void *)&self->super.isa + i));
      }
    }
  }
  else
  {
    v9 = +[UITextInputSessionActionAnalytics stringValueForSource:0];
    v14[0] = @"SessionAction";
    id v10 = [(_UITextInputSessionAccumulator *)self name];
    v14[1] = @"InputSource";
    v15[0] = v10;
    v15[1] = v9;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    v4[2](v4, v11, self->_values[0]);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_NSRange)depthRange
{
  NSUInteger length = self->_depthRange.length;
  NSUInteger location = self->_depthRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDepthRange:(_NSRange)a3
{
  self->_depthRange = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end