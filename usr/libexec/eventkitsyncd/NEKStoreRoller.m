@interface NEKStoreRoller
- (NEKStoreRoller)initWithEventStore:(id)a3 cause:(id)a4;
- (id)fetch:(id)a3;
- (id)someStore;
- (void)_bump;
@end

@implementation NEKStoreRoller

- (NEKStoreRoller)initWithEventStore:(id)a3 cause:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NEKStoreRoller;
  v9 = [(NEKStoreRoller *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_counter = 49;
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_cause, a4);
    lastStore = v10->_lastStore;
    v10->_lastStore = 0;
  }
  return v10;
}

- (void)_bump
{
  int64_t v2 = self->_counter + 1;
  self->_counter = v2;
  if (v2 == 50)
  {
    self->_counter = 0;
    lastStore = self->_lastStore;
    self->_lastStore = 0;

    self->_lastStore = [(NEKStore *)self->_eventStore freshEventStoreFor:self->_cause];
    _objc_release_x1();
  }
}

- (id)fetch:(id)a3
{
  id v4 = a3;
  [(NEKStoreRoller *)self _bump];
  v5 = [(EKEventStore *)self->_lastStore publicObjectWithObjectID:v4];

  return v5;
}

- (id)someStore
{
  [(NEKStoreRoller *)self _bump];
  lastStore = self->_lastStore;

  return lastStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStore, 0);
  objc_storeStrong((id *)&self->_cause, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end