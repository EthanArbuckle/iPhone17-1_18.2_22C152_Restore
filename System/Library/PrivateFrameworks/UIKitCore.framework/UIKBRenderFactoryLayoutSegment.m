@interface UIKBRenderFactoryLayoutSegment
+ (id)segmentWithTraits:(id)a3;
- (BOOL)containsPoint:(CGPoint)a3 inRect:(CGRect)a4 withKeyplane:(id)a5;
- (BOOL)requireAllMatches;
- (BOOL)shouldOverlayTraitsForKey:(id)a3;
- (UIKBRenderFactoryLayoutSegment)initWithTraits:(id)a3;
- (UIKBRenderTraits)traits;
- (int)keyStates;
- (void)addLayoutRect:(CGRect)a3 asTriangle:(unint64_t)a4;
- (void)addRelativeLayoutRectFromEdge:(unint64_t)a3 ofCachedKey:(id)a4;
- (void)setKeyStates:(int)a3;
- (void)setRequireAllMatches:(BOOL)a3;
@end

@implementation UIKBRenderFactoryLayoutSegment

+ (id)segmentWithTraits:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTraits:v4];

  return v5;
}

- (UIKBRenderFactoryLayoutSegment)initWithTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactoryLayoutSegment;
  v6 = [(UIKBRenderFactoryLayoutSegment *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_traits, a3);
    v7->_rectCount = 0;
    v7->_edgeCount = 0;
  }

  return v7;
}

- (void)addLayoutRect:(CGRect)a3 asTriangle:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int rectCount = self->_rectCount;
  if (rectCount < 10
    || ([MEMORY[0x1E4F28B00] currentHandler],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 handleFailureInMethod:a2 object:self file:@"UIKBRenderFactory.m" lineNumber:191 description:@"Too many layout rects"], v13, int rectCount = self->_rectCount, rectCount <= 9))
  {
    v11 = (CGFloat *)((char *)self + 32 * rectCount);
    v11[2] = x;
    v11[3] = y;
    v11[4] = width;
    v11[5] = height;
    self->_triangleCorners[rectCount] = a4;
    ++self->_rectCount;
  }
}

- (void)addRelativeLayoutRectFromEdge:(unint64_t)a3 ofCachedKey:(id)a4
{
  id v10 = a4;
  int edgeCount = self->_edgeCount;
  if (edgeCount < 10
    || ([MEMORY[0x1E4F28B00] currentHandler],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        [v9 handleFailureInMethod:a2 object:self file:@"UIKBRenderFactory.m" lineNumber:201 description:@"Too many layout edges"], v9, int edgeCount = self->_edgeCount, edgeCount <= 9))
  {
    self->_edges[edgeCount] = a3;
    objc_storeStrong((id *)&self->_cachedKeyNames[self->_edgeCount], a4);
    ++self->_edgeCount;
  }
}

- (BOOL)shouldOverlayTraitsForKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dynamicLayout]
    && ([v3 displayType] == 21
     || [v3 displayType] == 18
     || [v3 displayType] == 3
     || [v3 displayType] == 5
     || [v3 displayType] == 26
     || [v3 displayType] == 4
     || [v3 displayType] == 53
     || [v3 displayType] == 32
     || [v3 displayType] == 33
     || [v3 interactionType] == 44
     || [v3 interactionType] == 41
     || [v3 interactionType] == 38
     || [v3 interactionType] == 9
     || [v3 interactionType] == 10
     || [v3 interactionType] == 14
     || [v3 interactionType] == 12
     || [v3 interactionType] == 17
     || ([v3 usesControlKeyAppearance] & 1) != 0);

  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3 inRect:(CGRect)a4 withKeyplane:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  double v7 = a3.y;
  double v8 = a3.x;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  int rectCount = self->_rectCount;
  double v55 = height;
  if (!rectCount)
  {
LABEL_14:
    char v21 = 1;
    if (!v10) {
      goto LABEL_50;
    }
    goto LABEL_15;
  }
  if (rectCount >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 24;
    do
    {
      double v14 = x + width * *(double *)((char *)self + v13 - 8);
      double v15 = y + height * *(double *)((char *)&self->super.isa + v13);
      double v16 = width * *(double *)((char *)&self->_rectCount + v13);
      double v17 = height * *(double *)((char *)&self->_rects[0].origin.x + v13);
      unint64_t v18 = self->_triangleCorners[v12];
      v66.origin.double x = v14;
      v66.origin.double y = v15;
      v66.size.double width = v16;
      v66.size.double height = v17;
      v64.double x = v8;
      v64.double y = v7;
      if (CGRectContainsPoint(v66, v64))
      {
        if (!v18) {
          goto LABEL_14;
        }
        if ((v18 & 4) != 0)
        {
          double v19 = v8 / v16;
LABEL_10:
          v68.origin.double x = v14;
          v68.origin.double y = v15;
          v68.size.double width = v16;
          v68.size.double height = v17;
          double v20 = v19 + (CGRectGetMaxY(v68) - v7) / v17;
          double height = v55;
          if (v20 <= 1.0) {
            goto LABEL_14;
          }
          goto LABEL_11;
        }
        if ((v18 & 8) != 0)
        {
          v67.origin.double x = v14;
          v67.origin.double y = v15;
          v67.size.double width = v16;
          v67.size.double height = v17;
          double v19 = (CGRectGetMaxX(v67) - v8) / v16;
          goto LABEL_10;
        }
      }
LABEL_11:
      ++v12;
      v13 += 32;
    }
    while (v12 < self->_rectCount);
  }
  char v21 = 0;
  if (v10)
  {
LABEL_15:
    v22 = [v10 cache];

    if (v22)
    {
      int edgeCount = self->_edgeCount;
      if (edgeCount)
      {
        if (edgeCount < 1)
        {
          char v46 = 0;
        }
        else
        {
          int v52 = self->_edgeCount;
          char v53 = v21;
          int v54 = rectCount;
          uint64_t v24 = 0;
          edges = self->_edges;
          cachedKeyNames = self->_cachedKeyNames;
          do
          {
            unint64_t v27 = edges[v24];
            v28 = cachedKeyNames[v24];
            v29 = [v10 cachedKeysByKeyName:v28];
            v30 = v29;
            if (v29
              && (long long v60 = 0u,
                  long long v61 = 0u,
                  long long v58 = 0u,
                  long long v59 = 0u,
                  (uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:v62 count:16]) != 0))
            {
              uint64_t v32 = v31;
              int v33 = 0;
              uint64_t v34 = *(void *)v59;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v59 != v34) {
                    objc_enumerationMutation(v30);
                  }
                  [*(id *)(*((void *)&v58 + 1) + 8 * i) frame];
                  CGFloat v37 = v36;
                  CGFloat MinY = v38;
                  double v41 = v40;
                  double v43 = v42;
                  switch(v27)
                  {
                    case 1uLL:
                      v69.origin.double x = x;
                      v69.origin.double y = y;
                      v69.size.double width = width;
                      v69.size.double height = height;
                      double MaxY = CGRectGetMaxY(v69);
                      v70.origin.double x = v37;
                      v70.origin.double y = MinY;
                      v70.size.double width = v41;
                      v70.size.double height = v43;
                      double v43 = MaxY - CGRectGetMinY(v70);
                      goto LABEL_29;
                    case 2uLL:
                      v73.origin.double x = x;
                      v73.origin.double y = y;
                      v73.size.double width = width;
                      v73.size.double height = height;
                      double MaxX = CGRectGetMaxX(v73);
                      v74.origin.double x = v37;
                      v74.origin.double y = MinY;
                      v74.size.double width = v41;
                      v74.size.double height = v43;
                      double v41 = MaxX - CGRectGetMinX(v74);
LABEL_29:
                      double height = v55;
                      break;
                    case 4uLL:
                      v71.origin.double x = x;
                      v71.origin.double y = y;
                      v71.size.double width = width;
                      v71.size.double height = height;
                      CGFloat MinY = CGRectGetMinY(v71);
                      v72.origin.double x = v37;
                      v72.origin.double y = MinY;
                      v72.size.double width = v41;
                      v72.size.double height = v43;
                      double v43 = CGRectGetMaxY(v72);
                      break;
                    case 8uLL:
                      v75.origin.double x = x;
                      v75.origin.double y = y;
                      v75.size.double width = width;
                      v75.size.double height = height;
                      v76.origin.double x = CGRectGetMinX(v75);
                      CGFloat v37 = v76.origin.x;
                      v76.origin.double y = MinY;
                      v76.size.double width = v41;
                      v76.size.double height = v43;
                      double v41 = CGRectGetMaxX(v76);
                      break;
                    default:
                      break;
                  }
                  v77.origin.double x = v37;
                  v77.origin.double y = MinY;
                  v77.size.double width = v41;
                  v77.size.double height = v43;
                  v65.double x = v8;
                  v65.double y = v7;
                  v33 |= CGRectContainsPoint(v77, v65);
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v58 objects:v62 count:16];
              }
              while (v32);

              cachedKeyNames = self->_cachedKeyNames;
              edges = self->_edges;
              if (v33)
              {
                char v46 = 1;
                goto LABEL_40;
              }
            }
            else
            {
            }
            ++v24;
          }
          while (v24 < self->_edgeCount);
          char v46 = 0;
LABEL_40:
          char v21 = v53;
          int rectCount = v54;
          int edgeCount = v52;
        }
      }
      else
      {
        char v46 = 1;
      }
      BOOL v47 = [(UIKBRenderFactoryLayoutSegment *)self requireAllMatches];
      if (edgeCount) {
        char v48 = v46;
      }
      else {
        char v48 = 0;
      }
      if (rectCount) {
        char v49 = v21;
      }
      else {
        char v49 = 0;
      }
      char v50 = v49 | v48;
      if (v47) {
        v21 &= v46;
      }
      else {
        char v21 = v50;
      }
    }
  }
LABEL_50:

  return v21;
}

- (UIKBRenderTraits)traits
{
  return self->_traits;
}

- (int)keyStates
{
  return self->_states;
}

- (void)setKeyStates:(int)a3
{
  self->_states = a3;
}

- (BOOL)requireAllMatches
{
  return self->_requireAllMatches;
}

- (void)setRequireAllMatches:(BOOL)a3
{
  self->_requireAllMatches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  uint64_t v3 = 0;
  BOOL v4 = &self->_cachedKeyNames[9];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -10);
}

@end