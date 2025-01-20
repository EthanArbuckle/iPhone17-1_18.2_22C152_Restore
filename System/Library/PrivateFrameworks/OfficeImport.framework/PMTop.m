@interface PMTop
+ (BOOL)supportsProgressiveMapping;
- (BOOL)isCancelled;
- (Class)mapperClassForIndexing:(BOOL)a3;
- (Class)readerClassForBinaryDocuments;
- (Class)readerClassForXMLDocuments;
- (Class)stateClass;
- (void)initializeClasses;
- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8;
@end

@implementation PMTop

- (void)initializeClasses
{
  objc_opt_class();
  objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)PMTop;
  [(QLTop *)&v3 initializeClasses];
}

- (Class)readerClassForBinaryDocuments
{
  return (Class)objc_opt_class();
}

- (Class)readerClassForXMLDocuments
{
  return (Class)objc_opt_class();
}

- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  [v17 setAutoCommit:0];
  v18.receiver = self;
  v18.super_class = (Class)PMTop;
  [(QLTop *)&v18 readFile:v14 orData:v15 dataFileName:v16 format:a6 archiver:v17 forIndexing:v8];
}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  objc_super v3 = objc_opt_class();
  return (Class)v3;
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isCancelled
{
  return 0;
}

+ (BOOL)supportsProgressiveMapping
{
  return 1;
}

@end