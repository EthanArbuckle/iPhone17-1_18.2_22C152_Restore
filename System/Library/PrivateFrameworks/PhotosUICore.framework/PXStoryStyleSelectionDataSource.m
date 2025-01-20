@interface PXStoryStyleSelectionDataSource
- (BOOL)isEqual:(id)a3;
- (NSArray)styleInfos;
- (PXStoryStyleDescriptor)styleInfoForCurrentStyle;
- (PXStoryStyleSelectionDataSource)init;
- (PXStoryStyleSelectionDataSource)initWithStyleInfos:(id)a3 indexOfCurrentStyle:(int64_t)a4 indexOfCustomStyle:(int64_t)a5;
- (id)infosForStylesInRange:(_NSRange)a3;
- (id)songForStyleAtIndex:(int64_t)a3;
- (id)styleInfoAtIndex:(int64_t)a3;
- (int64_t)indexOfCurrentStyle;
- (int64_t)indexOfCustomStyle;
- (int64_t)numberOfStyles;
@end

@implementation PXStoryStyleSelectionDataSource

- (void).cxx_destruct
{
}

- (NSArray)styleInfos
{
  return self->_styleInfos;
}

- (int64_t)indexOfCustomStyle
{
  return self->_indexOfCustomStyle;
}

- (int64_t)indexOfCurrentStyle
{
  return self->_indexOfCurrentStyle;
}

- (PXStoryStyleDescriptor)styleInfoForCurrentStyle
{
  int64_t v3 = [(PXStoryStyleSelectionDataSource *)self indexOfCurrentStyle];
  return (PXStoryStyleDescriptor *)[(PXStoryStyleSelectionDataSource *)self styleInfoAtIndex:v3];
}

- (id)styleInfoAtIndex:(int64_t)a3
{
  return [(NSArray *)self->_styleInfos objectAtIndexedSubscript:a3];
}

- (id)infosForStylesInRange:(_NSRange)a3
{
  return -[NSArray subarrayWithRange:](self->_styleInfos, "subarrayWithRange:", a3.location, a3.length);
}

- (id)songForStyleAtIndex:(int64_t)a3
{
  int64_t v3 = [(NSArray *)self->_styleInfos objectAtIndexedSubscript:a3];
  v4 = [v3 songResource];
  v5 = objc_msgSend(v4, "px_storyResourceSongAsset");

  return v5;
}

- (int64_t)numberOfStyles
{
  return [(NSArray *)self->_styleInfos count];
}

- (PXStoryStyleSelectionDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleSelectionDataSource.m", 42, @"%s is not available as initializer", "-[PXStoryStyleSelectionDataSource init]");

  abort();
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v17);
      v18 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
      [v14 handleFailureInMethod:a2, self, @"PXStoryStyleSelectionDataSource.m", 33, @"%@ should be an instance inheriting from %@, but it is %@", @"object", v16, v18 object file lineNumber description];
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v14 handleFailureInMethod:a2, self, @"PXStoryStyleSelectionDataSource.m", 33, @"%@ should be an instance inheriting from %@, but it is nil", @"object", v16 object file lineNumber description];
    }

LABEL_4:
    v7 = (NSArray *)v6[3];
    v8 = self->_styleInfos;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      v10 = v7;
      int v11 = [(NSArray *)v10 isEqual:v9];

      if (!v11) {
        goto LABEL_11;
      }
    }
    if (v6[1] == self->_indexOfCurrentStyle)
    {
      BOOL v12 = v6[2] == self->_indexOfCustomStyle;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (PXStoryStyleSelectionDataSource)initWithStyleInfos:(id)a3 indexOfCurrentStyle:(int64_t)a4 indexOfCustomStyle:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleSelectionDataSource;
  v9 = [(PXStoryStyleSelectionDataSource *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_indexOfCurrentStyle = a4;
    v9->_indexOfCustomStyle = a5;
    uint64_t v11 = [v8 copy];
    BOOL v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_styleInfos, v13);
  }
  return v10;
}

@end