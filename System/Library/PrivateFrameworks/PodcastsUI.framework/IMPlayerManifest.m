@interface IMPlayerManifest
+ (id)_activityType;
+ (id)activityTypeSuffix;
+ (id)supportedActivityTypes;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)registerManifestForRestoration:(Class)a3;
+ (void)restoreActivity:(id)a3 completion:(id)a4;
- (BOOL)hasNext;
- (BOOL)hasPrevious;
- (BOOL)isLoaded;
- (BOOL)isPlaceholder;
- (IMPlayerItem)currentItem;
- (IMPlayerManifest)init;
- (NSString)identifier;
- (NSString)title;
- (NSUserActivity)activity;
- (OS_dispatch_queue)queue;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)currentIndex;
- (void)_load:(id)a3;
- (void)load:(id)a3;
- (void)next;
- (void)nextManifest:(id)a3;
- (void)postLoadedAdditionalItemsNotification;
- (void)postManifestDidChangeNotification;
- (void)previous;
- (void)setActivity:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setCurrentItem:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IMPlayerManifest

+ (void)registerManifestForRestoration:(Class)a3
{
  if (registerManifestForRestoration__onceToken != -1) {
    dispatch_once(&registerManifestForRestoration__onceToken, &__block_literal_global_4);
  }
  uint64_t v4 = [(objc_class *)a3 _activityType];
  if (v4) {
    [(id)_activityTypeToClassMap setObject:a3 forKey:v4];
  }

  MEMORY[0x1F41817F8]();
}

+ (id)_activityType
{
  v2 = [a1 activityTypeSuffix];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 bundleIdentifier];

    v5 = [NSString stringWithFormat:@"%@.playback.%@", v4, v2];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__IMPlayerManifest_registerManifestForRestoration___block_invoke()
{
  _activityTypeToClassMap = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

- (IMPlayerManifest)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMPlayerManifest;
  v2 = [(IMPlayerManifest *)&v13 init];
  if (v2)
  {
    v3 = NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"%@.worker_queue", v5];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    [(IMPlayerManifest *)v2 setQueue:v7];

    currentItem = v2->_currentItem;
    v2->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_currentItem = 0;

    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v10;
  }
  return v2;
}

- (void)load:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(IMPlayerManifest *)self isLoaded])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    if ([(IMPlayerManifest *)v5 isLoaded])
    {
      if (v4) {
        v4[2](v4);
      }
    }
    else
    {
      [(IMPlayerManifest *)v5 setIsLoaded:1];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __25__IMPlayerManifest_load___block_invoke;
      v6[3] = &unk_1E6E1FB20;
      v6[4] = v5;
      dispatch_queue_t v7 = v4;
      +[IMAVPlayer performOnMainQueue:v6];
    }
    objc_sync_exit(v5);
  }
}

uint64_t __25__IMPlayerManifest_load___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _load:*(void *)(a1 + 40)];
}

- (void)_load:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (BOOL)hasNext
{
  unint64_t v3 = [(IMPlayerManifest *)self currentIndex] + 1;
  return v3 < [(IMPlayerManifest *)self count];
}

- (void)next
{
  if ([(IMPlayerManifest *)self hasNext]) {
    unint64_t v3 = [(IMPlayerManifest *)self currentIndex] + 1;
  }
  else {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  [(IMPlayerManifest *)self setCurrentIndex:v3];
}

- (BOOL)hasPrevious
{
  return [(IMPlayerManifest *)self currentIndex] != 0;
}

- (void)previous
{
  if ([(IMPlayerManifest *)self hasPrevious]) {
    unint64_t v3 = [(IMPlayerManifest *)self currentIndex] - 1;
  }
  else {
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  [(IMPlayerManifest *)self setCurrentIndex:v3];
}

- (void)setCurrentItem:(id)a3
{
  v5 = (IMPlayerItem *)a3;
  currentItem = self->_currentItem;
  if (currentItem != v5)
  {
    v9 = v5;
    if (![(IMPlayerItem *)currentItem isEqual:v5])
    {
      objc_storeStrong((id *)&self->_currentItem, a3);
      dispatch_queue_t v7 = [(IMPlayerManifest *)self activity];
      [(IMPlayerItem *)v9 updateActivity:v7];

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"IMPlayerManifestCurrentItemDidChange" object:self];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setCurrentIndex:(unint64_t)a3
{
  -[IMPlayerManifest assertIndexInBounds:](self, "assertIndexInBounds:");
  self->_currentIndex = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(IMPlayerManifest *)self setCurrentItem:0];
  }
  else
  {
    id v5 = [(IMPlayerManifest *)self objectAtIndex:a3];
    [(IMPlayerManifest *)self setCurrentItem:v5];
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)count
{
  return 0;
}

- (void)nextManifest:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (NSUserActivity)activity
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() _activityType];
  if (v3)
  {
    if (!self->_activity)
    {
      char v4 = [MEMORY[0x1E4F91FC8] isRunningOnTV];
      id v5 = objc_alloc(MEMORY[0x1E4F22488]);
      id v6 = v5;
      if (v4)
      {
        dispatch_queue_t v7 = (NSUserActivity *)[v5 initWithActivityType:v3];
        activity = self->_activity;
        self->_activity = v7;
      }
      else
      {
        uint64_t v19 = *MEMORY[0x1E4FB36E0];
        v20[0] = MEMORY[0x1E4F1CC28];
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        v11 = (NSUserActivity *)[v6 _initWithTypeIdentifier:v3 suggestedActionType:1 options:v10];
        v12 = self->_activity;
        self->_activity = v11;
      }
      [(NSUserActivity *)self->_activity setContentUserAction:*MEMORY[0x1E4F28AB8]];
    }
    objc_super v13 = [(IMPlayerManifest *)self title];

    if (v13)
    {
      v14 = self->_activity;
      v15 = [(IMPlayerManifest *)self title];
      [(NSUserActivity *)v14 setValue:v15 forKey:@"IMPlayerManifestTitle"];
    }
    v16 = [(IMPlayerManifest *)self currentItem];

    if (v16)
    {
      v17 = [(IMPlayerManifest *)self currentItem];
      [v17 updateActivity:self->_activity];
    }
    v9 = self->_activity;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
}

+ (void)restoreActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = (void *)_activityTypeToClassMap;
  v8 = [v5 activityType];
  id v9 = (id)[v7 objectForKey:v8];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__IMPlayerManifest_restoreActivity_completion___block_invoke;
    v10[3] = &unk_1E6E1FDF0;
    id v11 = v5;
    id v12 = v6;
    [v9 createManifestForActivity:v11 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __47__IMPlayerManifest_restoreActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  char v4 = [v3 userInfo];
  id v5 = [v4 valueForKey:@"IMPlayerManifestTitle"];
  [v6 setTitle:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)supportedActivityTypes
{
  return (id)[(id)_activityTypeToClassMap allKeys];
}

+ (id)activityTypeSuffix
{
  return 0;
}

- (void)postLoadedAdditionalItemsNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"IMPlayerManifestDidLoadAdditionalItems" object:self];
}

- (void)postManifestDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"IMPlayerManifestDidChange" object:self];
}

- (id)description
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"count";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMPlayerManifest count](self, "count"));
  v12[1] = @"index";
  v13[0] = v3;
  char v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMPlayerManifest currentIndex](self, "currentIndex"));
  v13[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)IMPlayerManifest;
  dispatch_queue_t v7 = [(IMPlayerManifest *)&v11 description];
  v8 = [v5 description];
  id v9 = [v6 stringWithFormat:@"%@\n%@", v7, v8];

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (IMPlayerItem)currentItem
{
  return self->_currentItem;
}

- (void)setActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end