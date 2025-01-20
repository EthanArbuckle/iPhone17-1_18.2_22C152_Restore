@interface _UIFocusRegionMapEntry
- (CGRect)frame;
- (CGRect)originalRegionFrame;
- (NSMutableSet)occludingFrames;
- (UIColor)visualRepresentationColor;
- (_UIFocusRegionMapEntry)initWithFrame:(CGRect)a3 originalRegionFrame:(CGRect)a4;
- (_UIFocusRegionMapEntry)originalEntry;
- (_UIFocusRegionMapEntry)parentEntry;
- (id)_mapEntriesByOccludingWithFrame:(CGRect)a3;
- (id)_uniqueElementFromArray:(id)a3 forKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sliceWithFrame:(CGRect)a3;
- (int64_t)visualRepresentationPatternType;
- (void)_wasOccludedByFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOccludingFrames:(id)a3;
- (void)setOriginalEntry:(id)a3;
- (void)setOriginalRegionFrame:(CGRect)a3;
- (void)setParentEntry:(id)a3;
@end

@implementation _UIFocusRegionMapEntry

- (_UIFocusRegionMapEntry)initWithFrame:(CGRect)a3 originalRegionFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusRegionMapEntry;
  result = [(_UIFocusRegionMapEntry *)&v13 init];
  if (result)
  {
    result->_frame.origin.CGFloat x = v11;
    result->_frame.origin.CGFloat y = v10;
    result->_frame.size.CGFloat width = v9;
    result->_frame.size.CGFloat height = v8;
    result->_originalRegionFrame.origin.CGFloat x = x;
    result->_originalRegionFrame.origin.CGFloat y = y;
    result->_originalRegionFrame.size.CGFloat width = width;
    result->_originalRegionFrame.size.CGFloat height = height;
  }
  return result;
}

- (_UIFocusRegionMapEntry)originalEntry
{
  if (self->_originalEntry) {
    self = self->_originalEntry;
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  CGSize size = self->_frame.size;
  *(CGPoint *)(v4 + 32) = self->_frame.origin;
  *(CGSize *)(v4 + 48) = size;
  CGSize v6 = self->_originalRegionFrame.size;
  *(CGPoint *)(v4 + 64) = self->_originalRegionFrame.origin;
  *(CGSize *)(v4 + 80) = v6;
  objc_storeStrong((id *)(v4 + 16), self->_parentEntry);
  objc_storeStrong((id *)(v4 + 8), self->_originalEntry);
  objc_storeStrong((id *)(v4 + 24), self->_occludingFrames);
  return (id)v4;
}

- (id)_mapEntriesByOccludingWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIFocusRegionMapEntry *)self frame];
  v68.origin.double x = x;
  v68.origin.double y = y;
  v68.size.double width = width;
  v68.size.double height = height;
  CGRect v48 = CGRectIntersection(v47, v68);
  CGFloat v8 = v48.origin.x;
  CGFloat v9 = v48.origin.y;
  CGFloat v10 = v48.size.width;
  CGFloat v11 = v48.size.height;
  if (CGRectIsNull(v48))
  {
    id v12 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(_UIFocusRegionMapEntry *)self frame];
    v69.origin.double x = v13;
    v69.origin.double y = v14;
    v69.size.double width = v15;
    v69.size.double height = v16;
    v49.origin.double x = v8;
    v49.origin.double y = v9;
    v49.size.double width = v10;
    v49.size.double height = v11;
    if (!CGRectEqualToRect(v49, v69))
    {
      double v45 = height;
      v50.origin.double x = v8;
      v50.origin.double y = v9;
      v50.size.double width = v10;
      v50.size.double height = v11;
      double MinX = CGRectGetMinX(v50);
      [(_UIFocusRegionMapEntry *)self frame];
      double MinY = CGRectGetMinY(v51);
      v52.origin.double x = v8;
      v52.origin.double y = v9;
      v52.size.double width = v10;
      v52.size.double height = v11;
      double v44 = CGRectGetWidth(v52);
      v53.origin.double x = v8;
      v53.origin.double y = v9;
      v53.size.double width = v10;
      v53.size.double height = v11;
      double v40 = CGRectGetMinY(v53);
      [(_UIFocusRegionMapEntry *)self frame];
      double v39 = CGRectGetMinY(v54);
      [(_UIFocusRegionMapEntry *)self frame];
      double v34 = v17;
      [(_UIFocusRegionMapEntry *)self frame];
      double v33 = v18;
      v55.origin.double x = v8;
      v55.origin.double y = v9;
      v55.size.double width = v10;
      v55.size.double height = v11;
      double v19 = CGRectGetMinX(v55);
      [(_UIFocusRegionMapEntry *)self frame];
      double v20 = v19 - CGRectGetMinX(v56);
      [(_UIFocusRegionMapEntry *)self frame];
      double v42 = CGRectGetHeight(v57);
      v58.origin.double x = v8;
      v58.origin.double y = v9;
      v58.size.double width = v10;
      v58.size.double height = v11;
      double v32 = CGRectGetMinX(v58);
      v59.origin.double x = v8;
      v59.origin.double y = v9;
      v59.size.double width = v10;
      v59.size.double height = v11;
      double MaxY = CGRectGetMaxY(v59);
      v60.origin.double x = v8;
      v60.origin.double y = v9;
      v60.size.double width = v10;
      v60.size.double height = v11;
      double v43 = CGRectGetWidth(v60);
      [(_UIFocusRegionMapEntry *)self frame];
      double v38 = CGRectGetMaxY(v61);
      v62.origin.double x = v8;
      v62.origin.double y = v9;
      v62.size.double width = v10;
      v62.size.double height = v11;
      double v37 = CGRectGetMaxY(v62);
      v63.origin.double x = v8;
      v63.origin.double y = v9;
      v63.size.double width = v10;
      v63.size.double height = v11;
      double MaxX = CGRectGetMaxX(v63);
      [(_UIFocusRegionMapEntry *)self frame];
      double v29 = CGRectGetMinY(v64);
      [(_UIFocusRegionMapEntry *)self frame];
      double v41 = CGRectGetMaxX(v65);
      v66.origin.double x = v8;
      v66.origin.double y = v9;
      v66.size.double width = v10;
      v66.size.double height = v11;
      double v21 = CGRectGetMaxX(v66);
      [(_UIFocusRegionMapEntry *)self frame];
      double v22 = CGRectGetHeight(v67);
      if (v44 > 0.0 && v40 - v39 > 0.0)
      {
        v23 = -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", MinX, MinY, v44, v40 - v39);
        [v12 addObject:v23];
      }
      if (v20 > 0.0 && v42 > 0.0)
      {
        v24 = -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", v34, v33, v20, v42);
        [v12 addObject:v24];
      }
      double v25 = v41 - v21;
      double height = v45;
      if (v43 > 0.0 && v38 - v37 > 0.0)
      {
        v26 = -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", v32, MaxY, v43, v38 - v37);
        [v12 addObject:v26];
      }
      if (v25 > 0.0 && v22 > 0.0)
      {
        v27 = -[_UIFocusRegionMapEntry sliceWithFrame:](self, "sliceWithFrame:", MaxX, v29, v25, v22);
        [v12 addObject:v27];
      }
    }
    -[_UIFocusRegionMapEntry _wasOccludedByFrame:](self, "_wasOccludedByFrame:", x, y, width, height);
  }
  return v12;
}

- (id)sliceWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = (void *)[(_UIFocusRegionMapEntry *)self copy];
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  [v8 setParentEntry:self];
  [v8 setOccludingFrames:0];
  return v8;
}

- (void)_wasOccludedByFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = [(_UIFocusRegionMapEntry *)self parentEntry];
  objc_msgSend(v8, "_wasOccludedByFrame:", x, y, width, height);

  CGFloat v9 = [(_UIFocusRegionMapEntry *)self occludingFrames];

  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(_UIFocusRegionMapEntry *)self setOccludingFrames:v10];
  }
  id v12 = [(_UIFocusRegionMapEntry *)self occludingFrames];
  CGFloat v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v12 addObject:v11];
}

- (id)_uniqueElementFromArray:(id)a3 forKey:(id)a4
{
  unint64_t v4 = (uint64_t)a4 / 21;
  id v5 = a3;
  CGSize v6 = objc_msgSend(v5, "objectAtIndex:", v4 % objc_msgSend(v5, "count"));

  return v6;
}

- (UIColor)visualRepresentationColor
{
  if (qword_1EB25E6E0 != -1) {
    dispatch_once(&qword_1EB25E6E0, &__block_literal_global_212_0);
  }
  uint64_t v3 = _MergedGlobals_23_0;
  return (UIColor *)[(_UIFocusRegionMapEntry *)self _uniqueElementFromArray:v3 forKey:self];
}

- (int64_t)visualRepresentationPatternType
{
  if (qword_1EB25E6F0 != -1) {
    dispatch_once(&qword_1EB25E6F0, &__block_literal_global_214);
  }
  uint64_t v3 = [(_UIFocusRegionMapEntry *)self _uniqueElementFromArray:qword_1EB25E6E8 forKey:self];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(_UIFocusRegionMapEntry *)self frame];
  CGSize v6 = NSStringFromCGRect(v10);
  v7 = [v3 stringWithFormat:@"<%@: %p frame=%@>", v5, self, v6];

  return v7;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)originalRegionFrame
{
  double x = self->_originalRegionFrame.origin.x;
  double y = self->_originalRegionFrame.origin.y;
  double width = self->_originalRegionFrame.size.width;
  double height = self->_originalRegionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalRegionFrame:(CGRect)a3
{
  self->_originalRegionFrame = a3;
}

- (void)setOriginalEntry:(id)a3
{
}

- (_UIFocusRegionMapEntry)parentEntry
{
  return self->_parentEntry;
}

- (void)setParentEntry:(id)a3
{
}

- (NSMutableSet)occludingFrames
{
  return self->_occludingFrames;
}

- (void)setOccludingFrames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occludingFrames, 0);
  objc_storeStrong((id *)&self->_parentEntry, 0);
  objc_storeStrong((id *)&self->_originalEntry, 0);
}

@end