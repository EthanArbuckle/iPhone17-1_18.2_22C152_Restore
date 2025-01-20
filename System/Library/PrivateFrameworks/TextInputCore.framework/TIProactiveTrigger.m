@interface TIProactiveTrigger
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (TIProactiveTrigger)initWithSourceType:(unsigned __int8)a3 attributes:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)triggerSourceType;
@end

@implementation TIProactiveTrigger

- (void).cxx_destruct
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (unsigned)triggerSourceType
{
  return self->_triggerSourceType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TIProactiveTrigger *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self->_triggerSourceType == *((unsigned __int8 *)v6 + 8))
    {
      attributes = self->_attributes;
      if (attributes == v6[2]) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSDictionary isEqual:](attributes, "isEqual:");
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_attributes hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 8) = self->_triggerSourceType;
    uint64_t v7 = [(NSDictionary *)self->_attributes copyWithZone:a3];
    char v8 = (void *)v6[2];
    v6[2] = v7;
  }
  return v6;
}

- (TIProactiveTrigger)initWithSourceType:(unsigned __int8)a3 attributes:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIProactiveTrigger;
  uint64_t v7 = [(TIProactiveTrigger *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    v7->_triggerSourceType = a3;
    uint64_t v9 = [v6 copy];
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;
  }
  return v8;
}

@end