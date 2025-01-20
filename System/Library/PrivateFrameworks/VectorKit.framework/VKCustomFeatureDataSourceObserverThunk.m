@interface VKCustomFeatureDataSourceObserverThunk
- (VKCustomFeatureDataSourceObserverThunk)initWithDataSource:(id)a3 observer:(void *)a4;
- (id).cxx_construct;
- (void)clearObserver;
- (void)dataSource:(id)a3 didChangeSceneID:(unsigned __int8)a4;
- (void)dataSource:(id)a3 didChangeSceneState:(unsigned __int8)a4;
- (void)dataSource:(id)a3 featuresDidChangeForRect:(id)a4;
- (void)dealloc;
- (void)globalFeaturesDidChangeForDataSource:(id)a3;
@end

@implementation VKCustomFeatureDataSourceObserverThunk

- (id).cxx_construct
{
  *((void *)self + 2) = &unk_1EF55A038;
  *((void *)self + 3) = 0;
  return self;
}

- (VKCustomFeatureDataSourceObserverThunk)initWithDataSource:(id)a3 observer:(void *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKCustomFeatureDataSourceObserverThunk;
  v7 = [(VKCustomFeatureDataSourceObserverThunk *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_observer = a4;
    v9 = (VKCustomFeatureDataSource *)v6;
    v10 = v9;
    if (v9) {
      v11 = v9;
    }
    obj = v8->_dataSource._obj;
    v8->_dataSource._obj = v10;

    [(VKCustomFeatureDataSource *)v8->_dataSource._obj addObserver:v8];
  }

  return v8;
}

- (void)dataSource:(id)a3 featuresDidChangeForRect:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = a4.var0.var1;
  double v7 = a4.var0.var0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  observer = self->_observer;
  if (observer)
  {
    v11 = (double *)operator new(0x30uLL);
    *(void *)v11 = &unk_1EF577B08;
    *((void *)v11 + 1) = observer;
    v11[2] = v7;
    v11[3] = v6;
    v11[4] = var0;
    v11[5] = var1;
    v13 = v11;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 0, v12);
    if (v13 == (double *)v12)
    {
      (*(void (**)(void *))(v12[0] + 32))(v12);
    }
    else if (v13)
    {
      (*(void (**)(void))(*(void *)v13 + 40))();
    }
  }
}

- (void).cxx_destruct
{
  self->_dataSource._vptr$_retain_ptr = (void **)&unk_1EF55A038;
}

- (void)dataSource:(id)a3 didChangeSceneID:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  observer = self->_observer;
  if (observer)
  {
    v8[0] = &unk_1EF577A30;
    v8[1] = observer;
    v8[2] = v4;
    id v9 = v8;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 3, v8);
    if (v9 == v8)
    {
      (*(void (**)(void *))(v8[0] + 32))(v8);
    }
    else if (v9)
    {
      (*(void (**)(void))(*v9 + 40))();
    }
  }
}

- (void)dataSource:(id)a3 didChangeSceneState:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  observer = self->_observer;
  if (observer)
  {
    v8[0] = &unk_1EF577A78;
    v8[1] = observer;
    v8[2] = v4;
    id v9 = v8;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 2, v8);
    if (v9 == v8)
    {
      (*(void (**)(void *))(v8[0] + 32))(v8);
    }
    else if (v9)
    {
      (*(void (**)(void))(*v9 + 40))();
    }
  }
}

- (void)globalFeaturesDidChangeForDataSource:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  observer = self->_observer;
  if (observer)
  {
    v6[0] = &unk_1EF577AC0;
    v6[1] = observer;
    double v7 = v6;
    md::LabelCustomFeatureProvider::queueCommand((uint64_t)observer, 1, v6);
    if (v7 == v6)
    {
      (*(void (**)(void *))(v6[0] + 32))(v6);
    }
    else if (v7)
    {
      (*(void (**)(void))(*v7 + 40))();
    }
  }
}

- (void)clearObserver
{
  [(VKCustomFeatureDataSource *)self->_dataSource._obj removeObserver:self];
  obj = self->_dataSource._obj;
  if (obj)
  {
    self->_dataSource._obj = 0;
  }
  self->_observer = 0;
}

- (void)dealloc
{
  [(VKCustomFeatureDataSourceObserverThunk *)self clearObserver];
  v3.receiver = self;
  v3.super_class = (Class)VKCustomFeatureDataSourceObserverThunk;
  [(VKCustomFeatureDataSourceObserverThunk *)&v3 dealloc];
}

@end