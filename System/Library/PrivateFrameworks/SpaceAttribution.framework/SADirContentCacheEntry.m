@interface SADirContentCacheEntry
- (NSArray)dir_content;
- (NSString)parent_path;
- (SADirContentCacheEntry)initWithData:(id)a3 idx:(unint64_t)a4 andParentPath:(id)a5;
- (int64_t)index;
- (void)setDir_content:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setParent_path:(id)a3;
@end

@implementation SADirContentCacheEntry

- (SADirContentCacheEntry)initWithData:(id)a3 idx:(unint64_t)a4 andParentPath:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SADirContentCacheEntry;
  v11 = [(SADirContentCacheEntry *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_index = a4;
    objc_storeStrong((id *)&v11->_dir_content, a3);
    objc_storeStrong((id *)&v12->_parent_path, a5);
  }

  return v12;
}

- (NSArray)dir_content
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDir_content:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSString)parent_path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParent_path:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent_path, 0);
  objc_storeStrong((id *)&self->_dir_content, 0);
}

@end