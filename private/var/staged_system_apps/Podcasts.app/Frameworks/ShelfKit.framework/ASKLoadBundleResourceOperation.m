@interface ASKLoadBundleResourceOperation
- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4;
- (NSArray)searchBundles;
- (NSString)resourceName;
- (void)main;
@end

@implementation ASKLoadBundleResourceOperation

- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASKLoadBundleResourceOperation;
  v8 = [(ASKLoadBundleResourceOperation *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    resourceName = v8->_resourceName;
    v8->_resourceName = v9;

    v11 = (NSArray *)[v7 copy];
    searchBundles = v8->_searchBundles;
    v8->_searchBundles = v11;
  }
  return v8;
}

- (void)main
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(ASKLoadBundleResourceOperation *)self searchBundles];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * v7);
      if ([(ASKLoadBundleResourceOperation *)self isCancelled]) {
        break;
      }
      v9 = [(ASKLoadBundleResourceOperation *)self resourceName];
      v10 = +[UIImage imageNamed:v9 inBundle:v8 compatibleWithTraitCollection:0];

      if (v10)
      {
        objc_super v14 = self;
        v15 = v10;
        v16 = 0;
        goto LABEL_13;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    if ([(ASKLoadBundleResourceOperation *)self isCancelled]) {
      return;
    }
    v11 = [(ASKLoadBundleResourceOperation *)self resourceName];
    v12 = [(ASKLoadBundleResourceOperation *)self searchBundles];
    v3 = +[NSString stringWithFormat:@"No image found for %@ in %@", v11, v12];

    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v3;
    v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v10 = +[NSError errorWithDomain:@"ASKLoadBundleResourceOperationErrorDomain" code:560557415 userInfo:v13];

    objc_super v14 = self;
    v15 = 0;
    v16 = v10;
LABEL_13:
    [(ASKLoadResourceOperation *)v14 didCompleteWithResource:v15 error:v16];
  }
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSArray)searchBundles
{
  return self->_searchBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBundles, 0);

  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end