@interface _UITabBasicAlternateRepresentation
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)title;
- (UIImage)image;
- (_UITabBasicAlternateRepresentation)initWithTitle:(id)a3 image:(id)a4;
- (unint64_t)hash;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UITabBasicAlternateRepresentation

- (_UITabBasicAlternateRepresentation)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITabBasicAlternateRepresentation;
  v8 = [(_UITabBasicAlternateRepresentation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(_UITabBasicAlternateRepresentation *)v8 setTitle:v6];
    [(_UITabBasicAlternateRepresentation *)v9 setImage:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITabBasicAlternateRepresentation *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(_UITabBasicAlternateRepresentation *)v5 title];
      id v7 = [(_UITabBasicAlternateRepresentation *)self title];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(_UITabBasicAlternateRepresentation *)v5 image];
        v10 = [(_UITabBasicAlternateRepresentation *)self image];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->title hash];
  return [(UIImage *)self->image hash] ^ v3;
}

- (NSString)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = NSStringFromSelector(sel_title);
  v8[0] = v3;
  v4 = NSStringFromSelector(sel_image);
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return (NSString *)v6;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->title, 0);
}

@end