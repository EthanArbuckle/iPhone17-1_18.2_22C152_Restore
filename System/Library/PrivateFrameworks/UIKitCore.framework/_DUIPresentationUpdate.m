@interface _DUIPresentationUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)modifiedPreviews;
- (_DUIPresentationUpdate)initWithCoder:(id)a3;
- (int64_t)badgeStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeStyle:(int64_t)a3;
- (void)setModifiedPreviews:(id)a3;
@end

@implementation _DUIPresentationUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIPresentationUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DUIPresentationUpdate;
  v5 = [(_DUIPresentationUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"modifiedPreviews"];
    modifiedPreviews = v5->_modifiedPreviews;
    v5->_modifiedPreviews = (NSArray *)v6;

    v5->_badgeStyle = [v4 decodeIntegerForKey:@"badgeStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t badgeStyle = self->_badgeStyle;
  id v5 = a3;
  [v5 encodeInteger:badgeStyle forKey:@"badgeStyle"];
  [v5 encodeObject:self->_modifiedPreviews forKey:@"modifiedPreviews"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self->_badgeStyle == *((void *)v5 + 2))
    {
      modifiedPreviews = self->_modifiedPreviews;
      v8 = (void *)*((void *)v5 + 1);
      objc_super v9 = modifiedPreviews;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [(NSArray *)v9 isEqual:v10];
        }
      }
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
  return self->_badgeStyle ^ [(NSArray *)self->_modifiedPreviews hash];
}

- (NSArray)modifiedPreviews
{
  return self->_modifiedPreviews;
}

- (void)setModifiedPreviews:(id)a3
{
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (void)setBadgeStyle:(int64_t)a3
{
  self->_int64_t badgeStyle = a3;
}

- (void).cxx_destruct
{
}

@end