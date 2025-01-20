@interface SAAppSizeBreakdown
- (NSMutableDictionary)dataPathsSizes;
- (NSMutableDictionary)fixedPathsSizes;
- (SAAppSizeBreakdown)init;
- (id)generateDictionary;
- (unint64_t)maxPathLength;
- (unint64_t)pluginCacheSize;
- (unint64_t)tagsSize;
- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5;
- (void)addPluginCacheSize:(unint64_t)a3;
- (void)addTagSize:(unint64_t)a3;
- (void)mergeWithAppSizeBreakdown:(id)a3;
- (void)setDataPathsSizes:(id)a3;
- (void)setFixedPathsSizes:(id)a3;
- (void)setMaxPathLength:(unint64_t)a3;
- (void)setPluginCacheSize:(unint64_t)a3;
- (void)setTagsSize:(unint64_t)a3;
- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4;
- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4;
@end

@implementation SAAppSizeBreakdown

- (SAAppSizeBreakdown)init
{
  v8.receiver = self;
  v8.super_class = (Class)SAAppSizeBreakdown;
  v2 = [(SAAppSizeBreakdown *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataPathsSizes = v2->_dataPathsSizes;
    v2->_dataPathsSizes = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    fixedPathsSizes = v2->_fixedPathsSizes;
    v2->_fixedPathsSizes = (NSMutableDictionary *)v5;

    v2->_tagsSize = 0;
    v2->_pluginCacheSize = 0;
    v2->_maxPathLength = 0;
  }
  return v2;
}

- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[NSNumber numberWithUnsignedLongLong:a5];
  uint64_t v10 = 8;
  if (v6) {
    uint64_t v10 = 16;
  }
  [*(id *)((char *)&self->super.isa + v10) setObject:v9 forKeyedSubscript:v8];

  unint64_t maxPathLength = self->_maxPathLength;
  id v12 = [v8 length];

  if (maxPathLength <= (unint64_t)v12) {
    unint64_t v13 = (unint64_t)v12;
  }
  else {
    unint64_t v13 = maxPathLength;
  }
  self->_unint64_t maxPathLength = v13;
}

- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4
{
  id v9 = a3;
  BOOL v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dataPathsSizes, "objectForKeyedSubscript:");
  v7 = v6;
  if (v6)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v6 unsignedLongLongValue] - a4);
    [(NSMutableDictionary *)self->_dataPathsSizes setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4
{
  id v9 = a3;
  BOOL v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dataPathsSizes, "objectForKeyedSubscript:");
  v7 = v6;
  if (v6)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v6 unsignedLongLongValue] + a4);
    [(NSMutableDictionary *)self->_dataPathsSizes setObject:v8 forKeyedSubscript:v9];
  }
}

- (void)addTagSize:(unint64_t)a3
{
  self->_tagsSize += a3;
}

- (void)addPluginCacheSize:(unint64_t)a3
{
  self->_pluginCacheSize += a3;
}

- (void)mergeWithAppSizeBreakdown:(id)a3
{
  dataPathsSizes = self->_dataPathsSizes;
  id v5 = a3;
  BOOL v6 = [v5 dataPathsSizes];
  [(NSMutableDictionary *)dataPathsSizes addEntriesFromDictionary:v6];

  fixedPathsSizes = self->_fixedPathsSizes;
  id v8 = [v5 fixedPathsSizes];
  [(NSMutableDictionary *)fixedPathsSizes addEntriesFromDictionary:v8];

  self->_tagsSize += (unint64_t)[v5 tagsSize];
  id v9 = [v5 pluginCacheSize];
  unint64_t maxPathLength = self->_maxPathLength;
  self->_pluginCacheSize += (unint64_t)v9;
  id v11 = [v5 maxPathLength];

  if (maxPathLength <= (unint64_t)v11) {
    unint64_t v12 = (unint64_t)v11;
  }
  else {
    unint64_t v12 = maxPathLength;
  }
  self->_unint64_t maxPathLength = v12;
}

- (id)generateDictionary
{
  dataPathsSizes = self->_dataPathsSizes;
  fixedPathsSizes = self->_fixedPathsSizes;
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_tagsSize];
  BOOL v6 = +[NSNumber numberWithUnsignedLongLong:self->_pluginCacheSize];
  v7 = +[NSNumber numberWithUnsignedLongLong:self->_maxPathLength];
  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:dataPathsSizes, @"Data Paths", fixedPathsSizes, @"Fixed Paths", v5, @"Attribution Tags", v6, @"Plugin Cache Size", v7, @"Max Path Length", 0];

  return v8;
}

- (NSMutableDictionary)dataPathsSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDataPathsSizes:(id)a3
{
}

- (NSMutableDictionary)fixedPathsSizes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFixedPathsSizes:(id)a3
{
}

- (unint64_t)tagsSize
{
  return self->_tagsSize;
}

- (void)setTagsSize:(unint64_t)a3
{
  self->_tagsSize = a3;
}

- (unint64_t)pluginCacheSize
{
  return self->_pluginCacheSize;
}

- (void)setPluginCacheSize:(unint64_t)a3
{
  self->_pluginCacheSize = a3;
}

- (unint64_t)maxPathLength
{
  return self->_maxPathLength;
}

- (void)setMaxPathLength:(unint64_t)a3
{
  self->_unint64_t maxPathLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedPathsSizes, 0);
  objc_storeStrong((id *)&self->_dataPathsSizes, 0);
}

@end