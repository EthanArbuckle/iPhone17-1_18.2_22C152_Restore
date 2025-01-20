@interface BLESender
- (BLESender)init;
- (void)dealloc;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation BLESender

- (BLESender)init
{
  v6.receiver = self;
  v6.super_class = (Class)BLESender;
  v2 = [(BLESender *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;

    v2->_mtu = 10000;
    v2->_sendDataLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_semaphore_t v3 = [(CBL2CAPChannel *)self->_l2capChannel outputStream];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)BLESender;
  [(BLESender *)&v4 dealloc];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  if (a4 == 4)
  {
    sub_10001ACF0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, 4, (uint64_t)self, v4, v5, v6, v8);
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BLESender stream:handleEvent:]", 121, self, @"LE: Stream event %lu on %@", v5, v6, a4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendBlock, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_l2capChannel, 0);

  objc_storeStrong((id *)&self->_writeCharacteristic, 0);
}

@end