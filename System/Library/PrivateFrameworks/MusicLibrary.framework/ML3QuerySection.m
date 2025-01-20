@interface ML3QuerySection
- (BOOL)isEqual:(id)a3;
- (ML3QuerySection)initWithRange:(_NSRange)a3 sectionIndex:(unint64_t)a4;
- (_NSRange)range;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sectionIndex;
- (void)setRange:(_NSRange)a3;
- (void)setSectionIndex:(unint64_t)a3;
@end

@implementation ML3QuerySection

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_sectionIndex == v4[1]
    && self->_range.length == v4[3]
    && self->_range.location == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ self->_sectionIndex;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ML3QuerySection;
  v4 = [(ML3QuerySection *)&v8 description];
  BOOL v5 = NSStringFromRange(self->_range);
  v6 = [v3 stringWithFormat:@"%@, _range = %@, _sectionIndex = %lu", v4, v5, self->_sectionIndex];

  return v6;
}

- (ML3QuerySection)initWithRange:(_NSRange)a3 sectionIndex:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)ML3QuerySection;
  _NSRange result = [(ML3QuerySection *)&v8 init];
  if (result)
  {
    result->_range.NSUInteger location = location;
    result->_range.NSUInteger length = length;
    result->_sectionIndex = a4;
  }
  return result;
}

@end