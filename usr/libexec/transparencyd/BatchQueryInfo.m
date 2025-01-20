@interface BatchQueryInfo
+ (id)descriptor;
- (id)diagnosticsJsonDictionary;
@end

@implementation BatchQueryInfo

- (id)diagnosticsJsonDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:[(BatchQueryInfo *)self status]];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  if ([(BatchQueryInfo *)self hasUriWitness])
  {
    v5 = [(BatchQueryInfo *)self uriWitness];
    v6 = [v5 diagnosticsJsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"uriWitness"];
  }
  if ([(BatchQueryInfo *)self hasMapEntry])
  {
    v7 = [(BatchQueryInfo *)self mapEntry];
    v8 = [v7 diagnosticsJsonDictionary];
    [v3 setObject:v8 forKeyedSubscript:@"mapEntry"];
  }
  v9 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(BatchQueryInfo *)self pendingSmtsArray];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = +[SignedMutationTimestamp signedTypeWithObject:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        v16 = [v15 diagnosticsJsonDictionary];
        [v9 addObject:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  if ([v9 count]) {
    [v3 setObject:v9 forKeyedSubscript:@"pendingSmts"];
  }

  return v3;
}

+ (id)descriptor
{
  id v2 = (id)qword_10032EEB8;
  if (!qword_10032EEB8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:BatchQueryInfo messageName:@"BatchQueryInfo" fileDescription:&unk_100325780 fields:&off_100325918 fieldCount:4 storageSize:32 flags:v4];
    [v2 setupExtraTextInfo:&unk_10028B417];
    qword_10032EEB8 = (uint64_t)v2;
  }
  return v2;
}

@end