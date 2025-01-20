@interface PFXBorderStyle
+ (double)mapStrokeWidth:(id)a3 withCandidatePropertiesName:(void *)a4 stackEntry:(id)a5;
+ (id)mapStroke:(id)a3 paragraphBorderType:(int64_t *)a4 stackEntry:(id)a5;
+ (id)mapStrokeColor:(id)a3 withCandidatePropertiesName:(void *)a4;
+ (id)mapStrokePattern:(id)a3 withCandidatePropertiesName:(void *)a4;
+ (void)initialize;
@end

@implementation PFXBorderStyle

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = "border-left-width";
    sub_1F58D0(qword_573490, &v2);
    v2 = "border-left";
    sub_1F58D0(qword_573490, &v2);
    v2 = "border-width";
    sub_1F58D0(qword_573490, &v2);
    v2 = "border";
    sub_1F58D0(qword_573490, &v2);
    v2 = "border-right-width";
    sub_1F58D0(qword_5734C0, &v2);
    v2 = "border-right";
    sub_1F58D0(qword_5734C0, &v2);
    v2 = "border-width";
    sub_1F58D0(qword_5734C0, &v2);
    v2 = "border";
    sub_1F58D0(qword_5734C0, &v2);
    v2 = "border-top-width";
    sub_1F58D0(qword_5734F0, &v2);
    v2 = "border-top";
    sub_1F58D0(qword_5734F0, &v2);
    v2 = "border-width";
    sub_1F58D0(qword_5734F0, &v2);
    v2 = "border";
    sub_1F58D0(qword_5734F0, &v2);
    v2 = "border-bottom-width";
    sub_1F58D0(qword_573520, &v2);
    v2 = "border-bottom";
    sub_1F58D0(qword_573520, &v2);
    v2 = "border-width";
    sub_1F58D0(qword_573520, &v2);
    v2 = "border";
    sub_1F58D0(qword_573520, &v2);
    v2 = "border-left-style";
    sub_1F58D0(qword_573550, &v2);
    v2 = "border-left";
    sub_1F58D0(qword_573550, &v2);
    sub_1F58D0(qword_573550, PFXPropNmBorderStyle);
    sub_1F58D0(qword_573550, PFXPropNmBorder);
    v2 = "border-right-style";
    sub_1F58D0(qword_573580, &v2);
    v2 = "border-right";
    sub_1F58D0(qword_573580, &v2);
    sub_1F58D0(qword_573580, PFXPropNmBorderStyle);
    sub_1F58D0(qword_573580, PFXPropNmBorder);
    v2 = "border-top-style";
    sub_1F58D0(qword_5735B0, &v2);
    v2 = "border-top";
    sub_1F58D0(qword_5735B0, &v2);
    sub_1F58D0(qword_5735B0, PFXPropNmBorderStyle);
    sub_1F58D0(qword_5735B0, PFXPropNmBorder);
    v2 = "border-bottom-style";
    sub_1F58D0(qword_5735E0, &v2);
    v2 = "border-bottom";
    sub_1F58D0(qword_5735E0, &v2);
    sub_1F58D0(qword_5735E0, PFXPropNmBorderStyle);
    sub_1F58D0(qword_5735E0, PFXPropNmBorder);
    v2 = "border-left-color";
    sub_1F58D0(qword_573610, &v2);
    v2 = "border-left";
    sub_1F58D0(qword_573610, &v2);
    sub_1F58D0(qword_573610, PFXPropNmBorderColor);
    sub_1F58D0(qword_573610, PFXPropNmBorder);
    v2 = "border-right-color";
    sub_1F58D0(qword_573640, &v2);
    v2 = "border-right";
    sub_1F58D0(qword_573640, &v2);
    sub_1F58D0(qword_573640, PFXPropNmBorderColor);
    sub_1F58D0(qword_573640, PFXPropNmBorder);
    v2 = "border-top-color";
    sub_1F58D0(qword_573670, &v2);
    v2 = "border-top";
    sub_1F58D0(qword_573670, &v2);
    sub_1F58D0(qword_573670, PFXPropNmBorderColor);
    sub_1F58D0(qword_573670, PFXPropNmBorder);
    v2 = "border-bottom-color";
    sub_1F58D0(qword_5736A0, &v2);
    v2 = "border-bottom";
    sub_1F58D0(qword_5736A0, &v2);
    sub_1F58D0(qword_5736A0, PFXPropNmBorderColor);
    sub_1F58D0(qword_5736A0, PFXPropNmBorder);
  }
}

+ (double)mapStrokeWidth:(id)a3 withCandidatePropertiesName:(void *)a4 stackEntry:(id)a5
{
  id v6 = [a3 firstValueFromCandidatePropertyNames:a4 selectedIndex:0];
  double v7 = 0.0;
  if (v6)
  {
    v8 = v6;
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    double v10 = v9;
    if ([v8 count])
    {
      uint64_t v11 = 0;
      while (1)
      {
        +[PFSUtilities htmlValueToBorderWidth:parentFontSize:](PFSUtilities, "htmlValueToBorderWidth:parentFontSize:", [v8 objectAtIndex:v11], v10);
        if (v12 != -65536.0) {
          break;
        }
        if (++v11 >= (unint64_t)[v8 count]) {
          return v7;
        }
      }
      return v12;
    }
  }
  return v7;
}

+ (id)mapStrokePattern:(id)a3 withCandidatePropertiesName:(void *)a4
{
  id result = [a3 firstValueFromCandidatePropertyNames:a4 selectedIndex:0];
  if (result)
  {
    id v5 = result;
    id result = [result count];
    if (result)
    {
      uint64_t v6 = 0;
      CFStringRef v8 = @"none";
      while (1)
      {
        id v7 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v6, v8), "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        if (([v7 isEqualToString:@"solid"] & 1) != 0
          || ([v7 isEqualToString:@"double"] & 1) != 0
          || ([v7 isEqualToString:@"groove"] & 1) != 0
          || ([v7 isEqualToString:@"inset"] & 1) != 0
          || ([v7 isEqualToString:@"outset"] & 1) != 0
          || [v7 isEqualToString:@"ridge"])
        {
          id result = +[TSDStrokePattern solidPattern];
          goto LABEL_11;
        }
        if ([v7 isEqualToString:@"dotted"])
        {
          id result = +[TSDStrokePattern roundDashPattern];
          goto LABEL_11;
        }
        if ([v7 isEqualToString:@"dashed"]) {
          break;
        }
        if ([v7 isEqualToString:v8])
        {
          id result = +[TSDStrokePattern emptyPattern];
LABEL_11:
          if (result) {
            return result;
          }
        }
        if (++v6 >= (unint64_t)[v5 count]) {
          return 0;
        }
      }
      id result = +[TSDStrokePattern shortDashPattern];
      goto LABEL_11;
    }
  }
  return result;
}

+ (id)mapStrokeColor:(id)a3 withCandidatePropertiesName:(void *)a4
{
  id result = [a3 firstValueFromCandidatePropertyNames:a4 selectedIndex:0];
  if (result)
  {
    return +[PFXStyleUtilities colorInArray:result];
  }
  return result;
}

+ (id)mapStroke:(id)a3 paragraphBorderType:(int64_t *)a4 stackEntry:(id)a5
{
  if (!a4) {
    return 0;
  }
  *a4 = 0;
  [a1 mapStrokeWidth:a3 withCandidatePropertiesName:qword_5734F0 stackEntry:];
  double v10 = v9;
  [a1 mapStrokeWidth:a3 withCandidatePropertiesName:qword_573520 stackEntry:a5];
  double v12 = v11;
  if (v11 == 0.0 && v10 == 0.0) {
    return 0;
  }
  [a1 mapStrokeWidth:a3 withCandidatePropertiesName:qword_573490 stackEntry:a5];
  double v15 = v14;
  [a1 mapStrokeWidth:a3 withCandidatePropertiesName:qword_5734C0 stackEntry:a5];
  BOOL v17 = v16 > 0.0;
  uint64_t v18 = 3;
  if (v12 == 0.0)
  {
    uint64_t v18 = 1;
    double v19 = v10;
  }
  else
  {
    double v19 = v12;
  }
  if (v10 == 0.0) {
    uint64_t v18 = 2;
  }
  v20 = qword_5736A0;
  if (v10 == 0.0) {
    double v19 = v12;
  }
  else {
    v20 = qword_573670;
  }
  int64_t v21 = 4;
  if (v15 > 0.0 && v17)
  {
    v22 = qword_573670;
  }
  else
  {
    int64_t v21 = v18;
    v22 = v20;
  }
  if (v15 > 0.0 && v17) {
    double v23 = v15;
  }
  else {
    double v23 = v19;
  }
  *a4 = v21;
  id v24 = [a1 mapStrokeColor:a3 withCandidatePropertiesName:v22 v19];
  if (!v24) {
    id v24 = +[TSUColor blackColor];
  }
  if (*a4 == 2) {
    v25 = qword_5735E0;
  }
  else {
    v25 = qword_5735B0;
  }
  id v26 = [a1 mapStrokePattern:a3 withCandidatePropertiesName:v25];
  if (!v26) {
    id v26 = +[TSDStrokePattern emptyPattern];
  }

  return +[TSDStroke strokeWithColor:v24 width:0 cap:0 join:v26 pattern:v23];
}

@end