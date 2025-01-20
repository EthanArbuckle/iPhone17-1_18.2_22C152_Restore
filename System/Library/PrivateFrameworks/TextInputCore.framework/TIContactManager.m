@interface TIContactManager
+ (id)sharedTIContactManager;
+ (id)singletonInstance;
- (NSUUID)contactCollectionUUID;
- (id)addContactObserver:(id)a3;
@end

@implementation TIContactManager

+ (id)singletonInstance
{
  return 0;
}

+ (id)sharedTIContactManager
{
  return 0;
}

- (void).cxx_destruct
{
}

- (NSUUID)contactCollectionUUID
{
  return self->contactCollectionUUID;
}

- (id)addContactObserver:(id)a3
{
  return 0;
}

@end