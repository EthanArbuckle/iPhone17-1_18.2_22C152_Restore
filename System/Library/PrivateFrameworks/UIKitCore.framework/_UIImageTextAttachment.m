@interface _UIImageTextAttachment
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (id)_deriveAttribute:(id)a3 inStorage:(id)a4 atIndex:(int64_t)a5;
- (id)_imageAdaptedForTextAtIndex:(int64_t)a3 withAttributes:(id)a4 inContainer:(id)a5 sizeOnly:(BOOL)a6;
- (id)_initWithImage:(id)a3;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (void)setBounds:(CGRect)a3;
@end

@implementation _UIImageTextAttachment

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", 0, a4, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBounds:(CGRect)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_bounds = a3;
}

- (id)_initWithImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIImageTextAttachment;
  v5 = [(_UIImageTextAttachment *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIImageTextAttachment *)v5 setImage:v4];
  }

  return v6;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  if (*(unsigned char *)&self->_flags)
  {
    CGFloat x = self->_bounds.origin.x;
    double y = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
  }
  else
  {
    v7 = -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", 0, a3, a5, 1, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
    objc_super v8 = (double *)MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v7 size];
    CGFloat width = v10;
    CGFloat height = v12;
    if ([v7 hasBaseline])
    {
      [v7 baselineOffsetFromBottom];
      double y = y - v14;
    }
    CGFloat x = *v8;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)_imageAdaptedForTextAtIndex:(int64_t)a3 withAttributes:(id)a4 inContainer:(id)a5 sizeOnly:(BOOL)a6
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = [(_UIImageTextAttachment *)self image];
  v13 = [v11 textLayoutManager];
  double v14 = v13;
  if (v13)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke;
    v72[3] = &unk_1E530AEC8;
    id v73 = v13;
    v15 = __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke((uint64_t)v72);
    if (v15)
    {
      double v16 = v15;
      double v17 = [v15 textStorage];

      if (v17) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  double v18 = [v11 layoutManager];
  double v17 = [v18 textStorage];

LABEL_7:
  if ([v12 _isSymbolImage])
  {
    uint64_t v19 = *(void *)off_1E52D2040;
    if (v10) {
      [v10 objectForKeyedSubscript:v19];
    }
    else {
    v20 = [(_UIImageTextAttachment *)self _deriveAttribute:v19 inStorage:v17 atIndex:a3];
    }
    if (v20)
    {
      v21 = +[UIImageSymbolConfiguration configurationWithFont:v20];
      +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v21, 0);
      v64 = self;
      BOOL v22 = a6;
      int64_t v23 = a3;
      id v24 = v11;
      v25 = v17;
      v26 = v14;
      v28 = id v27 = v10;

      uint64_t v29 = [v12 imageByApplyingSymbolConfiguration:v28];

      id v10 = v27;
      double v14 = v26;
      double v17 = v25;
      id v11 = v24;
      a3 = v23;
      a6 = v22;
      self = v64;
      id v12 = (id)v29;
    }
  }
  if (!a6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke_6;
    aBlock[3] = &unk_1E530AEF0;
    id v12 = v12;
    id v67 = v12;
    id v68 = v10;
    v69 = self;
    id v70 = v17;
    int64_t v71 = a3;
    v30 = (void (**)(void *, void *))_Block_copy(aBlock);
    v31 = [v12 symbolConfiguration];
    v32 = [v12 _automaticSymbolConfiguration];
    v33 = v32;
    v63 = v17;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v34 = +[UIImageSymbolConfiguration unspecifiedConfiguration];
    }
    v35 = v34;

    v65 = v35;
    v36 = [v35 configurationByApplyingConfiguration:v31];

    uint64_t v37 = [v12 _effectiveRenderingModeWithSymbolConfiguration:v36];
    if ([v12 _isMultiColorSymbolImage])
    {
      if (v37 != 1)
      {
        if (v37 != 2) {
          goto LABEL_36;
        }
        if (![v36 _prefersMulticolor]) {
          goto LABEL_25;
        }
      }
      [v11 textView];
      v39 = id v38 = v10;
      v40 = [v39 tintColor];
      v41 = v30[2](v30, v40);

      id v10 = v38;
      if (v41)
      {
        v74 = @"tintColor";
        v75[0] = v41;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
        v43 = +[UIImageSymbolConfiguration _configurationWithNamedColorStyles:v42];

        v44 = [v12 configuration];
        v45 = [v43 configurationByApplyingConfiguration:v44];
        uint64_t v60 = [v12 imageWithConfiguration:v45];

        id v10 = v38;
        id v12 = (id)v60;
        double v17 = v63;
LABEL_39:

        goto LABEL_40;
      }
    }
    if (v37 == 2)
    {
LABEL_25:
      id v62 = v10;
      if (([v12 _isHierarchicalColorSymbolImage] & 1) == 0
        && ![v12 _isPaletteColorSymbolImage])
      {
        goto LABEL_37;
      }
      if (!v36) {
        goto LABEL_37;
      }
      if (!v36[7]) {
        goto LABEL_37;
      }
      v46 = [v11 textView];
      v47 = [v46 tintColor];
      v41 = v30[2](v30, v47);

      if (v41)
      {
        v61 = v30;
        v48 = [v36 _colors];
        v43 = (void *)[v48 mutableCopy];

        if ([v43 count])
        {
          unint64_t v49 = 0;
          do
          {
            v50 = [v43 objectAtIndexedSubscript:v49];
            v51 = +[UIColor tintColor];

            if (v50 == v51) {
              [v43 setObject:v41 atIndexedSubscript:v49];
            }
            ++v49;
          }
          while (v49 < [v43 count]);
        }
        uint64_t v52 = [v36 _configurationByReplacingColors:v43];

        uint64_t v53 = [v12 imageWithConfiguration:v52];

        v36 = (void *)v52;
        id v12 = (id)v53;
        id v10 = v62;
        double v17 = v63;
        v30 = v61;
      }
      else
      {
LABEL_37:
        v54 = [v11 textView];
        uint64_t v55 = [v54 tintColor];
        v56 = v30;
        v57 = (void *)v55;
        v58 = v56;
        v41 = v56[2](v56, (void *)v55);

        double v17 = v63;
        if (!v41)
        {
          id v10 = v62;
          v30 = v58;
          goto LABEL_40;
        }
        [v12 imageWithTintColor:v41 renderingMode:1];
        v43 = v12;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = v62;
        v30 = v58;
      }
      goto LABEL_39;
    }
LABEL_36:
    v41 = 0;
    double v17 = v63;
LABEL_40:
  }
  return v12;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  if (*(unsigned char *)&self->_flags)
  {
    CGFloat x = self->_bounds.origin.x;
    double y = self->_bounds.origin.y;
    CGFloat width = self->_bounds.size.width;
    CGFloat height = self->_bounds.size.height;
  }
  else
  {
    v6 = -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", a6, 0, a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
    v7 = (double *)MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v6 size];
    CGFloat width = v9;
    CGFloat height = v11;
    if ([v6 hasBaseline])
    {
      [v6 baselineOffsetFromBottom];
      double y = y - v13;
    }
    CGFloat x = *v7;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", a5, 0, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_deriveAttribute:(id)a3 inStorage:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 attribute:v7 atIndex:a5 effectiveRange:0];
  id v10 = (void *)v9;
  if (a5 >= 2 && !v9)
  {
    id v10 = [v8 attribute:v7 atIndex:a5 - 1 effectiveRange:0];
  }
  if (!v10)
  {
    unint64_t v11 = a5 + 1;
    if (v11 >= [v8 length])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [v8 attribute:v7 atIndex:v11 effectiveRange:0];
    }
  }

  return v10;
}

@end