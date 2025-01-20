@interface SVXServiceCommandDelayedActionStore
- (SVXServiceCommandDelayedActionStore)init;
- (id)actionForKey:(id)a3;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)setAction:(id)a3 forKey:(id)a4;
@end

@implementation SVXServiceCommandDelayedActionStore

- (void).cxx_destruct
{
}

- (void)removeAllActions
{
}

- (void)removeActionForKey:(id)a3
{
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  actionsByKey = self->_actionsByKey;
  if (a3) {
    [(NSMutableDictionary *)actionsByKey setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)actionsByKey removeObjectForKey:a4];
  }
}

- (id)actionForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_actionsByKey objectForKey:a3];
}

- (SVXServiceCommandDelayedActionStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SVXServiceCommandDelayedActionStore;
  v2 = [(SVXServiceCommandDelayedActionStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    actionsByKey = v2->_actionsByKey;
    v2->_actionsByKey = v3;
  }
  return v2;
}

@end