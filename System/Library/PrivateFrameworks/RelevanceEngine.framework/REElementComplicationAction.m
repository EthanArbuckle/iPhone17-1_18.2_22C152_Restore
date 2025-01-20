@interface REElementComplicationAction
- (BOOL)isEqual:(id)a3;
- (NSString)slotIdentifier;
- (REElementComplicationAction)initWithSlotIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_performWithContext:(id)a3;
@end

@implementation REElementComplicationAction

- (REElementComplicationAction)initWithSlotIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementComplicationAction;
  v6 = [(REElementComplicationAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_slotIdentifier, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REElementComplicationAction;
  v4 = (id *)[(REElementComplicationAction *)&v6 copy];
  objc_storeStrong(v4 + 3, self->_slotIdentifier);
  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)REElementComplicationAction;
  v3 = [(REElementComplicationAction *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" slot=%@", self->_slotIdentifier];

  return v4;
}

- (void)_performWithContext:(id)a3
{
  v4 = [(REElementAction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(REElementAction *)self delegate];
    [v6 elementAction:self wantsToPerformTapActionForComplicationSlot:self->_slotIdentifier];
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_slotIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->_slotIdentifier isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSString)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void).cxx_destruct
{
}

@end