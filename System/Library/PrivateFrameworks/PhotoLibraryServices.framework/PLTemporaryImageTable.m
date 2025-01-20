@interface PLTemporaryImageTable
- (BOOL)_writeBGRAThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)_writeCompressedThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5;
- (PLTemporaryImageTable)initWithWithPath:(id)a3 imageFormat:(unsigned __int16)a4;
- (id)imageForItemAtIndex:(unint64_t)a3;
- (unint64_t)_imageTableIndexForItemIndex:(unint64_t)a3;
- (void)_cleanup;
- (void)_positional_setThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6;
- (void)dealloc;
- (void)insertItemAtIndex:(unint64_t)a3;
- (void)removeItemAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4;
@end

@implementation PLTemporaryImageTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTablePath, 0);
  objc_storeStrong((id *)&self->_itemIndexToThumbEntryMapping, 0);
  objc_storeStrong((id *)&self->_imageTable, 0);
}

- (void)dealloc
{
  imageTablePath = self->_imageTablePath;
  self->_imageTablePath = 0;

  [(PLTemporaryImageTable *)self _cleanup];
  v4.receiver = self;
  v4.super_class = (Class)PLTemporaryImageTable;
  [(PLTemporaryImageTable *)&v4 dealloc];
}

- (void)reset
{
  [(PLTemporaryImageTable *)self _cleanup];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
  self->_itemIndexToThumbEntryMapping = v3;

  id v7 = [MEMORY[0x1E4F8B938] formatWithID:self->_imageFormatID];
  v5 = [v7 createTableWithPath:self->_imageTablePath readOnly:0 format:v7];
  imageTable = self->_imageTable;
  self->_imageTable = v5;
}

- (void)_cleanup
{
  itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
  self->_itemIndexToThumbEntryMapping = 0;

  imageTable = self->_imageTable;
  if (imageTable)
  {
    self->_imageTable = 0;

    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtPath:self->_imageTablePath error:0];
  }
  self->_nextTableEntryIndex = 0;
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_itemIndexToThumbEntryMapping count] > a3)
  {
    unint64_t v5 = [(PLTemporaryImageTable *)self _imageTableIndexForItemIndex:a3];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      [(PLThumbPersistenceManager *)self->_imageTable deleteEntryWithIdentifier:0 orIndex:v5 uuid:0];
    }
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    id v7 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)itemIndexToThumbEntryMapping replaceObjectAtIndex:a3 withObject:v7];
  }
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_itemIndexToThumbEntryMapping count] > a3)
  {
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)itemIndexToThumbEntryMapping insertObject:v6 atIndex:a3];
  }
}

- (id)imageForItemAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(PLTemporaryImageTable *)self _imageTableIndexForItemIndex:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v5 = [(PLThumbPersistenceManager *)self->_imageTable createImageWithIdentifier:0 orIndex:v4]) == 0)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = (CGImage *)v5;
    id v7 = (void *)DCIM_newPLImageWithCGImage();
    CGImageRelease(v6);
  }
  return v7;
}

- (unint64_t)_imageTableIndexForItemIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_itemIndexToThumbEntryMapping count] <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [(NSMutableArray *)self->_itemIndexToThumbEntryMapping objectAtIndex:a3];
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6) {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }

  return v7;
}

- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v13 = a3;
  while ([(NSMutableArray *)self->_itemIndexToThumbEntryMapping count] <= a4)
  {
    itemIndexToThumbEntryMapping = self->_itemIndexToThumbEntryMapping;
    unint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)itemIndexToThumbEntryMapping addObject:v7];
  }
  if ([(NSMutableArray *)self->_itemIndexToThumbEntryMapping count] <= a4)
  {
    v8 = 0;
LABEL_8:
    v11 = NSNumber;
    ++self->_nextTableEntryIndex;
    v10 = objc_msgSend(v11, "numberWithUnsignedInteger:");

    goto LABEL_9;
  }
  v8 = [(NSMutableArray *)self->_itemIndexToThumbEntryMapping objectAtIndex:a4];
  if (!v8) {
    goto LABEL_8;
  }
  v9 = [MEMORY[0x1E4F1CA98] null];

  v10 = v8;
  if (v8 == v9) {
    goto LABEL_8;
  }
LABEL_9:
  v12 = [[PLImageContainer alloc] initWithPLImage:v13];
  -[PLTemporaryImageTable _positional_setThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:](self, "_positional_setThumbnailsWithIdentifier:thumbnailIndex:image:assetUUID:", 0, [v10 unsignedIntegerValue], v12, 0);
  [(NSMutableArray *)self->_itemIndexToThumbEntryMapping replaceObjectAtIndex:a4 withObject:v10];
}

- (PLTemporaryImageTable)initWithWithPath:(id)a3 imageFormat:(unsigned __int16)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLTemporaryImageTable;
  unint64_t v7 = [(PLTemporaryImageTable *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_imageFormatID = a4;
    uint64_t v9 = [v6 copy];
    imageTablePath = v8->_imageTablePath;
    v8->_imageTablePath = (NSString *)v9;

    [(PLTemporaryImageTable *)v8 reset];
  }

  return v8;
}

- (void)_positional_setThumbnailsWithIdentifier:(id)a3 thumbnailIndex:(unint64_t)a4 image:(id)a5 assetUUID:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = self->_imageTable;
  char v10 = [(PLThumbPersistenceManager *)v9 isReadOnly];
  if (!v8 || (v10 & 1) != 0 || ![v8 CGImage]) {
    goto LABEL_13;
  }
  v11 = [(PLThumbPersistenceManager *)v9 format];
  if ([v11 thumbnailKind] == 4)
  {
  }
  else
  {
    objc_super v12 = [(PLThumbPersistenceManager *)v9 format];
    uint64_t v13 = [v12 thumbnailKind];

    if (v13 != 3)
    {
      if ([(PLTemporaryImageTable *)self _writeBGRAThumbnailDataForImage:v8 intoTable:v9 atIndex:a4])
      {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  if ([(PLTemporaryImageTable *)self _writeCompressedThumbnailDataForImage:v8 intoTable:v9 atIndex:a4])
  {
    goto LABEL_13;
  }
LABEL_10:
  v14 = PLThumbnailsGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15[0] = 67109120;
    v15[1] = [(PLThumbPersistenceManager *)v9 formatSideLen];
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to write temporary table image data in format with side len: %d", (uint8_t *)v15, 8u);
  }

LABEL_13:
}

- (BOOL)_writeBGRAThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v8, "entryLength"));
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v28[0] = *MEMORY[0x1E4F1DB28];
  v28[1] = v10;
  v11 = [v8 format];
  objc_super v12 = [v11 thumbnailSpecification];

  id v27 = v9;
  BOOL v13 = +[PLThumbnailUtilities performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:](PLThumbnailUtilities, "performSWDownscaleTo5551OnImage:withSpecification:destinationData:imageRect:bytesPerRow:", [v7 CGImage], v12, &v27, v28, 0);
  id v14 = v27;

  if (!v13) {
    goto LABEL_4;
  }
  [v8 formatSideLen];
  v15 = (void *)MEMORY[0x1E4F8B860];
  [v7 pixelSize];
  objc_msgSend(v15, "centeredRectForSourceSize:destinationSize:");
  unsigned int v17 = v16;
  unsigned int v19 = v18;
  id v20 = v14;
  uint64_t v21 = [v20 mutableBytes];
  uint64_t v22 = [v20 length] + v21;
  *(void *)(v22 - 20) = 0;
  *(void *)(v22 - 28) = 0;
  *(_DWORD *)(v22 - 12) = v19;
  *(_DWORD *)(v22 - 8) = v17;
  *(_DWORD *)(v22 - 4) = 0;
  if ([v8 writeEntryData:v20 toIndex:a5])
  {
    BOOL v23 = 1;
  }
  else
  {
LABEL_4:
    v24 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = [v8 formatSideLen];
      *(_DWORD *)buf = 67109120;
      int v30 = v25;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to write temporary table image data in format with side len: %d", buf, 8u);
    }

    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)_writeCompressedThumbnailDataForImage:(id)a3 intoTable:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [a3 CGImage];
  uint64_t v9 = [v7 format];
  long long v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  id v21 = 0;
  objc_super v12 = +[PLTableThumbnailEncoder encodeThumbnailImage:v8 toFormat:v9 withUUID:v11 error:&v21];
  id v13 = v21;

  if (!v12)
  {
    id v14 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = [v7 formatSideLen];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)BOOL v23 = v16;
      *(_WORD *)&v23[4] = 2112;
      *(void *)&v23[6] = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to encode temporary table image data in format with side len: %d, error: %@", buf, 0x12u);
    }
    goto LABEL_9;
  }
  id v14 = objc_msgSend(v12, "entryDataForEntryLength:", objc_msgSend(v7, "entryLength"));
  if (([v7 writeEntryData:v14 toIndex:a5] & 1) == 0)
  {
    unsigned int v17 = PLThumbnailsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [v14 length];
      int v19 = [v7 formatSideLen];
      *(_DWORD *)buf = 134218240;
      *(void *)BOOL v23 = v18;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v19;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to write encoded table image data of len: %ld in format with side len: %d", buf, 0x12u);
    }

LABEL_9:
    BOOL v15 = 0;
    goto LABEL_10;
  }
  BOOL v15 = 1;
LABEL_10:

  return v15;
}

@end