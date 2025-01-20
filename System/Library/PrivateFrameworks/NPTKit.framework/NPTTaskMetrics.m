@interface NPTTaskMetrics
- (NPTMetricResult)results;
- (NPTTaskMetrics)init;
- (NSURLSessionDataTask)task;
- (NSURLSessionTaskMetrics)taskMetrics;
- (void)setResults:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskMetrics:(id)a3;
@end

@implementation NPTTaskMetrics

- (NPTTaskMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPTTaskMetrics;
  v2 = [(NPTTaskMetrics *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NPTTaskMetrics *)v2 setTask:0];
    [(NPTTaskMetrics *)v3 setResults:0];
    [(NPTTaskMetrics *)v3 setTaskMetrics:0];
  }
  return v3;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (NPTMetricResult)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end