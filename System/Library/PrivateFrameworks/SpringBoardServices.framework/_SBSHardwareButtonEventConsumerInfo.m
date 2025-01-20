@interface _SBSHardwareButtonEventConsumerInfo
+ (id)infoWithConsumer:(id)a3;
- (BOOL)isValid;
- (NSString)description;
- (SBSHardwareButtonEventConsuming)consumer;
- (SBSHardwareButtonService)service;
- (int64_t)buttonKind;
- (int64_t)eventPriority;
- (unint64_t)eventMask;
- (void)dealloc;
- (void)invalidate;
- (void)setButtonKind:(int64_t)a3;
- (void)setConsumer:(id)a3;
- (void)setEventMask:(unint64_t)a3;
- (void)setEventPriority:(int64_t)a3;
- (void)setService:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation _SBSHardwareButtonEventConsumerInfo

- (void)setEventPriority:(int64_t)a3
{
  self->_eventPriority = a3;
}

- (void)setButtonKind:(int64_t)a3
{
  self->_buttonKind = a3;
}

+ (id)infoWithConsumer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = 64;
  }
  else {
    uint64_t v6 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 2uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 4uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 8uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 0x10uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 0x20uLL;
  }
  if (objc_opt_respondsToSelector()) {
    v6 |= 0x10000uLL;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = v6 | 0x180;
  }
  else {
    uint64_t v7 = v6;
  }
  v8 = SBLogCommon();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      id v10 = v13;
      _os_log_impl(&dword_18FBC5000, v9, OS_LOG_TYPE_INFO, "%{public}@ buttonEventMask is %lx", (uint8_t *)&v12, 0x16u);
    }
    [v5 setConsumer:v4];
    [v5 setEventMask:v7];
    [v5 setValid:1];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_SBSHardwareButtonEventConsumerInfo infoWithConsumer:]((uint64_t)v4, v9);
    }
  }
  return v5;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setEventMask:(unint64_t)a3
{
  self->_eventMask = a3;
}

- (void)setConsumer:(id)a3
{
}

- (int64_t)eventPriority
{
  return self->_eventPriority;
}

- (unint64_t)eventMask
{
  return self->_eventMask;
}

- (int64_t)buttonKind
{
  return self->_buttonKind;
}

- (void)setService:(id)a3
{
}

- (void)dealloc
{
  if (self->_valid)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_SBSHardwareButtonEventConsumerInfo.m" lineNumber:22 description:@"must invalidate consumer token %p when finished", self];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBSHardwareButtonEventConsumerInfo;
  [(_SBSHardwareButtonEventConsumerInfo *)&v5 dealloc];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_eventMask withName:@"eventMask"];
  objc_super v5 = NSStringFromSBSHardwareButtonEventPriority(self->_eventPriority);
  [v3 appendString:v5 withName:@"eventPriority"];

  id v6 = (id)[v3 appendObject:self->_consumer withName:@"consumer" skipIfNil:0];
  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  [WeakRetained consumerInfoWillInvalidate:self];

  self->_valid = 0;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (SBSHardwareButtonService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (SBSHardwareButtonService *)WeakRetained;
}

- (SBSHardwareButtonEventConsuming)consumer
{
  return self->_consumer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumer, 0);
  objc_destroyWeak((id *)&self->_service);
}

+ (void)infoWithConsumer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "no valid SBSHardwareButtonEventConsuming protocol methods implemented on %{public}@", (uint8_t *)&v4, 0xCu);
}

@end