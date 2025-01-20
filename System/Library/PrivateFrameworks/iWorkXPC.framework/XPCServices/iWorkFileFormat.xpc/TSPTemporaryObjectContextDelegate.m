@interface TSPTemporaryObjectContextDelegate
+ (id)temporaryObjectContextDelegateWithPackageDataForWrite:(id)a3 additionalDocumentPropertiesForWrite:(id)a4;
- (BOOL)contextCanPerformUserActions:(id)a3;
- (BOOL)ignoreDocumentSupport;
- (NSError)error;
- (NSSet)persistenceWarnings;
- (TSPTemporaryObjectContextDelegate)init;
- (id)persistenceWarningsForData:(id)a3 flags:(unint64_t)a4;
- (void)addPersistenceWarnings:(id)a3;
- (void)context:(id)a3 canPerformUserActionUsingBlock:(id)a4;
- (void)presentPersistenceError:(id)a3;
- (void)setIgnoreDocumentSupport:(BOOL)a3;
@end

@implementation TSPTemporaryObjectContextDelegate

- (TSPTemporaryObjectContextDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSPTemporaryObjectContextDelegate;
  v2 = [(TSPTemporaryObjectContextDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    persistenceWarnings = v2->_persistenceWarnings;
    v2->_persistenceWarnings = v3;

    v2->_ignoreDocumentSupport = 1;
  }
  return v2;
}

+ (id)temporaryObjectContextDelegateWithPackageDataForWrite:(id)a3 additionalDocumentPropertiesForWrite:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[TSPTemporaryObjectContextDelegateWithPackageDataForWrite alloc] initWithPackageDataForWrite:v5 additionalDocumentPropertiesForWrite:v6];

  return v7;
}

- (NSSet)persistenceWarnings
{
  return (NSSet *)self->_persistenceWarnings;
}

- (void)presentPersistenceError:(id)a3
{
}

- (void)addPersistenceWarnings:(id)a3
{
}

- (id)persistenceWarningsForData:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    v12 = +[NSSet set];
  }
  else
  {
    uint64_t v7 = [v5 filename];
    v8 = (void *)v7;
    CFStringRef v9 = @"External";
    if ((v4 & 2) == 0) {
      CFStringRef v9 = @"Package";
    }
    v10 = +[NSString stringWithFormat:@"%@ data %@ is missing.", v9, v7];

    v11 = +[TSUWarning warningWithMessage:v10];
    v12 = +[NSSet setWithObject:v11];
  }
  return v12;
}

- (BOOL)contextCanPerformUserActions:(id)a3
{
  return 1;
}

- (void)context:(id)a3 canPerformUserActionUsingBlock:(id)a4
{
  char v4 = (void (**)(id, uint64_t))a4;
  if (v4) {
    v4[2](v4, 1);
  }
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)ignoreDocumentSupport
{
  return self->_ignoreDocumentSupport;
}

- (void)setIgnoreDocumentSupport:(BOOL)a3
{
  self->_ignoreDocumentSupport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_persistenceWarnings, 0);
}

@end