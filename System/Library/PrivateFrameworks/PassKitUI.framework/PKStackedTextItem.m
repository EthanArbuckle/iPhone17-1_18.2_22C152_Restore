@interface PKStackedTextItem
- (BOOL)isDeemphasizedPrimary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSignificantPrimary;
- (BOOL)isStrikethroughPrimary;
- (NSString)groupingIdentifier;
- (NSString)primary;
- (NSString)secondary;
- (NSString)tertiary;
- (NSString)title;
- (PKStackedTextItem)init;
- (PKStackedTextItem)initWithNumberOfContentRows:(unint64_t)a3 groupingIdentifier:(id)a4;
- (unint64_t)hash;
- (unint64_t)numberOfContentRows;
- (void)setDeemphasizedPrimary:(BOOL)a3;
- (void)setPrimary:(id)a3;
- (void)setSecondary:(id)a3;
- (void)setSignificantPrimary:(BOOL)a3;
- (void)setStrikethroughPrimary:(BOOL)a3;
- (void)setTertiary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKStackedTextItem

- (PKStackedTextItem)init
{
  return [(PKStackedTextItem *)self initWithNumberOfContentRows:0 groupingIdentifier:0];
}

- (PKStackedTextItem)initWithNumberOfContentRows:(unint64_t)a3 groupingIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKStackedTextItem;
  v7 = [(PKStackedTextItem *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    groupingIdentifier = v7->_groupingIdentifier;
    v7->_groupingIdentifier = (NSString *)v8;

    v7->_numberOfContentRows = a3;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  BOOL v8 = v6
    && self->_numberOfContentRows == *((void *)v6 + 3)
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_significantPrimary == v7[8]
    && self->_deemphasizedPrimary == v7[9]
    && self->_strikethroughPrimary == v7[10];

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:(2 * self->_deemphasizedPrimary) | (4 * self->_significantPrimary) | self->_strikethroughPrimary];
  uint64_t v4 = [v3 hash];

  NSUInteger v5 = [(NSString *)self->_groupingIdentifier hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_title hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_primary hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_secondary hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_tertiary hash] ^ v4;
  return v9 ^ PKIntegerHash();
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (unint64_t)numberOfContentRows
{
  return self->_numberOfContentRows;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)primary
{
  return self->_primary;
}

- (void)setPrimary:(id)a3
{
}

- (NSString)secondary
{
  return self->_secondary;
}

- (void)setSecondary:(id)a3
{
}

- (NSString)tertiary
{
  return self->_tertiary;
}

- (void)setTertiary:(id)a3
{
}

- (BOOL)isSignificantPrimary
{
  return self->_significantPrimary;
}

- (void)setSignificantPrimary:(BOOL)a3
{
  self->_significantPrimary = a3;
}

- (BOOL)isDeemphasizedPrimary
{
  return self->_deemphasizedPrimary;
}

- (void)setDeemphasizedPrimary:(BOOL)a3
{
  self->_deemphasizedPrimary = a3;
}

- (BOOL)isStrikethroughPrimary
{
  return self->_strikethroughPrimary;
}

- (void)setStrikethroughPrimary:(BOOL)a3
{
  self->_strikethroughPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiary, 0);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end