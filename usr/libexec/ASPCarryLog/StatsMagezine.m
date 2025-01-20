@interface StatsMagezine
- (BOOL)doesStatIdExistOnDevice:(int64_t)a3 timeAgo:(unsigned int)a4;
- (BOOL)doesStatIdExistOnDeviceForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 timeAgo:(unsigned int)a6;
- (CarryLog_NANDDriver)nandDriver;
- (NSMutableDictionary)statsDictDict;
- (StatsMagezine)initWithNandDriver:(id)a3;
- (float)_getStatsVal:(int64_t)a3 :(int64_t)a4;
- (float)_getStatsVal:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(int64_t)a6;
- (float)getStatsDelta:(int64_t)a3 :(unsigned int)a4;
- (float)getStatsDeltaForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(unsigned int)a6;
- (void)_lazyLoadStatsDict:(unsigned int)a3;
- (void)setNandDriver:(id)a3;
- (void)setStatsDictDict:(id)a3;
@end

@implementation StatsMagezine

- (StatsMagezine)initWithNandDriver:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)StatsMagezine;
  v6 = [(StatsMagezine *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    statsDictDict = v6->_statsDictDict;
    v6->_statsDictDict = v7;

    objc_storeStrong((id *)&v6->_nandDriver, a3);
    v9 = v6;
  }

  return v6;
}

- (void)_lazyLoadStatsDict:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(StatsMagezine *)self statsDictDict];
  v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    id v11 = [(StatsMagezine *)self nandDriver];
    v8 = [v11 nandStats_get_hoursAgo:v3];
    v9 = [(StatsMagezine *)self statsDictDict];
    v10 = +[NSNumber numberWithUnsignedInt:v3];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
}

- (float)_getStatsVal:(int64_t)a3 :(int64_t)a4
{
  [(StatsMagezine *)self _lazyLoadStatsDict:a4];
  v7 = [(StatsMagezine *)self statsDictDict];
  v8 = +[NSNumber numberWithInteger:a4];
  v9 = [v7 objectForKeyedSubscript:v8];
  v10 = +[NSNumber numberWithInteger:a3];
  id v11 = [v9 objectForKeyedSubscript:v10];

  objc_opt_class();
  float v12 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v11 floatValue];
    float v12 = v13;
  }

  return v12;
}

- (float)_getStatsVal:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(int64_t)a6
{
  [(StatsMagezine *)self _lazyLoadStatsDict:a6];
  id v11 = [(StatsMagezine *)self statsDictDict];
  float v12 = +[NSNumber numberWithInteger:a6];
  float v13 = [v11 objectForKeyedSubscript:v12];
  v14 = +[NSNumber numberWithInteger:a3];
  v15 = [v13 objectForKeyedSubscript:v14];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  float v17 = 0.0;
  if (a4 <= a5 && (isKindOfClass & 1) != 0)
  {
    v18 = 0;
    while (1)
    {
      v19 = v18;
      v18 = [v15 objectAtIndexedSubscript:a4];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v18 floatValue];
      float v17 = v17 + v20;
      if (++a4 > a5) {
        goto LABEL_8;
      }
    }
    float v17 = 0.0;
LABEL_8:
  }
  return v17;
}

- (float)getStatsDelta:(int64_t)a3 :(unsigned int)a4
{
  [(StatsMagezine *)self _getStatsVal:a3 :0];
  float v8 = v7;
  if (a4)
  {
    [(StatsMagezine *)self _getStatsVal:a3 :a4];
    return v8 - v9;
  }
  return v8;
}

- (float)getStatsDeltaForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 :(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(StatsMagezine *)self _getStatsVal:a3 startIdx:*(void *)&a4 endIdx:*(void *)&a5 :0];
  float v12 = v11;
  if (a6)
  {
    [(StatsMagezine *)self _getStatsVal:a3 startIdx:v8 endIdx:v7 :a6];
    return v12 - v13;
  }
  return v12;
}

- (BOOL)doesStatIdExistOnDevice:(int64_t)a3 timeAgo:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(StatsMagezine *)self _lazyLoadStatsDict:*(void *)&a4];
  uint64_t v7 = [(StatsMagezine *)self statsDictDict];
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:v4];
  float v9 = [v7 objectForKeyedSubscript:v8];
  v10 = +[NSNumber numberWithInteger:a3];
  float v11 = [v9 objectForKeyedSubscript:v10];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)doesStatIdExistOnDeviceForArr:(int64_t)a3 startIdx:(unsigned int)a4 endIdx:(unsigned int)a5 timeAgo:(unsigned int)a6
{
  if (a4 <= a5)
  {
    uint64_t v8 = *(void *)&a6;
    [(StatsMagezine *)self _lazyLoadStatsDict:*(void *)&a6];
    float v12 = [(StatsMagezine *)self statsDictDict];
    float v13 = +[NSNumber numberWithUnsignedInt:v8];
    v14 = [v12 objectForKeyedSubscript:v13];
    v15 = +[NSNumber numberWithInteger:a3];
    uint64_t v7 = [v14 objectForKeyedSubscript:v15];

    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v7 count] > a5;
  }
  else
  {
    BOOL v6 = 0;
    uint64_t v7 = 0;
  }

  return v6;
}

- (NSMutableDictionary)statsDictDict
{
  return self->_statsDictDict;
}

- (void)setStatsDictDict:(id)a3
{
}

- (CarryLog_NANDDriver)nandDriver
{
  return self->_nandDriver;
}

- (void)setNandDriver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nandDriver, 0);

  objc_storeStrong((id *)&self->_statsDictDict, 0);
}

@end