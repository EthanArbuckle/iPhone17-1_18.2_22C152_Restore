@interface MailboxHierarchyTree
- (BOOL)mailboxHasSubMailboxes:(id)a3;
- (MailboxHierarchyTree)initWithRootMailbox:(id)a3;
- (id)addChildMailbox:(id)a3 forMailboxNode:(id)a4;
- (id)displayNameForMailbox:(id)a3;
- (id)flattenedMailboxTreeRepresentation;
- (id)parentForMailbox:(id)a3;
- (id)rootMailboxNode;
- (int)levelForMailbox:(id)a3;
- (void)_addChildNode:(id)a3 toParentNode:(id)a4;
- (void)_insertMailboxUidsFlattenedFromMailboxNode:(id)a3 intoArray:(id)a4 currentLevel:(int)a5;
- (void)moveMailbox:(id)a3 toParent:(id)a4;
- (void)removeNodeForMailbox:(id)a3;
- (void)setDisplayName:(id)a3 forMailbox:(id)a4;
@end

@implementation MailboxHierarchyTree

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodesByMailbox, 0);

  objc_storeStrong((id *)&self->_rootMailboxNode, 0);
}

- (id)rootMailboxNode
{
  return self->_rootMailboxNode;
}

- (id)addChildMailbox:(id)a3 forMailboxNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [[MailboxHierarchyNode alloc] initWithMailbox:v6];
    [(MailboxHierarchyTree *)self _addChildNode:v8 toParentNode:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MailboxHierarchyTree)initWithRootMailbox:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MailboxHierarchyTree;
  v5 = [(MailboxHierarchyTree *)&v11 init];
  if (v5)
  {
    id v6 = [[MailboxHierarchyNode alloc] initWithMailbox:v4];
    rootMailboxNode = v5->_rootMailboxNode;
    v5->_rootMailboxNode = v6;

    [(MailboxHierarchyNode *)v5->_rootMailboxNode setLevel:0xFFFFFFFFLL];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodesByMailbox = v5->_nodesByMailbox;
    v5->_nodesByMailbox = v8;

    [(NSMutableDictionary *)v5->_nodesByMailbox setObject:v5->_rootMailboxNode forKey:v4];
  }

  return v5;
}

- (void)_addChildNode:(id)a3 toParentNode:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v6 addChild:v10];
  id v7 = [v6 mailbox];
  [v10 setParentMailbox:v7];

  [v10 setLevel:[v6 level] + 1];
  nodesByMailbox = self->_nodesByMailbox;
  v9 = [v10 mailbox];
  [(NSMutableDictionary *)nodesByMailbox setObject:v10 forKey:v9];
}

- (void)_insertMailboxUidsFlattenedFromMailboxNode:(id)a3 intoArray:(id)a4 currentLevel:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  [a3 children];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v14 = [v13 mailbox:v15];
        if (v14)
        {
          [v13 setLevel:v5];
          [v8 addObject:v14];
          [(MailboxHierarchyTree *)self _insertMailboxUidsFlattenedFromMailboxNode:v13 intoArray:v8 currentLevel:(v5 + 1)];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (int)levelForMailbox:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:a3];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 level];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (id)flattenedMailboxTreeRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(MailboxHierarchyTree *)self _insertMailboxUidsFlattenedFromMailboxNode:self->_rootMailboxNode intoArray:v3 currentLevel:0];

  return v3;
}

- (void)removeNodeForMailbox:(id)a3
{
  id v5 = a3;
  id v4 = -[MailboxHierarchyNode removeNodeForMailbox:](self->_rootMailboxNode, "removeNodeForMailbox:");
  [(NSMutableDictionary *)self->_nodesByMailbox removeObjectForKey:v5];
}

- (void)moveMailbox:(id)a3 toParent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:v11];
  uint64_t v8 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:v6];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [(MailboxHierarchyTree *)self removeNodeForMailbox:v11];
    [(MailboxHierarchyTree *)self _addChildNode:v7 toParentNode:v9];
  }
}

- (id)parentForMailbox:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:a3];
  id v4 = [v3 parentMailbox];

  return v4;
}

- (void)setDisplayName:(id)a3 forMailbox:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:v6];
  [v7 setDisplayName:v9];
  uint64_t v8 = [v7 parentMailbox];
  [(MailboxHierarchyTree *)self moveMailbox:v6 toParent:v8];
}

- (id)displayNameForMailbox:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:a3];
  id v4 = [v3 displayName];

  return v4;
}

- (BOOL)mailboxHasSubMailboxes:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_nodesByMailbox objectForKey:a3];
  id v4 = [v3 children];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

@end