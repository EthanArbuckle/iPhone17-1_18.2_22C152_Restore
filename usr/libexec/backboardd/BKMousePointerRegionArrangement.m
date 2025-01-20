@interface BKMousePointerRegionArrangement
- (BKMousePointerRegionArrangement)initWithCoalitionIdentifier:(id)a3;
- (CGPoint)convertFromGlobalPoint:(CGPoint)a3 toRegion:(id)a4;
- (CGPoint)convertToGlobalPoint:(CGPoint)a3 fromRegion:(id)a4;
- (CGPoint)denormalizedAbsoluteGlobalPosition:(CGPoint)a3;
- (CGPoint)normalizedGlobalPosition:(CGPoint)a3;
- (CGRect)_frameForRegion:(id)a3;
- (NSArray)regions;
- (NSString)coalitionIdentifier;
- (NSString)description;
- (id)_initWithCopyOf:(id)a3;
- (id)_layoutDescriptorForRegion:(id)a3;
- (id)closestRegionForGlobalPoint:(CGPoint)a3 returningClosestContainingPoint:(CGPoint *)a4 returningEdgeMask:(unsigned __int8 *)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)regionForDisplayUUID:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKMousePointerRegionArrangement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionToLayoutDescriptor, 0);
  objc_storeStrong((id *)&self->_regionToComputedFrame, 0);

  objc_storeStrong((id *)&self->_coalitionIdentifier, 0);
}

- (NSString)coalitionIdentifier
{
  return self->_coalitionIdentifier;
}

- (id)_layoutDescriptorForRegion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)self->_regionToLayoutDescriptor objectForKey:v5];
  if (!v6)
  {
    v9 = +[NSString stringWithFormat:@"Layout descriptors and regions must always be paired"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v13 = 138544642;
      v14 = v10;
      __int16 v15 = 2114;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      CFStringRef v20 = @"BKMousePointerRegionArrangement.m";
      __int16 v21 = 1024;
      int v22 = 293;
      __int16 v23 = 2114;
      v24 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009AA98);
  }
  v7 = (void *)v6;

  return v7;
}

- (CGRect)_frameForRegion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v23 = +[NSString stringWithFormat:@"Requesting frame for a nil region"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      int v31 = 138544642;
      v32 = v24;
      __int16 v33 = 2114;
      v34 = v26;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      CFStringRef v38 = @"BKMousePointerRegionArrangement.m";
      __int16 v39 = 1024;
      int v40 = 282;
      __int16 v41 = 2114;
      v42 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v31, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009AC50);
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(NSDictionary *)self->_regionToComputedFrame objectForKey:v5];
  if (!v7)
  {
    v27 = +[NSString stringWithFormat:@"Requesting frame for a region not part of this arrangement"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      int v31 = 138544642;
      v32 = v28;
      __int16 v33 = 2114;
      v34 = v30;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      CFStringRef v38 = @"BKMousePointerRegionArrangement.m";
      __int16 v39 = 1024;
      int v40 = 284;
      __int16 v41 = 2114;
      v42 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v31, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009AD3CLL);
  }
  v8 = (void *)v7;
  BSRectFromValue();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double x = self->_baseTranslation.x;
  double y = self->_baseTranslation.y;

  double v19 = x + v10;
  double v20 = v12 + y;
  double v21 = v14;
  double v22 = v16;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009AE40;
  v11[3] = &unk_1000F8E08;
  id v12 = v6;
  double v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v6;
  [v10 appendProem:self block:v11];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (CGPoint)convertFromGlobalPoint:(CGPoint)a3 toRegion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(BKMousePointerRegionArrangement *)self _frameForRegion:a4];
  double v7 = x - v6;
  double v9 = y - v8;
  result.double y = v9;
  result.double x = v7;
  return result;
}

- (CGPoint)convertToGlobalPoint:(CGPoint)a3 fromRegion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(BKMousePointerRegionArrangement *)self _frameForRegion:a4];
  double v7 = x + v6;
  double v9 = y + v8;
  result.double y = v9;
  result.double x = v7;
  return result;
}

- (CGPoint)normalizedGlobalPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double MaxX = CGRectGetMaxX(self->_globalBounds);
  double MinX = CGRectGetMinX(self->_globalBounds);
  if (MinX < x) {
    double MinX = x;
  }
  if (MaxX <= MinX) {
    double v8 = MaxX;
  }
  else {
    double v8 = MinX;
  }
  v16.origin.double x = self->_globalBounds.origin.x;
  v16.origin.double y = self->_globalBounds.origin.y;
  double width = self->_globalBounds.size.width;
  v16.size.height = self->_globalBounds.size.height;
  v16.size.double width = width;
  double MaxY = CGRectGetMaxY(v16);
  double MinY = CGRectGetMinY(self->_globalBounds);
  if (MinY < y) {
    double MinY = y;
  }
  if (MaxY <= MinY) {
    double v12 = MaxY;
  }
  else {
    double v12 = MinY;
  }
  double v13 = v8 / width;
  double v14 = v12 / self->_globalBounds.size.height;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)denormalizedAbsoluteGlobalPosition:(CGPoint)a3
{
  CGFloat y = a3.y;
  __asm { FMOV            V1.2D, #1.0 }
  float64x2_t v9 = vmulq_f64(vminnmq_f64(vmaxnmq_f64((float64x2_t)a3, (float64x2_t)0), _Q1), (float64x2_t)self->_globalBounds.size);
  double v10 = v9.f64[1];
  result.double x = v9.f64[0];
  result.CGFloat y = v10;
  return result;
}

- (id)closestRegionForGlobalPoint:(CGPoint)a3 returningClosestContainingPoint:(CGPoint *)a4 returningEdgeMask:(unsigned __int8 *)a5
{
  double y = a3.y;
  double x = a3.x;
  double v56 = CGPointZero.x;
  double v57 = CGPointZero.y;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  double v10 = self->_regionToComputedFrame;
  NSUInteger v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v11)
  {
    NSUInteger v12 = v11;
    v53 = a4;
    v54 = a5;
    unsigned __int8 v13 = 0;
    double v14 = 0;
    uint64_t v15 = *(void *)v59;
    double v55 = y;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v59 != v15) {
          objc_enumerationMutation(v10);
        }
        __int16 v17 = *(void **)(*((void *)&v58 + 1) + 8 * v16);
        [(BKMousePointerRegionArrangement *)self _frameForRegion:v17];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        [v17 cornerRadius];
        double v27 = v26;
        double v28 = v26 + v21;
        if (y >= v26 + v21)
        {
          double v21 = v21 + v25;
          double v35 = v21 - v26;
          if (y <= v21 - v26)
          {
            if (x < v19)
            {
              char v34 = 2;
              goto LABEL_34;
            }
            double v19 = v19 + v23;
            if (x > v19)
            {
              char v34 = 8;
LABEL_34:
              double v21 = y;
              if (v14) {
                goto LABEL_44;
              }
              goto LABEL_45;
            }
            goto LABEL_39;
          }
          double v36 = v26 + v19;
          if (x >= v26 + v19)
          {
            double v19 = v19 + v23;
            double v44 = v19 - v26;
            if (x <= v19 - v26)
            {
              double y = v55;
              if (v55 > v21)
              {
                char v34 = 4;
                goto LABEL_40;
              }
LABEL_39:
              char v34 = 0;
              double v21 = y;
LABEL_40:
              double v19 = x;
              if (v14) {
                goto LABEL_44;
              }
              goto LABEL_45;
            }
            if (v26 > 0.0)
            {
              double v45 = x - v44;
              double v31 = v55;
              double v46 = v55 - v35;
              double v47 = sqrt(v45 * v45 + v46 * v46);
              if (BSFloatLessThanOrEqualToFloat())
              {
LABEL_26:
                char v34 = 0;
                double v21 = v31;
                double v19 = x;
              }
              else
              {
                double v19 = v44 + v45 / v47 * v27;
                double v21 = v35 + v46 / v47 * v27;
                char v34 = 12;
              }
LABEL_27:
              double y = v31;
              if (v14) {
                goto LABEL_44;
              }
              goto LABEL_45;
            }
            char v34 = 12;
          }
          else
          {
            if (v26 > 0.0)
            {
              double v37 = x - v36;
              double v31 = v55;
              double v38 = v55 - v35;
              double v39 = sqrt(v37 * v37 + v38 * v38);
              if (BSFloatLessThanOrEqualToFloat()) {
                goto LABEL_26;
              }
              double v19 = v36 + v37 / v39 * v27;
              double v21 = v35 + v38 / v39 * v27;
              char v34 = 6;
              goto LABEL_27;
            }
            char v34 = 6;
          }
        }
        else
        {
          double v29 = v26 + v19;
          if (x >= v26 + v19)
          {
            double v19 = v19 + v23;
            double v40 = v19 - v26;
            if (x <= v19 - v26)
            {
              double y = v55;
              if (v55 < v21)
              {
                char v34 = 1;
              }
              else
              {
                double v21 = v55;
                char v34 = 0;
              }
              goto LABEL_40;
            }
            if (v26 > 0.0)
            {
              double v41 = x - v40;
              double v31 = v55;
              double v42 = v55 - v28;
              double v43 = sqrt(v42 * v42 + v41 * v41);
              if (BSFloatLessThanOrEqualToFloat()) {
                goto LABEL_26;
              }
              double v19 = v40 + v41 / v43 * v27;
              double v21 = v28 + v42 / v43 * v27;
              char v34 = 9;
              goto LABEL_27;
            }
          }
          else if (v26 > 0.0)
          {
            double v30 = x - v29;
            double v31 = v55;
            double v32 = v55 - v28;
            double v33 = sqrt(v30 * v30 + v32 * v32);
            if (BSFloatLessThanOrEqualToFloat()) {
              goto LABEL_26;
            }
            double v19 = v29 + v30 / v33 * v27;
            double v21 = v28 + v32 / v33 * v27;
            char v34 = 3;
            goto LABEL_27;
          }
          char v34 = 0;
        }
        double y = v55;
        if (v14)
        {
LABEL_44:
          if (!BSFloatLessThanFloat()) {
            goto LABEL_46;
          }
        }
LABEL_45:
        id v48 = v17;

        unsigned __int8 v13 = v34;
        double v56 = v19;
        double v57 = v21;
        double v14 = v48;
LABEL_46:
        ++v16;
      }
      while (v12 != v16);
      NSUInteger v49 = [(NSDictionary *)v10 countByEnumeratingWithState:&v58 objects:v62 count:16];
      NSUInteger v12 = v49;
      if (!v49)
      {

        a4 = v53;
        if (v53)
        {
          a5 = v54;
          if (v14)
          {
            -[BKMousePointerRegionArrangement convertFromGlobalPoint:toRegion:](self, "convertFromGlobalPoint:toRegion:", v14, v56, v57);
            v53->double x = v50;
            v53->double y = v51;
            goto LABEL_57;
          }
LABEL_56:
          double v14 = 0;
          *a4 = CGPointZero;
        }
        else
        {
          a5 = v54;
        }
        goto LABEL_57;
      }
    }
  }

  unsigned __int8 v13 = 0;
  if (a4) {
    goto LABEL_56;
  }
  double v14 = 0;
LABEL_57:
  if (a5) {
    *a5 = v13;
  }

  return v14;
}

- (id)regionForDisplayUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_regionToLayoutDescriptor keyEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        float64x2_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 displayUUID];
        char v11 = BSEqualObjects();

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)regions
{
  v2 = [(NSMutableDictionary *)self->_regionToLayoutDescriptor keyEnumerator];
  v3 = [v2 allObjects];
  id v4 = v3;
  if (!v3) {
    v3 = &__NSArray0__struct;
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKMutableMousePointerRegionArrangement alloc];

  return [(BKMousePointerRegionArrangement *)v4 _initWithCopyOf:self];
}

- (id)_initWithCopyOf:(id)a3
{
  id v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)BKMousePointerRegionArrangement;
  uint64_t v5 = [(BKMousePointerRegionArrangement *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_coalitionIdentifier, v4[1]);
    v6->_baseTranslation = (CGPoint)*((_OWORD *)v4 + 1);
    CGSize v7 = (CGSize)*((_OWORD *)v4 + 3);
    v6->_globalBounds.origin = (CGPoint)*((_OWORD *)v4 + 2);
    v6->_globalBounds.size = v7;
    double v8 = (NSDictionary *)[v4[8] copy];
    regionToComputedFrame = v6->_regionToComputedFrame;
    v6->_regionToComputedFrame = v8;

    double v10 = (NSMutableDictionary *)[v4[9] copy];
    regionToLayoutDescriptor = v6->_regionToLayoutDescriptor;
    v6->_regionToLayoutDescriptor = v10;
  }
  return v6;
}

- (BKMousePointerRegionArrangement)initWithCoalitionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMousePointerRegionArrangement;
  uint64_t v5 = [(BKMousePointerRegionArrangement *)&v9 init];
  if (v5)
  {
    id v6 = (NSString *)[v4 copy];
    coalitionIdentifier = v5->_coalitionIdentifier;
    v5->_coalitionIdentifier = v6;
  }
  return v5;
}

@end