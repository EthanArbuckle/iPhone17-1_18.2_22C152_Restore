@interface ICASPalettePosition
- (ICASPalettePosition)initWithPalettePosition:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)palettePosition;
@end

@implementation ICASPalettePosition

- (ICASPalettePosition)initWithPalettePosition:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASPalettePosition;
  result = [(ICASPalettePosition *)&v5 init];
  if (result) {
    result->_palettePosition = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASPalettePosition *)self palettePosition];
  if ((unint64_t)(v3 - 1) > 8) {
    return @"unknown";
  }
  else {
    return off_1E64B8AF0[v3 - 1];
  }
}

- (int64_t)palettePosition
{
  return self->_palettePosition;
}

@end