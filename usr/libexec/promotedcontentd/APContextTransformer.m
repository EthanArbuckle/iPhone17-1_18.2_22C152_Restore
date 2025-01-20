@interface APContextTransformer
- (APContext)originalContext;
- (APContextTransformer)initWithContext:(id)a3 contentIdentifier:(id)a4 placementType:(int64_t)a5;
- (NSMutableDictionary)bodyContext;
- (NSMutableDictionary)headerContext;
- (NSString)contentIdentifier;
- (id)transformedContext;
- (int64_t)placementType;
- (void)_addAdjacentContext;
- (void)_addContext:(id)a3;
- (void)_addCurrentArticleContext;
- (void)setPlacementType:(int64_t)a3;
@end

@implementation APContextTransformer

- (APContextTransformer)initWithContext:(id)a3 contentIdentifier:(id)a4 placementType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)APContextTransformer;
  v11 = [(APContextTransformer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentIdentifier, a4);
    objc_storeStrong((id *)&v12->_originalContext, a3);
    v12->_placementType = a5;
    v13 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    bodyContext = v12->_bodyContext;
    v12->_bodyContext = v13;

    v15 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    headerContext = v12->_headerContext;
    v12->_headerContext = v15;
  }
  return v12;
}

- (void)_addCurrentArticleContext
{
  id v11 = [(APContextTransformer *)self originalContext];
  v3 = [(APContextTransformer *)self bodyContext];
  v4 = [v3 objectForKey:@"currentArticle"];
  v5 = [v11 current];
  v6 = [v5 categories];

  v7 = [v11 current];
  v8 = [v7 keywords];

  id v9 = [v11 current];
  id v10 = [v9 language];

  [v4 setValue:v6 forKey:@"categories"];
  [v4 setValue:v8 forKey:@"keywords"];
  [v4 setValue:v10 forKey:@"sourceContentLanguage"];
  [v3 setValue:v4 forKey:@"currentArticle"];
}

- (void)_addContext:(id)a3
{
  id v22 = a3;
  if ([v22 adjacency] == (id)151)
  {
    CFStringRef v4 = @"nextArticle";
  }
  else if ([v22 adjacency] == (id)150)
  {
    CFStringRef v4 = @"groupContext";
  }
  else if ([v22 adjacency] == (id)152)
  {
    CFStringRef v4 = @"groupContextAbove";
  }
  else
  {
    if ([v22 adjacency] != (id)156) {
      goto LABEL_22;
    }
    CFStringRef v4 = @"groupContextBelow";
  }
  v5 = [(APContextTransformer *)self bodyContext];
  CFStringRef v21 = v4;
  v6 = [v5 objectForKey:v4];
  id v7 = [v6 mutableCopy];

  if (!v7) {
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
  }
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [v22 categories];

  if (v9)
  {
    id v10 = [v22 categories];
    [v8 addObjectsFromArray:v10];
  }
  id v11 = [v7 valueForKey:@"categories"];
  v12 = [v8 arrayByAddingObjectsFromArray:v11];
  if (v12) {
    [v7 setObject:v12 forKey:@"categories"];
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  v14 = [v22 keywords];

  if (v14)
  {
    v15 = [v22 keywords];
    [v13 addObjectsFromArray:v15];
  }
  v16 = [v7 valueForKey:@"keywords"];
  v17 = [v13 arrayByAddingObjectsFromArray:v16];
  if (v17) {
    [v7 setObject:v17 forKey:@"keywords"];
  }
  objc_super v18 = [v22 language];

  if (v18)
  {
    objc_super v18 = [v22 language];
  }
  [v7 setValue:v18 forKey:@"languages"];
  v19 = [(APContextTransformer *)self bodyContext];
  v20 = +[NSDictionary dictionaryWithDictionary:v7];
  [v19 setValue:v20 forKey:v21];

LABEL_22:
}

- (void)_addAdjacentContext
{
  v3 = [(APContextTransformer *)self originalContext];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CFStringRef v4 = [v3 adjacent:0];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        [(APContextTransformer *)self _addContext:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)transformedContext
{
  v3 = [(APContextTransformer *)self originalContext];
  CFStringRef v4 = [v3 supplementalContext];
  id v5 = [(APContextTransformer *)self bodyContext];
  v33 = [(APContextTransformer *)self headerContext];
  v31 = self;
  v32 = v3;
  if (![(APContextTransformer *)self placementType]
    || (id)[(APContextTransformer *)self placementType] == (id)4)
  {
    if (qword_100289980 != -1) {
      dispatch_once(&qword_100289980, &stru_100235728);
    }
    id v6 = [v4 valueForKey:qword_100289978];

    if (!v6)
    {
      id v7 = [v4 mutableCopy];
      if ([(APContextTransformer *)self placementType]) {
        CFStringRef v8 = @"NATIVE";
      }
      else {
        CFStringRef v8 = @"ANY";
      }
      [v7 setObject:v8 forKey:qword_100289978];
      id v9 = [v7 copy];

      CFStringRef v4 = v9;
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v17 = [v15 componentsSeparatedByString:@"."];
        objc_super v18 = [v17 firstObject];
        unsigned __int8 v19 = [v18 isEqualToString:@"body"];

        v20 = v5;
        if ((v19 & 1) != 0
          || ([v17 firstObject],
              CFStringRef v21 = objc_claimAutoreleasedReturnValue(),
              unsigned int v22 = [v21 isEqualToString:@"header"],
              v21,
              v20 = v33,
              v22))
        {
          [v20 _addProperty:v15 fromSupplementalContext:v10];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }

  v23 = +[NSNumber numberWithInt:1];
  [v33 setObject:v23 forKey:@"onboard_status"];

  v24 = [(APContextTransformer *)v31 contentIdentifier];
  [v5 setValue:v24 forKey:@"adOpId"];

  [(APContextTransformer *)v31 _addCurrentArticleContext];
  [(APContextTransformer *)v31 _addAdjacentContext];
  v25 = [v32 requestedAdIdentifier];

  if (v25)
  {
    id v26 = [v5 objectForKey:@"feedMetadata"];
    if (!v26) {
      id v26 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
    }
    v27 = [v32 requestedAdIdentifier];
    [v26 setValue:v27 forKey:@"customTargetingId"];

    [v5 setValue:v26 forKey:@"feedMetadata"];
    v28 = [v32 requestedAdIdentifier];
    [v5 setValue:v28 forKey:@"customTargetingId"];
  }
  id v29 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v5, @"body", v33, @"header", 0];

  return v29;
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (APContext)originalContext
{
  return (APContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)bodyContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)headerContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)placementType
{
  return self->_placementType;
}

- (void)setPlacementType:(int64_t)a3
{
  self->_placementType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerContext, 0);
  objc_storeStrong((id *)&self->_bodyContext, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);

  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

@end