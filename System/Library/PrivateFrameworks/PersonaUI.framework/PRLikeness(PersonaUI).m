@interface PRLikeness(PersonaUI)
- (CGImage)_photoSnapshotWithSize:()PersonaUI scale:options:;
- (id)_accentColorForMonogram;
- (id)_accentColorForPhoto;
- (id)accentColor;
- (id)snapshotWithSize:()PersonaUI scale:options:;
@end

@implementation PRLikeness(PersonaUI)

- (id)snapshotWithSize:()PersonaUI scale:options:
{
  id v10 = a6;
  uint64_t v11 = [a1 type];
  if (v11 == 2)
  {
    v14 = objc_msgSend(a1, "_photoSnapshotWithSize:scale:options:", v10, a2, a3, a4);
  }
  else if (v11 == 1)
  {
    v12 = [a1 recipe];
    v13 = +[PRMonogram monogramWithData:v12];

    v14 = objc_msgSend(v13, "snapshotWithSize:scale:options:", v10, a2, a3, a4);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)accentColor
{
  uint64_t v2 = [a1 type];
  if (v2 == 2)
  {
    v3 = [a1 _accentColorForPhoto];
  }
  else if (v2 == 1)
  {
    v3 = [a1 _accentColorForMonogram];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_accentColorForMonogram
{
  v1 = [a1 recipe];
  uint64_t v2 = +[PRMonogram monogramWithData:v1];

  v3 = [v2 color];
  v4 = [v3 colorWithAlphaComponent:0.300000012];

  return v4;
}

- (id)_accentColorForPhoto
{
  uint64_t v2 = (CGImage *)[a1 staticRepresentation];
  [a1 cropRect];
  CGImageRef v7 = PRImageCreateWithImageInRect(v2, v3, v4, v5, v6);
  if (v7)
  {
    v8 = v7;
    double AlignedBytesPerRow = (double)(unint64_t)CGBitmapGetAlignedBytesPerRow();
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = 1.0;
    v26.size.height = 1.0;
    size_t v10 = (unint64_t)(CGRectGetWidth(v26) * AlignedBytesPerRow);
    uint64_t Data = CGBitmapAllocateData();
    if (Data)
    {
      v12 = (unsigned char *)Data;
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        v14 = DeviceRGB;
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.width = 1.0;
        v27.size.height = 1.0;
        size_t Width = (unint64_t)CGRectGetWidth(v27);
        v28.origin.x = 0.0;
        v28.origin.y = 0.0;
        v28.size.width = 1.0;
        v28.size.height = 1.0;
        CGFloat Height = CGRectGetHeight(v28);
        CGContextRef v17 = CGBitmapContextCreate(v12, Width, (unint64_t)Height, 8uLL, v10, v14, 0x4001u);
        if (v17)
        {
          v18 = v17;
          v19 = (CGImage *)[a1 staticRepresentation];
          v29.origin.x = 0.0;
          v29.origin.y = 0.0;
          v29.size.width = 1.0;
          v29.size.height = 1.0;
          CGContextDrawImage(v18, v29, v19);
          LOBYTE(v20) = *v12;
          LOBYTE(v21) = v12[1];
          LOBYTE(v22) = v12[2];
          v23 = [MEMORY[0x263F1C550] colorWithRed:(float)((float)v20 / 255.0) green:(float)((float)v21 / 255.0) blue:(float)((float)v22 / 255.0) alpha:1.0];
          CGContextRelease(v18);
        }
        else
        {
          v23 = 0;
        }
        CGColorSpaceRelease(v14);
      }
      else
      {
        v23 = 0;
      }
      CGBitmapFreeData();
    }
    else
    {
      v23 = 0;
    }
    CGImageRelease(v8);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (CGImage)_photoSnapshotWithSize:()PersonaUI scale:options:
{
  id v10 = a6;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"PRLikenessSnapshotOptionCircular"];
  int v12 = [v11 BOOLValue];

  v13 = (CGImage *)[a1 staticRepresentation];
  [a1 cropRect];
  if (v12) {
    CircularImageInRect = PRImageCreateCircularImageInRect(v13, v14, v15, v16, v17);
  }
  else {
    CircularImageInRect = PRImageCreateWithImageInRect(v13, v14, v15, v16, v17);
  }
  v19 = CircularImageInRect;
  if (CircularImageInRect)
  {
    double Width = (double)CGImageGetWidth(CircularImageInRect);
    double Height = (double)CGImageGetHeight(v19);
    BOOL v22 = a3 * a4 < Height || a2 * a4 < Width;
    if (v22) {
      uint64_t v23 = CGImageCreateByScaling();
    }
    else {
      uint64_t v23 = (uint64_t)CGImageRetain(v19);
    }
    v24 = (CGImage *)v23;
    CGImageRelease(v19);
    if (v24)
    {
      v25 = [v10 objectForKeyedSubscript:@"PRLikenessSnapshotOptionForceDecode"];
      int v26 = [v25 BOOLValue];

      if (v26) {
        PRImageForceDecompress(v24);
      }
      if (v22)
      {
        CGRect v27 = v24;
        double v28 = a2;
        double v29 = a3;
        double v30 = a4;
      }
      else
      {
        double v30 = 1.0;
        CGRect v27 = v24;
        double v28 = Width;
        double v29 = Height;
      }
      objc_msgSend(MEMORY[0x263F1C6B0], "pr_imageWithCGImage:size:scale:", v27, v28, v29, v30);
      v19 = (CGImage *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v24);
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

@end