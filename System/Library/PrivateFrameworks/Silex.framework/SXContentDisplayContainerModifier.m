@interface SXContentDisplayContainerModifier
- (NSMutableDictionary)containers;
- (SXContentDisplayContainerModifier)init;
- (void)ensureWrappingContainerComponentForComponents:(id)a3 parentComponent:(id)a4;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXContentDisplayContainerModifier

- (SXContentDisplayContainerModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXContentDisplayContainerModifier;
  v2 = [(SXContentDisplayContainerModifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    containers = v2->_containers;
    v2->_containers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5 = [a3 components];
  [(SXContentDisplayContainerModifier *)self ensureWrappingContainerComponentForComponents:v5 parentComponent:0];
}

- (void)ensureWrappingContainerComponentForComponents:(id)a3 parentComponent:(id)a4
{
  v34[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = 0;
    v9 = &selRef_resolveComponentLayouts;
    id v30 = v7;
    v31 = self;
    while (1)
    {
      v10 = objc_msgSend(v6, "componentAtIndex:", v8, v30);
      v11 = [v7 contentDisplay];
      if (![v11 conformsToProtocol:v9[319]]) {
        break;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_8;
      }
      v13 = [(SXContentDisplayContainerModifier *)self containers];
      v14 = [v10 identifier];
      v15 = [v13 objectForKey:v14];

      v16 = [v15 identifier];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        v20 = [MEMORY[0x263F08C38] UUID];
        id v18 = [v20 UUIDString];
      }
      v33[0] = @"identifier";
      v33[1] = @"type";
      v34[0] = v18;
      v34[1] = @"container";
      v34[2] = @"container";
      v33[2] = @"role";
      v33[3] = @"layout";
      v21 = [v10 layout];
      v34[3] = v21;
      v33[4] = @"components";
      v22 = [v10 JSONRepresentation];
      v32 = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      v34[4] = v23;
      v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];

      v25 = [SXContainerComponent alloc];
      v26 = [v10 specificationVersion];
      v27 = [(SXJSONObject *)v25 initWithJSONObject:v24 andVersion:v26];

      [v6 replaceComponentAtIndex:v8 withComponent:v27];
      v28 = [(SXContentDisplayContainerModifier *)v31 containers];
      v29 = [v10 identifier];
      [v28 setObject:v27 forKey:v29];

      self = v31;
      id v7 = v30;
      v9 = &selRef_resolveComponentLayouts;
LABEL_12:

      if (++v8 >= (unint64_t)[v6 count]) {
        goto LABEL_13;
      }
    }

LABEL_8:
    v19 = [v10 identifier];
    v15 = [v6 componentsForContainerComponentWithIdentifier:v19];

    if (v15) {
      [(SXContentDisplayContainerModifier *)self ensureWrappingContainerComponentForComponents:v15 parentComponent:v10];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (NSMutableDictionary)containers
{
  return self->_containers;
}

- (void).cxx_destruct
{
}

@end