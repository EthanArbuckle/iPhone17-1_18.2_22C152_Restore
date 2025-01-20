@interface SCUIMoreHelpContextMenuContainer
- (NSDictionary)contextDictionary;
- (SCUIMoreHelpContextMenuContainer)initWithOptions:(int64_t)a3 contextDictionary:(id)a4 interventionType:(int64_t)a5;
- (int64_t)interventionType;
- (int64_t)options;
@end

@implementation SCUIMoreHelpContextMenuContainer

- (SCUIMoreHelpContextMenuContainer)initWithOptions:(int64_t)a3 contextDictionary:(id)a4 interventionType:(int64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCUIMoreHelpContextMenuContainer;
  v9 = [(SCUIMoreHelpContextMenuContainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_options = a3;
    uint64_t v11 = [v8 copy];
    contextDictionary = v10->_contextDictionary;
    v10->_contextDictionary = (NSDictionary *)v11;

    v10->_interventionType = a5;
  }

  return v10;
}

- (int64_t)options
{
  return self->_options;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void).cxx_destruct
{
}

@end