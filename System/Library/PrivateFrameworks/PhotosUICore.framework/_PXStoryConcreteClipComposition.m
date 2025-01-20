@interface _PXStoryConcreteClipComposition
- (BOOL)clipFramesExtendToBounds;
- (NSString)label;
- (_PXStoryConcreteClipComposition)init;
- (_PXStoryConcreteClipComposition)initWithNumberOfClips:(int64_t)a3 primaryEdge:(unsigned int)a4 splitRatio:(double)a5 secondaryEdge:(unsigned int)a6 splitRatio:(double)a7 label:(id)a8;
- (_PXStoryConcreteClipComposition)initWithOneUp;
- (_PXStoryConcreteClipComposition)initWithSingleAssetSplitAxis:(int64_t)a3 splitRatio:(double)a4 label:(id)a5;
- (_PXStoryConcreteClipComposition)initWithTwoUpEdge:(unsigned int)a3 splitRatio:(double)a4 label:(id)a5;
- (const)clipAssetIndexes;
- (const)dividerAxes;
- (double)mainDividerSplitRatio;
- (double)primarySplitRatio;
- (id)description;
- (int64_t)mainDividerAxis;
- (int64_t)numberOfAssets;
- (int64_t)numberOfClips;
- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4;
@end

@implementation _PXStoryConcreteClipComposition

- (void).cxx_destruct
{
}

- (double)primarySplitRatio
{
  return self->_primarySplitRatio;
}

- (int64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)mainDividerAxis
{
  return self->_mainDividerAxis;
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- (double)mainDividerSplitRatio
{
  return self->_splitRatios[0];
}

- (const)clipAssetIndexes
{
  return self->_clipAssetIndexes;
}

- (BOOL)clipFramesExtendToBounds
{
  return 1;
}

- (void)getClipFrames:(CGRect *)a3 forContext:(id *)a4
{
}

- (const)dividerAxes
{
  return self->_dividerAxes;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PXStoryConcreteClipComposition *)self label];
  v7 = (void *)[v3 initWithFormat:@"<%@: %p; %@>", v5, self, v6];

  return v7;
}

- (_PXStoryConcreteClipComposition)initWithNumberOfClips:(int64_t)a3 primaryEdge:(unsigned int)a4 splitRatio:(double)a5 secondaryEdge:(unsigned int)a6 splitRatio:(double)a7 label:(id)a8
{
  id v15 = a8;
  if (a3 >= 4)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXStoryClipComposition.m", 231, @"Invalid parameter not satisfying: %@", @"numberOfClips <= 3" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_PXStoryConcreteClipComposition;
  v16 = [(_PXStoryConcreteClipComposition *)&v19 init];
  if (v16)
  {
    v16->_numberOfClips = a3;
    v16->_numberOfAssets = a3;
    v16->_edges[0] = a4;
    v16->_edges[1] = a6;
    v16->_splitRatios[0] = a5;
    v16->_splitRatios[1] = a7;
    PXRectEdgeAxis();
  }

  return 0;
}

- (_PXStoryConcreteClipComposition)initWithSingleAssetSplitAxis:(int64_t)a3 splitRatio:(double)a4 label:(id)a5
{
  id v5 = a5;
  PXAxisTransposed();
}

- (_PXStoryConcreteClipComposition)initWithTwoUpEdge:(unsigned int)a3 splitRatio:(double)a4 label:(id)a5
{
  return [(_PXStoryConcreteClipComposition *)self initWithNumberOfClips:2 primaryEdge:*(void *)&a3 splitRatio:0 secondaryEdge:a5 splitRatio:a4 label:0.0];
}

- (_PXStoryConcreteClipComposition)initWithOneUp
{
  return [(_PXStoryConcreteClipComposition *)self initWithNumberOfClips:1 primaryEdge:0 splitRatio:0 secondaryEdge:@"1-Up" splitRatio:0.0 label:0.0];
}

- (_PXStoryConcreteClipComposition)init
{
  return [(_PXStoryConcreteClipComposition *)self initWithNumberOfClips:0 primaryEdge:0 splitRatio:0 secondaryEdge:@"Undefined" splitRatio:0.0 label:0.0];
}

@end