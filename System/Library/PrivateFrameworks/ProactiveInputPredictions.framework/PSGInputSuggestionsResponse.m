@interface PSGInputSuggestionsResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (NSArray)responseItems;
- (PSGInputSuggestionsExplanationSet)explanationSet;
- (PSGInputSuggestionsResponse)initWithCoder:(id)a3;
- (PSGInputSuggestionsResponse)initWithResponseItems:(id)a3 explanationSet:(id)a4;
- (double)servingTimeMillis;
- (double)triggeringTimeMillis;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)triggeredItemsCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setServingTimeMillis:(double)a3;
- (void)setTriggeredItemsCount:(int)a3;
- (void)setTriggeringTimeMillis:(double)a3;
@end

@implementation PSGInputSuggestionsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanationSet, 0);
  objc_storeStrong((id *)&self->_responseItems, 0);
}

- (void)setServingTimeMillis:(double)a3
{
  self->_servingTimeMillis = a3;
}

- (double)servingTimeMillis
{
  return self->_servingTimeMillis;
}

- (void)setTriggeredItemsCount:(int)a3
{
  self->_triggeredItemsCount = a3;
}

- (int)triggeredItemsCount
{
  return self->_triggeredItemsCount;
}

- (void)setTriggeringTimeMillis:(double)a3
{
  self->_triggeringTimeMillis = a3;
}

- (double)triggeringTimeMillis
{
  return self->_triggeringTimeMillis;
}

- (PSGInputSuggestionsExplanationSet)explanationSet
{
  return self->_explanationSet;
}

- (NSArray)responseItems
{
  return self->_responseItems;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"<PSGInputSuggestionsResponse ris:(");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_responseItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendString:v9];

        [v3 appendString:@"; "];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[[NSString alloc] initWithFormat:@" eps:%@>"], self->_explanationSet);
  [v3 appendString:v10];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_responseItems hash];
  return [(PSGInputSuggestionsExplanationSet *)self->_explanationSet hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSGInputSuggestionsResponse *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGInputSuggestionsResponse *)self isEqualToResponse:v5];

  return v6;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  responseItems = self->_responseItems;
  uint64_t v7 = (NSArray *)*((id *)v4 + 2);
  if (responseItems == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = responseItems;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  long long v12 = self->_explanationSet;
  long long v13 = v12;
  if (v12 == (PSGInputSuggestionsExplanationSet *)v5[3]) {
    char v11 = 1;
  }
  else {
    char v11 = -[PSGInputSuggestionsExplanationSet isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSArray *)self->_responseItems copyWithZone:a3];
    uint64_t v7 = (void *)v5[2];
    v5[2] = v6;

    id v8 = [(PSGInputSuggestionsExplanationSet *)self->_explanationSet copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  responseItems = self->_responseItems;
  id v5 = a3;
  [v5 encodeObject:responseItems forKey:@"ris"];
  [v5 encodeObject:self->_explanationSet forKey:@"eps"];
}

- (PSGInputSuggestionsResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2105116B0]();
  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ris"];
  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eps"];
  char v11 = [(PSGInputSuggestionsResponse *)self initWithResponseItems:v9 explanationSet:v10];

  return v11;
}

- (PSGInputSuggestionsResponse)initWithResponseItems:(id)a3 explanationSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggestionsResponse;
  v9 = [(PSGInputSuggestionsResponse *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseItems, a3);
    objc_storeStrong((id *)&v10->_explanationSet, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end