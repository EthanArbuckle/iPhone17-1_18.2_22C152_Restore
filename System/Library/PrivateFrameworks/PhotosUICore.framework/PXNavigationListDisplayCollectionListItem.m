@interface PXNavigationListDisplayCollectionListItem
- (BOOL)isDeletable;
- (BOOL)isDraggable;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isRenamable;
- (BOOL)isReorderable;
- (PXDisplayCollectionList)collection;
- (PXNavigationListDisplayCollectionListItem)initWithIdentifier:(id)a3 displayCollectionList:(id)a4 title:(id)a5 itemCount:(int64_t)a6 containerIdentifier:(id)a7;
- (id)accessoryGlyphImageName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)glyphImageName;
- (int64_t)indentationLevel;
- (void)setDraggable:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setIndentationLevel:(int64_t)a3;
- (void)setReorderable:(BOOL)a3;
@end

@implementation PXNavigationListDisplayCollectionListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_accessoryGlyphImageName, 0);
  objc_storeStrong((id *)&self->_glyphImageName, 0);
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (PXDisplayCollectionList)collection
{
  return self->_collection;
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (BOOL)isRenamable
{
  return self->_renamable;
}

- (void)setReorderable:(BOOL)a3
{
  self->_reorderable = a3;
}

- (BOOL)isReorderable
{
  return self->_reorderable;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (id)accessoryGlyphImageName
{
  return self->_accessoryGlyphImageName;
}

- (id)glyphImageName
{
  return self->_glyphImageName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXNavigationListDisplayCollectionListItem;
  v5 = -[PXNavigationListItem copyWithZone:](&v13, sel_copyWithZone_);
  v6 = [(PXNavigationListDisplayCollectionListItem *)self glyphImageName];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = (void *)v5[9];
  v5[9] = v7;

  *((unsigned char *)v5 + 64) = [(PXNavigationListDisplayCollectionListItem *)self isDraggable];
  *((unsigned char *)v5 + 65) = [(PXNavigationListDisplayCollectionListItem *)self isReorderable];
  *((unsigned char *)v5 + 66) = [(PXNavigationListDisplayCollectionListItem *)self isRenamable];
  *((unsigned char *)v5 + 67) = [(PXNavigationListDisplayCollectionListItem *)self isDeletable];
  *((unsigned char *)v5 + 68) = [(PXNavigationListDisplayCollectionListItem *)self isExpandable];
  v9 = [(PXNavigationListDisplayCollectionListItem *)self collection];
  uint64_t v10 = [v9 copyWithZone:a3];
  v11 = (void *)v5[11];
  v5[11] = v10;

  v5[12] = [(PXNavigationListDisplayCollectionListItem *)self indentationLevel];
  *((unsigned char *)v5 + 69) = [(PXNavigationListDisplayCollectionListItem *)self isExpanded];
  return v5;
}

- (PXNavigationListDisplayCollectionListItem)initWithIdentifier:(id)a3 displayCollectionList:(id)a4 title:(id)a5 itemCount:(int64_t)a6 containerIdentifier:(id)a7
{
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXNavigationListDisplayCollectionListItem;
  v14 = [(PXNavigationListItem *)&v18 initWithIdentifier:a3 title:a5 itemCount:a6 containerIdentifier:a7];
  if (v14)
  {
    if (objc_msgSend(v13, "px_isSharedAlbumsFolder")) {
      v15 = @"person.2.fill";
    }
    else {
      v15 = @"rectangle.stack";
    }
    objc_storeStrong((id *)&v14->_glyphImageName, v15);
    if (objc_msgSend(v13, "px_isTopLevelFolder")) {
      LOBYTE(v16) = 0;
    }
    else {
      int v16 = objc_msgSend(v13, "px_isProjectsFolder") ^ 1;
    }
    v14->_draggable = v16;
    v14->_reorderable = objc_msgSend(v13, "px_isTopLevelFolder") ^ 1;
    v14->_renamable = objc_msgSend(v13, "px_isRenamable");
    v14->_deletable = objc_msgSend(v13, "px_isDeletable");
    v14->_expandable = objc_msgSend(v13, "px_isFolder");
    objc_storeStrong((id *)&v14->_collection, a4);
  }

  return v14;
}

@end