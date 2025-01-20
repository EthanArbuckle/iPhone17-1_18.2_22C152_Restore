@interface MTUuidQueryObserver
- (NSArray)uuidOrder;
- (NSSet)uuidSet;
- (id)addResultsChangedHandler:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)notifyObservers;
- (void)setUuidOrder:(id)a3;
- (void)setUuidSet:(id)a3;
- (void)startObserving;
@end

@implementation MTUuidQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTUuidQueryObserver;
  v5 = [(MTUuidQueryObserver *)&v7 addResultsChangedHandler:v4];

  return v5;
}

- (void)notifyObservers
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100056FCC;
  v18 = sub_1000572B0;
  id v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100059354;
  v13[3] = &unk_100550B38;
  v13[4] = &v14;
  [(MTUuidQueryObserver *)self results:v13];
  v3 = [(MTUuidQueryObserver *)self uuidOrder];
  id v4 = objc_alloc((Class)NSSet);
  id v5 = [v4 initWithArray:v15[5]];
  v6 = [(MTUuidQueryObserver *)self uuidSet];
  id v7 = [v6 mutableCopy];
  [v7 minusSet:v5];
  id v8 = [v5 mutableCopy];
  [v8 minusSet:v6];
  [(MTUuidQueryObserver *)self setUuidSet:v5];
  [(MTUuidQueryObserver *)self setUuidOrder:v15[5]];
  if ([v7 count]
    || [v8 count]
    || ([v3 isEqual:v15[5]] & 1) == 0)
  {
    v9 = [(MTUuidQueryObserver *)self handlers];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000DA84C;
    v10[3] = &unk_100550B60;
    id v11 = v7;
    id v12 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
  _Block_object_dispose(&v14, 8);
}

- (NSSet)uuidSet
{
  return self->_uuidSet;
}

- (NSArray)uuidOrder
{
  return self->_uuidOrder;
}

- (void)startObserving
{
  v3.receiver = self;
  v3.super_class = (Class)MTUuidQueryObserver;
  [(MTUuidQueryObserver *)&v3 startObserving];
  [(MTUuidQueryObserver *)self notifyObservers];
}

- (void)setUuidSet:(id)a3
{
}

- (void)setUuidOrder:(id)a3
{
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [a3 delegate];

  if (v4)
  {
    [(MTUuidQueryObserver *)self notifyObservers];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOrder, 0);

  objc_storeStrong((id *)&self->_uuidSet, 0);
}

@end