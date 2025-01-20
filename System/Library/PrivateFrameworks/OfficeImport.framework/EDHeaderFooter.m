@interface EDHeaderFooter
+ (id)headerFooter;
- (id)description;
- (id)footerString;
- (id)headerString;
- (void)setFooterString:(id)a3;
- (void)setHeaderString:(id)a3;
@end

@implementation EDHeaderFooter

- (void)setFooterString:(id)a3
{
  v5 = (NSString *)a3;
  mFooterString = self->mFooterString;
  p_mFooterString = &self->mFooterString;
  if (mFooterString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mFooterString, a3);
    v5 = v8;
  }
}

- (void)setHeaderString:(id)a3
{
  v5 = (NSString *)a3;
  mHeaderString = self->mHeaderString;
  p_mHeaderString = &self->mHeaderString;
  if (mHeaderString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mHeaderString, a3);
    v5 = v8;
  }
}

+ (id)headerFooter
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)headerString
{
  return self->mHeaderString;
}

- (id)footerString
{
  return self->mFooterString;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDHeaderFooter;
  id v2 = [(EDHeaderFooter *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFooterString, 0);
  objc_storeStrong((id *)&self->mHeaderString, 0);
}

@end