@interface UIImage
- (id)_imageResizedForDisplayInInspector;
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIImage

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  v6 = (objc_class *)objc_opt_class();
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v9 = 0;
    goto LABEL_4;
  }
  v8 = NSStringFromClass(v7);
  v9 = v8;
  if (!v8)
  {
LABEL_4:
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  id v11 = v8;
LABEL_7:
  id v12 = v11;

  v56[0] = @"propertyFormat";
  v56[1] = @"propertyRuntimeType";
  v57[0] = @"image";
  v57[1] = v12;
  v53 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
  *a3 = v13;
  uint64_t v14 = _UIImageIsFromMainBundle();
  uint64_t IsUIKitImage = _UIImageIsUIKitImage();
  uint64_t IsSystemSymbol = _UIImageIsSystemSymbol();
  v54[0] = @"isFromMainBundle";
  v17 = +[NSNumber numberWithBool:v14];
  v55[0] = v17;
  v54[1] = @"isUIKitImage";
  v18 = +[NSNumber numberWithBool:IsUIKitImage];
  v55[1] = v18;
  v54[2] = @"isSystemSymbol";
  v19 = +[NSNumber numberWithBool:IsSystemSymbol];
  v55[2] = v19;
  v54[3] = @"width";
  [(UIImage *)self size];
  v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v55[3] = v20;
  v54[4] = @"height";
  [(UIImage *)self size];
  v22 = +[NSNumber numberWithDouble:v21];
  v55[4] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
  id v24 = [v23 mutableCopy];

  v25 = _UIImageIdentityName();
  if (v25) {
    [v24 setObject:v25 forKeyedSubscript:@"imageName"];
  }
  v26 = _UIImageIdentityBundleIdentifier();
  if (v26) {
    [v24 setObject:v26 forKeyedSubscript:@"bundleIdentifier"];
  }
  v27 = [(UIImage *)self symbolConfiguration];

  if (v27)
  {
    v28 = [(UIImage *)self symbolConfiguration];
    v29 = _UIImageSymbolConfigurationTextualSummary();

    if (v29) {
      [v24 setObject:v29 forKeyedSubscript:@"symbolConfigurationSummary"];
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [(UIImage *)self hasBaseline])
  {
    [(UIImage *)self baselineOffsetFromBottom];
    v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v24 setObject:v30 forKeyedSubscript:@"baselineOffsetFromBottom"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [(UIImage *)self hasMidline])
  {
    [(UIImage *)self midlineOffsetFromCenter];
    v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v24 setObject:v31 forKeyedSubscript:@"midlineOffsetFromCenter"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [(UIImage *)self hasContentInsets])
  {
    [(UIImage *)self contentInsets];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v58[0] = v38;
    v39 = +[NSNumber numberWithDouble:v33];
    v58[1] = v39;
    v40 = +[NSNumber numberWithDouble:v35];
    v58[2] = v40;
    v41 = +[NSNumber numberWithDouble:v37];
    v58[3] = v41;
    v42 = +[NSArray arrayWithObjects:v58 count:4];

    [v24 setObject:v42 forKeyedSubscript:@"contentInsets"];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [(UIImage *)self _CGPDFPage])
  {
    v43 = @"PDF";
LABEL_30:
    [v24 setObject:v43 forKeyedSubscript:@"vectorImageType"];
    goto LABEL_31;
  }
  if (objc_opt_respondsToSelector())
  {
    v44 = [(UIImage *)self _CGSVGDocument];

    if (v44)
    {
      v43 = @"SVG";
      goto LABEL_30;
    }
  }
LABEL_31:
  v45 = [(UIImage *)self _imageResizedForDisplayInInspector];
  v46 = UIImagePNGRepresentation(v45);

  unint64_t v47 = v46;
  unint64_t v48 = (unint64_t)v24;
  if (v48 | v47)
  {
    Mutable = CFDictionaryCreateMutable(0, 2, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v50 = Mutable;
    v51 = v53;
    if (v47) {
      CFDictionaryAddValue(Mutable, @"imageData", (const void *)v47);
    }
    if (v48) {
      CFDictionaryAddValue(v50, @"metadata", (const void *)v48);
    }
  }
  else
  {
    v50 = 0;
    v51 = v53;
  }

  return v50;
}

- (id)_imageResizedForDisplayInInspector
{
  if (_UIImageIsSystemSymbol() && ([(UIImage *)self size], v3 >= 2.22044605e-16))
  {
    [(UIImage *)self size];
    double v6 = v5 * 84.0;
    [(UIImage *)self size];
    CGFloat v8 = v6 / v7;
    v11.width = v8;
    v11.height = 84.0;
    UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
    -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v8, 84.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v4 = self;
  }

  return v4;
}

@end