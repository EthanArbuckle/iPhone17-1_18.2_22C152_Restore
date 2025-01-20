@interface _UIFocusStateObserver
- (BOOL)isActive;
- (_UIFocusStateObserver)init;
- (id)addObserver:(id)a3;
- (id)description;
- (id)descriptionBuilder;
- (void)notifyObserversIfNecessary;
- (void)performUpdatesAndNotifyObservers:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation _UIFocusStateObserver

- (_UIFocusStateObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFocusStateObserver;
  v2 = [(_UIFocusStateObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    *(unsigned char *)&v2->_flags = *(unsigned char *)&v2->_flags & 0xFE | [(_UIFocusStateObserver *)v2 isActive];
  }
  return v2;
}

- (BOOL)isActive
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusStateObserver.m" lineNumber:32 description:@"This is an abstract class. isActive needs to be implemented by a concrete subclass."];

  return 0;
}

- (id)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusStateObserver.m", 41, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  objc_super v6 = [MEMORY[0x1E4F29128] UUID];
  observers = self->_observers;
  v8 = _Block_copy(v5);
  [(NSMapTable *)observers setObject:v8 forKey:v6];

  return v6;
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIFocusStateObserver.m" lineNumber:49 description:@"Observer is not of type id<_UIFocusStateObserverToken>."];
  }
  [(NSMapTable *)self->_observers removeObjectForKey:v6];
}

- (void)notifyObserversIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    BOOL v3 = [(_UIFocusStateObserver *)self isActive];
    char flags = (char)self->_flags;
    if (((v3 ^ ((flags & 1) == 0)) & 1) == 0)
    {
      *(unsigned char *)&self->_char flags = flags & 0xFE | v3;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = [(NSMapTable *)self->_observers objectEnumerator];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)performUpdatesAndNotifyObservers:(id)a3
{
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 2;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | flags & 2;
  [(_UIFocusStateObserver *)self notifyObserversIfNecessary];
}

- (id)descriptionBuilder
{
  BOOL v3 = [[UIDescriptionBuilder alloc] initWithObject:self];
  BOOL v4 = [(_UIFocusStateObserver *)self isActive];
  id v5 = [(UIDescriptionBuilder *)v3 appendName:@"isActive" BOOLValue:v4];
  if (v4 == ((*(unsigned char *)&self->_flags & 1) == 0)) {
    id v6 = [(UIDescriptionBuilder *)v3 appendName:@"wasActive" BOOLValue:*(unsigned char *)&self->_flags & 1];
  }
  id v7 = [(UIDescriptionBuilder *)v3 appendName:@"observers" object:self->_observers];
  return v3;
}

- (id)description
{
  v2 = [(_UIFocusStateObserver *)self descriptionBuilder];
  BOOL v3 = [v2 string];

  return v3;
}

- (void).cxx_destruct
{
}

@end