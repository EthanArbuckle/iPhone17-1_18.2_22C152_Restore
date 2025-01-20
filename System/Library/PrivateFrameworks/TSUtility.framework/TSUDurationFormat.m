@interface TSUDurationFormat
+ (id)formatWithFormat:(id)a3 name:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (TSUDurationFormat)initWithFormat:(id)a3 name:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)format;
- (id)formatName;
- (unint64_t)hash;
- (void)dealloc;
- (void)setFormatName:(id)a3;
@end

@implementation TSUDurationFormat

+ (id)formatWithFormat:(id)a3 name:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithFormat:a3 name:a4];
  return v4;
}

- (TSUDurationFormat)initWithFormat:(id)a3 name:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSUDurationFormat;
  v6 = [(TSUDurationFormat *)&v8 init];
  if (v6)
  {
    v6->mFormat = (NSString *)a3;
    v6->mName = (NSString *)a4;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mFormat = self->mFormat;
  mName = self->mName;
  return (id)[v4 initWithFormat:mFormat name:mName];
}

- (void)dealloc
{
  self->mFormat = 0;
  self->mName = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUDurationFormat;
  [(TSUDurationFormat *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(NSString *)self->mFormat isEqualToString:*((void *)a3 + 1)];
    if (v5)
    {
      mName = self->mName;
      if ((unint64_t)mName | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSString isEqualToString:](mName, "isEqualToString:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->mName hash];
  return [(NSString *)self->mFormat hash] + v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"SFTDurationFormat[%p]: Format String: %@ Name: %@", self, self->mFormat, self->mName];
}

- (id)format
{
  return self->mFormat;
}

- (id)formatName
{
  return self->mName;
}

- (void)setFormatName:(id)a3
{
  id v5 = a3;

  self->mName = (NSString *)a3;
}

@end