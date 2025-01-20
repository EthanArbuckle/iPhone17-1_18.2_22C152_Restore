@interface SCNScene
- (id)p_groupNodes:(id)a3;
@end

@implementation SCNScene

- (id)p_groupNodes:(id)a3
{
  v4 = +[NSSet setWithArray:](NSSet, "setWithArray:", [a3 valueForKey:@"parentNode"]);
  if ((char *)[(NSSet *)v4 count] == (char *)&dword_0 + 1)
  {
    id v5 = [(NSSet *)v4 anyObject];
    v6 = +[SCNNode node];
    [v5 addChildNode:v6];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(a3);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v11 removeFromParentNode];
          [(SCNNode *)v6 addChildNode:v11];
        }
        id v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SCNScene(THAdditions) p_groupNodes:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/SCNScene_THAdditions.m") lineNumber:33 description:@"Given nodes do not all have the same parent"];
    return 0;
  }
  return v6;
}

@end