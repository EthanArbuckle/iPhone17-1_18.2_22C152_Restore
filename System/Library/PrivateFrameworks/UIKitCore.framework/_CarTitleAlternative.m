@interface _CarTitleAlternative
+ (id)alternativeWithTitle:(id)a3 label:(id)a4;
- (NSString)title;
- (double)width;
- (id)description;
- (void)updateWithLabel:(id)a3;
@end

@implementation _CarTitleAlternative

+ (id)alternativeWithTitle:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [v7 copy];

  v10 = (void *)v8[1];
  v8[1] = v9;

  [v8 updateWithLabel:v6];
  return v8;
}

- (void)updateWithLabel:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_title length])
  {
    v5 = [(_CarTitleAlternative *)self title];
    uint64_t v9 = *(void *)off_1E52D2040;
    id v6 = [v4 font];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 sizeWithAttributes:v7];
    UICeilToViewScale(v4);
    self->_width = v8;
  }
  else
  {
    self->_width = 0.0;
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_CarTitleAlternative;
  id v4 = [(_CarTitleAlternative *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ '%@' (%f)", v4, self->_title, *(void *)&self->_width];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (double)width
{
  return self->_width;
}

- (void).cxx_destruct
{
}

@end