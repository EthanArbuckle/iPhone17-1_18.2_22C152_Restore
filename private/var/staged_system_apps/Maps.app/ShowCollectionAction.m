@interface ShowCollectionAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (GEOURLCollectionStorage)collectionStorage;
- (ShowCollectionAction)initWithCollectionStorage:(id)a3;
- (int)analyticsLaunchActionType;
- (void)setCollectionStorage:(id)a3;
@end

@implementation ShowCollectionAction

- (ShowCollectionAction)initWithCollectionStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ShowCollectionAction;
  v6 = [(ShowCollectionAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionStorage, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 4;
}

- (GEOURLCollectionStorage)collectionStorage
{
  return self->_collectionStorage;
}

- (void)setCollectionStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end