@interface TMLDirectionalEdgeInsets
+ (void)initializeJSContext:(id)a3;
- (NSDirectionalEdgeInsets)directionalEdgeInsets;
- (TMLDirectionalEdgeInsets)initWithDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (double)bottom;
- (double)leading;
- (double)top;
- (double)trailing;
- (id)NSDirectionalEdgeInsetsValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TMLDirectionalEdgeInsets

- (TMLDirectionalEdgeInsets)initWithDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat leading = a3.leading;
  CGFloat top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)TMLDirectionalEdgeInsets;
  result = [(TMLDirectionalEdgeInsets *)&v8 init];
  if (result)
  {
    result->_directionalEdgeInsets.CGFloat top = top;
    result->_directionalEdgeInsets.CGFloat leading = leading;
    result->_directionalEdgeInsets.CGFloat bottom = bottom;
    result->_directionalEdgeInsets.CGFloat trailing = trailing;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_super v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double top = self->_directionalEdgeInsets.top;
  double leading = self->_directionalEdgeInsets.leading;
  double bottom = self->_directionalEdgeInsets.bottom;
  double trailing = self->_directionalEdgeInsets.trailing;
  return (id)objc_msgSend_initWithDirectionalEdgeInsets_(v8, v9, top, leading, bottom, trailing);
}

- (id)NSDirectionalEdgeInsetsValue
{
  return (id)objc_msgSend_valueWithDirectionalEdgeInsets_(MEMORY[0x263F08D40], a2, self->_directionalEdgeInsets.top, self->_directionalEdgeInsets.leading, self->_directionalEdgeInsets.bottom, self->_directionalEdgeInsets.trailing);
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v7 = objc_msgSend_initWithDirectionalEdgeInsets_(v5, v6, *MEMORY[0x263F1C228], *(double *)(MEMORY[0x263F1C228] + 8), *(double *)(MEMORY[0x263F1C228] + 16), *(double *)(MEMORY[0x263F1C228] + 24));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, @"NSDirectionalEdgeInsetsZero");

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2398402CC;
  v17[3] = &unk_264DAC010;
  v17[4] = a1;
  v10 = (void *)MEMORY[0x23ECA7DD0](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, @"directionalEdgeInsets");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, @"NSDirectionalEdgeInsetsMake");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_26ECEBDD8, @"NSDirectionalEdgeInsetsEqualToDirectionalEdgeInsets");
}

- (double)top
{
  return self->_directionalEdgeInsets.top;
}

- (double)leading
{
  return self->_directionalEdgeInsets.leading;
}

- (double)bottom
{
  return self->_directionalEdgeInsets.bottom;
}

- (double)trailing
{
  return self->_directionalEdgeInsets.trailing;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TMLDirectionalEdgeInsets;
  id v4 = [(TMLDirectionalEdgeInsets *)&v8 description];
  v6 = objc_msgSend_stringWithFormat_(v3, v5, self->_directionalEdgeInsets.top, @"%@{top: %.2f, leading: %.2f, bottom: %.2f, trailing: %.2f", v4, *(void *)&self->_directionalEdgeInsets.top, *(void *)&self->_directionalEdgeInsets.leading, *(void *)&self->_directionalEdgeInsets.bottom, *(void *)&self->_directionalEdgeInsets.trailing);

  return v6;
}

- (NSDirectionalEdgeInsets)directionalEdgeInsets
{
  double top = self->_directionalEdgeInsets.top;
  double leading = self->_directionalEdgeInsets.leading;
  double bottom = self->_directionalEdgeInsets.bottom;
  double trailing = self->_directionalEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

@end