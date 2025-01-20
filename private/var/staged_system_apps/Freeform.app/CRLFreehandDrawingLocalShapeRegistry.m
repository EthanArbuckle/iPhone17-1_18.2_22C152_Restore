@interface CRLFreehandDrawingLocalShapeRegistry
+ (id)sharedInstance;
- (BOOL)consumeLocallyDrawnShapeItemUUID:(id)a3;
- (CRLFreehandDrawingLocalShapeRegistry)init;
- (void)registerLocallyDrawnShapeItem:(id)a3;
@end

@implementation CRLFreehandDrawingLocalShapeRegistry

+ (id)sharedInstance
{
  if (qword_1016A9180 != -1) {
    dispatch_once(&qword_1016A9180, &stru_1014DC2F0);
  }
  v2 = (void *)qword_1016A9178;

  return v2;
}

- (CRLFreehandDrawingLocalShapeRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingLocalShapeRegistry;
  v2 = [(CRLFreehandDrawingLocalShapeRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    localShapeUUIDs = v2->_localShapeUUIDs;
    v2->_localShapeUUIDs = v3;

    v2->_localShapeUUIDLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v2;
}

- (void)registerLocallyDrawnShapeItem:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_localShapeUUIDLock);
  localShapeUUIDs = self->_localShapeUUIDs;
  v5 = [v6 id];
  [(NSMutableOrderedSet *)localShapeUUIDs addObject:v5];

  if ((unint64_t)[(NSMutableOrderedSet *)self->_localShapeUUIDs count] >= 0x33)
  {
    do
      [(NSMutableOrderedSet *)self->_localShapeUUIDs removeObjectAtIndex:0];
    while ((unint64_t)[(NSMutableOrderedSet *)self->_localShapeUUIDs count] > 0x32);
  }
  os_unfair_lock_unlock(&self->_localShapeUUIDLock);
}

- (BOOL)consumeLocallyDrawnShapeItemUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_localShapeUUIDLock);
  unsigned int v5 = [(NSMutableOrderedSet *)self->_localShapeUUIDs containsObject:v4];
  if (v5) {
    [(NSMutableOrderedSet *)self->_localShapeUUIDs removeObject:v4];
  }
  os_unfair_lock_unlock(&self->_localShapeUUIDLock);

  return v5;
}

- (void).cxx_destruct
{
}

@end