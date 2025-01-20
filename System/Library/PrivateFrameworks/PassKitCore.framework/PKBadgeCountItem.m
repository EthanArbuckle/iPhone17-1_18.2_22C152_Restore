@interface PKBadgeCountItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (PKBadgeCountItem)initWithCoder:(id)a3;
- (PKBadgeCountItem)initWithTitle:(id)a3 subtitle:(id)a4 count:(int64_t)a5;
- (id)description;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKBadgeCountItem

- (PKBadgeCountItem)initWithTitle:(id)a3 subtitle:(id)a4 count:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKBadgeCountItem;
  v10 = [(PKBadgeCountItem *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    title = v10->_title;
    v10->_title = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    subtitle = v10->_subtitle;
    v10->_subtitle = (NSString *)v13;

    v10->_count = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKBadgeCountItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        title = self->_title;
        v7 = [(PKBadgeCountItem *)v5 title];
        id v8 = title;
        id v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {
        }
        else
        {
          if (!v8 || !v9)
          {

            goto LABEL_21;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11)
          {
            BOOL v12 = 0;
LABEL_23:

            goto LABEL_24;
          }
        }
        subtitle = self->_subtitle;
        v14 = [(PKBadgeCountItem *)v5 subtitle];
        v15 = subtitle;
        objc_super v16 = v14;
        id v8 = v16;
        if (v15 == v16)
        {

          goto LABEL_19;
        }
        if (v15 && v16)
        {
          BOOL v17 = [(NSString *)v15 isEqualToString:v16];

          if (!v17) {
            goto LABEL_21;
          }
LABEL_19:
          int64_t count = self->_count;
          BOOL v12 = count == [(PKBadgeCountItem *)v5 count];
LABEL_22:

          goto LABEL_23;
        }

LABEL_21:
        BOOL v12 = 0;
        goto LABEL_22;
      }
    }
    BOOL v12 = 0;
  }
LABEL_24:

  return v12;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKBadgeCountItem;
  v3 = [(PKBadgeCountItem *)&v8 description];
  v4 = [v3 stringByAppendingFormat:@" title: %@", self->_title];

  if (self->_subtitle)
  {
    uint64_t v5 = [v4 stringByAppendingFormat:@", subtitle: %@", self->_subtitle];

    v4 = (void *)v5;
  }
  v6 = [v4 stringByAppendingFormat:@", count: %ld", self->_count];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBadgeCountItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBadgeCountItem;
  uint64_t v5 = [(PKBadgeCountItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    v5->_int64_t count = [v4 decodeIntegerForKey:@"count"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v5 encodeInteger:self->_count forKey:@"count"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end