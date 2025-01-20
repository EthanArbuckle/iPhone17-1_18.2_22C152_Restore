@interface MTPowerAssertion
- (MTPowerAssertion)initWithName:(id)a3;
- (MTPowerAssertion)initWithName:(id)a3 assertionTimeout:(double)a4;
- (NSString)name;
- (double)assertionTimeout;
- (unsigned)assertionID;
- (void)dealloc;
- (void)releaseAssertion;
- (void)setAssertionID:(unsigned int)a3;
- (void)takeAssertion;
@end

@implementation MTPowerAssertion

- (MTPowerAssertion)initWithName:(id)a3
{
  return [(MTPowerAssertion *)self initWithName:a3 assertionTimeout:0.0];
}

- (MTPowerAssertion)initWithName:(id)a3 assertionTimeout:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTPowerAssertion;
  v8 = [(MTPowerAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_assertionTimeout = a4;
    v9->_assertionID = 0;
  }

  return v9;
}

- (void)dealloc
{
  if (self->_assertionID) {
    [(MTPowerAssertion *)self releaseAssertion];
  }
  v3.receiver = self;
  v3.super_class = (Class)MTPowerAssertion;
  [(MTPowerAssertion *)&v3 dealloc];
}

- (void)takeAssertion
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_19CC95000, v0, OS_LOG_TYPE_ERROR, "%{public}@ Taking power assert for %{public}@. when assertion already taken.", v1, 0x16u);
}

- (void)releaseAssertion
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"IOReturn __IOPMAssertionRelease(IOPMAssertionID)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTPowerAssertion.m", 20, @"%s", dlerror());

  __break(1u);
}

- (NSString)name
{
  return self->_name;
}

- (double)assertionTimeout
{
  return self->_assertionTimeout;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (void).cxx_destruct
{
}

@end