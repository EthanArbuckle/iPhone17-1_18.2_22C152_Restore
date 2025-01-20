@interface ML3BitMaskPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (ML3BitMaskPredicate)initWithCoder:(id)a3;
- (ML3BitMaskPredicate)initWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5;
- (id)databaseStatementParameters;
- (id)description;
- (int64_t)mask;
- (int64_t)value;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMask:(int64_t)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation ML3BitMaskPredicate

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setMask:(int64_t)a3
{
  self->_mask = a3;
}

- (int64_t)mask
{
  return self->_mask;
}

- (id)databaseStatementParameters
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithLongLong:self->_mask];
  v7[0] = v3;
  v4 = [NSNumber numberWithLongLong:self->_value];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  property = self->super._property;
  id v6 = a3;
  id v7 = [(objc_class *)a4 disambiguatedSQLForProperty:property];
  objc_msgSend(v6, "appendString:", CFSTR("(("));
  [v6 appendString:v7];
  [v6 appendString:@" & ? = ?]"));
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3BitMaskPredicate;
  v4 = [(ML3PropertyPredicate *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@((%@ & 0x%llx) = 0x%llx)", v4, self->super._property, self->_mask, self->_value];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ML3BitMaskPredicate *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3BitMaskPredicate;
    if ([(ML3PropertyPredicate *)&v9 isEqual:v4]
      && (int64_t v5 = [(ML3BitMaskPredicate *)self mask], v5 == [(ML3BitMaskPredicate *)v4 mask]))
    {
      int64_t v6 = [(ML3BitMaskPredicate *)self value];
      BOOL v7 = v6 == [(ML3BitMaskPredicate *)v4 value];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ML3BitMaskPredicate;
  id v4 = a3;
  [(ML3PropertyPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[ML3BitMaskPredicate mask](self, "mask", v5.receiver, v5.super_class), @"mask");
  objc_msgSend(v4, "encodeInt64:forKey:", -[ML3BitMaskPredicate value](self, "value"), @"value");
}

- (ML3BitMaskPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ML3BitMaskPredicate;
  objc_super v5 = [(ML3PropertyPredicate *)&v7 initWithCoder:v4];
  if (v5)
  {
    -[ML3BitMaskPredicate setMask:](v5, "setMask:", [v4 decodeInt64ForKey:@"mask"]);
    -[ML3BitMaskPredicate setValue:](v5, "setValue:", [v4 decodeInt64ForKey:@"value"]);
  }

  return v5;
}

- (ML3BitMaskPredicate)initWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)ML3BitMaskPredicate;
  objc_super v7 = [(ML3PropertyPredicate *)&v10 initWithProperty:a3];
  v8 = v7;
  if (v7)
  {
    [(ML3BitMaskPredicate *)v7 setMask:a4];
    [(ML3BitMaskPredicate *)v8 setValue:a5];
  }
  return v8;
}

+ (id)predicateWithProperty:(id)a3 mask:(int64_t)a4 value:(int64_t)a5
{
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v7 mask:a4 value:a5];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end