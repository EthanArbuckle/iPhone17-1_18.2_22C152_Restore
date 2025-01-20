@interface THModelContainerNode
- (BOOL)enumerateSubtreeUsingBlock:(id)a3;
- (NSArray)childNodes;
- (NSMutableArray)children;
- (THModelContainerNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5;
- (id)applePubAbsoluteURL;
- (id)applePubRelativePath;
- (id)contentNodeAfterContentNode:(id)a3;
- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (id)description;
- (id)nodeAfterNode:(id)a3;
- (id)nodeAtIndex:(unint64_t)a3;
- (id)nodeBeforeNode:(id)a3;
- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4;
- (unint64_t)count;
- (unint64_t)indexOfNode:(id)a3;
- (unint64_t)pageCountForPresentationType:(id)a3;
- (unint64_t)removeNode:(id)a3;
- (void)addMappingFromGUIDToNodeToDictionary:(id)a3;
- (void)addNode:(id)a3;
- (void)dealloc;
- (void)insertNode:(id)a3 atIndex:(unint64_t)a4;
- (void)removeNodeAtIndex:(unint64_t)a3;
- (void)setChildren:(id)a3;
@end

@implementation THModelContainerNode

- (NSMutableArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
  [(THModelContainerNode *)self willModify];
  id v5 = a3;

  self->mChildren = (NSMutableArray *)a3;
}

- (THModelContainerNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)THModelContainerNode;
  id v5 = [(THModelNode *)&v7 initWithTitle:a3 includeInTOC:a4 context:a5];
  if (v5) {
    [(THModelContainerNode *)v5 setChildren:+[NSMutableArray array]];
  }
  return v5;
}

- (void)dealloc
{
  self->mChildren = 0;
  self->mPublicationContext = 0;

  self->mApplePubURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelContainerNode;
  [(THModelNode *)&v3 dealloc];
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(THModelContainerNode *)self children];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v13;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) pageCountForPresentationType:a3];
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      v7 += (unint64_t)v10;
    }
    id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  return v7;
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode pageAtRelativeIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m") lineNumber:67 description:@"Invalid index."];
    return 0;
  }
  unint64_t v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = [(THModelContainerNode *)self children];
  id result = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v15;
LABEL_6:
    id v10 = 0;
    unint64_t v11 = v6;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
      unint64_t v13 = (unint64_t)[v12 pageCountForPresentationType:a4];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      unint64_t v6 = v11 - v13;
      if (v11 < v13) {
        return [v12 pageAtRelativeIndex:v11 forPresentationType:a4];
      }
      id v10 = (char *)v10 + 1;
      v11 -= v13;
      if (v8 == v10)
      {
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id result = 0;
        if (v8) {
          goto LABEL_6;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode contentNodeForRelativePageIndex:forPresentationType:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m") lineNumber:97 description:@"Invalid index."];
    return 0;
  }
  unint64_t v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = [(THModelContainerNode *)self children];
  id result = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v15;
LABEL_6:
    id v10 = 0;
    unint64_t v11 = v6;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
      unint64_t v13 = (unint64_t)[v12 pageCountForPresentationType:a4];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      unint64_t v6 = v11 - v13;
      if (v11 < v13) {
        return [v12 contentNodeForRelativePageIndex:v11 forPresentationType:a4];
      }
      id v10 = (char *)v10 + 1;
      v11 -= v13;
      if (v8 == v10)
      {
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id result = 0;
        if (v8) {
          goto LABEL_6;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)addMappingFromGUIDToNodeToDictionary:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)THModelContainerNode;
  -[THModelNode addMappingFromGUIDToNodeToDictionary:](&v14, "addMappingFromGUIDToNodeToDictionary:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(THModelContainerNode *)self children];
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) addMappingFromGUIDToNodeToDictionary:a3];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)childNodes
{
  v2 = [(THModelContainerNode *)self children];

  return +[NSArray arrayWithArray:v2];
}

- (void)addNode:(id)a3
{
  [(NSMutableArray *)[(THModelContainerNode *)self children] addObject:a3];

  [a3 setParent:self];
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  [(NSMutableArray *)[(THModelContainerNode *)self children] insertObject:a3 atIndex:a4];

  [a3 setParent:self];
}

- (void)removeNodeAtIndex:(unint64_t)a3
{
  [(-[NSMutableArray objectAtIndex:](-[THModelContainerNode children](self, "children"), "objectAtIndex:", a3)) setParent:0];
  id v5 = [(THModelContainerNode *)self children];

  [(NSMutableArray *)v5 removeObjectAtIndex:a3];
}

- (unint64_t)removeNode:(id)a3
{
  id v5 = [(NSMutableArray *)[(THModelContainerNode *)self children] indexOfObject:a3];
  [a3 setParent:0];
  [(NSMutableArray *)[(THModelContainerNode *)self children] removeObject:a3];
  return (unint64_t)v5;
}

- (unint64_t)count
{
  v2 = [(THModelContainerNode *)self children];

  return (unint64_t)[(NSMutableArray *)v2 count];
}

- (id)nodeAtIndex:(unint64_t)a3
{
  v4 = [(THModelContainerNode *)self children];

  return [(NSMutableArray *)v4 objectAtIndex:a3];
}

- (id)nodeAfterNode:(id)a3
{
  v4 = (char *)[(NSMutableArray *)[(THModelContainerNode *)self children] indexOfObject:a3]+ 1;
  if ([(NSMutableArray *)[(THModelContainerNode *)self children] count] <= v4) {
    return 0;
  }
  id v5 = [(THModelContainerNode *)self children];

  return [(NSMutableArray *)v5 objectAtIndex:v4];
}

- (id)nodeBeforeNode:(id)a3
{
  id result = [(NSMutableArray *)[(THModelContainerNode *)self children] indexOfObject:a3];
  if (result)
  {
    id v5 = (char *)result;
    id v6 = [(THModelContainerNode *)self children];
    return [(NSMutableArray *)v6 objectAtIndex:v5 - 1];
  }
  return result;
}

- (unint64_t)indexOfNode:(id)a3
{
  v4 = [(THModelContainerNode *)self children];

  return (unint64_t)[(NSMutableArray *)v4 indexOfObject:a3];
}

- (id)contentNodeAfterContentNode:(id)a3
{
  if ([(THModelContainerNode *)self nodeAfterNode:a3])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode contentNodeAfterContentNode:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m") lineNumber:186 description:@"Expecting sibling to be a content node"];
    }
  }
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)applePubRelativePath
{
  return self->mPublicationContext;
}

- (id)applePubAbsoluteURL
{
  return +[NSURL URLWithString:self->mPublicationContext relativeToURL:self->mApplePubURL];
}

- (BOOL)enumerateSubtreeUsingBlock:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v11[0] = 0;
  (*((void (**)(id, THModelContainerNode *, void, unsigned char *))a3 + 2))(a3, self, 0, v11);
  if (*((unsigned char *)v9 + 24))
  {
    char v5 = 1;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_35B9C;
    v7[3] = &unk_4576F8;
    v7[4] = a3;
    v7[5] = &v8;
    [(NSMutableArray *)[(THModelContainerNode *)self children] enumerateObjectsUsingBlock:v7];
    char v5 = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@* %p pages = %@>", objc_opt_class(), self, [(NSMutableArray *)self->mChildren description]];
}

@end