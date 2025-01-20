@interface SXDataDescriptor
- (id)description;
- (id)formatWithValue:(id)a3 withType:(int)a4;
- (id)labelWithValue:(id)a3 withType:(int)a4;
- (unint64_t)dataTypeWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXDataDescriptor

- (id)formatWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKey:@"type"];
    if (v6)
    {
      id v7 = objc_alloc(+[SXClassFactory classForBaseClass:objc_opt_class() type:v6]);
      v8 = [(SXJSONObject *)self specificationVersion];
      v9 = (void *)[v7 initWithJSONObject:v5 andVersion:v8];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)labelWithValue:(id)a3 withType:(int)a4
{
  id v5 = [(SXJSONObject *)self valueForLookupKey:@"label", *(void *)&a4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [SXFormattedText alloc];
    id v7 = [(SXJSONObject *)self specificationVersion];
    v8 = [(SXJSONObject *)v6 initWithJSONObject:v5 andVersion:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v5;
    }
    else {
      id v7 = &stru_26D5311C0;
    }
    v8 = [[SXFormattedText alloc] initWithText:v7];
  }
  v9 = v8;

  return v9;
}

- (unint64_t)dataTypeWithValue:(id)a3 withType:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 3)
  {
    if ([v5 isEqualToString:@"string"])
    {
      unint64_t v7 = 1;
    }
    else if ([v6 isEqualToString:@"text"])
    {
      unint64_t v7 = 2;
    }
    else if ([v6 isEqualToString:@"number"])
    {
      unint64_t v7 = 3;
    }
    else if ([v6 isEqualToString:@"integer"])
    {
      unint64_t v7 = 4;
    }
    else if ([v6 isEqualToString:@"float"])
    {
      unint64_t v7 = 5;
    }
    else if ([v6 isEqualToString:@"image"])
    {
      unint64_t v7 = 6;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p;", objc_opt_class(), self];
  v4 = [(SXDataDescriptor *)self key];
  [v3 appendFormat:@" key: %@", v4];

  id v5 = [(SXJSONObject *)self valueForLookupKey:@"dataType"];
  [v3 appendFormat:@" dataType: %@", v5];

  uint64_t v6 = [(SXDataDescriptor *)self identifier];
  unint64_t v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"(undefined)";
  }
  v9 = v8;

  [v3 appendFormat:@" identifier: %@;", v9];
  uint64_t v10 = [(SXDataDescriptor *)self label];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"(undefined)";
  }
  v13 = v12;

  [v3 appendFormat:@" label: %@>", v13];
  return v3;
}

@end