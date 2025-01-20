@interface _UIASCIIArtFramesRenderer
- (CGRect)scaledRectForRect:(CGRect)a3 scaleSize:(CGSize)a4;
- (NSArray)frames;
- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3;
- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3 outputLineWidth:(double)a4;
- (double)outputLineWidth;
- (id)_normalizeFrames:(id)a3;
- (id)renderedLines;
- (id)visualDescription;
@end

@implementation _UIASCIIArtFramesRenderer

- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3 outputLineWidth:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIASCIIArtFramesRenderer;
  v7 = [(_UIASCIIArtFramesRenderer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(_UIASCIIArtFramesRenderer *)v7 _normalizeFrames:v6];
    frames = v8->_frames;
    v8->_frames = (NSArray *)v9;

    v8->_outputLineWidth = a4;
  }

  return v8;
}

- (_UIASCIIArtFramesRenderer)initWithFrames:(id)a3
{
  return [(_UIASCIIArtFramesRenderer *)self initWithFrames:a3 outputLineWidth:100.0];
}

- (id)visualDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(_UIASCIIArtFramesRenderer *)self renderedLines];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46___UIASCIIArtFramesRenderer_visualDescription__block_invoke;
  v7[3] = &unk_1E52E0B30;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (NSArray)frames
{
  return self->_frames;
}

- (double)outputLineWidth
{
  return self->_outputLineWidth;
}

- (id)renderedLines
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v75 = 0;
  v76 = (CGRect *)&v75;
  uint64_t v77 = 0x4010000000;
  v78 = &unk_186D7DBA7;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v79 = *MEMORY[0x1E4F1DB28];
  long long v80 = v3;
  frames = self->_frames;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke;
  v74[3] = &unk_1E52E0B58;
  v74[4] = &v75;
  [(NSArray *)frames enumerateObjectsUsingBlock:v74];
  [(_UIASCIIArtFramesRenderer *)self outputLineWidth];
  double v6 = v5 / CGRectGetWidth(v76[1]);
  -[_UIASCIIArtFramesRenderer scaledRectForRect:scaleSize:](self, "scaledRectForRect:scaleSize:", v76[1].origin.x, v76[1].origin.y, v76[1].size.width, v76[1].size.height, v6, v6 * 0.5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v16 = [(_UIASCIIArtFramesRenderer *)self frames];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v83 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * i) CGRectValue];
        -[_UIASCIIArtFramesRenderer scaledRectForRect:scaleSize:](self, "scaledRectForRect:scaleSize:");
        v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
        [v15 addObject:v20];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v70 objects:v83 count:16];
    }
    while (v17);
  }

  v86.origin.CGFloat x = v8;
  v86.origin.CGFloat y = v10;
  v86.size.CGFloat width = v12;
  v86.size.CGFloat height = v14;
  double MaxY = CGRectGetMaxY(v86);
  v87.origin.CGFloat x = v8;
  v87.origin.CGFloat y = v10;
  v87.size.CGFloat width = v12;
  v87.size.CGFloat height = v14;
  double MaxX = CGRectGetMaxX(v87);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v24 = (uint64_t)(MaxY + 1.0);
  if ((v24 & 0x8000000000000000) == 0)
  {
    uint64_t v25 = v24 + 1;
    do
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v23 addObject:v26];

      --v25;
    }
    while (v25);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2;
  aBlock[3] = &unk_1E52E0B80;
  id v48 = v23;
  id v69 = v48;
  v27 = (void (**)(void *, uint64_t, uint64_t, void))_Block_copy(aBlock);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v15;
  uint64_t v28 = [obj countByEnumeratingWithState:&v64 objects:v82 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v65 != v29) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * j) CGRectValue];
        CGFloat x = v88.origin.x;
        CGFloat y = v88.origin.y;
        CGFloat width = v88.size.width;
        CGFloat height = v88.size.height;
        double MinY = CGRectGetMinY(v88);
        v89.origin.CGFloat x = x;
        v89.origin.CGFloat y = y;
        v89.size.CGFloat width = width;
        v89.size.CGFloat height = height;
        uint64_t v36 = (uint64_t)MinY;
        uint64_t v37 = (uint64_t)CGRectGetMaxY(v89);
        uint64_t v38 = (uint64_t)MinY - v37;
        if ((uint64_t)MinY <= v37)
        {
          uint64_t v39 = 0;
          do
          {
            if (v39 && v38 + v39)
            {
              v90.origin.CGFloat x = x;
              v90.origin.CGFloat y = y;
              v90.size.CGFloat width = width;
              v90.size.CGFloat height = height;
              double MinX = CGRectGetMinX(v90);
              v91.origin.CGFloat x = x;
              v91.origin.CGFloat y = y;
              v91.size.CGFloat width = width;
              v91.size.CGFloat height = height;
              double v41 = CGRectGetMaxX(v91);
              v27[2](v27, (uint64_t)MinX, 1, v36 + v39);
              v27[2](v27, (uint64_t)v41, 1, v36 + v39);
            }
            else
            {
              v92.origin.CGFloat x = x;
              v92.origin.CGFloat y = y;
              v92.size.CGFloat width = width;
              v92.size.CGFloat height = height;
              CGRectGetMinX(v92);
              v93.origin.CGFloat x = x;
              v93.origin.CGFloat y = y;
              v93.size.CGFloat width = width;
              v93.size.CGFloat height = height;
              CGRectGetMaxX(v93);
              ((void (*)(void (**)(void *, uint64_t, uint64_t, void)))v27[2])(v27);
            }
            ++v39;
          }
          while (v38 + v39 != 1);
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v64 objects:v82 count:16];
    }
    while (v28);
  }

  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v49 = v48;
  uint64_t v42 = [v49 countByEnumeratingWithState:&v60 objects:v81 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(v49);
        }
        v45 = *(void **)(*((void *)&v60 + 1) + 8 * k);
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x3032000000;
        v57 = __Block_byref_object_copy__29;
        v58 = __Block_byref_object_dispose__29;
        id v59 = [&stru_1ED0E84C0 stringByPaddingToLength:(uint64_t)(MaxX + 1.0) withString:@" " startingAtIndex:0];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_24;
        v51[3] = &unk_1E52E0BF0;
        id v52 = &__block_literal_global_99;
        v53 = &v54;
        [v45 enumerateObjectsUsingBlock:v51];
        [v50 addObject:v55[5]];

        _Block_object_dispose(&v54, 8);
      }
      uint64_t v42 = [v49 countByEnumeratingWithState:&v60 objects:v81 count:16];
    }
    while (v42);
  }

  _Block_object_dispose(&v75, 8);
  return v50;
}

- (CGRect)scaledRectForRect:(CGRect)a3 scaleSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v10 = a4.width * CGRectGetMinX(a3);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.double width = v7;
  v18.size.double height = v6;
  double v11 = height * CGRectGetMinY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.double width = v7;
  v19.size.double height = v6;
  double v12 = width * CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = v7;
  v20.size.double height = v6;
  double v13 = height * CGRectGetHeight(v20);
  CGFloat v14 = v10;
  double v15 = v11;
  double v16 = v12;
  return NSIntegralRectWithOptions(*(NSRect *)&v14, 0xF0000uLL);
}

- (id)_normalizeFrames:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3010000000;
  CGFloat v14 = &unk_186D7DBA7;
  long long v15 = *MEMORY[0x1E4F1DAD8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke;
  v10[3] = &unk_1E52E0B58;
  v10[4] = &v11;
  [v3 enumerateObjectsUsingBlock:v10];
  long long v16 = *((_OWORD *)v12 + 2);
  _Block_object_dispose(&v11, 8);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke_2;
  v7[3] = &unk_1E52E0C18;
  long long v9 = v16;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void).cxx_destruct
{
}

@end