@interface _PASTuple2
+ (id)tupleWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTuple2:(id)a3;
- (NSObject)first;
- (NSObject)second;
- (_PASTuple2)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation _PASTuple2

- (NSObject)second
{
  return self->_second;
}

- (NSObject)first
{
  return self->_first;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);

  objc_storeStrong((id *)&self->_first, 0);
}

+ (id)tupleWithFirst:(id)a3 second:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_PASTuple2 alloc] initWithFirst:v6 second:v5];

  return v7;
}

- (_PASTuple2)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PASTuple2;
  v9 = [(_PASTuple2 *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"_PASTuple2(%@, %@)", self->_first, self->_second];

  return v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_first hash];
  return [self->_second hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToTuple2:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  first = self->_first;
  id v7 = *((id *)v4 + 1);
  if (first == v7)
  {
  }
  else
  {
    id v8 = v7;
    v9 = first;
    char v10 = [v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = self->_second;
  v13 = v12;
  if (v12 == v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSObject isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PASTuple2 *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_PASTuple2 *)self isEqualToTuple2:v5];

  return v6;
}

@end