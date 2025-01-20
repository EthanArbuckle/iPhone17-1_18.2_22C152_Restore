@interface BYDaemonLockAssertionWrapper
- (BYDaemonLockAssertionWrapper)initWithAssertionRef:(__MKBAssertion *)a3 purpose:(id)a4;
- (NSString)purpose;
- (__MKBAssertion)assertionRef;
- (void)dealloc;
- (void)setAssertionRef:(__MKBAssertion *)a3;
- (void)setPurpose:(id)a3;
@end

@implementation BYDaemonLockAssertionWrapper

- (BYDaemonLockAssertionWrapper)initWithAssertionRef:(__MKBAssertion *)a3 purpose:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BYDaemonLockAssertionWrapper;
  v7 = [(BYDaemonLockAssertionWrapper *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(BYDaemonLockAssertionWrapper *)v7 setAssertionRef:a3];
    [(BYDaemonLockAssertionWrapper *)v8 setPurpose:v6];
  }

  return v8;
}

- (void)dealloc
{
  if ([(BYDaemonLockAssertionWrapper *)self assertionRef])
  {
    v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(BYDaemonLockAssertionWrapper *)self purpose];
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing device lock assertion for purpose '%{public}@'", buf, 0xCu);
    }
    CFRelease([(BYDaemonLockAssertionWrapper *)self assertionRef]);
  }
  v5.receiver = self;
  v5.super_class = (Class)BYDaemonLockAssertionWrapper;
  [(BYDaemonLockAssertionWrapper *)&v5 dealloc];
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
}

- (__MKBAssertion)assertionRef
{
  return self->_assertionRef;
}

- (void)setAssertionRef:(__MKBAssertion *)a3
{
  self->_assertionRef = a3;
}

- (void).cxx_destruct
{
}

@end