@interface ICTTTextContentStorage
- (BOOL)canCollapseSectionsInRange:(_NSRange)a3;
- (BOOL)canExpandSectionsInRange:(_NSRange)a3;
- (BOOL)isUUIDHidden:(id)a3;
- (ICOutlineController)outlineController;
- (ICTTTextContentStorage)init;
- (ICTTTextContentStorage)initWithTextStorage:(id)a3 outlineState:(id)a4;
- (void)addTextLayoutManager:(id)a3;
- (void)collapseAllSections;
- (void)expandAllSections;
- (void)removeTextLayoutManager:(id)a3;
- (void)setExpanded:(BOOL)a3 forSectionsInRange:(_NSRange)a4;
- (void)setOutlineController:(id)a3;
@end

@implementation ICTTTextContentStorage

- (ICTTTextContentStorage)initWithTextStorage:(id)a3 outlineState:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICTTTextContentStorage;
  id v7 = a3;
  v8 = [(NSTextContentStorage *)&v17 init];
  -[NSTextContentStorage setTextStorage:](v8, "setTextStorage:", v7, v17.receiver, v17.super_class);

  [(NSTextContentStorage *)v8 setIncludesTextListMarkers:0];
  if (ICInternalSettingsIsCollapsibleSectionsEnabled())
  {
    v9 = [ICOutlineController alloc];
    v10 = [(NSTextContentStorage *)v8 textStorage];
    v11 = [v6 collapsedUUIDs];
    uint64_t v12 = [(ICOutlineController *)v9 initWithTextStorage:v10 collapsedUUIDs:v11 asynchronous:1];
    outlineController = v8->_outlineController;
    v8->_outlineController = (ICOutlineController *)v12;

    v14 = v8->_outlineController;
    v15 = [(NSTextContentStorage *)v8 textStorage];
    [v15 setOutlineController:v14];
  }
  return v8;
}

- (BOOL)isUUIDHidden:(id)a3
{
  id v4 = a3;
  v5 = [(ICTTTextContentStorage *)self outlineController];
  char v6 = [v5 isUUIDHidden:v4];

  return v6;
}

- (ICOutlineController)outlineController
{
  return self->_outlineController;
}

- (void)addTextLayoutManager:(id)a3
{
  id v4 = a3;
  v5 = [(NSTextContentStorage *)self textStorage];
  [v5 addTextLayoutManager:v4];

  v6.receiver = self;
  v6.super_class = (Class)ICTTTextContentStorage;
  [(ICTTTextContentStorage *)&v6 addTextLayoutManager:v4];
}

- (ICTTTextContentStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICTTTextContentStorage;
  v2 = [(NSTextContentStorage *)&v7 init];
  if (v2)
  {
    v3 = [ICTTTextStorage alloc];
    id v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [(ICTTTextStorage *)v3 initWithData:0 replicaID:v4];
    [(NSTextContentStorage *)v2 setTextStorage:v5];
  }
  return v2;
}

- (void)removeTextLayoutManager:(id)a3
{
  id v4 = a3;
  v5 = [(NSTextContentStorage *)self textStorage];
  [v5 removeTextLayoutManager:v4];

  v6.receiver = self;
  v6.super_class = (Class)ICTTTextContentStorage;
  [(ICTTTextContentStorage *)&v6 removeTextLayoutManager:v4];
}

- (BOOL)canExpandSectionsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_super v6 = [(ICTTTextContentStorage *)self outlineController];
  objc_super v7 = [(NSTextContentStorage *)self textStorage];
  v8 = objc_msgSend(v7, "paragraphUUIDsInRange:", location, length);
  LOBYTE(location) = [v6 canExpandAnyUUIDs:v8];

  return location;
}

- (BOOL)canCollapseSectionsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_super v6 = [(ICTTTextContentStorage *)self outlineController];
  objc_super v7 = [(NSTextContentStorage *)self textStorage];
  v8 = objc_msgSend(v7, "paragraphUUIDsInRange:", location, length);
  LOBYTE(location) = [v6 canCollapseAnyUUIDs:v8];

  return location;
}

- (void)setExpanded:(BOOL)a3 forSectionsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  BOOL v6 = a3;
  v8 = [(NSTextContentStorage *)self textStorage];
  objc_msgSend(v8, "paragraphUUIDsInRange:", location, length);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = [(ICTTTextContentStorage *)self outlineController];
  v10 = v9;
  if (v6) {
    [v9 expandUUIDs:v12];
  }
  else {
    [v9 collapseUUIDs:v12];
  }

  v11 = [(ICTTTextContentStorage *)self outlineController];
  [v11 collapsibleSectionAffordanceUsedForUUIDs:v12];
}

- (void)expandAllSections
{
  id v2 = [(ICTTTextContentStorage *)self outlineController];
  [v2 expandAll];
}

- (void)collapseAllSections
{
  id v2 = [(ICTTTextContentStorage *)self outlineController];
  [v2 collapseAll];
}

- (void)setOutlineController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end