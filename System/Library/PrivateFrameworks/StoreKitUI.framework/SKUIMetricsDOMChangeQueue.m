@interface SKUIMetricsDOMChangeQueue
- (BOOL)isEmpty;
- (SKUIMetricsDOMChangeQueue)init;
- (id)oldestPendingChange;
- (unint64_t)count;
- (void)addPendingChange:(id)a3;
- (void)init;
@end

@implementation SKUIMetricsDOMChangeQueue

- (SKUIMetricsDOMChangeQueue)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMetricsDOMChangeQueue init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMetricsDOMChangeQueue;
  v3 = [(SKUIMetricsDOMChangeQueue *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    storage = v3->_storage;
    v3->_storage = (NSMutableArray *)v4;
  }
  return v3;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_storage count] == 0;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_storage count];
}

- (void)addPendingChange:(id)a3
{
  id v26 = a3;
  if ([(SKUIMetricsDOMChangeQueue *)self isEmpty]) {
    goto LABEL_34;
  }
  uint64_t v4 = [(NSMutableArray *)self->_storage lastObject];
  if (![v4 isFromDeferredMessage]
    || ![v26 isFromDeferredMessage])
  {

LABEL_34:
    storage = self->_storage;
    uint64_t v4 = (void *)[v26 copy];
    [(NSMutableArray *)storage addObject:v4];
    goto LABEL_35;
  }
  [v4 buildStartTime];
  double v6 = v5;
  [v26 buildStartTime];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  if (v6 >= v7) {
    double v9 = v7;
  }
  else {
    double v9 = v6;
  }
  if (v7 < 2.22044605e-16 || v6 < 2.22044605e-16) {
    double v11 = v8;
  }
  else {
    double v11 = v9;
  }
  [v4 setBuildStartTime:v11];
  [v4 buildEndTime];
  double v13 = v12;
  [v26 buildEndTime];
  if (v13 >= v14) {
    double v14 = v13;
  }
  [v4 setBuildEndTime:v14];
  [v4 renderStartTime];
  double v16 = v15;
  [v26 renderStartTime];
  if (v16 >= v17) {
    double v18 = v16;
  }
  else {
    double v18 = v17;
  }
  if (v16 >= v17) {
    double v19 = v17;
  }
  else {
    double v19 = v16;
  }
  if (v17 < 2.22044605e-16 || v16 < 2.22044605e-16) {
    double v21 = v18;
  }
  else {
    double v21 = v19;
  }
  [v4 setRenderStartTime:v21];
  [v4 renderEndTime];
  double v23 = v22;
  [v26 renderEndTime];
  if (v23 >= v24) {
    double v24 = v23;
  }
  [v4 setRenderEndTime:v24];
LABEL_35:
}

- (id)oldestPendingChange
{
  if ([(NSMutableArray *)self->_storage count])
  {
    v3 = [(NSMutableArray *)self->_storage firstObject];
    [(NSMutableArray *)self->_storage removeObjectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMetricsDOMChangeQueue init]";
}

@end