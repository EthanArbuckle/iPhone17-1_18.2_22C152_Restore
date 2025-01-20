@interface CLHLocationAwareRequestArchive
- (CLHLocationAwareRequestArchive)initWithClassifier:(id)a3 rootDirectory:(id)a4 basename:(id)a5 requestCode:(int)a6 itemCountThresholdForAutoCleanUp:(int)a7;
- (CLHRequestArchive)homeArchive;
- (CLHRequestArchive)mainArchive;
- (CLHRequestArchive)workArchive;
- (id)jsonObject;
- (int64_t)classifyLoiTypeForLocation:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)eraseAllData;
- (void)pruneSecondaryDataOlderThan:(double)a3;
- (void)writeSecondaryObject:(id)a3 collectedAt:(id)a4 toField:(unsigned int)a5;
@end

@implementation CLHLocationAwareRequestArchive

- (CLHLocationAwareRequestArchive)initWithClassifier:(id)a3 rootDirectory:(id)a4 basename:(id)a5 requestCode:(int)a6 itemCountThresholdForAutoCleanUp:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  v17.receiver = self;
  v17.super_class = (Class)CLHLocationAwareRequestArchive;
  v12 = [(CLHLocationAwareRequestArchive *)&v17 init];
  if (v12)
  {
    v12->_classifier = (CLHLocationClassifier *)a3;
    id v13 = [a4 URLByAppendingPathComponent:[a5 stringByAppendingString:@"-home"]];
    id v14 = [a4 URLByAppendingPathComponent:[a5 stringByAppendingString:@"-work"]];
    id v15 = [a4 URLByAppendingPathComponent:[a5 stringByAppendingString:@"-main"]];
    v12->_homeArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", [v13 path], v8, v7);
    v12->_workArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", [v14 path], v8, v7);
    v12->_mainArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]([CLHRequestArchive alloc], "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:", [v15 path], v8, v7);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHLocationAwareRequestArchive;
  [(CLHLocationAwareRequestArchive *)&v3 dealloc];
}

- (unint64_t)count
{
  unint64_t v3 = [(CLHRequestArchive *)self->_homeArchive totalCountIncludingAllSubArchives];
  v4 = (char *)[(CLHRequestArchive *)self->_workArchive totalCountIncludingAllSubArchives]+ v3;
  return [(CLHRequestArchive *)self->_mainArchive totalCountIncludingAllSubArchives]
       + (void)v4;
}

- (int64_t)classifyLoiTypeForLocation:(id)a3
{
  return [(CLHLocationClassifier *)self->_classifier loiTypeForLocation:a3];
}

- (void)writeSecondaryObject:(id)a3 collectedAt:(id)a4 toField:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int64_t v8 = [(CLHLocationAwareRequestArchive *)self classifyLoiTypeForLocation:a4];
  uint64_t v9 = 32;
  if (v8 == 1) {
    uint64_t v9 = 24;
  }
  if (!v8) {
    uint64_t v9 = 16;
  }
  v10 = *(Class *)((char *)&self->super.isa + v9);

  [v10 writeSecondaryObject:a3 toField:v5];
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  long long v16 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v4 = +[NSArray arrayWithObjects:&v16 count:3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isActiveSubArchive])
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = sub_1012E6934;
          v10[3] = &unk_10231ED90;
          *(double *)&v10[4] = a3;
          [v9 iterateSubArchivesWithHandler:v10];
        }
        else
        {
          [v9 pruneSecondaryDataOlderThan:a3];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)jsonObject
{
  v4[0] = @"homeArchive";
  v5[0] = [(CLHRequestArchive *)self->_homeArchive jsonObject];
  v4[1] = @"workArchive";
  v5[1] = [(CLHRequestArchive *)self->_workArchive jsonObject];
  v4[2] = @"mainArchive";
  v5[2] = [(CLHRequestArchive *)self->_mainArchive jsonObject];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (void)eraseAllData
{
  long long v13 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v2 = +[NSArray arrayWithObjects:&v13 count:3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isActiveSubArchive])
        {
          [v7 iterateSubArchivesWithHandler:&stru_10231EDD0];
          [v7 generateNewSubArchive];
        }
        else
        {
          [v7 eraseAllData];
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (CLHRequestArchive)homeArchive
{
  return self->_homeArchive;
}

- (CLHRequestArchive)workArchive
{
  return self->_workArchive;
}

- (CLHRequestArchive)mainArchive
{
  return self->_mainArchive;
}

@end