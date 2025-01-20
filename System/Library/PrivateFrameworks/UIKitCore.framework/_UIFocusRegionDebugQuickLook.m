@interface _UIFocusRegionDebugQuickLook
+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5;
@end

@implementation _UIFocusRegionDebugQuickLook

+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5
{
  id v35 = a3;
  id v7 = a4;
  v8 = [v35 _debugDrawingConfigurationWithDebugInfo:v7];
  if (v8)
  {
    v9 = [v7 snapshot];
    [v9 snapshotFrameForRegion:v35];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = [v8 color];
    v19 = (CGPattern *)[v8 pattern];
    double v20 = 0.5;
    if (!v19) {
      objc_msgSend(v8, "patternAlpha", 0.5);
    }
    id v21 = [v18 colorWithAlphaComponent:v20];
    CGContextSetFillColorWithColor(a5, (CGColorRef)[v21 CGColor]);

    v37.origin.x = v11;
    v37.origin.y = v13;
    v37.size.width = v15;
    v37.size.height = v17;
    CGContextFillRect(a5, v37);
    if (v19)
    {
      v22 = _UIFocusDebugImagePatternCreateWithType(v19, a5);
      v23 = _UIFocusDebugImagePatternCreateWithType(v22, a5);
      [v8 patternAlpha];
      objc_msgSend(v18, "colorWithAlphaComponent:");
      id v24 = objc_claimAutoreleasedReturnValue();
      Components = CGColorGetComponents((CGColorRef)[v24 CGColor]);
      CGContextSetFillPattern(a5, v23, Components);

      v38.origin.x = v11;
      v38.origin.y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      CGContextFillRect(a5, v38);
      CGPatternRelease(v23);
    }
    if ([v8 dashedStroke])
    {
      v26 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, 12.0);
      [v26 setLineDash:&drawDebugQuickLookImageForRegion_withInfo_inContext__dashedLineLength count:1 phase:0.0];
      [v26 setLineWidth:4.0];
      id v27 = [v18 colorWithAlphaComponent:0.5];
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)[v27 CGColor]);

      [v26 stroke];
    }
    else
    {
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)[v18 CGColor]);
      v39.origin.x = v11;
      v39.origin.y = v13;
      v39.size.width = v15;
      v39.size.height = v17;
      CGContextStrokeRect(a5, v39);
    }
    v28 = [v7 focusMapSearchInfo];
    v29 = [v28 destinationRegions];
    int v30 = [v29 containsObject:v35];

    if (v30)
    {
      CGContextSaveGState(a5);
      v40.origin.x = v11;
      v40.origin.y = v13;
      v40.size.width = v15;
      v40.size.height = v17;
      CGRect v41 = CGRectInset(v40, -6.0, -6.0);
      v31 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height, 12.0);
      [v31 setLineWidth:3.0];
      v32 = +[UIColor redColor];
      v33 = [v32 colorWithAlphaComponent:0.5];
      id v34 = [v33 colorWithAlphaComponent:0.5];
      CGContextSetStrokeColorWithColor(a5, (CGColorRef)[v34 CGColor]);

      [v31 stroke];
      CGContextRestoreGState(a5);
    }
  }
}

@end