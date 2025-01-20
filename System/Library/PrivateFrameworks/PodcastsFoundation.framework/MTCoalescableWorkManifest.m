@interface MTCoalescableWorkManifest
- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completion:(id)a4;
- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completions:(id)a4;
- (NSArray)completions;
- (id)description;
- (id)manifestByReplacingWorkBlock:(id)a3 appendingCompletion:(id)a4;
- (id)workBlock;
- (void)setCompletions:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation MTCoalescableWorkManifest

- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completion:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = _Block_copy(a4);
  v9 = objc_msgSend(v6, "arrayWithObjects:", v8, 0);
  v10 = [(MTCoalescableWorkManifest *)self initWithWorkBlock:v7 completions:v9];

  return v10;
}

- (MTCoalescableWorkManifest)initWithWorkBlock:(id)a3 completions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTCoalescableWorkManifest;
  v8 = [(MTCoalescableWorkManifest *)&v13 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id workBlock = v8->_workBlock;
    v8->_id workBlock = v9;

    if (v7) {
      v11 = v7;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v8->_completions, v11);
  }

  return v8;
}

- (id)workBlock
{
  return self->_workBlock;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

- (id)manifestByReplacingWorkBlock:(id)a3 appendingCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MTCoalescableWorkManifest *)self completions];
  v9 = (void *)[v8 mutableCopy];

  if (v6)
  {
    v10 = _Block_copy(v6);
    [v9 addObject:v10];
  }
  v11 = [[MTCoalescableWorkManifest alloc] initWithWorkBlock:v7 completions:v9];

  return v11;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTCoalescableWorkManifest;
  v4 = [(MTCoalescableWorkManifest *)&v8 description];
  v5 = [(MTCoalescableWorkManifest *)self completions];
  id v6 = [v3 stringWithFormat:@"%@: completions.count = %d", v4, objc_msgSend(v5, "count")];

  return v6;
}

- (void)setWorkBlock:(id)a3
{
}

- (void)setCompletions:(id)a3
{
}

@end