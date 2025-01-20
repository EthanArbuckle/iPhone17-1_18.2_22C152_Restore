@interface SXColumnCalculator
- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 scaledConstrainedViewportSize:(CGSize)a4 viewportSize:(CGSize)a5 documentLayout:(id)a6 contentScaleFactor:(double)a7;
- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 documentLayout:(id)a5;
- (id)columnLayoutWithViewportSize:(CGSize)a3 constrainedToWidth:(double)a4 documentLayout:(id)a5 contentScaleFactor:(double)a6;
@end

@implementation SXColumnCalculator

- (id)columnLayoutWithViewportSize:(CGSize)a3 constrainedToWidth:(double)a4 documentLayout:(id)a5 contentScaleFactor:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  double v12 = (double)[v11 width];
  double v13 = (double)[v11 margin];
  uint64_t v14 = [v11 gutter];
  double v15 = (double)(uint64_t)v12;
  double v16 = v15 * a6;
  if (v15 < a4) {
    double v15 = a4;
  }
  if (v16 >= v15) {
    double v17 = v15;
  }
  else {
    double v17 = v16;
  }
  v18 = -[SXDocumentLayout initWithWidth:margin:gutter:columns:]([SXDocumentLayout alloc], "initWithWidth:margin:gutter:columns:", (uint64_t)v17, (uint64_t)((double)(uint64_t)v13 * a6), (uint64_t)((double)(uint64_t)(double)v14 * a6), [v11 columns]);
  uint64_t v19 = (uint64_t)v17 + 2 * (uint64_t)((double)(uint64_t)v13 * a6);
  if ((double)v19 >= a4) {
    double v20 = a4;
  }
  else {
    double v20 = (double)v19;
  }
  if (width >= v20) {
    double v21 = v20;
  }
  else {
    double v21 = width;
  }
  uint64_t v22 = [v11 width];

  double v23 = a6 - (double)(uint64_t)v17 / (double)v22 + 1.0;
  if (v23 <= 1.0) {
    double v24 = 1.0;
  }
  else {
    double v24 = 1.0 / v23;
  }
  CGAffineTransformMakeScale(&v28, v24, v24);
  if (height * v28.c + v28.a * width >= v20) {
    double v25 = v20;
  }
  else {
    double v25 = height * v28.c + v28.a * width;
  }
  v26 = -[SXColumnCalculator columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:](self, "columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:", v18, v21, height, v25, height * v28.d + v28.b * width, width, height, a6);

  return v26;
}

- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 viewportSize:(CGSize)a4 documentLayout:(id)a5
{
  return -[SXColumnCalculator columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:](self, "columnLayoutWithConstrainedViewportSize:scaledConstrainedViewportSize:viewportSize:documentLayout:contentScaleFactor:", a5, a3.width, a3.height, a3.width, a3.height, a4.width, a4.height, 1.0);
}

- (id)columnLayoutWithConstrainedViewportSize:(CGSize)a3 scaledConstrainedViewportSize:(CGSize)a4 viewportSize:(CGSize)a5 documentLayout:(id)a6 contentScaleFactor:(double)a7
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.width;
  double v44 = a3.height;
  double v9 = a3.width;
  id v10 = a6;
  uint64_t v11 = [v10 columns];
  double v12 = (double)[v10 width];
  double v13 = (double)[v10 margin];
  double v14 = (double)[v10 gutter];
  double v15 = v12 + v13 * 2.0;
  if (v9 <= v12) {
    double v16 = v12;
  }
  else {
    double v16 = v9;
  }
  if (v15 >= v16) {
    double v15 = v16;
  }
  float v17 = (v15 - v13 * 2.0 - (v14 * (double)v11 + -1.0)) / (double)v11;
  float v18 = floorf(v17);
  double v19 = v8 / v15 * v13;
  uint64_t v20 = -1;
  do
  {
    unint64_t v21 = v20 + 1;
    float v22 = (v8 - v19 * 2.0 - (double)(v20 + 1) * v14) / (double)(v20 + 2);
    float v23 = floorf(v22);
    if (v23 < v18) {
      break;
    }
    ++v20;
  }
  while (v23 > 0.0);
  if (v21 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v21;
  }
  double v25 = floor(v19);
  double v26 = (double)(v24 - 1);
  float v27 = (v9 - v25 * 2.0 - v26 * v14) / (double)v24;
  double v28 = floorf(v27);
  double v29 = width - (v14 * v26 + (double)v24 * v28 + v25 * 2.0);
  if (width <= v15 && v29 > 0.0)
  {
    float v30 = v29 * 0.5;
    double v31 = floorf(v30);
    double v32 = v25 + v29 - v31;
    double v25 = v25 + v31;
    double v33 = 0.0;
LABEL_18:
    double v36 = 0.0;
    goto LABEL_19;
  }
  double v33 = 0.0;
  if (v29 <= 0.0)
  {
    double v32 = v25;
    goto LABEL_18;
  }
  float v34 = v29 * 0.5;
  double v35 = floorf(v34);
  double v33 = v35 + 0.0;
  double v36 = v29 - v35 + 0.0;
  double v32 = v25;
LABEL_19:
  v37 = -[SXColumnLayout initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:]([SXColumnLayout alloc], "initWithConstrainedViewportSize:viewportSize:layoutWidth:documentLayout:numberOfLayoutColumns:leftMargin:rightMargin:numberOfColumns:columnWidth:leftScreenMargin:rightScreenMargin:contentScaleFactor:", v10, [v10 columns], v24, v9, v44, width, height, (double)objc_msgSend(v10, "width"), v25, v32, v28, *(void *)&v33, *(void *)&v36, *(void *)&a7);
  [(SXColumnLayout *)v37 setMinimumViewportWidthForLooseLayout:440.0];
  if (NFInternalBuild())
  {
    v38 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v38 floatForKey:@"loose_layouting_threshold_override_enabled"];
    float v40 = v39;

    if (v40 != 0.0)
    {
      v41 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v41 floatForKey:@"loose_layouting_threshold_override"];
      [(SXColumnLayout *)v37 setMinimumViewportWidthForLooseLayout:v42];
    }
  }

  return v37;
}

@end