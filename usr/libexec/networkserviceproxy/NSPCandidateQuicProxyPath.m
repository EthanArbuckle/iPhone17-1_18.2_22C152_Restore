@interface NSPCandidateQuicProxyPath
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
@end

@implementation NSPCandidateQuicProxyPath

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NSPCandidateProxyPath *)self ingressProxy];
  v9 = (void *)v8;
  if (v8) {
    v10 = *(void **)(v8 + 24);
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  uint64_t v12 = [(NSPCandidateProxyPath *)self egressProxy];
  v13 = (void *)v12;
  if (v12) {
    v14 = *(void **)(v12 + 24);
  }
  else {
    v14 = 0;
  }
  id v15 = v14;
  BOOL v16 = +[NSPPrivacyProxyAgentManager proxiesMatch:v7 proxyPathList:v6 ingressProxy:v11 egressProxy:v15 pathWeight:[(NSPCandidateProxyPath *)self proxyPathWeight] supportsFallback:0];

  return v16;
}

@end