@interface SAPurgeableRecords
+ (id)newWithActivity:(id)a3 withRunMode:(unint64_t)a4;
- (NSDictionary)SUPurgeableUrgencyData;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (SAActivity)activity;
- (SAPurgeableRecords)initWithActivity:(id)a3 withRunMode:(unint64_t)a4;
- (unint64_t)mode;
- (unsigned)waitForProcessingSUPurgeableUrgencyFiles;
- (void)asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:(id)a3 andDirKeyCacheList:(id)a4;
- (void)processAttributionTagsPurgeableWithReply:(id)a3;
- (void)setActivity:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSUPurgeableUrgencyData:(id)a3;
@end

@implementation SAPurgeableRecords

- (SAPurgeableRecords)initWithActivity:(id)a3 withRunMode:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAPurgeableRecords;
  v8 = [(SAPurgeableRecords *)&v14 init];
  if (v8)
  {
    dispatch_group_t v9 = dispatch_group_create();
    group = v8->_group;
    v8->_group = (OS_dispatch_group *)v9;

    uint64_t v11 = dispatch_get_global_queue(2, 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v8->_activity, a3);
    v8->_mode = a4;
  }

  return v8;
}

+ (id)newWithActivity:(id)a3 withRunMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithActivity:v6 withRunMode:a4];

  return v7;
}

- (void)asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:(id)a3 andDirKeyCacheList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  group = self->_group;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022248;
  block[3] = &unk_10004D1F0;
  id v13 = v7;
  objc_super v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_group_async(group, queue, block);
}

- (unsigned)waitForProcessingSUPurgeableUrgencyFiles
{
  v3 = +[SAAppSizerScan appSizerScan];
  unint64_t mode = self->_mode;
  if (mode == 2)
  {
    group = self->_group;
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    dispatch_group_wait(group, v11);
LABEL_8:
    unsigned __int8 v12 = 0;
  }
  else if (mode == 1)
  {
    while (1)
    {
      v5 = self->_group;
      dispatch_time_t v6 = dispatch_time(0, 2000000000);
      intptr_t v7 = dispatch_group_wait(v5, v6);
      v8 = [(SAPurgeableRecords *)self activity];
      unsigned int v9 = [v8 shouldDefer];

      if (v9) {
        break;
      }
      if ([v3 runMode] == (id)2)
      {
        objc_super v14 = SALog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315138;
          v20 = "-[SAPurgeableRecords waitForProcessingSUPurgeableUrgencyFiles]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Activity interrupted, stopping", (uint8_t *)&v19, 0xCu);
        }
        unsigned __int8 v12 = 4;
        goto LABEL_18;
      }
      if (!v7) {
        goto LABEL_8;
      }
    }
    objc_super v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[SAPurgeableRecords waitForProcessingSUPurgeableUrgencyFiles]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Activity should defer, stopping", (uint8_t *)&v19, 0xCu);
    }
    unsigned __int8 v12 = 2;
LABEL_18:

    id v15 = [(SAPurgeableRecords *)self activity];
    [v15 setShouldStop:1];

    v16 = self->_group;
    dispatch_time_t v17 = dispatch_time(0, 60000000000);
    dispatch_group_wait(v16, v17);
  }
  else
  {
    id v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100032918(v3, v13);
    }

    unsigned __int8 v12 = 3;
  }

  return v12;
}

- (void)processAttributionTagsPurgeableWithReply:(id)a3
{
  id v33 = a3;
  v41 = +[SAAppSizerScan appSizerScan];
  uint64_t v32 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v34 = [&off_10004FD48 countByEnumeratingWithState:&v49 objects:v63 count:16];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if (v34)
  {
    uint64_t v35 = *(void *)v50;
    *(void *)&long long v3 = 67109634;
    long long v31 = v3;
    while (1)
    {
      uint64_t v6 = 0;
LABEL_4:
      if (*(void *)v50 != v35) {
        objc_enumerationMutation(&off_10004FD48);
      }
      intptr_t v7 = *(void **)(*((void *)&v49 + 1) + 8 * v6);
      v8 = SALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SAPurgeableRecords processAttributionTagsPurgeableWithReply:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s for %@", buf, 0x16u);
      }

      v48.__darwin_time_t tv_sec = 0;
      *(void *)&v48.uint64_t tv_usec = 0;
      v47.__darwin_time_t tv_sec = 0;
      *(void *)&v47.uint64_t tv_usec = 0;
      unsigned int v9 = objc_opt_new();
      v40 = (char *)[v7 fileSystemRepresentation];
      id v10 = (char *)malloc_type_malloc(0x8000uLL, 0x1000040FA0F61DDuLL);
      if (!v10) {
        break;
      }
      uint64_t v36 = v6;
      v37 = v10;
      long long v60 = 0u;
      long long v61 = 0u;
      *(void *)&buf[8] = 0;
      v62 = v10;
      v38 = (uint64_t *)(v10 + 56);
      *(void *)&buf[16] = 512;
      *(void *)buf = 10;
      while (1)
      {
        gettimeofday(&v48, 0);
        if ([v41 shouldDefer:self->_mode activity:self->_activity])
        {
          free(v37);
          goto LABEL_30;
        }
        int v12 = fsctl(v40, 0xC0404A83uLL, buf, 0);
        if (v12) {
          break;
        }
        uint64_t v46 = v4;
        gettimeofday(&v47, 0);
        __darwin_time_t tv_sec = v48.tv_sec;
        __darwin_time_t v43 = v47.tv_sec;
        unint64_t v13 = *((void *)&v61 + 1);
        uint64_t tv_usec = v48.tv_usec;
        uint64_t v45 = v47.tv_usec;
        if (*((void *)&v61 + 1))
        {
          unint64_t v14 = 0;
          id v15 = v38;
          do
          {
            uint64_t v16 = *v15;
            if (*v15 && (*((unsigned char *)v15 - 47) & 0xC0) == 0)
            {
              dispatch_time_t v17 = (char *)*(v15 - 1);
              v18 = +[NSNumber numberWithUnsignedLongLong:*v15];
              int v19 = [v9 objectForKeyedSubscript:v18];

              if (v19) {
                v20 = &v17[(void)[v19 unsignedLongLongValue]];
              }
              else {
                v20 = v17;
              }
              v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v20, v31);
              v22 = +[NSNumber numberWithUnsignedLongLong:v16];
              [v9 setObject:v21 forKeyedSubscript:v22];

              unint64_t v13 = *((void *)&v61 + 1);
            }
            ++v14;
            v15 += 8;
          }
          while (v13 > v14);
        }
        uint64_t v4 = v46 - tv_usec + v45 + 1000000 * (v43 - tv_sec);
        v5 += v13;
        if (!(void)v61) {
          goto LABEL_26;
        }
      }
      int v23 = v12;
      v24 = SALog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = *__error();
        v26 = __error();
        v27 = strerror(*v26);
        *(_DWORD *)v53 = v31;
        int v54 = v23;
        __int16 v55 = 1024;
        int v56 = v25;
        __int16 v57 = 2080;
        v58 = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "err %d, errno %d %s", v53, 0x18u);
      }

LABEL_26:
      free(v37);

      uint64_t v6 = v36 + 1;
      if ((id)(v36 + 1) != v34) {
        goto LABEL_4;
      }
      id v34 = [&off_10004FD48 countByEnumeratingWithState:&v49 objects:v63 count:16];
      if (!v34) {
        goto LABEL_28;
      }
    }
    v30 = SALog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100032898(v30);
    }

LABEL_30:
    v29 = (void *)v32;
    v28 = v33;
  }
  else
  {
LABEL_28:
    v29 = (void *)v32;
    v28 = v33;
    (*((void (**)(id, uint64_t, uint64_t, uint64_t))v33 + 2))(v33, v32, v4, v5);
  }
}

- (NSDictionary)SUPurgeableUrgencyData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSUPurgeableUrgencyData:(id)a3
{
}

- (SAActivity)activity
{
  return (SAActivity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivity:(id)a3
{
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_SUPurgeableUrgencyData, 0);
}

@end