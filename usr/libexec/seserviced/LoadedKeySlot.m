@interface LoadedKeySlot
+ (id)withKeySlot:(id)a3 key:(id)a4;
- (KeySlot)slot;
- (PTClassicKey)key;
- (id)description;
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation LoadedKeySlot

+ (id)withKeySlot:(id)a3 key:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setSlot:v6];
  [v7 setKey:v5];

  [v6 setState:3];

  return v7;
}

- (void)dealloc
{
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    slot = self->_slot;
    key = self->_key;
    *(_DWORD *)buf = 138412546;
    v8 = slot;
    __int16 v9 = 2112;
    v10 = key;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handle to keySlot %@ with key %@ released", buf, 0x16u);
  }

  if ([(KeySlot *)self->_slot state] == 3) {
    [(KeySlot *)self->_slot setState:2];
  }
  v6.receiver = self;
  v6.super_class = (Class)LoadedKeySlot;
  [(LoadedKeySlot *)&v6 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"Loaded Key %@ in Slot %@", self->_key, self->_slot];
}

- (KeySlot)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
}

- (PTClassicKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_slot, 0);
}

@end