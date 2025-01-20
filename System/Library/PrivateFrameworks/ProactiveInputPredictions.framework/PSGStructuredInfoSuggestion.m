@interface PSGStructuredInfoSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isApplePay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (PPQuickTypeItem)portraitItem;
- (PSGOperationalPredictedItem)operationalItem;
- (PSGProactiveTrigger)proactiveTrigger;
- (PSGStructuredInfoSuggestion)initWithCoder:(id)a3;
- (PSGStructuredInfoSuggestion)initWithProactiveTrigger:(id)a3 portraitItem:(id)a4 operationalItem:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)predictedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGStructuredInfoSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalItem, 0);
  objc_storeStrong((id *)&self->_portraitItem, 0);
  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
}

- (PSGOperationalPredictedItem)operationalItem
{
  return self->_operationalItem;
}

- (PPQuickTypeItem)portraitItem
{
  return self->_portraitItem;
}

- (PSGProactiveTrigger)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PSGInputSuggestionsResponseItem prt:%@ ppi:%@ opi:%@>", self->_proactiveTrigger, self->_portraitItem, self->_operationalItem];
  return v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PSGProactiveTrigger *)self->_proactiveTrigger hash];
  uint64_t v4 = [(PPQuickTypeItem *)self->_portraitItem hash] - v3 + 32 * v3;
  return [(PSGOperationalPredictedItem *)self->_operationalItem hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PSGStructuredInfoSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGStructuredInfoSuggestion *)self isEqualToItem:v5];

  return v6;
}

- (BOOL)isEqualToItem:(id)a3
{
  uint64_t v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  proactiveTrigger = self->_proactiveTrigger;
  v7 = (PSGProactiveTrigger *)v4[1];
  if (proactiveTrigger == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = proactiveTrigger;
    BOOL v10 = [(PSGProactiveTrigger *)v9 isEqual:v8];

    if (!v10) {
      goto LABEL_8;
    }
  }
  portraitItem = self->_portraitItem;
  v12 = (PPQuickTypeItem *)v5[2];
  if (portraitItem == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = portraitItem;
    char v15 = [(PPQuickTypeItem *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_8:
      char v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_operationalItem;
  v18 = v17;
  if (v17 == v5[3]) {
    char v16 = 1;
  }
  else {
    char v16 = -[PSGOperationalPredictedItem isEqual:](v17, "isEqual:");
  }

LABEL_14:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    id v6 = [(PSGProactiveTrigger *)self->_proactiveTrigger copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(PPQuickTypeItem *)self->_portraitItem copy];
    v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(PSGOperationalPredictedItem *)self->_operationalItem copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  proactiveTrigger = self->_proactiveTrigger;
  id v5 = a3;
  [v5 encodeObject:proactiveTrigger forKey:@"prt"];
  [v5 encodeObject:self->_portraitItem forKey:@"ppi"];
  [v5 encodeObject:self->_operationalItem forKey:@"opi"];
}

- (PSGStructuredInfoSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prt"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ppi"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"opi"];
    self = [(PSGStructuredInfoSuggestion *)self initWithProactiveTrigger:v5 portraitItem:v6 operationalItem:v7];

    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isApplePay
{
  operationalItem = self->_operationalItem;
  if (!operationalItem) {
    return 0;
  }
  id v4 = [(PSGOperationalPredictedItem *)operationalItem itemIdentifier];
  if (v4)
  {
    id v5 = [(PSGOperationalPredictedItem *)self->_operationalItem itemIdentifier];
    char v6 = [v5 isEqualToString:@"surf"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)predictedValue
{
  portraitItem = self->_portraitItem;
  if (portraitItem || (portraitItem = self->_operationalItem) != 0)
  {
    id v4 = [portraitItem value];
  }
  else
  {
    id v4 = &stru_26BE112E8;
  }
  return v4;
}

- (PSGStructuredInfoSuggestion)initWithProactiveTrigger:(id)a3 portraitItem:(id)a4 operationalItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSGStructuredInfoSuggestion;
  v12 = [(PSGStructuredInfoSuggestion *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proactiveTrigger, a3);
    objc_storeStrong((id *)&v13->_portraitItem, a4);
    objc_storeStrong((id *)&v13->_operationalItem, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end