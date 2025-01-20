@interface _UICommandIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)identifierWithAction:(SEL)a3 propertyList:(id)a4;
- (BOOL)isEqual:(id)a3;
- (SEL)action;
- (_UICommandIdentifier)initWithAction:(SEL)a3 propertyList:(id)a4;
- (_UICommandIdentifier)initWithCoder:(id)a3;
- (id)description;
- (id)propertyList;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICommandIdentifier

+ (id)identifierWithAction:(SEL)a3 propertyList:(id)a4
{
  id v5 = a4;
  v6 = [[_UICommandIdentifier alloc] initWithAction:a3 propertyList:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandIdentifier)initWithAction:(SEL)a3 propertyList:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UICommandIdentifier;
  v8 = [(_UICommandIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong(&v8->_propertyList, a4);
  }

  return v9;
}

- (_UICommandIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICommandIdentifier;
  id v5 = [(_UICommandIdentifier *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"action"];
    v5->_action = NSSelectorFromString(v6);

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"propertyList"];
    id propertyList = v5->_propertyList;
    v5->_id propertyList = (id)v14;
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UICommandIdentifier;
  v3 = [(_UICommandIdentifier *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = NSStringFromSelector(self->_action);
  [v4 appendFormat:@" -> Action: %@", v5];

  [v4 appendFormat:@"  PropertyList: %@", self->_propertyList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  action = self->_action;
  id v6 = a3;
  id v5 = NSStringFromSelector(action);
  [v6 encodeObject:v5 forKey:@"action"];

  [v6 encodeObject:self->_propertyList forKey:@"propertyList"];
}

- (unint64_t)hash
{
  Name = sel_getName(self->_action);
  return [self->_propertyList hash] ^ (unint64_t)Name;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_action == (SEL)v4[1])
  {
    unint64_t propertyList = (unint64_t)self->_propertyList;
    if (propertyList | v4[2]) {
      char v5 = objc_msgSend((id)propertyList, "isEqual:");
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (SEL)action
{
  return self->_action;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (void).cxx_destruct
{
}

@end