@interface _UIContextMenuLayoutSection
- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange;
- (NSSet)hiddenSeparatorIndexPaths;
- (_UIContextMenuLayoutSection)initWithLayoutGroup:(id)a3 hiddenSeparatorIndexPaths:(id)a4;
- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4;
- (void)setHiddenSeparatorIndexPaths:(id)a3;
@end

@implementation _UIContextMenuLayoutSection

- (_UIContextMenuLayoutSection)initWithLayoutGroup:(id)a3 hiddenSeparatorIndexPaths:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIContextMenuLayoutSection;
  v7 = [(NSCollectionLayoutSection *)&v11 initWithLayoutGroup:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    hiddenSeparatorIndexPaths = v7->_hiddenSeparatorIndexPaths;
    v7->_hiddenSeparatorIndexPaths = (NSSet *)v8;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuLayoutSection;
  v4 = [(NSCollectionLayoutSection *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSSet *)self->_hiddenSeparatorIndexPaths copy];
    id v6 = (void *)v4[33];
    v4[33] = v5;
  }
  return v4;
}

- (id)_invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:(id)a3 interactionState:(id)a4 separatorOnly:(BOOL)a5
{
  return 0;
}

- (BOOL)_shouldInvalidateForScrollViewLayoutAdjustmentsChange
{
  return 0;
}

- (void)_enrichLayoutAttributes:(id)a3 interactionState:(id)a4
{
  id v10 = a3;
  uint64_t v5 = [v10 representedElementKind];
  if (v5 == @"kContextMenuItemSeparator")
  {
    id v6 = [(_UIContextMenuLayoutSection *)self hiddenSeparatorIndexPaths];
    v7 = [v10 indexPath];
    int v8 = [v6 containsObject:v7];

    v9 = v10;
    if (!v8) {
      goto LABEL_6;
    }
    [v10 setHidden:1];
  }
  else
  {
  }
  v9 = v10;
LABEL_6:
}

- (NSSet)hiddenSeparatorIndexPaths
{
  return self->_hiddenSeparatorIndexPaths;
}

- (void)setHiddenSeparatorIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end