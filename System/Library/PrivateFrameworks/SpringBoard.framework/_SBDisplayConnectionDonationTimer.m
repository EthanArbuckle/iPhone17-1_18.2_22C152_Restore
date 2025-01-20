@interface _SBDisplayConnectionDonationTimer
- (BOOL)stateChanged;
- (_SBDisplayConnectionDonationTimer)initWithUniqueId:(id)a3 deviceName:(id)a4 productName:(id)a5 connect:(BOOL)a6 mirroring:(BOOL)a7 handler:(id)a8;
- (void)dealloc;
- (void)invalidate;
- (void)resetTimerOnConnect:(BOOL)a3;
@end

@implementation _SBDisplayConnectionDonationTimer

- (_SBDisplayConnectionDonationTimer)initWithUniqueId:(id)a3 deviceName:(id)a4 productName:(id)a5 connect:(BOOL)a6 mirroring:(BOOL)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_SBDisplayConnectionDonationTimer;
  v18 = [(_SBDisplayConnectionDonationTimer *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    uniqueId = v18->_uniqueId;
    v18->_uniqueId = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    deviceName = v18->_deviceName;
    v18->_deviceName = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    productName = v18->_productName;
    v18->_productName = (NSString *)v23;

    v18->_connect = a6;
    v18->_mirroring = a7;
    v18->_counter = 0;
    uint64_t v25 = [v17 copy];
    id handler = v18->_handler;
    v18->_id handler = (id)v25;
  }
  return v18;
}

- (void)dealloc
{
  [(_SBDisplayConnectionDonationTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SBDisplayConnectionDonationTimer;
  [(_SBDisplayConnectionDonationTimer *)&v3 dealloc];
}

- (void)invalidate
{
}

- (BOOL)stateChanged
{
  return self->_counter != 0;
}

- (void)resetTimerOnConnect:(BOOL)a3
{
  int64_t counter = self->_counter;
  if (a3) {
    int64_t v5 = counter + 1;
  }
  else {
    int64_t v5 = counter - 1;
  }
  self->_int64_t counter = v5;
  [(NSTimer *)self->_timer invalidate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end