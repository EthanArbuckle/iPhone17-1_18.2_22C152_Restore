@interface MFPMetafileImage
- (MFPMetafileImage)initWithMetafileData:(id)a3;
- (id)phoneImage;
- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6;
@end

@implementation MFPMetafileImage

- (MFPMetafileImage)initWithMetafileData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPMetafileImage;
  v6 = [(MFPMetafileImage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mMetafileData, a3);
  }

  return v7;
}

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a6;
  p_mMetafileData = &self->mMetafileData;
  v13 = [(NSData *)*p_mMetafileData bytes];
  unsigned int v14 = [(NSData *)*p_mMetafileData length];
  if (v14 < 0x58)
  {
    if (v14 < 0x16) {
      goto LABEL_20;
    }
  }
  else if (v13[10] == 1179469088)
  {
    int v16 = v13[18];
    int v15 = v13[19];
    int v18 = v13[20];
    int v17 = v13[21];
    v74.origin.CGFloat x = x;
    v74.origin.CGFloat y = y;
    v74.size.CGFloat width = width;
    v74.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v74);
    v75.origin.CGFloat x = x;
    v75.origin.CGFloat y = y;
    v75.size.CGFloat width = width;
    v75.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v75);
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v76);
    v77.origin.CGFloat x = x;
    v77.origin.CGFloat y = y;
    v77.size.CGFloat width = width;
    v77.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v77);
    double v23 = (double)v18 * 100.0 / (double)v16;
    double v24 = (double)v17 * 100.0 / (double)v15;
    v13[6] = (int)(MinX * v23);
    v13[7] = (int)(v24 * MinY);
    v13[8] = (int)(v23 * MaxX);
    v13[9] = (int)(v24 * MaxY);
LABEL_19:
    v57 = TCCurrentGraphicsContext();
    CGContextSaveGState(v57);
    +[MFConverter playInCurrentContext:frame:colorMap:fillMap:](MFConverter, "playInCurrentContext:frame:colorMap:fillMap:", *p_mMetafileData, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    CGContextRestoreGState(v57);
    goto LABEL_20;
  }
  if (*v13 == -1698247209)
  {
    id v66 = v11;
    v65 = (void *)[(NSData *)*p_mMetafileData mutableCopy];
    objc_msgSend(v65, "replaceBytesInRange:withBytes:length:", 22, 2, 0, 0);
    objc_storeStrong((id *)p_mMetafileData, v65);
    v25 = [(NSData *)*p_mMetafileData bytes];
    int v26 = [(NSData *)*p_mMetafileData length];
    v60 = p_mMetafileData;
    int v27 = v25[6];
    __int16 v28 = v25[7];
    int v29 = v25[8];
    __int16 v30 = v25[9];
    int v61 = v25[10];
    __int16 v31 = v25[11];
    int v63 = v25[12];
    __int16 v32 = v25[13];
    unint64_t v33 = (unint64_t)&v25[v26 - 10];
    TCVerifyInputMeetsCondition((unint64_t)v25 <= v33);
    v34 = 0;
    v35 = 0;
    int v36 = (__int16)(v28 << 8) | v27;
    int v37 = (__int16)(v30 << 8) | v29;
    double v38 = (double)v36;
    double v39 = (double)v37;
    double v40 = (double)(((__int16)(v31 << 8) | v61) - v36);
    double v41 = (double)(((__int16)(v32 << 8) | v63) - v37);
    v42 = v25 + 40;
    while ((unint64_t)v42 <= v33)
    {
      TCVerifyInputMeetsCondition(v42 > v25);
      int v43 = *v42;
      int v44 = v42[1];
      int v45 = v42[2];
      unsigned int v46 = v42[3];
      TCVerifyInputMeetsCondition((v46 >> 7) ^ 1);
      unsigned int v47 = (2 * v43) | (v44 << 9) | (v45 << 17) | (v46 << 25);
      if (!v47) {
        break;
      }
      int v48 = *((unsigned __int16 *)v42 + 2);
      if (v48 == 523) {
        v35 = (__int16 *)(v42 + 6);
      }
      if (v48 == 524) {
        v34 = (__int16 *)(v42 + 6);
      }
      v42 += v47;
      if (v35)
      {
        if (v34) {
          break;
        }
      }
    }
    id v11 = v66;
    p_mMetafileData = v60;
    if (v35 && v34)
    {
      CGFloat v58 = v41;
      CGFloat v59 = v40;
      CGFloat v62 = v39;
      CGFloat v64 = v38;
      CGFloat v49 = (double)v35[1];
      CGFloat v50 = (double)*v35;
      CGFloat v51 = (double)v34[1];
      CGFloat v52 = (double)*v34;
      memset(&v73, 0, sizeof(v73));
      mapSrcRectOntoDstRect((uint64_t)&v73, v49, v50, v51, v52, x, y, width, height);
      memset(&v72, 0, sizeof(v72));
      mapSrcRectOntoDstRect((uint64_t)&v72, v64, v62, v59, v58, v49, v50, v51, v52);
      CGAffineTransform t1 = v73;
      memset(&v71, 0, sizeof(v71));
      CGAffineTransform t2 = v72;
      CGAffineTransformConcat(&v71, &t1, &t2);
      CGAffineTransform v68 = v71;
      v78.origin.CGFloat x = transformRect(&v68.a, v49, v50);
      CGFloat v53 = v78.origin.x;
      CGFloat v54 = v78.origin.y;
      CGFloat v55 = v78.size.width;
      CGFloat v56 = v78.size.height;
      v35[1] = (int)CGRectGetMinX(v78);
      v79.origin.CGFloat x = v53;
      v79.origin.CGFloat y = v54;
      v79.size.CGFloat width = v55;
      v79.size.CGFloat height = v56;
      __int16 *v35 = (int)CGRectGetMinY(v79);
      v80.origin.CGFloat x = v53;
      v80.origin.CGFloat y = v54;
      v80.size.CGFloat width = v55;
      v80.size.CGFloat height = v56;
      v34[1] = (int)CGRectGetWidth(v80);
      v81.origin.CGFloat x = v53;
      v81.origin.CGFloat y = v54;
      v81.size.CGFloat width = v55;
      v81.size.CGFloat height = v56;
      __int16 *v34 = (int)CGRectGetHeight(v81);
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (id)phoneImage
{
  return 0;
}

- (void).cxx_destruct
{
}

@end