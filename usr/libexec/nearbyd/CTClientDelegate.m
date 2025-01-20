@interface CTClientDelegate
- (id)fOnCellMonitorUpdateCb;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)dealloc;
- (void)setFOnCellMonitorUpdateCb:(id)a3;
@end

@implementation CTClientDelegate

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  fOnCellMonitorUpdateCb = (void (**)(id, id, id))self->_fOnCellMonitorUpdateCb;
  if (fOnCellMonitorUpdateCb) {
    fOnCellMonitorUpdateCb[2](fOnCellMonitorUpdateCb, v8, v6);
  }
}

- (void)dealloc
{
  id fOnCellMonitorUpdateCb = self->_fOnCellMonitorUpdateCb;
  self->_id fOnCellMonitorUpdateCb = 0;

  v4.receiver = self;
  v4.super_class = (Class)CTClientDelegate;
  [(CTClientDelegate *)&v4 dealloc];
}

- (id)fOnCellMonitorUpdateCb
{
  return self->_fOnCellMonitorUpdateCb;
}

- (void)setFOnCellMonitorUpdateCb:(id)a3
{
}

- (void).cxx_destruct
{
}

@end