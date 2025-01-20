@interface SUUIPropertyPredicateViewElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)property;
- (NSString)value;
- (SUUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (id)entityValuePredicate;
- (int64_t)comparisonType;
@end

@implementation SUUIPropertyPredicateViewElement

- (SUUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIPropertyPredicateViewElement;
  v9 = [(SUUIViewElement *)&v20 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"property"];
    if ([v10 length])
    {
      uint64_t v11 = [v10 copy];
      property = v9->_property;
      v9->_property = (NSString *)v11;
    }
    v13 = [v8 getAttribute:@"value"];
    if ([v13 length])
    {
      uint64_t v14 = [v13 copy];
      value = v9->_value;
      v9->_value = (NSString *)v14;
    }
    v16 = [v8 getAttribute:@"comparisonType"];
    if ([v16 length])
    {
      id v17 = v16;
      if ([v17 isEqualToString:@"not-equal"])
      {
        uint64_t v18 = 1;
      }
      else if ([v17 isEqualToString:@"greater-than"])
      {
        uint64_t v18 = 2;
      }
      else if ([v17 isEqualToString:@"greater-than-or-equal"])
      {
        uint64_t v18 = 3;
      }
      else if ([v17 isEqualToString:@"less-than"])
      {
        uint64_t v18 = 4;
      }
      else if ([v17 isEqualToString:@"less-than-or-equal"])
      {
        uint64_t v18 = 5;
      }
      else
      {
        uint64_t v18 = 0;
      }

      v9->_comparisonType = v18;
    }
  }
  return v9;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIPropertyPredicateViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPropertyPredicateViewElement;
  v5 = [(SUUIViewElement *)&v14 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_comparisonType = [(SUUIPropertyPredicateViewElement *)v4 comparisonType];
    v7 = [(SUUIPropertyPredicateViewElement *)v4 property];
    id v8 = (NSString *)[v7 copy];
    property = self->_property;
    self->_property = v8;

    v10 = [(SUUIPropertyPredicateViewElement *)v4 value];
    uint64_t v11 = (NSString *)[v10 copy];
    value = self->_value;
    self->_value = v11;
  }
  return v6;
}

- (id)entityValuePredicate
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke;
  v4[3] = &unk_265405820;
  v4[4] = self;
  v2 = [MEMORY[0x263F08A98] predicateWithBlock:v4];
  return v2;
}

uint64_t __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 conformsToProtocol:&unk_270681CD0])
  {
    id v7 = v5;
    id v8 = [*(id *)(a1 + 32) property];
    v9 = [v7 valueForEntityProperty:v8];

    v10 = [*(id *)(a1 + 32) value];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [*(id *)(a1 + 32) property];
      uint64_t v12 = [v7 nativeValueForStringValue:v10 forProperty:v11];

      v10 = (void *)v12;
    }
    uint64_t v13 = [*(id *)(a1 + 32) comparisonType];
    if (v13 == 1)
    {
      if (v9 == v10) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = [v9 isEqual:v10] ^ 1;
      }
    }
    else if (v13)
    {
      uint64_t v14 = 0;
      if (v9 && v10)
      {
        unint64_t v15 = [v9 compare:v10];
        switch([*(id *)(a1 + 32) comparisonType])
        {
          case 2:
            uint64_t v14 = v15 == 1;
            break;
          case 3:
            BOOL v16 = v15 >= 2;
            goto LABEL_19;
          case 4:
          case 5:
            BOOL v16 = v15 + 1 >= 2;
LABEL_19:
            uint64_t v14 = !v16;
            break;
          default:
            __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1();
        }
      }
    }
    else if (v9 == v10)
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = [v9 isEqual:v10];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

void __56__SUUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1()
{
}

@end