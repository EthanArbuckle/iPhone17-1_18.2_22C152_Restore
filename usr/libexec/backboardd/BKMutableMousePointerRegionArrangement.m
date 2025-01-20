@interface BKMutableMousePointerRegionArrangement
- (id)copyWithZone:(_NSZone *)a3;
- (void)_computeFrameForRegionLayoutDescriptor:(id)a3 accumulatedFrames:(id)a4;
- (void)_updateFrames;
- (void)addPrimaryRegion:(id)a3;
- (void)addRegion:(id)a3 relativeToRegion:(id)a4 alongEdge:(unsigned int)a5 atPosition:(double)a6;
- (void)removeRegion:(id)a3;
@end

@implementation BKMutableMousePointerRegionArrangement

- (void)_updateFrames
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = self->super._regionToLayoutDescriptor;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v14 = -[NSMutableDictionary objectForKey:](self->super._regionToLayoutDescriptor, "objectForKey:", v13, (void)v28);
        [(BKMutableMousePointerRegionArrangement *)self _computeFrameForRegionLayoutDescriptor:v14 accumulatedFrames:v7];
        v15 = [v7 objectForKey:v13];
        BSRectFromValue();
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v23 = v22;

        v37.origin.double x = x;
        v37.origin.double y = y;
        v37.size.CGFloat width = width;
        v37.size.CGFloat height = height;
        v39.origin.double x = v17;
        v39.origin.double y = v19;
        v39.size.CGFloat width = v21;
        v39.size.CGFloat height = v23;
        CGRect v38 = CGRectUnion(v37, v39);
        double x = v38.origin.x;
        double y = v38.origin.y;
        CGFloat width = v38.size.width;
        CGFloat height = v38.size.height;
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  v24 = (NSDictionary *)[v7 copy];
  regionToComputedFrame = self->super._regionToComputedFrame;
  self->super._regionToComputedFrame = v24;

  self->super._globalBounds.origin.double x = x;
  self->super._globalBounds.origin.double y = y;
  self->super._globalBounds.size.CGFloat width = width;
  self->super._globalBounds.size.CGFloat height = height;
  v26 = BKLogMousePointer();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = BSNSStringFromCGRect();
    *(_DWORD *)buf = 134218242;
    v33 = self;
    __int16 v34 = 2114;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "region arrangement %p bounds: %{public}@", buf, 0x16u);
  }
  self->super._baseTranslation.double x = -x;
  self->super._baseTranslation.double y = -y;
}

- (void)_computeFrameForRegionLayoutDescriptor:(id)a3 accumulatedFrames:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 region];
  v8 = [v6 objectForKey:v7];
  if (!v8)
  {
    id v9 = [v12 relativeRegion];
    [v7 pointSize];
    if (v9)
    {
      id v10 = [(BKMousePointerRegionArrangement *)self _layoutDescriptorForRegion:v9];
      [(BKMutableMousePointerRegionArrangement *)self _computeFrameForRegionLayoutDescriptor:v10 accumulatedFrames:v6];

      uint64_t v11 = [v6 objectForKey:v9];
      BSRectFromValue();

      [v12 edgePosition];
      BSRectWithSize();
      [v12 edge];
    }
    v8 = BSValueWithRect();
    [v6 setObject:v8 forKey:v7];
  }
}

- (void)removeRegion:(id)a3
{
  [(NSMutableDictionary *)self->super._regionToLayoutDescriptor removeObjectForKey:a3];
  if (![(NSMutableDictionary *)self->super._regionToLayoutDescriptor count])
  {
    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = 0;
  }

  [(BKMutableMousePointerRegionArrangement *)self _updateFrames];
}

- (void)addRegion:(id)a3 relativeToRegion:(id)a4 alongEdge:(unsigned int)a5 atPosition:(double)a6
{
  uint64_t v7 = *(void *)&a5;
  id v21 = a3;
  id v11 = a4;
  if (!v11)
  {
    CGFloat v17 = +[NSString stringWithFormat:@"Regions must be relative to another region if there are existing regions"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v18 = NSStringFromSelector(a2);
      CGFloat v19 = (objc_class *)objc_opt_class();
      double v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      CGFloat v23 = v18;
      __int16 v24 = 2114;
      v25 = v20;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      CFStringRef v29 = @"BKMousePointerRegionArrangement.m";
      __int16 v30 = 1024;
      int v31 = 323;
      __int16 v32 = 2114;
      v33 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009BE98);
  }
  id v12 = v11;
  uint64_t v13 = [[_BKMousePointerRegionLayoutDescriptor alloc] initWithRegion:v21 relativeRegion:v11 edge:v7 edgePosition:a6];
  regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  if (!regionToLayoutDescriptor)
  {
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    double v16 = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = v15;

    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  }
  [(NSMutableDictionary *)regionToLayoutDescriptor setObject:v13 forKey:v21];
  [(BKMutableMousePointerRegionArrangement *)self _updateFrames];
}

- (void)addPrimaryRegion:(id)a3
{
  id v13 = a3;
  if ([(NSMutableDictionary *)self->super._regionToLayoutDescriptor count])
  {
    id v9 = +[NSString stringWithFormat:@"Only one primary region may be added"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      v15 = v10;
      __int16 v16 = 2114;
      CGFloat v17 = v12;
      __int16 v18 = 2048;
      CGFloat v19 = self;
      __int16 v20 = 2114;
      CFStringRef v21 = @"BKMousePointerRegionArrangement.m";
      __int16 v22 = 1024;
      int v23 = 312;
      __int16 v24 = 2114;
      v25 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10009C180);
  }
  v5 = [[_BKMousePointerRegionLayoutDescriptor alloc] initWithRegion:v13 relativeRegion:0 edge:0 edgePosition:0.0];
  regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  if (!regionToLayoutDescriptor)
  {
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8 = self->super._regionToLayoutDescriptor;
    self->super._regionToLayoutDescriptor = v7;

    regionToLayoutDescriptor = self->super._regionToLayoutDescriptor;
  }
  [(NSMutableDictionary *)regionToLayoutDescriptor setObject:v5 forKey:v13];
  [(BKMutableMousePointerRegionArrangement *)self _updateFrames];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKMousePointerRegionArrangement alloc];

  return [(BKMousePointerRegionArrangement *)v4 _initWithCopyOf:self];
}

@end