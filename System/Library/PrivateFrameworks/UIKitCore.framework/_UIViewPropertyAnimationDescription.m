@interface _UIViewPropertyAnimationDescription
- (NSMutableDictionary)updates;
- (UIView)view;
- (_UIViewPropertyAnimationDescription)init;
- (_UIViewPropertyAnimationDescription)initWithView:(id)a3;
- (void)_addUpdate:(id)a3;
@end

@implementation _UIViewPropertyAnimationDescription

- (_UIViewPropertyAnimationDescription)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[_UIViewPropertyAnimationDescription init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (_UIViewPropertyAnimationDescription)initWithView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIViewPropertyAnimationDescription;
  v5 = [(_UIViewPropertyAnimationDescription *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    updates = v6->_updates;
    v6->_updates = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (void)_addUpdate:(id)a3
{
  id v4 = a3;
  updates = self->_updates;
  id v10 = v4;
  v6 = [v4 propertyName];
  uint64_t v7 = [(NSMutableDictionary *)updates objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v8 = self->_updates;
    v9 = [v10 propertyName];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  [v7 addObject:v10];
}

- (NSMutableDictionary)updates
{
  return self->_updates;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end