@interface MapHandler
- (MapHandler)init;
- (MapHandlerDelegate)delegate;
- (NSMutableSet)pendingSendGuids;
- (void)setDelegate:(id)a3;
- (void)setPendingSendGuids:(id)a3;
@end

@implementation MapHandler

- (MapHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapHandler;
  v2 = [(MapHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingSendGuids = v2->_pendingSendGuids;
    v2->_pendingSendGuids = v3;
  }
  return v2;
}

- (MapHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)pendingSendGuids
{
  return self->_pendingSendGuids;
}

- (void)setPendingSendGuids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSendGuids, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end