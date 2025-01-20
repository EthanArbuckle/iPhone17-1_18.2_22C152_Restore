@interface LNPhotoItemCollection(Workflow)
- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:;
- (id)serializedRepresentation;
@end

@implementation LNPhotoItemCollection(Workflow)

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 items];
  v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_175_28933);

  [v2 setObject:v4 forKey:@"items"];
  return v2;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    v7 = [v6 objectForKey:@"items"];
    uint64_t v8 = objc_opt_class();
    v9 = WFEnforceClass(v7, v8);

    if (v9)
    {
      v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_28939);
      a1 = (id)[a1 initWithItems:v10];

      id v11 = a1;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end