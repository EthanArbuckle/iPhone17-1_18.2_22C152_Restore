@interface SXFontAttributes
- (BOOL)isEqual:(id)a3;
- (NSNumber)grade;
- (NSString)description;
- (NSString)familyName;
- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6;
- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6 grade:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForStyle:(int64_t)a3;
- (id)stringForWeight:(int64_t)a3;
- (id)stringForWidth:(int64_t)a3;
- (int64_t)style;
- (int64_t)weight;
- (int64_t)width;
- (unint64_t)hash;
@end

@implementation SXFontAttributes

- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6
{
  return [(SXFontAttributes *)self initWithFamilyName:a3 weight:a4 width:a5 style:a6 grade:0];
}

- (SXFontAttributes)initWithFamilyName:(id)a3 weight:(int64_t)a4 width:(int64_t)a5 style:(int64_t)a6 grade:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SXFontAttributes;
  v15 = [(SXFontAttributes *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyName, a3);
    v16->_weight = a4;
    v16->_width = a5;
    v16->_style = a6;
    objc_storeStrong((id *)&v16->_grade, a7);
  }

  return v16;
}

- (unint64_t)hash
{
  int64_t v3 = self->_width ^ self->_weight ^ self->_style;
  NSUInteger v4 = [(NSString *)self->_familyName hash];
  return v3 ^ v4 ^ [(NSNumber *)self->_grade hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SXFontAttributes *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && self->_weight == v4->_weight
      && self->_width == v4->_width
      && self->_style == v4->_style
      && [(NSString *)self->_familyName isEqual:v4->_familyName]
      && [(NSNumber *)self->_grade isEqualToNumber:v5->_grade];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [SXFontAttributes alloc];
  familyName = self->_familyName;
  int64_t weight = self->_weight;
  int64_t width = self->_width;
  int64_t style = self->_style;
  grade = self->_grade;
  return [(SXFontAttributes *)v4 initWithFamilyName:familyName weight:weight width:width style:style grade:grade];
}

- (NSString)description
{
  int64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  NSUInteger v4 = [(SXFontAttributes *)self familyName];
  [v3 appendFormat:@"; familyName: %@", v4];

  v5 = [(SXFontAttributes *)self stringForWeight:[(SXFontAttributes *)self weight]];
  [v3 appendFormat:@"; weight: %@", v5];

  BOOL v6 = [(SXFontAttributes *)self stringForWidth:[(SXFontAttributes *)self width]];
  [v3 appendFormat:@"; width: %@", v6];

  v7 = [(SXFontAttributes *)self stringForStyle:[(SXFontAttributes *)self style]];
  [v3 appendFormat:@"; style: %@", v7];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (id)stringForStyle:(int64_t)a3
{
  int64_t v3 = @"normal";
  if (a3 == 1) {
    int64_t v3 = @"italic";
  }
  if (a3 == 2) {
    int64_t v3 = @"oblique";
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return @"undefined";
  }
  else {
    return v3;
  }
}

- (id)stringForWeight:(int64_t)a3
{
  int64_t v3 = @"thin";
  NSUInteger v4 = @"extra-bold";
  v5 = @"black";
  BOOL v6 = @"undefined";
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v6 = @"thin";
  }
  if (a3 != 900) {
    v5 = v6;
  }
  if (a3 != 800) {
    NSUInteger v4 = v5;
  }
  v7 = @"bold";
  if (a3 != 700) {
    v7 = @"thin";
  }
  if (a3 == 600) {
    v7 = @"semi-bold";
  }
  if (a3 <= 799) {
    NSUInteger v4 = v7;
  }
  v8 = @"normal";
  v9 = @"medium";
  if (a3 != 500) {
    v9 = @"thin";
  }
  if (a3 != 400) {
    v8 = v9;
  }
  if (a3 == 300) {
    int64_t v3 = @"light";
  }
  if (a3 == 200) {
    int64_t v3 = @"extra-light";
  }
  if (a3 > 399) {
    int64_t v3 = v8;
  }
  if (a3 <= 599) {
    return v3;
  }
  else {
    return v4;
  }
}

- (id)stringForWidth:(int64_t)a3
{
  id result = @"ultra-condensed";
  switch(a3)
  {
    case 0:
      id result = @"ultra-compressed";
      break;
    case 1:
      id result = @"extra-compressed";
      break;
    case 2:
      return result;
    case 3:
      id result = @"compressed";
      break;
    case 4:
      id result = @"extra-condensed";
      break;
    case 5:
      id result = @"condensed";
      break;
    case 6:
      id result = @"semi-condensed";
      break;
    case 7:
      id result = @"normal";
      break;
    case 8:
      id result = @"semi-expanded";
      break;
    case 9:
      id result = @"expanded";
      break;
    case 10:
      id result = @"extra-expanded";
      break;
    case 11:
      id result = @"ultra-expanded";
      break;
    default:
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        id result = @"undefined";
      }
      break;
  }
  return result;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (int64_t)weight
{
  return self->_weight;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)style
{
  return self->_style;
}

- (NSNumber)grade
{
  return self->_grade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grade, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end