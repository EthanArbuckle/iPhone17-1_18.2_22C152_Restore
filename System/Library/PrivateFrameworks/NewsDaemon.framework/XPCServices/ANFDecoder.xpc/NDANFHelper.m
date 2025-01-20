@interface NDANFHelper
- (id)_resourceIDFromURL:(id)a3;
- (id)_resourceIDsFromURLs:(id)a3;
- (id)manifestFromANFDocumentData:(id)a3;
@end

@implementation NDANFHelper

- (id)manifestFromANFDocumentData:(id)a3
{
  id v33 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v3 = (void *)qword_1000089C0;
  uint64_t v44 = qword_1000089C0;
  if (!qword_1000089C0)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100002E6C;
    v40[3] = &unk_1000041A0;
    v40[4] = &v41;
    sub_100002E6C((uint64_t)v40);
    v3 = (void *)v42[3];
  }
  v4 = v3;
  _Block_object_dispose(&v41, 8);
  id v5 = [v4 alloc];
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  id v39 = 0;
  id v8 = [v5 initWithIdentifier:v7 shareURL:0 JSONData:v33 resourceDataSource:0 host:0 error:&v39];
  id v31 = v39;

  if (v8)
  {
    v9 = +[NSMutableArray array];
    v10 = +[NSMutableArray array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v11 = [v8 documentController];
    id obj = [v11 orderedImageIdentifiers];

    id v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v16 = [v8 documentController];
          v17 = [v16 imageResourceForIdentifier:v15];

          v18 = [v17 URL];
          objc_msgSend(v9, "fc_safelyAddObject:", v18);

          v19 = [v8 documentController];
          v20 = [v19 allResourcesForImageIdentifier:v15];

          v21 = [v20 firstObject];
          v22 = [v21 URL];
          objc_msgSend(v10, "fc_safelyAddObject:", v22);
        }
        id v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v12);
    }

    v23 = [v8 documentController];
    v24 = [v23 requiredNonImageResourceURLs];

    id v25 = objc_alloc((Class)FCANFDocumentManifest);
    v26 = [(NDANFHelper *)self _resourceIDsFromURLs:v24];
    v27 = [(NDANFHelper *)self _resourceIDsFromURLs:v9];
    v28 = [(NDANFHelper *)self _resourceIDsFromURLs:v10];
    id v29 = [v25 initWithNonImageResourceIDs:v26 optimalImageResourceIDs:v27 smallestImageResourceIDs:v28];
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)_resourceIDsFromURLs:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002DE4;
  v5[3] = &unk_100004178;
  v5[4] = self;
  v3 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v5);

  return v3;
}

- (id)_resourceIDFromURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  if ([v4 isEqualToString:@"asset"])
  {
    id v5 = [v3 host];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end