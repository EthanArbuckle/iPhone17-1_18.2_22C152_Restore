@interface PFAIDocument
+ (BOOL)mapArchive:(id)a3 toDocumentRoot:(id)a4 withUrl:(id)a5 isUpdate:(BOOL)a6;
+ (BOOL)readDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5;
+ (BOOL)updateDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5;
+ (void)initialize;
@end

@implementation PFAIDocument

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
  }
}

+ (BOOL)mapArchive:(id)a3 toDocumentRoot:(id)a4 withUrl:(id)a5 isUpdate:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v11 = [[PFAIPackageState alloc] initWithDocumentRoot:a4 applePubURL:a5 archive:a3];
  if (+[PFAIPackage readWithState:v11])
  {
    if ([(PFAIPackageState *)v11 requiredVersion] >= 3) {
      +[NSException raise:NSGenericException format:@"Wrong applepub version"];
    }
    if (v6) {
      unsigned __int8 v12 = +[PFAINavigation updateDocumentWithState:v11];
    }
    else {
      unsigned __int8 v12 = +[PFAINavigation readDocumentWithState:v11];
    }
    BOOL v13 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)readDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5
{
  return [a1 mapArchive:a5 toDocumentRoot:a3 withUrl:a4 isUpdate:0];
}

+ (BOOL)updateDocumentRoot:(id)a3 applePubURL:(id)a4 fromArchive:(id)a5
{
  return [a1 mapArchive:a5 toDocumentRoot:a3 withUrl:a4 isUpdate:1];
}

@end