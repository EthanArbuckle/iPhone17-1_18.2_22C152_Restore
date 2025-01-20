@interface RadioTrackHistorySectionInfo
- (NSArray)objects;
- (NSString)indexTitle;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)numberOfObjects;
@end

@implementation RadioTrackHistorySectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_indexTitle, 0);
}

- (NSArray)objects
{
  return self->_objects;
}

- (unint64_t)numberOfObjects
{
  return self->_numberOfObjects;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)indexTitle
{
  return self->_indexTitle;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[RadioMutableTrackHistorySectionInfo allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_indexTitle copy];
  indexTitle = v4->super._indexTitle;
  v4->super._indexTitle = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_name copy];
  name = v4->super._name;
  v4->super._name = (NSString *)v7;

  v4->super._numberOfObjects = self->_numberOfObjects;
  uint64_t v9 = [(NSArray *)self->_objects copy];
  objects = v4->super._objects;
  v4->super._objects = (NSArray *)v9;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[RadioTrackHistorySectionInfo allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_indexTitle copy];
  indexTitle = v4->_indexTitle;
  v4->_indexTitle = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_name copy];
  name = v4->_name;
  v4->_name = (NSString *)v7;

  v4->_numberOfObjects = self->_numberOfObjects;
  uint64_t v9 = [(NSArray *)self->_objects copy];
  objects = v4->_objects;
  v4->_objects = (NSArray *)v9;

  return v4;
}

@end