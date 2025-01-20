@interface EDNamedStyle
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)name;
- (void)setName:(id)a3;
@end

@implementation EDNamedStyle

- (void)setName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->mName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v6;
  }
}

- (id)name
{
  return self->mName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)EDNamedStyle;
  v5 = -[EDStyle copyWithZone:](&v10, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->mName copyWithZone:a3];
    v7 = (void *)v5[12];
    v5[12] = v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDNamedStyle;
  v2 = [(EDStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end