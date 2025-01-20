@interface PSIGroupCache
- (PSIGroupCache)initWithDelegate:(id)a3;
- (unint64_t)idOfGroupWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6;
- (unint64_t)numberOfGroupsChecked;
- (unint64_t)numberOfGroupsQueried;
@end

@implementation PSIGroupCache

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (unint64_t)numberOfGroupsQueried
{
  return self->_numberOfGroupsQueried;
}

- (unint64_t)numberOfGroupsChecked
{
  return self->_numberOfGroupsChecked;
}

- (unint64_t)idOfGroupWithText:(id)a3 identifier:(id)a4 category:(unint64_t)a5 owningGroupId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [[PSICachedGroup alloc] initWithText:v10 identifier:v11 category:a5 owningGroupId:a6];
  v13 = [(NSMutableSet *)self->_groups member:v12];
  v14 = v13;
  ++self->_numberOfGroupsChecked;
  if (v13)
  {
    unint64_t v15 = [v13 groupId];
  }
  else
  {
    [(NSMutableSet *)self->_groups addObject:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v15 = [WeakRetained updateGroupForText:v10 identifier:v11 category:a5 owningGroupId:a6];

    [(PSICachedGroup *)v12 setGroupId:v15];
    ++self->_numberOfGroupsQueried;
  }

  return v15;
}

- (PSIGroupCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSIGroupCache;
  v5 = [(PSIGroupCache *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    groups = v5->_groups;
    v5->_groups = v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

@end