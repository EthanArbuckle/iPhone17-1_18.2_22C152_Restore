@interface MTClickEventHandler
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
@end

@implementation MTClickEventHandler

- (id)knownFields
{
  v10[9] = *MEMORY[0x263EF8340];
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
    v9.super_class = (Class)MTClickEventHandler;
    v5 = [(MTImpressionableEventHandler *)&v9 knownFields];
    v10[0] = @"actionContext";
    v10[1] = @"actionDetails";
    v10[2] = @"actionType";
    v10[3] = @"actionUrl";
    v10[4] = @"location";
    v10[5] = @"targetId";
    v10[6] = @"targetType";
    v10[7] = @"positionX";
    v10[8] = @"positionY";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:9];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTClickEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"click";
  }
  char v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTClickEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FE38;
  }
  id v5 = v3;

  return v5;
}

@end