@interface _TVNeedsMoreContentEvaluator
- (IKViewElement)viewElement;
- (UIScrollView)scrollView;
- (_TVNeedsMoreContentEvaluator)init;
- (_TVNeedsMoreContentEvaluator)initWithScrollView:(id)a3 axis:(int64_t)a4;
- (double)threshold;
- (int64_t)axis;
- (int64_t)state;
- (void)evaluateForState:(int64_t)a3;
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)setThreshold:(double)a3;
- (void)setViewElement:(id)a3;
@end

@implementation _TVNeedsMoreContentEvaluator

- (_TVNeedsMoreContentEvaluator)init
{
  return 0;
}

- (_TVNeedsMoreContentEvaluator)initWithScrollView:(id)a3 axis:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TVNeedsMoreContentEvaluator;
  v8 = [(_TVNeedsMoreContentEvaluator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scrollView, a3);
    v9->_axis = a4;
  }

  return v9;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
  v4 = [(_TVNeedsMoreContentEvaluator *)self viewElement];
  v5 = [v4 attributes];
  id v7 = [v5 objectForKeyedSubscript:@"needsMoreThreshold"];

  [v7 doubleValue];
  [(_TVNeedsMoreContentEvaluator *)self setThreshold:fmax(v6, 1.0)];
}

- (void)evaluateForState:(int64_t)a3
{
  v5 = [(_TVNeedsMoreContentEvaluator *)self scrollView];
  id v42 = [v5 window];

  if (v42)
  {
    double v6 = [(_TVNeedsMoreContentEvaluator *)self viewElement];

    if (v6)
    {
      int64_t v7 = [(_TVNeedsMoreContentEvaluator *)self state];
      if (a3 == 1 && !v7)
      {
        [(_TVNeedsMoreContentEvaluator *)self setState:1];
        goto LABEL_13;
      }
      int64_t v8 = [(_TVNeedsMoreContentEvaluator *)self state];
      if (a3 == 2 && v8 == 1)
      {
        [v42 bounds];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        v17 = [(_TVNeedsMoreContentEvaluator *)self scrollView];
        objc_msgSend(v42, "convertRect:toView:", v17, v10, v12, v14, v16);
        uint64_t v19 = v18;
        uint64_t v21 = v20;
        uint64_t v23 = v22;
        uint64_t v25 = v24;

        v26 = [(_TVNeedsMoreContentEvaluator *)self scrollView];
        [v26 contentSize];
        double v28 = v27;
        double v30 = v29;

        int64_t v31 = [(_TVNeedsMoreContentEvaluator *)self axis];
        uint64_t v32 = v19;
        uint64_t v33 = v21;
        uint64_t v34 = v23;
        uint64_t v35 = v25;
        if (v31 == 1)
        {
          double v36 = v28 - CGRectGetMaxX(*(CGRect *)&v32);
          [(_TVNeedsMoreContentEvaluator *)self threshold];
          if (v36 > v14 * v37) {
            goto LABEL_13;
          }
        }
        else
        {
          double v38 = v30 - CGRectGetMaxY(*(CGRect *)&v32);
          [(_TVNeedsMoreContentEvaluator *)self threshold];
          if (v38 > v16 * v39) {
            goto LABEL_13;
          }
        }
        [(_TVNeedsMoreContentEvaluator *)self setState:2];
        v40 = [(_TVNeedsMoreContentEvaluator *)self viewElement];
        v41 = [(_TVNeedsMoreContentEvaluator *)self scrollView];
        objc_msgSend(v40, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"needsmore", 0, 0, 0, v41, 0);
      }
    }
  }
LABEL_13:
}

- (void)reset
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end