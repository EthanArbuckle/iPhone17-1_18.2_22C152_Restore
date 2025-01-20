@interface UITextSelectionRectCustomHandleInfo
- (BOOL)isEqual:(id)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (id)description;
- (unint64_t)hash;
@end

@implementation UITextSelectionRectCustomHandleInfo

- (CGPoint)bottomLeft
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)description
{
  double v3 = NSString;
  [(UITextSelectionRectCustomHandleInfo *)self topLeft];
  uint64_t v5 = v4;
  [(UITextSelectionRectCustomHandleInfo *)self topLeft];
  uint64_t v7 = v6;
  [(UITextSelectionRectCustomHandleInfo *)self topRight];
  uint64_t v9 = v8;
  [(UITextSelectionRectCustomHandleInfo *)self topRight];
  uint64_t v11 = v10;
  [(UITextSelectionRectCustomHandleInfo *)self bottomLeft];
  uint64_t v13 = v12;
  [(UITextSelectionRectCustomHandleInfo *)self bottomLeft];
  uint64_t v15 = v14;
  [(UITextSelectionRectCustomHandleInfo *)self bottomRight];
  uint64_t v17 = v16;
  [(UITextSelectionRectCustomHandleInfo *)self bottomRight];
  return (id)[v3 stringWithFormat:@"topLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f", v5, v7, v9, v11, v13, v15, v17, v18];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UITextSelectionRectCustomHandleInfo *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(UITextSelectionRectCustomHandleInfo *)self bottomLeft];
      double v7 = v6;
      double v9 = v8;
      [(UITextSelectionRectCustomHandleInfo *)v5 bottomLeft];
      if (v7 == v11 && v9 == v10)
      {
        [(UITextSelectionRectCustomHandleInfo *)self topLeft];
        double v15 = v14;
        double v17 = v16;
        [(UITextSelectionRectCustomHandleInfo *)v5 topLeft];
        BOOL v13 = 0;
        if (v15 == v19 && v17 == v18)
        {
          [(UITextSelectionRectCustomHandleInfo *)self bottomRight];
          double v21 = v20;
          double v23 = v22;
          [(UITextSelectionRectCustomHandleInfo *)v5 bottomRight];
          BOOL v13 = 0;
          if (v21 == v25 && v23 == v24)
          {
            [(UITextSelectionRectCustomHandleInfo *)self topRight];
            double v27 = v26;
            double v29 = v28;
            [(UITextSelectionRectCustomHandleInfo *)v5 topRight];
            BOOL v13 = v29 == v31 && v27 == v30;
          }
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  double v3 = (void *)MEMORY[0x1E4F29238];
  [(UITextSelectionRectCustomHandleInfo *)self bottomLeft];
  uint64_t v4 = objc_msgSend(v3, "valueWithCGPoint:");
  uint64_t v5 = [v4 hash];

  double v6 = (void *)MEMORY[0x1E4F29238];
  [(UITextSelectionRectCustomHandleInfo *)self topLeft];
  double v7 = objc_msgSend(v6, "valueWithCGPoint:");
  uint64_t v8 = 257 * (257 * v5 + [v7 hash]);

  double v9 = (void *)MEMORY[0x1E4F29238];
  [(UITextSelectionRectCustomHandleInfo *)self bottomRight];
  double v10 = objc_msgSend(v9, "valueWithCGPoint:");
  uint64_t v11 = 257 * (v8 + [v10 hash]);

  uint64_t v12 = (void *)MEMORY[0x1E4F29238];
  [(UITextSelectionRectCustomHandleInfo *)self topRight];
  BOOL v13 = objc_msgSend(v12, "valueWithCGPoint:");
  unint64_t v14 = v11 + [v13 hash] + 0x1050A0A0501;

  return v14;
}

@end