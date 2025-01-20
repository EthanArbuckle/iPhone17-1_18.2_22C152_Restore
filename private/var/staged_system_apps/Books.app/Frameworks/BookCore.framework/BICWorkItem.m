@interface BICWorkItem
+ (id)workItemWithPriority:(id)a3 description:(id)a4 block:(id)a5;
- (BICWorkPriorizing)prioritizer;
- (NSString)workDescription;
- (id)description;
- (id)workBlock;
- (int64_t)compare:(id)a3;
- (unint64_t)priority;
- (void)performWork:(id)a3;
- (void)setPrioritizer:(id)a3;
- (void)setWorkBlock:(id)a3;
- (void)setWorkDescription:(id)a3;
@end

@implementation BICWorkItem

+ (id)workItemWithPriority:(id)a3 description:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  id v12 = [v8 copy];

  [v11 setWorkBlock:v12];
  [v11 setPrioritizer:v10];

  [v11 setWorkDescription:v9];

  return v11;
}

- (unint64_t)priority
{
  v2 = [(BICWorkItem *)self prioritizer];
  id v3 = [v2 priority];

  return (unint64_t)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BICWorkItem *)self priority];
  id v6 = [v4 priority];

  if (v5 < (unint64_t)v6) {
    return -1;
  }
  else {
    return v5 > (unint64_t)v6;
  }
}

- (void)performWork:(id)a3
{
  id v6 = a3;
  unint64_t v5 = [(BICWorkItem *)self workBlock];
  ((void (**)(void, id, BICWorkItem *))v5)[2](v5, v6, self);
}

- (id)description
{
  id v3 = [(BICWorkItem *)self workDescription];
  id v4 = +[NSString stringWithFormat:@"<BICWorkItem %p \"%@\" pri=%lu>", self, v3, [(BICWorkItem *)self priority]];

  return v4;
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
}

- (BICWorkPriorizing)prioritizer
{
  return self->_prioritizer;
}

- (void)setPrioritizer:(id)a3
{
}

- (NSString)workDescription
{
  return self->_workDescription;
}

- (void)setWorkDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workDescription, 0);
  objc_storeStrong((id *)&self->_prioritizer, 0);

  objc_storeStrong(&self->_workBlock, 0);
}

@end