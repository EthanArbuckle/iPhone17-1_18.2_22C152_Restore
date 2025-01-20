@interface VUICurrentSiriNavControllerContainer
+ (BOOL)isRunningInSiriPluggin;
+ (id)sharedInstance;
- (NSPointerArray)activeNavigationControllers;
- (VUICurrentSiriNavControllerContainer)init;
- (id)currentSiriNavController;
- (void)setActiveNavigationControllers:(id)a3;
- (void)setCurrentSiriNavController:(id)a3;
@end

@implementation VUICurrentSiriNavControllerContainer

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_1 != -1) {
    dispatch_once(&sharedInstance___onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

void __54__VUICurrentSiriNavControllerContainer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUICurrentSiriNavControllerContainer);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
}

- (VUICurrentSiriNavControllerContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUICurrentSiriNavControllerContainer;
  v2 = [(VUICurrentSiriNavControllerContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    activeNavigationControllers = v2->_activeNavigationControllers;
    v2->_activeNavigationControllers = (NSPointerArray *)v3;
  }
  return v2;
}

+ (BOOL)isRunningInSiriPluggin
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];

  LOBYTE(v2) = [v3 isEqualToString:@"com.apple.siri"];
  return (char)v2;
}

- (void)setCurrentSiriNavController:(id)a3
{
  activeNavigationControllers = self->_activeNavigationControllers;
  id v5 = a3;
  [(NSPointerArray *)activeNavigationControllers compact];
  [(NSPointerArray *)self->_activeNavigationControllers addPointer:v5];
}

- (id)currentSiriNavController
{
  [(NSPointerArray *)self->_activeNavigationControllers compact];
  uint64_t v3 = [(NSPointerArray *)self->_activeNavigationControllers allObjects];
  v4 = [v3 lastObject];

  return v4;
}

- (NSPointerArray)activeNavigationControllers
{
  return self->_activeNavigationControllers;
}

- (void)setActiveNavigationControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end