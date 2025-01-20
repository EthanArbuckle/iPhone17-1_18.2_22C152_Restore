@interface SiriSharedUIRectSet
- (BOOL)containsPoint:(CGPoint)a3;
- (NSSet)_rectValues;
- (SiriSharedUIRectSet)init;
- (SiriSharedUIRectSet)initWithFramesForViews:(id)a3 inCoordinateSpace:(id)a4;
- (SiriSharedUIRectSet)initWithRectValues:(id)a3;
@end

@implementation SiriSharedUIRectSet

- (SiriSharedUIRectSet)initWithRectValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIRectSet;
  v5 = [(SiriSharedUIRectSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rectValues = v5->_rectValues;
    v5->_rectValues = (NSSet *)v6;
  }
  return v5;
}

- (SiriSharedUIRectSet)initWithFramesForViews:(id)a3 inCoordinateSpace:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v14, "frame", (void)v35);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        v23 = [v14 superview];
        objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;

        v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v25, v27, v29, v31);
        [v8 addObject:v32];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v11);
  }

  v33 = [(SiriSharedUIRectSet *)self initWithRectValues:v8];
  return v33;
}

- (SiriSharedUIRectSet)init
{
  return [(SiriSharedUIRectSet *)self initWithRectValues:MEMORY[0x263EFFA68]];
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(SiriSharedUIRectSet *)self _rectValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) CGRectValue];
        v16.CGFloat x = x;
        v16.CGFloat y = y;
        if (CGRectContainsPoint(v17, v16))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSSet)_rectValues
{
  return self->_rectValues;
}

- (void).cxx_destruct
{
}

@end