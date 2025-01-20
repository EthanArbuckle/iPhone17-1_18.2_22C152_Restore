@interface UCFilePackager
- (BOOL)deliverNextPacket;
- (NSDictionary)options;
- (NSFileHandle)file;
- (NSMutableArray)queuedPackets;
- (NSString)uuid;
- (OS_dispatch_queue)fetchQ;
- (OS_dispatch_semaphore)nextPacketReady;
- (UCFilePackager)initWithFile:(id)a3 fileSize:(int64_t)a4 packetSize:(int64_t)a5 options:(id)a6 receiver:(id)a7;
- (UCFilePacketReceiver)receiver;
- (int64_t)currentPacketNumber;
- (int64_t)nextPacketNumber;
- (int64_t)nextPacketToDeliver;
- (int64_t)packetPreLoadCount;
- (int64_t)packetSize;
- (int64_t)tag;
- (int64_t)totalPacketCount;
- (void)checkShouldFetch;
- (void)prepNextPacket;
- (void)setCurrentPacketNumber:(int64_t)a3;
- (void)setFetchQ:(id)a3;
- (void)setFile:(id)a3;
- (void)setNextPacketNumber:(int64_t)a3;
- (void)setNextPacketReady:(id)a3;
- (void)setNextPacketToDeliver:(int64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPacketPreLoadCount:(int64_t)a3;
- (void)setPacketSize:(int64_t)a3;
- (void)setQueuedPackets:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTotalPacketCount:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation UCFilePackager

- (UCFilePackager)initWithFile:(id)a3 fileSize:(int64_t)a4 packetSize:(int64_t)a5 options:(id)a6 receiver:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UCFilePackager;
  v15 = [(UCFilePackager *)&v21 init];
  v16 = v15;
  if (v15)
  {
    [(UCFilePackager *)v15 setFile:v12];
    [(UCFilePackager *)v16 setOptions:v13];
    [(UCFilePackager *)v16 setPacketSize:a5];
    [(UCFilePackager *)v16 setTotalPacketCount:vcvtpd_s64_f64((double)a4 / (double)a5)];
    [(UCFilePackager *)v16 setCurrentPacketNumber:0];
    [(UCFilePackager *)v16 setNextPacketNumber:1];
    [(UCFilePackager *)v16 setNextPacketToDeliver:1];
    dispatch_queue_t v17 = dispatch_queue_create("UCFilePackagerReadQ", 0);
    [(UCFilePackager *)v16 setFetchQ:v17];

    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    [(UCFilePackager *)v16 setNextPacketReady:v18];

    [(UCFilePackager *)v16 setPacketPreLoadCount:2];
    v19 = +[NSMutableArray arrayWithCapacity:[(UCFilePackager *)v16 packetPreLoadCount]];
    [(UCFilePackager *)v16 setQueuedPackets:v19];

    [(UCFilePackager *)v16 setReceiver:v14];
    [(UCFilePackager *)v16 checkShouldFetch];
  }

  return v16;
}

- (BOOL)deliverNextPacket
{
  int64_t v3 = [(UCFilePackager *)self nextPacketToDeliver];
  int64_t v4 = [(UCFilePackager *)self totalPacketCount];
  if (v3 <= v4)
  {
    if (sub_100045CA4((int)[(UCFilePackager *)self nextPacketToDeliver], (int)[(UCFilePackager *)self totalPacketCount]))
    {
      v5 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v10 = [(UCFilePackager *)self nextPacketToDeliver];
        __int16 v11 = 1024;
        unsigned int v12 = [(UCFilePackager *)self totalPacketCount];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Packager] Queuing delivery block %d/%d", buf, 0xEu);
      }
    }
    v6 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DD48;
    block[3] = &unk_1000C4CF0;
    block[4] = self;
    dispatch_async(v6, block);
  }
  return v3 <= v4;
}

- (void)prepNextPacket
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(UCFilePackager *)v2 nextPacketNumber];
  if (v3 <= [(UCFilePackager *)v2 totalPacketCount])
  {
    uint64_t v4 = [(UCFilePackager *)v2 nextPacketNumber];
    [(UCFilePackager *)v2 setNextPacketNumber:(char *)[(UCFilePackager *)v2 nextPacketNumber] + 1];
  }
  else
  {
    uint64_t v4 = -1;
  }
  objc_sync_exit(v2);

  if (v4 >= 1)
  {
    v5 = [(UCFilePackager *)v2 fetchQ];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003E0E8;
    v6[3] = &unk_1000C5780;
    v6[4] = v2;
    v6[5] = v4;
    dispatch_async(v5, v6);
  }
}

- (void)checkShouldFetch
{
  int64_t v3 = [(UCFilePackager *)self queuedPackets];
  objc_sync_enter(v3);
  uint64_t v4 = [(UCFilePackager *)self queuedPackets];
  id v5 = [v4 count];
  unint64_t v6 = [(UCFilePackager *)self packetPreLoadCount];

  objc_sync_exit(v3);
  if ((unint64_t)v5 < v6)
  {
    [(UCFilePackager *)self prepNextPacket];
  }
}

- (int64_t)totalPacketCount
{
  return self->_totalPacketCount;
}

- (void)setTotalPacketCount:(int64_t)a3
{
  self->_totalPacketCount = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (UCFilePacketReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);

  return (UCFilePacketReceiver *)WeakRetained;
}

- (void)setReceiver:(id)a3
{
}

- (NSFileHandle)file
{
  return (NSFileHandle *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFile:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOptions:(id)a3
{
}

- (int64_t)packetSize
{
  return self->_packetSize;
}

- (void)setPacketSize:(int64_t)a3
{
  self->_packetSize = a3;
}

- (int64_t)packetPreLoadCount
{
  return self->_packetPreLoadCount;
}

- (void)setPacketPreLoadCount:(int64_t)a3
{
  self->_packetPreLoadCount = a3;
}

- (NSMutableArray)queuedPackets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setQueuedPackets:(id)a3
{
}

- (int64_t)nextPacketNumber
{
  return self->_nextPacketNumber;
}

- (void)setNextPacketNumber:(int64_t)a3
{
  self->_nextPacketNumber = a3;
}

- (int64_t)nextPacketToDeliver
{
  return self->_nextPacketToDeliver;
}

- (void)setNextPacketToDeliver:(int64_t)a3
{
  self->_nextPacketToDeliver = a3;
}

- (int64_t)currentPacketNumber
{
  return self->_currentPacketNumber;
}

- (void)setCurrentPacketNumber:(int64_t)a3
{
  self->_currentPacketNumber = a3;
}

- (OS_dispatch_queue)fetchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFetchQ:(id)a3
{
}

- (OS_dispatch_semaphore)nextPacketReady
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNextPacketReady:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPacketReady, 0);
  objc_storeStrong((id *)&self->_fetchQ, 0);
  objc_storeStrong((id *)&self->_queuedPackets, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_destroyWeak((id *)&self->_receiver);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end