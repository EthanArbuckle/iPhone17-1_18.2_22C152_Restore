@interface STMSizeCacheEvent
+ (id)eventWithPath:(id)a3 flags:(unsigned int)a4 event:(unint64_t)CurrentEventId;
- (NSString)path;
- (int64_t)eventIDCompare:(id)a3;
- (unint64_t)evtID;
- (unsigned)flags;
- (void)setEvtID:(unint64_t)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setPath:(id)a3;
@end

@implementation STMSizeCacheEvent

+ (id)eventWithPath:(id)a3 flags:(unsigned int)a4 event:(unint64_t)CurrentEventId
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = objc_alloc_init(STMSizeCacheEvent);
  [(STMSizeCacheEvent *)v8 setPath:v7];

  [(STMSizeCacheEvent *)v8 setFlags:v6];
  if (!CurrentEventId) {
    CurrentEventId = FSEventsGetCurrentEventId();
  }
  [(STMSizeCacheEvent *)v8 setEvtID:CurrentEventId];

  return v8;
}

- (int64_t)eventIDCompare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 evtID];
  if (v5 <= [(STMSizeCacheEvent *)self evtID])
  {
    unint64_t v7 = [v4 evtID];
    int64_t v6 = v7 < [(STMSizeCacheEvent *)self evtID];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPath:(id)a3
{
}

- (unint64_t)evtID
{
  return self->_evtID;
}

- (void)setEvtID:(unint64_t)a3
{
  self->_evtID = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
}

@end