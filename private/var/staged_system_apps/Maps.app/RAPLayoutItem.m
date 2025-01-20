@interface RAPLayoutItem
- (NSNumber)fieldType;
- (NSNumber)ordinal;
- (NSString)displayText;
- (NSString)placeholderText;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplayText:(id)a3;
- (void)setFieldType:(id)a3;
- (void)setOrdinal:(id)a3;
- (void)setPlaceholderText:(id)a3;
@end

@implementation RAPLayoutItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NSString *)self->_displayText copy];
  [v4 setDisplayText:v5];

  id v6 = [(NSString *)self->_placeholderText copy];
  [v4 setPlaceholderText:v6];

  id v7 = [(NSNumber *)self->_ordinal copy];
  [v4 setOrdinal:v7];

  id v8 = [(NSNumber *)self->_fieldType copy];
  [v4 setFieldType:v8];

  return v4;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (NSNumber)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(id)a3
{
}

- (NSNumber)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldType, 0);
  objc_storeStrong((id *)&self->_ordinal, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);

  objc_storeStrong((id *)&self->_displayText, 0);
}

@end