@interface REElementGroup
+ (id)adjoiningElementGroupWithIdentifier:(id)a3;
+ (id)topElementGroupWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)groupIdentifier;
- (REElementGroup)initWithGroupIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxElementCount;
- (unint64_t)behavior;
- (unint64_t)hash;
- (void)setBehavior:(unint64_t)a3;
- (void)setMaxElementCount:(int64_t)a3;
@end

@implementation REElementGroup

- (REElementGroup)initWithGroupIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementGroup;
  v5 = [(REElementGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (id)topElementGroupWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupIdentifier:v3];

  [v4 setBehavior:1];
  [v4 setMaxElementCount:1];
  return v4;
}

+ (id)adjoiningElementGroupWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupIdentifier:v3];

  [v4 setBehavior:1];
  [v4 setMaxElementCount:-1];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REElementGroup *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = v5;
      if (self->_behavior == v5->_behavior && self->_maxElementCount == v5->_maxElementCount)
      {
        groupIdentifier = self->_groupIdentifier;
        v8 = v5->_groupIdentifier;
        objc_super v9 = groupIdentifier;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSString *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_maxElementCount ^ self->_behavior ^ [(NSString *)self->_groupIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGroupIdentifier:self->_groupIdentifier];
  [v4 setBehavior:self->_behavior];
  [v4 setMaxElementCount:self->_maxElementCount];
  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void).cxx_destruct
{
}

@end