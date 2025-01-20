@interface MRDActiveUserController
- (MRDActiveUserController)init;
- (id)activeUserIdentifier;
- (void)dealloc;
- (void)fetchActiveUserWithQueue:(id)a3 completion:(id)a4;
- (void)setActiveUserIdentifier:(id)a3;
@end

@implementation MRDActiveUserController

- (MRDActiveUserController)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRDActiveUserController;
  result = [(MRDActiveUserController *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(MRDActiveUserController *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)MRDActiveUserController;
  [(MRDActiveUserController *)&v3 dealloc];
}

- (id)activeUserIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_activeUserIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setActiveUserIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)[v5 copy];

  activeUserIdentifier = self->_activeUserIdentifier;
  self->_activeUserIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)fetchActiveUserWithQueue:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016775C;
  v7[3] = &unk_10041F370;
  id v8 = a4;
  id v6 = v8;
  [(MRDActiveUserController *)self _fetchActiveUserWithQueue:a3 completion:v7];
}

- (void).cxx_destruct
{
}

@end