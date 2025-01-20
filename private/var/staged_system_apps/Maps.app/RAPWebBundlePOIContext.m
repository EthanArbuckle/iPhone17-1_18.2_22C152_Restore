@interface RAPWebBundlePOIContext
- (BOOL)acceptsApplePay;
- (BOOL)permanentClosed;
- (BOOL)temporaryClosed;
- (NSArray)businessHours;
- (NSArray)categories;
- (NSArray)containedInPlaces;
- (NSArray)containsPlaces;
- (NSArray)transitInfos;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)url;
- (id)context;
- (void)setAcceptsApplePay:(BOOL)a3;
- (void)setBusinessHours:(id)a3;
- (void)setCategories:(id)a3;
- (void)setContainedInPlaces:(id)a3;
- (void)setContainsPlaces:(id)a3;
- (void)setName:(id)a3;
- (void)setPermanentClosed:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setTemporaryClosed:(BOOL)a3;
- (void)setTransitInfos:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation RAPWebBundlePOIContext

- (id)context
{
  v71.receiver = self;
  v71.super_class = (Class)RAPWebBundlePOIContext;
  v3 = [(RAPWebBundleAddToMapContext *)&v71 context];
  id v4 = [v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v6 = [(RAPWebBundlePOIContext *)self businessHours];
  id v7 = [v6 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v67 + 1) + 8 * i) context];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v8);
  }

  v12 = [v4 objectForKeyedSubscript:@"place"];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v15 = v14;

  if ([v5 count]) {
    [v15 setObject:v5 forKeyedSubscript:@"businessHoursNormal"];
  }
  v16 = [(RAPWebBundlePOIContext *)self name];

  if (v16)
  {
    v17 = [(RAPWebBundlePOIContext *)self name];
    [v15 setObject:v17 forKeyedSubscript:@"entityName"];
  }
  v18 = [(RAPWebBundlePOIContext *)self phoneNumber];

  if (v18)
  {
    v19 = [(RAPWebBundlePOIContext *)self phoneNumber];
    [v15 setObject:v19 forKeyedSubscript:@"entityTelephone"];
  }
  v20 = [(RAPWebBundlePOIContext *)self url];

  if (v20)
  {
    v21 = [(RAPWebBundlePOIContext *)self url];
    [v15 setObject:v21 forKeyedSubscript:@"entityURL"];
  }
  v22 = [(RAPWebBundlePOIContext *)self categories];
  id v23 = [v22 count];

  if ((unint64_t)v23 >= 2)
  {
    v24 = [(RAPWebBundlePOIContext *)self categories];
    [v15 setObject:v24 forKeyedSubscript:@"entityCategories"];
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    v25 = +[NSNumber numberWithBool:[(RAPWebBundlePOIContext *)self permanentClosed]];
    [v15 setObject:v25 forKeyedSubscript:@"businessHoursPermanentClosure"];

    v26 = +[NSNumber numberWithBool:[(RAPWebBundlePOIContext *)self temporaryClosed]];
    [v15 setObject:v26 forKeyedSubscript:@"businessHoursTemporaryClosureEnd"];
  }
  v27 = +[NSNumber numberWithBool:[(RAPWebBundlePOIContext *)self acceptsApplePay]];
  [v15 setObject:v27 forKeyedSubscript:@"acceptsApplePay"];

  id v28 = objc_alloc_init((Class)NSMutableArray);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v29 = [(RAPWebBundlePOIContext *)self transitInfos];
  id v30 = [v29 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v64;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v64 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = [*(id *)(*((void *)&v63 + 1) + 8 * (void)j) context];
        [v28 addObject:v34];
      }
      id v31 = [v29 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v31);
  }

  if ([v28 count])
  {
    id v35 = [v28 copy];
    [v15 setObject:v35 forKeyedSubscript:@"transitInfo"];
  }
  v54 = v4;
  id v36 = objc_alloc_init((Class)NSMutableArray);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v37 = [(RAPWebBundlePOIContext *)self containsPlaces];
  id v38 = [v37 countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v60;
    do
    {
      for (k = 0; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v60 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)k) context];
        [v36 addObject:v42];
      }
      id v39 = [v37 countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v39);
  }

  if ([v36 count])
  {
    id v43 = [v36 copy];
    [v15 setObject:v43 forKeyedSubscript:@"contains"];
  }
  id v44 = objc_alloc_init((Class)NSMutableArray);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v45 = [(RAPWebBundlePOIContext *)self containedInPlaces];
  id v46 = [v45 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v56;
    do
    {
      for (m = 0; m != v47; m = (char *)m + 1)
      {
        if (*(void *)v56 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)m) context];
        [v44 addObject:v50];
      }
      id v47 = [v45 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v47);
  }

  if ([v44 count])
  {
    id v51 = [v44 copy];
    [v15 setObject:v51 forKeyedSubscript:@"containedIn"];
  }
  id v52 = [v54 copy];

  return v52;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)businessHours
{
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
}

- (BOOL)permanentClosed
{
  return self->_permanentClosed;
}

- (void)setPermanentClosed:(BOOL)a3
{
  self->_permanentClosed = a3;
}

- (BOOL)temporaryClosed
{
  return self->_temporaryClosed;
}

- (void)setTemporaryClosed:(BOOL)a3
{
  self->_temporaryClosed = a3;
}

- (BOOL)acceptsApplePay
{
  return self->_acceptsApplePay;
}

- (void)setAcceptsApplePay:(BOOL)a3
{
  self->_acceptsApplePay = a3;
}

- (NSArray)transitInfos
{
  return self->_transitInfos;
}

- (void)setTransitInfos:(id)a3
{
}

- (NSArray)containedInPlaces
{
  return self->_containedInPlaces;
}

- (void)setContainedInPlaces:(id)a3
{
}

- (NSArray)containsPlaces
{
  return self->_containsPlaces;
}

- (void)setContainsPlaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containsPlaces, 0);
  objc_storeStrong((id *)&self->_containedInPlaces, 0);
  objc_storeStrong((id *)&self->_transitInfos, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end