@interface MPAnimationPathKeyframed
+ (id)animationPath;
- (MPAnimationPathKeyframed)init;
- (double)parentMainDuration;
- (double)parentPhaseInDuration;
- (double)parentPhaseOutDuration;
- (double)relativeTimeForKeyframe:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 forDuration:(double)a5;
- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 forDuration:(double)a6;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4;
- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4;
- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5;
- (id)description;
- (id)fullDebugLog;
- (id)keyframes;
- (id)orderedKeyframes;
- (id)parent;
- (void)addKeyframe:(id)a3;
- (void)addKeyframes:(id)a3;
- (void)cleanup;
- (void)copyKeyframes:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)removeAllKeyframes;
- (void)removeKeyframe:(id)a3;
- (void)removeKeyframes:(id)a3;
- (void)setAnimationPath:(id)a3;
@end

@implementation MPAnimationPathKeyframed

+ (id)animationPath
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MPAnimationPathKeyframed)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPAnimationPathKeyframed;
  id v2 = [(MPAnimationPath *)&v4 init];
  if (v2) {
    v2->_keyframes = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v2;
}

- (void)dealloc
{
  [(MPAnimationPathKeyframed *)self cleanup];

  v3.receiver = self;
  v3.super_class = (Class)MPAnimationPathKeyframed;
  [(MPAnimationPath *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPAnimationPathKeyframed;
  id v4 = [(MPAnimationPath *)&v6 copyWithZone:a3];
  [v4 copyKeyframes:self->_keyframes];
  return v4;
}

- (id)description
{
  objc_super v3 = [+[NSString stringWithFormat:@"=========================== Animation Path Description =========================\n"] stringByAppendingFormat:@"\t                Keyframe Count: %d\n", [(NSMutableSet *)self->_keyframes count]];
  if (self->super._animationPath) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [(NSString *)v3 stringByAppendingFormat:@"\t           Has MCAnimationPath: %@\n", v4];
}

- (id)keyframes
{
  return self->_keyframes;
}

- (id)orderedKeyframes
{
  id v2 = objc_msgSend(-[MPAnimationPathKeyframed keyframes](self, "keyframes"), "allObjects");
  return [v2 sortedArrayUsingSelector:"relativeTimeCompare:"];
}

- (void)addKeyframe:(id)a3
{
  CFStringRef v4 = +[NSArray arrayWithObject:a3];
  [(MPAnimationPathKeyframed *)self addKeyframes:v4];
}

- (void)addKeyframes:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_keyframes, "addObjectsFromArray:");
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v79;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v79 != v7) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v78 + 1) + 8 * i) setParentPath:self];
      }
      id v6 = [a3 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v6);
  }
  if (self->super._animationPath)
  {
    id v9 = [(MPAnimationPath *)self animatedParent];
    [a3 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v10 = [a3 countByEnumeratingWithState:&v74 objects:v85 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v75;
        do
        {
          for (j = 0; j != v11; j = (char *)j + 1)
          {
            if (*(void *)v75 != v12) {
              objc_enumerationMutation(a3);
            }
            v14 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
            [v14 scalar];
            double v16 = v15;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(float *)&double v17 = v16;
              objc_msgSend(objc_msgSend(v9, "convertMPAttributeToMCAttribute:withKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17), -[MPAnimationPath key](self, "key")), "floatValue");
              double v16 = v18;
            }
            animationPath = self->super._animationPath;
            [v14 time];
            double v22 = v21;
            id v23 = [v14 offsetType];
            float v20 = v16;
            *(float *)&double v24 = v20;
            objc_msgSend(v14, "setKeyframe:", -[MCAnimationPath createKeyframeWithScalar:atTime:offsetKind:](animationPath, "createKeyframeWithScalar:atTime:offsetKind:", v23, v24, v22));
          }
          id v11 = [a3 countByEnumeratingWithState:&v74 objects:v85 count:16];
        }
        while (v11);
      }
    }
    else
    {
      [a3 lastObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v25 = [a3 countByEnumeratingWithState:&v70 objects:v84 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v71;
          do
          {
            for (k = 0; k != v26; k = (char *)k + 1)
            {
              if (*(void *)v71 != v27) {
                objc_enumerationMutation(a3);
              }
              v29 = *(void **)(*((void *)&v70 + 1) + 8 * (void)k);
              [v29 point];
              double x = v30;
              double y = v32;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v87.double x = x;
                v87.double y = y;
                v34 = (NSString *)objc_msgSend(v9, "convertMPAttributeToMCAttribute:withKey:", NSStringFromCGPoint(v87), -[MPAnimationPath key](self, "key"));
                CGPoint v35 = CGPointFromString(v34);
                double x = v35.x;
                double y = v35.y;
              }
              v36 = self->super._animationPath;
              [v29 time];
              objc_msgSend(v29, "setKeyframe:", -[MCAnimationPath createKeyframeWithPoint:atTime:offsetKind:](v36, "createKeyframeWithPoint:atTime:offsetKind:", objc_msgSend(v29, "offsetType"), x, y, v37));
            }
            id v26 = [a3 countByEnumeratingWithState:&v70 objects:v84 count:16];
          }
          while (v26);
        }
      }
      else
      {
        [a3 lastObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v38 = [a3 countByEnumeratingWithState:&v66 objects:v83 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v67;
            do
            {
              for (m = 0; m != v39; m = (char *)m + 1)
              {
                if (*(void *)v67 != v40) {
                  objc_enumerationMutation(a3);
                }
                v42 = *(void **)(*((void *)&v66 + 1) + 8 * (void)m);
                id v43 = [v42 vector];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v43 = +[MPVector vectorFromString:](MPVector, "vectorFromString:", objc_msgSend(v9, "convertMPAttributeToMCAttribute:withKey:", objc_msgSend(v43, "string"), -[MPAnimationPath key](self, "key")));
                }
                v44 = self->super._animationPath;
                if (v43)
                {
                  [v43 vector];
                }
                else
                {
                  v64[0] = 0;
                  v64[1] = 0;
                  int v65 = 0;
                }
                [v42 time];
                objc_msgSend(v42, "setKeyframe:", -[MCAnimationPath createKeyframeWithVector:atTime:offsetKind:](v44, "createKeyframeWithVector:atTime:offsetKind:", v64, objc_msgSend(v42, "offsetType"), v45));
              }
              id v39 = [a3 countByEnumeratingWithState:&v66 objects:v83 count:16];
            }
            while (v39);
          }
        }
        else
        {
          [a3 lastObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v46 = [a3 countByEnumeratingWithState:&v60 objects:v82 count:16];
            if (v46)
            {
              id v47 = v46;
              uint64_t v48 = *(void *)v61;
              do
              {
                for (n = 0; n != v47; n = (char *)n + 1)
                {
                  if (*(void *)v61 != v48) {
                    objc_enumerationMutation(a3);
                  }
                  v50 = *(void **)(*((void *)&v60 + 1) + 8 * (void)n);
                  v51 = self->super._animationPath;
                  id v52 = [v50 function];
                  [v50 time];
                  double v54 = v53;
                  id v55 = [v50 offsetType];
                  [v50 duration];
                  id v57 = [(MCAnimationPath *)v51 createKeyframeWithFunction:v52 atTime:v55 offsetKind:v54 forDuration:v56];
                  objc_msgSend(v57, "setFunctionParameters:", objc_msgSend(v50, "functionParameters"));
                  [v50 innerEaseInControl];
                  *(float *)&double v58 = v58;
                  [v57 setInnerEaseInControl:v58];
                  [v50 innerEaseOutControl];
                  *(float *)&double v59 = v59;
                  [v57 setInnerEaseOutControl:v59];
                  [v50 functionTimeFactor];
                  objc_msgSend(v57, "setFunctionTimeFactor:");
                  [v50 functionTimeOffset];
                  objc_msgSend(v57, "setFunctionTimeOffset:");
                  [v50 setKeyframe:v57];
                }
                id v47 = [a3 countByEnumeratingWithState:&v60 objects:v82 count:16];
              }
              while (v47);
            }
          }
        }
      }
    }
  }
}

- (void)removeKeyframe:(id)a3
{
  if (-[NSMutableSet containsObject:](self->_keyframes, "containsObject:"))
  {
    [(NSMutableSet *)self->_keyframes removeObject:a3];
    [a3 setParentPath:0];
    if (self->super._animationPath)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[MCAnimationPath removeKeyframe:](self->super._animationPath, "removeKeyframe:", [a3 keyframe]);
        [a3 setKeyframe:0];
      }
    }
  }
}

- (void)removeKeyframes:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MPAnimationPathKeyframed *)self removeKeyframe:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllKeyframes
{
  id v3 = [(NSMutableSet *)self->_keyframes copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MPAnimationPathKeyframed *)self removeKeyframe:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframe1D keyframe1DWithScalar:a3 atTime:a4];
  [(MPAnimationPathKeyframed *)self addKeyframe:v5];
  return v5;
}

- (id)createKeyframeWithScalar:(double)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframe1D keyframe1DWithScalar:a5 atTime:a3 offsetType:a4];
  [(MPAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframe2D keyframe2DWithPoint:atTime:](MPAnimationKeyframe2D, "keyframe2DWithPoint:atTime:", a3.x, a3.y, a4);
  [(MPAnimationPathKeyframed *)self addKeyframe:v5];
  return v5;
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframe2D keyframe2DWithPoint:atTime:offsetType:](MPAnimationKeyframe2D, "keyframe2DWithPoint:atTime:offsetType:", a5, a3.x, a3.y, a4);
  [(MPAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4
{
  id v5 = +[MPAnimationKeyframeVector keyframeVectorWithVector:a3 atTime:a4];
  [(MPAnimationPathKeyframed *)self addKeyframe:v5];
  return v5;
}

- (id)createKeyframeWithVector:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5
{
  uint64_t v6 = +[MPAnimationKeyframeVector keyframeVectorWithVector:a3 atTime:a5 offsetType:a4];
  [(MPAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 forDuration:(double)a5
{
  uint64_t v6 = +[MPAnimationKeyframeFunction keyframeFunctionWithFunction:a3 atTime:a4 withDuration:a5];
  [(MPAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetType:(unint64_t)a5 forDuration:(double)a6
{
  uint64_t v7 = +[MPAnimationKeyframeFunction keyframeFunctionWithFunction:a3 atTime:a5 offsetType:a4 withDuration:a6];
  [(MPAnimationPathKeyframed *)self addKeyframe:v7];
  return v7;
}

- (id)parent
{
  return self->super._parentObject;
}

- (double)relativeTimeForKeyframe:(id)a3
{
  [a3 time];
  double v6 = v5;
  [(MPAnimationPathKeyframed *)self parentPhaseInDuration];
  double v8 = v7;
  [(MPAnimationPathKeyframed *)self parentPhaseOutDuration];
  double v10 = v9;
  [(MPAnimationPathKeyframed *)self parentMainDuration];
  double v12 = v11;
  double v13 = v8 + v10 + v11;
  v14 = (char *)[a3 offsetType];
  if ((uint64_t)v14 > 100)
  {
    if (v14 == (unsigned char *)&stru_20.flags + 1)
    {
      double v6 = v6 + v8;
    }
    else if (v14 == (unsigned char *)&stru_20.flags + 2)
    {
      double v6 = v6 + v8 + v12;
    }
    else if (v14 == (unsigned char *)&stru_20.flags + 3)
    {
      double v6 = v6 + v13;
    }
  }
  else
  {
    switch((unint64_t)v14)
    {
      case 0uLL:
        double v6 = v6 * v13;
        break;
      case 1uLL:
        double v6 = v6 * v8;
        break;
      case 2uLL:
        double v6 = (v6 + 1.0) * v8;
        break;
      case 3uLL:
        double v6 = v8 + v6 * v12;
        break;
      case 4uLL:
        double v6 = v8 + (v6 + 1.0) * v12;
        break;
      case 5uLL:
        double v6 = v8 + v12 + v6 * v10;
        break;
      case 6uLL:
        double v6 = v13 + v6 * v10;
        break;
      case 7uLL:
        double v6 = (v6 + 1.0) * v13;
        break;
      default:
        return v6 / v13;
    }
  }
  return v6 / v13;
}

- (double)parentPhaseInDuration
{
  id v2 = [(MPAnimationPath *)self animatedParent];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [v2 parent];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v2 parentEffect];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return 0.0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0.0;
          }
        }
      }
    }
  }
  [v2 phaseInDuration];
  return result;
}

- (double)parentPhaseOutDuration
{
  id v2 = [(MPAnimationPath *)self animatedParent];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [v2 parent];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [v2 parentEffect];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return 0.0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            return 0.0;
          }
        }
      }
    }
  }
  [v2 phaseOutDuration];
  return result;
}

- (double)parentMainDuration
{
  id v2 = [(MPAnimationPath *)self animatedParent];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [v2 parent];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 parentEffect];
LABEL_7:
    [v3 mainDuration];
    return result;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 duration];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), double result = 0.0, (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v2, "duration", result);
      double v7 = v6;
      [v2 phaseOutDuration];
      double v9 = v7 - v8;
      [v2 phaseInDuration];
      return v9 - v10;
    }
  }
  return result;
}

- (void)dump
{
}

- (id)fullDebugLog
{
  id v3 = [+[NSString stringWithFormat:@"\n%@\n", [(MPAnimationPathKeyframed *)self description]] stringByAppendingFormat:@"======================= Animation Path Keyframes =======================\n"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  keyframes = self->_keyframes;
  id v5 = [(NSMutableSet *)keyframes countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(keyframes);
        }
        id v3 = -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"%@\n", [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) fullDebugLog]);
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)keyframes countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)copyKeyframes:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        [v5 addObject:v10];

        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(MPAnimationPathKeyframed *)self addKeyframes:v5];
}

- (void)cleanup
{
}

- (void)setAnimationPath:(id)a3
{
  v87.receiver = self;
  v87.super_class = (Class)MPAnimationPathKeyframed;
  [(MPAnimationPath *)&v87 setAnimationPath:a3];
  if (self->super._animationPath)
  {
    if ([(NSMutableSet *)self->_keyframes count])
    {
      id v4 = [(MPAnimationPath *)self animatedParent];
      [(NSMutableSet *)self->_keyframes anyObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        keyframes = self->_keyframes;
        id v6 = [(NSMutableSet *)keyframes countByEnumeratingWithState:&v83 objects:v92 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v84;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v84 != v8) {
                objc_enumerationMutation(keyframes);
              }
              id v10 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              [v10 scalar];
              double v12 = v11;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *(float *)&double v13 = v12;
                objc_msgSend(objc_msgSend(v4, "convertMPAttributeToMCAttribute:withKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), -[MPAnimationPath key](self, "key")), "floatValue");
                double v12 = v14;
              }
              animationPath = self->super._animationPath;
              [v10 time];
              double v18 = v17;
              id v19 = [v10 offsetType];
              float v16 = v12;
              *(float *)&double v20 = v16;
              objc_msgSend(v10, "setKeyframe:", -[MCAnimationPath createKeyframeWithScalar:atTime:offsetKind:](animationPath, "createKeyframeWithScalar:atTime:offsetKind:", v19, v20, v18));
            }
            id v7 = [(NSMutableSet *)keyframes countByEnumeratingWithState:&v83 objects:v92 count:16];
          }
          while (v7);
        }
      }
      else
      {
        [(NSMutableSet *)self->_keyframes anyObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          uint64_t v27 = self->_keyframes;
          id v28 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v79 objects:v91 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v80;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(void *)v80 != v30) {
                  objc_enumerationMutation(v27);
                }
                double v32 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
                [v32 point];
                double x = v33;
                double y = v35;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v93.double x = x;
                  v93.double y = y;
                  double v37 = (NSString *)objc_msgSend(v4, "convertMPAttributeToMCAttribute:withKey:", NSStringFromCGPoint(v93), -[MPAnimationPath key](self, "key"));
                  CGPoint v38 = CGPointFromString(v37);
                  double x = v38.x;
                  double y = v38.y;
                }
                id v39 = self->super._animationPath;
                [v32 time];
                objc_msgSend(v32, "setKeyframe:", -[MCAnimationPath createKeyframeWithPoint:atTime:offsetKind:](v39, "createKeyframeWithPoint:atTime:offsetKind:", objc_msgSend(v32, "offsetType"), x, y, v40));
              }
              id v29 = [(NSMutableSet *)v27 countByEnumeratingWithState:&v79 objects:v91 count:16];
            }
            while (v29);
          }
        }
        else
        {
          [(NSMutableSet *)self->_keyframes anyObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            v41 = self->_keyframes;
            id v42 = [(NSMutableSet *)v41 countByEnumeratingWithState:&v75 objects:v90 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v76;
              do
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(void *)v76 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  id v46 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
                  id v47 = [v46 vector];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    id v47 = +[MPVector vectorFromString:](MPVector, "vectorFromString:", objc_msgSend(v4, "convertMPAttributeToMCAttribute:withKey:", objc_msgSend(v47, "string"), -[MPAnimationPath key](self, "key")));
                  }
                  uint64_t v48 = self->super._animationPath;
                  if (v47)
                  {
                    [v47 vector];
                  }
                  else
                  {
                    v73[0] = 0;
                    v73[1] = 0;
                    int v74 = 0;
                  }
                  [v46 time];
                  objc_msgSend(v46, "setKeyframe:", -[MCAnimationPath createKeyframeWithVector:atTime:offsetKind:](v48, "createKeyframeWithVector:atTime:offsetKind:", v73, objc_msgSend(v46, "offsetType"), v49));
                }
                id v43 = [(NSMutableSet *)v41 countByEnumeratingWithState:&v75 objects:v90 count:16];
              }
              while (v43);
            }
          }
          else
          {
            [(NSMutableSet *)self->_keyframes anyObject];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v71 = 0u;
              long long v72 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              v50 = self->_keyframes;
              id v51 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v69 objects:v89 count:16];
              if (v51)
              {
                id v52 = v51;
                uint64_t v53 = *(void *)v70;
                do
                {
                  for (m = 0; m != v52; m = (char *)m + 1)
                  {
                    if (*(void *)v70 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    id v55 = *(void **)(*((void *)&v69 + 1) + 8 * (void)m);
                    double v56 = self->super._animationPath;
                    id v57 = [v55 function];
                    [v55 time];
                    double v59 = v58;
                    id v60 = [v55 offsetType];
                    [v55 duration];
                    id v62 = [(MCAnimationPath *)v56 createKeyframeWithFunction:v57 atTime:v60 offsetKind:v59 forDuration:v61];
                    objc_msgSend(v62, "setFunctionParameters:", objc_msgSend(v55, "functionParameters"));
                    [v55 innerEaseInControl];
                    *(float *)&double v63 = v63;
                    [v62 setInnerEaseInControl:v63];
                    [v55 innerEaseOutControl];
                    *(float *)&double v64 = v64;
                    [v62 setInnerEaseOutControl:v64];
                    [v55 functionTimeFactor];
                    objc_msgSend(v62, "setFunctionTimeFactor:");
                    [v55 functionTimeOffset];
                    objc_msgSend(v62, "setFunctionTimeOffset:");
                    [v55 setKeyframe:v62];
                  }
                  id v52 = [(NSMutableSet *)v50 countByEnumeratingWithState:&v69 objects:v89 count:16];
                }
                while (v52);
              }
            }
          }
        }
      }
    }
  }
  else
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    double v21 = self->_keyframes;
    id v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v65 objects:v88 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v66;
      do
      {
        for (n = 0; n != v23; n = (char *)n + 1)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v65 + 1) + 8 * (void)n);
          [(NSMutableSet *)self->_keyframes anyObject];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [(NSMutableSet *)self->_keyframes anyObject];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [(NSMutableSet *)self->_keyframes anyObject];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [(NSMutableSet *)self->_keyframes anyObject];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
          }
          [v26 setKeyframe:0];
        }
        id v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v65 objects:v88 count:16];
      }
      while (v23);
    }
  }
}

@end