@interface PSGInputSuggestionsResponseItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (PSGInputSuggestionsResponseItem)initWithCoder:(id)a3;
- (PSGInputSuggestionsResponseItem)initWithTextualResponseSuggestion:(id)a3 structuredInfoSuggestion:(id)a4;
- (PSGStructuredInfoSuggestion)structuredInfoSuggestion;
- (PSGTextualResponseSuggestion)textualResponseSuggestion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)predictedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGInputSuggestionsResponseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredInfoSuggestion, 0);
  objc_storeStrong((id *)&self->_textualResponseSuggestion, 0);
}

- (PSGStructuredInfoSuggestion)structuredInfoSuggestion
{
  return self->_structuredInfoSuggestion;
}

- (PSGTextualResponseSuggestion)textualResponseSuggestion
{
  return self->_textualResponseSuggestion;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PSGInputSuggestionsResponseItem trs:%@ sis:%@>", self->_textualResponseSuggestion, self->_structuredInfoSuggestion];
  return v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PSGTextualResponseSuggestion *)self->_textualResponseSuggestion hash];
  return [(PSGStructuredInfoSuggestion *)self->_structuredInfoSuggestion hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSGInputSuggestionsResponseItem *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGInputSuggestionsResponseItem *)self isEqualToItem:v5];

  return v6;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  textualResponseSuggestion = self->_textualResponseSuggestion;
  v7 = (PSGTextualResponseSuggestion *)*((id *)v4 + 1);
  if (textualResponseSuggestion == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = textualResponseSuggestion;
    BOOL v10 = [(PSGTextualResponseSuggestion *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_structuredInfoSuggestion;
  v13 = v12;
  if (v12 == (PSGStructuredInfoSuggestion *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[PSGStructuredInfoSuggestion isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    id v6 = [(PSGTextualResponseSuggestion *)self->_textualResponseSuggestion copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    id v8 = [(PSGStructuredInfoSuggestion *)self->_structuredInfoSuggestion copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  textualResponseSuggestion = self->_textualResponseSuggestion;
  id v5 = a3;
  [v5 encodeObject:textualResponseSuggestion forKey:@"trs"];
  [v5 encodeObject:self->_structuredInfoSuggestion forKey:@"sis"];
}

- (PSGInputSuggestionsResponseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trs"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sis"];

  v7 = [(PSGInputSuggestionsResponseItem *)self initWithTextualResponseSuggestion:v5 structuredInfoSuggestion:v6];
  return v7;
}

- (id)predictedValue
{
  textualResponseSuggestion = self->_textualResponseSuggestion;
  if (textualResponseSuggestion)
  {
    id v4 = [(PSGTextualResponseSuggestion *)textualResponseSuggestion responseText];
  }
  else
  {
    structuredInfoSuggestion = self->_structuredInfoSuggestion;
    if (structuredInfoSuggestion)
    {
      id v4 = [(PSGStructuredInfoSuggestion *)structuredInfoSuggestion predictedValue];
    }
    else
    {
      id v4 = &stru_26BE112E8;
    }
  }
  return v4;
}

- (PSGInputSuggestionsResponseItem)initWithTextualResponseSuggestion:(id)a3 structuredInfoSuggestion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggestionsResponseItem;
  v9 = [(PSGInputSuggestionsResponseItem *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textualResponseSuggestion, a3);
    objc_storeStrong((id *)&v10->_structuredInfoSuggestion, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end