@interface TBLocalFetchRequestDescriptor
- (NSFetchRequest)fetchRequest;
- (NSFetchRequest)localFetchRequest;
- (TBLocalFetchRequestDescriptor)initWithFetchRequest:(id)a3;
- (void)setLocalFetchRequest:(id)a3;
@end

@implementation TBLocalFetchRequestDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFetchRequest, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (TBLocalFetchRequestDescriptor)initWithFetchRequest:(id)a3
{
  v4 = (NSFetchRequest *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TBLocalFetchRequestDescriptor;
  v5 = [(TBLocalFetchRequestDescriptor *)&v8 init];
  fetchRequest = v5->_fetchRequest;
  v5->_fetchRequest = v4;

  return v5;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSFetchRequest)localFetchRequest
{
  return self->_localFetchRequest;
}

- (void)setLocalFetchRequest:(id)a3
{
}

@end