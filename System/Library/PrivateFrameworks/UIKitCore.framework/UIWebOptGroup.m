@interface UIWebOptGroup
- (NSArray)options;
- (UIWebOptGroup)initWithGroup:(id)a3 itemOffset:(int64_t)a4;
- (UIWebSelectedItemPrivate)group;
- (int64_t)offset;
- (void)dealloc;
- (void)setGroup:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation UIWebOptGroup

- (UIWebOptGroup)initWithGroup:(id)a3 itemOffset:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIWebOptGroup;
  v6 = [(UIWebOptGroup *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(UIWebOptGroup *)v6 setGroup:a3];
    v7->_offset = a4;
  }
  return v7;
}

- (void)dealloc
{
  [(UIWebOptGroup *)self setGroup:0];
  [(UIWebOptGroup *)self setOptions:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebOptGroup;
  [(UIWebOptGroup *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->_offset;
}

- (UIWebSelectedItemPrivate)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

@end