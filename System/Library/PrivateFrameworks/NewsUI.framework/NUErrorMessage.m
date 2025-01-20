@interface NUErrorMessage
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (NUErrorMessage)initWithTitle:(id)a3 subtitle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation NUErrorMessage

- (NUErrorMessage)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUErrorMessage;
  v9 = [(NUErrorMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_subtitle, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    v6 = NSString;
    id v7 = [(NUErrorMessage *)self title];
    id v8 = [v5 title];
    if (objc_msgSend(v6, "fc_string:isEqualToString:", v7, v8))
    {
      v9 = NSString;
      v10 = [(NUErrorMessage *)self subtitle];
      v11 = [v5 subtitle];
      char v12 = objc_msgSend(v9, "fc_string:isEqualToString:", v10, v11);
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(NUErrorMessage *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(NUErrorMessage *)self subtitle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [NUErrorMessage alloc];
  unint64_t v6 = [(NUErrorMessage *)self title];
  id v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(NUErrorMessage *)self subtitle];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(NUErrorMessage *)v5 initWithTitle:v7 subtitle:v9];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end