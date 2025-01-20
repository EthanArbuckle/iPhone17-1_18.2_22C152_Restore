@interface NEKSourceWrapper
- (NEKSourceAttributes)attributes;
- (NEKSourceWrapper)initWithAccount:(id)a3;
- (NEKSourceWrapper)initWithAttributes:(id)a3;
- (NEKSourceWrapper)initWithSource:(id)a3;
- (NSString)description;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
@end

@implementation NEKSourceWrapper

- (NEKSourceWrapper)initWithSource:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[NEKSourceAttributes alloc] initWithSource:v4];

    if (v5)
    {
      self = [(NEKSourceWrapper *)self initWithAttributes:v5];
      v6 = self;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NEKSourceWrapper)initWithAccount:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[NEKSourceAttributes alloc] initWithAccount:v4];

    if (v5)
    {
      self = [(NEKSourceWrapper *)self initWithAttributes:v5];
      v6 = self;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NEKSourceWrapper)initWithAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NEKSourceWrapper;
  v6 = [(NEKSourceWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributes, a3);
  }

  return v7;
}

- (NSString)objectIdentifier
{
  v2 = [(NEKSourceAttributes *)self->_attributes accountPersistentID];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSUUID eks_garbageUUID];
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 2;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(NEKSourceAttributes *)self->_attributes accountPersistentID];
  v6 = [(NEKSourceAttributes *)self->_attributes name];
  v7 = sub_10002D3E0(v6);
  unint64_t v8 = [(NEKSourceAttributes *)self->_attributes type];
  if (v8 > 5) {
    CFStringRef v9 = @"Unknown";
  }
  else {
    CFStringRef v9 = off_1000A9AA8[v8];
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; persistentID=%@; title=\"%@\"; type=%@>",
    v4,
    self,
    v5,
    v7,
  v10 = v9);

  return (NSString *)v10;
}

- (NEKSourceAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
}

@end