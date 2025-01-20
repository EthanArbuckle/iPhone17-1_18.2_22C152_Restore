@interface UISlidingBarStateRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)userInitiated;
- (UISlidingBarStateRequest)init;
- (double)leadingOffscreenWidth;
- (double)leadingWidth;
- (double)mainWidth;
- (double)rubberBandInset;
- (double)supplementaryOffscreenWidth;
- (double)supplementaryWidth;
- (double)trailingOffscreenWidth;
- (double)trailingWidth;
- (id)_closestEqualOrLargerState:(id)a3;
- (id)_closestEqualOrLargerState:(id)a3 returningDistance:(double *)a4;
- (id)_closestState:(id)a3;
- (id)_closestState:(id)a3 returningDistance:(double *)a4;
- (id)_matchingState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setLeadingOffscreenWidth:(double)a3;
- (void)setLeadingWidth:(double)a3;
- (void)setMainWidth:(double)a3;
- (void)setRubberBandInset:(double)a3;
- (void)setSupplementaryOffscreenWidth:(double)a3;
- (void)setSupplementaryWidth:(double)a3;
- (void)setTrailingOffscreenWidth:(double)a3;
- (void)setTrailingWidth:(double)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation UISlidingBarStateRequest

- (UISlidingBarStateRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)UISlidingBarStateRequest;
  result = [(UISlidingBarStateRequest *)&v3 init];
  if (result) {
    result->_userInitiated = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(UISlidingBarStateRequest *)self leadingWidth];
  objc_msgSend(v4, "setLeadingWidth:");
  [(UISlidingBarStateRequest *)self leadingOffscreenWidth];
  objc_msgSend(v4, "setLeadingOffscreenWidth:");
  [(UISlidingBarStateRequest *)self trailingWidth];
  objc_msgSend(v4, "setTrailingWidth:");
  [(UISlidingBarStateRequest *)self trailingOffscreenWidth];
  objc_msgSend(v4, "setTrailingOffscreenWidth:");
  [(UISlidingBarStateRequest *)self supplementaryWidth];
  objc_msgSend(v4, "setSupplementaryWidth:");
  [(UISlidingBarStateRequest *)self supplementaryOffscreenWidth];
  objc_msgSend(v4, "setSupplementaryOffscreenWidth:");
  [(UISlidingBarStateRequest *)self rubberBandInset];
  objc_msgSend(v4, "setRubberBandInset:");
  [(UISlidingBarStateRequest *)self mainWidth];
  objc_msgSend(v4, "setMainWidth:");
  objc_msgSend(v4, "setUserInitiated:", -[UISlidingBarStateRequest userInitiated](self, "userInitiated"));
  return v4;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)UISlidingBarStateRequest;
  objc_super v3 = [(UISlidingBarStateRequest *)&v11 description];
  id v4 = (void *)[v3 mutableCopy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UISlidingBarStateRequest_description__block_invoke;
  aBlock[3] = &unk_1E52E9A00;
  id v5 = v4;
  id v10 = v5;
  v6 = (void (**)(void *, __CFString *, double))_Block_copy(aBlock);
  v6[2](v6, @"leading", self->_leadingWidth);
  v6[2](v6, @"leadingOffscreen", self->_leadingOffscreenWidth);
  v6[2](v6, @"trailing", self->_trailingWidth);
  v6[2](v6, @"trailingOffscreen", self->_trailingOffscreenWidth);
  v6[2](v6, @"supplementary", self->_supplementaryWidth);
  v6[2](v6, @"supplementaryOffscreen", self->_supplementaryOffscreenWidth);
  if (self->_rubberBandInset != 0.0) {
    [v5 appendFormat:@" %@=%g", @"rubberBandInset", *(void *)&self->_rubberBandInset];
  }
  v6[2](v6, @"main", self->_mainWidth);
  if (self->_userInitiated) {
    [v5 appendString:@" userInitiated"];
  }
  id v7 = v5;

  return v7;
}

uint64_t __39__UISlidingBarStateRequest_description__block_invoke(uint64_t result, uint64_t a2, double a3)
{
  if (a3 > 0.0) {
    return [*(id *)(result + 32) appendFormat:@" %@Width=%g", a2, *(void *)&a3, v3, v4];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    [(UISlidingBarStateRequest *)self leadingWidth];
    double v7 = v6;
    [v5 leadingWidth];
    if (v7 != v8) {
      goto LABEL_12;
    }
    [(UISlidingBarStateRequest *)self leadingOffscreenWidth];
    double v10 = v9;
    [v5 leadingOffscreenWidth];
    if (v10 != v11) {
      goto LABEL_12;
    }
    [(UISlidingBarStateRequest *)self trailingWidth];
    double v13 = v12;
    [v5 trailingWidth];
    if (v13 != v14) {
      goto LABEL_12;
    }
    [(UISlidingBarStateRequest *)self trailingOffscreenWidth];
    double v16 = v15;
    [v5 trailingOffscreenWidth];
    if (v16 != v17) {
      goto LABEL_12;
    }
    [(UISlidingBarStateRequest *)self supplementaryWidth];
    double v19 = v18;
    [v5 supplementaryWidth];
    if (v19 != v20) {
      goto LABEL_12;
    }
    [(UISlidingBarStateRequest *)self supplementaryOffscreenWidth];
    double v22 = v21;
    [v5 supplementaryOffscreenWidth];
    if (v22 == v23
      && ([(UISlidingBarStateRequest *)self rubberBandInset],
          double v25 = v24,
          [v5 rubberBandInset],
          v25 == v26))
    {
      [(UISlidingBarStateRequest *)self mainWidth];
      double v28 = v27;
      [v5 mainWidth];
      BOOL v30 = v28 == v29;
    }
    else
    {
LABEL_12:
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  [(UISlidingBarStateRequest *)self leadingWidth];
  unint64_t v4 = (unint64_t)v3;
  [(UISlidingBarStateRequest *)self trailingWidth];
  unint64_t v6 = (unint64_t)v5 ^ v4;
  [(UISlidingBarStateRequest *)self supplementaryWidth];
  return v6 ^ (unint64_t)v7;
}

- (id)_matchingState:(id)a3
{
  double v8 = 0.0;
  uint64_t v3 = [(UISlidingBarStateRequest *)self _closestState:a3 returningDistance:&v8];
  unint64_t v4 = (void *)v3;
  if (v8 == 0.0) {
    double v5 = (void *)v3;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_closestState:(id)a3
{
  return [(UISlidingBarStateRequest *)self _closestState:a3 returningDistance:0];
}

- (id)_closestState:(id)a3 returningDistance:(double *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = 0;
    uint64_t v10 = *(void *)v19;
    double v11 = 1.79769313e308;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      double v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
      objc_msgSend(v13, "_absoluteDistanceFromRequest:", self, (void)v18);
      if (v14 < v11)
      {
        double v15 = v14;
        id v16 = v13;

        double v11 = v15;
        double v9 = v16;
        if (v15 == 0.0) {
          break;
        }
      }
      if (v8 == ++v12)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        double v15 = v11;
        id v16 = v9;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v16 = 0;
    double v15 = 1.79769313e308;
  }

  if (a4) {
    *a4 = v15;
  }

  return v16;
}

- (id)_closestEqualOrLargerState:(id)a3
{
  return [(UISlidingBarStateRequest *)self _closestEqualOrLargerState:a3 returningDistance:0];
}

- (id)_closestEqualOrLargerState:(id)a3 returningDistance:(double *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = 0;
    uint64_t v10 = *(void *)v22;
    double v11 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        double v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "_distanceFromRequest:", self, (void)v21);
        uint64_t v15 = *(void *)&v14;
        if (v14 == 0.0)
        {
          id v16 = v13;

          [v16 _absoluteDistanceFromRequest:self];
          double v11 = *(double *)&v15;
          double v9 = v16;
          if (v17 == 0.0) {
            goto LABEL_19;
          }
        }
        else if (v14 >= 0.0 && v14 < v11)
        {
          id v19 = v13;

          double v11 = *(double *)&v15;
          double v9 = v19;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v15 = *(void *)&v11;
      id v16 = v9;
    }
    while (v8);
  }
  else
  {
    id v16 = 0;
    uint64_t v15 = 0x7FEFFFFFFFFFFFFFLL;
  }
LABEL_19:

  if (a4) {
    *(void *)a4 = v15;
  }

  return v16;
}

- (double)leadingWidth
{
  return self->_leadingWidth;
}

- (void)setLeadingWidth:(double)a3
{
  self->_leadingWidth = a3;
}

- (double)leadingOffscreenWidth
{
  return self->_leadingOffscreenWidth;
}

- (void)setLeadingOffscreenWidth:(double)a3
{
  self->_leadingOffscreenWidth = a3;
}

- (double)trailingWidth
{
  return self->_trailingWidth;
}

- (void)setTrailingWidth:(double)a3
{
  self->_trailingWidth = a3;
}

- (double)trailingOffscreenWidth
{
  return self->_trailingOffscreenWidth;
}

- (void)setTrailingOffscreenWidth:(double)a3
{
  self->_trailingOffscreenWidth = a3;
}

- (double)supplementaryWidth
{
  return self->_supplementaryWidth;
}

- (void)setSupplementaryWidth:(double)a3
{
  self->_supplementaryWidth = a3;
}

- (double)supplementaryOffscreenWidth
{
  return self->_supplementaryOffscreenWidth;
}

- (void)setSupplementaryOffscreenWidth:(double)a3
{
  self->_supplementaryOffscreenWidth = a3;
}

- (double)rubberBandInset
{
  return self->_rubberBandInset;
}

- (void)setRubberBandInset:(double)a3
{
  self->_rubberBandInset = a3;
}

- (double)mainWidth
{
  return self->_mainWidth;
}

- (void)setMainWidth:(double)a3
{
  self->_mainWidth = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

@end