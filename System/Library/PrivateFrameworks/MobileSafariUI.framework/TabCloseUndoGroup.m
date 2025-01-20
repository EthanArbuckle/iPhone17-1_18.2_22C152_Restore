@interface TabCloseUndoGroup
- (NSString)name;
- (TabCloseUndoGroup)initWithName:(id)a3;
- (TabCloseUndoGroup)initWithType:(int64_t)a3;
- (id)_initWithType:(int64_t)a3 name:(id)a4;
- (int64_t)type;
@end

@implementation TabCloseUndoGroup

- (TabCloseUndoGroup)initWithType:(int64_t)a3
{
  return (TabCloseUndoGroup *)[(TabCloseUndoGroup *)self _initWithType:a3 name:0];
}

- (TabCloseUndoGroup)initWithName:(id)a3
{
  return (TabCloseUndoGroup *)[(TabCloseUndoGroup *)self _initWithType:0 name:a3];
}

- (id)_initWithType:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabCloseUndoGroup;
  v7 = [(TabCloseUndoGroup *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end