@interface SBIconStateUnarchiveResult
- (BOOL)_isNodeIdentifierAlreadyUnarchived:(id)a3;
- (BOOL)_isWidgetUniqueIdentifierAlreadyUnarchived:(id)a3;
- (BOOL)isDirty;
- (BOOL)isValid;
- (NSDictionary)metadata;
- (NSString)description;
- (SBRootFolder)rootFolder;
- (id)_currentFolder;
- (id)_popFolder;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)rootNode;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_currentParseDepth;
- (void)_noteEnteredNode;
- (void)_noteExitedNode;
- (void)_noteNodeIdentifierWasUnarchived:(id)a3;
- (void)_noteRepresentationIsCorrupted;
- (void)_noteSignificantDeviation;
- (void)_noteWidgetUniqueIdentifierWasUnarchived:(id)a3;
- (void)_pushFolder:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setRootFolder:(id)a3;
- (void)setRootNode:(id)a3;
@end

@implementation SBIconStateUnarchiveResult

- (BOOL)isValid
{
  return !self->_corrupted;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)_pushFolder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    folderStack = self->_folderStack;
    id v8 = v4;
    if (folderStack)
    {
      [(NSMutableArray *)folderStack addObject:v4];
    }
    else
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
      v7 = self->_folderStack;
      self->_folderStack = v6;
    }
    [(SBIconStateUnarchiveResult *)self _noteEnteredNode];
    id v4 = v8;
  }
}

- (id)_currentFolder
{
  return (id)[(NSMutableArray *)self->_folderStack lastObject];
}

- (id)_popFolder
{
  v3 = [(NSMutableArray *)self->_folderStack lastObject];
  unint64_t v4 = [(NSMutableArray *)self->_folderStack count];
  folderStack = self->_folderStack;
  if (v4 < 2)
  {
    self->_folderStack = 0;

    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(NSMutableArray *)folderStack removeLastObject];
  if (v3) {
LABEL_5:
  }
    [(SBIconStateUnarchiveResult *)self _noteExitedNode];
LABEL_6:
  return v3;
}

- (void)_noteEnteredNode
{
}

- (void)_noteExitedNode
{
}

- (int64_t)_currentParseDepth
{
  return self->_parseDepth;
}

- (void)_noteRepresentationIsCorrupted
{
  self->_corrupted = 1;
}

- (void)_noteSignificantDeviation
{
  self->_dirty = 1;
}

- (BOOL)_isNodeIdentifierAlreadyUnarchived:(id)a3
{
  return [(NSMutableSet *)self->_nodeIdentifiersUnarchived containsObject:a3];
}

- (void)_noteNodeIdentifierWasUnarchived:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    v5 = v4;
    nodeIdentifiersUnarchived = self->_nodeIdentifiersUnarchived;
    if (nodeIdentifiersUnarchived)
    {
      [(NSMutableSet *)nodeIdentifiersUnarchived addObject:v5];
    }
    else
    {
      v7 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v9 count:1];
      id v8 = self->_nodeIdentifiersUnarchived;
      self->_nodeIdentifiersUnarchived = v7;

      v5 = v9;
    }
  }
}

- (BOOL)_isWidgetUniqueIdentifierAlreadyUnarchived:(id)a3
{
  return [(NSMutableSet *)self->_widgetUniqueIdentifiersUnarchived containsObject:a3];
}

- (void)_noteWidgetUniqueIdentifierWasUnarchived:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    v5 = v4;
    widgetUniqueIdentifiersUnarchived = self->_widgetUniqueIdentifiersUnarchived;
    if (widgetUniqueIdentifiersUnarchived)
    {
      [(NSMutableSet *)widgetUniqueIdentifiersUnarchived addObject:v5];
    }
    else
    {
      v7 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v9 count:1];
      id v8 = self->_widgetUniqueIdentifiersUnarchived;
      self->_widgetUniqueIdentifiersUnarchived = v7;

      v5 = v9;
    }
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconStateUnarchiveResult *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconStateUnarchiveResult *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = [(SBIconStateUnarchiveResult *)self rootFolder];
  id v6 = (id)[v4 appendObject:v5 withName:@"rootFolder"];

  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconStateUnarchiveResult isValid](self, "isValid"), @"isValid");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconStateUnarchiveResult isDirty](self, "isDirty"), @"isDirty");
  id v9 = [(SBIconStateUnarchiveResult *)self metadata];
  id v10 = (id)[v4 appendObject:v9 withName:@"metadata"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconStateUnarchiveResult *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (void)_setRootFolder:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)_setMetadata:(id)a3
{
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_widgetUniqueIdentifiersUnarchived, 0);
  objc_storeStrong((id *)&self->_nodeIdentifiersUnarchived, 0);
  objc_storeStrong((id *)&self->_folderStack, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
}

@end