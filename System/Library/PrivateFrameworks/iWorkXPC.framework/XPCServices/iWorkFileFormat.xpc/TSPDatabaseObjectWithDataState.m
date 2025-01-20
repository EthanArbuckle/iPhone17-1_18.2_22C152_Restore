@interface TSPDatabaseObjectWithDataState
- (BOOL)hasDataState;
- (BOOL)hasFileState;
- (TSPDatabaseObjectWithDataState)initWithIdentifier:(int64_t)a3 classType:(int)a4 dataState:(int64_t)a5;
- (id)fileState;
- (id)fileURL;
- (int64_t)dataState;
@end

@implementation TSPDatabaseObjectWithDataState

- (TSPDatabaseObjectWithDataState)initWithIdentifier:(int64_t)a3 classType:(int)a4 dataState:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TSPDatabaseObjectWithDataState;
  result = [(TSPDatabaseObject *)&v7 initWithIdentifier:a3 classType:*(void *)&a4];
  if (result) {
    result->_dataState = a5;
  }
  return result;
}

- (BOOL)hasDataState
{
  return 1;
}

- (int64_t)dataState
{
  return self->_dataState;
}

- (BOOL)hasFileState
{
  return 0;
}

- (id)fileState
{
  return 0;
}

- (id)fileURL
{
  return 0;
}

@end