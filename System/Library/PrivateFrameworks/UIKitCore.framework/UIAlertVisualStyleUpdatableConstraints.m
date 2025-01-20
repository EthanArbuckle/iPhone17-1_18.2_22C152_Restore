@interface UIAlertVisualStyleUpdatableConstraints
- (BOOL)hasUpdatableConstraints;
- (UIAlertVisualStyleUpdatableConstraints)init;
- (id)constraintForKey:(id)a3;
- (void)addConstraint:(id)a3 forKey:(id)a4;
@end

@implementation UIAlertVisualStyleUpdatableConstraints

- (UIAlertVisualStyleUpdatableConstraints)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAlertVisualStyleUpdatableConstraints;
  v2 = [(UIAlertVisualStyleUpdatableConstraints *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    constraintsByKey = v2->_constraintsByKey;
    v2->_constraintsByKey = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (BOOL)hasUpdatableConstraints
{
  return [(NSMutableDictionary *)self->_constraintsByKey count] != 0;
}

- (void)addConstraint:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_constraintsByKey, "setObject:forKeyedSubscript:");
    }
  }
}

- (id)constraintForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_constraintsByKey objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
}

@end