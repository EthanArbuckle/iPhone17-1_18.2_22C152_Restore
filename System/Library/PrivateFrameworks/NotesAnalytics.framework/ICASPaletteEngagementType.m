@interface ICASPaletteEngagementType
- (ICASPaletteEngagementType)initWithPaletteEngagementType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)paletteEngagementType;
@end

@implementation ICASPaletteEngagementType

- (ICASPaletteEngagementType)initWithPaletteEngagementType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASPaletteEngagementType;
  result = [(ICASPaletteEngagementType *)&v5 init];
  if (result) {
    result->_paletteEngagementType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  if ([(ICASPaletteEngagementType *)self paletteEngagementType]) {
    return @"movePalette";
  }
  else {
    return @"unknown";
  }
}

- (int64_t)paletteEngagementType
{
  return self->_paletteEngagementType;
}

@end