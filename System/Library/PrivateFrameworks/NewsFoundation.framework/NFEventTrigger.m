@interface NFEventTrigger
- (BOOL)fireOnAny;
- (BOOL)fireOnce;
- (NFEventTrigger)initWithKey:(id)a3 fireOnce:(BOOL)a4 fireOnAny:(BOOL)a5 events:(id)a6 block:(id)a7;
- (NSSet)events;
- (NSString)key;
- (id)block;
@end

@implementation NFEventTrigger

- (NSString)key
{
  return self->_key;
}

- (NFEventTrigger)initWithKey:(id)a3 fireOnce:(BOOL)a4 fireOnAny:(BOOL)a5 events:(id)a6 block:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NFEventTrigger;
  v16 = [(NFEventTrigger *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_events, a6);
    uint64_t v18 = MEMORY[0x223C1A400](v15);
    id block = v17->_block;
    v17->_id block = (id)v18;

    objc_storeStrong((id *)&v17->_key, a3);
    v17->_fireOnce = a4;
    v17->_fireOnAny = a5;
  }

  return v17;
}

- (NSSet)events
{
  return self->_events;
}

- (id)block
{
  return self->_block;
}

- (BOOL)fireOnce
{
  return self->_fireOnce;
}

- (BOOL)fireOnAny
{
  return self->_fireOnAny;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end