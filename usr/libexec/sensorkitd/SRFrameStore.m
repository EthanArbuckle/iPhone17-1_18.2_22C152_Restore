@interface SRFrameStore
+ (void)initialize;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation SRFrameStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EC78 = (uint64_t)os_log_create("com.apple.SensorKit", "FrameStore");
  }
}

- (void)dealloc
{
  if (self)
  {
    header = self->_header;
    if (header && (start = (char *)header->_start) != 0)
    {
      uint64_t v5 = *(void *)(start + 4);
    }
    else
    {
      frames = self->_frames;
      if (frames) {
        uint64_t v5 = (char *)frames->_currentPosition - (char *)frames->_start + 56;
      }
      else {
        uint64_t v5 = 56;
      }
    }
    v7 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      Property = (NSString *)objc_getProperty(self, v8, 56, 1);
LABEL_9:
      *(_DWORD *)buf = 138543362;
      v17 = sub_1000410D8(Property);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Tearing down frame store for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v7 = qword_10006EC78;
    uint64_t v5 = 0;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      Property = 0;
      goto LABEL_9;
    }
  }

  self->_header = 0;
  self->_frames = 0;
  if (self->_permission == 1)
  {
    v11 = qword_10006EC78;
    if (os_log_type_enabled((os_log_t)qword_10006EC78, OS_LOG_TYPE_INFO))
    {
      v13 = (NSString *)objc_getProperty(self, v12, 56, 1);
      v14 = sub_1000410D8(v13);
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      __int16 v18 = 2050;
      uint64_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finalizing %{public}@ to %{public}llu bytes", buf, 0x16u);
    }
    sub_100041A80((uint64_t)self, v5);
  }
  objc_setProperty_atomic(self, v10, 0, 56);

  self->_segmentName = 0;
  v15.receiver = self;
  v15.super_class = (Class)SRFrameStore;
  [(SRFrameStore *)&v15 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  frames = self->_frames;
  if (frames)
  {
    unint64_t v10 = 0;
    var0 = (unsigned int *)((char *)frames->_start + a3->var0);
    while (var0 < frames->_currentPosition && v10 < a5)
    {
      if (sub_100041E2C((uint64_t)self, (uint64_t)var0)) {
        a4[v10++] = var0;
      }
      var0 = (unsigned int *)((char *)var0 + var0[4] + 20);
      frames = self->_frames;
      if (!frames) {
        goto LABEL_12;
      }
    }
    frames = (SRMemoryMapping *)frames->_start;
  }
  else
  {
    unint64_t v10 = 0;
    var0 = (unsigned int *)a3->var0;
  }
LABEL_12:
  a3->var0 = (char *)var0 - (char *)frames;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  return v10;
}

@end