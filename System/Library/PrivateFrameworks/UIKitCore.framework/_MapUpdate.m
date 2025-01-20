@interface _MapUpdate
+ (id)itemDeleteItemAtIndexPath:(id)a3 index:(int64_t)a4;
+ (id)itemDeleteSection:(int64_t)a3 deleteRange:(_NSRange)a4;
+ (id)itemInsertItemAtIndexPath:(id)a3 index:(int64_t)a4;
+ (id)itemInsertSection:(int64_t)a3 insertRange:(_NSRange)a4;
+ (id)itemMoveFromIndexIndexPath:(id)a3 toIndexPath:(id)a4 fromIndex:(int64_t)a5 toIndex:(int64_t)a6;
+ (id)itemMoveSection:(int64_t)a3 toSection:(int64_t)a4 fromRange:(_NSRange)a5 toRange:(_NSRange)a6;
- (BOOL)isDelete;
- (BOOL)isInsert;
- (BOOL)isMove;
- (BOOL)isSectionUpdate;
- (NSIndexPath)indexPath;
- (NSIndexPath)moveFromIndexPath;
- (NSIndexPath)moveToIndexPath;
- (_NSRange)deleteRange;
- (_NSRange)insertRange;
- (_NSRange)moveFromRange;
- (_NSRange)moveToRange;
- (id)description;
- (id)reverseUpdateItem;
- (int64_t)index;
- (int64_t)moveFromSection;
- (int64_t)moveToSection;
- (int64_t)section;
- (void)setDeleteRange:(_NSRange)a3;
- (void)setIndex:(int64_t)a3;
- (void)setIndexPath:(id)a3;
- (void)setInsertRange:(_NSRange)a3;
- (void)setIsDelete:(BOOL)a3;
- (void)setIsInsert:(BOOL)a3;
- (void)setIsMove:(BOOL)a3;
- (void)setIsSectionUpdate:(BOOL)a3;
- (void)setMoveFromIndexPath:(id)a3;
- (void)setMoveFromRange:(_NSRange)a3;
- (void)setMoveFromSection:(int64_t)a3;
- (void)setMoveToIndexPath:(id)a3;
- (void)setMoveToRange:(_NSRange)a3;
- (void)setMoveToSection:(int64_t)a3;
- (void)setSection:(int64_t)a3;
@end

@implementation _MapUpdate

+ (id)itemInsertSection:(int64_t)a3 insertRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v7 setIsInsert:1];
  [(_MapUpdate *)v7 setIsSectionUpdate:1];
  [(_MapUpdate *)v7 setSection:a3];
  -[_MapUpdate setInsertRange:](v7, "setInsertRange:", location, length);
  return v7;
}

+ (id)itemInsertItemAtIndexPath:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v6 setIsInsert:1];
  -[_MapUpdate setInsertRange:](v6, "setInsertRange:", a4, 1);
  [(_MapUpdate *)v6 setIndexPath:v5];
  uint64_t v7 = [v5 section];

  [(_MapUpdate *)v6 setSection:v7];
  [(_MapUpdate *)v6 setIndex:a4];
  return v6;
}

+ (id)itemDeleteSection:(int64_t)a3 deleteRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v7 setIsDelete:1];
  [(_MapUpdate *)v7 setIsSectionUpdate:1];
  [(_MapUpdate *)v7 setSection:a3];
  -[_MapUpdate setDeleteRange:](v7, "setDeleteRange:", location, length);
  return v7;
}

+ (id)itemDeleteItemAtIndexPath:(id)a3 index:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v6 setIsDelete:1];
  [(_MapUpdate *)v6 setIndexPath:v5];
  uint64_t v7 = [v5 section];

  [(_MapUpdate *)v6 setSection:v7];
  [(_MapUpdate *)v6 setIndex:a4];
  -[_MapUpdate setDeleteRange:](v6, "setDeleteRange:", a4, 1);
  return v6;
}

+ (id)itemMoveSection:(int64_t)a3 toSection:(int64_t)a4 fromRange:(_NSRange)a5 toRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a5.length;
  NSUInteger v9 = a5.location;
  v12 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v12 setIsMove:1];
  [(_MapUpdate *)v12 setIsSectionUpdate:1];
  [(_MapUpdate *)v12 setMoveFromSection:a3];
  [(_MapUpdate *)v12 setMoveToSection:a4];
  -[_MapUpdate setMoveFromRange:](v12, "setMoveFromRange:", v9, v8);
  -[_MapUpdate setMoveToRange:](v12, "setMoveToRange:", location, length);
  return v12;
}

+ (id)itemMoveFromIndexIndexPath:(id)a3 toIndexPath:(id)a4 fromIndex:(int64_t)a5 toIndex:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(_MapUpdate);
  [(_MapUpdate *)v11 setIsMove:1];
  [(_MapUpdate *)v11 setMoveFromIndexPath:v10];
  [(_MapUpdate *)v11 setMoveToIndexPath:v9];
  -[_MapUpdate setMoveFromRange:](v11, "setMoveFromRange:", a5, 1);
  -[_MapUpdate setMoveToRange:](v11, "setMoveToRange:", a6, 1);
  uint64_t v12 = [v10 section];

  [(_MapUpdate *)v11 setMoveFromSection:v12];
  uint64_t v13 = [v9 section];

  [(_MapUpdate *)v11 setMoveToSection:v13];
  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if ([(_MapUpdate *)self isSectionUpdate]) {
    [v3 appendString:@"S"];
  }
  if ([(_MapUpdate *)self isMove])
  {
    v4 = NSStringFromRange(self->_moveFromRange);
    id v5 = NSStringFromRange(self->_moveToRange);
    [v3 appendFormat:@"M(%@->%@)", v4, v5];
  }
  else if ([(_MapUpdate *)self isDelete])
  {
    v4 = NSStringFromRange(self->_deleteRange);
    [v3 appendFormat:@"D(%@)", v4];
  }
  else
  {
    if (![(_MapUpdate *)self isInsert]) {
      goto LABEL_10;
    }
    v4 = NSStringFromRange(self->_insertRange);
    [v3 appendFormat:@"I(%@)", v4];
  }

LABEL_10:
  return v3;
}

- (id)reverseUpdateItem
{
  if ([(_MapUpdate *)self isDelete])
  {
    if ([(_MapUpdate *)self isSectionUpdate])
    {
      int64_t v3 = [(_MapUpdate *)self section];
      uint64_t v4 = [(_MapUpdate *)self deleteRange];
      uint64_t v6 = +[_MapUpdate itemInsertSection:insertRange:](_MapUpdate, "itemInsertSection:insertRange:", v3, v4, v5);
LABEL_11:
      v19 = (void *)v6;
      goto LABEL_16;
    }
    id v10 = [(_MapUpdate *)self indexPath];
    uint64_t v11 = +[_MapUpdate itemInsertItemAtIndexPath:v10 index:[(_MapUpdate *)self index]];
LABEL_13:
    v19 = (void *)v11;
LABEL_14:

    goto LABEL_16;
  }
  if ([(_MapUpdate *)self isInsert])
  {
    if ([(_MapUpdate *)self isSectionUpdate])
    {
      int64_t v7 = [(_MapUpdate *)self section];
      uint64_t v8 = [(_MapUpdate *)self insertRange];
      uint64_t v6 = +[_MapUpdate itemDeleteSection:deleteRange:](_MapUpdate, "itemDeleteSection:deleteRange:", v7, v8, v9);
      goto LABEL_11;
    }
    id v10 = [(_MapUpdate *)self indexPath];
    uint64_t v11 = +[_MapUpdate itemDeleteItemAtIndexPath:v10 index:[(_MapUpdate *)self index]];
    goto LABEL_13;
  }
  if ([(_MapUpdate *)self isMove])
  {
    if ([(_MapUpdate *)self isSectionUpdate])
    {
      int64_t v12 = [(_MapUpdate *)self moveToSection];
      int64_t v13 = [(_MapUpdate *)self moveFromSection];
      uint64_t v14 = [(_MapUpdate *)self moveToRange];
      uint64_t v16 = v15;
      uint64_t v17 = [(_MapUpdate *)self moveFromRange];
      uint64_t v6 = +[_MapUpdate itemMoveSection:toSection:fromRange:toRange:](_MapUpdate, "itemMoveSection:toSection:fromRange:toRange:", v12, v13, v14, v16, v17, v18);
      goto LABEL_11;
    }
    id v10 = [(_MapUpdate *)self moveToIndexPath];
    v21 = [(_MapUpdate *)self moveFromIndexPath];
    v19 = +[_MapUpdate itemMoveFromIndexIndexPath:v10 toIndexPath:v21 fromIndex:[(_MapUpdate *)self moveToRange] toIndex:[(_MapUpdate *)self moveFromRange]];

    goto LABEL_14;
  }
  v19 = 0;
LABEL_16:
  return v19;
}

- (BOOL)isSectionUpdate
{
  return self->_isSectionUpdate;
}

- (void)setIsSectionUpdate:(BOOL)a3
{
  self->_isSectionUpdate = a3;
}

- (BOOL)isInsert
{
  return self->_isInsert;
}

- (void)setIsInsert:(BOOL)a3
{
  self->_isInsert = a3;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void)setIsDelete:(BOOL)a3
{
  self->_isDelete = a3;
}

- (BOOL)isMove
{
  return self->_isMove;
}

- (void)setIsMove:(BOOL)a3
{
  self->_isMove = a3;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (NSIndexPath)moveFromIndexPath
{
  return self->_moveFromIndexPath;
}

- (void)setMoveFromIndexPath:(id)a3
{
}

- (NSIndexPath)moveToIndexPath
{
  return self->_moveToIndexPath;
}

- (void)setMoveToIndexPath:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (_NSRange)insertRange
{
  NSUInteger length = self->_insertRange.length;
  NSUInteger location = self->_insertRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInsertRange:(_NSRange)a3
{
  self->_insertRange = a3;
}

- (_NSRange)deleteRange
{
  NSUInteger length = self->_deleteRange.length;
  NSUInteger location = self->_deleteRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDeleteRange:(_NSRange)a3
{
  self->_deleteRange = a3;
}

- (int64_t)moveFromSection
{
  return self->_moveFromSection;
}

- (void)setMoveFromSection:(int64_t)a3
{
  self->_moveFromSection = a3;
}

- (int64_t)moveToSection
{
  return self->_moveToSection;
}

- (void)setMoveToSection:(int64_t)a3
{
  self->_moveToSection = a3;
}

- (_NSRange)moveFromRange
{
  NSUInteger length = self->_moveFromRange.length;
  NSUInteger location = self->_moveFromRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMoveFromRange:(_NSRange)a3
{
  self->_moveFromRange = a3;
}

- (_NSRange)moveToRange
{
  NSUInteger length = self->_moveToRange.length;
  NSUInteger location = self->_moveToRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMoveToRange:(_NSRange)a3
{
  self->_moveToRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveToIndexPath, 0);
  objc_storeStrong((id *)&self->_moveFromIndexPath, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

@end