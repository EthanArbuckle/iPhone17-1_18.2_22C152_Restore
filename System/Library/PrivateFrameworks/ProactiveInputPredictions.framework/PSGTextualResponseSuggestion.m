@interface PSGTextualResponseSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextualSuggestion:(id)a3;
- (NSString)responseCategory;
- (NSString)responseText;
- (PSGTextualResponseSuggestion)initWithCoder:(id)a3;
- (PSGTextualResponseSuggestion)initWithText:(id)a3 category:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGTextualResponseSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCategory, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
}

- (NSString)responseCategory
{
  return self->_responseCategory;
}

- (NSString)responseText
{
  return self->_responseText;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PSGTextualResponseSuggestion txt:%@ cat:%@>", self->_responseText, self->_responseCategory];
  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_responseText hash];
  return [(NSString *)self->_responseCategory hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSGTextualResponseSuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGTextualResponseSuggestion *)self isEqualToTextualSuggestion:v5];

  return v6;
}

- (BOOL)isEqualToTextualSuggestion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  responseText = self->_responseText;
  v7 = (NSString *)*((id *)v4 + 1);
  if (responseText == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = responseText;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_responseCategory;
  v13 = v12;
  if (v12 == (NSString *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSString isEqual:](v12, "isEqual:");
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
    uint64_t v6 = [(NSString *)self->_responseText copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_responseCategory copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  responseText = self->_responseText;
  id v5 = a3;
  [v5 encodeObject:responseText forKey:@"txt"];
  [v5 encodeObject:self->_responseCategory forKey:@"cat"];
}

- (PSGTextualResponseSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"txt"];
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"cat"];

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = [(PSGTextualResponseSuggestion *)self initWithText:v6 category:v7];
    v9 = self;
  }

  return v9;
}

- (PSGTextualResponseSuggestion)initWithText:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGTextualResponseSuggestion;
  v9 = [(PSGTextualResponseSuggestion *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseText, a3);
    objc_storeStrong((id *)&v10->_responseCategory, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end