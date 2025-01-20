@interface NSURL(Mutable)
- (id)pf_URLByAppendingQueryParameterKey:()Mutable value:;
- (id)pf_URLByAppendingQueryParameters:()Mutable;
- (id)pf_URLByRemovingQueryParameters:()Mutable;
- (id)pf_queryAsDictionary;
- (uint64_t)pf_components;
@end

@implementation NSURL(Mutable)

- (uint64_t)pf_components
{
  return [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
}

- (id)pf_queryAsDictionary
{
  v1 = [a1 query];
  v2 = +[NSURLUtil queryStringToQueryDictionary:v1];

  return v2;
}

- (id)pf_URLByAppendingQueryParameters:()Mutable
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pf_components");
  v6 = [v5 query];
  v7 = +[NSURLUtil queryStringToQueryDictionary:v6];

  [v7 addEntriesFromDictionary:v4];
  v8 = +[NSURLUtil dictionaryToQueryString:v7];
  [v5 setQuery:v8];

  v9 = [v5 URL];

  return v9;
}

- (id)pf_URLByRemovingQueryParameters:()Mutable
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pf_components");
  v6 = [v5 query];
  v7 = +[NSURLUtil queryStringToQueryDictionary:v6];

  [v7 removeObjectsForKeys:v4];
  v8 = +[NSURLUtil dictionaryToQueryString:v7];
  [v5 setQuery:v8];

  v9 = [v5 URL];

  return v9;
}

- (id)pf_URLByAppendingQueryParameterKey:()Mutable value:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12 = a3;
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10 = objc_msgSend(a1, "pf_URLByAppendingQueryParameters:", v9);

  return v10;
}

@end