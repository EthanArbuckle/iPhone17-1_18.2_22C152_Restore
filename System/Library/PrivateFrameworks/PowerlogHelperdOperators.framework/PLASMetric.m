@interface PLASMetric
- (NSArray)metricProperties;
- (NSString)metricKey;
- (id)initMetric:(id)a3 withType:(signed __int16)a4 withProperties:(id)a5 withQuery:(id)a6 andSummarizerBlock:(id)a7;
- (id)query;
- (id)summarizer;
- (signed)metricType;
- (void)setMetricKey:(id)a3;
- (void)setMetricProperties:(id)a3;
- (void)setMetricType:(signed __int16)a3;
- (void)setQuery:(id)a3;
- (void)setSummarizer:(id)a3;
@end

@implementation PLASMetric

- (id)initMetric:(id)a3 withType:(signed __int16)a4 withProperties:(id)a5 withQuery:(id)a6 andSummarizerBlock:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PLASMetric;
  v17 = [(PLASMetric *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_metricKey, a3);
    v18->_metricType = a4;
    objc_storeStrong((id *)&v18->_metricProperties, a5);
    uint64_t v19 = MEMORY[0x1E4E7F1C0](v15);
    id query = v18->_query;
    v18->_id query = (id)v19;

    uint64_t v21 = MEMORY[0x1E4E7F1C0](v16);
    id summarizer = v18->_summarizer;
    v18->_id summarizer = (id)v21;
  }
  return v18;
}

- (NSString)metricKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricKey:(id)a3
{
}

- (signed)metricType
{
  return self->_metricType;
}

- (void)setMetricType:(signed __int16)a3
{
  self->_metricType = a3;
}

- (NSArray)metricProperties
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetricProperties:(id)a3
{
}

- (id)query
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
}

- (id)summarizer
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSummarizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_summarizer, 0);
  objc_storeStrong(&self->_query, 0);
  objc_storeStrong((id *)&self->_metricProperties, 0);
  objc_storeStrong((id *)&self->_metricKey, 0);
}

@end