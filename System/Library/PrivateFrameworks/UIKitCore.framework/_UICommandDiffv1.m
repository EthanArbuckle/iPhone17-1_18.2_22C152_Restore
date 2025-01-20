@interface _UICommandDiffv1
+ (BOOL)supportsSecureCoding;
+ (id)diffWithChanges:(id)a3;
- (NSOrderedSet)changes;
- (_UICommandDiffv1)initWithChanges:(id)a3;
- (_UICommandDiffv1)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICommandDiffv1

+ (id)diffWithChanges:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithChanges:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandDiffv1)initWithChanges:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICommandDiffv1;
  v5 = [(_UICommandDiffv1 *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    changes = v5->_changes;
    v5->_changes = (NSOrderedSet *)v6;
  }
  return v5;
}

- (_UICommandDiffv1)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICommandDiffv1;
  v5 = [(_UICommandDiffv1 *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"changes"];
    changes = v5->_changes;
    v5->_changes = (NSOrderedSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSOrderedSet)changes
{
  return self->_changes;
}

- (void).cxx_destruct
{
}

@end