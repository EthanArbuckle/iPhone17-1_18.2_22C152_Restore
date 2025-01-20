@interface VUIMediaEntitySortIndex
- (NSString)title;
- (VUIMediaEntitySortIndex)init;
- (VUIMediaEntitySortIndex)initWithTitle:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5;
- (id)description;
- (unint64_t)count;
- (unint64_t)startIndex;
- (void)setCount:(unint64_t)a3;
- (void)setStartIndex:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIMediaEntitySortIndex

- (VUIMediaEntitySortIndex)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntitySortIndex)initWithTitle:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIMediaEntitySortIndex;
  v9 = [(VUIMediaEntitySortIndex *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    v9->_startIndex = a4;
    v9->_count = a5;
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaEntitySortIndex;
  uint64_t v4 = [(VUIMediaEntitySortIndex *)&v18 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(VUIMediaEntitySortIndex *)self title];
  v7 = [v5 stringWithFormat:@"%@=%@", @"title", v6];
  [v3 addObject:v7];

  id v8 = NSString;
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntitySortIndex startIndex](self, "startIndex"));
  uint64_t v10 = [v8 stringWithFormat:@"%@=%@", @"startIndex", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaEntitySortIndex count](self, "count"));
  objc_super v13 = [v11 stringWithFormat:@"%@=%@", @"count", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [v3 componentsJoinedByString:@", "];
  v16 = [v14 stringWithFormat:@"<%@>", v15];

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end