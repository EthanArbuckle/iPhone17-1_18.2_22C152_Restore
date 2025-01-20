@interface PAAccessInterval
+ (id)placeholderAccessInterval;
- (NSNumber)slot;
- (NSString)description;
- (PAAccessInterval)initWithLogger:(id)a3 slot:(id)a4;
- (void)dealloc;
- (void)end;
- (void)endWithTimestampAdjustment:(double)a3 accessCount:(int64_t)a4;
- (void)recordAccessToAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5;
@end

@implementation PAAccessInterval

- (void)recordAccessToAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5
{
  p_logger = &self->_logger;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_logger);
  [WeakRetained recordAssetIdentifiers:v9 withVisibilityState:a4 accessEventCount:a5 forSlot:self->_slot];
}

- (PAAccessInterval)initWithLogger:(id)a3 slot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PAAccessInterval;
  v8 = [(PAAccessInterval *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_logger, v6);
    objc_storeStrong((id *)&v9->_slot, a4);
    atomic_store(0, (unsigned __int8 *)&v9->_wasEnded);
    v9->_accessCount = 0;
  }

  return v9;
}

+ (id)placeholderAccessInterval
{
  v2 = (void *)[objc_alloc((Class)a1) initWithLogger:0 slot:&unk_1EFF810F8];

  return v2;
}

- (void)end
{
}

- (void)endWithTimestampAdjustment:(double)a3 accessCount:(int64_t)a4
{
  if ((atomic_exchange(&self->_wasEnded._Value, 1u) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_logger);
    [WeakRetained endIntervalWithSlot:self->_slot timestampAdjustment:a4 accessCount:a3];
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p slot:%@>", objc_opt_class(), self, self->_slot];
}

- (void)dealloc
{
  [(PAAccessInterval *)self end];
  v3.receiver = self;
  v3.super_class = (Class)PAAccessInterval;
  [(PAAccessInterval *)&v3 dealloc];
}

- (NSNumber)slot
{
  return self->_slot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);

  objc_destroyWeak((id *)&self->_logger);
}

@end