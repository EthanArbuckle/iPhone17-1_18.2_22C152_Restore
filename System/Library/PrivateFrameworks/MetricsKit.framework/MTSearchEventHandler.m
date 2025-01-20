@interface MTSearchEventHandler
- (id)eventType;
- (id)eventVersion:(id)a3;
@end

@implementation MTSearchEventHandler

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTSearchEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"search";
  }
  v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTSearchEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FD90;
  }
  id v5 = v3;

  return v5;
}

@end