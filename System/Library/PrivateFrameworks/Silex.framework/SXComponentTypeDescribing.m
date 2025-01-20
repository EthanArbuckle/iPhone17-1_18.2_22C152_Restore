@interface SXComponentTypeDescribing
+ (id)descriptionWithType:(id)a3 role:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (int)role;
- (unint64_t)hash;
@end

@implementation SXComponentTypeDescribing

+ (id)descriptionWithType:(id)a3 role:(int)a4
{
  id v5 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class());
  v7 = (void *)v6[2];
  v6[2] = v5;

  *((_DWORD *)v6 + 2) = a4;
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SXComponentTypeDescribing *)self role];
  v4 = [(SXComponentTypeDescribing *)self type];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(SXComponentTypeDescribing *)self role];
  if (v5 == [v4 role])
  {
    v6 = [(SXComponentTypeDescribing *)self type];
    v7 = [v4 type];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  int v5 = [(SXComponentTypeDescribing *)self type];
  v6 = objc_msgSend(v4, "descriptionWithType:role:", v5, -[SXComponentTypeDescribing role](self, "role"));

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (int)role
{
  return self->_role;
}

- (void).cxx_destruct
{
}

@end