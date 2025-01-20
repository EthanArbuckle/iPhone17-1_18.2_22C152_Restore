@interface _UIViewWindowRotationNotificationObserver
- (void)windowWillAnimateRotation:(id)a3;
@end

@implementation _UIViewWindowRotationNotificationObserver

- (void).cxx_destruct
{
}

- (void)windowWillAnimateRotation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  memset(v4, 0, sizeof(v4));
  -[UIView _notifyBoundingPathChangeObserversWithChangeInfo:forAncestor:](WeakRetained, v4, 0);
}

@end