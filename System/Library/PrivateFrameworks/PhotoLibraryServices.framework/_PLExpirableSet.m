@interface _PLExpirableSet
- (BOOL)_didExpireObject:(id)a3;
- (BOOL)containsObject:(id)a3;
- (_PLExpirableSet)initWithSecondsToExpire:(double)a3;
- (void)_touch:(id)a3;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)removeObject:(id)a3;
@end

@implementation _PLExpirableSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTouches, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_set removeObject:v5];
  [(NSMutableDictionary *)v4->_recentTouches removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)addObject:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableSet *)v4->_set addObject:v5];
  [(_PLExpirableSet *)v4 _touch:v5];
  objc_sync_exit(v4);
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(_PLExpirableSet *)v5 _didExpireObject:v4])
  {
    [(_PLExpirableSet *)v5 removeObject:v4];
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_6;
  }
  if (![(NSMutableSet *)v5->_set containsObject:v4]) {
    goto LABEL_5;
  }
  [(_PLExpirableSet *)v5 _touch:v4];
  BOOL v6 = 1;
LABEL_6:
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)_didExpireObject:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_recentTouches objectForKeyedSubscript:a3];
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 dateByAddingTimeInterval:self->_secondsToExpire];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    BOOL v8 = [v7 compare:v6] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_touch:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(NSMutableDictionary *)self->_recentTouches setObject:v6 forKeyedSubscript:v5];
}

- (_PLExpirableSet)initWithSecondsToExpire:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_PLExpirableSet;
  id v4 = [(_PLExpirableSet *)&v11 init];
  id v5 = v4;
  if (v4)
  {
    v4->_secondsToExpire = a3;
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recentTouches = v5->_recentTouches;
    v5->_recentTouches = v6;

    BOOL v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    set = v5->_set;
    v5->_set = v8;
  }
  return v5;
}

- (void)dealloc
{
  set = self->_set;
  self->_set = 0;

  recentTouches = self->_recentTouches;
  self->_recentTouches = 0;

  v5.receiver = self;
  v5.super_class = (Class)_PLExpirableSet;
  [(_PLExpirableSet *)&v5 dealloc];
}

@end