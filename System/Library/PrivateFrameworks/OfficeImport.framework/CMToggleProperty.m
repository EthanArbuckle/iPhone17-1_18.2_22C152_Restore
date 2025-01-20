@interface CMToggleProperty
- (CMToggleProperty)initWithCMTogglePropertyValue:(int)a3;
- (id)cssStringForName:(id)a3;
- (id)mapBold;
- (id)mapItalic;
- (id)mapStrikeTrough;
- (int)compareValue:(id)a3;
- (int)value;
- (void)resolveWithBaseProperty:(id)a3;
@end

@implementation CMToggleProperty

- (CMToggleProperty)initWithCMTogglePropertyValue:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMToggleProperty;
  v4 = [(CMToggleProperty *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->wdValue = a3;
    v6 = v4;
  }

  return v5;
}

- (void)resolveWithBaseProperty:(id)a3
{
  id v4 = a3;
  if (v4 && self->wdValue >= 2u)
  {
    id v5 = v4;
    self->wdValue = [v4 value] ^ (self->wdValue == 129);
    id v4 = v5;
  }
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  if ([v4 compare:0x26EC087B8])
  {
    if ([v4 compare:0x26EC087F8])
    {
      if ([v4 compare:0x26EC19678])
      {
        id v5 = 0;
        goto LABEL_9;
      }
      uint64_t v6 = [(CMToggleProperty *)self mapStrikeTrough];
    }
    else
    {
      uint64_t v6 = [(CMToggleProperty *)self mapItalic];
    }
  }
  else
  {
    uint64_t v6 = [(CMToggleProperty *)self mapBold];
  }
  id v5 = (void *)v6;
LABEL_9:

  return v5;
}

- (id)mapBold
{
  if (self->wdValue) {
    return @"font-weight:bold;";
  }
  else {
    return @"font-weight:normal;";
  }
}

- (id)mapItalic
{
  if (self->wdValue) {
    return @"font-style:italic;";
  }
  else {
    return &stru_26EBF24D8;
  }
}

- (int)value
{
  return self->wdValue;
}

- (id)mapStrikeTrough
{
  if (self->wdValue) {
    return @"text-decoration:line-through;";
  }
  else {
    return &stru_26EBF24D8;
  }
}

- (int)compareValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int wdValue = self->wdValue;
    if (wdValue == [v4 value]) {
      int v6 = 0;
    }
    else {
      int v6 = -1;
    }
  }
  else
  {
    int v6 = -1;
  }

  return v6;
}

@end