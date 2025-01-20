@interface HVContentAdmissionKVOObserver
+ (id)observeObject:(id)a3 key:(id)a4 handler:(id)a5;
- (HVContentAdmissionKVOObserver)initWithKey:(id)a3 handler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HVContentAdmissionKVOObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", self->_key, a4, a5, a6))
  {
    id handler = self->_handler;
    if (handler)
    {
      v8 = (void (*)(void))*((void *)handler + 2);
      v8();
    }
  }
}

- (HVContentAdmissionKVOObserver)initWithKey:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HVContentAdmissionKVOObserver;
  v9 = [(HVContentAdmissionKVOObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    uint64_t v11 = MEMORY[0x22A6669E0](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;
  }
  return v10;
}

+ (id)observeObject:(id)a3 key:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HVContentAdmissionKVOObserver alloc] initWithKey:v8 handler:v7];

  [v9 addObserver:v10 forKeyPath:v8 options:0 context:0];

  return v10;
}

@end