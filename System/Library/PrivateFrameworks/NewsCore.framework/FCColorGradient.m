@interface FCColorGradient
+ (BOOL)supportsSecureCoding;
+ (id)blackGradient;
+ (id)colorGradientWithColors:(id)a3 locations:(id)a4;
+ (id)colorGradientWithConfigDict:(id)a3;
+ (id)whiteGradient;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimilarToColorGradient:(id)a3 withinPercentage:(double)a4;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (FCColorGradient)init;
- (FCColorGradient)initWithCoder:(id)a3;
- (FCColorGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6;
- (NSArray)colors;
- (NSArray)locations;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCColorGradient

+ (id)colorGradientWithConfigDict:(id)a3
{
  v36 = (objc_class *)a1;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 objectForKey:@"startPoint"];
  v6 = v5;
  double v7 = 0.5;
  if (v5)
  {
    v8 = [v5 objectForKeyedSubscript:@"x"];
    [v8 floatValue];
    double v10 = v9;

    v11 = [v6 objectForKeyedSubscript:@"y"];
    [v11 floatValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
    double v10 = 0.5;
  }
  v14 = [v3 objectForKey:@"endPoint"];
  v33 = v14;
  v35 = v6;
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, "objectForKeyedSubscript:", @"x", v14, v6, v36);
    [v16 floatValue];
    double v7 = v17;

    v18 = [v15 objectForKeyedSubscript:@"y"];
    [v18 floatValue];
    double v20 = v19;
  }
  else
  {
    double v20 = 1.0;
  }
  v37 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", @"colorStops", v33);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v26 = [v25 objectForKeyedSubscript:@"color"];
        v27 = +[FCColor colorWithHexString:v26];
        [v39 addObject:v27];

        v28 = [v25 objectForKeyedSubscript:@"location"];
        [v4 addObject:v28];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v22);
  }
  uint64_t v29 = [v39 count];
  if (v29 != [v4 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = (void *)[[NSString alloc] initWithFormat:@"there should be the same number of colors as locations"];
    *(_DWORD *)buf = 136315906;
    v45 = "+[FCColorGradient colorGradientWithConfigDict:]";
    __int16 v46 = 2080;
    v47 = "FCColorGradient.m";
    __int16 v48 = 1024;
    int v49 = 90;
    __int16 v50 = 2114;
    v51 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v30 = objc_msgSend([v36 alloc], "initWithStartPoint:endPoint:colors:locations:", v39, v4, v10, v13, v7, v20);

  return v30;
}

- (FCColorGradient)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 colors:(id)a5 locations:(id)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    double v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "colors");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    __int16 v25 = 2080;
    v26 = "FCColorGradient.m";
    __int16 v27 = 1024;
    int v28 = 21;
    __int16 v29 = 2114;
    v30 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14) {
      goto LABEL_6;
    }
  }
  else if (v14)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "locations");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    __int16 v25 = 2080;
    v26 = "FCColorGradient.m";
    __int16 v27 = 1024;
    int v28 = 22;
    __int16 v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  uint64_t v15 = [v13 count];
  if (v15 != [v14 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    float v19 = (void *)[[NSString alloc] initWithFormat:@"the number of colors and locations should match"];
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCColorGradient initWithStartPoint:endPoint:colors:locations:]";
    __int16 v25 = 2080;
    v26 = "FCColorGradient.m";
    __int16 v27 = 1024;
    int v28 = 23;
    __int16 v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v22.receiver = self;
  v22.super_class = (Class)FCColorGradient;
  v16 = [(FCColorGradient *)&v22 init];
  if (v16)
  {
    if ([v13 count]
      && [v14 count]
      && (uint64_t v17 = [v13 count], v17 == objc_msgSend(v14, "count")))
    {
      v16->_startPoint.CGFloat x = v11;
      v16->_startPoint.CGFloat y = v10;
      v16->_endPoint.CGFloat x = x;
      v16->_endPoint.CGFloat y = y;
      objc_storeStrong((id *)&v16->_colors, a5);
      objc_storeStrong((id *)&v16->_locations, a6);
    }
    else
    {

      v16 = 0;
    }
  }

  return v16;
}

- (FCColorGradient)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCColorGradient init]";
    __int16 v9 = 2080;
    CGFloat v10 = "FCColorGradient.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCColorGradient init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (id)colorGradientWithColors:(id)a3 locations:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    CGFloat v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "colors");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "+[FCColorGradient colorGradientWithColors:locations:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCColorGradient.m";
    __int16 v16 = 1024;
    int v17 = 45;
    __int16 v18 = 2114;
    float v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "locations");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "+[FCColorGradient colorGradientWithColors:locations:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCColorGradient.m";
    __int16 v16 = 1024;
    int v17 = 46;
    __int16 v18 = 2114;
    float v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithStartPoint:endPoint:colors:locations:", v6, v7, 0.5, 0.0, 0.5, 1.0);

  return v8;
}

+ (id)blackGradient
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  id v3 = +[FCColor blackColor];
  v8[0] = v3;
  uint64_t v4 = +[FCColor blackColor];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 colorGradientWithColors:v5 locations:&unk_1EF8D8880];

  return v6;
}

+ (id)whiteGradient
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  id v3 = +[FCColor whiteColor];
  v8[0] = v3;
  uint64_t v4 = +[FCColor whiteColor];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 colorGradientWithColors:v5 locations:&unk_1EF8D8898];

  return v6;
}

- (BOOL)isSimilarToColorGradient:(id)a3 withinPercentage:(double)a4
{
  id v6 = (FCColorGradient *)a3;
  id v7 = v6;
  if (self == v6)
  {
    BOOL v15 = 1;
    goto LABEL_9;
  }
  if (!v6) {
    goto LABEL_7;
  }
  [(FCColorGradient *)self startPoint];
  double v9 = v8;
  double v11 = v10;
  [(FCColorGradient *)v7 startPoint];
  if (v9 != v13 || v11 != v12) {
    goto LABEL_7;
  }
  [(FCColorGradient *)self endPoint];
  double v18 = v17;
  double v20 = v19;
  [(FCColorGradient *)v7 endPoint];
  BOOL v15 = 0;
  if (v18 == v22 && v20 == v21)
  {
    uint64_t v23 = [(FCColorGradient *)self colors];
    uint64_t v24 = [v23 count];
    __int16 v25 = [(FCColorGradient *)v7 colors];
    uint64_t v26 = [v25 count];

    if (v24 != v26) {
      goto LABEL_7;
    }
    __int16 v27 = [(FCColorGradient *)self locations];
    uint64_t v28 = [v27 count];
    __int16 v29 = [(FCColorGradient *)v7 locations];
    uint64_t v30 = [v29 count];

    if (v28 != v30)
    {
LABEL_7:
      BOOL v15 = 0;
      goto LABEL_9;
    }
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 1;
    uint64_t v31 = [(FCColorGradient *)self colors];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke;
    v37[3] = &unk_1E5B4D900;
    v32 = v7;
    v38 = v32;
    id v39 = &v41;
    double v40 = a4;
    [v31 enumerateObjectsUsingBlock:v37];

    if (*((unsigned char *)v42 + 24))
    {
      v33 = [(FCColorGradient *)self locations];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke_2;
      v34[3] = &unk_1E5B4D928;
      v35 = v32;
      v36 = &v41;
      [v33 enumerateObjectsUsingBlock:v34];

      BOOL v15 = *((unsigned char *)v42 + 24) != 0;
    }
    else
    {
      BOOL v15 = 0;
    }

    _Block_object_dispose(&v41, 8);
  }
LABEL_9:

  return v15;
}

void __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  double v9 = [v7 colors];
  id v10 = [v9 objectAtIndex:a3];

  LOBYTE(a3) = [v8 isSimilarToColor:v10 withinPercentage:*(double *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

void __61__FCColorGradient_isSimilarToColorGradient_withinPercentage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  double v9 = [v7 locations];
  id v10 = [v9 objectAtIndex:a3];

  LOBYTE(a3) = [v8 isEqualToNumber:v10];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(FCColorGradient *)self startPoint];
    double v7 = v6;
    [v5 startPoint];
    if (v7 != v8) {
      goto LABEL_9;
    }
    [(FCColorGradient *)self startPoint];
    double v10 = v9;
    [v5 startPoint];
    if (v10 != v11) {
      goto LABEL_9;
    }
    [(FCColorGradient *)self endPoint];
    double v13 = v12;
    [v5 endPoint];
    if (v13 == v14
      && (-[FCColorGradient endPoint](self, "endPoint"), double v16 = v15, [v5 endPoint], v16 == v17))
    {
      double v18 = [(FCColorGradient *)self colors];
      double v19 = [v5 colors];
      if ([v18 isEqualToArray:v19])
      {
        double v20 = [(FCColorGradient *)self locations];
        double v21 = [v5 locations];
        char v22 = [v20 isEqualToArray:v21];
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
LABEL_9:
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  id v3 = NSNumber;
  [(FCColorGradient *)self startPoint];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v5 = [v4 hash];
  double v6 = NSNumber;
  [(FCColorGradient *)self startPoint];
  double v8 = [v6 numberWithDouble:v7];
  uint64_t v9 = [v8 hash] ^ v5;
  double v10 = NSNumber;
  [(FCColorGradient *)self endPoint];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  uint64_t v12 = [v11 hash];
  double v13 = NSNumber;
  [(FCColorGradient *)self endPoint];
  double v15 = [v13 numberWithDouble:v14];
  uint64_t v16 = v9 ^ v12 ^ [v15 hash];
  double v17 = [(FCColorGradient *)self colors];
  uint64_t v18 = [v17 hash];
  double v19 = [(FCColorGradient *)self locations];
  unint64_t v20 = v16 ^ v18 ^ [v19 hash];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  [(FCColorGradient *)self startPoint];
  double v6 = objc_msgSend(v4, "nf_valueWithCGPoint:");
  [v5 encodeObject:v6 forKey:@"startPoint"];

  double v7 = (void *)MEMORY[0x1E4F29238];
  [(FCColorGradient *)self endPoint];
  double v8 = objc_msgSend(v7, "nf_valueWithCGPoint:");
  [v5 encodeObject:v8 forKey:@"endPoint"];

  uint64_t v9 = [(FCColorGradient *)self colors];
  [v5 encodeObject:v9 forKey:@"colors"];

  id v10 = [(FCColorGradient *)self locations];
  [v5 encodeObject:v10 forKey:@"locations"];
}

- (FCColorGradient)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startPoint"];
  objc_msgSend(v5, "nf_CGPointValue");
  double v7 = v6;
  double v9 = v8;

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endPoint"];
  objc_msgSend(v10, "nf_CGPointValue");
  double v12 = v11;
  double v14 = v13;

  double v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  double v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"colors"];
  double v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  double v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  char v22 = [v4 decodeObjectOfClasses:v21 forKey:@"locations"];

  uint64_t v23 = -[FCColorGradient initWithStartPoint:endPoint:colors:locations:](self, "initWithStartPoint:endPoint:colors:locations:", v18, v22, v7, v9, v12, v14);
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)startPoint
{
  double x = self->_startPoint.x;
  double y = self->_startPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x = self->_endPoint.x;
  double y = self->_endPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end