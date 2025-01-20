@interface WiFiNWReliabilityMonitorDataStore
- (BOOL)addSample:(id)a3;
- (WiFiNWReliabilityMonitorDataStore)initWithMetric:(unint64_t)a3 withMaxSamples:(unint64_t)a4;
- (unint64_t)getCount;
- (unint64_t)maxSamples;
- (unint64_t)metric;
- (void)dealloc;
- (void)getSamples:(id)a3;
@end

@implementation WiFiNWReliabilityMonitorDataStore

- (WiFiNWReliabilityMonitorDataStore)initWithMetric:(unint64_t)a3 withMaxSamples:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WiFiNWReliabilityMonitorDataStore;
  v6 = [(WiFiNWReliabilityMonitorDataStore *)&v10 init];
  if (v6
    && (+[NSMutableArray array],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        buffer = v6->_buffer,
        v6->_buffer = (NSMutableArray *)v7,
        buffer,
        v6->_buffer))
  {
    v6->_metric = a3;
    v6->_maxSamples = a4;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer)
  {
    [(NSMutableArray *)buffer removeAllObjects];
    v4 = self->_buffer;
    self->_buffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiNWReliabilityMonitorDataStore;
  [(WiFiNWReliabilityMonitorDataStore *)&v5 dealloc];
}

- (BOOL)addSample:(id)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_buffer count] > self->_maxSamples) {
    [(NSMutableArray *)self->_buffer removeLastObject];
  }
  return 1;
}

- (void)getSamples:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v5 = self->_buffer;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)getCount
{
  return (unint64_t)[(NSMutableArray *)self->_buffer count];
}

- (unint64_t)metric
{
  return self->_metric;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (void).cxx_destruct
{
}

@end