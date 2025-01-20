@interface IMCoalescedAction
- (IMCoalescedAction)init;
- (IMCoalescedAction)initWithAction:(id)a3;
- (NSMutableArray)actions;
- (int64_t)count;
- (int64_t)maxCount;
- (void)_performActions;
- (void)_reset;
- (void)addAction:(id)a3;
- (void)dealloc;
- (void)increaseCount;
- (void)setActions:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setMaxCount:(int64_t)a3;
@end

@implementation IMCoalescedAction

- (IMCoalescedAction)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = [(IMCoalescedAction *)self init];
  v6 = v5;
  if (v5) {
    [(IMCoalescedAction *)v5 addAction:v4];
  }

  return v6;
}

- (IMCoalescedAction)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMCoalescedAction;
  v2 = [(IMCoalescedAction *)&v7 init];
  v3 = (IMCoalescedAction *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_2A1D60;
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actions = v3->_actions;
    v3->_actions = v4;
  }
  return v3;
}

- (void)dealloc
{
  [(IMCoalescedAction *)self _performActions];
  v3.receiver = self;
  v3.super_class = (Class)IMCoalescedAction;
  [(IMCoalescedAction *)&v3 dealloc];
}

- (void)increaseCount
{
  [(IMCoalescedAction *)self setCount:(char *)[(IMCoalescedAction *)self count] + 1];
  uint64_t v3 = [(IMCoalescedAction *)self count];
  if (v3 >= [(IMCoalescedAction *)self maxCount])
  {
    [(IMCoalescedAction *)self _performActions];
    [(IMCoalescedAction *)self _reset];
  }
}

- (void)addAction:(id)a3
{
  id v6 = [a3 copy];
  id v4 = [(IMCoalescedAction *)self actions];
  id v5 = objc_retainBlock(v6);
  [v4 addObject:v5];
}

- (void)_performActions
{
  if ([(IMCoalescedAction *)self count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [(IMCoalescedAction *)self actions];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        objc_super v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))();
          objc_super v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_reset
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end