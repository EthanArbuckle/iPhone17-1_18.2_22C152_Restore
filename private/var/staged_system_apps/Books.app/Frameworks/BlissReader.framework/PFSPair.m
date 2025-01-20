@interface PFSPair
+ (id)pair;
+ (id)pairWithPair:(id)a3;
+ (id)pairWithType:(int64_t)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (PFSPair)init;
- (PFSPair)initWithCoder:(id)a3;
- (PFSPair)initWithPair:(id)a3;
- (PFSPair)initWithType:(int64_t)a3 value:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)numberValue;
- (id)stringValue;
- (id)value;
- (int64_t)type;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)p_SetType:(int64_t)a3;
- (void)p_SetValue:(id)a3;
@end

@implementation PFSPair

+ (id)pairWithType:(int64_t)a3 value:(id)a4
{
  id v4 = [objc_alloc((Class)a1) initWithType:a3 value:a4];

  return v4;
}

+ (id)pairWithPair:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithPair:a3];

  return v3;
}

+ (id)pair
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (PFSPair)initWithType:(int64_t)a3 value:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PFSPair;
  v6 = [(PFSPair *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(PFSPair *)v6 p_SetType:a3];
    [(PFSPair *)v7 p_SetValue:a4];
  }
  return v7;
}

- (PFSPair)initWithPair:(id)a3
{
  id v5 = [a3 type];
  id v6 = [a3 value];

  return [(PFSPair *)self initWithType:v5 value:v6];
}

- (PFSPair)init
{
  return [(PFSPair *)self initWithType:0 value:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFSPair;
  [(PFSPair *)&v3 dealloc];
}

- (PFSPair)initWithCoder:(id)a3
{
  objc_opt_class();
  [a3 decodeObject];
  id v5 = (void *)TSUDynamicCast();
  id v6 = [a3 decodeObject];
  id v7 = [v5 integerValue];

  return [(PFSPair *)self initWithType:v7 value:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:[NSNumber numberWithInteger:self->mType]];
  id mValue = self->mValue;

  [a3 encodeObject:mValue];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id mType = self->mType;
  if (mType != [a3 type]) {
    return 0;
  }
  id mValue = self->mValue;
  id v7 = [a3 value];

  return [mValue isEqual:v7];
}

- (unint64_t)hash
{
  int64_t mType = self->mType;
  return (unint64_t)[self->mValue hash] ^ mType;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<PFSPair>%ld,%@</PFSPair>", self->mType, [self->mValue description]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  [self->mValue copyWithZone:];
  id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:value:", self->mType, v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  [self->mValue copyWithZone:];
  id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:value:", self->mType, v5);

  return v6;
}

- (int64_t)type
{
  return self->mType;
}

- (id)value
{
  return self->mValue;
}

- (void)p_SetType:(int64_t)a3
{
  self->int64_t mType = a3;
}

- (void)p_SetValue:(id)a3
{
  id mValue = self->mValue;
  if (mValue != a3)
  {

    self->id mValue = a3;
  }
}

- (id)stringValue
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)numberValue
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

@end