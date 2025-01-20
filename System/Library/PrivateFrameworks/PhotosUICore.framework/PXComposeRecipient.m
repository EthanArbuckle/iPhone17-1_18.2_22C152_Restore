@interface PXComposeRecipient
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSDictionary)diagnosticDictionary;
- (NSString)description;
- (NSString)localizedName;
- (PXComposeRecipient)initWithPersonSuggestion:(id)a3;
- (PXComposeRecipient)initWithPersonSuggestion:(id)a3 contact:(id)a4;
- (PXComposeRecipient)initWithRecipient:(id)a3;
- (PXPersonSuggestion)personSuggestion;
- (PXRecipient)recipient;
- (unint64_t)hash;
@end

@implementation PXComposeRecipient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSuggestion, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

- (PXPersonSuggestion)personSuggestion
{
  return self->_personSuggestion;
}

- (PXRecipient)recipient
{
  return self->_recipient;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PXComposeRecipient *)self localizedName];
  v6 = [(PXComposeRecipient *)self contact];
  v7 = [v3 stringWithFormat:@"<%@:%p, localizedName:%@, contact:%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = [(PXComposeRecipient *)self recipient];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 hash];
  }
  else
  {
    v6 = [(PXComposeRecipient *)self personSuggestion];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PXComposeRecipient *)self personSuggestion];
    uint64_t v7 = [v5 personSuggestion];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      char v9 = [v6 isEqual:v7];
    }
    else
    {
      v10 = [(PXComposeRecipient *)self recipient];
      v11 = [v5 recipient];
      char v9 = [v10 isEqual:v11];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDictionary)diagnosticDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PXComposeRecipient *)self localizedName];
  [v3 setObject:v4 forKeyedSubscript:@"Localized Name"];

  id v5 = [(PXComposeRecipient *)self contact];
  [v3 setObject:v5 forKeyedSubscript:@"Contact"];

  v6 = [(PXComposeRecipient *)self personSuggestion];
  uint64_t v7 = @"YES";
  if (!v6) {
    uint64_t v7 = @"NO";
  }
  v8 = v7;
  [v3 setObject:v8 forKeyedSubscript:@"isSuggestion"];

  return (NSDictionary *)v3;
}

- (CNContact)contact
{
  recipient = self->_recipient;
  if (recipient)
  {
    recipient = [recipient contact];
  }
  return (CNContact *)recipient;
}

- (NSString)localizedName
{
  recipient = self->_recipient;
  if (!recipient) {
    recipient = self->_personSuggestion;
  }
  id v4 = [recipient localizedName];
  return (NSString *)v4;
}

- (PXComposeRecipient)initWithPersonSuggestion:(id)a3 contact:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXComposeRecipient.m", 36, @"Invalid parameter not satisfying: %@", @"personSuggestion" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXComposeRecipient;
  v10 = [(PXComposeRecipient *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_personSuggestion, a3);
    uint64_t v12 = PXRecipientWithPersonSuggestion(v11->_personSuggestion, v9);
    recipient = v11->_recipient;
    v11->_recipient = (PXRecipient *)v12;
  }
  return v11;
}

- (PXComposeRecipient)initWithPersonSuggestion:(id)a3
{
  return [(PXComposeRecipient *)self initWithPersonSuggestion:a3 contact:0];
}

- (PXComposeRecipient)initWithRecipient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipient.m", 23, @"Invalid parameter not satisfying: %@", @"recipient" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXComposeRecipient;
  uint64_t v7 = [(PXComposeRecipient *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_recipient, a3);
  }

  return v8;
}

@end