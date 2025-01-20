@interface UIFocusLinearMovementDebugViewLineSegment
@end

@implementation UIFocusLinearMovementDebugViewLineSegment

void __61___UIFocusLinearMovementDebugViewLineSegment__calculatePaths__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [v7 point];
  double v9 = v8;
  double v11 = v10;
  if ([v7 type])
  {
    if ([v7 type] == 1)
    {
      if (*(void *)(a1 + 48) - 2 == a3 || hypot(*(double *)(a1 + 56) - v9, *(double *)(a1 + 64) - v11) <= 10.0)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        *(double *)(v12 + 32) = v9;
        *(double *)(v12 + 40) = v11;
        double v13 = *(double *)(a1 + 56);
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        double v15 = *(double *)(v14 + 32);
        double v16 = v13 - v15;
        double v17 = *(double *)(a1 + 64);
        if (v13 >= v15) {
          double v18 = atan((v17 - *(double *)(v14 + 40)) / v16);
        }
        else {
          double v18 = atan((v17 - *(double *)(v14 + 40)) / v16) + 3.14159265;
        }
        CGAffineTransformMakeRotation(&v19, v18);
        objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", v13 - (v19.tx + v19.c * 0.0 + v19.a * 10.5), v17 - (v19.ty + v19.d * 0.0 + v19.b * 10.5));
        *a4 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", v9, v11);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", v9, v11);
  }
}

void __68___UIFocusLinearMovementDebugViewLineSegment__pathElementsFromPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[_UIFocusLinearMovementDebugViewLineElement elementWithCGPathElement:a2];
  [v2 addObject:v3];
}

void __81___UIFocusLinearMovementDebugViewLineSegment__flattenedBezierPathFromBezierPath___block_invoke(uint64_t *a1, void *a2)
{
  id v21 = a2;
  switch([v21 type])
  {
    case 0u:
      v4 = (void *)a1[4];
      [v21 point];
      objc_msgSend(v4, "moveToPoint:");
      break;
    case 1u:
    case 2u:
      id v3 = (void *)a1[4];
      [v21 point];
      objc_msgSend(v3, "addLineToPoint:");
      break;
    case 3u:
      uint64_t v6 = a1[4];
      v5 = (void *)a1[5];
      uint64_t v7 = *(void *)(a1[6] + 8);
      [v21 cp1];
      double v9 = v8;
      double v11 = v10;
      [v21 cp2];
      double v13 = v12;
      double v15 = v14;
      [v21 point];
      objc_msgSend(v5, "_subdivideBezier:startPoint:controlPoint1:controlPoint2:endPoint:", v6, *(double *)(v7 + 32), *(double *)(v7 + 40), v9, v11, v13, v15, v16, v17);
      break;
    case 4u:
      [(id)a1[4] closePath];
      break;
    default:
      break;
  }
  [v21 point];
  uint64_t v18 = *(void *)(a1[6] + 8);
  *(void *)(v18 + 32) = v19;
  *(void *)(v18 + 40) = v20;
}

@end