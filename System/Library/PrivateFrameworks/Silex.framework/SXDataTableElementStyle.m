@interface SXDataTableElementStyle
- (id)valueForLookupKey:(id)a3;
@end

@implementation SXDataTableElementStyle

- (id)valueForLookupKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"conditional"]) {
    goto LABEL_4;
  }
  v5 = [(SXJSONObject *)self jsonDictionary];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {

LABEL_4:
    v9.receiver = self;
    v9.super_class = (Class)SXDataTableElementStyle;
    v7 = [(SXJSONObject *)&v9 valueForLookupKey:v4];
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x263EFFA68];
LABEL_6:

  return v7;
}

@end