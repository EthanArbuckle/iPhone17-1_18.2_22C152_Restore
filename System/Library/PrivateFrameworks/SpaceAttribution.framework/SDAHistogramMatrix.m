@interface SDAHistogramMatrix
- (NSMutableDictionary)histogram;
- (SDAHistogramMatrix)init;
- (void)enumerateBundleHistogram:(id)a3;
- (void)print;
- (void)setHistogram:(id)a3;
- (void)upsertBundleID:(id)a3 volType:(int)a4 urgency:(int)a5 state:(int)a6 residency:(int)a7 age:(unint64_t)a8 size:(unint64_t)a9;
@end

@implementation SDAHistogramMatrix

- (SDAHistogramMatrix)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDAHistogramMatrix;
  v2 = [(SDAHistogramMatrix *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionaryWithCapacity:50];
    [(SDAHistogramMatrix *)v2 setHistogram:v3];
  }
  return v2;
}

- (void)enumerateBundleHistogram:(id)a3
{
  id v4 = a3;
  histogram = self->_histogram;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F120;
  v7[3] = &unk_10004D060;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)histogram enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)print
{
  v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Histogram Begin:", buf, 2u);
  }

  *(void *)buf = 0;
  id v8 = buf;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F6D8;
  v6[3] = &unk_10004D088;
  v6[4] = buf;
  [(SDAHistogramMatrix *)self enumerateBundleHistogram:v6];
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((void *)v8 + 3);
    *(_DWORD *)v11 = 134217984;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Histogram End (%zu).", v11, 0xCu);
  }

  _Block_object_dispose(buf, 8);
}

- (void)upsertBundleID:(id)a3 volType:(int)a4 urgency:(int)a5 state:(int)a6 residency:(int)a7 age:(unint64_t)a8 size:(unint64_t)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  id v17 = a3;
  v15 = -[NSMutableDictionary objectForKey:](self->_histogram, "objectForKey:");
  if (v15)
  {
    id v16 = v15;
    [v15 updateVolType:v13 residency:v10 urgency:v12 state:v11 age:a8 size:a9];
  }
  else
  {
    id v16 = +[SDAPerBundleHistogram newWithVolType:v13 residency:v10 urgency:v12 state:v11 age:a8 size:a9];
    [(NSMutableDictionary *)self->_histogram setObject:v16 forKey:v17];
  }
}

- (NSMutableDictionary)histogram
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHistogram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end