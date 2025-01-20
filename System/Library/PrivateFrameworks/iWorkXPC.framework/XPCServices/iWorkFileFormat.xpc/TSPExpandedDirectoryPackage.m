@interface TSPExpandedDirectoryPackage
+ (BOOL)hasZipArchive;
+ (BOOL)isValidPackageAtURL:(id)a3;
- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5;
- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4;
@end

@implementation TSPExpandedDirectoryPackage

+ (BOOL)hasZipArchive
{
  return 0;
}

+ (BOOL)isValidPackageAtURL:(id)a3
{
  id v4 = a3;
  v5 = [@"Index" stringByAppendingPathComponent:@"Metadata"];
  v6 = [a1 componentFileURLForPackageURL:v4 packageLocator:v5];
  unsigned __int8 v7 = [v6 checkResourceIsReachableAndReturnError:0];

  return v7;
}

- (id)packageEntryInfoForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    uint64_t v7 = [@"Index" stringByAppendingPathComponent:v6];

    id v6 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)TSPExpandedDirectoryPackage;
  v8 = [(TSPDirectoryPackage *)&v10 packageEntryInfoForComponentLocator:v6 isStoredOutsideObjectArchive:1];

  return v8;
}

- (id)newRawReadChannelForComponentLocator:(id)a3 isStoredOutsideObjectArchive:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  if (!a4)
  {
    uint64_t v9 = [@"Index" stringByAppendingPathComponent:v8];

    id v8 = (id)v9;
  }
  v12.receiver = self;
  v12.super_class = (Class)TSPExpandedDirectoryPackage;
  id v10 = [(TSPDirectoryPackage *)&v12 newRawReadChannelForComponentLocator:v8 isStoredOutsideObjectArchive:1 error:a5];

  return v10;
}

@end