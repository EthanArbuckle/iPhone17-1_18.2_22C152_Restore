@interface TVAppStyle
- ($5430B3A1F2B0D9D780E0FF0AF799A503)borderRadius;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)fontSize;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)height;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)interitemSpacing;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)margin;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxHeight;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxWidth;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)minHeight;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)minWidth;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)padding;
- ($5430B3A1F2B0D9D780E0FF0AF799A503)width;
- (IKColor)backgroundColor;
- (NSMutableDictionary)valuesByStyle;
- (NSString)prototype;
- (id)valueForStyle:(id)a3;
- (void)_setValue:(id)a3 forStyle:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderRadius:(id *)a3;
- (void)setFontSize:(id *)a3;
- (void)setHeight:(id *)a3;
- (void)setInteritemSpacing:(id *)a3;
- (void)setMargin:(id *)a3;
- (void)setMaxHeight:(id *)a3;
- (void)setMaxWidth:(id *)a3;
- (void)setMinHeight:(id *)a3;
- (void)setMinWidth:(id *)a3;
- (void)setPadding:(id *)a3;
- (void)setPrototype:(id)a3;
- (void)setWidth:(id *)a3;
@end

@implementation TVAppStyle

- (id)valueForStyle:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_valuesByStyle objectForKeyedSubscript:a3];
}

- (void)setWidth:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_width.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_width.var0.insetValue.top = v4;
  *((_OWORD *)&self->_width.var0.doubleValue + 1) = v5;
  self->_width.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"width"];
}

- (void)setMinWidth:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_minWidth.isValueSet = *(void *)&a3->var1;
  *((_OWORD *)&self->_minWidth.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_minWidth.var0.insetValue.top = v4;
  self->_minWidth.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"min-width"];
}

- (void)setMaxWidth:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_maxWidth.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_maxWidth.var0.insetValue.top = v4;
  *((_OWORD *)&self->_maxWidth.var0.doubleValue + 1) = v5;
  self->_maxWidth.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"max-width"];
}

- (void)setHeight:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_height.isValueSet = *(void *)&a3->var1;
  *((_OWORD *)&self->_height.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_height.var0.insetValue.top = v4;
  self->_height.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"height"];
}

- (void)setMinHeight:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_minHeight.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_minHeight.var0.insetValue.top = v4;
  *((_OWORD *)&self->_minHeight.var0.doubleValue + 1) = v5;
  self->_minHeight.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"min-height"];
}

- (void)setMaxHeight:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_maxHeight.isValueSet = *(void *)&a3->var1;
  *((_OWORD *)&self->_maxHeight.var0.doubleValue + 1) = v5;
  *(_OWORD *)&self->_maxHeight.var0.insetValue.top = v4;
  self->_maxHeight.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"max-height"];
}

- (void)setPadding:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_padding.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_padding.var0.insetValue.top = v4;
  *((_OWORD *)&self->_padding.var0.doubleValue + 1) = v5;
  self->_padding.isValueSet = 1;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3->var0.var0.top, a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.right);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(TVAppStyle *)self _setValue:v6 forStyle:@"padding"];
}

- (void)setMargin:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_margin.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_margin.var0.insetValue.top = v4;
  *((_OWORD *)&self->_margin.var0.doubleValue + 1) = v5;
  self->_margin.isValueSet = 1;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", a3->var0.var0.top, a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.right);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(TVAppStyle *)self _setValue:v6 forStyle:@"margin"];
}

- (void)setInteritemSpacing:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_interitemSpacing.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_interitemSpacing.var0.insetValue.top = v4;
  *((_OWORD *)&self->_interitemSpacing.var0.doubleValue + 1) = v5;
  self->_interitemSpacing.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"tv-interitem-spacing"];
}

- (void)setFontSize:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_fontSize.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_fontSize.var0.insetValue.top = v4;
  *((_OWORD *)&self->_fontSize.var0.doubleValue + 1) = v5;
  self->_fontSize.isValueSet = 1;
  id v6 = [NSNumber numberWithDouble:a3->var0.var0.top];
  [(TVAppStyle *)self _setValue:v6 forStyle:@"font-size"];
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setBorderRadius:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var0.top;
  long long v5 = *((_OWORD *)&a3->var0.var1 + 1);
  *(void *)&self->_borderRadius.isValueSet = *(void *)&a3->var1;
  *(_OWORD *)&self->_borderRadius.var0.insetValue.top = v4;
  *((_OWORD *)&self->_borderRadius.var0.doubleValue + 1) = v5;
  self->_borderRadius.isValueSet = 1;
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F4B440]), "initWithCornerRadii:", a3->var0.var0.left, a3->var0.var0.bottom, a3->var0.var0.top, a3->var0.var0.right);
  [(TVAppStyle *)self _setValue:v6 forStyle:@"border-radius"];
}

- (void)setPrototype:(id)a3
{
  objc_storeStrong((id *)&self->_prototype, a3);
  id v5 = a3;
  [(TVAppStyle *)self _setValue:v5 forStyle:*MEMORY[0x263F4B398]];
}

- (void)_setValue:(id)a3 forStyle:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_valuesByStyle)
  {
    v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    valuesByStyle = self->_valuesByStyle;
    self->_valuesByStyle = v7;
  }
  v9 = self->_valuesByStyle;
  if (v10) {
    [(NSMutableDictionary *)v9 setObject:v10 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v6];
  }
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)width
{
  long long v3 = *(_OWORD *)(&self[1].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self->var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[1].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)minWidth
{
  long long v3 = *(_OWORD *)(&self[2].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[1].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[2].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxWidth
{
  long long v3 = *(_OWORD *)(&self[3].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[2].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[3].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)height
{
  long long v3 = *(_OWORD *)(&self[4].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[3].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[4].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)minHeight
{
  long long v3 = *(_OWORD *)(&self[5].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[4].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[5].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)maxHeight
{
  long long v3 = *(_OWORD *)(&self[6].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[5].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[6].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)padding
{
  long long v3 = *(_OWORD *)(&self[7].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[6].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[7].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)margin
{
  *(CGFloat *)&retstr->var1 = self[8].var0.var0.right;
  long long v3 = *(_OWORD *)(&self[8].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[7].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)interitemSpacing
{
  long long v3 = *(_OWORD *)(&self[9].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[8].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[9].var0.var0.right;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)fontSize
{
  *(CGFloat *)&retstr->var1 = self[10].var0.var0.right;
  long long v3 = *(_OWORD *)(&self[10].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[9].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  return self;
}

- ($5430B3A1F2B0D9D780E0FF0AF799A503)borderRadius
{
  long long v3 = *(_OWORD *)(&self[11].var0.var1 + 1);
  *(_OWORD *)&retstr->var0.var0.top = *(_OWORD *)&self[10].var1;
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  *(CGFloat *)&retstr->var1 = self[11].var0.var0.right;
  return self;
}

- (IKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)prototype
{
  return self->_prototype;
}

- (NSMutableDictionary)valuesByStyle
{
  return self->_valuesByStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesByStyle, 0);
  objc_storeStrong((id *)&self->_prototype, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end