@interface EPResourceManager
+ (Class)resourceClass;
+ (id)stringForResourceAvailability:(unint64_t)a3;
- (BOOL)invalidated;
- (BOOL)needsResource;
- (EPResourceManager)initWithQueue:(id)a3;
- (NSError)error;
- (OS_dispatch_queue)queue;
- (id)newResourceWithDelegate:(id)a3;
- (int64_t)referenceCounter;
- (unint64_t)availability;
- (void)createResource;
- (void)dealloc;
- (void)destroyResource;
- (void)enumerateResourcesWithBlock:(id)a3;
- (void)invalidate;
- (void)removeResource:(void *)a3 async:(BOOL)a4;
- (void)setAvailability:(unint64_t)a3 withError:(id)a4;
- (void)setNeedsResource:(BOOL)a3;
- (void)trackResource:(id)a3;
- (void)updateNeedsResource;
- (void)updateResourceAvailability;
@end

@implementation EPResourceManager

- (EPResourceManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EPResourceManager;
  v6 = [(EPResourceManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[NSPointerArray weakObjectsPointerArray];
    resources = v7->_resources;
    v7->_resources = (NSPointerArray *)v8;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)EPResourceManager;
  [(EPResourceManager *)&v2 dealloc];
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

+ (id)stringForResourceAvailability:(unint64_t)a3
{
  CFStringRef v3 = @"EPResourceAvailabilityResourceIsBecomingAvailable";
  if (a3 == 1) {
    CFStringRef v3 = @"EPResourceAvailabilityResourceIsAvailable";
  }
  if (a3 == 2) {
    return @"EPResourceAvailabilityResourceWillNotBecomeAvailable";
  }
  else {
    return (id)v3;
  }
}

- (id)newResourceWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "resourceClass")) initWithResourceManager:self andOwnerDelegate:v4];

  [(EPResourceManager *)self trackResource:v5];
  [(EPResourceManager *)self resourceWasAdded:v5];
  return v5;
}

- (void)trackResource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSPointerArray *)self->_resources allObjects];
    unsigned __int8 v6 = [v5 containsObject:v4];

    if (v6)
    {
      v7 = sub_1000A3C58();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        v9 = sub_1000A3C58();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          objc_super v11 = NSStringFromClass(v10);
          int v12 = 138412546;
          v13 = v11;
          __int16 v14 = 2048;
          id v15 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@[%p]: Avoiding a duplicate resource pointer (Crazy!)", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    else
    {
      [(NSPointerArray *)self->_resources addPointer:v4];
    }
    [(NSPointerArray *)self->_resources compact];
    [(EPResourceManager *)self updateNeedsResource];
    [v4 setAvailability:self->_availability withError:self->_error];
  }
}

- (int64_t)referenceCounter
{
  objc_super v2 = [(NSPointerArray *)self->_resources allObjects];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (void)updateNeedsResource
{
  id v3 = [(NSPointerArray *)self->_resources allObjects];
  -[EPResourceManager setNeedsResource:](self, "setNeedsResource:", [v3 count] != 0);
}

- (void)removeResource:(void *)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CA404;
  v8[3] = &unk_100166120;
  v8[4] = self;
  v8[5] = a3;
  unsigned __int8 v6 = objc_retainBlock(v8);
  v7 = v6;
  if (v4) {
    dispatch_async((dispatch_queue_t)self->_queue, v6);
  }
  else {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (void)setNeedsResource:(BOOL)a3
{
  if (self->_needsResource != a3)
  {
    self->_needsResource = a3;
    if (a3)
    {
      objc_storeStrong((id *)&self->_me, self);
      [(EPResourceManager *)self createResource];
    }
    else
    {
      [(EPResourceManager *)self destroyResource];
      me = self->_me;
      self->_me = 0;
    }
  }
}

- (void)setAvailability:(unint64_t)a3 withError:(id)a4
{
  v7 = (NSError *)a4;
  if (self->_availability != a3
    || (error = self->_error, error != v7) && ([(NSError *)error isEqual:v7] & 1) == 0)
  {
    self->_availability = a3;
    objc_storeStrong((id *)&self->_error, a4);
    if (v7)
    {
      v9 = sub_1000A3BC0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (v10)
      {
        objc_super v11 = sub_1000A3BC0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000FB8A8((uint64_t)self, (uint64_t)v7, v11);
        }
      }
    }
    [(EPResourceManager *)self updateResourceAvailability];
  }
}

- (void)updateResourceAvailability
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000CA664;
  v2[3] = &unk_1001683F8;
  v2[4] = self;
  [(EPResourceManager *)self enumerateResourcesWithBlock:v2];
}

- (void)enumerateResourcesWithBlock:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  id v6 = [(NSPointerArray *)self->_resources copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (v12
          && (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "invalidated", (void)v13) & 1) == 0)
        {
          v4[2](v4, v12);
        }
        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)invalidate
{
  self->_invalidated = 1;
  id v3 = sub_1000A3C58();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3C58();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412546;
      id v9 = v7;
      __int16 v10 = 2048;
      objc_super v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "invalidated %@[%p]", (uint8_t *)&v8, 0x16u);
    }
  }
  [(EPResourceManager *)self enumerateResourcesWithBlock:&stru_1001694C8];
}

- (void)createResource
{
  objc_super v2 = sub_1000A3BC0();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = sub_1000A3BC0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)[(id)objc_opt_class() resourceClass];
      id v6 = NSStringFromClass(v5);
      int v7 = 138412290;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating resource for %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)destroyResource
{
  [(EPResourceManager *)self setAvailability:0 withError:0];
  objc_super v2 = sub_1000A3BC0();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = sub_1000A3BC0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)[(id)objc_opt_class() resourceClass];
      id v6 = NSStringFromClass(v5);
      int v7 = 138412290;
      int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Destroying resource for %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)needsResource
{
  return self->_needsResource;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (NSError)error
{
  return self->_error;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resources, 0);

  objc_storeStrong((id *)&self->_me, 0);
}

@end