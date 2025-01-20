@interface NPKPassUserNotification
- (NPKPassUserNotification)initWithPass:(id)a3;
- (NSArray)identifierHashComponents;
- (PKPass)pass;
@end

@implementation NPKPassUserNotification

- (NPKPassUserNotification)initWithPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKPassUserNotification;
  v6 = [(NPKPassUserNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (NSArray)identifierHashComponents
{
  v8.receiver = self;
  v8.super_class = (Class)NPKPassUserNotification;
  v3 = [(NPKUserNotification *)&v8 identifierHashComponents];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(NPKPassUserNotification *)self pass];
  v6 = [v5 uniqueID];
  [v4 safelyAddObject:v6];

  return (NSArray *)v4;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
}

@end