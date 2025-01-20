@interface WMEnumProperty
- (WMEnumProperty)initWithEnum:(unint64_t)a3;
- (id)cssStringForName:(id)a3;
- (id)description;
- (id)mapCellTextVAlign;
- (id)mapJustification;
- (id)mapUnderline;
- (id)mapVerticalAlign;
- (unint64_t)value;
@end

@implementation WMEnumProperty

- (WMEnumProperty)initWithEnum:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WMEnumProperty;
  result = [(WMEnumProperty *)&v5 init];
  if (result) {
    result->wdValue = a3;
  }
  return result;
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  if ([v4 compare:0x26EC195B8])
  {
    if ([v4 compare:0x26EC18B78])
    {
      if ([v4 compare:@"underline"])
      {
        if ([v4 compare:0x26EC196D8])
        {
          objc_super v5 = 0;
          goto LABEL_11;
        }
        uint64_t v6 = [(WMEnumProperty *)self mapCellTextVAlign];
      }
      else
      {
        uint64_t v6 = [(WMEnumProperty *)self mapUnderline];
      }
    }
    else
    {
      uint64_t v6 = [(WMEnumProperty *)self mapVerticalAlign];
    }
  }
  else
  {
    uint64_t v6 = [(WMEnumProperty *)self mapJustification];
  }
  objc_super v5 = (void *)v6;
LABEL_11:

  return v5;
}

- (id)mapJustification
{
  unint64_t wdValue = self->wdValue;
  if (wdValue > 3) {
    return 0;
  }
  else {
    return off_264D686B8[wdValue];
  }
}

- (id)mapUnderline
{
  unint64_t wdValue = self->wdValue;
  if (wdValue == 5 || wdValue == 0) {
    return &stru_26EBF24D8;
  }
  else {
    return @"text-decoration:underline;";
  }
}

- (id)mapCellTextVAlign
{
  unint64_t wdValue = self->wdValue;
  if (wdValue > 2) {
    return &stru_26EBF24D8;
  }
  else {
    return off_264D686D8[wdValue];
  }
}

- (unint64_t)value
{
  return self->wdValue;
}

- (id)mapVerticalAlign
{
  unint64_t wdValue = self->wdValue;
  v3 = &stru_26EBF24D8;
  if (wdValue == 1) {
    v3 = @"vertical-align:super;";
  }
  if (wdValue == 2) {
    return @"vertical-align:sub;";
  }
  else {
    return v3;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p (value = %tu)>", objc_opt_class(), self, self->wdValue];
}

@end