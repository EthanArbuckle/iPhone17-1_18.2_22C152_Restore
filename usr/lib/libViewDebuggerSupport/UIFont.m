@interface UIFont
- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4;
@end

@implementation UIFont

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
  id v29 = v11;

  v34[0] = @"propertyFormat";
  v34[1] = @"propertyRuntimeType";
  v35[0] = @"font";
  v35[1] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  *a3 = v13;
  id v31 = v13;
  v32[0] = @"familyName";
  uint64_t v14 = [(UIFont *)self familyName];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = &stru_3C770;
  }
  v33[0] = v16;
  v32[1] = @"fontName";
  uint64_t v17 = [(UIFont *)self fontName];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_3C770;
  }
  v33[1] = v19;
  v32[2] = @"pointSize";
  [(UIFont *)self pointSize];
  v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[2] = v20;
  v32[3] = @"ascender";
  [(UIFont *)self ascender];
  v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[3] = v21;
  v32[4] = @"descender";
  [(UIFont *)self descender];
  v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[4] = v22;
  v32[5] = @"capHeight";
  [(UIFont *)self capHeight];
  v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[5] = v23;
  v32[6] = @"xHeight";
  [(UIFont *)self xHeight];
  v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[6] = v24;
  v32[7] = @"lineHeight";
  [(UIFont *)self lineHeight];
  v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[7] = v25;
  v32[8] = @"leading";
  [(UIFont *)self leading];
  v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v33[8] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:9];

  return v27;
}

@end