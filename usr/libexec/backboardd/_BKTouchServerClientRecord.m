@interface _BKTouchServerClientRecord
- (_BKTouchServerClientRecord)init;
@end

@implementation _BKTouchServerClientRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestContextCategoryToContextIDs, 0);

  objc_storeStrong((id *)&self->_sceneHostSettings, 0);
}

- (_BKTouchServerClientRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BKTouchServerClientRecord;
  v2 = [(_BKTouchServerClientRecord *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sceneHostSettings = v2->_sceneHostSettings;
    v2->_sceneHostSettings = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hitTestContextCategoryToContextIDs = v2->_hitTestContextCategoryToContextIDs;
    v2->_hitTestContextCategoryToContextIDs = v5;
  }
  return v2;
}

@end