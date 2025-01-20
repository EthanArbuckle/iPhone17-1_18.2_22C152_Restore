@interface SMCAirplaneModeObserver
- (BOOL)enabled;
- (OS_dispatch_queue)queue;
- (RadiosPreferences)radiosPreferences;
- (SMCAirplaneModeObserver)initWithQueue:(id)a3;
- (SMCAirplaneModeObserverDelegate)delegate;
- (void)airplaneModeChanged;
- (void)setDelegate:(id)a3;
@end

@implementation SMCAirplaneModeObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)enabled
{
  return [(RadiosPreferences *)self->_radiosPreferences airplaneMode];
}

- (void)setDelegate:(id)a3
{
}

- (SMCAirplaneModeObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMCAirplaneModeObserver;
  v6 = [(SMCAirplaneModeObserver *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4BE78]) initWithQueue:v5];
    radiosPreferences = v7->_radiosPreferences;
    v7->_radiosPreferences = (RadiosPreferences *)v8;

    [(RadiosPreferences *)v7->_radiosPreferences setDelegate:v7];
  }

  return v7;
}

- (void)airplaneModeChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained airplaneModeChanged];
}

- (SMCAirplaneModeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SMCAirplaneModeObserverDelegate *)WeakRetained;
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end