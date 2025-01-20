@interface RPNWActivityMessageMetrics
+ (id)startMessageMetrics:(int)a3 withParent:(id)a4;
- (NSString)peerDeviceModel;
- (NSString)peerOSVersion;
- (id)_metricsDictionary;
- (int)linkType;
- (int)messageType;
- (unint64_t)messageSize;
- (void)setLinkType:(int)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setMessageType:(int)a3;
- (void)setPeerDeviceModel:(id)a3;
- (void)setPeerOSVersion:(id *)a3;
@end

@implementation RPNWActivityMessageMetrics

+ (id)startMessageMetrics:(int)a3 withParent:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)nw_activity_create();
  v8 = (void *)[objc_alloc((Class)a1) _initWithNWActivity:v7];
  [v8 setMessageType:v4];
  if (v6)
  {
    v9 = [v6 nwActivity];
    nw_activity_set_parent_activity();
  }
  nw_activity_activate();

  return v8;
}

- (void)setMessageType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__RPNWActivityMessageMetrics_setMessageType___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  int v4 = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __45__RPNWActivityMessageMetrics_setMessageType___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 24) = *(_DWORD *)(result + 40);
  return result;
}

- (int)messageType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__RPNWActivityMessageMetrics_messageType__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__RPNWActivityMessageMetrics_messageType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setMessageSize:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__RPNWActivityMessageMetrics_setMessageSize___block_invoke;
  v3[3] = &unk_1E605BCA0;
  v3[4] = self;
  void v3[5] = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __45__RPNWActivityMessageMetrics_setMessageSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (unint64_t)messageSize
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__RPNWActivityMessageMetrics_messageSize__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__RPNWActivityMessageMetrics_messageSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setLinkType:(int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__RPNWActivityMessageMetrics_setLinkType___block_invoke;
  v3[3] = &unk_1E605BCC8;
  v3[4] = self;
  int v4 = a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

uint64_t __42__RPNWActivityMessageMetrics_setLinkType___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 28) = *(_DWORD *)(result + 40);
  return result;
}

- (int)linkType
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__RPNWActivityMessageMetrics_linkType__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__RPNWActivityMessageMetrics_linkType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 28);
  return result;
}

- (void)setPeerDeviceModel:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__RPNWActivityMessageMetrics_setPeerDeviceModel___block_invoke;
  v6[3] = &unk_1E605B5D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v6);
}

void __49__RPNWActivityMessageMetrics_setPeerDeviceModel___block_invoke(uint64_t a1)
{
}

- (NSString)peerDeviceModel
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__RPNWActivityMessageMetrics_peerDeviceModel__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __45__RPNWActivityMessageMetrics_peerDeviceModel__block_invoke(uint64_t a1)
{
}

- (void)setPeerOSVersion:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__RPNWActivityMessageMetrics_setPeerOSVersion___block_invoke;
  v3[3] = &unk_1E605D228;
  v3[4] = self;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v4 = *a3;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v3);
}

void __47__RPNWActivityMessageMetrics_setPeerOSVersion___block_invoke(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v2 = RPNSOperatingSystemVersionToString((uint64_t *)&v5);
  uint64_t v3 = *(void *)(a1 + 32);
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (NSString)peerOSVersion
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__RPNWActivityMessageMetrics_peerOSVersion__block_invoke;
  v4[3] = &unk_1E605C400;
  v4[4] = self;
  v4[5] = &v5;
  -[RPNWActivityMetrics _withLock:]((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __43__RPNWActivityMessageMetrics_peerOSVersion__block_invoke(uint64_t a1)
{
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v4 = [(RPNWActivityMessageMetrics *)self messageType];
  if (v4 > 3) {
    uint64_t v5 = "?";
  }
  else {
    uint64_t v5 = off_1E605D248[v4];
  }
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  [v3 setObject:v6 forKeyedSubscript:@"messageType"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[RPNWActivityMessageMetrics messageSize](self, "messageSize"));
  [v3 setObject:v7 forKeyedSubscript:@"bytesOut"];

  unsigned int v8 = [(RPNWActivityMessageMetrics *)self linkType];
  if (v8 > 0xB) {
    v9 = "?";
  }
  else {
    v9 = off_1E605D268[v8];
  }
  id v10 = [NSString stringWithUTF8String:v9];
  [v3 setObject:v10 forKeyedSubscript:@"linkType"];

  v11 = [(RPNWActivityMessageMetrics *)self peerDeviceModel];
  if (v11) {
    [v3 setObject:v11 forKeyedSubscript:@"peerModel"];
  }
  v12 = [(RPNWActivityMessageMetrics *)self peerOSVersion];
  if (v12) {
    [v3 setObject:v12 forKeyedSubscript:@"peerOSVersion"];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerOSVersion, 0);
  objc_storeStrong((id *)&self->_peerDeviceModel, 0);
}

@end