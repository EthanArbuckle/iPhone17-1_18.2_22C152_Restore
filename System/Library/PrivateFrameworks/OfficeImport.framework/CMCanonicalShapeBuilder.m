@interface CMCanonicalShapeBuilder
- (CGAffineTransform)affineTransform;
- (CGPath)copyCanWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyChevronWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyCubeWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyDiagramCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyDiamondWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyEllipseWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyHexagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyHomePlateWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyLeftArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyLeftRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyLeftRightUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyLineWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyOctagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyParallelogramWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyPentagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyPieWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyPlusWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyPyramidLayerWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyQuadArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyRectangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyRightDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyRightTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyRoundedRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3;
- (CGPath)copyStarWithTransform:(CGAffineTransform *)a3 aspectRatio:(float)a4 andBranchNumber:(int)a5;
- (CGPath)copyStraightConnector1tWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyTrapezoidWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyUpDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyUpDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
- (CGPath)copyWedgeRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4;
@end

@implementation CMCanonicalShapeBuilder

- (CGAffineTransform)affineTransform
{
  orientedBounds = self->super._orientedBounds;
  if (!orientedBounds)
  {
    v46 = [MEMORY[0x263F08690] currentHandler];
    [v46 handleFailureInMethod:a3 object:self file:@"CMCanonicalShapeBuilder.mm" lineNumber:59 description:@"oriented bounds not set"];

    orientedBounds = self->super._orientedBounds;
  }
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  [(OADOrientedBounds *)orientedBounds bounds];
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  +[CMShapeBuilder canonicalBounds];
  double v17 = v16;
  double v19 = v18;
  [(OADOrientedBounds *)self->super._orientedBounds rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    double v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    CGFloat v11 = v20;
    CGFloat v13 = v21;
    CGFloat v15 = v22;
  }
  long long v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v56.c = v23;
  *(_OWORD *)&v56.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v56, v9, v11);
  [(OADOrientedBounds *)self->super._orientedBounds rotation];
  float v25 = v24 * 3.14159265 / 180.0;
  if (v25 != 0.0)
  {
    long long v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v54.c = v26;
    *(_OWORD *)&v54.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v54, v13 * 0.5, v15 * 0.5);
    long long v27 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    long long v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v28;
    *(_OWORD *)&v53.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v55, &v53, v25);
    long long v29 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    long long v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v52.c = v30;
    *(_OWORD *)&v52.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v52, -(v13 * 0.5), -(v15 * 0.5));
    long long v31 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  if ([(OADOrientedBounds *)self->super._orientedBounds flipX])
  {
    long long v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v51.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v51.c = v32;
    *(_OWORD *)&v51.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v55, &v51, -1.0, 1.0);
    long long v33 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    long long v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v50.c = v34;
    *(_OWORD *)&v50.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v50, -v13, 0.0);
    long long v35 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  if (![(OADOrientedBounds *)self->super._orientedBounds flipY])
  {
    long long v36 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v49.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v49.c = v36;
    *(_OWORD *)&v49.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v55, &v49, 1.0, -1.0);
    long long v37 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v37;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
    long long v38 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v48.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v48.c = v38;
    *(_OWORD *)&v48.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v55, &v48, 0.0, -v15);
    long long v39 = *(_OWORD *)&v55.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  }
  float v40 = v13 / v17;
  float v41 = v15 / v19;
  long long v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v47.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v47.c = v42;
  *(_OWORD *)&v47.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v55, &v47, v40, v41);
  long long v44 = *(_OWORD *)&v55.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v55.a;
  *(_OWORD *)&retstr->c = v44;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v55.tx;
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  [(OADOrientedBounds *)self->super._orientedBounds bounds];
  LODWORD(v7) = 1068146622;
  if (v5 != 0.0 && v6 != 0.0)
  {
    double v7 = v5 / v6;
    *(float *)&double v7 = v5 / v6;
    *(float *)&double v7 = fabsf(*(float *)&v7);
  }
  result = 0;
  int type = self->super._type;
  if (type > 186)
  {
    switch(type)
    {
      case 247:
        long long v11 = *(_OWORD *)&a3->c;
        v56[0] = *(_OWORD *)&a3->a;
        v56[1] = v11;
        v56[2] = *(_OWORD *)&a3->tx;
        result = [(CMCanonicalShapeBuilder *)self copyRightDiagramArrowWithTransform:v56 andAspectRatio:v7];
        break;
      case 248:
        long long v28 = *(_OWORD *)&a3->c;
        v55[0] = *(_OWORD *)&a3->a;
        v55[1] = v28;
        v55[2] = *(_OWORD *)&a3->tx;
        result = [(CMCanonicalShapeBuilder *)self copyUpDiagramArrowWithTransform:v55 andAspectRatio:v7];
        break;
      case 249:
        long long v29 = *(_OWORD *)&a3->c;
        v54[0] = *(_OWORD *)&a3->a;
        v54[1] = v29;
        v54[2] = *(_OWORD *)&a3->tx;
        result = [(CMCanonicalShapeBuilder *)self copyPyramidLayerWithTransform:v54 andAspectRatio:v7];
        break;
      case 250:
        long long v30 = *(_OWORD *)&a3->c;
        v53[0] = *(_OWORD *)&a3->a;
        v53[1] = v30;
        v53[2] = *(_OWORD *)&a3->tx;
        result = [(CMCanonicalShapeBuilder *)self copyPieWithTransform:v53 andAspectRatio:v7];
        break;
      case 251:
        long long v31 = *(_OWORD *)&a3->c;
        v52[0] = *(_OWORD *)&a3->a;
        v52[1] = v31;
        v52[2] = *(_OWORD *)&a3->tx;
        result = [(CMCanonicalShapeBuilder *)self copyDiagramCircularArrowWithTransform:v52 andAspectRatio:v7];
        break;
      default:
        if (type == 187)
        {
          long long v24 = *(_OWORD *)&a3->c;
          v75[0] = *(_OWORD *)&a3->a;
          v75[1] = v24;
          v75[2] = *(_OWORD *)&a3->tx;
          float v25 = v75;
          long long v26 = self;
          uint64_t v27 = 4;
LABEL_48:
          result = [(CMCanonicalShapeBuilder *)v26 copyStarWithTransform:v25 aspectRatio:v27 andBranchNumber:v7];
        }
        break;
    }
  }
  else
  {
    switch(type)
    {
      case 1:
      case 47:
      case 97:
        long long v12 = *(_OWORD *)&a3->c;
        v90[0] = *(_OWORD *)&a3->a;
        v90[1] = v12;
        v90[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyRectangleWithTransform:v90 andAspectRatio:v7];
      case 2:
        goto LABEL_22;
      case 3:
        long long v32 = *(_OWORD *)&a3->c;
        v87[0] = *(_OWORD *)&a3->a;
        v87[1] = v32;
        v87[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyEllipseWithTransform:v87 andAspectRatio:v7];
      case 4:
      case 110:
        long long v15 = *(_OWORD *)&a3->c;
        v85[0] = *(_OWORD *)&a3->a;
        v85[1] = v15;
        v85[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyDiamondWithTransform:v85 andAspectRatio:v7];
      case 5:
        long long v33 = *(_OWORD *)&a3->c;
        v84[0] = *(_OWORD *)&a3->a;
        v84[1] = v33;
        v84[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyTriangleWithTransform:v84 andAspectRatio:v7];
      case 6:
        long long v34 = *(_OWORD *)&a3->c;
        v83[0] = *(_OWORD *)&a3->a;
        v83[1] = v34;
        v83[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyRightTriangleWithTransform:v83 andAspectRatio:v7];
      case 7:
        long long v35 = *(_OWORD *)&a3->c;
        v89[0] = *(_OWORD *)&a3->a;
        v89[1] = v35;
        v89[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyParallelogramWithTransform:v89 andAspectRatio:v7];
      case 8:
        long long v36 = *(_OWORD *)&a3->c;
        v88[0] = *(_OWORD *)&a3->a;
        v88[1] = v36;
        v88[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyTrapezoidWithTransform:v88 andAspectRatio:v7];
      case 9:
        long long v37 = *(_OWORD *)&a3->c;
        v78[0] = *(_OWORD *)&a3->a;
        v78[1] = v37;
        v78[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyHexagonWithTransform:v78 andAspectRatio:v7];
      case 10:
        long long v38 = *(_OWORD *)&a3->c;
        v77[0] = *(_OWORD *)&a3->a;
        v77[1] = v38;
        v77[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyOctagonWithTransform:v77 andAspectRatio:v7];
      case 11:
        long long v39 = *(_OWORD *)&a3->c;
        v82[0] = *(_OWORD *)&a3->a;
        v82[1] = v39;
        v82[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyPlusWithTransform:v82 andAspectRatio:v7];
      case 12:
        long long v40 = *(_OWORD *)&a3->c;
        v74[0] = *(_OWORD *)&a3->a;
        v74[1] = v40;
        v74[2] = *(_OWORD *)&a3->tx;
        float v25 = v74;
        long long v26 = self;
        uint64_t v27 = 5;
        goto LABEL_48;
      case 13:
      case 78:
        long long v16 = *(_OWORD *)&a3->c;
        v67[0] = *(_OWORD *)&a3->a;
        v67[1] = v16;
        v67[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyRightArrowWithTransform:v67 andAspectRatio:v7];
      case 14:
      case 17:
      case 18:
      case 19:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 57:
      case 64:
      case 65:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 93:
      case 94:
      case 95:
      case 96:
      case 98:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 107:
      case 108:
      case 109:
        return result;
      case 15:
        long long v41 = *(_OWORD *)&a3->c;
        v65[0] = *(_OWORD *)&a3->a;
        v65[1] = v41;
        v65[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyHomePlateWithTransform:v65 andAspectRatio:v7];
      case 16:
        long long v42 = *(_OWORD *)&a3->c;
        v81[0] = *(_OWORD *)&a3->a;
        v81[1] = v42;
        v81[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyCubeWithTransform:v81 andAspectRatio:v7];
      case 20:
        long long v43 = *(_OWORD *)&a3->c;
        v69[0] = *(_OWORD *)&a3->a;
        v69[1] = v43;
        v69[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyLineWithTransform:v69 andAspectRatio:v7];
      case 22:
        long long v44 = *(_OWORD *)&a3->c;
        v80[0] = *(_OWORD *)&a3->a;
        v80[1] = v44;
        v80[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyCanWithTransform:v80 andAspectRatio:v7];
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
        long long v10 = *(_OWORD *)&a3->c;
        v68[0] = *(_OWORD *)&a3->a;
        v68[1] = v10;
        v68[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyStraightConnector1tWithTransform:v68 andAspectRatio:v7];
      case 55:
        long long v45 = *(_OWORD *)&a3->c;
        v66[0] = *(_OWORD *)&a3->a;
        v66[1] = v45;
        v66[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyChevronWithTransform:v66 andAspectRatio:v7];
      case 56:
        long long v46 = *(_OWORD *)&a3->c;
        v79[0] = *(_OWORD *)&a3->a;
        v79[1] = v46;
        v79[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyPentagonWithTransform:v79 andAspectRatio:v7];
      case 58:
        long long v47 = *(_OWORD *)&a3->c;
        v73[0] = *(_OWORD *)&a3->a;
        v73[1] = v47;
        v73[2] = *(_OWORD *)&a3->tx;
        float v25 = v73;
        long long v26 = self;
        uint64_t v27 = 8;
        goto LABEL_48;
      case 59:
        long long v48 = *(_OWORD *)&a3->c;
        v72[0] = *(_OWORD *)&a3->a;
        v72[1] = v48;
        v72[2] = *(_OWORD *)&a3->tx;
        float v25 = v72;
        long long v26 = self;
        uint64_t v27 = 16;
        goto LABEL_48;
      case 60:
        long long v49 = *(_OWORD *)&a3->c;
        v70[0] = *(_OWORD *)&a3->a;
        v70[1] = v49;
        v70[2] = *(_OWORD *)&a3->tx;
        float v25 = v70;
        long long v26 = self;
        uint64_t v27 = 32;
        goto LABEL_48;
      case 61:
      case 62:
      case 63:
      case 106:
        long long v13 = *(_OWORD *)&a3->c;
        v76[0] = *(_OWORD *)&a3->a;
        v76[1] = v13;
        v76[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyWedgeRectWithTransform:v76 andAspectRatio:v7];
      case 66:
      case 77:
        long long v17 = *(_OWORD *)&a3->c;
        v64[0] = *(_OWORD *)&a3->a;
        v64[1] = v17;
        v64[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyLeftArrowWithTransform:v64 andAspectRatio:v7];
      case 67:
      case 80:
        long long v18 = *(_OWORD *)&a3->c;
        v62[0] = *(_OWORD *)&a3->a;
        v62[1] = v18;
        v62[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyDownArrowWithTransform:v62 andAspectRatio:v7];
      case 68:
      case 79:
        long long v19 = *(_OWORD *)&a3->c;
        v63[0] = *(_OWORD *)&a3->a;
        v63[1] = v19;
        v63[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyUpArrowWithTransform:v63 andAspectRatio:v7];
      case 69:
      case 81:
        long long v20 = *(_OWORD *)&a3->c;
        v61[0] = *(_OWORD *)&a3->a;
        v61[1] = v20;
        v61[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyLeftRightArrowWithTransform:v61 andAspectRatio:v7];
      case 70:
      case 82:
        long long v21 = *(_OWORD *)&a3->c;
        v60[0] = *(_OWORD *)&a3->a;
        v60[1] = v21;
        v60[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyUpDownArrowWithTransform:v60 andAspectRatio:v7];
      case 76:
      case 83:
        long long v22 = *(_OWORD *)&a3->c;
        v59[0] = *(_OWORD *)&a3->a;
        v59[1] = v22;
        v59[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyQuadArrowWithTransform:v59 andAspectRatio:v7];
      case 92:
        long long v50 = *(_OWORD *)&a3->c;
        v71[0] = *(_OWORD *)&a3->a;
        v71[1] = v50;
        v71[2] = *(_OWORD *)&a3->tx;
        float v25 = v71;
        long long v26 = self;
        uint64_t v27 = 24;
        goto LABEL_48;
      case 99:
        long long v51 = *(_OWORD *)&a3->c;
        v57[0] = *(_OWORD *)&a3->a;
        v57[1] = v51;
        v57[2] = *(_OWORD *)&a3->tx;
        return [(CMCanonicalShapeBuilder *)self copyCircularArrowWithTransform:v57 andAspectRatio:v7];
      default:
        if (type == 176)
        {
LABEL_22:
          long long v23 = *(_OWORD *)&a3->c;
          v86[0] = *(_OWORD *)&a3->a;
          v86[1] = v23;
          v86[2] = *(_OWORD *)&a3->tx;
          result = [(CMCanonicalShapeBuilder *)self copyRoundedRectWithTransform:v86 andAspectRatio:v7];
        }
        else if (type == 182)
        {
          long long v14 = *(_OWORD *)&a3->c;
          v58[0] = *(_OWORD *)&a3->a;
          v58[1] = v14;
          v58[2] = *(_OWORD *)&a3->tx;
          result = [(CMCanonicalShapeBuilder *)self copyLeftRightUpArrowWithTransform:v58 andAspectRatio:v7];
        }
        break;
    }
  }
  return result;
}

- (CGPath)copyRectangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  Mutable = CGPathCreateMutable();
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGPathAddRect(Mutable, a3, v15);
  return Mutable;
}

- (CGPath)copyRoundedRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  float v8 = v7;
  +[CMShapeBuilder canonicalBounds];
  double v11 = v10;
  CGFloat v13 = v12;
  double v14 = v9;
  double v16 = v15;
  adjustValues = self->super._adjustValues;
  double v18 = v9 / 6.0;
  if (adjustValues)
  {
    long long v19 = [NSNumber numberWithInt:0];
    long long v20 = [(NSDictionary *)adjustValues objectForKey:v19];

    double v21 = v18;
    if (v20)
    {
      [v20 floatValue];
      float v23 = v22;
      [v20 floatValue];
      double v21 = v14 * 0.5 * (float)(v23 / v8);
      double v18 = v14 * 0.5 * (float)(v24 / v8);
    }
  }
  else
  {
    double v21 = v9 / 6.0;
  }
  double v25 = v21 * a4;
  if (a4 >= 1.0) {
    double v25 = v21;
  }
  if (a4 > 1.0) {
    double v26 = v21 / a4;
  }
  else {
    double v26 = v25;
  }
  Mutable = CGPathCreateMutable();
  CGFloat v28 = v11 + v26;
  CGPathMoveToPoint(Mutable, a3, v11 + v26, v13);
  CGFloat v29 = v11 + v14;
  CGFloat v30 = v29 - v26;
  CGPathAddLineToPoint(Mutable, a3, v30, v13);
  CGFloat v31 = v13 + v18;
  CGPathAddQuadCurveToPoint(Mutable, a3, v29, v13, v29, v13 + v18);
  CGFloat v32 = v13 + v16;
  CGFloat v33 = v32 - v18;
  CGPathAddLineToPoint(Mutable, a3, v29, v33);
  CGPathAddQuadCurveToPoint(Mutable, a3, v29, v32, v30, v32);
  CGPathAddLineToPoint(Mutable, a3, v28, v32);
  CGPathAddQuadCurveToPoint(Mutable, a3, v11, v32, v11, v33);
  CGPathAddLineToPoint(Mutable, a3, v11, v31);
  CGPathAddQuadCurveToPoint(Mutable, a3, v11, v13, v28, v13);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 7.5;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v12 = 7.5;
    double v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v19, v13 + v21);
  CGFloat v27 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27, v21);
  CGFloat v28 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v19 + v23, v28 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  CGFloat v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v27, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 2.5;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = 10.0 - v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  double v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v19 + v23;
  CGPathMoveToPoint(Mutable, a3, v27 * 0.5, v21);
  CGFloat v28 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  CGFloat v29 = v27 - v12;
  CGPathAddLineToPoint(Mutable, a3, v29, v28);
  CGFloat v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v30);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v28);
  CGPathAddLineToPoint(Mutable, a3, v19, v28);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyEllipseWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  Mutable = CGPathCreateMutable();
  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  CGPathAddEllipseInRect(Mutable, a3, v15);
  return Mutable;
}

- (CGPath)copyRightTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  CGPathAddLineToPoint(Mutable, a3, v6, v8 + v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 2.5;
    }
    double v14 = self->super._adjustValues;
    CGRect v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v21 + v25;
  CGPathMoveToPoint(Mutable, a3, v19, v27 * 0.5);
  CGFloat v28 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v28, v21);
  CGFloat v29 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v28, v29);
  CGFloat v30 = v19 + v23;
  CGPathAddLineToPoint(Mutable, a3, v30, v29);
  CGPathAddLineToPoint(Mutable, a3, v30, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDiamondWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  Mutable = CGPathCreateMutable();
  CGFloat v14 = v6 + v10;
  CGPathMoveToPoint(Mutable, a3, v14 * 0.5, v8);
  CGFloat v15 = v8 + v12;
  CGPathAddLineToPoint(Mutable, a3, v14, v15 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v14 * 0.5, v15);
  CGPathAddLineToPoint(Mutable, a3, v6, v15 * 0.5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCubeWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v9 = v7;
    double v10 = [NSNumber numberWithInt:0];
    double v11 = [(NSDictionary *)adjustValues objectForKey:v10];

    if (v11)
    {
      [v11 floatValue];
      float v13 = v12 * 10.0 / (float)(v9 + v9);
    }
    else
    {
      float v13 = 2.5;
    }
  }
  else
  {
    float v13 = 2.5;
  }
  if (a4 <= 1.0)
  {
    float v14 = v13 * a4;
  }
  else
  {
    float v14 = v13;
    float v13 = v13 / a4;
  }
  double v15 = 10.0 - v13;
  double v16 = 10.0 - v14;
  +[CMShapeBuilder canonicalBounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v22 = v21;
  double v24 = v23;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v18, v20);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v20);
  CGFloat v26 = v16 + v20;
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v16 + v20);
  CGPathAddLineToPoint(Mutable, a3, v18, v16 + v20);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, a3, v15 + v18, v20);
  CGFloat v27 = v18 + v22;
  CGFloat v28 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v27, v28 - v16);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v26);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, a3, v27, v28);
  CGPathAddLineToPoint(Mutable, a3, v27 - v15, v28);
  CGPathAddLineToPoint(Mutable, a3, v18, v26);
  CGPathAddLineToPoint(Mutable, a3, v15 + v18, v26);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyStarWithTransform:(CGAffineTransform *)a3 aspectRatio:(float)a4 andBranchNumber:(int)a5
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  float v8 = *(float *)&v9;
  LODWORD(v9) = 3.75;
  if (a5 == 5) {
    *(float *)&double v9 = 1.875;
  }
  if (a5 == 4) {
    float v10 = 1.25;
  }
  else {
    float v10 = *(float *)&v9;
  }
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v12 = objc_msgSend(NSNumber, "numberWithInt:", 0, v9);
    float v13 = [(NSDictionary *)adjustValues objectForKey:v12];

    if (v13)
    {
      if ([(CMShapeBuilder *)self isOffice12])
      {
        [v13 floatValue];
        double v15 = v14 * 5.0 / v8;
      }
      else
      {
        [v13 floatValue];
        double v15 = 5.0 - v16 * 5.0 / v8;
      }
      float v10 = v15;
    }
  }
  float v17 = 6.28318531 / (double)a5;
  +[CMShapeBuilder canonicalBounds];
  double v20 = (v18 + v19) * 0.5;
  double v23 = (v21 + v22) * 0.5;
  Mutable = CGPathCreateMutable();
  __double2 v25 = __sincos_stret((float)(v17 * 0.0) + 1.57079633);
  CGPathMoveToPoint(Mutable, a3, v25.__cosval * 10.0 * 0.5 + v20, v25.__sinval * 10.0 * 0.5 + v23);
  double v26 = v17 * 0.5;
  long double x = v20 + cos(v26 + 1.57079633) * v10;
  long double v27 = sin((float)(v17 * 0.5) + 1.57079633);
  CGPathAddLineToPoint(Mutable, a3, x, v23 + v27 * v10);
  if (a5 >= 2)
  {
    int v28 = 1;
    do
    {
      __double2 v29 = __sincos_stret((float)(v17 * (float)v28) + 1.57079633);
      CGPathAddLineToPoint(Mutable, a3, v20 + v29.__cosval * 10.0 * 0.5, v23 + v29.__sinval * 10.0 * 0.5);
      __double2 v30 = __sincos_stret(v26 + (float)(v17 * (float)v28) + 1.57079633);
      CGPathAddLineToPoint(Mutable, a3, v20 + v30.__cosval * v10, v23 + v30.__sinval * v10);
      ++v28;
    }
    while (a5 != v28);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyTriangleWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    float v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11 * 5.0 / v8;
    }
    else
    {
      float v12 = 5.0;
    }
  }
  else
  {
    float v12 = 5.0;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v14, v16);
  CGPathAddLineToPoint(Mutable, a3, v14 + v18, v16);
  CGPathAddLineToPoint(Mutable, a3, v14 + v12, v16 + v20);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyStraightConnector1tWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8 + v12);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  return Mutable;
}

- (CGPath)copyHomePlateWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v9 = v7;
    double v10 = [NSNumber numberWithInt:0];
    double v11 = [(NSDictionary *)adjustValues objectForKey:v10];

    if (v11)
    {
      [v11 floatValue];
      float v13 = 10.0 - v12 * 10.0 / (float)((float)(v9 + v9) * a4);
      if (v13 >= 0.0) {
        float v14 = v13;
      }
      else {
        float v14 = 0.0;
      }
      if (v14 > 10.0) {
        float v14 = 10.0;
      }
    }
    else
    {
      float v14 = 2.5;
    }
  }
  else
  {
    float v14 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v16, v18);
  CGFloat v24 = v16 + v14;
  CGPathAddLineToPoint(Mutable, a3, v24, v18);
  CGFloat v25 = v18 + v22;
  CGPathAddLineToPoint(Mutable, a3, v16 + v20, v25 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v24, v25);
  CGPathAddLineToPoint(Mutable, a3, v16, v25);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyWedgeRectWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  float v7 = v6;
  +[CMShapeBuilder canonicalBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v64 = v14;
  Mutable = CGPathCreateMutable();
  BOOL v16 = [(CMShapeBuilder *)self isOffice12];
  double v17 = v7;
  float v18 = 5.0;
  if (v16) {
    float v18 = 3.0;
  }
  double v19 = 2.4;
  if (v16) {
    double v19 = 2.2;
  }
  float v20 = v7 / v18;
  float v21 = v19 * v17;
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    double v23 = [NSNumber numberWithInt:0];
    CGFloat v24 = [(NSDictionary *)adjustValues objectForKey:v23];

    if (v24)
    {
      int v25 = [v24 intValue];
      BOOL v26 = [(CMShapeBuilder *)self isOffice12];
      float v27 = -0.0;
      if (v26) {
        float v27 = v7;
      }
      float v20 = v27 + (float)v25;
    }
    int v28 = self->super._adjustValues;
    __double2 v29 = [NSNumber numberWithInt:1];
    __double2 v30 = [(NSDictionary *)v28 objectForKey:v29];

    if (v30)
    {
      int v31 = [v30 intValue];
      BOOL v32 = [(CMShapeBuilder *)self isOffice12];
      float v33 = -0.0;
      if (v32) {
        float v33 = v7;
      }
      float v21 = v33 + (float)v31;
    }
  }
  float v34 = v7 + v7;
  if (v20 > v7 || v21 <= v34)
  {
    if (v20 <= v7 || v21 <= v34)
    {
      if (v20 <= v34 || v21 >= v34 || v21 <= v7)
      {
        BOOL v39 = v20 > v34 && v21 < v34;
        if (v39 && v21 > 0.0)
        {
          int v47 = 0;
          int v40 = 0;
          int v41 = 0;
          int v43 = 0;
          int v44 = 0;
          int v45 = 0;
          BOOL v46 = 0;
          int v42 = 1;
        }
        else if (v20 <= v7 || v21 >= 0.0)
        {
          if (v21 >= 0.0)
          {
            BOOL v62 = v20 < 0.0;
            if (v21 >= v34) {
              BOOL v62 = 0;
            }
            BOOL v63 = v20 < 0.0 && v21 < v7;
            int v47 = !v63 && !v62;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 0;
            int v45 = v63;
            BOOL v46 = !v63 && v62;
          }
          else
          {
            int v47 = 0;
            int v40 = 0;
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v45 = 0;
            BOOL v46 = 0;
            int v44 = 1;
          }
        }
        else
        {
          int v47 = 0;
          int v40 = 0;
          int v41 = 0;
          int v42 = 0;
          int v44 = 0;
          int v45 = 0;
          BOOL v46 = 0;
          int v43 = 1;
        }
      }
      else
      {
        int v47 = 0;
        int v40 = 0;
        int v42 = 0;
        int v43 = 0;
        int v44 = 0;
        int v45 = 0;
        BOOL v46 = 0;
        int v41 = 1;
      }
    }
    else
    {
      int v47 = 0;
      int v41 = 0;
      int v42 = 0;
      int v43 = 0;
      int v44 = 0;
      int v45 = 0;
      BOOL v46 = 0;
      int v40 = 1;
    }
  }
  else
  {
    int v40 = 0;
    int v41 = 0;
    int v42 = 0;
    int v43 = 0;
    int v44 = 0;
    int v45 = 0;
    BOOL v46 = 0;
    int v47 = 1;
  }
  double v48 = v20;
  double v49 = 10.0;
  float v50 = 10.0 / v17 * v48 * 0.5;
  float v51 = 10.0 / v17 * v21 * 0.5;
  CGPathMoveToPoint(Mutable, a3, v9, v11);
  double v52 = v9 + v13;
  if (v47)
  {
    CGPathAddLineToPoint(Mutable, a3, v9 + v52 / 5.0, v11);
    double v53 = v64;
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v11 + v64 - v51);
    double v54 = v52 * 0.5;
  }
  else
  {
    double v53 = v64;
    if (!v40) {
      goto LABEL_45;
    }
    CGPathAddLineToPoint(Mutable, a3, v52 * 0.5 + v52 / 10.0, v11);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v11 + v64 - v51);
    double v49 = 5.0;
    double v54 = v52;
  }
  CGPathAddLineToPoint(Mutable, a3, v54 - v52 / v49, v11);
LABEL_45:
  CGPathAddLineToPoint(Mutable, a3, v52, v11);
  double v55 = v11 + v53;
  if (v41)
  {
    CGPathAddLineToPoint(Mutable, a3, v52, v11 + v55 / 5.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    double v56 = v55 * 0.5;
    double v57 = 10.0;
  }
  else
  {
    if (!v42) {
      goto LABEL_50;
    }
    CGPathAddLineToPoint(Mutable, a3, v52, v55 * 0.5 + v55 / 10.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    double v57 = 5.0;
    double v56 = v11 + v53;
  }
  CGPathAddLineToPoint(Mutable, a3, v52, v56 - v55 / v57);
LABEL_50:
  CGPathAddLineToPoint(Mutable, a3, v52, v11 + v53);
  if (v43)
  {
    CGPathAddLineToPoint(Mutable, a3, v52 + v52 / -5.0, v11 + v53);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    double v58 = v52 * 0.5;
    double v59 = 10.0;
  }
  else
  {
    if (!v44) {
      goto LABEL_55;
    }
    CGPathAddLineToPoint(Mutable, a3, v52 * 0.5 + v52 / -10.0, v11 + v53);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    double v59 = 5.0;
    double v58 = v9;
  }
  CGPathAddLineToPoint(Mutable, a3, v58 + v52 / v59, v11 + v53);
LABEL_55:
  CGPathAddLineToPoint(Mutable, a3, v9, v11 + v53);
  if (v45)
  {
    CGPathAddLineToPoint(Mutable, a3, v9, v55 + v55 / -5.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    CGFloat v11 = v55 * 0.5;
    double v60 = 10.0;
LABEL_59:
    CGPathAddLineToPoint(Mutable, a3, v9, v11 + v55 / v60);
    goto LABEL_60;
  }
  if (v46)
  {
    CGPathAddLineToPoint(Mutable, a3, v9, v55 * 0.5 + v55 / -10.0);
    CGPathAddLineToPoint(Mutable, a3, v9 + v50, v55 - v51);
    double v60 = 5.0;
    goto LABEL_59;
  }
LABEL_60:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyChevronWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    CGFloat v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11;
      BOOL v13 = [(CMShapeBuilder *)self isOffice12];
      double v14 = v12 * 10.0 / (v8 + v8);
      if (v13) {
        double v15 = v14 * 0.125;
      }
      else {
        double v15 = 10.0 - v14;
      }
    }
    else
    {
      double v15 = 1.25;
    }
    double v17 = [(NSDictionary *)self->super._adjustValues objectForKey:@"IsHomePlate"];

    if (v17) {
      char v16 = [v17 BOOLValue];
    }
    else {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
    double v15 = 1.25;
  }
  double v18 = 10.0;
  if (v15 <= 10.0) {
    double v18 = v15;
  }
  if (v18 >= 0.0) {
    double v19 = v18;
  }
  else {
    double v19 = 0.0;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  double v27 = v26;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v21, v23);
  CGFloat v29 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29 - v19, v23);
  double v30 = v23 + v27;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v29 - v19, v30);
  CGPathAddLineToPoint(Mutable, a3, v21, v30);
  if ((v16 & 1) == 0) {
    CGPathAddLineToPoint(Mutable, a3, v21 + v19, v30 * 0.5);
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    CGFloat v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 2.5;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    char v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v12 = 2.5;
    double v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  double v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v13 + v19;
  CGPathMoveToPoint(Mutable, a3, v13 + v19, v21);
  CGFloat v28 = v19 + v23;
  CGFloat v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v29, v21);
  CGFloat v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28 * 0.5, v30);
  CGPathAddLineToPoint(Mutable, a3, v19, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v27, v30 - v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = v10 * 0.5 / a4;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v7, v9);
  CGFloat v16 = v7 + v11;
  CGFloat v17 = v7 + v11 - v14;
  CGPathAddLineToPoint(Mutable, a3, v17, v9);
  double v18 = (v14 + v14) / 3.0;
  CGFloat v19 = v9 + v13;
  CGPathAddCurveToPoint(Mutable, a3, v16 - v18, v9, v16, v9 + v18, v16, v19 * 0.5);
  CGPathAddCurveToPoint(Mutable, a3, v16, v19 - v18, v16 - v18, v19, v17, v19);
  CGPathAddLineToPoint(Mutable, a3, v7, v19);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftRightArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    CGFloat v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 2.5;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    CGFloat v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v21 + v25;
  CGPathMoveToPoint(Mutable, a3, v19, v27 * 0.5);
  CGFloat v28 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v21);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v13 + v21);
  CGFloat v29 = v19 + v23;
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v21);
  CGPathAddLineToPoint(Mutable, a3, v29, v27 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v27);
  CGPathAddLineToPoint(Mutable, a3, v29 - v12, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27 - v13);
  CGPathAddLineToPoint(Mutable, a3, v28, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyTrapezoidWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    CGFloat v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11 * 5.0 / v8;
    }
    else
    {
      float v12 = 2.5;
    }
  }
  else
  {
    float v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  Mutable = CGPathCreateMutable();
  BOOL v22 = [(CMShapeBuilder *)self isOffice12];
  double v23 = v12;
  double v24 = v14 + v23;
  if (v22)
  {
    CGFloat v25 = v16 + v20;
    CGPathMoveToPoint(Mutable, a3, v24, v25);
    double v26 = v14 + v18;
    CGPathAddLineToPoint(Mutable, a3, v26 - v23, v25);
  }
  else
  {
    CGPathMoveToPoint(Mutable, a3, v24, v16);
    double v26 = v14 + v18;
    CGPathAddLineToPoint(Mutable, a3, v26 - v23, v16);
    double v16 = v16 + v20;
  }
  CGPathAddLineToPoint(Mutable, a3, v26, v16);
  CGPathAddLineToPoint(Mutable, a3, v14, v16);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyUpDownArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    CGFloat v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 2.5;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  double v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v19 + v23;
  double x = (v19 + v23) * 0.5;
  CGPathMoveToPoint(Mutable, a3, x, v21);
  CGFloat v28 = v13 + v21;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27 - v12, v13 + v21);
  CGFloat v29 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v27 - v12, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v27, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, x, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v29 - v13);
  CGPathAddLineToPoint(Mutable, a3, v12 + v19, v28);
  CGPathAddLineToPoint(Mutable, a3, v19, v28);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyOctagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v9 = v7;
    double v10 = [NSNumber numberWithInt:0];
    float v11 = [(NSDictionary *)adjustValues objectForKey:v10];

    if (v11)
    {
      [v11 floatValue];
      float v13 = v12;
      [v11 floatValue];
      double v14 = v9;
      double v15 = v13 * 5.0 / v9;
      double v17 = v16 * 5.0 / v14;
    }
    else
    {
      double v15 = 2.5;
      double v17 = 2.5;
    }
  }
  else
  {
    double v15 = 2.5;
    double v17 = 2.5;
  }
  double v18 = v17 * a4;
  if (a4 >= 1.0) {
    double v18 = v17;
  }
  if (a4 > 1.0) {
    double v19 = v15 / a4;
  }
  else {
    double v19 = v15;
  }
  if (a4 > 1.0) {
    double v20 = v17;
  }
  else {
    double v20 = v18;
  }
  +[CMShapeBuilder canonicalBounds];
  double v22 = v21;
  CGFloat v24 = v23;
  double v26 = v25;
  double v28 = v27;
  Mutable = CGPathCreateMutable();
  CGFloat v30 = v19 + v22;
  CGPathMoveToPoint(Mutable, a3, v19 + v22, v24);
  CGFloat v31 = v22 + v26;
  CGFloat v32 = v31 - v19;
  CGPathAddLineToPoint(Mutable, a3, v32, v24);
  CGFloat v33 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v31, v20 + v24);
  CGFloat v34 = v24 + v28;
  CGPathAddLineToPoint(Mutable, a3, v31, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34);
  CGPathAddLineToPoint(Mutable, a3, v22, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v33);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyHexagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    float v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11 * 5.0 / v8;
    }
    else
    {
      float v12 = 2.5;
    }
  }
  else
  {
    float v12 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  double v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  Mutable = CGPathCreateMutable();
  double v22 = v12;
  CGFloat v23 = v14 + v12;
  CGPathMoveToPoint(Mutable, a3, v23, v16);
  CGFloat v24 = v14 + v18;
  CGFloat v25 = v24 - v22;
  CGPathAddLineToPoint(Mutable, a3, v25, v16);
  CGFloat v26 = v16 + v20;
  CGPathAddLineToPoint(Mutable, a3, v24, v26 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v25, v26);
  CGPathAddLineToPoint(Mutable, a3, v23, v26);
  CGPathAddLineToPoint(Mutable, a3, v14, v26 * 0.5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPlusWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v9 = v7;
    double v10 = [NSNumber numberWithInt:0];
    float v11 = [(NSDictionary *)adjustValues objectForKey:v10];

    if (v11)
    {
      [v11 floatValue];
      float v13 = v12;
      [v11 floatValue];
      double v14 = v9;
      double v15 = v13 * 5.0 / v9;
      double v17 = v16 * 5.0 / v14;
    }
    else
    {
      double v15 = 2.5;
      double v17 = 2.5;
    }
  }
  else
  {
    double v15 = 2.5;
    double v17 = 2.5;
  }
  double v18 = v17 * a4;
  if (a4 >= 1.0) {
    double v18 = v17;
  }
  if (a4 > 1.0) {
    double v19 = v15 / a4;
  }
  else {
    double v19 = v15;
  }
  if (a4 > 1.0) {
    double v20 = v17;
  }
  else {
    double v20 = v18;
  }
  +[CMShapeBuilder canonicalBounds];
  double v22 = v21;
  CGFloat v24 = v23;
  double v26 = v25;
  double v28 = v27;
  Mutable = CGPathCreateMutable();
  CGFloat v30 = v19 + v22;
  CGPathMoveToPoint(Mutable, a3, v19 + v22, v24);
  CGFloat v31 = v22 + v26;
  CGFloat v32 = v22 + v26 - v19;
  CGPathAddLineToPoint(Mutable, a3, v32, v24);
  CGFloat v33 = v20 + v24;
  CGPathAddLineToPoint(Mutable, a3, v32, v20 + v24);
  CGPathAddLineToPoint(Mutable, a3, v31, v20 + v24);
  CGFloat v34 = v24 + v28;
  CGPathAddLineToPoint(Mutable, a3, v31, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v32, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34);
  CGPathAddLineToPoint(Mutable, a3, v30, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v34 - v20);
  CGPathAddLineToPoint(Mutable, a3, v22, v33);
  CGPathAddLineToPoint(Mutable, a3, v30, v33);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyParallelogramWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    float v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11 * 5.0 / v8;
    }
    else
    {
      float v12 = 2.5;
    }
    if ([(CMShapeBuilder *)self isOffice12]) {
      float v12 = v12 * 0.5;
    }

    double v13 = v12;
  }
  else
  {
    double v13 = 2.5;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v15, v17);
  CGFloat v23 = v15 + v19;
  CGPathAddLineToPoint(Mutable, a3, v23 - v13, v17);
  CGFloat v24 = v17 + v21;
  CGPathAddLineToPoint(Mutable, a3, v23, v24);
  CGPathAddLineToPoint(Mutable, a3, v13 + v15, v24);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyRightDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    float v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 6.50000006;
    }
    double v14 = self->super._adjustValues;
    CGFloat v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 6.50000006;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v19, v13 + v21);
  CGFloat v27 = v12 + v19;
  CGPathAddLineToPoint(Mutable, a3, v27, v13 + v21);
  CGPathAddLineToPoint(Mutable, a3, v27, v21);
  CGFloat v28 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v19 + v23, v28 * 0.5);
  CGPathAddLineToPoint(Mutable, a3, v27, v28);
  CGFloat v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v27, v29);
  CGPathAddLineToPoint(Mutable, a3, v19, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyCanWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    float v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = v11 * 2.5 / v8;
    }
    else
    {
      float v12 = 1.25;
    }
  }
  else
  {
    float v12 = 1.25;
  }
  double v35 = (float)(v12 * 0.5);
  +[CMShapeBuilder canonicalBounds];
  float v13 = v12;
  float v34 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  Mutable = CGPathCreateMutable();
  CGFloat v23 = v15 + v19;
  CGFloat v24 = v17 + v21;
  double v25 = v13;
  CGPathMoveToPoint(Mutable, a3, v15 + v19, v24 - v25);
  CGPathAddLineToPoint(Mutable, a3, v15 + v19, v17 + v25);
  CGPathAddCurveToPoint(Mutable, a3, v15 + v19, v17 + v25 - v35, v23 * 0.5 + 2.5, v17, v23 * 0.5, v17);
  cp1double x = (v15 + v19) * 0.5 + -2.5;
  CGPathAddCurveToPoint(Mutable, a3, cp1x, v17, v15, v17 + v25 - v35, v15, v17 + v25);
  CGPathAddLineToPoint(Mutable, a3, v15, v24 - v25);
  CGFloat v26 = v24 - v25 + v35;
  CGPathAddCurveToPoint(Mutable, a3, v15, v26, cp1x, v24, (v15 + v19) * 0.5, v24);
  CGFloat v27 = (v15 + v19) * 0.5 + 2.5;
  CGFloat v28 = v15 + v19;
  CGFloat v29 = v15 + v19;
  CGFloat v30 = v24 - v25;
  CGPathAddCurveToPoint(Mutable, a3, v27, v24, v28, v26, v29, v24 - v25);
  CGFloat v31 = v24 - (float)(v34 + v34);
  CGPathAddCurveToPoint(Mutable, a3, v23, v30 - v35, v27, v31, v23 * 0.5, v31);
  CGPathAddCurveToPoint(Mutable, a3, cp1x, v31, v15, v30 - v35, v15, v30);
  return Mutable;
}

- (CGPath)copyUpDiagramArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    float v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      double v12 = v11 * 10.0 / (v8 + v8);
    }
    else
    {
      double v12 = 3.49999994;
    }
    double v14 = self->super._adjustValues;
    double v15 = [NSNumber numberWithInt:1];
    double v16 = [(NSDictionary *)v14 objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v13 = v17 * 10.0 / (v8 + v8);
    }
    else
    {
      double v13 = 2.5;
    }
  }
  else
  {
    double v13 = 2.5;
    double v12 = 3.49999994;
  }
  +[CMShapeBuilder canonicalBounds];
  double v19 = v18;
  CGFloat v21 = v20;
  double v23 = v22;
  double v25 = v24;
  Mutable = CGPathCreateMutable();
  CGFloat v27 = v13 + v19;
  CGPathMoveToPoint(Mutable, a3, v13 + v19, v21);
  CGFloat v28 = v19 + v23;
  CGFloat v29 = v28 - v13;
  CGPathAddLineToPoint(Mutable, a3, v29, v21);
  CGFloat v30 = v21 + v25;
  CGPathAddLineToPoint(Mutable, a3, v29, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v28 * 0.5, v30);
  CGPathAddLineToPoint(Mutable, a3, v19, v30 - v12);
  CGPathAddLineToPoint(Mutable, a3, v27, v30 - v12);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyDiagramCircularArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  double v7 = v6;
  double v9 = v8;
  double v49 = v10;
  double v11 = v8 * 0.5 * 0.05;
  double v12 = v8 * 0.5;
  adjustValues = self->super._adjustValues;
  double v51 = v8 * 0.5 * 0.1;
  double v48 = v14;
  if (adjustValues)
  {
    double v15 = [NSNumber numberWithInt:0];
    double v16 = [(NSDictionary *)adjustValues objectForKey:v15];

    if (v16)
    {
      [v16 floatValue];
      double v18 = v17;
    }
    else
    {
      double v18 = 0.0;
    }
    double endAngle = v18;
    CGFloat v21 = self->super._adjustValues;
    double v22 = [NSNumber numberWithInt:1];
    double v23 = [(NSDictionary *)v21 objectForKey:v22];

    if (v23)
    {
      [v23 floatValue];
      double v20 = v24;
    }
    else
    {
      double v20 = 6.28318531;
    }
    [(OADOrientedBounds *)self->super._orientedBounds bounds];
    double v26 = v25;
    double v28 = v27;
    CGFloat v29 = self->super._adjustValues;
    CGFloat v30 = [NSNumber numberWithInt:2];
    CGFloat v31 = [(NSDictionary *)v29 objectForKey:v30];
    double v32 = sqrt(v28 / v49 * (v28 / v49) + v26 / v9 * (v26 / v9));

    if (v31)
    {
      [v31 floatValue];
      double v11 = v33 / v32;
      double v51 = v51 / v32;
    }
    float v34 = self->super._adjustValues;
    double v35 = [NSNumber numberWithInt:3];
    long long v36 = [(NSDictionary *)v34 objectForKey:v35];

    if (v36)
    {
      [v36 floatValue];
      double v51 = v37 / v32;
    }

    double v19 = endAngle;
  }
  else
  {
    double v19 = 0.0;
    double v20 = 6.28318531;
  }
  double v47 = v20;
  double startAngle = v20 + (v20 - v19) * -0.1;
  Mutable = CGPathCreateMutable();
  CGFloat v39 = (v7 + v9) * 0.5;
  CGFloat v40 = v12 - v11;
  __double2 v41 = __sincos_stret(v19);
  CGFloat v42 = (v48 + v49) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v39 + v40 * v41.__cosval, v42 + v40 * v41.__sinval);
  CGFloat v43 = v12 + v11;
  CGPathAddLineToPoint(Mutable, a3, v39 + v43 * v41.__cosval, v42 + v43 * v41.__sinval);
  CGPathAddArc(Mutable, a3, v39, v42, v43, v19, startAngle, 1);
  __double2 v44 = __sincos_stret(startAngle);
  CGPathAddLineToPoint(Mutable, a3, v39 + (v12 + v51) * v44.__cosval, v42 + (v12 + v51) * v44.__sinval);
  __double2 v45 = __sincos_stret(v47);
  CGPathAddLineToPoint(Mutable, a3, v39 + v12 * v45.__cosval, v42 + v12 * v45.__sinval);
  CGPathAddLineToPoint(Mutable, a3, v39 + (v12 - v51) * v44.__cosval, v42 + (v12 - v51) * v44.__sinval);
  CGPathAddLineToPoint(Mutable, a3, v39 + v40 * v44.__cosval, v42 + v40 * v44.__sinval);
  CGPathAddArc(Mutable, a3, v39, v42, v40, startAngle, v19, 0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPentagonWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;
  Mutable = CGPathCreateMutable();
  CGFloat v14 = v6 + v10;
  CGPathMoveToPoint(Mutable, a3, v14 / 5.0, v8);
  CGPathAddLineToPoint(Mutable, a3, v14 * 4.0 / 5.0, v8);
  CGFloat v15 = v8 + v12;
  CGPathAddLineToPoint(Mutable, a3, v14, v15 * 3.0 / 5.0);
  CGPathAddLineToPoint(Mutable, a3, v14 * 0.5, v15);
  CGPathAddLineToPoint(Mutable, a3, v6, v15 * 3.0 / 5.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyQuadArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = (10.0 - v11 * 10.0 / v8) * 0.5;
    }
    else
    {
      float v12 = 2.0;
    }
    double v16 = self->super._adjustValues;
    float v17 = [NSNumber numberWithInt:1];
    double v18 = [(NSDictionary *)v16 objectForKey:v17];

    if (v18)
    {
      [v18 floatValue];
      float v13 = (10.0 - v19 * 10.0 / v8) * 0.5;
    }
    else
    {
      float v13 = 1.0;
    }
    double v20 = self->super._adjustValues;
    CGFloat v21 = [NSNumber numberWithInt:2];
    double v22 = [(NSDictionary *)v20 objectForKey:v21];

    if (v22)
    {
      [v22 floatValue];
      float v14 = v12;
      float v15 = v23 * 10.0 / v8 * 0.5;
    }
    else
    {
      float v14 = v12;
      float v15 = 2.0;
    }
  }
  else
  {
    float v13 = 1.0;
    float v14 = 2.0;
    float v15 = 2.0;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  Mutable = CGPathCreateMutable();
  CGFloat v39 = v27 + v31;
  CGFloat v33 = (v27 + v31) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v25, v33);
  CGFloat v40 = v25 + v15;
  CGPathAddLineToPoint(Mutable, a3, v40, v33 - v14);
  double v34 = v13;
  CGPathAddLineToPoint(Mutable, a3, v40, v33 - v34);
  CGFloat v38 = v25 + v29;
  CGFloat v35 = (v25 + v29) * 0.5;
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v33 - v34);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v14, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35, v27);
  CGPathAddLineToPoint(Mutable, a3, v35 + v14, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v27 + v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v33 - v34);
  CGFloat v36 = v38 - v15;
  CGPathAddLineToPoint(Mutable, a3, v36, v33 - v34);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 - v14);
  CGPathAddLineToPoint(Mutable, a3, v38, v33);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 + v14);
  CGPathAddLineToPoint(Mutable, a3, v36, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v35 + v34, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 + v14, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35, v39);
  CGPathAddLineToPoint(Mutable, a3, v35 - v14, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v39 - v15);
  CGPathAddLineToPoint(Mutable, a3, v35 - v34, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v40, v33 + v34);
  CGPathAddLineToPoint(Mutable, a3, v40, v33 + v14);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyLeftRightUpArrowWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  [(CMShapeBuilder *)self maxAdjustedValue];
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    float v8 = v6;
    double v9 = [NSNumber numberWithInt:0];
    double v10 = [(NSDictionary *)adjustValues objectForKey:v9];

    if (v10)
    {
      [v10 floatValue];
      float v12 = (10.0 - v11 * 10.0 / v8) * 0.5;
    }
    else
    {
      float v12 = 2.0;
    }
    float v15 = self->super._adjustValues;
    double v16 = [NSNumber numberWithInt:1];
    float v17 = [(NSDictionary *)v15 objectForKey:v16];

    if (v17)
    {
      [v17 floatValue];
      float v13 = (10.0 - v18 * 10.0 / v8) * 0.5;
    }
    else
    {
      float v13 = 1.0;
    }
    float v19 = self->super._adjustValues;
    double v20 = [NSNumber numberWithInt:2];
    CGFloat v21 = [(NSDictionary *)v19 objectForKey:v20];

    if (v21)
    {
      [v21 floatValue];
      float v14 = v22 * 10.0 / v8 * 0.5;
    }
    else
    {
      float v14 = 2.0;
    }
  }
  else
  {
    float v13 = 1.0;
    float v12 = 2.0;
    float v14 = 2.0;
  }
  +[CMShapeBuilder canonicalBounds];
  CGFloat v24 = v23;
  double v26 = v25;
  double v39 = v27;
  double v29 = v28;
  Mutable = CGPathCreateMutable();
  CGFloat v41 = v26 + v29;
  CGFloat v31 = (v26 + v29) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v24, v31);
  double v40 = v14;
  CGFloat v42 = v24 + v14;
  double v32 = v12;
  CGFloat v33 = v31 - v12;
  CGPathAddLineToPoint(Mutable, a3, v42, v33);
  double v34 = v13;
  CGFloat v35 = v31 - v13;
  CGPathAddLineToPoint(Mutable, a3, v42, v35);
  CGFloat v36 = v24 + v39;
  CGFloat v37 = v24 + v39 - v40;
  CGPathAddLineToPoint(Mutable, a3, v37, v35);
  CGPathAddLineToPoint(Mutable, a3, v37, v33);
  CGPathAddLineToPoint(Mutable, a3, v36, v31);
  CGPathAddLineToPoint(Mutable, a3, v37, v31 + v32);
  CGPathAddLineToPoint(Mutable, a3, v37, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v34, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v34, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 + v32, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5, v41);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v32, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v34, v41 - v40);
  CGPathAddLineToPoint(Mutable, a3, v36 * 0.5 - v34, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v42, v31 + v34);
  CGPathAddLineToPoint(Mutable, a3, v42, v31 + v32);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)copyPyramidLayerWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  adjustValues = self->super._adjustValues;
  double v7 = [NSNumber numberWithInt:0];
  float v8 = [(NSDictionary *)adjustValues objectForKey:v7];
  [v8 floatValue];
  float v10 = v9;
  double v11 = v9;

  +[CMShapeBuilder canonicalBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  Mutable = CGPathCreateMutable();
  CGFloat v21 = Mutable;
  double v22 = a4;
  if (v10 >= 0.0)
  {
    float v25 = 5.0 / v11 / v22;
    double v26 = v25;
    CGPathMoveToPoint(Mutable, a3, v13 + v25, v15 + v19);
    CGFloat v27 = v13 + v17;
    CGPathAddLineToPoint(v21, a3, v27 - v26, v15 + v19);
    CGPathAddLineToPoint(v21, a3, v27, v15);
  }
  else
  {
    float v23 = -5.0 / v11 / v22;
    CGPathMoveToPoint(Mutable, a3, v13, v15 + v19);
    CGFloat v24 = v13 + v17;
    CGPathAddLineToPoint(v21, a3, v24, v15 + v19);
    CGPathAddLineToPoint(v21, a3, v24 - v23, v15);
    double v13 = v13 + v23;
  }
  CGPathAddLineToPoint(v21, a3, v13, v15);
  CGPathCloseSubpath(v21);
  return v21;
}

- (CGPath)copyLineWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  +[CMShapeBuilder canonicalBounds];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, v6, v8 + v12);
  CGPathAddLineToPoint(Mutable, a3, v6 + v10, v8);
  return Mutable;
}

- (CGPath)copyPieWithTransform:(CGAffineTransform *)a3 andAspectRatio:(float)a4
{
  adjustValues = self->super._adjustValues;
  if (adjustValues)
  {
    double v7 = [NSNumber numberWithInt:0];
    double v8 = [(NSDictionary *)adjustValues objectForKey:v7];

    if (v8)
    {
      [v8 floatValue];
      double v10 = v9;
    }
    else
    {
      double v10 = 0.0;
    }
    double v12 = self->super._adjustValues;
    double v13 = [NSNumber numberWithInt:1];
    double v14 = [(NSDictionary *)v12 objectForKey:v13];

    if (v14)
    {
      [v14 floatValue];
      double v11 = v15;
    }
    else
    {
      double v11 = 6.28318531;
    }
  }
  else
  {
    double v10 = 0.0;
    double v11 = 6.28318531;
  }
  +[CMShapeBuilder canonicalBounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  CGFloat v24 = v20 * 0.5;
  Mutable = CGPathCreateMutable();
  CGFloat v26 = (v17 + v21) * 0.5;
  CGFloat v27 = (v19 + v23) * 0.5;
  CGPathMoveToPoint(Mutable, a3, v26, v27);
  __double2 v28 = __sincos_stret(v10);
  CGPathAddLineToPoint(Mutable, a3, v26 + v24 * v28.__cosval, v27 + v24 * v28.__sinval);
  CGPathAddArc(Mutable, a3, v26, v27, v24, v10, v11, 1);
  CGPathAddLineToPoint(Mutable, a3, v26, v27);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end