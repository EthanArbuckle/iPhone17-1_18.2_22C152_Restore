@interface RCPTraceLayer
- (RCPEventStream)eventStream;
- (int64_t)interfaceOrientation;
- (unint64_t)time;
- (void)drawInContext:(CGContext *)a3;
- (void)setEventStream:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setTime:(unint64_t)a3;
@end

@implementation RCPTraceLayer

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  [(RCPTraceLayer *)self bounds];
  CGContextClearRect(a3, v99);
  v78 = [MEMORY[0x1E4F1CA48] array];
  v82 = [MEMORY[0x1E4F1CA60] dictionary];
  [(RCPTraceLayer *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double c = v9;
  double b = v11;
  switch([(RCPTraceLayer *)self interfaceOrientation])
  {
    case 0:
      CGAffineTransformMakeScale(&v93, c, b);
      double a = v93.a;
      double b = v93.b;
      double c = v93.c;
      double d = v93.d;
      CGFloat tx = v93.tx;
      CGFloat ty = v93.ty;
      break;
    case 1:
      double a = -c;
      double d = -b;
      CGFloat ty = b;
      CGFloat tx = c;
      double c = 0.0;
      double b = 0.0;
      break;
    case 2:
      CGFloat ty = b;
      double b = -b;
      CGFloat tx = 0.0;
      goto LABEL_7;
    case 3:
      CGFloat tx = c;
      double c = -c;
      CGFloat ty = 0.0;
LABEL_7:
      double d = 0.0;
      double a = 0.0;
      break;
    default:
      double a = *MEMORY[0x1E4F1DAB8];
      double b = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
      double c = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
      double d = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
      CGFloat tx = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
      CGFloat ty = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
      break;
  }
  CGAffineTransformMakeTranslation(&t2, v6, v8);
  t1.double a = a;
  t1.double b = b;
  t1.double c = c;
  t1.double d = d;
  t1.CGFloat tx = tx;
  t1.CGFloat ty = ty;
  CGAffineTransformConcat(&v93, &t1, &t2);
  double v17 = v93.b;
  double v80 = v93.a;
  double v18 = v93.c;
  double v19 = v93.d;
  double v21 = v93.tx;
  double v20 = v93.ty;
  v22 = [(RCPTraceLayer *)self eventStream];
  v74 = [v22 environment];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v23 = [(RCPTraceLayer *)self eventStream];
  v24 = [v23 events];

  uint64_t v76 = [v24 countByEnumeratingWithState:&v87 objects:v97 count:16];
  if (v76)
  {
    uint64_t v75 = *(void *)v88;
LABEL_10:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v88 != v75) {
        objc_enumerationMutation(v24);
      }
      v26 = *(void **)(*((void *)&v87 + 1) + 8 * v25);
      if (objc_msgSend(v26, "timestamp", v74) >= self->_time) {
        break;
      }
      uint64_t v77 = v25;
      [v26 hidEvent];
      v27 = IOHIDEventGetChildren();
      if ([v27 count])
      {
        unint64_t v28 = 0;
        do
        {
          v29 = [v27 objectAtIndexedSubscript:v28];
          uint64_t IntegerValue = IOHIDEventGetIntegerValue();

          v31 = [v27 objectAtIndexedSubscript:v28];
          IOHIDEventGetFloatValue();
          double v33 = v32;

          v34 = [v27 objectAtIndexedSubscript:v28];
          IOHIDEventGetFloatValue();
          double v36 = v35;

          v37 = [v27 objectAtIndexedSubscript:v28];
          char v38 = IOHIDEventGetIntegerValue();

          v39 = [NSNumber numberWithInteger:IntegerValue];
          v40 = [v82 objectForKeyedSubscript:v39];

          if (v38)
          {
            if (v40)
            {
              v41 = [NSNumber numberWithInteger:IntegerValue];
              [v82 removeObjectForKey:v41];
            }
            [(RCPFilePath *)v40 setFinished:1];
          }
          else
          {
            if (v40)
            {
              -[RCPFilePath setEndTimestamp:](v40, "setEndTimestamp:", [v26 timestamp]);
            }
            else
            {
              v40 = objc_alloc_init(RCPFilePath);
              [(RCPFilePath *)v40 setPath:CGPathCreateMutable()];
              -[RCPFilePath setTimestamp:](v40, "setTimestamp:", [v26 timestamp]);
              -[RCPFilePath setEndTimestamp:](v40, "setEndTimestamp:", [v26 timestamp] + 100);
              v42 = [NSNumber numberWithInteger:IntegerValue];
              [v82 setObject:v40 forKeyedSubscript:v42];

              [v78 addObject:v40];
            }
            IsEmpCGFloat ty = CGPathIsEmpty([(RCPFilePath *)v40 path]);
            v44 = [(RCPFilePath *)v40 path];
            double v45 = v21 + v18 * v36 + v80 * v33;
            double v46 = v20 + v19 * v36 + v17 * v33;
            if (IsEmpty) {
              CGPathMoveToPoint(v44, 0, v45, v46);
            }
            else {
              CGPathAddLineToPoint(v44, 0, v45, v46);
            }
          }

          ++v28;
        }
        while (v28 < [v27 count]);
      }

      uint64_t v25 = v77 + 1;
      if (v77 + 1 == v76)
      {
        uint64_t v76 = [v24 countByEnumeratingWithState:&v87 objects:v97 count:16];
        if (v76) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  [v74 timeScale];
  double v48 = v47;
  [v74 timeScale];
  double v50 = v49;
  CGContextSetLineWidth(a3, 4.0);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
  CGContextSetLineCap(a3, kCGLineCapRound);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1A9077A88;
  long long v96 = unk_1A9077A98;
  v52 = CGColorCreate(DeviceRGB, components);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v53 = v78;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v83 objects:v94 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    unint64_t v81 = (unint64_t)(100000000.0 / v48);
    uint64_t v56 = *(void *)v84;
    unint64_t v79 = (unint64_t)(300000000.0 / v50);
    double v57 = (double)v79;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v84 != v56) {
          objc_enumerationMutation(v53);
        }
        v59 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        unint64_t time = self->_time;
        if (time >= objc_msgSend(v59, "timestamp", v74))
        {
          if (![v59 finished]
            || (unint64_t v61 = self->_time, v61 <= [v59 endTimestamp] + v79))
          {
            double v62 = 1.0;
            if ([v59 finished])
            {
              unint64_t v63 = self->_time;
              if (v63 > [v59 endTimestamp])
              {
                unint64_t v64 = self->_time;
                double v62 = (1.0 - (double)(v64 - [v59 endTimestamp]) / v57) * 0.25;
              }
            }
            CGContextSetRGBStrokeColor(a3, 1.0, 1.0, 1.0, v62);
            CGContextAddPath(a3, (CGPathRef)[v59 path]);
            CGContextSetLineWidth(a3, 6.0);
            CGContextStrokePath(a3);
            CopyWithAlphdouble a = CGColorCreateCopyWithAlpha(v52, v62);
            CGContextSetStrokeColorWithColor(a3, CopyWithAlpha);
            CGContextAddPath(a3, (CGPathRef)[v59 path]);
            CGContextSetLineWidth(a3, 4.0);
            CGContextStrokePath(a3);
            unint64_t v66 = self->_time;
            if (v66 < [v59 endTimestamp] + v81)
            {
              CGContextSetFillColorWithColor(a3, v52);
              CGPoint CurrentPoint = CGPathGetCurrentPoint((CGPathRef)[v59 path]);
              double v68 = 16.0;
              if ([v59 finished])
              {
                unint64_t v69 = self->_time;
                if (v69 > [v59 endTimestamp])
                {
                  unint64_t v70 = self->_time;
                  double v68 = (double)(v70 - [v59 endTimestamp]) * -10.0 / v57 + 16.0;
                }
              }
              CGFloat v71 = CurrentPoint.x - v68;
              CGFloat v72 = CurrentPoint.y - v68;
              CGFloat v73 = v68 + v68;
              v100.origin.x = v71;
              v100.origin.y = v72;
              v100.size.width = v73;
              v100.size.height = v73;
              CGContextFillEllipseInRect(a3, v100);
              CGContextSetRGBStrokeColor(a3, 1.0, 1.0, 1.0, 1.0);
              v101.origin.x = v71;
              v101.origin.y = v72;
              v101.size.width = v73;
              v101.size.height = v73;
              CGContextStrokeEllipseInRect(a3, v101);
            }
          }
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v83 objects:v94 count:16];
    }
    while (v55);
  }

  CGColorRelease(v52);
}

- (RCPEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_unint64_t time = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void).cxx_destruct
{
}

@end