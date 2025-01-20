@interface TLKSelectableGridTuple
+ (id)tupleWithTitle:(id)a3 subtitle:(id)a4;
+ (id)tuplesForTitles:(id)a3 subtitles:(id)a4;
- (NSString)subtitle;
- (NSString)title;
- (double)size;
- (id)description;
- (void)setSize:(double)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TLKSelectableGridTuple

- (void)setTitle:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setSubtitle:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_subtitle != v10)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

+ (id)tupleWithTitle:(id)a3 subtitle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(TLKSelectableGridTuple);
  [(TLKSelectableGridTuple *)v7 setTitle:v6];

  [(TLKSelectableGridTuple *)v7 setSubtitle:v5];
  return v7;
}

+ (id)tuplesForTitles:(id)a3 subtitles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  if ([v5 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v5 objectAtIndexedSubscript:v8];
      v10 = [v6 objectAtIndexedSubscript:v8];
      v11 = +[TLKSelectableGridTuple tupleWithTitle:v9 subtitle:v10];
      [v7 addObject:v11];

      ++v8;
    }
    while (v8 < [v5 count]);
  }
  v12 = (void *)[v7 copy];

  return v12;
}

- (id)description
{
  v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)TLKSelectableGridTuple;
  v4 = [(TLKSelectableGridTuple *)&v8 description];
  [v3 appendString:v4];

  id v5 = [(TLKSelectableGridTuple *)self title];
  id v6 = [(TLKSelectableGridTuple *)self subtitle];
  [v3 appendFormat:@" (Title: '%@', Subtitle: '%@')", v5, v6];

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end