@interface EMEnumProperty
+ (id)mapHorizontalAlignmentValue:(int)a3;
+ (id)mapUnderlineValue:(int)a3;
+ (id)mapVerticalAlignmentValue:(int)a3;
- (BOOL)isEqual:(id)a3;
- (EMEnumProperty)initWithEnum:(int)a3;
- (id)cssStringForName:(id)a3;
- (id)description;
- (id)mapHorizontalAlignment;
- (id)mapUnderline;
- (id)mapVerticalAlignment;
- (int)value;
- (unint64_t)hash;
@end

@implementation EMEnumProperty

+ (id)mapUnderlineValue:(int)a3
{
  if ((a3 - 1) >= 4) {
    return &stru_26EBF24D8;
  }
  else {
    return @"text-decoration:underline;";
  }
}

- (EMEnumProperty)initWithEnum:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EMEnumProperty;
  result = [(EMEnumProperty *)&v5 init];
  if (result) {
    result->wdValue = a3;
  }
  return result;
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  if ([v4 compare:@"text-align"])
  {
    if ([v4 compare:@"vertical-align"])
    {
      if ([v4 compare:@"underline"])
      {
        objc_super v5 = 0;
        goto LABEL_9;
      }
      uint64_t v6 = [(EMEnumProperty *)self mapUnderline];
    }
    else
    {
      uint64_t v6 = [(EMEnumProperty *)self mapVerticalAlignment];
    }
  }
  else
  {
    uint64_t v6 = [(EMEnumProperty *)self mapHorizontalAlignment];
  }
  objc_super v5 = (void *)v6;
LABEL_9:

  return v5;
}

- (id)mapHorizontalAlignment
{
  uint64_t wdValue = self->wdValue;
  if (wdValue > 6) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D68B60[wdValue];
  }
}

- (id)mapVerticalAlignment
{
  uint64_t wdValue = self->wdValue;
  if (wdValue > 5) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D68B98[wdValue];
  }
}

- (int)value
{
  return self->wdValue;
}

+ (id)mapHorizontalAlignmentValue:(int)a3
{
  if (a3 > 6) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D68B60[a3];
  }
}

+ (id)mapVerticalAlignmentValue:(int)a3
{
  if (a3 > 5) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D68B98[a3];
  }
}

- (id)mapUnderline
{
  if ((self->wdValue - 1) >= 4) {
    return &stru_26EBF24D8;
  }
  else {
    return @"text-decoration:underline;";
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMEnumProperty *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->wdValue == self->wdValue;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->wdValue;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p %d>", objc_opt_class(), self, self->wdValue];
}

@end