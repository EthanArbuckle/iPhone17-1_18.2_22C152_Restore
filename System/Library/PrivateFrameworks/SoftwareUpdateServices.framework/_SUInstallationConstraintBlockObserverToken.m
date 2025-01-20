@interface _SUInstallationConstraintBlockObserverToken
- (_SUInstallationConstraintBlockObserverToken)initWithObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SUInstallationConstraintBlockObserverToken

- (_SUInstallationConstraintBlockObserverToken)initWithObserver:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SUInstallationConstraintBlockObserverToken;
  v5 = [(_SUInstallationConstraintBlockObserverToken *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v7 = SULogInstallConstraints();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_SUInstallationConstraintBlockObserverToken initWithObserver:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v6;
}

- (void)dealloc
{
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

- (void)initWithObserver:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end