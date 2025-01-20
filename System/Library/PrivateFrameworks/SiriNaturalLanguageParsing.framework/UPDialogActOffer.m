@interface UPDialogActOffer
- (NSString)description;
- (NSString)intent;
- (UPDialogActOffer)initWithIntent:(id)a3;
- (UPDialogActOffer)initWithIntent:(id)a3 entityWithValue:(id)a4;
- (UPEntityWithValue)entityWithValue;
@end

@implementation UPDialogActOffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityWithValue, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (UPEntityWithValue)entityWithValue
{
  return (UPEntityWithValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"UPDialogActOffer[intent: %@, entityWithValue: %@]", self->_intent, self->_entityWithValue];
}

- (UPDialogActOffer)initWithIntent:(id)a3
{
  return [(UPDialogActOffer *)self initWithIntent:a3 entityWithValue:0];
}

- (UPDialogActOffer)initWithIntent:(id)a3 entityWithValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPDialogActOffer;
  v8 = [(UPDialogActOffer *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    intent = v8->_intent;
    v8->_intent = (NSString *)v9;

    objc_storeStrong((id *)&v8->_entityWithValue, a4);
  }

  return v8;
}

@end