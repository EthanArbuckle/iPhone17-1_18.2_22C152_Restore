@interface BIHistogram
- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4;
- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4 histogramValues:(id)a5;
- (BOOL)insertValue:(id)a3 error:(id *)a4;
- (BOOL)insertValue:(id)a3 thisManyTimes:(id)a4 error:(id *)a5;
- (id)copyHistogram;
- (id)copyHistogramWithNormalizedCounts;
- (unsigned)getTotalCount;
- (void)printHistogram;
- (void)removeValue:(id)a3;
- (void)reset;
@end

@implementation BIHistogram

- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4
{
  return [(BIHistogram *)self initWithBinLabelGenerator:a3 allLabels:a4 histogramValues:0];
}

- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4 histogramValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)BIHistogram;
  v11 = [(BIHistogram *)&v54 init];
  if (!v11)
  {
    BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v25) {
      sub_10001EF98(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_17;
  }
  uint64_t v12 = sub_100016A74("bihistogram");
  v13 = (void *)*((void *)v11 + 4);
  *((void *)v11 + 4) = v12;

  if (!v8)
  {
    if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR)) {
      sub_1000200B4();
    }
    goto LABEL_17;
  }
  v11[6] = 0;
  if (v10)
  {
    id v45 = v9;
    id v14 = [v10 mutableCopy];
    v15 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v14;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v16 = *((id *)v11 + 1);
    id v17 = [v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          v22 = [*((id *)v11 + 1) objectForKeyedSubscript:v21];
          unsigned int v23 = [v22 unsignedIntValue];

          if ((v11[6] + (unint64_t)v23) >> 32)
          {
            if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR)) {
              sub_10002011C();
            }

            v33 = 0;
            id v9 = v45;
            goto LABEL_30;
          }
          v24 = [*((id *)v11 + 1) objectForKeyedSubscript:v21];
          v11[6] += [v24 unsignedIntValue];
        }
        id v18 = [v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v9 = v45;
    goto LABEL_22;
  }
  id v34 = objc_alloc_init((Class)NSMutableDictionary);
  v35 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v34;

  if (!*((void *)v11 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR)) {
      sub_1000200E8();
    }
LABEL_17:
    v33 = 0;
    goto LABEL_30;
  }
LABEL_22:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v37 = v9;
  id v38 = [v37 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        [*((id *)v11 + 1) setObject:&off_100033940 forKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
      }
      id v39 = [v37 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v39);
  }

  id v42 = [v8 copy];
  v43 = (void *)*((void *)v11 + 2);
  *((void *)v11 + 2) = v42;

  v33 = v11;
LABEL_30:

  return v33;
}

- (BOOL)insertValue:(id)a3 error:(id *)a4
{
  return [(BIHistogram *)self insertValue:a3 thisManyTimes:&off_100033958 error:a4];
}

- (BOOL)insertValue:(id)a3 thisManyTimes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [v9 unsignedIntValue];
  if (!v10) {
    goto LABEL_9;
  }
  unsigned int v11 = v10;
  if (!__CFADD__(self->_totalCount, v10))
  {
    v15 = (*((void (**)(void))self->_labelGen + 2))();
    id v16 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v15];
    id v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 unsignedIntValue] + v11);

    [(NSMutableDictionary *)self->_histogram setObject:v17 forKeyedSubscript:v15];
    self->_totalCount += v11;

LABEL_9:
    BOOL v13 = 1;
    goto LABEL_10;
  }
  if (a5)
  {
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"Histogram count reached max capacity.                                             Normalized histogram will be unreliable";
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:34 userInfo:v12];
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_100020150();
  }
  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (void)removeValue:(id)a3
{
  id v4 = a3;
  v6 = (*((void (**)(void))self->_labelGen + 2))();
  uint64_t v7 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v6];
    if (v9)
    {
      unsigned int v10 = (void *)v9;
      unsigned int v11 = [(NSMutableDictionary *)self->_histogram objectForKeyedSubscript:v6];
      unsigned int v12 = [v11 unsignedIntValue];

      if (!v12) {
        goto LABEL_4;
      }
    }
    else
    {

      unsigned int v12 = 0;
    }
    v15 = +[NSNumber numberWithUnsignedInt:v12 - 1];
    [(NSMutableDictionary *)self->_histogram setObject:v15 forKeyedSubscript:v6];
    --self->_totalCount;

    goto LABEL_8;
  }
LABEL_4:
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    unsigned int totalCount = self->_totalCount;
    int v16 = 138413058;
    id v17 = v4;
    __int16 v18 = 2112;
    NSErrorUserInfoKey v19 = v6;
    __int16 v20 = 1024;
    int v21 = 0;
    __int16 v22 = 1024;
    unsigned int v23 = totalCount;
    _os_log_error_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_ERROR, "Can't remove Value %@ Label %@ Count %u TotalCount %u", (uint8_t *)&v16, 0x22u);
  }
LABEL_8:
}

- (id)copyHistogram
{
  return [(NSMutableDictionary *)self->_histogram copy];
}

- (id)copyHistogramWithNormalizedCounts
{
  id v3 = [(NSMutableDictionary *)self->_histogram mutableCopy];
  if (self->_totalCount)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [v3 allKeys];
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          unsigned int v10 = [v3 objectForKeyedSubscript:v9];
          [v10 floatValue];
          *(float *)&double v12 = v11 / (float)self->_totalCount;
          BOOL v13 = +[NSNumber numberWithFloat:v12];
          [v3 setObject:v13 forKeyedSubscript:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
  {
    sub_100020184();
  }
  return v3;
}

- (void)printHistogram
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = self->_histogram;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          histogram = self->_histogram;
          float v11 = logger;
          double v12 = [(NSMutableDictionary *)histogram objectForKeyedSubscript:v9];
          unsigned int v13 = [v12 unsignedIntValue];
          *(_DWORD *)buf = 138412546;
          uint64_t v19 = v9;
          __int16 v20 = 1024;
          unsigned int v21 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Bin %@ Value %u", buf, 0x12u);
        }
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

- (unsigned)getTotalCount
{
  return self->_totalCount;
}

- (void)reset
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->_histogram allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMutableDictionary *)self->_histogram setObject:&off_100033940 forKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_unsigned int totalCount = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_labelGen, 0);

  objc_storeStrong((id *)&self->_histogram, 0);
}

@end