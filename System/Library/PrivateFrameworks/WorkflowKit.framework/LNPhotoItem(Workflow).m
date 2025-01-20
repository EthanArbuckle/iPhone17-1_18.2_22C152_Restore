@interface LNPhotoItem(Workflow)
- (id)initWithSerializedRepresentation:()Workflow;
- (id)serializedRepresentation;
@end

@implementation LNPhotoItem(Workflow)

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 identifier];
  [v2 setObject:v3 forKey:@"identifier"];

  v4 = [a1 type];
  [v2 setObject:v4 forKey:@"type"];

  return v2;
}

- (id)initWithSerializedRepresentation:()Workflow
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    v7 = [v6 objectForKey:@"identifier"];
    uint64_t v8 = objc_opt_class();
    v9 = WFEnforceClass(v7, v8);

    v10 = [v6 objectForKey:@"type"];
    uint64_t v11 = objc_opt_class();
    v12 = WFEnforceClass(v10, v11);

    a1 = (id)[a1 initWithIdentifier:v9 type:v12];
    id v13 = a1;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end