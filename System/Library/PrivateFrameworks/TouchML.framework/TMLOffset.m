@interface TMLOffset
+ (void)initializeJSContext:(id)a3;
- (TMLOffset)initWithOffset:(UIOffset)a3;
- (UIOffset)offset;
- (double)horizontal;
- (double)vertical;
- (id)UIOffsetValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TMLOffset

- (TMLOffset)initWithOffset:(UIOffset)a3
{
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  v6.receiver = self;
  v6.super_class = (Class)TMLOffset;
  result = [(TMLOffset *)&v6 init];
  if (result)
  {
    result->_offset.CGFloat horizontal = horizontal;
    result->_offset.CGFloat vertical = vertical;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double horizontal = self->_offset.horizontal;
  double vertical = self->_offset.vertical;
  return (id)objc_msgSend_initWithOffset_(v8, v9, horizontal, vertical);
}

- (id)UIOffsetValue
{
  return (id)objc_msgSend_valueWithUIOffset_(MEMORY[0x263F08D40], a2, self->_offset.horizontal, self->_offset.vertical);
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v7 = objc_msgSend_initWithOffset_(v5, v6, *MEMORY[0x263F1D4E8], *(double *)(MEMORY[0x263F1D4E8] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, @"UIOffsetZero");

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2398658FC;
  v15[3] = &unk_264DAE070;
  v15[4] = a1;
  v10 = (void *)MEMORY[0x23ECA7DD0](v15);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, @"offset");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, @"UIOffsetMake");
}

- (double)horizontal
{
  return self->_offset.horizontal;
}

- (double)vertical
{
  return self->_offset.vertical;
}

- (id)description
{
  return NSStringFromUIOffset(self->_offset);
}

- (UIOffset)offset
{
  double horizontal = self->_offset.horizontal;
  double vertical = self->_offset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

@end