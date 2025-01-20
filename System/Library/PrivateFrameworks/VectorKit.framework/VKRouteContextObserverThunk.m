@interface VKRouteContextObserverThunk
- (VKRouteContextObserverThunk)initWithRouteContext:(id)a3 transitSupport:(void *)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)routeContextStateDidChange:(id)a3;
@end

@implementation VKRouteContextObserverThunk

- (id).cxx_construct
{
  *((void *)self + 2) = &unk_1EF5595D8;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  self->_routeContext._vptr$_retain_ptr = (void **)&unk_1EF5595D8;
}

- (void)routeContextStateDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  transitSupport = self->_transitSupport;
  v6 = (md::LabelManager *)*((void *)transitSupport + 2);
  v7[0] = &unk_1EF574940;
  v7[1] = transitSupport;
  v8 = v7;
  md::LabelManager::queueCommand(v6, 44, 1, v7);
  if (v8 == v7)
  {
    (*(void (**)(void *))(v7[0] + 32))(v7);
  }
  else if (v8)
  {
    (*(void (**)(void))(*v8 + 40))();
  }
}

- (void)dealloc
{
  [(VKRouteContext *)self->_routeContext._obj removeObserver:self withType:0];
  v3.receiver = self;
  v3.super_class = (Class)VKRouteContextObserverThunk;
  [(VKRouteContextObserverThunk *)&v3 dealloc];
}

- (VKRouteContextObserverThunk)initWithRouteContext:(id)a3 transitSupport:(void *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKRouteContextObserverThunk;
  v7 = [(VKRouteContextObserverThunk *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_transitSupport = a4;
    uint64_t v9 = (VKRouteContext *)v6;
    v10 = v9;
    if (v9) {
      v11 = v9;
    }
    obj = v8->_routeContext._obj;
    v8->_routeContext._obj = v10;

    [(VKRouteContext *)v8->_routeContext._obj addObserver:v8 withType:0];
  }

  return v8;
}

@end