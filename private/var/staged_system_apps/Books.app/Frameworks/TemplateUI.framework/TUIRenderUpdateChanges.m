@interface TUIRenderUpdateChanges
- (NSSet)deletes;
- (NSSet)inserts;
- (NSSet)updates;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDeletes:(id)a3;
- (void)setInserts:(id)a3;
- (void)setUpdates:(id)a3;
- (void)unionChanges:(id)a3;
- (void)unionInserts:(id)a3;
@end

@implementation TUIRenderUpdateChanges

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TUIRenderUpdateChanges allocWithZone:a3] init];
  if (v4)
  {
    v5 = (NSSet *)[(NSSet *)self->_inserts copy];
    inserts = v4->_inserts;
    v4->_inserts = v5;

    v7 = (NSSet *)[(NSSet *)self->_updates copy];
    updates = v4->_updates;
    v4->_updates = v7;

    v9 = (NSSet *)[(NSSet *)self->_deletes copy];
    deletes = v4->_deletes;
    v4->_deletes = v9;
  }
  return v4;
}

- (void)unionChanges:(id)a3
{
  id v4 = a3;
  v5 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  v6 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  v7 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  [(NSSet *)v5 unionSet:self->_inserts];
  v8 = [v4 inserts];
  [(NSSet *)v5 unionSet:v8];

  [(NSSet *)v6 unionSet:self->_updates];
  v9 = [v4 updates];
  [(NSSet *)v6 unionSet:v9];

  [(NSSet *)v7 unionSet:self->_deletes];
  v10 = [v4 deletes];

  [(NSSet *)v7 unionSet:v10];
  inserts = self->_inserts;
  self->_inserts = v5;
  v15 = v5;

  updates = self->_updates;
  self->_updates = v6;
  v13 = v6;

  deletes = self->_deletes;
  self->_deletes = v7;
}

- (void)unionInserts:(id)a3
{
  id v4 = a3;
  v5 = (NSSet *)[objc_alloc((Class)NSMutableSet) initWithArray:v4];

  [(NSSet *)v5 unionSet:self->_inserts];
  inserts = self->_inserts;
  self->_inserts = v5;
}

- (NSSet)inserts
{
  return self->_inserts;
}

- (void)setInserts:(id)a3
{
}

- (NSSet)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (NSSet)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);

  objc_storeStrong((id *)&self->_inserts, 0);
}

@end