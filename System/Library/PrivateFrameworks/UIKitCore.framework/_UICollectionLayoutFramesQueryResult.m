@interface _UICollectionLayoutFramesQueryResult
+ (void)kindIndexKeyForKind:(uint64_t)a3 index:;
- (id)copyWithFrame:(double)a3 index:(double)a4;
- (id)copyWithIndex:(id *)result;
- (id)copyWithOffset:(double)a3;
- (id)copyWithOffset:(void *)a3 index:(double)a4 supplementaryEnrollmentIdentifier:(double)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithFrame:(void *)a3 adjustedForPinning:(void *)a4 index:(void *)a5 zIndex:(void *)a6 resultKind:(void *)a7 item:(void *)a8 auxillaryKind:(double)a9 supplementaryEnrollmentIdentifier:(double)a10;
- (id)supplementaryItem;
- (uint64_t)kindIndexKey;
- (void)auxillaryItem;
@end

@implementation _UICollectionLayoutFramesQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryEnrollmentIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (id)initWithFrame:(void *)a3 adjustedForPinning:(void *)a4 index:(void *)a5 zIndex:(void *)a6 resultKind:(void *)a7 item:(void *)a8 auxillaryKind:(double)a9 supplementaryEnrollmentIdentifier:(double)a10
{
  v12 = a1;
  if (a1)
  {
    if (a5 == (void *)2 && !a8)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel_initWithFrame_adjustedForPinning_index_zIndex_resultKind_item_auxillaryKind_supplementaryEnrollmentIdentifier_, v12, @"_UICollectionLayoutHelpers.m", 1277, @"Invalid parameter not satisfying: %@", @"supplementaryEnrollmentIdentifier" object file lineNumber description];
    }
    v27.receiver = v12;
    v27.super_class = (Class)_UICollectionLayoutFramesQueryResult;
    v24 = (id *)objc_msgSendSuper2(&v27, sel_init);
    v12 = v24;
    if (v24)
    {
      *((double *)v24 + 8) = a9;
      *((double *)v24 + 9) = a10;
      *((double *)v24 + 10) = a11;
      *((double *)v24 + 11) = a12;
      *((unsigned char *)v24 + 8) = a2;
      v24[2] = a3;
      v24[3] = a4;
      v24[4] = a5;
      objc_storeStrong(v24 + 5, a6);
      v12[7] = a7;
      objc_storeStrong(v12 + 6, a8);
    }
  }
  return v12;
}

- (id)copyWithFrame:(double)a3 index:(double)a4
{
  if (result)
  {
    v11 = result;
    v12 = [_UICollectionLayoutFramesQueryResult alloc];
    char v13 = *((unsigned char *)v11 + 8);
    id v14 = v11[3];
    id v15 = v11[4];
    id v17 = v11[6];
    id v16 = v11[7];
    id v18 = v11[5];
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v12->super.isa, v13, a2, v14, v15, v18, v16, v17, a3, a4, a5, a6);
  }
  return result;
}

+ (void)kindIndexKeyForKind:(uint64_t)a3 index:
{
  uint64_t v5 = self;
  if ([a2 length])
  {
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_kindIndexKeyForKind_index_, v5, @"_UICollectionLayoutHelpers.m", 1357, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:sel_kindIndexKeyForKind_index_, v5, @"_UICollectionLayoutHelpers.m", 1358, @"Invalid parameter not satisfying: %@", @"index>=0" object file lineNumber description];

LABEL_3:
  self;
  v6 = [_UICollectionLayoutFramesQueryResultElementIndexKey alloc];
  if (v6)
  {
    v12.receiver = v6;
    v12.super_class = (Class)_UICollectionLayoutFramesQueryResultElementIndexKey;
    id v7 = objc_msgSendSuper2(&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      v8[2] = a3;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)auxillaryItem
{
  if (a1)
  {
    if ((a1[4] & 0xFFFFFFFFFFFFFFFELL) == 2) {
      v2 = (void *)a1[5];
    }
    else {
      v2 = 0;
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)copyWithOffset:(void *)a3 index:(double)a4 supplementaryEnrollmentIdentifier:(double)a5
{
  if (result)
  {
    id v7 = result;
    double v8 = *((double *)result + 8);
    double v9 = *((double *)result + 9);
    CGFloat v10 = *((double *)result + 10);
    CGFloat v11 = *((double *)result + 11);
    double v12 = a4 + v8;
    double v13 = a5 + v9;
    v23.origin.x = v8;
    v23.origin.y = v9;
    v23.size.width = v10;
    v23.size.height = v11;
    double Width = CGRectGetWidth(v23);
    v24.origin.x = v8;
    v24.origin.y = v9;
    v24.size.width = v10;
    v24.size.height = v11;
    double Height = CGRectGetHeight(v24);
    id v16 = [_UICollectionLayoutFramesQueryResult alloc];
    char v17 = *((unsigned char *)v7 + 8);
    id v18 = v7[3];
    id v19 = v7[4];
    id v20 = v7[5];
    id v21 = v7[7];
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v16->super.isa, v17, a2, v18, v19, v20, v21, a3, v12, v13, Width, Height);
  }
  return result;
}

- (uint64_t)kindIndexKey
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](a1);
    if (!v2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_kindIndexKey, v1, @"_UICollectionLayoutHelpers.m", 1351, @"Invalid parameter not satisfying: %@", @"auxillaryItem" object file lineNumber description];
    }
    v3 = [v2 elementKind];
    +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, v3, v1[2]);
    uint64_t v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (id)supplementaryItem
{
  if (a1)
  {
    v2 = a1;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a1 = (id *)v2[5];
    }
    else {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGRect(self->_frame);
  id v7 = [NSNumber numberWithInteger:self->_index];
  double v8 = [NSNumber numberWithInteger:self->_zIndex];
  double v9 = [NSNumber numberWithInteger:self->_resultKind];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: frame=%@; index=%@; zIndex=%@ resultKind=%@",
    v5,
    self,
    v6,
    v7,
    v8,
  CGFloat v10 = v9);

  if (self->_supplementaryEnrollmentIdentifier) {
    objc_msgSend(v10, "stringByAppendingFormat:", @"; supplementaryEnrollmentIdentifier=%@>",
  }
      self->_supplementaryEnrollmentIdentifier);
  else {
  CGFloat v11 = [v10 stringByAppendingString:@">"];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UICollectionLayoutFramesQueryResult allocWithZone:a3];
  char isFrameAdjustedForPinning = self->_isFrameAdjustedForPinning;
  indedouble x = (void *)self->_index;
  zIndedouble x = (void *)self->_zIndex;
  resultKind = (void *)self->_resultKind;
  item = self->_item;
  supplementaryEnrollmentIdentifier = self->_supplementaryEnrollmentIdentifier;
  auxillaryKind = (void *)self->_auxillaryKind;
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v4->super.isa, isFrameAdjustedForPinning, index, zIndex, resultKind, item, auxillaryKind, supplementaryEnrollmentIdentifier, x, y, width, height);
}

- (id)copyWithOffset:(double)a3
{
  if (result)
  {
    v3 = result;
    double v4 = *((double *)result + 8);
    double v5 = *((double *)result + 9);
    CGFloat v6 = *((double *)result + 10);
    CGFloat v7 = *((double *)result + 11);
    double v8 = a2 + v4;
    double v9 = a3 + v5;
    v21.origin.double x = v4;
    v21.origin.double y = v5;
    v21.size.double width = v6;
    v21.size.double height = v7;
    double Width = CGRectGetWidth(v21);
    v22.origin.double x = v4;
    v22.origin.double y = v5;
    v22.size.double width = v6;
    v22.size.double height = v7;
    double Height = CGRectGetHeight(v22);
    double v12 = [_UICollectionLayoutFramesQueryResult alloc];
    char v13 = *((unsigned char *)v3 + 8);
    id v14 = v3[2];
    id v15 = v3[3];
    id v16 = v3[4];
    id v17 = v3[5];
    id v19 = v3[6];
    id v18 = v3[7];
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v12->super.isa, v13, v14, v15, v16, v17, v18, v19, v8, v9, Width, Height);
  }
  return result;
}

- (id)copyWithIndex:(id *)result
{
  if (result)
  {
    v3 = result;
    double v4 = [_UICollectionLayoutFramesQueryResult alloc];
    char v5 = *((unsigned char *)v3 + 8);
    id v6 = v3[3];
    id v7 = v3[4];
    id v9 = v3[6];
    id v8 = v3[7];
    id v10 = v3[5];
    double v11 = *((double *)v3 + 8);
    double v12 = *((double *)v3 + 9);
    double v13 = *((double *)v3 + 10);
    double v14 = *((double *)v3 + 11);
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v4->super.isa, v5, a2, v6, v7, v10, v8, v9, v11, v12, v13, v14);
  }
  return result;
}

@end