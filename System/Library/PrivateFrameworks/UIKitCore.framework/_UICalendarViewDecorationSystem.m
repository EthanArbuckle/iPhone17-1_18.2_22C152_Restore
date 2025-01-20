@interface _UICalendarViewDecorationSystem
- (NSMutableDictionary)decorationViewFeed;
- (_UICalendarViewDecorationSystem)init;
- (void)_prepareDecorationFeedForKey:(id)a3;
- (void)configureDecoration:(id)a3;
- (void)invalidateDecoration:(id)a3;
- (void)reset;
- (void)setDecorationViewFeed:(id)a3;
@end

@implementation _UICalendarViewDecorationSystem

- (_UICalendarViewDecorationSystem)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UICalendarViewDecorationSystem;
  v2 = [(_UICalendarViewDecorationSystem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    decorationViewFeed = v2->_decorationViewFeed;
    v2->_decorationViewFeed = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)configureDecoration:(id)a3
{
  id v11 = a3;
  v4 = [v11 _decorationViewReusableKey];
  v5 = [v11 _decorationView];
  if (!v5 && v4)
  {
    objc_super v6 = [(NSMutableDictionary *)self->_decorationViewFeed objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v8 = [(NSMutableDictionary *)self->_decorationViewFeed objectForKey:v4];
      v5 = [v8 lastObject];

      v9 = [(NSMutableDictionary *)self->_decorationViewFeed objectForKey:v4];
      [v9 removeLastObject];
    }
    else
    {
      v5 = 0;
    }
  }
  v10 = [v11 _decorationViewForReuseView:v5];
  [v11 _setDecorationView:v10];
}

- (void)invalidateDecoration:(id)a3
{
  id v8 = a3;
  v4 = [v8 _decorationView];
  [v4 removeFromSuperview];
  v5 = [v8 _decorationViewReusableKey];
  if (v5)
  {
    [(_UICalendarViewDecorationSystem *)self _prepareDecorationFeedForKey:v5];
    objc_super v6 = [(_UICalendarViewDecorationSystem *)self decorationViewFeed];
    uint64_t v7 = [v6 objectForKey:v5];
    [v7 addObject:v4];
  }
  [v8 _setDecorationView:0];
}

- (void)reset
{
}

- (void)_prepareDecorationFeedForKey:(id)a3
{
  id v6 = a3;
  v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_decorationViewFeed, "objectForKeyedSubscript:");

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_decorationViewFeed setObject:v5 forKeyedSubscript:v6];
  }
}

- (NSMutableDictionary)decorationViewFeed
{
  return self->_decorationViewFeed;
}

- (void)setDecorationViewFeed:(id)a3
{
}

- (void).cxx_destruct
{
}

@end