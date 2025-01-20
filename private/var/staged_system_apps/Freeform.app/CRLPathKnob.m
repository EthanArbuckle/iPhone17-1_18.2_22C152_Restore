@interface CRLPathKnob
- (BOOL)hovering;
- (BOOL)hoveringSharp;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5;
- (BOOL)obscuresKnob:(id)a3;
- (BOOL)overlapsWithKnob:(id)a3;
- (CGAffineTransform)p_underlayRenderableTransformForRep:(SEL)a3;
- (CRLBezierNode)nextNode;
- (CRLBezierNode)node;
- (CRLBezierNode)prevNode;
- (CRLPathKnob)initWithInControlForNode:(id)a3 onRep:(id)a4;
- (CRLPathKnob)initWithNode:(id)a3 onRep:(id)a4;
- (CRLPathKnob)initWithOutControlForNode:(id)a3 onRep:(id)a4;
- (double)bendParameter;
- (double)tValue;
- (id)initBendKnobOnRep:(id)a3;
- (id)knobImage;
- (id)p_knobHitPath;
- (id)underlayRenderableForRep:(id)a3;
- (unint64_t)nodeIndex;
- (unint64_t)subpathIndex;
- (void)setBendParameter:(double)a3;
- (void)setHovering:(BOOL)a3;
- (void)setHoveringSharp:(BOOL)a3;
- (void)setNextNode:(id)a3;
- (void)setNode:(id)a3;
- (void)setNodeIndex:(unint64_t)a3;
- (void)setPrevNode:(id)a3;
- (void)setSubpathIndex:(unint64_t)a3;
- (void)setTValue:(double)a3;
- (void)updateImage;
- (void)updatePositionWithTransform:(CGAffineTransform *)a3;
@end

@implementation CRLPathKnob

- (id)initBendKnobOnRep:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLPathKnob;
  return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v4, "initWithType:position:radius:tag:onRep:", 0, 23, a3, CGPointZero.x, CGPointZero.y, 10.0);
}

- (CRLPathKnob)initWithNode:(id)a3 onRep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 nodePoint];
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 17, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = [(CRLPathKnob *)v9 p_knobHitPath];
    [(CRLCanvasKnob *)v9 setHitRegionPath:v10];
  }
  return v9;
}

- (CRLPathKnob)initWithInControlForNode:(id)a3 onRep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 inControlPoint];
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 18, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = [(CRLPathKnob *)v9 p_knobHitPath];
    [(CRLCanvasKnob *)v9 setHitRegionPath:v10];
  }
  return v9;
}

- (CRLPathKnob)initWithOutControlForNode:(id)a3 onRep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 outControlPoint];
  v12.receiver = self;
  v12.super_class = (Class)CRLPathKnob;
  v9 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v12, "initWithType:position:radius:tag:onRep:", 0, 19, v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_node, a3);
    v10 = [(CRLPathKnob *)v9 p_knobHitPath];
    [(CRLCanvasKnob *)v9 setHitRegionPath:v10];
  }
  return v9;
}

- (id)p_knobHitPath
{
  double v2 = sub_10006402C(CGPointZero.x, CGPointZero.y, 20.0);

  return +[CRLBezierPath bezierPathWithOvalInRect:v2];
}

- (BOOL)hovering
{
  return self->_hovering;
}

- (void)setHovering:(BOOL)a3
{
  if (self->_hovering != a3)
  {
    self->_hovering = a3;
    [(CRLPathKnob *)self updateImage];
  }
}

- (BOOL)hoveringSharp
{
  return self->_hoveringSharp;
}

- (void)setHoveringSharp:(BOOL)a3
{
  if (self->_hoveringSharp != a3)
  {
    self->_hoveringSharp = a3;
    [(CRLPathKnob *)self updateImage];
  }
}

- (BOOL)obscuresKnob:(id)a3
{
  id v4 = a3;
  if ([v4 tag] == (id)23)
  {
    BOOL v5 = 1;
  }
  else if ((id)[(CRLCanvasKnob *)self tag] == (id)23)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLPathKnob;
    BOOL v5 = [(CRLCanvasKnob *)&v7 obscuresKnob:v4];
  }

  return v5;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  id v4 = a3;
  if ([v4 tag] == (id)23 || (id)-[CRLCanvasKnob tag](self, "tag") == (id)23)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLPathKnob;
    BOOL v5 = [(CRLCanvasKnob *)&v7 overlapsWithKnob:v4];
  }

  return v5;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((id)[(CRLCanvasKnob *)self tag] == (id)23 || (id)[(CRLCanvasKnob *)self tag] == (id)24)
  {
    v10 = [(CRLCanvasKnob *)self rep];
    v11 = [v10 editablePathSource];
    objc_super v12 = v11;
    if (!v11
      || ([v11 nodes],
          v13 = objc_claimAutoreleasedReturnValue(),
          id v14 = [v13 count],
          v13,
          !v14))
    {
      BOOL v19 = 0;
LABEL_29:

      return v19;
    }
    v15 = [(CRLCanvasKnob *)self rep];
    [v15 convertNaturalPointFromUnscaledCanvas:x, y];
    double v81 = v17;
    double v84 = v16;
    if (v10) {
      [v10 naturalToEditablePathSpaceTransform:v17 v18:v16];
    }
    else {
      memset(&v92, 0, sizeof(v92));
    }
    CGAffineTransformInvert(&v93, &v92);
    uint64_t v90 = 0;
    unint64_t v91 = 0;
    double v89 = 0.0;
    [v12 distanceToPoint:&v90 subpathIndex:&v91 elementIndex:&v89 tValue:vaddq_f64(*(float64x2_t *)&v93.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v93.c, v81), *(float64x2_t *)&v93.a, v84)) threshold:0.0];
    *(void *)a5 = v20;
    v21 = [v12 subpaths];
    v22 = [v21 objectAtIndexedSubscript:v90];

    v23 = [v22 nodes];
    unint64_t v24 = (unint64_t)[v23 count];

    unint64_t v25 = (v91 + 1) % v24;
    [(CRLPathKnob *)self setSubpathIndex:v90];
    v26 = [v22 nodes];
    v27 = [v26 objectAtIndexedSubscript:v25];
    [(CRLPathKnob *)self setNode:v27];

    v28 = [v22 nodes];
    v29 = [v28 objectAtIndexedSubscript:v91];
    [(CRLPathKnob *)self setPrevNode:v29];

    if ((id)[(CRLCanvasKnob *)self tag] == (id)24) {
      unint64_t v30 = v91;
    }
    else {
      unint64_t v30 = v25;
    }
    -[CRLPathKnob setNodeIndex:](self, "setNodeIndex:", v30, *(void *)&v81);
    if ((id)[(CRLCanvasKnob *)self tag] != (id)24)
    {
      v31 = [(CRLPathKnob *)self prevNode];
      if ([v31 type] == (id)1)
      {
        v32 = [(CRLPathKnob *)self node];
        id v33 = [v32 type];

        if (v33 == (id)1)
        {
          BOOL v19 = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    v34 = [(CRLPathKnob *)self prevNode];
    [v34 nodePoint];
    double v36 = v35;
    double v38 = v37;
    v95.f64[0] = v35;
    v95.f64[1] = v37;
    v39 = [(CRLPathKnob *)self prevNode];
    [v39 outControlPoint];
    double v41 = v40;
    double v43 = v42;
    double v96 = v40;
    double v97 = v42;
    v44 = [(CRLPathKnob *)self node];
    [v44 inControlPoint];
    double v46 = v45;
    double v48 = v47;
    double v98 = v45;
    double v99 = v47;
    v49 = [(CRLPathKnob *)self node];
    [v49 nodePoint];
    double v51 = v50;
    double v53 = v52;
    double v100 = v50;
    double v101 = v52;

    if (sub_100064084(v36, v38, v41, v43) && sub_100064084(v46, v48, v51, v53))
    {
      double v96 = sub_100065E00(v36, v38, v51, v53, 0.333333333);
      double v97 = v54;
      double v98 = sub_100065E00(v36, v38, v51, v53, 0.666666667);
      double v99 = v55;
    }
    double v56 = sub_100064570(&v95, v89);
    double v82 = v56;
    double v85 = v57;
    if (v10)
    {
      [v10 naturalToEditablePathSpaceTransform];
      double v56 = v82;
      double v57 = v85;
      float64x2_t v59 = v86;
      float64x2_t v58 = v87;
      float64x2_t v60 = v88;
    }
    else
    {
      float64x2_t v60 = 0uLL;
      float64x2_t v59 = 0uLL;
      float64x2_t v58 = 0uLL;
    }
    -[CRLCanvasKnob setPosition:](self, "setPosition:", vaddq_f64(v60, vmlaq_n_f64(vmulq_n_f64(v58, v57), v59, v56)), *(void *)&v82);
    [(CRLPathKnob *)self setTValue:v89];
    double v61 = v89;
    if (v89 >= 0.5)
    {
      double v69 = v100;
      double v70 = v101;
      double v71 = sub_1000653B4(v83, v85, v100, v101);
      double v72 = v96;
      double v73 = v97;
      double v74 = sub_1000653B4(v95.f64[0], v95.f64[1], v96, v97);
      double v67 = v71 / (v74 + sub_1000653B4(v72, v73, v69, v70));
      double v68 = (1.0 - v61) * (1.0 - v61);
    }
    else
    {
      float64x2_t v62 = v95;
      double v63 = sub_1000653B4(v83, v85, v95.f64[0], v95.f64[1]);
      double v64 = v98;
      double v65 = v99;
      double v66 = sub_1000653B4(v62.f64[0], v62.f64[1], v98, v99);
      double v67 = v63 / (v66 + sub_1000653B4(v64, v65, v100, v101));
      double v68 = v61 * v61;
    }
    [(CRLPathKnob *)self setBendParameter:v67 / v68];
    double v75 = *a5;
    v76 = [v15 interactiveCanvasController];
    [v76 viewScale];
    double v78 = v75 * v77;
    [(CRLCanvasKnob *)self radius];
    BOOL v19 = v78 < v79;

    goto LABEL_28;
  }
  v94.receiver = self;
  v94.super_class = (Class)CRLPathKnob;
  return -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](&v94, "isHitByUnscaledPoint:inputType:returningDistance:", a4, a5, x, y);
}

- (id)underlayRenderableForRep:(id)a3
{
  id v4 = a3;
  if ((id)[(CRLCanvasKnob *)self tag] == (id)18 || (id)[(CRLCanvasKnob *)self tag] == (id)19)
  {
    if (!self->_handleLine)
    {
      BOOL v5 = +[CRLCanvasShapeRenderable renderable];
      handleLine = self->_handleLine;
      self->_handleLine = v5;

      [(CRLCanvasShapeRenderable *)self->_handleLine setFillColor:0];
      objc_super v7 = +[CRLColor colorWithWhite:0.5 alpha:1.0];
      -[CRLCanvasShapeRenderable setStrokeColor:](self->_handleLine, "setStrokeColor:", [v7 CGColor]);

      [(CRLCanvasShapeRenderable *)self->_handleLine setLineWidth:1.0];
    }
    -[CRLPathKnob p_underlayRenderableTransformForRep:](self, "p_underlayRenderableTransformForRep:", v4, 0, 0, 0, 0, 0, 0);
    Mutable = CGPathCreateMutable();
    [(CRLBezierNode *)self->_node nodePoint];
    CGFloat v10 = v9;
    [(CRLBezierNode *)self->_node nodePoint];
    CGPathMoveToPoint(Mutable, &v20, v10, v11);
    unint64_t v12 = [(CRLCanvasKnob *)self tag];
    node = self->_node;
    if (v12 == 18)
    {
      [(CRLBezierNode *)node inControlPoint];
      CGFloat v15 = v14;
      [(CRLBezierNode *)self->_node inControlPoint];
    }
    else
    {
      [(CRLBezierNode *)node outControlPoint];
      CGFloat v15 = v17;
      [(CRLBezierNode *)self->_node outControlPoint];
    }
    CGPathAddLineToPoint(Mutable, &v20, v15, v16);
    [(CRLCanvasShapeRenderable *)self->_handleLine setPath:Mutable];
    CGPathRelease(Mutable);
    uint64_t v18 = self->_handleLine;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (CGAffineTransform)p_underlayRenderableTransformForRep:(SEL)a3
{
  id v5 = a4;
  v6 = [v5 interactiveCanvasController];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  objc_super v7 = [v5 layout];
  id v8 = v7;
  if (v7) {
    [v7 pureTransformInRoot];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  [v6 viewScale];
  CGFloat v10 = v9;
  [v6 viewScale];
  CGAffineTransformMakeScale(&t2, v10, v11);
  CGAffineTransformConcat(retstr, &t1, &t2);

  uint64_t v12 = objc_opt_class();
  uint64_t v18 = sub_100246DEC(v5, v12, 1, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLPathKnobUnderlayRenderableTransformProvider);
  BOOL v19 = v18;
  if (v18)
  {
    long long v20 = *(_OWORD *)&retstr->c;
    v23[0] = *(_OWORD *)&retstr->a;
    v23[1] = v20;
    v23[2] = *(_OWORD *)&retstr->tx;
    [v18 pathKnobUnderlayRenderableTransform:v23];
    long long v21 = v23[4];
    *(_OWORD *)&retstr->a = v23[3];
    *(_OWORD *)&retstr->c = v21;
    *(_OWORD *)&retstr->tdouble x = v23[5];
  }

  return result;
}

- (id)knobImage
{
  if ((id)[(CRLCanvasKnob *)self tag] == (id)18 || (id)[(CRLCanvasKnob *)self tag] == (id)19)
  {
    v3 = @"CRLCanvasKnobPathControl";
    goto LABEL_4;
  }
  if ((id)[(CRLCanvasKnob *)self tag] == (id)20) {
    goto LABEL_8;
  }
  if ((id)[(CRLCanvasKnob *)self tag] == (id)22 || (id)[(CRLCanvasKnob *)self tag] == (id)24)
  {
    if ([(CRLPathKnob *)self hovering])
    {
      if ([(CRLPathKnob *)self hoveringSharp]) {
        v3 = @"CRLCanvasKnobPathLine";
      }
      else {
        v3 = @"CRLCanvasKnobPathSmooth";
      }
    }
    else
    {
      v3 = @"CRLCanvasKnobPathControlNew";
    }
  }
  else
  {
    if ((id)[(CRLCanvasKnob *)self tag] == (id)21)
    {
LABEL_8:
      v3 = @"CRLCanvasKnobPathControlSmooth";
      goto LABEL_4;
    }
    int64_t v6 = [(CRLBezierNode *)self->_node type];
    node = self->_node;
    if (v6 == 1)
    {
      unsigned int v8 = [(CRLBezierNode *)node isSelected];
      double v9 = @"CRLCanvasKnobPathLine";
      CFStringRef v10 = @"CRLCanvasKnobPathLineSelected";
    }
    else
    {
      id v11 = [(CRLBezierNode *)node type];
      unsigned int v8 = [(CRLBezierNode *)self->_node isSelected];
      if (v11 == (id)3)
      {
        double v9 = @"CRLCanvasKnobPathSmooth";
        CFStringRef v10 = @"CRLCanvasKnobPathSmoothSelected";
      }
      else
      {
        double v9 = @"CRLCanvasKnobPathBezier";
        CFStringRef v10 = @"CRLCanvasKnobPathBezierSelected";
      }
    }
    if (v8) {
      double v9 = (__CFString *)v10;
    }
    v3 = v9;
  }
LABEL_4:
  id v4 = +[CRLImage imageNamed:v3];

  return v4;
}

- (void)updateImage
{
  v3 = [(CRLCanvasKnob *)self rep];

  if (v3)
  {
    id v4 = [(CRLPathKnob *)self knobImage];
    if (v4)
    {
      id v8 = v4;
      id v5 = [(CRLCanvasKnob *)self renderable];
      [v8 size];
      [v5 setBounds:sub_100064070()];
      int64_t v6 = [(CRLCanvasKnob *)self rep];
      objc_super v7 = [v6 canvas];
      [v7 contentsScale];
      [v5 setContents:[v8 CGImageForContentsScale:]];

      id v4 = v8;
    }
  }
}

- (void)updatePositionWithTransform:(CGAffineTransform *)a3
{
  switch([(CRLCanvasKnob *)self tag])
  {
    case 0x11uLL:
      [(CRLBezierNode *)self->_node nodePoint];
      goto LABEL_5;
    case 0x12uLL:
      [(CRLBezierNode *)self->_node inControlPoint];
      goto LABEL_5;
    case 0x13uLL:
      [(CRLBezierNode *)self->_node outControlPoint];
LABEL_5:
      float64x2_t v7 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v6), *(float64x2_t *)&a3->a, v5));
      [(CRLCanvasKnob *)self setPosition:*(_OWORD *)&v7];
      return;
    case 0x14uLL:
      [(CRLBezierNode *)self->_node nodePoint];
      v32.f64[0] = v8;
      v32.f64[1] = v9;
      [(CRLBezierNode *)self->_node inControlPoint];
      uint64_t v33 = v10;
      uint64_t v34 = v11;
      uint64_t v12 = 136;
      [(CRLBezierNode *)self->_prevNode outControlPoint];
      goto LABEL_10;
    case 0x15uLL:
      [(CRLBezierNode *)self->_node nodePoint];
      v32.f64[0] = v15;
      v32.f64[1] = v16;
      [(CRLBezierNode *)self->_node outControlPoint];
      uint64_t v33 = v17;
      uint64_t v34 = v18;
      uint64_t v12 = 128;
      [(CRLBezierNode *)self->_nextNode inControlPoint];
LABEL_10:
      uint64_t v35 = v13;
      uint64_t v36 = v14;
      [*(id *)((char *)&self->super.super.isa + v12) nodePoint];
      uint64_t v37 = v19;
      uint64_t v38 = v20;
      double v21 = sub_10013A57C(&v32);
      goto LABEL_12;
    case 0x16uLL:
      [(CRLBezierNode *)self->_node nodePoint];
      v32.f64[0] = v22;
      v32.f64[1] = v23;
      [(CRLBezierNode *)self->_node outControlPoint];
      uint64_t v33 = v24;
      uint64_t v34 = v25;
      [(CRLBezierNode *)self->_nextNode inControlPoint];
      uint64_t v35 = v26;
      uint64_t v36 = v27;
      [(CRLBezierNode *)self->_nextNode nodePoint];
      uint64_t v37 = v28;
      uint64_t v38 = v29;
      double v21 = 0.5;
LABEL_12:
      double v30 = sub_100064570(&v32, v21);
      [(CRLCanvasKnob *)self setPosition:vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v31), *(float64x2_t *)&a3->a, v30))];
      break;
    default:
      return;
  }
}

- (CRLBezierNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (CRLBezierNode)nextNode
{
  return self->_nextNode;
}

- (void)setNextNode:(id)a3
{
}

- (CRLBezierNode)prevNode
{
  return self->_prevNode;
}

- (void)setPrevNode:(id)a3
{
}

- (unint64_t)nodeIndex
{
  return self->_nodeIndex;
}

- (void)setNodeIndex:(unint64_t)a3
{
  self->_nodeIndedouble x = a3;
}

- (double)tValue
{
  return self->_parametricT;
}

- (void)setTValue:(double)a3
{
  self->_parametricT = a3;
}

- (unint64_t)subpathIndex
{
  return self->_subpathIndex;
}

- (void)setSubpathIndex:(unint64_t)a3
{
  self->_subpathIndedouble x = a3;
}

- (double)bendParameter
{
  return self->_bendParameter;
}

- (void)setBendParameter:(double)a3
{
  self->_bendParameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevNode, 0);
  objc_storeStrong((id *)&self->_nextNode, 0);
  objc_storeStrong((id *)&self->_node, 0);

  objc_storeStrong((id *)&self->_handleLine, 0);
}

@end