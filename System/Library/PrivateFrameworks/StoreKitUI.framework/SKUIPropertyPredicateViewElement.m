@interface SKUIPropertyPredicateViewElement
+ (BOOL)shouldParseChildDOMElements;
- (NSString)property;
- (NSString)value;
- (SKUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (id)entityValuePredicate;
- (int64_t)comparisonType;
@end

@implementation SKUIPropertyPredicateViewElement

- (SKUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPropertyPredicateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIPropertyPredicateViewElement;
  v11 = [(SKUIViewElement *)&v22 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"property"];
    if ([v12 length])
    {
      uint64_t v13 = [v12 copy];
      property = v11->_property;
      v11->_property = (NSString *)v13;
    }
    v15 = [v8 getAttribute:@"value"];
    if ([v15 length])
    {
      uint64_t v16 = [v15 copy];
      value = v11->_value;
      v11->_value = (NSString *)v16;
    }
    v18 = [v8 getAttribute:@"comparisonType"];
    if ([v18 length])
    {
      id v19 = v18;
      if ([v19 isEqualToString:@"not-equal"])
      {
        uint64_t v20 = 1;
      }
      else if ([v19 isEqualToString:@"greater-than"])
      {
        uint64_t v20 = 2;
      }
      else if ([v19 isEqualToString:@"greater-than-or-equal"])
      {
        uint64_t v20 = 3;
      }
      else if ([v19 isEqualToString:@"less-than"])
      {
        uint64_t v20 = 4;
      }
      else if ([v19 isEqualToString:@"less-than-or-equal"])
      {
        uint64_t v20 = 5;
      }
      else
      {
        uint64_t v20 = 0;
      }

      v11->_comparisonType = v20;
    }
  }
  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIPropertyPredicateViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SKUIPropertyPredicateViewElement;
  v5 = [(SKUIViewElement *)&v14 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_comparisonType = [(SKUIPropertyPredicateViewElement *)v4 comparisonType];
    v7 = [(SKUIPropertyPredicateViewElement *)v4 property];
    id v8 = (NSString *)[v7 copy];
    property = self->_property;
    self->_property = v8;

    id v10 = [(SKUIPropertyPredicateViewElement *)v4 value];
    v11 = (NSString *)[v10 copy];
    value = self->_value;
    self->_value = v11;
  }

  return v6;
}

- (id)entityValuePredicate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke;
  v4[3] = &unk_1E6426AB0;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:v4];

  return v2;
}

uint64_t __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 conformsToProtocol:&unk_1F1E12470])
  {
    id v7 = v5;
    id v8 = [*(id *)(a1 + 32) property];
    id v9 = [v7 valueForEntityProperty:v8];

    id v10 = [*(id *)(a1 + 32) value];
    if (objc_opt_respondsToSelector())
    {
      v11 = [*(id *)(a1 + 32) property];
      uint64_t v12 = [v7 nativeValueForStringValue:v10 forProperty:v11];

      id v10 = (void *)v12;
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
            __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1();
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPropertyPredicateViewElement initWithDOMElement:parent:elementFactory:]";
}

void __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1()
{
}

@end