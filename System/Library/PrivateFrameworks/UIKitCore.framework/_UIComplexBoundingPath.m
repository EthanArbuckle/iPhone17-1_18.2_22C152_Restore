@interface _UIComplexBoundingPath
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateBitmap:(id)a3 withOrientation:(int64_t)a4 scale:(double)a5 forCoordinateSpace:(id)a6;
- (BOOL)isNonRectangular;
- (BOOL)validateForCoordinateSpace;
- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6;
- (CGRect)_largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:(CGRect)a3 portraitAspectRatio:(double)a4;
- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5;
- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 againstPortraitEdge:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6;
- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 inPortaitCorner:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6;
- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3;
- (_UIComplexBoundingPath)initWithCoder:(id)a3;
- (_UIComplexBoundingPath)initWithCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5 boundingPathBitmap:(id)a6;
- (_UIComplexBoundingPath)initWithRectangularCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5;
- (_UIIntegralRect)_rectByHorizontallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5;
- (_UIIntegralRect)_rectByVerticallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5;
- (id)_imageRepresentation;
- (id)boundingPathForCoordinateSpace:(id)a3;
- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinateSpace:(id)a3;
@end

@implementation _UIComplexBoundingPath

- (_UIIntegralRect)_rectByHorizontallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5
{
  BOOL v32 = a6;
  _UIIntegralSize var1 = a4->var1;
  retstr->int64_t var0 = a4->var0;
  retstr->_UIIntegralSize var1 = var1;
  result = (_UIIntegralRect *)self->_bitmap;
  if (result) {
    result = (_UIIntegralRect *)[(_UIIntegralRect *)result bitmapData];
  }
  if ((a5 & 0xA) != 0xA)
  {
    unint64_t v33 = retstr->var0.var1;
LABEL_22:
    if ((a5 & 0xA) == 0) {
      return result;
    }
    unint64_t v21 = (a5 >> 1) & 1;
    unint64_t v22 = (a5 >> 3) & 1;
    int64_t var0 = retstr->var0.var0;
    int64_t v24 = retstr->var1.var0;
    int64_t v25 = retstr->var0.var0 + v24;
    unint64_t v26 = v33 + 1;
    int64_t v31 = retstr->var1.var1 + v33;
    unint64_t v27 = v33 + 1;
    int64_t v28 = retstr->var0.var0;
    while (1)
    {
      if (v24 < 1) {
        return result;
      }
      int64_t v29 = v24 + v28;
      if (var0 > v24 + v28 || v25 < v28) {
        return result;
      }
      if (v21)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v37 = 0;
        result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, var0, v27);
        if (result)
        {
          BOOL v30 = (uint64_t)(v27 + 1) <= v31;
          LODWORD(v21) = (uint64_t)(v27 + 1) <= v31 || v32;
          if ((uint64_t)(v27 + 1) <= v31) {
            ++v27;
          }
          else {
            unint64_t v27 = v33;
          }
          if (!v30) {
            ++var0;
          }
          if ((v22 & 1) == 0) {
            goto LABEL_44;
          }
        }
        else
        {
          int64_t v28 = var0 + 1;
          retstr->var0.int64_t var0 = var0 + 1;
          int64_t v24 = v29 + ~var0;
          retstr->var1.int64_t var0 = v24;
          if (v24 < 1) {
            return result;
          }
          LODWORD(v21) = 1;
          unint64_t v27 = v33;
          ++var0;
          if ((v22 & 1) == 0)
          {
LABEL_44:
            LODWORD(v22) = 0;
            goto LABEL_51;
          }
        }
      }
      else
      {
        LODWORD(v21) = 0;
        if ((v22 & 1) == 0) {
          goto LABEL_44;
        }
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v37 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v25, v26);
      if ((result & 1) == 0)
      {
        v24 += v25 + ~(v28 + v24);
        retstr->var1.int64_t var0 = v24;
LABEL_46:
        --v25;
        LODWORD(v22) = (result & 1) == 0 || v32;
        unint64_t v26 = v33;
        goto LABEL_51;
      }
      if ((uint64_t)++v26 > v31) {
        goto LABEL_46;
      }
      LODWORD(v22) = 1;
LABEL_51:
      if (((v21 | v22) & 1) == 0) {
        return result;
      }
    }
  }
  BOOL v10 = (a5 & 2) == 0;
  BOOL v11 = (a5 & 8) == 0;
  int64_t v12 = retstr->var0.var0;
  uint64_t v13 = retstr->var1.var0;
  unint64_t v33 = retstr->var0.var1;
  unint64_t v14 = retstr->var1.var1 + v33;
  while (v13 >= 1)
  {
    if (v10)
    {
      int v15 = 1;
      if (v11) {
        goto LABEL_22;
      }
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v37 = 0;
      char v17 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12, v33);
      if ((v17 & 1) == 0)
      {
        v12 += v16;
        retstr->var0.int64_t var0 = v12;
        v13 -= v16;
        retstr->var1.int64_t var0 = v13;
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v37 = 0;
      result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12, v14);
      if ((result & 1) == 0)
      {
        v12 += v18;
        retstr->var0.int64_t var0 = v12;
        v13 -= v18;
        retstr->var1.int64_t var0 = v13;
      }
      if (v13 < 1) {
        return result;
      }
      int v15 = result & v17 & 1;
      if (v11) {
        goto LABEL_22;
      }
    }
    unint64_t v19 = v12 + v13;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v37 = 0;
    char v20 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v12 + v13, v33);
    if ((v20 & 1) == 0)
    {
      retstr->var1.int64_t var0 = --v13;
      unint64_t v19 = v13 + v12;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v37 = 0;
    result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v34, v19, v14);
    if ((result & 1) == 0) {
      retstr->var1.int64_t var0 = --v13;
    }
    BOOL v10 = 0;
    BOOL v11 = 0;
    if ((((result & v20 & 1) == 0) & ~v15) == 0) {
      goto LABEL_22;
    }
  }
  return result;
}

- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 againstPortraitEdge:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  bitmap = self->_bitmap;
  if (bitmap) {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
  }
  if (a4 == 8 || a4 == 2)
  {
    v134.origin.CGFloat x = x;
    v134.origin.CGFloat y = y;
    v134.size.double width = width;
    v134.size.double height = height;
    CGFloat v14 = CGRectGetHeight(v134) * 0.333333333;
    v135.origin.CGFloat x = x;
    v135.origin.CGFloat y = y;
    v135.size.double width = width;
    v135.size.double height = height;
    CGRect v136 = CGRectInset(v135, 0.0, v14);
    CGRect v137 = CGRectIntegral(v136);
    uint64_t v15 = (uint64_t)v137.origin.x;
    uint64_t v16 = (uint64_t)v137.origin.y;
    uint64_t v17 = (uint64_t)v137.size.width;
    uint64_t v18 = (uint64_t)v137.size.height + (uint64_t)v137.origin.y;
    int64_t v19 = v18;
    int64_t v20 = (uint64_t)v137.origin.y;
    while (v20 <= v19)
    {
      double v21 = (double)(v15 + v17) + a3;
      if (a4 == 2) {
        double v21 = (double)v15 - a3;
      }
      unint64_t v22 = (uint64_t)v21;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v133 = 0;
      if (_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, (uint64_t)v21, v20))
      {
        ++v20;
      }
      else if (a4 == 2)
      {
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v22, v20);
        v15 += v23;
      }
      else
      {
        uint64_t v15 = (uint64_t)((double)v15 + -1.0);
      }
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v133 = 0;
      char v24 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v22, v19);
      uint64_t v26 = (uint64_t)((double)v15 + -1.0);
      if (a4 == 2) {
        uint64_t v26 = v25 + v15;
      }
      if (v24) {
        int64_t v19 = (uint64_t)((double)v19 + -1.0);
      }
      else {
        uint64_t v15 = v26;
      }
      if (v15 < 0 || v16 < 0 || v15 + v17 || v18) {
        goto LABEL_174;
      }
    }
    double v27 = (double)v15;
    double v28 = y;
  }
  else
  {
    v138.origin.CGFloat x = x;
    v138.origin.CGFloat y = y;
    v138.size.double width = width;
    v138.size.double height = height;
    CGFloat v29 = CGRectGetWidth(v138) * 0.333333333;
    v139.origin.CGFloat x = x;
    v139.origin.CGFloat y = y;
    v139.size.double width = width;
    v139.size.double height = height;
    CGRect v140 = CGRectInset(v139, v29, 0.0);
    CGRect v141 = CGRectIntegral(v140);
    uint64_t v30 = (uint64_t)v141.origin.x;
    uint64_t v31 = (uint64_t)v141.origin.y;
    uint64_t v32 = (uint64_t)v141.size.height;
    uint64_t v33 = (uint64_t)v141.size.width + (uint64_t)v141.origin.x;
    int64_t v34 = (uint64_t)v141.origin.x;
    int64_t v35 = v33;
    while (1)
    {
      double v28 = (double)v31;
      if (v34 > v35) {
        break;
      }
      double v36 = (double)(v31 + v32) + a3;
      if (a4 == 1) {
        double v36 = v28 - a3;
      }
      unint64_t v37 = (uint64_t)v36;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v133 = 0;
      if (_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v34, (uint64_t)v36))
      {
        v34 += v38;
      }
      else if (a4 == 1)
      {
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v34, v37);
        ++v31;
      }
      else
      {
        uint64_t v31 = (uint64_t)((double)v31 + -1.0);
      }
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      uint64_t v133 = 0;
      char v39 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v35, v37);
      uint64_t v40 = (uint64_t)((double)v31 + -1.0);
      if (a4 == 1) {
        uint64_t v40 = v31 + 1;
      }
      if (v39) {
        int64_t v35 = (uint64_t)((double)v35 + -1.0);
      }
      else {
        uint64_t v31 = v40;
      }
      if (v30 < 0 || v31 < 0 || v33 || v31 + v32) {
        goto LABEL_174;
      }
    }
    double v27 = x;
  }
  double v41 = width;
  double v42 = height;
  double v43 = 1.0;
  double v44 = fmin(a3 * 0.2 + 1.0, 5.0);
  unint64_t v45 = a4 - 1;
  switch(a4)
  {
    case 1uLL:
      double v28 = v44 + v28;
      if (height > v44 + v44) {
        double v42 = height - (v44 + v44);
      }
      else {
        double v42 = height;
      }
      break;
    case 2uLL:
      double v27 = v44 + v27;
      if (width > v44 + v44) {
        double v41 = width - (v44 + v44);
      }
      else {
        double v41 = width;
      }
      break;
    case 4uLL:
      if (height > v44 + v44) {
        double v42 = height - (v44 + v44);
      }
      else {
        double v42 = height;
      }
      if (height > v44 + v44) {
        double v28 = v44 + v28;
      }
      else {
        double v28 = v28 - v44;
      }
      break;
    case 8uLL:
      if (width > v44 + v44) {
        double v41 = width - (v44 + v44);
      }
      else {
        double v41 = width;
      }
      if (width > v44 + v44) {
        double v27 = v44 + v27;
      }
      else {
        double v27 = v27 - v44;
      }
      break;
    default:
      break;
  }
  double v112 = v44;
  double v113 = height;
  double v114 = width;
  double var0 = (double)a6->var0;
  double var1 = (double)a6->var1;
  double var2 = (double)a6->var2;
  double var3 = (double)a6->var3;
  double v46 = ceil(((var0 + a3) * 1.57079633 + (var1 + a3) * 1.57079633 + (var2 + a3) * 1.57079633 + (var3 + a3) * 1.57079633)* 0.5);
  if (v46 < 8.0) {
    double v46 = 8.0;
  }
  BOOL v47 = a4 == 8 || a4 == 2;
  double v48 = (double)(unint64_t)v46 * 0.125;
  unint64_t v49 = vcvtpd_u64_f64(v48);
  if (v47) {
    double v50 = 1.0;
  }
  else {
    double v50 = 0.0;
  }
  if (a4 != 4 && a4 != 1) {
    double v43 = 0.0;
  }
  double v121 = v43;
  double v122 = v50;
  if (v49)
  {
    unint64_t v52 = 0;
    double v117 = 0.785398163 / (double)(unint64_t)ceil(v48);
    while (v41 > 0.0 && v42 > 0.0)
    {
      unint64_t v53 = 0;
      double v128 = v42;
      double v129 = v41;
      double v123 = v28;
      double v54 = v28 + v42;
      double v55 = v117 * (double)v52;
      double v120 = v27 + v41;
      double v56 = v27 + v41 - var2;
      double v124 = v54;
      double v126 = v27;
      double v57 = v54 - var2;
      char v58 = 1;
      while (1)
      {
        char v59 = v58;
        __double2 v60 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        char v61 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v56 + (var2 + a3) * v60.__cosval), llround(v57 + (var2 + a3) * v60.__sinval));
        BOOL v62 = (v61 & 1) == 0;
        if ((v61 & 1) == 0) {
          break;
        }
        char v58 = 0;
        unint64_t v53 = 1;
        if ((v59 & 1) == 0)
        {
          unint64_t v53 = 2;
          goto LABEL_86;
        }
      }
      double v128 = v128 - v122;
      double v129 = v129 - v121;
LABEL_86:
      while (1)
      {
        __double2 v63 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v126 + var1 + (var1 + a3) * v63.__cosval), llround(v124 - var1 + (var1 + a3) * v63.__sinval)) & 1) == 0)break; {
        if (++v53 == 4)
        }
        {
          double v64 = v126;
          double v125 = v126;
          double v65 = v123;
          goto LABEL_91;
        }
      }
      double v64 = v126;
      double v125 = v121 + v126;
      double v41 = v129 - v121;
      double v42 = v128 - v122;
      double v65 = v123;
      if (v53 > 5)
      {
        double v69 = v123;
        goto LABEL_97;
      }
      double v128 = v128 - v122;
      double v129 = v129 - v121;
      BOOL v62 = 1;
LABEL_91:
      double v66 = v64 + var0;
      double v67 = v65 + var0;
      while (1)
      {
        __double2 v68 = __sincos_stret(v55 + (double)v53 * 0.785398163);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v66 + (var0 + a3) * v68.__cosval), llround(v67 + (var0 + a3) * v68.__sinval)) & 1) == 0)break; {
        if (++v53 == 6)
        }
        {
          double v65 = v123;
          double v127 = v123;
          goto LABEL_99;
        }
      }
      double v125 = v121 + v125;
      double v41 = v129 - v121;
      double v65 = v123;
      double v69 = v122 + v123;
      double v42 = v128 - v122;
LABEL_97:
      if (v53 > 7)
      {
LABEL_105:
        double v72 = v125;
LABEL_106:
        unint64_t v52 = 0;
      }
      else
      {
        double v127 = v69;
        double v128 = v42;
        double v129 = v41;
        BOOL v62 = 1;
LABEL_99:
        double v70 = v65 + var3;
        do
        {
          __double2 v71 = __sincos_stret(v55 + (double)v53 * 0.785398163);
          long long v130 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          uint64_t v133 = 0;
          if ((_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, llround(v120 - var3 + (var3 + a3) * v71.__cosval), llround(v70 + (var3 + a3) * v71.__sinval)) & 1) == 0)
          {
            double v41 = v129 - v121;
            double v69 = v122 + v127;
            double v42 = v128 - v122;
            goto LABEL_105;
          }
          ++v53;
        }
        while (v53 != 8);
        if (v62)
        {
          double v42 = v128;
          double v41 = v129;
          double v72 = v125;
          double v69 = v127;
          goto LABEL_106;
        }
        ++v52;
        double v42 = v128;
        double v41 = v129;
        double v72 = v125;
        double v69 = v127;
      }
      double v27 = v72;
      double v28 = v69;
      if (v52 >= v49) {
        goto LABEL_112;
      }
    }
    double v72 = *MEMORY[0x1E4F1DB20];
    double v69 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v41 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v42 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    double v72 = v27;
    double v69 = v28;
  }
LABEL_112:
  if (a4 == 8 || a4 == 2)
  {
    if (v42 <= 0.0)
    {
      double v73 = v72;
      double v76 = v42;
      double v78 = v69;
    }
    else
    {
      double v73 = v72;
      double v74 = v72 + v41;
      double v75 = v42;
      double v76 = v42;
      double v77 = v69;
      double v78 = v69;
LABEL_116:
      if (v41 <= 0.0)
      {
        double v78 = v77;
        double v76 = v75;
      }
      else
      {
        int64_t v79 = llround(v73 + (double)a6->var0);
        unint64_t v80 = llround(v78 - a3);
        int64_t v81 = llround(v74 - (double)a6->var3);
        while (v79 <= v81)
        {
          long long v130 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          uint64_t v133 = 0;
          char v82 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v79, v80);
          v79 += v83;
          if ((v82 & 1) == 0)
          {
            double v78 = v78 + 1.0;
            double v76 = v76 + -1.0;
            if (v76 > 0.0) {
              goto LABEL_116;
            }
            break;
          }
        }
      }
    }
    if (v76 <= 0.0)
    {
      double v92 = v76;
      double v99 = v113;
      double v93 = v114;
    }
    else
    {
      double v92 = v76;
      double v93 = v114;
LABEL_133:
      if (v41 <= 0.0)
      {
        double v92 = v76;
      }
      else
      {
        int64_t v94 = llround(v73 + (double)a6->var1);
        unint64_t v95 = llround(v78 + v92 + a3);
        int64_t v96 = llround(v73 + v41 - (double)a6->var2);
        while (v94 <= v96)
        {
          long long v130 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          uint64_t v133 = 0;
          char v97 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v94, v95);
          v94 += v98;
          if ((v97 & 1) == 0)
          {
            double v92 = v92 + -1.0;
            if (v92 > 0.0) {
              goto LABEL_133;
            }
            break;
          }
        }
      }
      double v99 = v113;
    }
    double v100 = v112;
    double v72 = v73;
    goto LABEL_159;
  }
  double v84 = v69 + v42;
  if (v41 <= 0.0)
  {
    double v85 = v41;
  }
  else
  {
    double v85 = v41;
    double v86 = v72;
LABEL_124:
    double v87 = v69;
    if (v42 <= 0.0)
    {
      double v72 = v86;
      double v85 = v41;
    }
    else
    {
      unint64_t v88 = llround(v72 - a3);
      int64_t v89 = llround(v69 + (double)a6->var0);
      int64_t v90 = llround(v84 - (double)a6->var1);
      while (v89 <= v90)
      {
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        char v91 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v88, v89++);
        if ((v91 & 1) == 0)
        {
          double v72 = v72 + 1.0;
          double v85 = v85 + -1.0;
          double v69 = v87;
          if (v85 > 0.0) {
            goto LABEL_124;
          }
          goto LABEL_147;
        }
      }
    }
    double v69 = v87;
  }
LABEL_147:
  if (v85 <= 0.0)
  {
    double v92 = v42;
    double v78 = v69;
    double v41 = v85;
LABEL_156:
    double v99 = v113;
    double v93 = v114;
    double v100 = v112;
    goto LABEL_159;
  }
  double v101 = v69;
  double v41 = v85;
  while (2)
  {
    if (v42 > 0.0)
    {
      unint64_t v102 = llround(v72 + v41 + a3);
      int64_t v103 = llround(v101 + (double)a6->var3);
      int64_t v104 = llround(v84 - (double)a6->var2);
      do
      {
        if (v103 > v104)
        {
          double v92 = v42;
          goto LABEL_158;
        }
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        uint64_t v133 = 0;
        char v105 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v130, v102, v103++);
      }
      while ((v105 & 1) != 0);
      double v41 = v41 + -1.0;
      if (v41 > 0.0) {
        continue;
      }
      double v92 = v42;
      double v78 = v101;
      goto LABEL_156;
    }
    break;
  }
  double v92 = v42;
  double v41 = v85;
LABEL_158:
  double v99 = v113;
  double v93 = v114;
  double v100 = v112;
  double v78 = v101;
LABEL_159:
  switch(v45)
  {
    case 0uLL:
      double v78 = v78 - v100;
      double v106 = v100 + v100;
      if (v99 > v100 + v100) {
        goto LABEL_166;
      }
      break;
    case 1uLL:
      double v72 = v72 - v100;
      double v107 = v100 + v100;
      if (v93 > v100 + v100) {
        goto LABEL_169;
      }
      break;
    case 3uLL:
      double v106 = v100 + v100;
      if (v99 <= v100 + v100)
      {
        double v78 = v100 + v78;
      }
      else
      {
        double v78 = v78 - v100;
LABEL_166:
        double v92 = v106 + v92;
      }
      break;
    case 7uLL:
      double v107 = v100 + v100;
      if (v93 <= v100 + v100)
      {
        double v72 = v100 + v72;
      }
      else
      {
        double v72 = v72 - v100;
LABEL_169:
        double v41 = v107 + v41;
      }
      break;
    default:
      break;
  }
  if (v41 <= 0.0 || (double v108 = v92, v92 <= 0.0))
  {
LABEL_174:
    double v72 = *MEMORY[0x1E4F1DB20];
    double v78 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v41 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v108 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v109 = v72;
  double v110 = v78;
  double v111 = v41;
  result.size.double height = v108;
  result.size.double width = v111;
  result.origin.CGFloat y = v110;
  result.origin.CGFloat x = v109;
  return result;
}

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  char v6 = a6;
  double width = a4.size.width;
  double height = a4.size.height;
  double x = a4.origin.x;
  double y = a4.origin.y;
  CGFloat r1 = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  uint64_t v13 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v13)
  {
    double v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:418 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v13 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double scale = self->_scale;
  int64_t orientation = self->_orientation;
  bitmap = self->_bitmap;
  double v57 = scale;
  if (bitmap)
  {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
    uint64_t v25 = self->_bitmap;
    double v56 = (double)(unint64_t)v75 / scale;
    if (v25)
    {
      [(_UIBoundingPathBitmap *)v25 bitmapData];
      double v26 = (double)*((unint64_t *)&v71 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v78 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v75 = 0u;
    double v56 = 0.0 / scale;
  }
  uint64_t v74 = 0;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  double v26 = 0.0;
LABEL_8:
  v79.size.double height = r1;
  v79.size.double width = v8;
  v79.origin.double y = v9;
  v79.origin.double x = v10;
  v90.origin.double x = v15;
  v90.origin.double y = v17;
  v90.size.double width = v19;
  v90.size.double height = v21;
  CGRect v80 = CGRectIntersection(v79, v90);
  -[_UIBoundingPath _inscribedRectInBoundingRect:byInsettingRect:onEdges:](self, "_inscribedRectInBoundingRect:byInsettingRect:onEdges:", a5, v80.origin.x, v80.origin.y, v80.size.width, v80.size.height, x, y, width, height);
  double v27 = v81.origin.x;
  double v28 = v81.origin.y;
  double v29 = v81.size.width;
  double v30 = v81.size.height;
  if (CGRectIsNull(v81) || v29 <= 0.0 || v30 <= 0.0) {
    goto LABEL_16;
  }
  double v31 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, v27, v28, v29, v30, v56, v26 / v57);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  unint64_t v38 = _UIRectEdgeConvertedFromOrientationToPortrait(a5, orientation);
  CGAffineTransformMakeScale(&v70, v57, v57);
  v82.origin.double x = v31;
  v82.origin.double y = v33;
  v82.size.double width = v35;
  v82.size.double height = v37;
  CGRect v83 = CGRectApplyAffineTransform(v82, &v70);
  CGRect v84 = CGRectIntegral(v83);
  if ((uint64_t)v84.size.width < 1 || (uint64_t)v84.size.height <= 0) {
    goto LABEL_16;
  }
  *(void *)&long long v64 = (uint64_t)v84.origin.x;
  *((void *)&v64 + 1) = (uint64_t)v84.origin.y;
  uint64_t v65 = (uint64_t)v84.size.width;
  uint64_t v66 = (uint64_t)v84.size.height;
  -[_UIComplexBoundingPath _rectByHorizontallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:](self, "_rectByHorizontallyInsettingPortraitPixelRect:onPortraitEdges:performCompleteTest:", &v64, v38, (v6 & 1) == 0, v84.origin.x, v84.origin.y);
  if (v68 < 1
    || v69 <= 0
    || (long long v64 = v67,
        uint64_t v65 = v68,
        uint64_t v66 = v69,
        [(_UIComplexBoundingPath *)self _rectByVerticallyInsettingPortraitPixelRect:&v64 onPortraitEdges:v38 performCompleteTest:(v6 & 1) == 0], v68 < 1)|| v69 <= 0)
  {
LABEL_16:
    CGFloat v40 = *MEMORY[0x1E4F1DB20];
    CGFloat v41 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v42 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v43 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    CGFloat v48 = (double)(uint64_t)v67;
    CGFloat v49 = (double)*((uint64_t *)&v67 + 1);
    CGFloat v50 = (double)v68;
    CGFloat v51 = (double)v69;
    CGAffineTransformMakeScale(&v63, 1.0 / v57, 1.0 / v57);
    v85.origin.double x = v48;
    v85.origin.double y = v49;
    v85.size.double width = v50;
    v85.size.double height = v51;
    CGRect v86 = CGRectApplyAffineTransform(v85, &v63);
    v91.origin.double x = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v86.origin.x, v86.origin.y, v86.size.width, v86.size.height, v56, v26 / v57);
    v91.origin.double y = v52;
    v91.size.double width = v53;
    v91.size.double height = v54;
    v87.origin.double x = x;
    v87.origin.double y = y;
    v87.size.double width = width;
    v87.size.double height = height;
    CGRect v88 = CGRectIntersection(v87, v91);
    CGFloat v40 = v88.origin.x;
    CGFloat v41 = v88.origin.y;
    CGFloat v42 = v88.size.width;
    CGFloat v43 = v88.size.height;
  }

  double v44 = v40;
  double v45 = v41;
  double v46 = v42;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  BOOL v11 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v11)
  {
    char v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:1325 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double scale = self->_scale;
  int64_t orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
    uint64_t v23 = self->_bitmap;
    double v60 = (double)(unint64_t)v69 / scale;
    if (v23)
    {
      [(_UIBoundingPathBitmap *)v23 bitmapData];
      double v24 = (double)*((unint64_t *)&v65 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v72 = 0;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    double v60 = 0.0 / scale;
  }
  uint64_t v68 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  double v24 = 0.0;
LABEL_8:
  v81.origin.double x = v13;
  v81.origin.double y = v15;
  v81.size.double width = v17;
  v81.size.double height = v19;
  CGRect v73 = CGRectIntersection(a4, v81);
  -[_UIBoundingPath _rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:", a3, v73.origin.x, v73.origin.y, v73.size.width, v73.size.height, a5, a7);
  double x = v74.origin.x;
  double y = v74.origin.y;
  double width = v74.size.width;
  double height = v74.size.height;
  if (CGRectIsNull(v74)) {
    goto LABEL_17;
  }
  double v29 = v24 / scale;
  double v30 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, x, y, width, height, v60, v29);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  unint64_t v37 = _UIRectEdgeConvertedFromOrientationToPortrait(a3, orientation);
  CGAffineTransformMakeScale(&v64, scale, scale);
  v75.origin.double x = v30;
  v75.origin.double y = v32;
  v75.size.double width = v34;
  v75.size.double height = v36;
  CGRect v76 = CGRectApplyAffineTransform(v75, &v64);
  uint64_t v38 = (uint64_t)(a6.topLeft * scale);
  uint64_t v39 = (uint64_t)(a6.bottomLeft * scale);
  uint64_t v40 = (uint64_t)(a6.bottomRight * scale);
  uint64_t v41 = (uint64_t)(a6.topRight * scale);
  if (orientation == 2)
  {
    uint64_t v42 = (uint64_t)(a6.topLeft * scale);
    uint64_t v43 = (uint64_t)(a6.topRight * scale);
    uint64_t v41 = (uint64_t)(a6.bottomRight * scale);
    uint64_t v40 = (uint64_t)(a6.bottomLeft * scale);
    goto LABEL_15;
  }
  if (orientation == 3)
  {
    uint64_t v42 = (uint64_t)(a6.topRight * scale);
    uint64_t v43 = (uint64_t)(a6.bottomRight * scale);
    uint64_t v41 = (uint64_t)(a6.bottomLeft * scale);
    uint64_t v40 = (uint64_t)(a6.topLeft * scale);
    goto LABEL_15;
  }
  uint64_t v42 = (uint64_t)(a6.bottomLeft * scale);
  uint64_t v43 = (uint64_t)(a6.topLeft * scale);
  if (orientation == 4)
  {
LABEL_15:
    uint64_t v38 = v41;
    uint64_t v41 = v40;
    uint64_t v40 = v42;
    uint64_t v39 = v43;
  }
  v63[0] = v38;
  v63[1] = v39;
  v63[2] = v40;
  v63[3] = v41;
  -[_UIComplexBoundingPath _portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:againstPortraitEdge:fromPortraitPixelRect:withPortraitPixelCornerRadii:](self, "_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:againstPortraitEdge:fromPortraitPixelRect:withPortraitPixelCornerRadii:", v37, v63, scale * a7, v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
  CGFloat v44 = v77.origin.x;
  CGFloat v45 = v77.origin.y;
  CGFloat v46 = v77.size.width;
  CGFloat v47 = v77.size.height;
  if (!CGRectIsNull(v77))
  {
    CGAffineTransformMakeScale(&v62, 1.0 / scale, 1.0 / scale);
    v78.origin.double x = v44;
    v78.origin.double y = v45;
    v78.size.double width = v46;
    v78.size.double height = v47;
    CGRect v79 = CGRectApplyAffineTransform(v78, &v62);
    double v48 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v79.origin.x, v79.origin.y, v79.size.width, v79.size.height, v60, v29);
    double v49 = v52;
    double v50 = v53;
    double v51 = v54;
    goto LABEL_19;
  }
LABEL_17:
  double v48 = *MEMORY[0x1E4F1DB20];
  double v49 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v50 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v51 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_19:

  double v55 = v48;
  double v56 = v49;
  double v57 = v50;
  double v58 = v51;
  result.size.double height = v58;
  result.size.double width = v57;
  result.origin.double y = v56;
  result.origin.double x = v55;
  return result;
}

- (BOOL)_validateBitmap:(id)a3 withOrientation:(int64_t)a4 scale:(double)a5 forCoordinateSpace:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (v11)
    {
      [v11 bitmapData];
      unint64_t v13 = v41;
      [v11 bitmapData];
      unint64_t v14 = *((void *)&v33 + 1);
    }
    else
    {
      unint64_t v13 = 0;
      unint64_t v14 = 0;
      uint64_t v44 = 0;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v41 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v36 = 0;
    }
  }
  else if (v11)
  {
    [v11 bitmapData];
    unint64_t v13 = *((void *)&v45 + 1);
    [v11 bitmapData];
    unint64_t v14 = v37;
  }
  else
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v40 = 0;
  }
  [v12 bounds];
  double v16 = v15;
  double v18 = v17;
  CGAffineTransformMakeScale(&v32, a5, a5);
  double v19 = v16 * v32.a + v18 * v32.c;
  double v20 = v16 * v32.b + v18 * v32.d;
  BOOL v21 = v19 <= (double)v13;
  if (v20 > (double)v14) {
    BOOL v21 = 0;
  }
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v21)
    {
      unint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      double v31 = +[UIApplication stringForInterfaceOrientation:a4];
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIComplexBoundingPath.m", 134, @"Bounding path likely out of sync with its coordinate space: The bitmap cannot be smaller than the coordinate space's bounds (in pixels), adjusted for orientation. Bitmap orientation-adjusted size: {width=%lu, height=%lu}; Orientation: %@; Scale: %.1f; Coordinate space: %@",
        v13,
        v14,
        v31,
        *(void *)&a5,
        v12);
LABEL_13:

LABEL_16:
      BOOL v23 = 0;
      goto LABEL_18;
    }
  }
  else if (!v21)
  {
    if (!os_variant_has_internal_diagnostics()) {
      goto LABEL_16;
    }
    double v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_19_6) + 8);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    unint64_t v22 = v27;
    double v31 = +[UIApplication stringForInterfaceOrientation:a4];
    *(_DWORD *)buf = 134219010;
    unint64_t v50 = v13;
    __int16 v51 = 2048;
    unint64_t v52 = v14;
    __int16 v53 = 2112;
    double v54 = v31;
    __int16 v55 = 2048;
    double v56 = a5;
    __int16 v57 = 2112;
    id v58 = v12;
    _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Bounding path likely out of sync with its coordinate space: The bitmap cannot be smaller than the coordinate space's bounds (in pixels), adjusted for orientation. Bitmap orientation-adjusted size: {width=%lu, height=%lu}; Orient"
      "ation: %@; Scale: %.1f; Coordinate space: %@",
      buf,
      0x34u);
    goto LABEL_13;
  }
  if (v19 + a5 < (double)v13) {
    goto LABEL_16;
  }
  BOOL v23 = v20 + a5 >= (double)v14;
LABEL_18:
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v23)
    {
      double v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v25 = +[UIApplication stringForInterfaceOrientation:a4];
        v13,
        v14,
        v25,
        *(void *)&a5,
        v12);
    }
  }
  else if (!v23)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E460) + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        double v29 = v28;
        double v30 = +[UIApplication stringForInterfaceOrientation:a4];
        *(_DWORD *)buf = 134219010;
        unint64_t v50 = v13;
        __int16 v51 = 2048;
        unint64_t v52 = v14;
        __int16 v53 = 2112;
        double v54 = v30;
        __int16 v55 = 2048;
        double v56 = a5;
        __int16 v57 = 2112;
        id v58 = v12;
          buf,
          0x34u);
      }
    }
  }

  return v23;
}

- (BOOL)validateForCoordinateSpace
{
  v2 = self;
  bitmap = self->_bitmap;
  int64_t orientation = self->_orientation;
  double scale = self->_scale;
  char v6 = [(_UIBoundingPath *)self coordinateSpace];
  LOBYTE(v2) = [(_UIComplexBoundingPath *)v2 _validateBitmap:bitmap withOrientation:orientation scale:v6 forCoordinateSpace:scale];

  return (char)v2;
}

- (_UIIntegralRect)_rectByVerticallyInsettingPortraitPixelRect:(SEL)a3 onPortraitEdges:(_UIIntegralRect *)a4 performCompleteTest:(unint64_t)a5
{
  BOOL v31 = a6;
  _UIIntegralSize var1 = a4->var1;
  retstr->unint64_t var0 = a4->var0;
  retstr->_UIIntegralSize var1 = var1;
  CGRect result = (_UIIntegralRect *)self->_bitmap;
  if (result) {
    CGRect result = (_UIIntegralRect *)[(_UIIntegralRect *)result bitmapData];
  }
  unint64_t var0 = retstr->var0.var0;
  if ((a5 & 5) != 5)
  {
LABEL_20:
    if ((a5 & 5) == 0) {
      return result;
    }
    LOBYTE(v20) = a5 & 1;
    unint64_t v21 = (a5 >> 2) & 1;
    uint64_t v22 = retstr->var1.var1;
    int64_t v23 = retstr->var0.var1;
    int64_t v24 = v23 + v22;
    int64_t v25 = var0 + 1;
    int64_t v30 = retstr->var1.var0 + var0;
    int64_t v26 = v23;
    unint64_t v27 = var0 + 1;
    while (1)
    {
      if (v22 < 1 || v26 > v22 + v23 || v24 < v23) {
        return result;
      }
      if (v20)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v35 = 0;
        CGRect result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v27, v26);
        if (result)
        {
          int v20 = (uint64_t)(v28 + v27) <= v30 || v31;
          if ((uint64_t)(v28 + v27) <= v30)
          {
            v27 += v28;
          }
          else
          {
            ++v26;
            unint64_t v27 = var0;
          }
          if ((v21 & 1) == 0) {
            goto LABEL_40;
          }
        }
        else
        {
          retstr->var0._UIIntegralSize var1 = ++v26;
          v22 += v23 - v26;
          retstr->var1._UIIntegralSize var1 = v22;
          if (v22 < 1) {
            return result;
          }
          int v20 = 1;
          int64_t v23 = v26;
          unint64_t v27 = var0;
          if ((v21 & 1) == 0)
          {
LABEL_40:
            LODWORD(v21) = 0;
            goto LABEL_47;
          }
        }
      }
      else
      {
        int v20 = 0;
        if ((v21 & 1) == 0) {
          goto LABEL_40;
        }
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v35 = 0;
      CGRect result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v25, v24);
      if ((result & 1) == 0)
      {
        v22 += v24 + ~(v22 + v23);
        retstr->var1._UIIntegralSize var1 = v22;
LABEL_42:
        --v24;
        LODWORD(v21) = (result & 1) == 0 || v31;
        int64_t v25 = var0;
        goto LABEL_47;
      }
      v25 += v29;
      if (v25 > v30) {
        goto LABEL_42;
      }
      LODWORD(v21) = 1;
LABEL_47:
      if (((v20 | v21) & 1) == 0) {
        return result;
      }
    }
  }
  BOOL v11 = (a5 & 1) == 0;
  BOOL v12 = (a5 & 4) == 0;
  unint64_t v13 = retstr->var0.var1;
  unint64_t v14 = retstr->var1.var0 + var0;
  int64_t v15 = retstr->var1.var1;
  while (v15 >= 1)
  {
    if (v11)
    {
      int v16 = 1;
      if (v12) {
        goto LABEL_20;
      }
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v35 = 0;
      unsigned __int8 v17 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, var0, v13);
      if ((v17 & 1) == 0)
      {
        retstr->var0._UIIntegralSize var1 = ++v13;
        retstr->var1._UIIntegralSize var1 = --v15;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v35 = 0;
      CGRect result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v14, v13);
      if ((result & 1) == 0)
      {
        retstr->var0._UIIntegralSize var1 = ++v13;
        retstr->var1._UIIntegralSize var1 = --v15;
      }
      if (v15 < 1) {
        return result;
      }
      int v16 = result & 1 & v17;
      if (v12) {
        goto LABEL_20;
      }
    }
    unint64_t v18 = v15 + v13;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v35 = 0;
    unsigned __int8 v19 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, var0, v15 + v13);
    if ((v19 & 1) == 0)
    {
      retstr->var1._UIIntegralSize var1 = --v15;
      unint64_t v18 = v15 + v13;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v35 = 0;
    CGRect result = (_UIIntegralRect *)_UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v32, v14, v18);
    if ((result & 1) == 0) {
      retstr->var1._UIIntegralSize var1 = --v15;
    }
    BOOL v11 = 0;
    BOOL v12 = 0;
    if ((((result & 1 & v19) == 0) & ~v16) == 0) {
      goto LABEL_20;
    }
  }
  return result;
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = 1.0 / self->_scale;
  -[_UIComplexBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 10, 1, x, a3.origin.y, width, a3.size.height, x, CGRectGetMidY(a3), width, v8);
  CGFloat v9 = v32.origin.x;
  CGFloat v10 = v32.origin.y;
  CGFloat v11 = v32.size.width;
  CGFloat rect = v32.size.height;
  if (CGRectIsNull(v32)) {
    goto LABEL_3;
  }
  CGFloat v29 = v11;
  CGFloat v30 = v10;
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  -[_UIComplexBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 5, 1, x, y, width, height, CGRectGetMidX(v33), y, v8, height);
  CGFloat v12 = v34.origin.x;
  CGFloat v13 = v34.origin.y;
  CGFloat v28 = v34.size.width;
  CGFloat v14 = v34.size.height;
  if (CGRectIsNull(v34))
  {
LABEL_3:
    double v15 = INFINITY;
    double v16 = INFINITY;
    double v17 = INFINITY;
    double v18 = INFINITY;
  }
  else
  {
    v35.origin.double x = v12;
    v35.origin.double y = v13;
    v35.size.double width = v28;
    v35.size.double height = v14;
    CGFloat v26 = v12;
    double MinY = CGRectGetMinY(v35);
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    double v15 = MinY - CGRectGetMinY(v36);
    v37.origin.double x = v9;
    v37.size.double width = v29;
    v37.origin.double y = v30;
    v37.size.double height = rect;
    CGFloat v27 = v9;
    double MinX = CGRectGetMinX(v37);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    double v16 = MinX - CGRectGetMinX(v38);
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.double x = v26;
    v40.origin.double y = v13;
    v40.size.double width = v28;
    v40.size.double height = v14;
    double v17 = MaxY - CGRectGetMaxY(v40);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    double MaxX = CGRectGetMaxX(v41);
    v42.origin.double x = v27;
    v42.size.double width = v29;
    v42.origin.double y = v30;
    v42.size.double height = rect;
    double v18 = MaxX - CGRectGetMaxX(v42);
  }
  double v22 = v15;
  double v23 = v16;
  double v24 = v17;
  result.right = v18;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (void).cxx_destruct
{
}

- (_UIComplexBoundingPath)initWithCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5 boundingPathBitmap:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIComplexBoundingPath;
  CGFloat v13 = [(_UIBoundingPath *)&v18 initWithCoordinateSpace:v11];
  if (v13)
  {
    if (!a4)
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"_UIComplexBoundingPath.m", 62, @"Invalid parameter not satisfying: %@", @"orientation != UIInterfaceOrientationUnknown" object file lineNumber description];
    }
    if (a5 <= 0.0)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v13, @"_UIComplexBoundingPath.m", 63, @"Invalid parameter not satisfying: %@", @"scale > 0" object file lineNumber description];

      if (v12) {
        goto LABEL_6;
      }
    }
    else if (v12)
    {
LABEL_6:
      [(_UIComplexBoundingPath *)v13 _validateBitmap:v12 withOrientation:a4 scale:v11 forCoordinateSpace:a5];
      v13->_double scale = a5;
      v13->_int64_t orientation = a4;
      objc_storeStrong((id *)&v13->_bitmap, a6);
      goto LABEL_7;
    }
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v13, @"_UIComplexBoundingPath.m", 64, @"Invalid parameter not satisfying: %@", @"bitmap != nil" object file lineNumber description];

    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIComplexBoundingPath;
  id v4 = a3;
  [(_UIBoundingPath *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"scale", self->_scale, v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_orientation forKey:@"orientation"];
  [v4 encodeObject:self->_bitmap forKey:@"bitmap"];
}

- (_UIComplexBoundingPath)initWithCoder:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIComplexBoundingPath;
  char v6 = [(_UIBoundingPath *)&v15 initWithCoder:v5];
  if (v6)
  {
    [v5 decodeDoubleForKey:@"scale"];
    v6->_double scale = v7;
    if (v7 <= 0.0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"_UIComplexBoundingPath.m", 49, @"Invalid scale decoded: %f", *(void *)&v6->_scale);
    }
    uint64_t v8 = [v5 decodeIntegerForKey:@"orientation"];
    v6->_int64_t orientation = v8;
    if (!v8)
    {
      CGFloat v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v6 file:@"_UIComplexBoundingPath.m" lineNumber:51 description:@"Orientation cannot be unknown"];
    }
    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"bitmap"];
    bitmap = v6->_bitmap;
    v6->_bitmap = (_UIBoundingPathBitmap *)v9;

    if (!v6->_bitmap)
    {
      CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:v6 file:@"_UIComplexBoundingPath.m" lineNumber:53 description:@"Failed to decode bitmap"];
    }
  }

  return v6;
}

- (_UIComplexBoundingPath)initWithRectangularCoordinateSpace:(id)a3 orientation:(int64_t)a4 scale:(double)a5
{
  id v8 = a3;
  [v8 bounds];
  unint64_t v10 = vcvtpd_u64_f64(v9 * a5);
  [v8 bounds];
  unint64_t v12 = vcvtpd_u64_f64(v11 * a5);
  if ((unint64_t)(a4 - 3) >= 2) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v10;
  }
  if ((unint64_t)(a4 - 3) < 2) {
    unint64_t v10 = v12;
  }
  memset(&v17[4], 0, 24);
  v17[0] = v10;
  v17[1] = v13;
  v17[2] = 0;
  v17[3] = v13;
  CGFloat v14 = [[_UIBoundingPathBitmap alloc] initWithBitmapData:v17];
  objc_super v15 = [[_UIComplexBoundingPath alloc] initWithCoordinateSpace:v8 orientation:a4 scale:v14 boundingPathBitmap:a5];

  return v15;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  return -[_UIComplexBoundingPath boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:](self, "boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:", a3, self->_orientation, 0.0, 0.0, 0.0, 0.0, self->_scale);
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  double topRight = a4.topRight;
  double bottomLeft = a4.bottomLeft;
  double bottomRight = a4.bottomRight;
  double topLeft = a4.topLeft;
  id v11 = a3;
  if (!v11)
  {
    long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"_UIComplexBoundingPath.m", 91, @"Invalid parameter not satisfying: %@", @"coordinateSpace != nil" object file lineNumber description];
  }
  double v48 = topRight;
  double v49 = a6;
  unint64_t v12 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v12)
  {
    long long v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:93 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v11 bounds];
  objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [v12 bounds];
  v72.origin.CGFloat x = v21;
  v72.origin.CGFloat y = v22;
  v72.size.CGFloat width = v23;
  v72.size.CGFloat height = v24;
  v65.origin.CGFloat x = v14;
  v65.origin.CGFloat y = v16;
  v65.size.CGFloat width = v18;
  v65.size.CGFloat height = v20;
  CGRect v66 = CGRectIntersection(v65, v72);
  CGFloat x = v66.origin.x;
  CGFloat y = v66.origin.y;
  CGFloat width = v66.size.width;
  CGFloat height = v66.size.height;
  if (CGRectIsNull(v66)
    || (v67.origin.x = x, v67.origin.y = y, v67.size.width = width, v67.size.CGFloat height = height, CGRectIsEmpty(v67)))
  {
    CGFloat v29 = [_UIRectangularBoundingPath alloc];
    CGFloat v30 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v29, "initWithCoordinateSpace:boundingRect:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    goto LABEL_21;
  }
  bitmap = self->_bitmap;
  if (bitmap)
  {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
    CGRect v32 = self->_bitmap;
    double v33 = (double)(unint64_t)v60;
    double v35 = v48;
    CGFloat v34 = v49;
    if (v32)
    {
      [(_UIBoundingPathBitmap *)v32 bitmapData];
      double v36 = (double)*((unint64_t *)&v56 + 1);
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v63 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v60 = 0u;
    double v33 = 0.0;
    double v35 = v48;
    CGFloat v34 = v49;
  }
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  double v36 = 0.0;
LABEL_13:
  CGAffineTransformMakeScale(&v55, v34, v34);
  v68.origin.CGFloat x = v14;
  v68.origin.CGFloat y = v16;
  v68.size.CGFloat width = v18;
  v68.size.CGFloat height = v20;
  CGRect v69 = CGRectApplyAffineTransform(v68, &v55);
  v70.origin.CGFloat x = _UIWindowConvertRectFromOrientationToOrientation(a5, 1, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, v33, v36);
  CGRect v71 = CGRectIntegral(v70);
  uint64_t v37 = (uint64_t)(topLeft * v34);
  uint64_t v38 = (uint64_t)(bottomLeft * v34);
  uint64_t v39 = (uint64_t)(bottomRight * v34);
  uint64_t v40 = (uint64_t)(v35 * v34);
  if (a5 == 2)
  {
    uint64_t v41 = (uint64_t)(topLeft * v34);
    uint64_t v42 = (uint64_t)(v35 * v34);
    uint64_t v40 = (uint64_t)(bottomRight * v34);
    uint64_t v39 = (uint64_t)(bottomLeft * v34);
  }
  else if (a5 == 3)
  {
    uint64_t v41 = (uint64_t)(v35 * v34);
    uint64_t v42 = (uint64_t)(bottomRight * v34);
    uint64_t v40 = (uint64_t)(bottomLeft * v34);
    uint64_t v39 = (uint64_t)(topLeft * v34);
  }
  else
  {
    uint64_t v41 = (uint64_t)(bottomLeft * v34);
    uint64_t v42 = (uint64_t)(topLeft * v34);
    if (a5 != 4) {
      goto LABEL_20;
    }
  }
  uint64_t v37 = v40;
  uint64_t v40 = v39;
  uint64_t v39 = v41;
  uint64_t v38 = v42;
LABEL_20:
  long long v43 = self->_bitmap;
  v54[0] = (uint64_t)v71.origin.x;
  v54[1] = (uint64_t)v71.origin.y;
  v54[2] = (uint64_t)v71.size.width;
  v54[3] = (uint64_t)v71.size.height;
  v53[0] = v37;
  v53[1] = v38;
  v53[2] = v39;
  v53[3] = v40;
  uint64_t v44 = [(_UIBoundingPathBitmap *)v43 boundingPathBitmapWithRect:v54 cornerRadii:v53];
  CGFloat v30 = [[_UIComplexBoundingPath alloc] initWithCoordinateSpace:v11 orientation:a5 scale:v44 boundingPathBitmap:v34];

LABEL_21:
  return v30;
}

- (void)setCoordinateSpace:(id)a3
{
  bitmap = self->_bitmap;
  int64_t orientation = self->_orientation;
  double scale = self->_scale;
  id v7 = a3;
  [(_UIComplexBoundingPath *)self _validateBitmap:bitmap withOrientation:orientation scale:v7 forCoordinateSpace:scale];
  v8.receiver = self;
  v8.super_class = (Class)_UIComplexBoundingPath;
  [(_UIBoundingPath *)&v8 setCoordinateSpace:v7];
}

- (BOOL)isNonRectangular
{
  return 1;
}

- (CGRect)_largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:(CGRect)a3 portraitAspectRatio:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v68 = 0;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  bitmap = self->_bitmap;
  if (bitmap) {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
  }
  if (a4 <= 0.0)
  {
    CGFloat v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:532 description:@"Invalid aspect ratio."];
  }
  uint64_t v57 = 0;
  long long v58 = (double *)&v57;
  uint64_t v59 = 0x4010000000;
  long long v60 = &unk_186D7DBA7;
  CGFloat v61 = x;
  CGFloat v62 = y;
  CGFloat v63 = width;
  CGFloat v64 = height;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x4010000000;
  v54[3] = &unk_186D7DBA7;
  long long v55 = 0u;
  long long v56 = 0u;
  v69.origin.CGFloat x = x;
  v69.origin.CGFloat y = y;
  v69.size.CGFloat width = width;
  v69.size.CGFloat height = height;
  CGRect v70 = CGRectIntegral(v69);
  *(void *)&long long v55 = (uint64_t)v70.origin.x;
  *((void *)&v55 + 1) = (uint64_t)v70.origin.y;
  *(void *)&long long v56 = (uint64_t)v70.size.width;
  *((void *)&v56 + 1) = (uint64_t)v70.size.height;
  v47[0] = MEMORY[0x1E4F143A8];
  if (a4 >= 1.0) {
    double v12 = 1.0 / a4;
  }
  else {
    double v12 = 1.0;
  }
  v47[1] = 3221225472;
  double v48 = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke;
  double v49 = &unk_1E52F1BF0;
  double v52 = fmin(a4, 1.0);
  double v53 = v12;
  unint64_t v50 = &v57;
  __int16 v51 = v54;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_2;
  v42[3] = &unk_1E52F1C18;
  long long v45 = v67;
  long long v44 = v66;
  long long v43 = v65;
  uint64_t v46 = v68;
  v42[4] = v54;
  __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke((uint64_t)v47, v42);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  long long v38 = v65;
  v37[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_3;
  v37[3] = &unk_1E52F1C18;
  long long v39 = v66;
  long long v40 = v67;
  uint64_t v41 = v68;
  v37[4] = v54;
  v48((uint64_t)v47, v37);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  long long v33 = v65;
  v32[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_4;
  v32[3] = &unk_1E52F1C18;
  long long v34 = v66;
  long long v35 = v67;
  uint64_t v36 = v68;
  v32[4] = v54;
  v48((uint64_t)v47, v32);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  long long v28 = v65;
  v27[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_5;
  v27[3] = &unk_1E52F1C18;
  long long v29 = v66;
  long long v30 = v67;
  uint64_t v31 = v68;
  v27[4] = v54;
  v48((uint64_t)v47, v27);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  long long v23 = v65;
  v22[2] = __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_6;
  v22[3] = &unk_1E52F1C18;
  long long v24 = v66;
  long long v25 = v67;
  uint64_t v26 = v68;
  v22[4] = v54;
  v48((uint64_t)v47, v22);
  double v13 = v58[4];
  double v14 = v58[5];
  double v15 = v58[6];
  double v16 = v58[7];
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v57, 8);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  CGFloat height = a3.size.height;
  double y = a4.y;
  double x = a4.x;
  CGFloat r1 = a3.size.width;
  CGFloat v60 = a3.origin.y;
  CGFloat v7 = a3.origin.x;
  unint64_t v10 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v10)
  {
    long long v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:580 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double scale = self->_scale;
  int64_t orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (!bitmap)
  {
    uint64_t v72 = 0;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    double v58 = 0.0 / scale;
    goto LABEL_7;
  }
  [(_UIBoundingPathBitmap *)bitmap bitmapData];
  CGFloat v22 = self->_bitmap;
  double v58 = (double)(unint64_t)v69 / scale;
  if (!v22)
  {
LABEL_7:
    uint64_t v68 = 0;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v65 = 0u;
    double v23 = 0.0;
    goto LABEL_8;
  }
  [(_UIBoundingPathBitmap *)v22 bitmapData];
  double v23 = (double)*((unint64_t *)&v65 + 1);
LABEL_8:
  double v57 = v23;
  v73.origin.double y = v60;
  v73.size.CGFloat height = height;
  v73.size.double width = r1;
  v73.origin.double x = v7;
  v81.origin.double x = v12;
  v81.origin.double y = v14;
  v81.size.double width = v16;
  v81.size.CGFloat height = v18;
  CGRect v74 = CGRectIntersection(v73, v81);
  -[_UIBoundingPath _largestInscribedRectInBoundingRect:withCenter:aspectRatio:](self, "_largestInscribedRectInBoundingRect:withCenter:aspectRatio:", v74.origin.x, v74.origin.y, v74.size.width, v74.size.height, x, y, a5);
  double v24 = v75.origin.x;
  double v25 = v75.origin.y;
  double width = v75.size.width;
  double v27 = v75.size.height;
  if (CGRectIsNull(v75)) {
    goto LABEL_14;
  }
  if (width <= 0.0) {
    goto LABEL_14;
  }
  if (v27 <= 0.0) {
    goto LABEL_14;
  }
  double v28 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, v24, v25, width, v27, v58, v57 / scale);
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  _UIAspectRatioConvertedFromOrientationToPortrait(a5);
  double v36 = v35;
  CGAffineTransformMakeScale(&v64, scale, scale);
  v76.origin.double x = v28;
  v76.origin.double y = v30;
  v76.size.double width = v32;
  v76.size.CGFloat height = v34;
  CGRect v77 = CGRectApplyAffineTransform(v76, &v64);
  -[_UIComplexBoundingPath _largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:portraitAspectRatio:](self, "_largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect:portraitAspectRatio:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height, v36);
  if (v39 <= 0.0 || (CGFloat v41 = v40, v40 <= 0.0))
  {
LABEL_14:
    double v45 = *MEMORY[0x1E4F1DB20];
    double v47 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v49 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v51 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    CGFloat v42 = v37;
    CGFloat v43 = v38;
    CGFloat v44 = v39;
    CGAffineTransformMakeScale(&v63, 1.0 / scale, 1.0 / scale);
    v78.origin.double x = v42;
    v78.origin.double y = v43;
    v78.size.double width = v44;
    v78.size.CGFloat height = v41;
    CGRect v79 = CGRectApplyAffineTransform(v78, &v63);
    double v45 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v79.origin.x, v79.origin.y, v79.size.width, v79.size.height, v58, v57 / scale);
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
  }

  double v52 = v45;
  double v53 = v47;
  double v54 = v49;
  double v55 = v51;
  result.size.CGFloat height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (CGRect)_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:(double)a3 inPortaitCorner:(unint64_t)a4 fromPortraitPixelRect:(CGRect)a5 withPortraitPixelCornerRadii:(_UIIntegralCornerRadii *)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v83 = 0;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v80 = 0u;
  bitmap = self->_bitmap;
  if (bitmap) {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
  }
  double v13 = _UIDirectionVectorForCorner(a4);
  double v15 = v14;
  CGFloat v71 = y;
  double v16 = x;
  while (1)
  {
    long long v76 = v80;
    long long v77 = v81;
    long long v78 = v82;
    uint64_t v79 = v83;
    long long v17 = *(_OWORD *)&a6->var2;
    int64x2_t v74 = *(int64x2_t *)&a6->var0;
    long long v75 = v17;
    if (isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v16, y, width, height, a3)) {
      break;
    }
    v84.size.double width = (double)(unint64_t)v80;
    v84.size.double height = (double)*((unint64_t *)&v80 + 1);
    v84.origin.CGFloat x = 0.0;
    v84.origin.double y = 0.0;
    CGRect v85 = CGRectInset(v84, -0.01, -0.01);
    v87.origin.CGFloat x = v16;
    v87.origin.double y = y;
    v87.size.double width = width;
    v87.size.double height = height;
    if (!CGRectContainsRect(v85, v87))
    {
      double v22 = *MEMORY[0x1E4F1DB20];
      double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v65 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_44;
    }
    double v16 = v13 + v16;
    double y = v15 + y;
  }
  unint64_t v18 = a4 - 1;
  if (a4 - 1 < 8 && ((0x8Bu >> v18) & 1) != 0)
  {
    double v21 = dbl_186B97AB8[v18];
  }
  else
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    double v20 = [NSString stringWithUTF8String:"CGFloat cornerAngleForCorner(UIRectCorner)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"_UIComplexBoundingPath.m", 819, @"Invalid UIRectCorner value (%ld)", a4);

    double v21 = 0.0;
  }
  double v22 = v16;
  double v23 = pointOnRectClosestToCorner(a4, x, v71, width, height);
  double v25 = v24;
  double v26 = pointOnRectClosestToCorner(a4, v16, y, width, height);
  double v28 = sqrt((v26 - v23) * (v26 - v23) + (v27 - v25) * (v27 - v25));
  double v65 = height;
  if (v28 > 1.41421356)
  {
    double v69 = v23;
    double v29 = v21;
    double v30 = v21 + -0.785398163;
    double v31 = v21 + 0.785398163;
    double v32 = 0.5;
    double v68 = v25;
    double v61 = v21 + -0.785398163;
    double v60 = v21 + 0.785398163;
    while (1)
    {
      double v66 = y;
      double v67 = width;
      double v33 = v28 + -1.41421356;
      double v34 = ceil((v28 + -1.41421356) * 1.57079633 * v32);
      double v35 = 1.57079633 / v34;
      if (v30 >= v29 + -0.785398163) {
        double v36 = v30;
      }
      else {
        double v36 = v29 + -0.785398163;
      }
      if (v31 >= v29 + 0.785398163) {
        double v37 = v29 + 0.785398163;
      }
      else {
        double v37 = v31;
      }
      double v70 = 1.57079633 / v34;
      double v72 = v36;
      double v38 = v29 + v35;
      BOOL v39 = v29 + v35 <= v37;
      BOOL v40 = v29 >= v36;
      if (v29 < v36 && v38 > v37)
      {
        double y = v66;
        double width = v67;
        goto LABEL_40;
      }
      double v62 = v28;
      double v63 = v29;
      double v41 = v66;
      double v42 = v67;
      double v64 = v22;
      while (1)
      {
        if (v40)
        {
          __double2 v43 = __sincos_stret(v29);
          double v22 = testRectForPointOnArcInCorner(llround(v69 + v33 * v43.__cosval), v22, v41, v42, llround(v68 + v33 * v43.__sinval), a4);
          double v41 = v44;
          double v42 = v45;
          double v47 = v46;
          long long v76 = v80;
          long long v77 = v81;
          long long v78 = v82;
          uint64_t v79 = v83;
          long long v48 = *(_OWORD *)&a6->var2;
          int64x2_t v74 = *(int64x2_t *)&a6->var0;
          long long v75 = v48;
          if (isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v22, v41, v45, v46, a3)) {
            goto LABEL_38;
          }
          double v29 = v29 - v70;
        }
        if (v39) {
          break;
        }
LABEL_30:
        BOOL v39 = v38 <= v37;
        BOOL v40 = v29 >= v72;
        if (v29 < v72 && v38 > v37)
        {
          double y = v66;
          double width = v67;
          double v29 = v63;
          double v22 = v64;
          double v28 = v62;
          goto LABEL_39;
        }
      }
      __double2 v49 = __sincos_stret(v38);
      double v22 = testRectForPointOnArcInCorner(llround(v69 + v33 * v49.__cosval), v22, v41, v42, llround(v68 + v33 * v49.__sinval), a4);
      double v41 = v50;
      double v42 = v51;
      double v47 = v52;
      long long v76 = v80;
      long long v77 = v81;
      long long v78 = v82;
      uint64_t v79 = v83;
      long long v53 = *(_OWORD *)&a6->var2;
      int64x2_t v74 = *(int64x2_t *)&a6->var0;
      long long v75 = v53;
      if ((isRectInBoundingPathCornerWithMinimumPadding(&v76, &v74, a4, v22, v41, v51, v52, a3) & 1) == 0) {
        break;
      }
      double v29 = v38;
LABEL_38:
      double v65 = v47;
      double width = v42;
      double y = v41;
      double v28 = v33;
LABEL_39:
      double v30 = v61;
      double v31 = v60;
      double v32 = 0.5;
LABEL_40:
      if (v28 <= 1.41421356 || v28 != v33) {
        goto LABEL_44;
      }
    }
    double v38 = v70 + v38;
    goto LABEL_30;
  }
LABEL_44:
  double v56 = v22;
  double v57 = y;
  double v58 = width;
  double v59 = v65;
  result.size.double height = v59;
  result.size.double width = v58;
  result.origin.double y = v57;
  result.origin.CGFloat x = v56;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double height = a5.height;
  double width = a5.width;
  CGFloat v12 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v12)
  {
    double v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2 object:self file:@"_UIComplexBoundingPath.m" lineNumber:953 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double scale = self->_scale;
  int64_t orientation = self->_orientation;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
    double v24 = self->_bitmap;
    double v62 = (double)(unint64_t)v71 / scale;
    if (v24)
    {
      [(_UIBoundingPathBitmap *)v24 bitmapData];
      double v25 = (double)*((unint64_t *)&v67 + 1);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v74 = 0;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v71 = 0u;
    double v62 = 0.0 / scale;
  }
  uint64_t v70 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v67 = 0u;
  double v25 = 0.0;
LABEL_8:
  double v61 = v25;
  v83.origin.double x = v14;
  v83.origin.double y = v16;
  v83.size.double width = v18;
  v83.size.double height = v20;
  CGRect v75 = CGRectIntersection(a4, v83);
  -[_UIBoundingPath _rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:", a3, v75.origin.x, v75.origin.y, v75.size.width, v75.size.height, width, height, a7);
  double x = v76.origin.x;
  double y = v76.origin.y;
  double v28 = v76.size.width;
  double v29 = v76.size.height;
  if (CGRectIsNull(v76)) {
    goto LABEL_17;
  }
  double v30 = v61 / scale;
  double v31 = _UIWindowConvertRectFromOrientationToOrientation(orientation, 1, x, y, v28, v29, v62, v61 / scale);
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  unint64_t v38 = _UIRectCornerConvertedFromOrientationToPortrait(a3, orientation);
  CGAffineTransformMakeScale(&v66, scale, scale);
  v77.origin.double x = v31;
  v77.origin.double y = v33;
  v77.size.double width = v35;
  v77.size.double height = v37;
  CGRect v78 = CGRectApplyAffineTransform(v77, &v66);
  uint64_t v39 = (uint64_t)(a6.topLeft * scale);
  uint64_t v40 = (uint64_t)(a6.bottomLeft * scale);
  uint64_t v41 = (uint64_t)(a6.bottomRight * scale);
  uint64_t v42 = (uint64_t)(a6.topRight * scale);
  if (orientation == 2)
  {
    uint64_t v43 = (uint64_t)(a6.topLeft * scale);
    uint64_t v44 = (uint64_t)(a6.topRight * scale);
    uint64_t v42 = (uint64_t)(a6.bottomRight * scale);
    uint64_t v41 = (uint64_t)(a6.bottomLeft * scale);
    goto LABEL_15;
  }
  if (orientation == 3)
  {
    uint64_t v43 = (uint64_t)(a6.topRight * scale);
    uint64_t v44 = (uint64_t)(a6.bottomRight * scale);
    uint64_t v42 = (uint64_t)(a6.bottomLeft * scale);
    uint64_t v41 = (uint64_t)(a6.topLeft * scale);
    goto LABEL_15;
  }
  uint64_t v43 = (uint64_t)(a6.bottomLeft * scale);
  uint64_t v44 = (uint64_t)(a6.topLeft * scale);
  if (orientation == 4)
  {
LABEL_15:
    uint64_t v39 = v42;
    uint64_t v42 = v41;
    uint64_t v41 = v43;
    uint64_t v40 = v44;
  }
  v65[0] = v39;
  v65[1] = v40;
  v65[2] = v41;
  v65[3] = v42;
  -[_UIComplexBoundingPath _portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:inPortaitCorner:fromPortraitPixelRect:withPortraitPixelCornerRadii:](self, "_portaitPixelRectWithPixelMinimumPaddingFromBoundingPath:inPortaitCorner:fromPortraitPixelRect:withPortraitPixelCornerRadii:", v38, v65, scale * a7, v78.origin.x, v78.origin.y, v78.size.width, v78.size.height, *(void *)&v61);
  CGFloat v45 = v79.origin.x;
  CGFloat v46 = v79.origin.y;
  CGFloat v47 = v79.size.width;
  CGFloat v48 = v79.size.height;
  if (!CGRectIsNull(v79))
  {
    CGAffineTransformMakeScale(&v64, 1.0 / scale, 1.0 / scale);
    v80.origin.double x = v45;
    v80.origin.double y = v46;
    v80.size.double width = v47;
    v80.size.double height = v48;
    CGRect v81 = CGRectApplyAffineTransform(v80, &v64);
    double v49 = _UIWindowConvertRectFromOrientationToOrientation(1, orientation, v81.origin.x, v81.origin.y, v81.size.width, v81.size.height, v62, v30);
    double v50 = v53;
    double v51 = v54;
    double v52 = v55;
    goto LABEL_19;
  }
LABEL_17:
  double v49 = *MEMORY[0x1E4F1DB20];
  double v50 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v51 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v52 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_19:

  double v56 = v49;
  double v57 = v50;
  double v58 = v51;
  double v59 = v52;
  result.size.double height = v59;
  result.size.double width = v58;
  result.origin.double y = v57;
  result.origin.double x = v56;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_UIBoundingPath *)self coordinateSpace];
  char v6 = +[UIApplication stringForInterfaceOrientation:self->_orientation];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p coordinateSpace=%@; orientation=%@; scale=%.1f; bitmap=%@>",
    v4,
    self,
    v5,
    v6,
    *(void *)&self->_scale,
  CGFloat v7 = self->_bitmap);

  return v7;
}

- (id)_imageRepresentation
{
  v3 = [(_UIBoundingPathBitmap *)self->_bitmap _imageRepresentation];
  double scale = self->_scale;
  bitmap = self->_bitmap;
  if (bitmap)
  {
    [(_UIBoundingPathBitmap *)bitmap bitmapData];
    char v6 = self->_bitmap;
    double v7 = (double)(unint64_t)v28 / scale;
    if (v6)
    {
      [(_UIBoundingPathBitmap *)v6 bitmapData];
      double v8 = (double)*((unint64_t *)&v24 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    double v7 = 0.0 / scale;
  }
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  double v8 = 0.0;
LABEL_6:
  double v9 = v8 / scale;
  unint64_t v10 = self->_orientation - 3;
  if (v10 >= 2) {
    double v11 = v7;
  }
  else {
    double v11 = v8 / scale;
  }
  if (v10 >= 2) {
    double v12 = v8 / scale;
  }
  else {
    double v12 = v7;
  }
  double v13 = objc_alloc_init(UIGraphicsImageRendererFormat);
  [(UIGraphicsImageRendererFormat *)v13 setScale:scale];
  [(UIGraphicsImageRendererFormat *)v13 setOpaque:1];
  [(UIGraphicsImageRendererFormat *)v13 setPreferredRange:2];
  CGFloat v14 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v13, v11, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46___UIComplexBoundingPath__imageRepresentation__block_invoke;
  v18[3] = &unk_1E52F1C40;
  double v20 = v11;
  double v21 = v12;
  double v22 = v7;
  double v23 = v9;
  v18[4] = self;
  id v19 = v3;
  id v15 = v3;
  CGFloat v16 = [(UIGraphicsImageRenderer *)v14 imageWithActions:v18];

  return v16;
}

@end