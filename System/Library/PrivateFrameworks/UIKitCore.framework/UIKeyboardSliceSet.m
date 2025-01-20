@interface UIKeyboardSliceSet
+ (UIKeyboardSliceSet)sliceSetWithDictionaryRepresenation:(id)a3;
- (CGRect)endRect;
- (CGRect)startRect;
- (NSMutableDictionary)controlKeys;
- (NSMutableSet)slices;
- (NSString)sliceSetID;
- (UIKeyboardSliceSet)initWithSliceID:(id)a3;
- (double)leftWidth;
- (double)mergePoint;
- (double)rightWidth;
- (id)description;
- (void)addSlice:(id)a3;
- (void)setControlKeys:(id)a3;
- (void)setEndRect:(CGRect)a3;
- (void)setLeftWidth:(double)a3;
- (void)setMergePoint:(double)a3;
- (void)setRightWidth:(double)a3;
- (void)setSliceSetID:(id)a3;
- (void)setStartRect:(CGRect)a3;
@end

@implementation UIKeyboardSliceSet

- (UIKeyboardSliceSet)initWithSliceID:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardSliceSet;
  v6 = [(UIKeyboardSliceSet *)&v19 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
    slices = v6->_slices;
    v6->_slices = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_ssid, a3);
    v6->_mergePoint = 0.5;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    controlKeys = v6->_controlKeys;
    v6->_controlKeys = v9;

    v11 = v6->_controlKeys;
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:@"MoreIntlNames"];

    v13 = v6->_controlKeys;
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v13 setObject:v14 forKey:@"MoreIntlStarts"];

    v15 = v6->_controlKeys;
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v15 setObject:v16 forKey:@"MoreIntlEnds"];

    v17 = v6;
  }

  return v6;
}

+ (UIKeyboardSliceSet)sliceSetWithDictionaryRepresenation:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 valueForKey:@"SSID"];
  if (v4)
  {
    id v5 = [[UIKeyboardSliceSet alloc] initWithSliceID:v4];
    if (v5)
    {
      v6 = [v3 valueForKey:@"Start"];
      CGRect v38 = CGRectFromString(v6);
      -[UIKeyboardSliceSet setStartRect:](v5, "setStartRect:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);

      uint64_t v7 = [v3 valueForKey:@"End"];
      CGRect v39 = CGRectFromString(v7);
      -[UIKeyboardSliceSet setEndRect:](v5, "setEndRect:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);

      v8 = [v3 valueForKey:@"LeftWidth"];
      [v8 floatValue];
      [(UIKeyboardSliceSet *)v5 setLeftWidth:v9];

      v10 = [v3 valueForKey:@"RightWidth"];
      [v10 floatValue];
      [(UIKeyboardSliceSet *)v5 setRightWidth:v11];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v30 = v3;
      v12 = [v3 valueForKey:@"Slices"];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            v18 = [v17 valueForKey:@"Start"];
            CGRect v40 = CGRectFromString(v18);
            double x = v40.origin.x;
            double y = v40.origin.y;
            double width = v40.size.width;
            double height = v40.size.height;

            v23 = [v17 valueForKey:@"End"];
            CGRect v41 = CGRectFromString(v23);
            double v24 = v41.origin.x;
            double v25 = v41.origin.y;
            double v26 = v41.size.width;
            double v27 = v41.size.height;

            v28 = +[UIKeyboardTransitionSlice sliceWithStart:end:](UIKeyboardTransitionSlice, "sliceWithStart:end:", x, y, width, height, v24, v25, v26, v27);
            [(UIKeyboardSliceSet *)v5 addSlice:v28];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v14);
      }

      id v3 = v30;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addSlice:(id)a3
{
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"UIKeyboardSliceSet (%@) : %ld slices", self->_ssid, -[NSMutableSet count](self->_slices, "count")];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_slices;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\n\t[slice %d] %@", v7 + i, *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = (v7 + i);
    }
    while (v6);
  }

  return v3;
}

- (NSMutableSet)slices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sliceSetID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSliceSetID:(id)a3
{
}

- (CGRect)startRect
{
  objc_copyStruct(v6, &self->_startRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setStartRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_startRect, &v3, 32, 1, 0);
}

- (CGRect)endRect
{
  objc_copyStruct(v6, &self->_endRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setEndRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_endRect, &v3, 32, 1, 0);
}

- (double)leftWidth
{
  return self->_leftWidth;
}

- (void)setLeftWidth:(double)a3
{
  self->_leftWidth = a3;
}

- (double)rightWidth
{
  return self->_rightWidth;
}

- (void)setRightWidth:(double)a3
{
  self->_rightWidth = a3;
}

- (double)mergePoint
{
  return self->_mergePoint;
}

- (void)setMergePoint:(double)a3
{
  self->_mergePoint = a3;
}

- (NSMutableDictionary)controlKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setControlKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_slices, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end