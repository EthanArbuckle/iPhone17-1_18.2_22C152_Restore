@interface CNVCardUnknownPropertyDescription
- (BOOL)isEqual:(id)a3;
- (NSString)originalLine;
- (NSString)propertyName;
- (id)description;
- (void)setOriginalLine:(id)a3;
- (void)setPropertyName:(id)a3;
@end

@implementation CNVCardUnknownPropertyDescription

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CNVCardUnknownPropertyDescription *)self propertyName];
  v6 = [(CNVCardUnknownPropertyDescription *)self originalLine];
  v7 = [v3 stringWithFormat:@"<%@: %p %@='%@'>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    v9 = [(CNVCardUnknownPropertyDescription *)self propertyName];
    if (v9 || ([v8 propertyName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = [(CNVCardUnknownPropertyDescription *)self propertyName];
      v11 = [v8 propertyName];
      int v12 = [v10 isEqual:v11];

      if (v9)
      {

        if (v12) {
          goto LABEL_9;
        }
      }
      else
      {

        if (v12) {
          goto LABEL_9;
        }
      }
      char v17 = 0;
LABEL_19:

      goto LABEL_20;
    }
LABEL_9:
    v13 = [(CNVCardUnknownPropertyDescription *)self originalLine];
    if (v13 || ([v8 originalLine], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(CNVCardUnknownPropertyDescription *)self originalLine];
      v15 = [v8 originalLine];
      int v16 = [v14 isEqual:v15] ^ 1;

      if (v13)
      {
LABEL_18:

        char v17 = v16 ^ 1;
        goto LABEL_19;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }

    goto LABEL_18;
  }
  char v17 = 0;
LABEL_20:

  return v17;
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyName:(id)a3
{
}

- (NSString)originalLine
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOriginalLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLine, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end