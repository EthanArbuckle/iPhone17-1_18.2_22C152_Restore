@interface ICCRIndexElement
+ (id)elementWithInteger:(int64_t)a3 replica:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICCRIndexElement)initWithInteger:(int64_t)a3 replica:(id)a4;
- (NSUUID)replica;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (int64_t)integer;
- (unint64_t)hash;
- (void)setInteger:(int64_t)a3;
- (void)setReplica:(id)a3;
@end

@implementation ICCRIndexElement

+ (id)elementWithInteger:(int64_t)a3 replica:(id)a4
{
  id v5 = a4;
  v6 = [[ICCRIndexElement alloc] initWithInteger:a3 replica:v5];

  return v6;
}

- (ICCRIndexElement)initWithInteger:(int64_t)a3 replica:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICCRIndexElement;
  v8 = [(ICCRIndexElement *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replica, a4);
    v9->_integer = a3;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICCRIndexElement *)self integer];
  if (v5 == [v4 integer])
  {
    v6 = [(ICCRIndexElement *)self replica];
    id v7 = [v4 replica];
    int64_t v8 = objc_msgSend(v6, "CR_compare:", v7);
  }
  else
  {
    uint64_t v9 = [(ICCRIndexElement *)self integer];
    if (v9 < [v4 integer]) {
      int64_t v8 = -1;
    }
    else {
      int64_t v8 = 1;
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(ICCRIndexElement *)self replica];
    v6 = [v4 replica];
    if ([v5 isEqual:v6])
    {
      int64_t v7 = [(ICCRIndexElement *)self integer];
      BOOL v8 = v7 == [v4 integer];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(ICCRIndexElement *)self replica];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(ICCRIndexElement *)self integer] ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[ICCRIndexElement allocWithZone:a3];
  int64_t v5 = [(ICCRIndexElement *)self integer];
  v6 = [(ICCRIndexElement *)self replica];
  int64_t v7 = [(ICCRIndexElement *)v4 initWithInteger:v5 replica:v6];

  return v7;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
}

- (int64_t)integer
{
  return self->_integer;
}

- (void)setInteger:(int64_t)a3
{
  self->_integer = a3;
}

- (void).cxx_destruct
{
}

@end