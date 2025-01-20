@interface PXSnapStripViewIndicatorInfo
- (BOOL)disabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIndicatorInfo:(id)a3;
- (PXSnapStripViewIndicatorInfo)init;
- (PXSnapStripViewIndicatorInfo)initWithOffset:(double)a3 color:(id)a4 style:(unint64_t)a5;
- (UIColor)color;
- (double)offset;
- (unint64_t)hash;
- (unint64_t)style;
- (void)setDisabled:(BOOL)a3;
@end

@implementation PXSnapStripViewIndicatorInfo

- (void).cxx_destruct
{
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (double)offset
{
  return self->_offset;
}

- (UIColor)color
{
  return self->_color;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PXSnapStripViewIndicatorInfo;
  unint64_t v3 = [(PXSnapStripViewIndicatorInfo *)&v5 hash];
  return [(UIColor *)self->_color hash] ^ v3 ^ (1000 * self->_disabled) ^ (unint64_t)(self->_offset * 1000.0) ^ (16 * self->_style);
}

- (BOOL)isEqualToIndicatorInfo:(id)a3
{
  id v4 = a3;
  color = self->_color;
  v6 = [v4 color];
  LODWORD(color) = [(UIColor *)color isEqual:v6];

  if (color
    && (double offset = self->_offset, [v4 offset], offset == v8)
    && (unint64_t style = self->_style, style == [v4 style]))
  {
    int disabled = self->_disabled;
    BOOL v11 = disabled == [v4 disabled];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToIndicatorInfo:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (PXSnapStripViewIndicatorInfo)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSnapStripView.m", 250, @"%s is not available as initializer", "-[PXSnapStripViewIndicatorInfo init]");

  abort();
}

- (PXSnapStripViewIndicatorInfo)initWithOffset:(double)a3 color:(id)a4 style:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXSnapStripViewIndicatorInfo;
  v10 = [(PXSnapStripViewIndicatorInfo *)&v13 init];
  BOOL v11 = v10;
  if (v10)
  {
    v10->_double offset = a3;
    objc_storeStrong((id *)&v10->_color, a4);
    v11->_unint64_t style = a5;
    v11->_int disabled = 0;
  }

  return v11;
}

@end