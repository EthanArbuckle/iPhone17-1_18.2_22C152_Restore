@interface MCSessionHandler
- (DynamicArray<re::SharedPtr<(anonymous)handles;
- (MCSession)session;
- (MCSessionHandler)initWithSession:(id)a3 protocolLayer:(MultipeerProtocolLayer *)a4;
- (MCSessionPrivateDelegate)nextDelegate;
- (MultipeerProtocolLayer)protocolLayer;
- (NSLock)handlesLock;
- (ProtocolLayerListener)listener;
- (id).cxx_construct;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8;
- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6;
- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7;
- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6;
- (void)setHandles:(DynamicArray<re::SharedPtr<(anonymous)namespace;
- (void)setHandlesLock:(id)a3;
- (void)setListener:(ProtocolLayerListener *)a3;
- (void)setNextDelegate:(id)a3;
- (void)setProtocolLayer:(MultipeerProtocolLayer *)a3;
- (void)setSession:(id)a3;
@end

@implementation MCSessionHandler

- (MCSessionHandler)initWithSession:(id)a3 protocolLayer:(MultipeerProtocolLayer *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCSessionHandler;
  v7 = [(MCSessionHandler *)&v21 init];
  [(MCSessionHandler *)v7 setSession:v6];
  [(MCSessionHandler *)v7 setProtocolLayer:a4];
  [(MCSessionHandler *)v7 setListener:a4->var3];
  v8 = objc_opt_new();
  [(MCSessionHandler *)v7 setHandlesLock:v8];

  v9 = [v6 privateDelegate];
  [(MCSessionHandler *)v7 setNextDelegate:v9];

  [v6 setPrivateDelegate:v7];
  [v6 addObserver:v7 forKeyPath:@"privateDelegate" options:1 context:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = [v6 connectedPeers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (v16) {

        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  return v7;
}

- (void)dealloc
{
  [(MCSession *)self->_session removeObserver:self forKeyPath:@"privateDelegate"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextDelegate);
  [(MCSession *)self->_session setPrivateDelegate:WeakRetained];

  [(MCSession *)self->_session disconnect];
  v4.receiver = self;
  v4.super_class = (Class)MCSessionHandler;
  [(MCSessionHandler *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v7 = [(MCSession *)self->_session privateDelegate];

  if (v7 != self)
  {
    id v8 = [(MCSession *)self->_session privateDelegate];
    [(MCSession *)self->_session setPrivateDelegate:self];
    [(MCSessionHandler *)self setNextDelegate:v8];
  }
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5 propagate:(BOOL *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  uint64_t v14 = (unsigned __int8 *)[v13 bytes];
  v15 = (char *)[v13 length];
  if ((unint64_t)v15 >= 0xA)
  {
    uint64_t v16 = v15;
    if (SignatureUnsafe)
    {
      unsigned int v18 = v14[8];
      if (v18 < 0xA)
      {
        unsigned int v21 = v18 | 0x100;
        BOOL v20 = 1;
      }
      else
      {
        long long v19 = *re::networkLogObjects((re *)SignatureUnsafe);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v18;
          _os_log_impl(&dword_228C70000, v19, OS_LOG_TYPE_DEFAULT, "MPC: Unsupported channelID=%hhu", buf, 8u);
        }
        BOOL v20 = 0;
        unsigned int v21 = 0;
      }
    }
    else
    {
        goto LABEL_35;
      unsigned int v22 = v14[8];
      BOOL v20 = v22 > 0xFD;
      if (v22 <= 0xFD) {
        unsigned int v21 = 0;
      }
      else {
        unsigned int v21 = v14[8];
      }
    }
    *a6 = 0;
    [(NSLock *)self->_handlesLock lock];
    unint64_t m_size = self->_handles.m_size;
    if (m_size)
    {
      m_data = (uint64_t *)self->_handles.m_data;
      uint64_t v25 = 8 * m_size;
      while (1)
      {
        uint64_t v26 = *m_data;
        id v27 = *(id *)(*m_data + 1768);
        if (v27 && v27 == v12) {
          break;
        }
        ++m_data;
        v25 -= 8;
        if (!v25) {
          goto LABEL_34;
        }
      }
      if (v20)
      {
        if (v21 > 0xFF)
        {
          if (!*(unsigned char *)(v26 + 1776))
          {
            +[REMultipeerHelper makeAddressFromPeerID:v12];
            v32 = (re *)((uint64_t (*)(void))*self->_listener->var0)();
            *(unsigned char *)(*m_data + 1776) = 1;
            v33 = *re::networkLogObjects(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              if (v39) {
                v35 = *(unsigned char **)&v40[7];
              }
              else {
                v35 = v40;
              }
              int v36 = 136315138;
              v37 = v35;
              _os_log_impl(&dword_228C70000, v34, OS_LOG_TYPE_DEFAULT, "MPC: Received data from a legacy client address=%s", (uint8_t *)&v36, 0xCu);
            }
            if (*(void *)buf && (v39 & 1) != 0) {
              (*(void (**)(void))(**(void **)buf + 40))();
            }
          }
          (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, void, uint64_t, void))self->_listener->var0
           + 3))(self->_listener, self->_protocolLayer, *m_data, v21, [v13 bytes] + 9, objc_msgSend(v13, "length") - 9);
        }
        else
        {
          if (!*(unsigned char *)(v26 + 1776))
          {
            +[REMultipeerHelper makeAddressFromPeerID:v12];
            ((void (*)(void))*self->_listener->var0)();
            if (*(void *)buf && (v39 & 1) != 0) {
              (*(void (**)(void))(**(void **)buf + 40))();
            }
            uint64_t v26 = *m_data;
          }
          if (v21 == 255)
          {
            id v29 = v13;
            [v29 bytes];
            [v29 length];
          }
          else
          {
            *(unsigned char *)(v26 + 1776) = 1;
          }
        }
      }
      else if (*(unsigned char *)(v26 + 1776))
      {
        (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, uint64_t, void))self->_listener->var0
         + 2))(self->_listener, self->_protocolLayer, *m_data, 0);
      }
    }
LABEL_34:
    [(NSLock *)self->_handlesLock unlock];
  }
LABEL_35:
  v30 = [(MCSessionHandler *)self nextDelegate];

  if (v30)
  {
    v31 = [(MCSessionHandler *)self nextDelegate];
    [v31 session:v10 didReceiveData:v13 fromPeer:v12 propagate:a6];
  }
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5 propagate:(BOOL *)a6
{
  id v10 = a3;
  id v11 = (MCPeerID *)a4;
  [(NSLock *)self->_handlesLock lock];
  if (a5)
  {
    if (a5 == 2)
    {
      if (v19) {
    }
      }
  }
  else
  {
    unint64_t m_size = self->_handles.m_size;
    if (m_size)
    {
      m_data = self->_handles.m_data;
      uint64_t v14 = 8 * m_size;
      while (1)
      {
        v15 = *(MCPeerID **)(*m_data + 1768);
        if (v15 && v15 == v11) {
          break;
        }
        ++m_data;
        v14 -= 8;
        if (!v14) {
          goto LABEL_17;
        }
      }
      *(void *)(*m_data + 1768) = 0;

      if (*(unsigned char *)(*m_data + 1776))
      {
        +[REMultipeerHelper makeAddressFromPeerID:v11];
        (*((void (**)(ProtocolLayerListener *, MultipeerProtocolLayer *, void, uint64_t *))self->_listener->var0
         + 1))(self->_listener, self->_protocolLayer, *m_data, &v19);
        if (v19)
        {
          if (v20) {
            (*(void (**)(void))(*(void *)v19 + 40))();
          }
        }
      }
    }
  }
LABEL_17:
  [(NSLock *)self->_handlesLock unlock];
  long long v17 = [(MCSessionHandler *)self nextDelegate];

  if (v17)
  {
    unsigned int v18 = [(MCSessionHandler *)self nextDelegate];
    [v18 session:v10 peer:v11 didChangeState:a5 propagate:a6];
  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6 propagate:(BOOL *)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(MCSessionHandler *)self nextDelegate];

  if (v15)
  {
    uint64_t v16 = [(MCSessionHandler *)self nextDelegate];
    [v16 session:v17 didStartReceivingResourceWithName:v12 fromPeer:v13 withProgress:v14 propagate:a7];
  }
}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7 propagate:(BOOL *)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  unsigned int v18 = [(MCSessionHandler *)self nextDelegate];

  if (v18)
  {
    uint64_t v19 = [(MCSessionHandler *)self nextDelegate];
    [v19 session:v20 didFinishReceivingResourceWithName:v14 fromPeer:v15 atURL:v16 withError:v17 propagate:a8];
  }
}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6 propagate:(BOOL *)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(MCSessionHandler *)self nextDelegate];

  if (v15)
  {
    id v16 = [(MCSessionHandler *)self nextDelegate];
    [v16 session:v17 didReceiveStream:v12 withName:v13 fromPeer:v14 propagate:a7];
  }
}

- (MultipeerProtocolLayer)protocolLayer
{
  return self->_protocolLayer;
}

- (void)setProtocolLayer:(MultipeerProtocolLayer *)a3
{
  self->_protocolLayer = a3;
}

- (ProtocolLayerListener)listener
{
  return self->_listener;
}

- (void)setListener:(ProtocolLayerListener *)a3
{
  self->_listener = a3;
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSLock)handlesLock
{
  return self->_handlesLock;
}

- (void)setHandlesLock:(id)a3
{
}

- (DynamicArray<re::SharedPtr<(anonymous)handles
{
  p_m_capacity = &self[1].m_capacity;
  m_capacity = (Allocator *)self[1].m_capacity;
  retstr->m_data = 0;
  retstr->m_capacity = 0;
  retstr->unint64_t m_size = 0;
  retstr->m_allocator = 0;
  retstr->m_version = 0;
  if (m_capacity)
  {
    unint64_t v6 = *(void *)&self[1].m_version;
    retstr->m_allocator = m_capacity;
    re::DynamicArray<re::SharedPtr<re::SyncObject>>::setCapacity(retstr, v6);
    ++retstr->m_version;
  }
  return self;
}

- (void)setHandles:(DynamicArray<re::SharedPtr<(anonymous)namespace
{
  p_handles = &self->_handles;
  if (&self->_handles != a3)
  {
    m_allocator = a3->m_allocator;
    if (p_handles->m_allocator)
    {
      if (m_allocator)
      {
      }
      else
      {
        unint64_t m_size = self->_handles.m_size;
        self->_handles.unint64_t m_size = 0;
        if (m_size)
        {
          m_data = (char *)self->_handles.m_data;
          uint64_t v10 = 8 * m_size;
          do
          {
            if (*(void *)m_data)
            {

              *(void *)m_data = 0;
            }
            m_data += 8;
            v10 -= 8;
          }
          while (v10);
        }
      }
      ++self->_handles.m_version;
    }
    else if (m_allocator)
    {
      unint64_t v7 = a3->m_size;
      self->_handles.m_allocator = m_allocator;
      re::DynamicArray<re::SharedPtr<re::SyncObject>>::setCapacity(&self->_handles.m_allocator, v7);
      ++self->_handles.m_version;
    }
  }
}

- (MCSessionPrivateDelegate)nextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextDelegate);
  return (MCSessionPrivateDelegate *)WeakRetained;
}

- (void)setNextDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nextDelegate);
  objc_storeStrong((id *)&self->_handlesLock, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 18) = 0;
  return self;
}

@end