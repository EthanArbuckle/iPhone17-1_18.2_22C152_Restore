@interface NWStatisticsDelegateBlockWrapper
- (id)addedBlock;
- (id)countsBlock;
- (id)descriptionBlock;
- (id)eventsBlock;
- (id)removedBlock;
- (void)setAddedBlock:(id)a3;
- (void)setCountsBlock:(id)a3;
- (void)setDescriptionBlock:(id)a3;
- (void)setEventsBlock:(id)a3;
- (void)setRemovedBlock:(id)a3;
- (void)sourceDidReceiveCounts:(id)a3;
- (void)sourceDidReceiveDescription:(id)a3;
- (void)statisticsManager:(id)a3 didAddSource:(id)a4;
- (void)statisticsManager:(id)a3 didRemoveSource:(id)a4;
@end

@implementation NWStatisticsDelegateBlockWrapper

- (void)sourceDidReceiveDescription:(id)a3
{
  id v10 = a3;
  v4 = [(NWStatisticsDelegateBlockWrapper *)self eventsBlock];

  if (v4)
  {
    v5 = [(NWStatisticsDelegateBlockWrapper *)self eventsBlock];
    ((void (**)(void, id, uint64_t))v5)[2](v5, v10, 1);
  }
  else
  {
    v6 = [(NWStatisticsDelegateBlockWrapper *)self descriptionBlock];

    v7 = v10;
    if (!v6) {
      goto LABEL_6;
    }
    v5 = [v10 currentSnapshot];
    v8 = [v5 traditionalDictionary];
    v9 = [(NWStatisticsDelegateBlockWrapper *)self descriptionBlock];
    ((void (**)(void, void *))v9)[2](v9, v8);
  }
  v7 = v10;
LABEL_6:
}

- (void)sourceDidReceiveCounts:(id)a3
{
  id v10 = a3;
  v4 = [(NWStatisticsDelegateBlockWrapper *)self eventsBlock];

  if (v4)
  {
    v5 = [(NWStatisticsDelegateBlockWrapper *)self eventsBlock];
    ((void (**)(void, id, void))v5)[2](v5, v10, 0);
  }
  else
  {
    v6 = [(NWStatisticsDelegateBlockWrapper *)self countsBlock];

    v7 = v10;
    if (!v6) {
      goto LABEL_6;
    }
    v5 = [v10 currentSnapshot];
    v8 = [v5 traditionalDictionary];
    v9 = [(NWStatisticsDelegateBlockWrapper *)self countsBlock];
    ((void (**)(void, void *))v9)[2](v9, v8);
  }
  v7 = v10;
LABEL_6:
}

- (id)eventsBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)statisticsManager:(id)a3 didAddSource:(id)a4
{
  id v7 = a4;
  v5 = [(NWStatisticsDelegateBlockWrapper *)self addedBlock];

  if (v5)
  {
    v6 = [(NWStatisticsDelegateBlockWrapper *)self addedBlock];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)statisticsManager:(id)a3 didRemoveSource:(id)a4
{
  id v11 = a4;
  v4 = [v11 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v11 delegate];
    uint64_t v7 = [v6 eventsBlock];
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v11, 2);
    }
    else
    {
      uint64_t v9 = [v6 removedBlock];
      id v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t))(v9 + 16))(v9);
      }
    }
    [v11 setDelegate:0];
  }
}

- (id)addedBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAddedBlock:(id)a3
{
}

- (id)countsBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCountsBlock:(id)a3
{
}

- (id)descriptionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDescriptionBlock:(id)a3
{
}

- (id)removedBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRemovedBlock:(id)a3
{
}

- (void)setEventsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventsBlock, 0);
  objc_storeStrong(&self->_removedBlock, 0);
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_countsBlock, 0);
  objc_storeStrong(&self->_addedBlock, 0);
}

@end