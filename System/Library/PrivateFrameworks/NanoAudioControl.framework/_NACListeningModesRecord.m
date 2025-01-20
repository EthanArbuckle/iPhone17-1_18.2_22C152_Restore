@interface _NACListeningModesRecord
- (NSMutableSet)observers;
- (NSOrderedSet)availableListeningModes;
- (NSString)currentListeningMode;
- (void)setAvailableListeningModes:(id)a3;
- (void)setCurrentListeningMode:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation _NACListeningModesRecord

- (NSOrderedSet)availableListeningModes
{
  return self->_availableListeningModes;
}

- (void)setAvailableListeningModes:(id)a3
{
}

- (NSString)currentListeningMode
{
  return self->_currentListeningMode;
}

- (void)setCurrentListeningMode:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentListeningMode, 0);

  objc_storeStrong((id *)&self->_availableListeningModes, 0);
}

@end