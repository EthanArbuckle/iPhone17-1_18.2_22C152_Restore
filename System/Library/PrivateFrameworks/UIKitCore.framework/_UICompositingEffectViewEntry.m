@interface _UICompositingEffectViewEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (NSString)filterType;
- (id)description;
- (void)addEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
- (void)setFilterType:(id)a3;
@end

@implementation _UICompositingEffectViewEntry

- (void)addEffectToView:(id)a3
{
  filterType = self->_filterType;
  id v4 = [a3 layer];
  [v4 setCompositingFilter:filterType];
}

- (void)removeEffectFromView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setCompositingFilter:0];
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICompositingEffectViewEntry;
  if ([(_UIVisualEffectViewEntry *)&v9 isSameTypeOfEffect:v4])
  {
    filterType = self->_filterType;
    v6 = [v4 filterType];
    BOOL v7 = [(NSString *)filterType isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UICompositingEffectViewEntry;
  id v3 = [(_UIVisualEffectViewEntry *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" compositingMode=%@", self->_filterType];

  return v4;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end