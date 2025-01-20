@interface NRPreferences
- (BOOL)_synchronize;
- (BOOL)synchronize;
- (NRPreferences)init;
- (NRPreferences)initWithDomain:(id)a3;
- (NSString)domain;
- (OS_dispatch_queue)queue;
- (id)_objectForKeyedSubscript:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_clear;
- (void)_setDomain:(id)a3;
- (void)_setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setDomain:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation NRPreferences

- (NRPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRPreferences;
  v2 = [(NRPreferences *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoRegistry.NRPreferences", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (NRPreferences)initWithDomain:(id)a3
{
  id v4 = a3;
  v5 = [(NRPreferences *)self init];
  v6 = v5;
  if (v5) {
    [(NRPreferences *)v5 setDomain:v4];
  }

  return v6;
}

- (BOOL)synchronize
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013218;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_synchronize
{
  return CFPreferencesAppSynchronize((CFStringRef)self->_domain) != 0;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100013380;
  v16 = sub_100013390;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013398;
  block[3] = &unk_100165B78;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_objectForKeyedSubscript:(id)a3
{
  char v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)self->_domain);

  return v3;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000134DC;
  block[3] = &unk_100165868;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)_clear
{
  CFDictionaryRef v4 = CFPreferencesCopyMultiple(0, (CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFArrayRef v3 = [(__CFDictionary *)v4 allKeys];
  CFPreferencesSetMultiple(0, v3, (CFStringRef)self->_domain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013630;
  v7[3] = &unk_100165530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end