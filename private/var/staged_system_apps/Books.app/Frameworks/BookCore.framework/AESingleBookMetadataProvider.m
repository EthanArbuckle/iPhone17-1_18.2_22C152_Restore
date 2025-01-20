@interface AESingleBookMetadataProvider
+ (id)singleBookMetadataProviderWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7;
- (AESingleBookMetadataProvider)initWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7;
- (BOOL)isManagedBook;
- (BOOL)isManagedWithAssetID:(id)a3;
- (NSString)assetID;
- (NSString)bookVersionString;
- (NSString)description;
- (NSString)pathToAssetContextDirectory;
- (NSURL)assetURL;
- (id)assetURLForAssetID:(id)a3;
- (id)bookVersionStringForAssetID:(id)a3;
- (id)pathToContextDirectoryForAssetID:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetURL:(id)a3;
- (void)setBookVersionString:(id)a3;
- (void)setManagedBook:(BOOL)a3;
- (void)setPathToAssetContextDirectory:(id)a3;
@end

@implementation AESingleBookMetadataProvider

+ (id)singleBookMetadataProviderWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[AESingleBookMetadataProvider alloc] initWithAssetID:v14 assetURL:v13 bookVersionString:v12 pathToAssetContextDirectory:v11 isManagedBook:v7];

  return v15;
}

- (AESingleBookMetadataProvider)initWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AESingleBookMetadataProvider;
  v16 = [(AESingleBookMetadataProvider *)&v22 init];
  v17 = v16;
  if (v16)
  {
    [(AESingleBookMetadataProvider *)v16 setAssetID:v12];
    [(AESingleBookMetadataProvider *)v17 setAssetURL:v13];
    [(AESingleBookMetadataProvider *)v17 setBookVersionString:v14];
    [(AESingleBookMetadataProvider *)v17 setPathToAssetContextDirectory:v15];
    [(AESingleBookMetadataProvider *)v17 setManagedBook:v7];
    if (!v12)
    {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 323, (uint64_t)"-[AESingleBookMetadataProvider initWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:]", (uint64_t)"inAssetID", 0, v18, v19, v20, (uint64_t)v22.receiver);

      v17 = 0;
    }
  }

  return v17;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(AESingleBookMetadataProvider *)self assetID];
  v6 = [(AESingleBookMetadataProvider *)self assetURL];
  BOOL v7 = [(AESingleBookMetadataProvider *)self bookVersionString];
  v8 = [(AESingleBookMetadataProvider *)self pathToAssetContextDirectory];
  unsigned int v9 = [(AESingleBookMetadataProvider *)self isManagedBook];
  CFStringRef v10 = @"NO";
  if (v9) {
    CFStringRef v10 = @"YES";
  }
  id v11 = +[NSString stringWithFormat:@"<%@(%p) id=%@ url=%@ version=%@ cd=%@ managed=%@>", v4, self, v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (id)assetURLForAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(AESingleBookMetadataProvider *)self assetID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    unsigned int v9 = [(AESingleBookMetadataProvider *)self assetID];
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 339, (uint64_t)"-[AESingleBookMetadataProvider assetURLForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", @"expected asset ID '%@', asked for unmanaged asset ID '%@' ", v10, v11, v12, (uint64_t)v9);
  }
  BOOL v7 = [(AESingleBookMetadataProvider *)self assetURL];

  return v7;
}

- (id)bookVersionStringForAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(AESingleBookMetadataProvider *)self assetID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    unsigned int v9 = [(AESingleBookMetadataProvider *)self assetID];
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 345, (uint64_t)"-[AESingleBookMetadataProvider bookVersionStringForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", @"expected asset ID '%@', asked for unmanaged asset ID '%@' ", v10, v11, v12, (uint64_t)v9);
  }
  BOOL v7 = [(AESingleBookMetadataProvider *)self bookVersionString];

  return v7;
}

- (id)pathToContextDirectoryForAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(AESingleBookMetadataProvider *)self assetID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    unsigned int v9 = [(AESingleBookMetadataProvider *)self assetID];
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 351, (uint64_t)"-[AESingleBookMetadataProvider pathToContextDirectoryForAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", @"expected asset ID '%@', asked for unmanaged asset ID '%@' ", v10, v11, v12, (uint64_t)v9);
  }
  BOOL v7 = [(AESingleBookMetadataProvider *)self pathToAssetContextDirectory];

  return v7;
}

- (BOOL)isManagedWithAssetID:(id)a3
{
  id v4 = a3;
  v5 = [(AESingleBookMetadataProvider *)self assetID];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    unsigned int v9 = [(AESingleBookMetadataProvider *)self assetID];
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 357, (uint64_t)"-[AESingleBookMetadataProvider isManagedWithAssetID:]", (uint64_t)"[inAssetID isEqualToString:self.assetID]", @"expected asset ID '%@', asked for unmanaged asset ID '%@' ", v10, v11, v12, (uint64_t)v9);
  }
  BOOL v7 = [(AESingleBookMetadataProvider *)self isManagedBook];

  return v7;
}

- (NSString)assetID
{
  return self->assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSURL)assetURL
{
  return self->assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (NSString)bookVersionString
{
  return self->bookVersionString;
}

- (void)setBookVersionString:(id)a3
{
}

- (NSString)pathToAssetContextDirectory
{
  return self->pathToAssetContextDirectory;
}

- (void)setPathToAssetContextDirectory:(id)a3
{
}

- (BOOL)isManagedBook
{
  return self->managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->managedBook = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pathToAssetContextDirectory, 0);
  objc_storeStrong((id *)&self->bookVersionString, 0);
  objc_storeStrong((id *)&self->assetURL, 0);

  objc_storeStrong((id *)&self->assetID, 0);
}

@end