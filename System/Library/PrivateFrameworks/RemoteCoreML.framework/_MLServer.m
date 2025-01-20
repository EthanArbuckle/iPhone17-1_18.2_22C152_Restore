@interface _MLServer
- (OS_dispatch_queue)q;
- (_MLNetworkOptions)nwOptions;
- (_MLNetworkPacket)packet;
- (_MLNetworking)nwObj;
- (_MLServer)initWithOptions:(id)a3;
- (id)loadFunction;
- (id)predictFunction;
- (id)textFunction;
- (id)unLoadFunction;
- (void)doReceive:(id)a3 context:(id)a4 isComplete:(BOOL)a5 error:(id)a6;
- (void)setLoadFunction:(id)a3;
- (void)setPredictFunction:(id)a3;
- (void)setTextFunction:(id)a3;
- (void)setUnLoadFunction:(id)a3;
@end

@implementation _MLServer

- (_MLServer)initWithOptions:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_MLServer;
  v6 = [(_MLServer *)&v20 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    packet = v6->_packet;
    v6->_packet = (_MLNetworkPacket *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.remoteCoreMLServer", 0);
    q = v6->_q;
    v6->_q = (OS_dispatch_queue *)v9;

    v11 = [[_MLNetworkOptions alloc] initWithOptions:v5];
    nwOptions = v6->_nwOptions;
    v6->_nwOptions = v11;

    v13 = [[_MLNetworking alloc] initListener:v6->_nwOptions];
    nwObj = v6->_nwObj;
    v6->_nwObj = v13;

    objc_initWeak(&location, v6);
    v15 = v6->_nwObj;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __29___MLServer_initWithOptions___block_invoke;
    v17[3] = &unk_264D53050;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a2;
    [(_MLNetworking *)v15 setListenerReceiveDataCallBack:v17];
    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)doReceive:(id)a3 context:(id)a4 isComplete:(BOOL)a5 error:(id)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __48___MLServer_doReceive_context_isComplete_error___block_invoke;
  applier[3] = &unk_264D53118;
  applier[4] = self;
  applier[5] = a2;
  dispatch_data_apply((dispatch_data_t)a3, applier);
  v8 = [(_MLServer *)self packet];
  uint64_t v9 = [v8 sizeOfPacket];

  if (!v9)
  {
    v10 = [(_MLServer *)self packet];
    v11 = [v10 buffer];
    unint64_t v12 = +[_MLNetworkHeaderEncoding getHeaderEncoding:v11];
    v13 = [(_MLServer *)self packet];
    [v13 setCommand:v12];

    v14 = [(_MLServer *)self packet];
    v15 = [v14 buffer];
    unint64_t v16 = +[_MLNetworkHeaderEncoding getHeaderDataSize:v15];
    v17 = [(_MLServer *)self packet];
    [v17 setSizeOfPacket:v16];

    v18 = +[_MLLog serverFramework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[_MLServer doReceive:context:isComplete:error:](a2, self, v18);
    }
  }
  v19 = [(_MLServer *)self packet];
  BOOL v20 = +[_MLNetworkHeaderEncoding isHeaderError:](_MLNetworkHeaderEncoding, "isHeaderError:", [v19 command]);

  if (v20)
  {
    v21 = +[_MLLog serverFramework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[_MLServer doReceive:context:isComplete:error:](a2, self);
    }

    v22 = +[_MLNetworkHeaderEncoding acknowledgeFailData];
    v23 = [(_MLServer *)self nwObj];
    [v23 sendData:v22];

    v24 = [(_MLServer *)self packet];
    [v24 cleanupDoubleBuffer];
  }
  else
  {
    v25 = [(_MLServer *)self packet];
    v26 = [v25 buffer];
    uint64_t v27 = [v26 length];
    unint64_t v28 = v27 - +[_MLNetworkHeaderEncoding getHeaderSize];

    v29 = [(_MLServer *)self packet];
    unint64_t v30 = [v29 sizeOfPacket];

    if (v30 <= v28)
    {
      v32 = [(_MLServer *)self packet];
      uint64_t v33 = v28 - [v32 sizeOfPacket];

      if (v33 >= 1)
      {
        v34 = [(_MLServer *)self packet];
        v35 = [v34 buffer];
        v36 = +[_MLNetworkHeaderEncoding getHeaderEnd:v35];

        v37 = [MEMORY[0x263EFF990] dataWithBytes:v36 length:v33];
        v38 = [(_MLServer *)self packet];
        [v38 setDoubleBuffer:v37];
      }
      v39 = [(_MLServer *)self packet];
      v40 = [v39 buffer];
      v41 = +[_MLNetworkHeaderEncoding getHeaderDataStart:v40];

      v42 = (void *)MEMORY[0x263EFF990];
      v43 = [(_MLServer *)self packet];
      v44 = objc_msgSend(v42, "dataWithBytes:length:", v41, objc_msgSend(v43, "sizeOfPacket"));
      v45 = [(_MLServer *)self packet];
      [v45 setBuffer:v44];

      q = self->_q;
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __48___MLServer_doReceive_context_isComplete_error___block_invoke_8;
      v53[3] = &unk_264D53140;
      v53[4] = self;
      v53[5] = a2;
      dispatch_sync(q, v53);
    }
    else
    {
      v31 = +[_MLLog serverFramework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v47 = NSStringFromSelector(a2);
        v48 = [(_MLServer *)self packet];
        uint64_t v49 = [v48 sizeOfPacket];
        v50 = [(_MLServer *)self packet];
        v51 = [v50 buffer];
        uint64_t v52 = [v51 length];
        *(_DWORD *)buf = 138413058;
        v56 = v47;
        __int16 v57 = 2048;
        uint64_t v58 = v49;
        __int16 v59 = 2048;
        uint64_t v60 = v52;
        __int16 v61 = 2048;
        unint64_t v62 = v28;
        _os_log_debug_impl(&dword_238967000, v31, OS_LOG_TYPE_DEBUG, "%@: Size of Packet: %zu < Size of current %zu buffer_length %zu.", buf, 0x2Au);
      }
    }
  }
}

- (_MLNetworking)nwObj
{
  return self->_nwObj;
}

- (_MLNetworkOptions)nwOptions
{
  return self->_nwOptions;
}

- (_MLNetworkPacket)packet
{
  return self->_packet;
}

- (id)loadFunction
{
  return self->_loadFunction;
}

- (void)setLoadFunction:(id)a3
{
}

- (id)predictFunction
{
  return self->_predictFunction;
}

- (void)setPredictFunction:(id)a3
{
}

- (id)unLoadFunction
{
  return self->_unLoadFunction;
}

- (void)setUnLoadFunction:(id)a3
{
}

- (id)textFunction
{
  return self->_textFunction;
}

- (void)setTextFunction:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong(&self->_textFunction, 0);
  objc_storeStrong(&self->_unLoadFunction, 0);
  objc_storeStrong(&self->_predictFunction, 0);
  objc_storeStrong(&self->_loadFunction, 0);
  objc_storeStrong((id *)&self->_packet, 0);
  objc_storeStrong((id *)&self->_nwOptions, 0);
  objc_storeStrong((id *)&self->_nwObj, 0);
}

- (void)doReceive:(const char *)a1 context:(void *)a2 isComplete:error:.cold.1(const char *a1, void *a2)
{
  v3 = NSStringFromSelector(a1);
  v4 = [a2 packet];
  [v4 command];
  OUTLINED_FUNCTION_3_0(&dword_238967000, v5, v6, "%@: Header Error Command = %lu", v7, v8, v9, v10, 2u);
}

- (void)doReceive:(NSObject *)a3 context:isComplete:error:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromSelector(a1);
  uint64_t v6 = [a2 packet];
  uint64_t v7 = [v6 sizeOfPacket];
  uint64_t v8 = [a2 packet];
  int v9 = 138412802;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = [v8 command];
  _os_log_debug_impl(&dword_238967000, a3, OS_LOG_TYPE_DEBUG, "%@: Begin Packet size = %lu command %lu", (uint8_t *)&v9, 0x20u);
}

@end