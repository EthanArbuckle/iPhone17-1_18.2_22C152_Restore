@interface ICThumbnailGenerator
- (ICThumbnailGenerator)initWithManagedObjectContext:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
@end

@implementation ICThumbnailGenerator

- (void).cxx_destruct
{
}

- (ICThumbnailGenerator)initWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICThumbnailGenerator;
  v6 = [(ICThumbnailGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);
  }

  return v7;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

@end