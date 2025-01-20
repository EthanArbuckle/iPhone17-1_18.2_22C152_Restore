@interface TTICCRVectorMultiTimestamp
- (BOOL)isDocumentShared;
- (TTICCRVectorMultiTimestamp)initWithCapacity:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TTICCRVectorMultiTimestamp

- (TTICCRVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  for (i = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
  {
    v6 = objc_alloc_init(ICTTCRVectorTimestamp);
    [i addObject:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)TTICCRVectorMultiTimestamp;
  v7 = [(ICTTVectorMultiTimestamp *)&v9 initWithTimestamps:i];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TTICCRVectorMultiTimestamp allocWithZone:a3];
  v5 = [(ICTTVectorMultiTimestamp *)self timestamps];
  v6 = -[TTICCRVectorMultiTimestamp initWithCapacity:](v4, "initWithCapacity:", [v5 count]);

  [(ICTTVectorMultiTimestamp *)v6 mergeWithTimestamp:self];
  return v6;
}

- (BOOL)isDocumentShared
{
  return 1;
}

@end