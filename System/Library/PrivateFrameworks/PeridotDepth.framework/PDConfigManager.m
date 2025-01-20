@interface PDConfigManager
- (PDConfigManager)init;
- (PDDepthProcessorDelegate)delegate;
- (id)currentOnlineRequest;
- (id)updateAnchors:(PDAnchors *)a3;
- (void)commit;
- (void)setDelegate:(id)a3;
- (void)stop;
@end

@implementation PDConfigManager

- (void)setDelegate:(id)a3
{
}

- (PDConfigManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDConfigManager;
  v2 = [(PDConfigManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PeridotDepth online updates", 0);
    v4 = *(void **)&v2->_ispRequest.gatingen[22][1].all;
    *(void *)&v2->_ispRequest.gatingen[22][1].all = v3;

    bzero(&v2->_ispRequest, 0x3C0uLL);
  }
  return v2;
}

- (void)commit
{
  if (*(void *)&self->_ispRequest.gatingen[22][3].all)
  {
    dispatch_queue_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&self->_ispRequest length:960];
    id v4 = *(id *)&self->_ispRequest.gatingen[22][3].all;
    id v5 = *(id *)&self->_ispRequest.gatingen[22][5].all;
    objc_super v6 = v5;
    if (v5)
    {
      v7 = *(NSObject **)&self->_ispRequest.gatingen[22][1].all;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __25__PDConfigManager_commit__block_invoke;
      block[3] = &unk_2654478C8;
      id v10 = v5;
      id v11 = v3;
      id v12 = v4;
      dispatch_async(v7, block);
    }
    v8 = *(void **)&self->_ispRequest.gatingen[22][3].all;
    *(void *)&self->_ispRequest.gatingen[22][3].all = 0;

    bzero(&self->_ispRequest, 0x3C0uLL);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ispRequest.gatingen[22][5], 0);
  objc_storeStrong((id *)&self->_ispRequest.gatingen[22][3], 0);
  objc_storeStrong((id *)&self->_ispRequest.gatingen[22][1], 0);
}

- (PDDepthProcessorDelegate)delegate
{
  return (PDDepthProcessorDelegate *)objc_getProperty(self, a2, 984, 1);
}

void __25__PDConfigManager_commit__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) onlineConfig:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    peridot_depth_log("Online request sent. Will be applied with config ID %lu", v2);
    id v4 = *(void **)(a1 + 48);
    [v4 updateWithConfigID:v3];
  }
  else
  {
    peridot_depth_log("Sending online update request to ISP failed");
  }
}

- (id)updateAnchors:(PDAnchors *)a3
{
  p_useNorthHS2 = &a3->banks[0].anchors[6].useNorthHS2;
  uint64_t v4 = 767;
  uint64_t v5 = 544;
  do
  {
    objc_super v6 = (char *)self + v4;
    *(_WORD *)(v6 - 27) = *((_WORD *)p_useNorthHS2 - 10);
    v7 = (char *)self + v5;
    char *v7 = *(p_useNorthHS2 - 18);
    *(_WORD *)(v6 - 25) = *(_WORD *)(p_useNorthHS2 - 17);
    v7[1] = *(p_useNorthHS2 - 15);
    *(_WORD *)(v6 - 23) = *((_WORD *)p_useNorthHS2 - 7);
    v7[2] = *(p_useNorthHS2 - 12);
    *(v6 - 21) = *(p_useNorthHS2 - 11);
    *(v6 - 20) = *(p_useNorthHS2 - 10);
    v7[3] = *(p_useNorthHS2 - 9);
    *(v6 - 19) = *(p_useNorthHS2 - 8);
    *(v6 - 18) = *(p_useNorthHS2 - 7);
    v7[4] = *(p_useNorthHS2 - 6);
    *(v6 - 17) = *(p_useNorthHS2 - 5);
    *(v6 - 16) = *(p_useNorthHS2 - 4);
    v7[5] = *(p_useNorthHS2 - 3);
    *(v6 - 15) = *(p_useNorthHS2 - 2);
    *(v6 - 14) = *(p_useNorthHS2 - 1);
    v7[6] = *p_useNorthHS2;
    *(v6 - 13) = p_useNorthHS2[1];
    *(v6 - 12) = p_useNorthHS2[2];
    v7[7] = p_useNorthHS2[3];
    *(v6 - 11) = p_useNorthHS2[4];
    *(v6 - 10) = p_useNorthHS2[5];
    v7[8] = p_useNorthHS2[6];
    *(v6 - 9) = p_useNorthHS2[7];
    *(v6 - 8) = p_useNorthHS2[8];
    v7[9] = p_useNorthHS2[9];
    *(v6 - 7) = p_useNorthHS2[10];
    *(v6 - 6) = p_useNorthHS2[11];
    v7[10] = p_useNorthHS2[12];
    *(v6 - 5) = p_useNorthHS2[13];
    *(v6 - 4) = p_useNorthHS2[14];
    v7[11] = p_useNorthHS2[15];
    *(v6 - 3) = p_useNorthHS2[16];
    *(v6 - 2) = p_useNorthHS2[17];
    v7[12] = p_useNorthHS2[18];
    *(v6 - 1) = p_useNorthHS2[19];
    *objc_super v6 = p_useNorthHS2[20];
    v7[13] = p_useNorthHS2[21];
    v4 += 28;
    p_useNorthHS2 += 42;
    v5 += 14;
  }
  while (v4 != 991);
  self->_ispRequest.onlineConfigBm |= 0x90u;
  return [(PDConfigManager *)self currentOnlineRequest];
}

- (id)currentOnlineRequest
{
  uint64_t v3 = *(void **)&self->_ispRequest.gatingen[22][3].all;
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void **)&self->_ispRequest.gatingen[22][3].all;
    *(void *)&self->_ispRequest.gatingen[22][3].all = v4;

    uint64_t v3 = *(void **)&self->_ispRequest.gatingen[22][3].all;
  }
  return v3;
}

- (void)stop
{
}

@end