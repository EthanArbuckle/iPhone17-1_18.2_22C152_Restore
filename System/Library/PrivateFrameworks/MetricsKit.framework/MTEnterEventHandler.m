@interface MTEnterEventHandler
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)osLanguages:(id)a3;
@end

@implementation MTEnterEventHandler

- (id)knownFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTEnterEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"extRefUrl";
    v10[1] = @"osLanguages";
    v10[2] = @"refApp";
    v10[3] = @"type";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTEnterEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"enter";
  }
  char v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTEnterEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FD18;
  }
  id v5 = v3;

  return v5;
}

- (id)osLanguages:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 osLanguages:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"osLanguages"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    objc_super v7 = v8;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 system];
  v13 = [v12 environment];
  v10 = [v13 osLanguages];

LABEL_7:

  return v10;
}

@end