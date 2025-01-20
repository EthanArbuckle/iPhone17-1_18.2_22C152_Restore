@interface SMBSocket
- (NSString)netBiosName;
- (NSString)serverName;
- (OS_dispatch_queue)recv_queue;
- (OS_dispatch_queue)signing_queue;
- (OS_nw_connection)connection;
- (char)getIPv4IPv6DotName;
- (const)getServerAddress;
- (id)getEventHandler;
- (int)connectSocket;
- (int)openSocket:(id)a3;
- (int)processReply:(void *)a3;
- (int)send:(id)a3;
- (int)sendRequest:(id)a3;
- (int)writeEnabled;
- (timespec)last_echo;
- (timespec)last_recv;
- (unsigned)connectTimeOut;
- (unsigned)getIPv4IPv6DotNameMaxLength;
- (unsigned)isPerAppVPN;
- (unsigned)port;
- (unsigned)resp_wait_timeout;
- (void)callEventHandler:(unsigned int)a3 contextPtr:(id)a4 returnValue:(unsigned int)a5;
- (void)closeSocket;
- (void)connectSocket;
- (void)readData:(const void *)a3;
- (void)readNBHeader;
- (void)setConnectTimeOut:(unsigned int)a3;
- (void)setConnection:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setLast_echo:(timespec)a3;
- (void)setLast_recv:(timespec)a3;
- (void)setNetBIOSHeader:(unsigned int *)a3 nbType:(unsigned __int8)a4 length:(unsigned int)a5;
- (void)setNetBiosName:(id)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setRecv_queue:(id)a3;
- (void)setResp_wait_timeout:(unsigned int)a3;
- (void)setServerName:(id)a3;
- (void)setSigning_queue:(id)a3;
- (void)timeOutCheck;
@end

@implementation SMBSocket

- (int)openSocket:(id)a3
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_initWeak(&location, self);
  *(void *)port = 0;
  uint64_t v140 = 0;
  char v142 = 0;
  uint64_t v141 = 0;
  objc_storeStrong((id *)&self->pd, a3);
  self->_resp_wait_timeout = 35;
  int v6 = pthread_mutex_init(&self->io_rqlock, 0);
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBSocket openSocket:]5();
    }
    goto LABEL_42;
  }
  int v6 = pthread_mutex_init(&self->skt_lock, 0);
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBSocket openSocket:]4();
    }
    pthread_mutex_destroy(&self->io_rqlock);
    goto LABEL_42;
  }
  int v6 = pthread_cond_init(&self->skt_lock_cond, 0);
  if (!v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    io_rqlist = self->io_rqlist;
    self->io_rqlist = v7;

    if (self->io_rqlist)
    {
      pthread_mutex_lock(&self->skt_lock);
      self->state |= 1uLL;
      id event_handler_callback = self->event_handler_callback;
      self->id event_handler_callback = 0;

      v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.sign", MEMORY[0x263EF83A8]);
      signing_queue = self->_signing_queue;
      self->_signing_queue = v10;

      if (self->_signing_queue)
      {
        v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.send", 0);
        send_queue = self->send_queue;
        self->send_queue = v12;

        if (self->send_queue)
        {
          v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.recv", MEMORY[0x263EF83A8]);
          recv_queue = self->_recv_queue;
          self->_recv_queue = v14;

          if (self->_recv_queue)
          {
            v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.read_skt", 0);
            nw_conn_queue = self->nw_conn_queue;
            self->nw_conn_queue = v16;

            if (self->nw_conn_queue)
            {
              v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.timer", 0);
              timer_queue = self->timer_queue;
              self->timer_queue = v18;

              v20 = self->timer_queue;
              if (v20)
              {
                v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v20);
                timer = self->timer;
                self->timer = v21;

                v23 = self->timer;
                if (v23)
                {
                  dispatch_time_t v24 = dispatch_walltime(0, 0);
                  dispatch_source_set_timer(v23, v24, 0x77359400uLL, 0xEE6B280uLL);
                  v25 = self->timer;
                  handler[0] = MEMORY[0x263EF8330];
                  handler[1] = 3221225472;
                  handler[2] = __24__SMBSocket_openSocket___block_invoke;
                  handler[3] = &unk_265072FE8;
                  objc_copyWeak(&v136, &location);
                  dispatch_source_set_event_handler(v25, handler);
                  v26 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                  timer_semaphore = self->timer_semaphore;
                  self->timer_semaphore = v26;

                  if (self->timer_semaphore)
                  {
                    v28 = self->timer;
                    v134[0] = MEMORY[0x263EF8330];
                    v134[1] = 3221225472;
                    v134[2] = __24__SMBSocket_openSocket___block_invoke_6;
                    v134[3] = &unk_265073010;
                    v134[4] = self;
                    dispatch_source_set_cancel_handler(v28, v134);
                    __snprintf_chk(port, 0x19uLL, 0, 0x19uLL, "%d", self->_port);
                    host = (OS_nw_endpoint *)nw_endpoint_create_host([(NSString *)self->_serverName cStringUsingEncoding:4], port);
                    endpoint = self->endpoint;
                    self->endpoint = host;

                    if (!self->endpoint)
                    {
                      int v6 = *__error();
                      v105 = &_os_log_internal;
                      id v106 = &_os_log_internal;
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
                        -[SMBSocket openSocket:].cold.9((uint64_t)[(NSString *)self->_serverName cStringUsingEncoding:4], buf);
                      }

                      pthread_mutex_unlock(&self->skt_lock);
                      [(SMBSocket *)self closeSocket];
                      goto LABEL_56;
                    }
                    v31 = nw_parameters_create();
                    if (v31)
                    {
                      nw_parameters_set_data_mode();
                      nw_parameters_set_no_delay();
                      nw_parameters_set_keepalive_enabled();
                      v32 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->endpoint, v31);
                      connection = self->_connection;
                      self->_connection = v32;

                      v34 = self->_connection;
                      if (v34)
                      {
                        nw_connection_set_queue(v34, (dispatch_queue_t)self->nw_conn_queue);
                        v35 = self->_connection;
                        v133[0] = MEMORY[0x263EF8330];
                        v133[1] = 3221225472;
                        v133[2] = __24__SMBSocket_openSocket___block_invoke_8;
                        v133[3] = &unk_265073038;
                        v133[4] = self;
                        MEMORY[0x2455D4620](v35, v133);
                        v132[5] = MEMORY[0x263EF8330];
                        v132[6] = 3221225472;
                        v132[7] = __24__SMBSocket_openSocket___block_invoke_10;
                        v132[8] = &unk_265073010;
                        v132[9] = self;
                        nw_connection_set_cancel_handler();
                        v36 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                        event_semaphore = self->event_semaphore;
                        self->event_semaphore = v36;

                        if (self->event_semaphore)
                        {
                          v38 = self->_connection;
                          v132[0] = MEMORY[0x263EF8330];
                          v132[1] = 3221225472;
                          v132[2] = __24__SMBSocket_openSocket___block_invoke_11;
                          v132[3] = &unk_265073060;
                          v132[4] = self;
                          nw_connection_set_viability_changed_handler(v38, v132);
                          v39 = self->_connection;
                          v131[0] = MEMORY[0x263EF8330];
                          v131[1] = 3221225472;
                          v131[2] = __24__SMBSocket_openSocket___block_invoke_2;
                          v131[3] = &unk_265073060;
                          v131[4] = self;
                          nw_connection_set_better_path_available_handler(v39, v131);
                          nw_connection_set_read_close_handler();
                          nw_connection_set_write_close_handler();
                          pthread_mutex_unlock(&self->skt_lock);
                          int v6 = 0;
LABEL_56:
                          objc_destroyWeak(&v136);
                          goto LABEL_42;
                        }
                        BOOL v123 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                        if (v123) {
                          -[SMBSocket openSocket:]2(v123, v124, v125, v126, v127, v128, v129, v130);
                        }
                        pthread_mutex_unlock(&self->skt_lock);
                        [(SMBSocket *)self closeSocket];
LABEL_46:
                        int v6 = 12;
                        goto LABEL_56;
                      }
                      int v6 = *__error();
                      BOOL v115 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                      if (v115) {
                        -[SMBSocket openSocket:]1(v115, v116, v117, v118, v119, v120, v121, v122);
                      }
                    }
                    else
                    {
                      int v6 = *__error();
                      BOOL v107 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                      if (v107) {
                        -[SMBSocket openSocket:]0(v107, v108, v109, v110, v111, v112, v113, v114);
                      }
                    }
                    pthread_mutex_unlock(&self->skt_lock);
                    [(SMBSocket *)self closeSocket];
                    goto LABEL_56;
                  }
                  BOOL v97 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  if (v97) {
                    -[SMBSocket openSocket:].cold.8(v97, v98, v99, v100, v101, v102, v103, v104);
                  }
                  pthread_mutex_unlock(&self->skt_lock);
                  [(SMBSocket *)self closeSocket];
                  goto LABEL_46;
                }
                BOOL v88 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v88) {
                  -[SMBSocket openSocket:].cold.7(v88, v89, v90, v91, v92, v93, v94, v95);
                }
              }
              else
              {
                BOOL v80 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v80) {
                  -[SMBSocket openSocket:].cold.6(v80, v81, v82, v83, v84, v85, v86, v87);
                }
              }
            }
            else
            {
              BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v72) {
                -[SMBSocket openSocket:].cold.5(v72, v73, v74, v75, v76, v77, v78, v79);
              }
            }
          }
          else
          {
            BOOL v64 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v64) {
              -[SMBSocket openSocket:].cold.4(v64, v65, v66, v67, v68, v69, v70, v71);
            }
          }
        }
        else
        {
          BOOL v56 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v56) {
            -[SMBSocket openSocket:](v56, v57, v58, v59, v60, v61, v62, v63);
          }
        }
      }
      else
      {
        BOOL v48 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v48) {
          -[SMBSocket openSocket:](v48, v49, v50, v51, v52, v53, v54, v55);
        }
      }
      pthread_mutex_unlock(&self->skt_lock);
      [(SMBSocket *)self closeSocket];
    }
    else
    {
      BOOL v40 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v40) {
        -[SMBSocket openSocket:](v40, v41, v42, v43, v44, v45, v46, v47);
      }
      pthread_mutex_destroy(&self->io_rqlock);
      pthread_mutex_destroy(&self->skt_lock);
      pthread_cond_destroy(&self->skt_lock_cond);
    }
    int v6 = 12;
    goto LABEL_42;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[SMBSocket openSocket:]3();
  }
  pthread_mutex_destroy(&self->io_rqlock);
  pthread_mutex_destroy(&self->skt_lock);
LABEL_42:
  objc_destroyWeak(&location);

  return v6;
}

void __24__SMBSocket_openSocket___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timeOutCheck];
}

intptr_t __24__SMBSocket_openSocket___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 344));
}

void __24__SMBSocket_openSocket___block_invoke_8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x80uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    if (v5)
    {
      int error_code = nw_error_get_error_code(v5);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __24__SMBSocket_openSocket___block_invoke_8_cold_2();
      }
      BOOL v8 = error_code == 61;
    }
    else
    {
      BOOL v8 = 0;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = a2;
    if (a2 != 4 && v8) {
      a2 = 4;
    }
    if (a2 == 3)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
      *(void *)(*(void *)(a1 + 32) + 16) |= 2uLL;
      *(void *)(*(void *)(a1 + 32) + 16) &= ~0x20uLL;
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40)))
        ;
    }
    else if ((a2 & 0xFFFFFFFE) == 4)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
      *(void *)(*(void *)(a1 + 32) + 16) |= 0x20uLL;
      *(void *)(*(void *)(a1 + 32) + 16) &= ~2uLL;
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
      smb_rq_cancel_all_requests((pthread_mutex_t *)(*(void *)(a1 + 32) + 128), *(void **)(*(void *)(a1 + 32) + 192), (_DWORD *)(*(void *)(a1 + 32) + 336), *(void **)(*(void *)(a1 + 32) + 328), *(void **)(*(void *)(a1 + 32) + 384));
      if (a2 != 5) {
        nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 32) + 376));
      }
      smb2_rq_credit_start([*(id *)(*(void *)(a1 + 32) + 8) getSessionPtr], 0xFFFFu);
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40)))
        ;
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x80uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __24__SMBSocket_openSocket___block_invoke_10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x100uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    smb_rq_cancel_all_requests((pthread_mutex_t *)(*(void *)(a1 + 32) + 128), *(void **)(*(void *)(a1 + 32) + 192), (_DWORD *)(*(void *)(a1 + 32) + 336), *(void **)(*(void *)(a1 + 32) + 328), *(void **)(*(void *)(a1 + 32) + 384));
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = 5;
    smb2_rq_credit_start([*(id *)(*(void *)(a1 + 32) + 8) getSessionPtr], 0xFFFFu);
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x100uLL;
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x200uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    v3 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 208);
    pthread_mutex_unlock(v3);
  }
  else
  {
    BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v4) {
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __24__SMBSocket_openSocket___block_invoke_11(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x400uLL;
    if ((piston_log_level & 8) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __24__SMBSocket_openSocket___block_invoke_11_cold_3();
    }
    uint64_t v5 = 4;
    if (a2) {
      uint64_t v5 = 0;
    }
    *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(a1 + 32) + 16) & 0xFFFFFFFFFFFFFFFBLL | v5;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 352))
    {
      uint64_t v7 = *(NSObject **)(v6 + 384);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __24__SMBSocket_openSocket___block_invoke_14;
      v24[3] = &unk_265072F98;
      v24[4] = v6;
      int v25 = a2;
      dispatch_async(v7, v24);
    }
    else if ((piston_log_level & 8) != 0)
    {
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16) {
        __24__SMBSocket_openSocket___block_invoke_11_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x400uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  }
  else
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(*(void *)(a1 + 32) + 352) + 16))(*(void *)(*(void *)(a1 + 32) + 352), 2, 0, *(unsigned int *)(a1 + 40));
}

void __24__SMBSocket_openSocket___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x800uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    if ((piston_log_level & 8) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __24__SMBSocket_openSocket___block_invoke_2_cold_3();
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 352))
    {
      uint64_t v6 = *(NSObject **)(v5 + 384);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __24__SMBSocket_openSocket___block_invoke_16;
      v23[3] = &unk_265072F98;
      v23[4] = v5;
      int v24 = a2;
      dispatch_async(v6, v23);
    }
    else if ((piston_log_level & 8) != 0)
    {
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v15) {
        __24__SMBSocket_openSocket___block_invoke_2_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x800uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(*(void *)(a1 + 32) + 352) + 16))(*(void *)(*(void *)(a1 + 32) + 352), 4, 0, *(unsigned int *)(a1 + 40));
}

void __24__SMBSocket_openSocket___block_invoke_2_17(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((piston_log_level & 8) != 0)
    {
      BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v3) {
        __24__SMBSocket_openSocket___block_invoke_2_17_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      uint64_t v1 = *(void *)(a1 + 32);
    }
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x1000uLL;
    *(void *)(*(void *)(a1 + 32) + 16) |= 8uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    smb_rq_cancel_all_requests((pthread_mutex_t *)(*(void *)(a1 + 32) + 128), *(void **)(*(void *)(a1 + 32) + 192), (_DWORD *)(*(void *)(a1 + 32) + 336), *(void **)(*(void *)(a1 + 32) + 328), *(void **)(*(void *)(a1 + 32) + 384));
    nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 32) + 376));
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(v11 + 352))
    {
      uint64_t v12 = *(NSObject **)(v11 + 384);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __24__SMBSocket_openSocket___block_invoke_18;
      block[3] = &unk_265073010;
      block[4] = v11;
      dispatch_async(v12, block);
    }
    else if ((piston_log_level & 8) != 0)
    {
      BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v21) {
        __24__SMBSocket_openSocket___block_invoke_2_17_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x1000uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 352) + 16))();
}

void __24__SMBSocket_openSocket___block_invoke_2_19(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if ((piston_log_level & 8) != 0)
    {
      BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v3) {
        __24__SMBSocket_openSocket___block_invoke_2_19_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      uint64_t v1 = *(void *)(a1 + 32);
    }
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x2000uLL;
    *(void *)(*(void *)(a1 + 32) + 16) |= 0x10uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(void *)(v11 + 352))
    {
      uint64_t v12 = *(NSObject **)(v11 + 384);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __24__SMBSocket_openSocket___block_invoke_20;
      block[3] = &unk_265073010;
      block[4] = v11;
      dispatch_async(v12, block);
    }
    else if ((piston_log_level & 8) != 0)
    {
      BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v21) {
        __24__SMBSocket_openSocket___block_invoke_2_19_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
    *(void *)(*(void *)(a1 + 32) + 16) &= ~0x2000uLL;
    pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 208));
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 352) + 16))();
}

- (int)connectSocket
{
  nw_connection_start((nw_connection_t)self->_connection);
  event_semaphore = self->event_semaphore;
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * self->_connectTimeOut);
  intptr_t v5 = dispatch_semaphore_wait(event_semaphore, v4);
  int nw_conn_state = self->nw_conn_state;
  if (v5)
  {
    if (nw_conn_state == 3)
    {
      BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v7) {
        [(SMBSocket *)v7 connectSocket];
      }
LABEL_11:
      [(SMBSocket *)self closeSocket];
      return 57;
    }
LABEL_9:
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v21) {
      [(SMBSocket *)v21 connectSocket];
    }
    goto LABEL_11;
  }
  if (nw_conn_state != 3) {
    goto LABEL_9;
  }
  uint64_t v15 = (OS_nw_endpoint *)nw_connection_copy_connected_remote_endpoint();
  remote_endpoint = self->remote_endpoint;
  self->remote_endpoint = v15;

  address = self->remote_endpoint;
  if (address) {
    address = nw_endpoint_get_address(address);
  }
  v29.__darwin_time_t tv_sec = 0;
  *(void *)&v29.tv_usec = 0;
  self->server_addr = (const sockaddr *)address;
  [(SMBSocket *)self readNBHeader];
  gettimeofday(&v29, 0);
  __darwin_time_t tv_sec = v29.tv_sec;
  uint64_t v19 = 1000 * v29.tv_usec;
  self->_last_recv.__darwin_time_t tv_sec = v29.tv_sec;
  self->_last_recv.tv_nsec = v19;
  self->_last_echo.__darwin_time_t tv_sec = tv_sec;
  self->_last_echo.tv_nsec = v19;
  pthread_mutex_lock(&self->io_rqlock);
  dispatch_activate((dispatch_object_t)self->timer);
  dispatch_suspend((dispatch_object_t)self->timer);
  pthread_mutex_unlock(&self->io_rqlock);
  return 0;
}

- (void)closeSocket
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SMBSocket closeSocket]";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Cancel attempt timed out \n", buf, 0xCu);
}

- (void)callEventHandler:(unsigned int)a3 contextPtr:(id)a4 returnValue:(unsigned int)a5
{
}

- (id)getEventHandler
{
  uint64_t v2 = (void *)MEMORY[0x2455D48A0](self->event_handler_callback, a2);
  return v2;
}

- (char)getIPv4IPv6DotName
{
  return (char *)self->ipv4v6DotName;
}

- (unsigned)getIPv4IPv6DotNameMaxLength
{
  return 46;
}

- (const)getServerAddress
{
  return self->server_addr;
}

- (unsigned)isPerAppVPN
{
  nw_path_t v2 = nw_connection_copy_current_path((nw_connection_t)self->_connection);
  unsigned int is_per_app_vpn = nw_path_is_per_app_vpn();

  return is_per_app_vpn;
}

- (void)setEventHandler:(id)a3
{
  self->id event_handler_callback = (id)MEMORY[0x2455D48A0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (int)processReply:(void *)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v89 = a3;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  unint64_t v84 = 0;
  BOOL v83 = 0;
  v82.__darwin_time_t tv_sec = 0;
  *(void *)&v82.tv_usec = 0;
  memset(__s2, 0, sizeof(__s2));
  gettimeofday(&v82, 0);
  uint64_t v5 = 1000 * v82.tv_usec;
  self->_last_recv.__darwin_time_t tv_sec = v82.tv_sec;
  self->_last_recv.tv_nsec = v5;
  uint64_t v6 = [(SMBPiston *)self->pd getSessionPtr];
  if (*(unsigned __int8 *)mbuf_data((uint64_t)a3) == 253)
  {
    int v7 = smb3_msg_decrypt((uint64_t)v6, &v89);
    if (v7)
    {
      mbuf_freem(v89);
      nw_connection_cancel((nw_connection_t)self->_connection);
      id v74 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      id v10 = 0;
      id v11 = 0;
      goto LABEL_48;
    }
  }
  uint64_t v12 = mbuf_data((uint64_t)v89);
  uint64_t v13 = *(unsigned __int16 *)(v12 + 12);
  uint64_t v14 = (uint64_t *)(v12 + 24);
  uint64_t v15 = *(void *)(v12 + 24);
  uint64_t v16 = (int *)(v12 + 8);
  int v71 = *(_DWORD *)(v12 + 8);
  int v69 = *(_DWORD *)(v12 + 16);
  io_rqlist = self->io_rqlist;
  id v81 = 0;
  p_io_rqlock = &self->io_rqlock;
  smb_rq_find(&self->io_rqlock, io_rqlist, v15, &v83, (uint64_t *)&v84, &v81, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v81;
  if (v11)
  {
    id v74 = 0;
    goto LABEL_6;
  }
  id v74 = 0;
  if ((v6->option_flags & 0x200) != 0 && !v83)
  {
    uint64_t v18 = self->io_rqlist;
    id v80 = 0;
    smb_rq_find_cmpd(p_io_rqlock, v18, v15, &v80);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v74 = v80;
    if (v11)
    {
LABEL_6:
      pthread_mutex_lock(&v6->session_credits_lock);
      if (v83)
      {
        v6->session_req_pending = 0;
        if (!v6->session_oldest_message_id) {
          goto LABEL_26;
        }
        v6->session_oldest_message_id = 0;
      }
      else
      {
        v6->session_req_pending = 1;
        if ((*(unsigned char *)(v12 + 16) & 2) != 0 || v84 == v6->session_oldest_message_id) {
          goto LABEL_26;
        }
        v6->session_oldest_message_id = v84;
      }
      if (atomic_load((unsigned int *)&v6->session_credits_wait))
      {
        atomic_fetch_add(&v6->session_credits_wait, 0xFFFFFFFF);
        pthread_cond_signal(&v6->session_credits_wait_cond);
      }
LABEL_26:
      pthread_mutex_unlock(&v6->session_credits_lock);
      if ((*(unsigned char *)(v12 + 16) & 2) != 0 && *v16 == 259)
      {
        smb_rq_handle_async_pending(v11, v12);
        mbuf_freem(v89);
        uint64_t v8 = 0;
        uint64_t v9 = 0;
LABEL_29:
        int v7 = 0;
        goto LABEL_48;
      }
      uint64_t v20 = objc_msgSend(v11, "smb_rq_getreply");
      v86[3] = v20;
      md_initm(v20, (uint64_t)v89);
      objc_msgSend(v11, "smb_rq_set_extflag:", 2);
      id v11 = v11;
      if ((objc_msgSend(v11, "sr_flags") & 0x100) != 0 && !*(_DWORD *)(v12 + 20))
      {
        unint64_t option_flags = v6->option_flags;
        if ((option_flags & 0x200) == 0)
        {
          if (piston_log_level)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[SMBSocket processReply:].cold.5(v13, v15, v28, v29, v30, v31, v32, v33);
            }
            unint64_t option_flags = v6->option_flags;
          }
          v6->unint64_t option_flags = option_flags | 0x200;
        }
        if (v74)
        {
          id v34 = v74;
          uint64_t v8 = v34;
          while ((objc_msgSend(v8, "sr_extflags") & 2) != 0)
          {
            uint64_t v35 = objc_msgSend(v8, "sr_next_rqp");

            uint64_t v8 = (void *)v35;
            if (!v35)
            {
              id v73 = v34;

              uint64_t v36 = objc_msgSend(v73, "smb_rq_getreply");
              uint64_t v8 = 0;
              v86[3] = v36;
              int v70 = 1;
              goto LABEL_34;
            }
          }
        }
        else
        {
          uint64_t v8 = 0;
        }
        int v70 = 0;
      }
      else
      {
        uint64_t v8 = 0;
        int v70 = 1;
      }
      id v73 = v11;
LABEL_34:
      if (v13 == 1)
      {
        unint64_t session_flags = v6->session_flags;
        if ((session_flags & 0x20000) == 0 || v71 != -1073741802)
        {
          if ((session_flags & 0x28800) != 0 && !v71 && (v69 & 8) != 0)
          {
            sess_setup_reply = v6->sess_setup_reply;
            if (sess_setup_reply) {
              free(sess_setup_reply);
            }
            unint64_t chain_len = mbuf_get_chain_len((uint64_t)v89);
            if (chain_len > 0x10000)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[SMBSocket processReply:].cold.4(chain_len, v39, v40, v41, v42, v43, v44, v45);
              }
              unint64_t chain_len = 0x10000;
            }
            uint64_t v46 = (char *)malloc_type_malloc(chain_len, 0xF14EDA36uLL);
            v6->sess_setup_reply = v46;
            if (v46)
            {
              v6->sess_setup_reply_len = chain_len;
              v6->sess_setup_message_id = v15;
              uint64_t v47 = v89;
              if (v89 && chain_len)
              {
                for (unint64_t i = 0; i < chain_len; i += v50)
                {
                  id v49 = v10;
                  size_t v50 = mbuf_len((uint64_t)v47);
                  uint64_t v51 = v6->sess_setup_reply;
                  uint64_t v52 = (const void *)mbuf_data((uint64_t)v47);
                  if (v50 + i > chain_len) {
                    size_t v50 = chain_len - i;
                  }
                  memcpy(&v51[i], v52, v50);
                  uint64_t v47 = (void *)mbuf_next((uint64_t)v47);
                  id v10 = v49;
                  if (!v47) {
                    break;
                  }
                }
              }
            }
            else
            {
              BOOL v53 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v53) {
                -[SMBSocket processReply:](v53, v54, v55, v56, v57, v58, v59, v60);
              }
            }
          }
          goto LABEL_43;
        }
      }
      else if ((_BYTE)v13 || !memcmp(v6->pre_auth_int_hash, __s2, 0x40uLL))
      {
LABEL_43:
        if (v70)
        {
          smb_rq_dequeue(p_io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v73);
          recv_queue = self->_recv_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __26__SMBSocket_processReply___block_invoke;
          block[3] = &unk_2650730A8;
          id v73 = v73;
          id v78 = v73;
          uint64_t v79 = &v85;
          dispatch_async(recv_queue, block);
        }
        goto LABEL_45;
      }
      smb311_pre_auth_integrity_hash_update((uint64_t)v6, (uint64_t)v89);
      if (!(_BYTE)v13)
      {
        long long v22 = *(_OWORD *)&v6->pre_auth_int_hash[16];
        *(_OWORD *)v6->pre_auth_int_hash_neg = *(_OWORD *)v6->pre_auth_int_hash;
        *(_OWORD *)&v6->pre_auth_int_hash_neg[16] = v22;
        long long v23 = *(_OWORD *)&v6->pre_auth_int_hash[48];
        *(_OWORD *)&v6->pre_auth_int_hash_neg[32] = *(_OWORD *)&v6->pre_auth_int_hash[32];
        *(_OWORD *)&v6->pre_auth_int_hash_neg[48] = v23;
      }
      smb311_pre_auth_integrity_hash_print((uint64_t)v6);
      goto LABEL_43;
    }
  }
  if (v13 != 13)
  {
    if (v13 == 18 && *v14 == -1 && !*(_DWORD *)(v12 + 36))
    {
      if (self->event_handler_callback)
      {
        smb2_smb_parse_lease_break(self->pd, v89);
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        id v11 = 0;
        goto LABEL_29;
      }
      BOOL v61 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v61) {
        -[SMBSocket processReply:](v61, v62, v63, v64, v65, v66, v67, v68);
      }
    }
    if (((*(unsigned char *)(v12 + 16) & 2) == 0 || *v16 != 259) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(SMBSocket *)v14 processReply:v16];
    }
  }
  mbuf_freem(v89);
  id v11 = 0;
  uint64_t v8 = 0;
  id v73 = 0;
LABEL_45:
  if (v10)
  {
    smb_rq_dequeue(p_io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v10);
    uint64_t v25 = self->_recv_queue;
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __26__SMBSocket_processReply___block_invoke_21;
    v75[3] = &unk_265073010;
    id v76 = v10;
    dispatch_async(v25, v75);

    id v10 = 0;
  }
  int v7 = 0;
  uint64_t v9 = v73;
LABEL_48:

  _Block_object_dispose(&v85, 8);
  return v7;
}

uint64_t __26__SMBSocket_processReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = smb2_rq_parse_header(*(void **)(a1 + 32), (long long **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  BOOL v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "smb_rq_callback:", v2);
}

uint64_t __26__SMBSocket_processReply___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", 60);
}

- (void)readData:(const void *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  objc_initWeak(&location, self);
  size_t v4 = bswap32(*(_DWORD *)a3);
  if (BYTE3(v4))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBSocket readData:]();
    }
  }
  else if (smb_mbuf_get(0, 1, v17 + 3, v4))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBSocket readData:]();
    }
  }
  else
  {
    mbuf_data(v17[3]);
    int v14 = v4;
    objc_copyWeak(&v13, &location);
    if ((nw_connection_read_buffer() & 1) == 0)
    {
      BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v5) {
        -[SMBSocket readData:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

void __22__SMBSocket_readData___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (a3 != 57 && a3 != 89 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __22__SMBSocket_readData___block_invoke_cold_1(a3);
    }
  }
  else
  {
    mbuf_setlen(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(unsigned int *)(a1 + 48));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained processReply:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 readNBHeader];
}

- (void)readNBHeader
{
  objc_initWeak(&location, self);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__SMBSocket_readNBHeader__block_invoke;
  v4[3] = &unk_265073120;
  v4[4] = v7;
  v4[5] = v6;
  objc_copyWeak(&v5, &location);
  nw_connection_receive(connection, 4u, 4u, v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);
  objc_destroyWeak(&location);
}

void __25__SMBSocket_readNBHeader__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  int v8 = a2;
  id v9 = a3;
  uint64_t v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    int error_code = nw_error_get_error_code(v10);
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    int error_code = 0;
    if (!v8) {
      goto LABEL_8;
    }
  }
  if (dispatch_data_get_size(v8) && !error_code)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __25__SMBSocket_readNBHeader__block_invoke_23;
    applier[3] = &unk_2650730F8;
    long long v22 = *(_OWORD *)(a1 + 32);
    objc_copyWeak(&v23, (id *)(a1 + 48));
    dispatch_data_apply(v8, applier);
    objc_destroyWeak(&v23);
    goto LABEL_18;
  }
LABEL_8:
  if (error_code)
  {
    if (error_code != 57 && error_code != 89 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __25__SMBSocket_readNBHeader__block_invoke_cold_1(error_code);
    }
  }
  else
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v13) {
        __25__SMBSocket_readNBHeader__block_invoke_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else if (v13)
    {
      __25__SMBSocket_readNBHeader__block_invoke_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
LABEL_18:
}

uint64_t __25__SMBSocket_readNBHeader__block_invoke_23(uint64_t a1, void *a2, uint64_t a3, const void *a4, size_t a5)
{
  id v8 = a2;
  if (a5 == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v10 = WeakRetained;
    uint64_t v11 = (uint64_t)a4;
LABEL_7:
    [WeakRetained readData:v11];

    goto LABEL_8;
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8) + v12;
  size_t v14 = 4 - v12;
  if (v14 < a5) {
    a5 = v14;
  }
  memcpy((void *)(v13 + 24), a4, a5);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a5;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v10 = WeakRetained;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8) + 24;
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

- (int)send:(id)a3
{
  v94[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  size_t v93 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = &v89;
  uint64_t v91 = 0x2020000000;
  uint64_t v92 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  objc_initWeak(&location, self);
  buffer = 0;
  v94[0] = 0;
  if (!v4)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      -[SMBSocket send:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_39;
  }
  uint64_t v5 = objc_msgSend(v4, "sr_sessionp");
  if (!v5)
  {
    BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v19) {
      -[SMBSocket send:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_39;
  }
  id v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  v86[3] = (uint64_t)v6;
  if (v6)
  {
    if ((objc_msgSend(v4, "sr_flags") & 0x100) != 0)
    {
      uint64_t v36 = (uint64_t *)objc_msgSend(v4, "smb_rq_getrequest");
      if (v36)
      {
        uint64_t v37 = mb_detach(v36);
        v90[3] = v37;
        objc_msgSend(v4, "sr_next_rqp");
        uint64_t v39 = v38 = 0;
        if (v39)
        {
          do
          {
            uint64_t v40 = (_DWORD *)mb_detach((uint64_t *)objc_msgSend(v39, "smb_rq_getrequest"));
            if (v40)
            {
              uint64_t v41 = mbuf_concatenate(v90[3], v40);
              v90[3] = v41;
            }
            if (objc_msgSend(v39, "sr_command") == 9
              && ![v39 onEncryptedShare])
            {
              v38 += [v39 writeLen];
              size_t v93 = v38;
              id v42 = [v39 writeData];
              mbuf_set_write((uint64_t)v40, [v42 bytes], objc_msgSend(v39, "writeLen"));

              if ((objc_msgSend(v39, "sr_flags") & 0x100) != 0 && (objc_msgSend(v39, "writeLen") & 7) != 0)
              {
                v38 += 8 - ([v39 writeLen] & 7);
                size_t v93 = v38;
              }
            }
            uint64_t v43 = objc_msgSend(v39, "sr_next_rqp");

            uint64_t v39 = (void *)v43;
          }
          while (v43);
        }
        uint64_t v9 = v38 + m_fixhdr(v90[3]);
        goto LABEL_46;
      }
      BOOL v44 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (!v44) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v7 = (uint64_t *)objc_msgSend(v4, "smb_rq_getrequest");
      id v8 = v7;
      if (v7)
      {
        if (*v7)
        {
          uint64_t v9 = mb_fixhdr(v7);
          uint64_t v10 = mb_detach(v8);
          v90[3] = v10;
          if (!objc_msgSend(v4, "sr_command") && (*(unsigned char *)(v5 + 561) & 0x10) != 0)
          {
            smb311_pre_auth_integrity_hash_init(v5, 0, v90[3]);
            smb311_pre_auth_integrity_hash_print(v5);
          }
          if (objc_msgSend(v4, "sr_command") == 1 && (*(unsigned char *)(v5 + 554) & 2) != 0)
          {
            if (objc_msgSend(v4, "sr_rqsessionid")) {
              smb311_pre_auth_integrity_hash_update(v5, v90[3]);
            }
            else {
              smb311_pre_auth_integrity_hash_init(v5, 1, v90[3]);
            }
            smb311_pre_auth_integrity_hash_print(v5);
          }
          if (objc_msgSend(v4, "sr_command") == 9 && !objc_msgSend(v4, "onEncryptedShare"))
          {
            unsigned int v61 = [v4 writeLen];
            uint64_t v62 = v90[3];
            id v63 = [v4 writeData];
            mbuf_set_write(v62, [v63 bytes], objc_msgSend(v4, "writeLen"));

            v9 += v61;
          }
LABEL_46:
          uint64_t v64 = v90[3];
          if (v64)
          {
            int v65 = 0;
            do
            {
              uint64_t v64 = mbuf_next(v64);
              ++v65;
            }
            while (v64);
          }
          else
          {
            int v65 = 0;
          }
          id v66 = objc_loadWeakRetained(&location);
          [v66 setNetBIOSHeader:v86[3] nbType:0 length:v9];

          smb_rq_set_time_sent(v4, 0);
          uint64_t v67 = dispatch_data_create((const void *)v86[3], 4uLL, 0, 0);
          dispatch_data_t v68 = 0;
          if (v65)
          {
            uint64_t v69 = v90[3];
            do
            {
              int v70 = (const void *)mbuf_data(v69);
              size_t v71 = mbuf_len(v69);
              BOOL v72 = dispatch_data_create(v70, v71, 0, 0);

              concat = dispatch_data_create_concat(v67, v72);
              if (mbuf_is_write(v69, &buffer, &v93))
              {
                id v74 = dispatch_data_create(buffer, v93, 0, 0);

                uint64_t v67 = dispatch_data_create_concat(concat, v74);
                if ((objc_msgSend(v4, "sr_flags") & 0x100) != 0 && (v93 & 7) != 0)
                {
                  dispatch_data_t v68 = dispatch_data_create(v94, 8 - (v93 & 7), 0, 0);

                  dispatch_data_t v75 = dispatch_data_create_concat(v67, v68);
                  uint64_t v67 = v75;
                }
                else
                {
                  dispatch_data_t v68 = v74;
                }
              }
              else
              {
                uint64_t v67 = concat;
                dispatch_data_t v68 = v72;
              }
              uint64_t v69 = mbuf_next(v69);
              --v65;
            }
            while (v65);
          }
          connection = self->_connection;
          uint64_t v77 = *MEMORY[0x263F14450];
          completion[0] = MEMORY[0x263EF8330];
          completion[1] = 3221225472;
          completion[2] = __18__SMBSocket_send___block_invoke;
          completion[3] = &unk_265073148;
          id v81 = &v85;
          timeval v82 = &v89;
          id v79 = v4;
          id v80 = self;
          nw_connection_send(connection, v67, v77, 0, completion);

          int v35 = 0;
          goto LABEL_40;
        }
        BOOL v52 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v52) {
          -[SMBSocket send:].cold.5(v52, v53, v54, v55, v56, v57, v58, v59);
        }
        goto LABEL_38;
      }
      BOOL v44 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (!v44)
      {
LABEL_38:
        free((void *)v86[3]);
LABEL_39:
        int v35 = 22;
        goto LABEL_40;
      }
    }
    -[SMBSocket send:].cold.4(v44, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_38;
  }
  BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v27) {
    -[SMBSocket send:](v27, v28, v29, v30, v31, v32, v33, v34);
  }
  int v35 = 12;
LABEL_40:
  objc_destroyWeak(&location);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v35;
}

void __18__SMBSocket_send___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v4)
  {
    free(v4);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v5) {
    mbuf_freem(v5);
  }
  if (v3 && (int error_code = nw_error_get_error_code(v3)) != 0)
  {
    int v7 = error_code;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __18__SMBSocket_send___block_invoke_cold_1(a1);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "sr_extflags") & 0x10) == 0) {
      smb_rq_dequeue((pthread_mutex_t *)(*(void *)(a1 + 40) + 128), *(void **)(*(void *)(a1 + 40) + 192), (_DWORD *)(*(void *)(a1 + 40) + 336), *(void **)(*(void *)(a1 + 40) + 328), *(void **)(a1 + 32));
    }
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 384);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __18__SMBSocket_send___block_invoke_26;
    v9[3] = &unk_265072F98;
    id v10 = *(id *)(a1 + 32);
    int v11 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "smb_rq_set_extflag:", 4);
  }
}

uint64_t __18__SMBSocket_send___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", *(unsigned int *)(a1 + 40));
}

- (int)sendRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "sr_sessionp");
  unsigned int v6 = objc_msgSend(v4, "sr_command");
  objc_initWeak(&location, self);
  if (self->nw_conn_state != 3) {
    goto LABEL_4;
  }
  pthread_mutex_lock(&self->skt_lock);
  if ((self->state & 2) != 0)
  {
    pthread_mutex_unlock(&self->skt_lock);
    smb2_rq_message_id_increment(v4);
    if ((*(_DWORD *)(v5 + 552) & 0x28800) != 0)
    {
      if ((*(_WORD *)(v5 + 68) & 4) != 0)
      {
        BOOL v8 = v6 < 2;
      }
      else
      {
        if (v6 <= 3 && v6 != 2) {
          goto LABEL_9;
        }
        BOOL v8 = [v4 onEncryptedShare] == 0;
      }
LABEL_11:
      smb_rq_enqueue(&self->io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v4);
      if (v8)
      {
        if ((*(unsigned char *)(v5 + 552) & 8) == 0 && (objc_msgSend(v4, "sr_flags") & 0x400) == 0)
        {
          send_queue = self->send_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __25__SMBSocket_sendRequest___block_invoke_3;
          block[3] = &unk_265073170;
          objc_copyWeak(&v20, &location);
          id v19 = v4;
          dispatch_async(send_queue, block);

          objc_destroyWeak(&v20);
LABEL_18:
          int v7 = 0;
          goto LABEL_19;
        }
        signing_queue = self->_signing_queue;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __25__SMBSocket_sendRequest___block_invoke;
        v21[3] = &unk_265073198;
        id v22 = v4;
        uint64_t v23 = self;
        objc_copyWeak(&v24, &location);
        dispatch_async(signing_queue, v21);
        objc_destroyWeak(&v24);
        int v11 = v22;
      }
      else
      {
        id v10 = self->_signing_queue;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __25__SMBSocket_sendRequest___block_invoke_4;
        v14[3] = &unk_265073198;
        id v15 = v4;
        uint64_t v16 = self;
        objc_copyWeak(&v17, &location);
        dispatch_async(v10, v14);
        objc_destroyWeak(&v17);
        int v11 = v15;
      }

      goto LABEL_18;
    }
LABEL_9:
    BOOL v8 = 1;
    goto LABEL_11;
  }
  pthread_mutex_unlock(&self->skt_lock);
LABEL_4:
  int v7 = 57;
LABEL_19:
  objc_destroyWeak(&location);

  return v7;
}

void __25__SMBSocket_sendRequest___block_invoke(uint64_t a1)
{
  smb2_rq_sign(*(void **)(a1 + 32));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 40) + 200);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __25__SMBSocket_sendRequest___block_invoke_2;
  v3[3] = &unk_265073170;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __25__SMBSocket_sendRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained send:*(void *)(a1 + 32)];
}

void __25__SMBSocket_sendRequest___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained send:*(void *)(a1 + 32)];
}

void __25__SMBSocket_sendRequest___block_invoke_4(uint64_t a1)
{
  if (smb3_rq_encrypt(*(void **)(a1 + 32)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __25__SMBSocket_sendRequest___block_invoke_4_cold_1();
    }
    nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 40) + 376));
  }
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 40) + 200);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __25__SMBSocket_sendRequest___block_invoke_28;
  v3[3] = &unk_265073170;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __25__SMBSocket_sendRequest___block_invoke_28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained send:*(void *)(a1 + 32)];
}

- (void)setNetBIOSHeader:(unsigned int *)a3 nbType:(unsigned __int8)a4 length:(unsigned int)a5
{
  if (self->is_NetBIOS) {
    int v5 = 0x1FFFF;
  }
  else {
    int v5 = 0xFFFFFF;
  }
  *a3 = bswap32(v5 & a5 | (a4 << 24));
}

- (void)timeOutCheck
{
}

- (int)writeEnabled
{
  uint64_t v2 = self;
  p_skt_lock = &self->skt_lock;
  pthread_mutex_lock(&self->skt_lock);
  LODWORD(v2) = (v2->state & 0x34) == 0;
  pthread_mutex_unlock(p_skt_lock);
  return (int)v2;
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 376, 1);
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)recv_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRecv_queue:(id)a3
{
}

- (OS_dispatch_queue)signing_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSigning_queue:(id)a3
{
}

- (NSString)netBiosName
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setNetBiosName:(id)a3
{
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setServerName:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)connectTimeOut
{
  return self->_connectTimeOut;
}

- (void)setConnectTimeOut:(unsigned int)a3
{
  self->_connectTimeOut = a3;
}

- (timespec)last_recv
{
  objc_copyStruct(v4, &self->_last_recv, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.__darwin_time_t tv_sec = v2;
  return result;
}

- (void)setLast_recv:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_last_recv, &v3, 16, 1, 0);
}

- (timespec)last_echo
{
  objc_copyStruct(v4, &self->_last_echo, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.__darwin_time_t tv_sec = v2;
  return result;
}

- (void)setLast_echo:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_last_echo, &v3, 16, 1, 0);
}

- (unsigned)resp_wait_timeout
{
  return self->_resp_wait_timeout;
}

- (void)setResp_wait_timeout:(unsigned int)a3
{
  self->_resp_wait_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_netBiosName, 0);
  objc_storeStrong((id *)&self->_signing_queue, 0);
  objc_storeStrong((id *)&self->_recv_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->event_handler_callback, 0);
  objc_storeStrong((id *)&self->timer_semaphore, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->timer_queue, 0);
  objc_storeStrong((id *)&self->send_queue, 0);
  objc_storeStrong((id *)&self->io_rqlist, 0);
  objc_storeStrong((id *)&self->nw_conn_queue, 0);
  objc_storeStrong((id *)&self->event_semaphore, 0);
  objc_storeStrong((id *)&self->remote_endpoint, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong((id *)&self->pd, 0);
}

- (void)openSocket:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a1 .cold.9(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[SMBSocket openSocket:]";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: nw_endpoint_create_host failed for <%s> \n", buf, 0x16u);
}

- (void)openSocket:(uint64_t)a3 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:(uint64_t)a3 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openSocket:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: pthread_cond_init failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)openSocket:.cold.14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: pthread_mutex_init failed for skt <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)openSocket:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: pthread_mutex_init failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __24__SMBSocket_openSocket___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_8_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Event failed with <%d> \n", v1, v2, v3, v4, 2u);
}

void __24__SMBSocket_openSocket___block_invoke_11_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_11_cold_3()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: Viable: %s\n", v1, v2, v3, v4, 2u);
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v0, "%s: Better Path Available: %s\n", v1, v2, v3, v4, 2u);
}

void __24__SMBSocket_openSocket___block_invoke_2_17_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_2_17_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_2_19_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __24__SMBSocket_openSocket___block_invoke_2_19_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)connectSocket
{
}

- (void)processReply:(int *)a3 .cold.1(uint64_t *a1, unsigned __int16 *a2, int *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = *a2;
  int v5 = *a3;
  int v6 = 136315906;
  int v7 = "-[SMBSocket processReply:]";
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: drop response: message_id %lld, cmd %d status 0x%x\n", (uint8_t *)&v6, 0x22u);
}

- (void)processReply:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processReply:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processReply:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processReply:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_mbuf_get failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)readData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Unknown NetBIOS Msg Type: <0x%x> \n", v1, v2, v3, v4, 2u);
}

void __22__SMBSocket_readData___block_invoke_cold_1(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v1, "%s: nw_connection_read_buffer callback failed <%s> \n", v2, v3, v4, v5, 2u);
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_1(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_23F849000, &_os_log_internal, v1, "%s: nw_connection_read_buffer callback failed <%s> \n", v2, v3, v4, v5, 2u);
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)send:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)send:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)send:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)send:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)send:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __18__SMBSocket_send___block_invoke_cold_1(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sr_messageid");
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v1, "%s: nw_connection_send failed <%d> for message ID <%llu> \n", v2, v3, v4, v5, 2u);
}

void __25__SMBSocket_sendRequest___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: SMB3 transform failed, error: %d\n", v1, v2, v3, v4, 2u);
}

@end