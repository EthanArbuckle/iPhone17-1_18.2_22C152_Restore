@interface STStatusServer
- (BSIntegerSet)publishedDomains;
- (STStatusServer)init;
- (STStatusServerDelegate)delegate;
- (id)dataForDomain:(unint64_t)a3;
- (id)initWithLocalStatusServer:(void *)a3 serverHandle:(void *)a4 publisherServerHandle:;
- (id)publishedDataForDomain:(unint64_t)a3;
- (id)publishedVolatileDataForDomain:(unint64_t)a3;
- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4;
- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4;
- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5;
- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5;
- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7;
- (void)registerClient:(id)a3 forDomain:(unint64_t)a4;
- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5;
- (void)removeClient:(id)a3 forDomain:(unint64_t)a4;
- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4;
- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4;
- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4;
- (void)replaceDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5;
- (void)replaceVolatileDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5;
- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5;
- (void)setDelegate:(id)a3;
- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6;
@end

@implementation STStatusServer

- (id)dataForDomain:(unint64_t)a3
{
  if (self) {
    self = (STStatusServer *)self->_serverHandle;
  }
  return [(STStatusServer *)self dataForDomain:a3];
}

- (void)updateDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self updateDataForPublisherClient:a3 domain:a4 usingDiffProvider:a5 completion:a6];
}

- (STStatusServer)init
{
  if (_os_feature_enabled_impl())
  {
    STDefaultStatusDomainServerHandle();
    v3 = (STLocalStatusServer *)objc_claimAutoreleasedReturnValue();
    v4 = STDefaultStatusDomainPublisherServerHandle();
    v5 = -[STStatusServer initWithLocalStatusServer:serverHandle:publisherServerHandle:]((id *)&self->super.isa, 0, v3, v4);
  }
  else
  {
    v3 = objc_alloc_init(STLocalStatusServer);
    v5 = -[STStatusServer initWithLocalStatusServer:serverHandle:publisherServerHandle:]((id *)&self->super.isa, v3, v3, v3);
  }

  return v5;
}

- (id)initWithLocalStatusServer:(void *)a3 serverHandle:(void *)a4 publisherServerHandle:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STStatusServer;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (BSIntegerSet)publishedDomains
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4F760]);
  return (BSIntegerSet *)v2;
}

- (id)publishedDataForDomain:(unint64_t)a3
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  return [(STStatusServer *)self publishedDataForDomain:a3];
}

- (id)publishedVolatileDataForDomain:(unint64_t)a3
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  return [(STStatusServer *)self publishedVolatileDataForDomain:a3];
}

- (void)registerPublisherClient:(id)a3 forDomain:(unint64_t)a4 fallbackData:(id)a5
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self registerPublisherClient:a3 forDomain:a4 fallbackData:a5];
}

- (void)removePublisherClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self removePublisherClient:a3 forDomain:a4];
}

- (void)replaceDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self replaceDataChangeRecord:a3 forPublisherClient:a4 completion:a5];
}

- (void)replaceVolatileDataChangeRecord:(id)a3 forPublisherClient:(id)a4 completion:(id)a5
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self replaceVolatileDataChangeRecord:a3 forPublisherClient:a4 completion:a5];
}

- (void)publishData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self publishData:a3 forPublisherClient:a4 domain:a5 withChangeContext:a6 completion:a7];
}

- (void)publishVolatileData:(id)a3 forPublisherClient:(id)a4 domain:(unint64_t)a5 withChangeContext:(id)a6 completion:(id)a7
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self publishVolatileData:a3 forPublisherClient:a4 domain:a5 withChangeContext:a6 completion:a7];
}

- (void)updateVolatileDataForPublisherClient:(id)a3 domain:(unint64_t)a4 usingDiffProvider:(id)a5 completion:(id)a6
{
  if (self) {
    self = (STStatusServer *)self->_publisherServerHandle;
  }
  [(STStatusServer *)self updateVolatileDataForPublisherClient:a3 domain:a4 usingDiffProvider:a5 completion:a6];
}

- (void)registerClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_serverHandle;
  }
  [(STStatusServer *)self registerClient:a3 forDomain:a4];
}

- (void)removeClient:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_serverHandle;
  }
  [(STStatusServer *)self removeClient:a3 forDomain:a4];
}

- (void)reportUserInteraction:(id)a3 forClient:(id)a4 domain:(unint64_t)a5
{
  if (self) {
    self = (STStatusServer *)self->_serverHandle;
  }
  [(STStatusServer *)self reportUserInteraction:a3 forClient:a4 domain:a5];
}

- (void)addDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self addDataTransformer:a3 forDomain:a4];
}

- (void)removeDataTransformer:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self removeDataTransformer:a3 forDomain:a4];
}

- (void)modifyDataTransformer:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self modifyDataTransformer:a3 forDomain:a4 usingBlock:a5];
}

- (void)addClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self addClientDataTransformerProvider:a3 forDomain:a4];
}

- (void)removeClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self removeClientDataTransformerProvider:a3 forDomain:a4];
}

- (void)modifyClientDataTransformerProvider:(id)a3 forDomain:(unint64_t)a4 usingBlock:(id)a5
{
  if (self) {
    self = (STStatusServer *)self->_localStatusServer;
  }
  [(STStatusServer *)self modifyClientDataTransformerProvider:a3 forDomain:a4 usingBlock:a5];
}

- (STStatusServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STStatusServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherServerHandle, 0);
  objc_storeStrong((id *)&self->_serverHandle, 0);
  objc_storeStrong((id *)&self->_localStatusServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end