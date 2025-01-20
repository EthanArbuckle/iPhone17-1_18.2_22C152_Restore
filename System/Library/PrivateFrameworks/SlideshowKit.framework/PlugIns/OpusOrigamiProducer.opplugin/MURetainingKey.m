@interface MURetainingKey
+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo;
+ (BOOL)clearVars;
+ (id)retainingKeyWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MURetainingKey)initWithObject:(id)a3;
- (NSObject)object;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)purge;
@end

@implementation MURetainingKey

+ ($428C0FB8A9BF713540BE3970CA928F37)poolInfo
{
  return ($428C0FB8A9BF713540BE3970CA928F37 *)&unk_1F12D0;
}

+ (BOOL)clearVars
{
  return 0;
}

+ (id)retainingKeyWithObject:(id)a3
{
  v3 = [[MURetainingKey alloc] initWithObject:a3];
  return v3;
}

- (MURetainingKey)initWithObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MURetainingKey;
  v4 = [(MURetainingKey *)&v6 init];
  if (v4) {
    v4->_object = a3;
  }
  return v4;
}

- (void)purge
{
  self->_object = 0;
}

- (void)dealloc
{
  [(MURetainingKey *)self purge];
  v3.receiver = self;
  v3.super_class = (Class)MURetainingKey;
  [(MURetainingKey *)&v3 dealloc];
}

- (unint64_t)hash
{
  return (unint64_t)self->_object >> 4;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_respondsToSelector() & 1) != 0 && *((void *)a3 + 2) == self->_object;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MURetainingKey;
  return objc_msgSend(-[MURetainingKey description](&v3, "description"), "stringByAppendingFormat:", @" %p", self->_object);
}

- (NSObject)object
{
  return self->_object;
}

@end