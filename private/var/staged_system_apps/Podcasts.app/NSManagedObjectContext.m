@interface NSManagedObjectContext
- (BOOL)deleteAllUPPMetadata;
- (id)uppMetadataForMetadataIdentifier:(id)a3;
- (id)uppMetadataForMetadataIdentifiers:(id)a3;
@end

@implementation NSManagedObjectContext

- (id)uppMetadataForMetadataIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"MTUPPMetadata"];
    v6 = +[NSPredicate predicateWithFormat:@"%K = %@", @"metadataIdentifier", v4];

    [v5 setPredicate:v6];
    [v5 setReturnsObjectsAsFaults:0];
    [v5 setFetchLimit:1];
    v7 = [(NSManagedObjectContext *)self executeFetchRequest:v5];
    v8 = [v7 firstObject];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)uppMetadataForMetadataIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"metadataIdentifier", v4];
    v6 = [(NSManagedObjectContext *)self objectsInEntity:@"MTUPPMetadata" predicate:v5 sortDescriptors:0];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (BOOL)deleteAllUPPMetadata
{
  id v6 = 0;
  id v2 = +[MTUPPMetadata deleteAllContentInCtx:self error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = +[IMLogger sharedLogger];
    [v4 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Models/Misc/MTUPPMetadata+Library.m", 102, @"Error deleting UPPMetadata: %@", v3 lineNumber format];
  }
  return v3 == 0;
}

@end